class Task {
  String _taskname;
  bool _done = false;

  Task(this._taskname);

  gettaskname() => this._taskname;
  settaskname(taskname) => this._taskname = taskname;

  isdone() => this._done;
  setdone(done) => this._done = done;
}
