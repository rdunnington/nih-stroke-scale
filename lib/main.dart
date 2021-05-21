import 'package:flutter/material.dart';
import 'dart:core';

void main() {
	runApp(StrokeScoreApp());
}

class StrokeChoice
{
	int score;
	String description;

	StrokeChoice(this.score, this.description);
}

class StrokeChoices
{
	String title;
	List<StrokeChoice> choices;

	StrokeChoices(this.title, this.choices);
}

// TODO move this to a file or something
class ScoreData
{
	static final List<StrokeChoices> data = [
		StrokeChoices('Level of Conciousness', [
			StrokeChoice(0, 'Alert; keenly responsive'),
			StrokeChoice(1, 'Arouses to minor stimulation'),
			StrokeChoice(2, 'Requires repeated stimulation to arouse'),
			StrokeChoice(2, 'Movements to pain'),
			StrokeChoice(2, 'Postures or unresponsive'),
		]),
		StrokeChoices('Ask Name and Age', [
			StrokeChoice(0, 'Both questions right'),
			StrokeChoice(1, '1 question right'),
			StrokeChoice(2, '0 questions right'),
			StrokeChoice(1, 'Dysarthric/intubated/trauma/language barrier'),
			StrokeChoice(2, 'Aphasiac'),
		]),
	];
}

class StrokeScoreApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'NIH Stroke Score',
			//theme: ThemeData(
			//	colorTheme: ColorTheme.fromSwatch(
			//		primarySwatch: Colors.blue,
			//	),
			//	//textTheme: const TextTheme(
			//),
			home: HomePage(),
		);
	}
}

class HomePage extends StatefulWidget {
	HomePage({Key key}) : super(key: key);

	@override
	_MyHomePageState createState() => _MyHomePageState();
}

class ChoiceButton extends StatelessWidget {
	String _text;
	int _score;
	int _index;
	Function(int) _onPressedFunc;

	ChoiceButton({String text, int score, int index, Function(int) onPressedFunc}) {
		_text = text;
		_score = score;
		_index = index;
		_onPressedFunc = onPressedFunc;
	}

	@override Widget build(BuildContext context) {
		Color c = (_index % 2 == 0) ? Colors.white : Color(0xFFDDDDDD);
		return GestureDetector(
			onTap: () {
				_onPressedFunc(_score);
			},
			child: Container(
				constraints: BoxConstraints.expand(
					height: DefaultTextStyle.of(context).style.fontSize * 3,
				),
				color: c,
				alignment: Alignment.centerLeft,
				padding: const EdgeInsets.all(8),
				child: Text(_text),
			),
		);
	}
}

class ChoicePage extends StatelessWidget {
	int _choiceIndex;
	List<int> _scores;

	ChoicePage(this._choiceIndex, this._scores);

	@override Widget build(BuildContext context) {
		var OnPressed = (int score) {
			_scores.add(score);

			int nextChoice = this._choiceIndex + 1;
			if (nextChoice < ScoreData.data.length) {
				Navigator.push(
					context,
					MaterialPageRoute(builder: (context) => ChoicePage(nextChoice, _scores))
				);
			} else {
				Navigator.push(
					context,
					MaterialPageRoute(builder: (context) => FinalScorePage(_scores))
				);
				// TODO go to the sum score page
				//Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
				//_scores.clear(); // TODO delete this

			}
		};

		var widgets = List<Widget>.empty(growable:true);
		var choices = ScoreData.data[this._choiceIndex];
		for (int i = 0; i < choices.choices.length; ++i)
		{
			var choice = choices.choices[i];
			widgets.add(ChoiceButton(text: choice.description, score: choice.score, index: i, onPressedFunc: OnPressed));
		}

		return WillPopScope(
			onWillPop: () async {
				if (_scores.length > 0) {
					_scores.removeLast();
				}
				return true;
			},
			child: Scaffold(
				appBar: AppBar(
					title: Text(choices.title),
					actions: <Widget>[
						IconButton(
							icon: const Icon(Icons.refresh),
							tooltip: 'Restart',
							onPressed: () {
								_scores.clear();
								Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
							},
						),
					],
				),
				body: ListView(
					children: widgets,
				),
			),
		);
	}
}

class FinalScorePage extends StatelessWidget
{
	List<int> _scores;

	FinalScorePage(this._scores);

	@override Widget build(BuildContext context) {
		int score = _scores.reduce((value, item) => value + item);

		return WillPopScope(
			onWillPop: () async {
				if (_scores.length > 0) {
					_scores.removeLast();
				}
				return true;
			},
			child: Scaffold(
				appBar: AppBar(
					title: Text('Final Score'),
					actions: <Widget>[
						IconButton(
							icon: const Icon(Icons.refresh),
							tooltip: 'Restart',
							onPressed: () {
								_scores.clear();
								Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
							},
						),
					],
				),
				body: Center(
					child: Text('Score: $score')
				),
			),
		);
	}
}

class _MyHomePageState extends State<HomePage> {
	var _counter = 0;
	var _scores = List<int>.empty(growable:true);

	//void _incrementCounter() {
	//	setState(() {
	//		// This call to setState tells the Flutter framework that something has
	//		// changed in this State, which causes it to rerun the build method below
	//		// so that the display can reflect the updated values. If we changed
	//		// _counter without calling setState(), then the build method would not be
	//		// called again, and so nothing would appear to happen.
	//		_counter++;
	//	});
	//}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('NIH Stroke Score'),
			),
			body: DefaultTextStyle(
				style: TextStyle(
					inherit: true,
					fontSize: 20.0,
					color: Colors.black,
				),
				child: Center(
					// TODO history of completed scores
				),
			),
			floatingActionButton: FloatingActionButton(
				onPressed: () {
					Navigator.push(
						context,
						MaterialPageRoute(builder: (context) => ChoicePage(0, _scores))
					);
				},
				tooltip: 'Increment',
				child: Icon(Icons.add),
			),
		);
	}
}
