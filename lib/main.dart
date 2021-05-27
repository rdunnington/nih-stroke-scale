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
		StrokeChoices('1A. Level of Conciousness', [
			//May be assessed casually while taking history
			StrokeChoice(0, 'Alert; keenly responsive'),
			StrokeChoice(1, 'Arouses to minor stimulation'),
			StrokeChoice(2, 'Requires repeated stimulation to arouse'),
			StrokeChoice(2, 'Movements to pain'),
			StrokeChoice(2, 'Postures or unresponsive'),
		]),
		StrokeChoices('1B. Ask Name and Age', [
			StrokeChoice(0, 'Both questions right'),
			StrokeChoice(1, '1 question right'),
			StrokeChoice(2, '0 questions right'),
			StrokeChoice(1, 'Dysarthric/intubated/trauma/language barrier'),
			StrokeChoice(2, 'Aphasiac'),
		]),
		StrokeChoices('1C. Blink eyes and squeeze hands', [
			// Pantomime commands if communication barrier
			StrokeChoice(0, 'Performs both tasks'),
			StrokeChoice(1, 'Performs one task'),
			StrokeChoice(2, 'Performs no tasks'),
		]),
		StrokeChoices('2. Horizontal extraocular movements', [
			// Only assess horizontal gaze
			StrokeChoice(0, 'Normal'),
			StrokeChoice(1, 'Partial gaze palsy: can be overcome'),
			StrokeChoice(1, 'Partial gaze palsy: corrects with oculocephalic reflex'),
			StrokeChoice(2, 'Forced gaze palsy: cannot be overcome'),
		]),
		StrokeChoices('3. Visual Fields', [
			StrokeChoice(0, 'No visual loss'),
			StrokeChoice(1, 'Partial hemianopia'),
			StrokeChoice(2, 'Complete hemianopia'),
			StrokeChoice(3, 'Patient is bilaterally blind'),
			StrokeChoice(3, 'Bilateral hemianopia'),
		]),
		StrokeChoices('4: Facial palsy', [
			// Use grimace if obtunded
			StrokeChoice(0, 'Normal symmetry'),
			StrokeChoice(1, 'Minor paralysis (flat nasolabial fold, smile asymmetry)'),
			StrokeChoice(2, 'Partial paralysis (lower face)'),
			StrokeChoice(3, 'Unilateral complete paralysis (upper/lower face)'),
			StrokeChoice(3, 'Bilateral complete paralysis (upper/lower face)'),
		]),
		StrokeChoices('5A: Left arm motor drift', [
			//Count out loud and use your fingers to show the patient your count
			StrokeChoice(0, 'No drift for 10 seconds'),
			StrokeChoice(1, 'Drift, but does not hit bed'),
			StrokeChoice(2, 'Drift, hits bed'),
			StrokeChoice(2, 'Some effort against gravity'),
			StrokeChoice(3, 'No effort against gravity'),
			StrokeChoice(4, 'No movement'),
			StrokeChoice(0, 'Amputation/joint fusion'),
		]),
		StrokeChoices('5B: Right arm motor drift', [
			//Count out loud and use your fingers to show the patient your count
			StrokeChoice(0, 'No drift for 10 seconds'),
			StrokeChoice(1, 'Drift, but does not hit bed'),
			StrokeChoice(2, 'Drift, hits bed'),
			StrokeChoice(2, 'Some effort against gravity'),
			StrokeChoice(3, 'No effort against gravity'),
			StrokeChoice(4, 'No movement'),
			StrokeChoice(0, 'Amputation/joint fusion'),
		]),
		StrokeChoices('6A: Left leg motor drift', [
			//Count out loud and use your fingers to show the patient your count
			StrokeChoice(0, 'No drift for 5 seconds'),
			StrokeChoice(1, 'Drift, but does not hit bed'),
			StrokeChoice(2, 'Drift, hits bed'),
			StrokeChoice(2, 'Some effort against gravity'),
			StrokeChoice(3, 'No effort against gravity'),
			StrokeChoice(4, 'No movement'),
			StrokeChoice(0, 'Amputation/joint fusion'),
		]),
		StrokeChoices('6B: Right leg motor drift', [
			//Count out loud and use your fingers to show the patient your count
			StrokeChoice(0, 'No drift for 5 seconds'),
			StrokeChoice(1, 'Drift, but does not hit bed'),
			StrokeChoice(2, 'Drift, hits bed'),
			StrokeChoice(2, 'Some effort against gravity'),
			StrokeChoice(3, 'No effort against gravity'),
			StrokeChoice(4, 'No movement'),
			StrokeChoice(0, 'Amputation/joint fusion'),
		]),
		StrokeChoices('7: Limb Ataxia', [
			//FNF/heel-shin
			StrokeChoice(0, 'No ataxia'),
			StrokeChoice(1, 'Ataxia in 1 Limb'),
			StrokeChoice(2, 'Ataxia in 2 Limbs'),
			StrokeChoice(0, 'Does not understand'),
			StrokeChoice(0, 'Paralyzed'),
			StrokeChoice(0, 'Amputation/joint fusion'),
		]),
		StrokeChoices('8: Sensation', [
			StrokeChoice(0, 'Normal; no sensory loss'),
			StrokeChoice(1, 'Mild-moderate loss: less sharp/more dull'),
			StrokeChoice(1, 'Mild-moderate loss: can sense being touched'),
			StrokeChoice(2, 'Complete loss: cannot sense being touched at all'),
			StrokeChoice(2, 'No response and quadriplegic'),
			StrokeChoice(2, 'Coma/unresponsive'),
		]),
		StrokeChoices('9: Language/aphasia', [
			//Describe the scene; name the items; read the sentences (see Evidence)
			StrokeChoice(0, 'Normal; no aphasia'),
			StrokeChoice(1, 'Mild-moderate aphasia: some obvious changes, without significant limitation'),
			StrokeChoice(2, 'Severe aphasia: fragmentary expression, inference needed, cannot identify materials'),
			StrokeChoice(3, 'Mute/global aphasia: no usable speech/auditory comprehension'),
			StrokeChoice(3, 'Coma/unresponsive'),
		]),
		StrokeChoices('10: Dysarthria', [
			//Read the words (see Evidence)
			StrokeChoice(0, 'Normal'),
			StrokeChoice(1, 'Mild-moderate dysarthria: slurring but can be understood'),
			StrokeChoice(2, 'Severe dysarthria: unintelligible slurring or out of proportion to dysphasia'),
			StrokeChoice(2, 'Mute/anarthric'),
			StrokeChoice(0, 'Intubated/unable to test'),
		]),
		StrokeChoices('11: Extinction/inattention', [
			StrokeChoice(0, 'No abnormality'),
			StrokeChoice(1, 'Visual/tactile/auditory/spatial/personal inattention'),
			StrokeChoice(1, 'Extinction to bilateral simultaneous stimulation'),
			StrokeChoice(2, 'Profound hemi-inattention (ex: does not recognize own hand)'),
			StrokeChoice(2, 'Extinction to >1 modality'),
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
