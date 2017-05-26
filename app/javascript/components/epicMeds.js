module.exports = function splitNoParen(s){
    var left= 0, right= 0, A= [],
    M= s.match(/([^()]+)|([()])/g), L= M.length, next, str= '';
    for(var i= 0; i<L; i++){
        next= M[i];
        if(next=== '(')++left;
        else if(next=== ')')++right;
        if(left!== 0){
            str+= next;
            if(left=== right){
                A[A.length-1]+=str;
                left= right= 0;
                str= '';
            }
        }
        else A=A.concat(next.match(/([^,]+)/g));
    }
    return A;
}
