import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tapxercise/bloc/leaderboard_bloc.dart';
import 'package:tapxercise/components/general.dart';
import 'package:tapxercise/models/leaderboard_model.dart';

class SoloLeaderboardScreen extends StatefulWidget {
  const SoloLeaderboardScreen({Key key}) : super(key: key);

  @override
  State<SoloLeaderboardScreen> createState() => _SoloLeaderboardScreenState();
}

class _SoloLeaderboardScreenState extends State<SoloLeaderboardScreen> {
  bool sort;
  int colIndex = 0;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    BlocProvider.of<LeaderboardBloc>(context).add(LeaderboardLoadEvent());
    super.initState();
    sort = false;
  }

  void onSortColum(
      int columnIndex, bool ascending, List<Leaderboard> leaderboardList) {
    if (columnIndex == 0) {
      if (ascending) {
        leaderboardList.sort((a, b) =>
            a.userName.toLowerCase().compareTo(b.userName.toLowerCase()));
      } else {
        leaderboardList.sort((a, b) =>
            b.userName.toLowerCase().compareTo(a.userName.toLowerCase()));
      }
    } else if (columnIndex == 1) {
      if (ascending) {
        leaderboardList.sort((a, b) => a.score.compareTo(b.score));
      } else {
        leaderboardList.sort((a, b) => b.score.compareTo(a.score));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        title: Text('Leaderboard'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: BlocBuilder<LeaderboardBloc, LeaderboardState>(
          buildWhen: (previous, current) => current is LeaderboardLoaded,
          builder: (context, state) {
            if (state is LeaderboardLoading || state is LeaderboardInitial) {
              return loading();
            } else if (state is LeaderboardLoaded) {
              List<Leaderboard> leaderboardList = state.props.single;
              return Container(
                child: SmartRefresher(
                  enablePullDown: true,
                  header: ClassicHeader(),
                  controller: _refreshController,
                  onRefresh: () async {
                    final bloc = BlocProvider.of<LeaderboardBloc>(context)
                      ..add(LeaderboardRefreshEvent());

                    await bloc.stream.lastWhere((event) {
                      if (event is! LeaderboardRefreshEvent) {
                        final temp = event.toString().substring(0, 17);
                        if (temp == 'LeaderboardLoaded') {
                          _refreshController.refreshCompleted();
                          return true;
                        }
                        return false;
                      }
                      _refreshController.refreshFailed();
                      return false;
                    });
                  },
                  onLoading: () async {
                    _refreshController.loadComplete();
                  },
                  child: ListView(
                    children: <Widget>[
                      DataTable(
                        sortAscending: sort,
                        sortColumnIndex: colIndex,
                        columns: [
                          DataColumn(
                              label: Text("Nickname"),
                              onSort: (columnIndex, ascending) {
                                setState(() {
                                  sort = !sort;
                                  colIndex = columnIndex;
                                });
                                onSortColum(
                                    columnIndex, ascending, leaderboardList);
                              }),
                          DataColumn(
                              label: Text("Score"),
                              onSort: (columnIndex, ascending) {
                                setState(() {
                                  sort = !sort;
                                  colIndex = columnIndex;
                                });
                                onSortColum(
                                    columnIndex, ascending, leaderboardList);
                              }),
                        ],
                        rows: leaderboardList
                            .map(
                              (x) => DataRow(cells: [
                                DataCell(
                                  Text(x.userName),
                                ),
                                DataCell(
                                  Text(x.score.toString()),
                                ),
                              ]),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              );
            }
            return error();
          },
        ),
      ),
    );
  }
}
