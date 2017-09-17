class Main inherits IO {
    tree : Tree;
    input : Int;
    main() : Object{
        {
            out_string("양수를 입력하세요. (그 외의 경우 입력종료)\n");
            tree <- (new Tree).init();
            while{
                input <- in_int();
                0 <= input;
            }loop{
                tree.insert(input);
            }pool;
            out_string("검색할 숫자를 입력하세요.\n");
            input <- in_int();
            if tree.find(input) then
                out_string("있다\n")
            else
                out_string("없다\n")
            fi;
           
        }
    };
};
class Tree inherits IO{
    root : Node;
    tmpNode : Node;
    isRootNil : Bool;
    getRoot() : Node {root};
    isThereValue : Bool;
    init() : SELF_TYPE {
        {
            isRootNil <- true;
            self;
        }
    };
    insert(v : Int) : Object{
        if(isRootNil())
            then
                {
                    root <- (new Node).init(v);
                    isRootNil <- false;
                }
            else
                {
                    tmpNode <- root;
                    insert2(v, tmpNode);
                }
        fi
    };
    insert2(v : Int, n : Node) : Node{
        {
            if(n.getVal() < v) then
                 if(n.hasRChild()) then
                    insert2(v, n.getRight())
                else
                    tmpNode <- n.setRight((new Node).init(v))
                fi
            else
                if(n.hasLChild()) then
                    insert2(v, n.getLeft())
                else
                    tmpNode <- n.setLeft((new Node).init(v))
                fi
            fi;
           tmpNode; 
        }
    };
    print() : Object {
        print2(root)
    };
    print2(n : Node) : Object{
        {
            out_int(n.getVal());
            out_string("\n");
           if(n.hasLChild()) then
                print2(n.getLeft())
            else    out_string("")
            fi;
            if(n.hasRChild()) then
                print2(n.getRight())
            else    out_string("")
            fi;
        }
   };
    find(toFind : Int) : Bool {
        find2(toFind, root)
    };
    find2(toFind : Int, n : Node) : Bool{
        {
            if
                n.getVal() = toFind
            then
                isThereValue <- true
            else{
                if(n.hasLChild()) then
                    isThereValue <- find2(toFind, n.getLeft())
                else    isThereValue
                fi;
                if(n.hasRChild()) then
                    isThereValue <- find2(toFind, n.getRight())
                else    isThereValue
                fi;
            }fi;
            isThereValue;
        }
   };
    isRootNil() : Bool { isRootNil };

};
class Node{
    val : Int;
    leftChild : Node;
    rightChild : Node;
    hasRChild : Bool;
    hasLChild : Bool;
    hasRChild() : Bool { hasRChild };
    hasLChild() : Bool { hasLChild };
    init(v : Int) : SELF_TYPE{
        {
            val <- v;
            self;
        }
    };
    setLeft(n : Node) : SELF_TYPE{
        {
            hasLChild <- true;
            leftChild <- n;
            self;
        }
    };
    setRight(n : Node) : SELF_TYPE{
        {
            hasRChild <- true;
            rightChild <- n;
            self;
        }
    };
    getLeft() : Node{
        leftChild
    };
    getRight() : Node{
        rightChild
    };
    getVal() : Int{
        val
    };
};
