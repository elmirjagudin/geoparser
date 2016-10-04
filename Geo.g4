grammar Geo;

geo : file_header point_list? line_list? attribute_list?;

file_header : 'FileHeader' STRING ',' STRING 
    'begin' file_info* 'end' ;

file_info : 'FileInfo' STRING? ',' STRING? ;

point_list : 'PointList' ('begin' point* 'end')? ;

point : 'Point' name ',' north ',' east ',' height? ',' code? ',' special_code? ',' remark?
    ( 'begin' attribute_list* 'end' )? ;

name : STRING ;
north : NUMBER ;
east : NUMBER ;
height : NUMBER ;
code : STRING ;
special_code : STRING ;
remark : STRING ;

line_list : 'LineList' ;
attribute_list : 'AttributeList' ( 'begin' attribute* 'end' )? ;
attribute : 'Attribute' STRING ',' STRING ;

STRING : '"' ~["]* '"' ;
NUMBER : [0-9]+'.'[0-9]+ ;
WS : [ \t\r\n]+ -> skip ; // skip spaces, tabs, newlines
