package pl_assignment;

//IsmailUlasBayram_220201040

//PostorderTree is implemented by NodeAccept interface and extended by Node class.
public class PostorderTree extends Node implements NodeAccept{

	public PostorderTree(int item) {
		super(item);
	}

	@Override
	public void accept(NodeVisit v) {
		v.visit(this);
		
	}

}
