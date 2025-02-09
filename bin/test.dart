void main(){
  print('play');
  // non nullable
  int i;
  // nullable variable
  int ? t;
  // variable with initial value
  int e=0;
  int lineCount;
  //var _ = 1;
  int _ = 2;

}

/*
unary postfix	expr++    expr--    ()    []    ?[]    .    ?.    !	None
unary prefix	-expr    !expr    ~expr    ++expr    --expr      await expr	None
multiplicative	*    /    %  ~/	Left
additive	+    -	Left
shift	<<    >>    >>>	Left
bitwise AND	&	Left
bitwise XOR	^	Left
bitwise OR	|	Left
relational and type test	>=    >    <=    <    as    is    is!	None
equality	==    !=	None
logical AND	&&	Left
logical OR	||	Left
if-null	??	Left
conditional	expr1    ?    expr2    :    expr3	Right
cascade	..    ?..	Left
assignment	=    *=    /=   +=   -=   &=   ^=   etc.	Right
spread (See note)	...    ...?	None
 */
// single comment
/*
multiline comment
 */
/// document comment
/**
 document comment
 **/