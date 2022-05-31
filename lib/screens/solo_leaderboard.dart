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

  void _onRefresh() async {
    BlocProvider.of<LeaderboardBloc>(context);
    LeaderboardEvent event;
    if (event is GetLeaderboard) {
      event.loading = true;
      print(event.loading);
    }

    print('tes');
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    BlocProvider.of<LeaderboardBloc>(context);
    LeaderboardEvent event;
    if (event is GetLeaderboard) {
      event.loading = false;
    }
    // if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  void initState() {
    BlocProvider.of<LeaderboardBloc>(context).add(GetLeaderboard());
    super.initState();
    sort = false;
  }

  void onSortColum(
      int columnIndex, bool ascending, List<Leaderboard> leaderboardList) {
    if (columnIndex == 0) {
      if (ascending) {
        leaderboardList.sort((a, b) => a.userName.compareTo(b.userName));
      } else {
        leaderboardList.sort((a, b) => b.userName.compareTo(a.userName));
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
      body: Container(
        color: Colors.amber,
        padding: EdgeInsets.all(10.0),
        child: BlocBuilder<LeaderboardBloc, LeaderboardState>(
          builder: (context, state) {
            if (state is LeaderboardLoading || state is LeaderboardInitial) {
              return loading();
            } else if (state is LeaderboardLoaded) {
              List<Leaderboard> leaderboardList = state.props.single;
              return Container(
                color: Colors.blue,
                child: SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: true,
                  header: ClassicHeader(),
                  footer: ClassicFooter(
                    loadStyle: LoadStyle.ShowWhenLoading,
                    completeDuration: Duration(milliseconds: 500),
                  ),
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                  onLoading: _onLoading,
                  child: ListView(
                    children: <Widget>[
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          sortAscending: sort,
                          sortColumnIndex: colIndex,
                          columns: [
                            DataColumn(
                                label: Text("User Name"),
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
