package pl_assignment;

//IsmailUlasBayram_220201040

//PreorderTree is implemented by NodeAccept interface and extended by Node class.
public class PreorderTree extends Node implements NodeAccept {
	
	public PreorderTree(int item) {
		super(item);
	}

	@Override
	public void accept(NodeVisit v) {
		v.visit(this);
		
	}
	
}
