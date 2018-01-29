package pl_assignment;

//IsmailUlasBayram_220201040

//InorderTree is implemented by NodeAccept interface and extended by Node class.
public class InorderTree extends Node implements NodeAccept{

	public InorderTree(int item) {
		super(item);
	}

	@Override
	public void accept(NodeVisit v) {
		v.visit(this);
		
	}
	
}
