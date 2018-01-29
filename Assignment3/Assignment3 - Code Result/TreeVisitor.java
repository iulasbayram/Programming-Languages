package pl_assignment;

//IsmailUlasBayram_220201040

//TreeVisitor class is implemented by NodeVisit interface.
//This class does traversal operation which belongs to tree types.
public class TreeVisitor implements NodeVisit{

	@Override
	public void visit(PreorderTree tree) {
		if (tree == null)
            System.out.print("");
		else{
			System.out.print(tree.key + " ");
			visit((PreorderTree) tree.left);
			visit((PreorderTree) tree.right);
		}
	}

	@Override
	public void visit(InorderTree tree) {
		if (tree == null)
            System.out.print("");
		else{
			visit((InorderTree) tree.left);
			System.out.print(tree.key + " ");
			visit((InorderTree) tree.right);
		}	
	}

	@Override
	public void visit(PostorderTree tree) {
		if (tree == null)
            System.out.print("");
		else{
			visit((PostorderTree) tree.left);
			visit((PostorderTree) tree.right);
			System.out.print(tree.key + " ");
		}
	}

}
