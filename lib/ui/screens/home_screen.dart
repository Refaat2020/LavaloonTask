import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lavaloon/cubits/client_cubit.dart';
import 'package:lavaloon/cubits/projects_cubit.dart';
import 'package:lavaloon/cubits/time_cubit.dart';
import 'package:lavaloon/ui/screens/time_detials_screen.dart';
import 'package:lavaloon/ui/widgets/loading_widget.dart';
import 'package:lavaloon/ui/widgets/time_card_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<TimeCubit>().getTime(context);
  }

  @override
  Widget build(BuildContext context) {
    final projects = context.watch<ProjectsCubit>().projects;
    final clients = context.watch<ClientCubit>().clientList;
    final time = context.watch<TimeCubit>().timeEntries;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white60,
        title: FlatButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.power_settings_new,
              color: Colors.red,
            ),
            label: Text("Toggl")),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 190, bottom: 50, top: 20),
                child: Text("WORKING ON THESE?"),
              ),
              BlocConsumer<ClientCubit, ClientState>(
                listener: (context, state) {
                  if (state is ClientError) {
                    Fluttertoast.showToast(
                      msg:"error",
                      textColor: Colors.black,
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.SNACKBAR,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is ClientLoading) {
                    return LoadingWidget();
                  } else if (state is ClientFetched || state is ProjectsFetched) {
                    if (clients.isNotEmpty) {
                      return Container(
                        width: 350,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            height: 10,
                          ),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            String timeId = time[index].id.toString();
                            String projectId = projects[index].id.toString();
                            String clientId = clients[index].id.toString();

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TimeDetailsScreen(
                                        clintId: clientId,
                                        projectId: projectId,
                                        timeId: timeId,
                                      ),
                                    ));
                              },
                              child: ProjectInfo(
                                hashtag: time[index].description,
                                clientName: clients[index].name,
                                projectName: projects[index].name,
                                textColor: Colors.blue,
                              ),
                            );
                          },
                          itemCount: time.length,
                        ),
                      );
                    }

                  }
                  return Container();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
