package pl_assignment;

//IsmailUlasBayram_220201040

//This class is main class to cover all internal classes.
public class Main {
	public static void main(String[] args) {
		
		//Preorder Traversal
		
		PreorderTree preordertree = new PreorderTree(5);
		preordertree.left = new PreorderTree(3);
		preordertree.right = new PreorderTree(4);
		preordertree.left.right = new PreorderTree(2);
		preordertree.left.left = new PreorderTree(12);
		preordertree.right.right = new PreorderTree(22);
		preordertree.right.left = new PreorderTree(91);
		
		System.out.println("Preorder Traversal: ");
		preordertree.accept(new TreeVisitor());
		System.out.println();
		
		//Inorder Traversal
		
		InorderTree inordertree = new InorderTree(5);
		inordertree.left = new InorderTree(3);
		inordertree.right = new InorderTree(4);
		inordertree.left.right = new InorderTree(2);
		inordertree.left.left = new InorderTree(12);
		inordertree.right.right = new InorderTree(22);
		inordertree.right.left = new InorderTree(91);
		
		System.out.println("Inorder Traversal: ");
		inordertree.accept(new TreeVisitor());
		System.out.println();
		
		//Postorder Traversal
		
		PostorderTree postordertree = new PostorderTree(5);
		postordertree.left = new PostorderTree(3);
		postordertree.right = new PostorderTree(4);
		postordertree.left.right = new PostorderTree(2);
		postordertree.left.left = new PostorderTree(12);
		postordertree.right.right = new PostorderTree(22);
		postordertree.right.left = new PostorderTree(91);
		
		System.out.println("Postorder Traversal: ");
		postordertree.accept(new TreeVisitor());
		System.out.println();
		
	}
}
