class Main inherits IO{
    head : CustomList;
    list : CustomList;
    input : Int;
    asc : String;
    listSize : Int;
    minVal : Int;
    newList : CustomList;
    newHead : CustomList;
    main() : Object{
        {
            out_string("양수를 입력하세요. (그 외의 경우 입력 종료)\n");
            list <- (new CustomList);
            head <- list;
            while
                {
                    input <- in_int();
                    0 <= input;
                }
            loop
                {
                    list.setNext((new CustomList).init(input));
                    list <- list.getNext();
                    listSize <- listSize + 1;
                }
            pool;
            
            newList <- (new CustomList);
            newHead <- newList;
            while
                0 < listSize
            loop {
                minVal <- head.findMin(head);
                head.deleteMin(minVal, head);
                newList.setNext((new CustomList).init(minVal));
                newList <- newList.getNext();
                listSize <- listSize - 1;
            }pool;

            out_string("y : 오름차순, n : 내림차순. ");
            asc <- in_string();
            if(asc = "y") then {
                out_string("정방향 : ");
                newHead.print(newHead); 
                out_string("역방향 : ");
                newHead.printReverse(newHead);
                out_string("\n");
            } else { 
                out_string("정방향 : ");
                newHead.printReverse(newHead);
                out_string("\n");
                out_string("역방향 : ");
                newHead.print(newHead); 
            }fi;
            
        }   
    };
};

class CustomList inherits IO{
    val : Int;
    next : CustomList;
    hasNext : Bool;
    minVal : Int;
    before : CustomList;
    init(v : Int) : CustomList{
        {
            val <- v;
            self;
        }
    };
    setNext(n : CustomList) : SELF_TYPE{
        {
            next <- n;
            hasNext <- true;
            self;
        }
    };
    getVal() : Int{
        val
    };
    getNext() : CustomList{
        next
    };
    hasNext() : Bool { hasNext };
    print(list : CustomList) : Object { 
        {
            while
                    list.hasNext()
            loop
                {
                    list <- list.getNext();
                    out_int(list.getVal());
                    out_string(" ");
                }
            pool;
            out_string("\n");
        }
    };
    printReverse(list : CustomList) : Object {
        if(list.hasNext()) 
            then{
                 list <- list.getNext();
                    printReverse(list);
                    out_int(list.getVal());
                    out_string(" ");
            }
            else
                out_string("")
        fi
    };
    findMin(list : CustomList) : Int {
        {
            minVal <- 987654321;
            while
                    list.hasNext()
            loop
                {
                    list <- list.getNext();
                    if(list.getVal() < minVal) then
                        minVal <- list.getVal()
                    else
                        minVal
                    fi;
                }
            pool;
            minVal;
        }
    };
    deleteMin(minVal : Int, list : CustomList) : Object {
        {
            while
                    list.hasNext()
            loop
                {
                    before <- list;
                    list <- list.getNext();
                    if(list.getVal() = minVal) then
                        if(list.hasNext()) then
                            before.setNext(list.getNext())
                        else
                            before.setNext((new CustomList).init(987654321))
                        fi
                    else
                        deleteMin(minVal, list)
                    fi;
                }
            pool;
            minVal;
        }
    };
};
