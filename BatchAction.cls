/**
 * Created by chrivanw on 01-12-16.
 */

public abstract class BatchAction
{
	public String query { get; protected set; }
	public Set<Id> ids { get; protected set; }

	public abstract void Execute(List<SObject> lstObj);
}