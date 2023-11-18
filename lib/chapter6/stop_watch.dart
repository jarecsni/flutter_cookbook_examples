import 'package:flutter/material.dart';
import 'dart:async';

class StopWatch extends StatefulWidget {
  final String name;
  final String email;

  const StopWatch({super.key, required this.name, required this.email});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  int milliseconds = 0;
  bool isTicking = false;
  final laps = <int>[];
  late Timer timer;
  final itemHeight = 60.0;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _onTick(Timer time) {
    if (mounted) {
      setState(() {
        milliseconds += 100;
      });
    }
  }

  String _secondsText(int milliseconds) => '${milliseconds / 1000} seconds';

  void _startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 100), _onTick);
    setState(() {
      milliseconds = 0;
      isTicking = true;
      laps.clear();
    });
  }

  void _stopTimer(BuildContext context) {
    timer.cancel();
    // // Show a popup
    // final totalRuntime = laps.fold(milliseconds, (total, lap) => total + lap);
    // final alert = PlatformAlert(
    //   title: 'Run Completed',
    //   message: 'Total run time is ${_secondsText(totalRuntime)}',
    // );
    // alert.show(context);
    setState(() {
      isTicking = false;
    });
    final controller = showBottomSheet(
      context: context,
      builder: _buildRunCompleteSheet,
    );
    Future.delayed(const Duration(seconds: 5)).then((_) {
      controller.close();
    });
  }

  Widget _buildRunCompleteSheet(BuildContext context) {
    final totalRuntime = laps.fold(milliseconds, (total, lap) => total + lap);
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Container(
          color: Theme.of(context).cardColor,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Run Finished', style: textTheme.headlineSmall),
                Text('Total Run Time is ${_secondsText(totalRuntime)}'),
              ],
            ),
          )),
    );
  }

  void _lap() {
    setState(() {
      laps.add(milliseconds);
      milliseconds = 0;
    });

    // TODO there's a subtle issue here, that just before we start
    // scrolling the last non scrolling item has less margin underneath it :)
    // don't want to spend more time on this right now, its a good approximation
    // but maybe something that is worth exploring further another time.
    if (_scrollController.position.maxScrollExtent > 0) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + itemHeight,
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 500),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Column(
        children: [
          Expanded(child: _buildCounter(context)),
          Expanded(
            child: Scrollbar(
                controller: _scrollController, child: _buildLapDisplay(this)),
          ),
        ],
      ),
    );
  }

  Widget _buildCounter(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Lap ${laps.length + 1}',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.white),
          ),
          Text(
            _secondsText(milliseconds),
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.white),
          ),
          const SizedBox(height: 20),
          _buildControls(context, this),
        ],
      ),
    );
  }
}

Widget _buildControls(BuildContext context, _StopWatchState state) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
        // style: ButtonStyle(
        //   backgroundColor:
        //       MaterialStateProperty.all<Color>(Colors.green),
        //   foregroundColor:
        //       MaterialStateProperty.all<Color>(Colors.white),
        // ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            textStyle:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: state.isTicking ? null : state._startTimer,
        child: const Text('Start'),
      ),
      const SizedBox(width: 20),
      ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.yellow)),
        onPressed: state.isTicking ? state._lap : null,
        child: const Text('Lap'),
      ),
      const SizedBox(width: 20),
      Builder(
        builder: (context) => TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: state.isTicking ? () => state._stopTimer(context) : null,
          child: const Text('Stop'),
        ),
      ),
      const SizedBox(width: 20),
    ],
  );
}

Widget _buildLapDisplay(_StopWatchState state) {
  return ListView.builder(
    itemCount: state.laps.length,
    itemExtent: state.itemHeight,
    itemBuilder: (context, index) {
      final milliseconds = state.laps[index];
      return ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 50),
        title: Text('Lap ${index + 1}'),
        trailing: Text(state._secondsText(milliseconds)),
      );
    },
    controller: state._scrollController,
  );
}
