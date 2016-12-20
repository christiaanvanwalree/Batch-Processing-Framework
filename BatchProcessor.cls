/**
 * Created by chrivanw on 02-12-16.
 */

global class BatchProcessor implements Database.Batchable<SObject>, Database.Stateful
{
	private IProcess process;
	private BatchAction action;

	public BatchProcessor() {}

	public BatchProcessor(IProcess process) {
		this.process = process;
	}

	public void StartBatch(BatchAction action) {
		this.action = action;
		Database.executeBatch(this);
	}

	global Database.QueryLocator Start(Database.BatchableContext context){
		String query = action.query;
		Set<Id> ids = action.ids;
		return Database.getQueryLocator(query);
	}

	global void Execute(Database.BatchableContext context, List<SObject> lstObj) {
		action.Execute(lstObj);
	}

	global void Finish(Database.BatchableContext context) {
		if (process != null) {
			process.NextStep();
		}
	}
}