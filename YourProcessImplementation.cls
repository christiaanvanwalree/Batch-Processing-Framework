/**
 * Created by chrivanw on 20-12-16.
 * This class is meant as a Template and will not actually run.
 */

public class YourProcessImplementation implements IProcess
{
	public Enum ProcessState { STATE_1, STATE_2, STATE_3 }

	public Boolean IsRunning { get; private set; }
	public ProcessState NextState { get; private set; }
	public ProcessState CurrentState { get; private set; }

	private BatchProcessor processor;

	public void Start(){
		if (!IsRunning) {
			//do some initialization
			IsRunning = true;
			processor = new BatchProcessor(this);
			NextState = ProcessState.STATE_1;
			NextStep();
		}
	}

	public void NextStep(){
		if (!IsRunning) {
			return;
		}

		CurrentState = NextState;

		if (CurrentState == ProcessState.STATE_1){
			NextState = ProcessState.STATE_2;
			//Start the BatchProcessor
			return;
		}

		if (CurrentState == ProcessState.STATE_2) {
			NextState = ProcessState.STATE_3;
			//Do something with result form BatchProcessor
			//Start another Batch
			return;
		}

		if (CurrentState == ProcessState.STATE_3) {
			//Do something with result form BatchProcessor
			//Finalize the process
			IsRunning = false;
			return;
		}
	}
}