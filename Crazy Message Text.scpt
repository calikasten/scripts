FasdUAS 1.101.10   ��   ��    k             l      ��  ��   

Crazy Message Text

Copyright � 2002-2006 Apple Computer, Inc.

You may incorporate this Apple sample code into your program(s) without
restriction.  This Apple sample code has been provided "AS IS" and the
responsibility for its operation is yours.  You are not permitted to
redistribute this Apple sample code as "Apple sample code" after having
made changes.  If you're going to redistribute the code, we require
that you make it clear that the code was descended from Apple sample
code, but that you've made changes.
     � 	 	 
 C r a z y   M e s s a g e   T e x t 
 
 C o p y r i g h t   �   2 0 0 2 - 2 0 0 6   A p p l e   C o m p u t e r ,   I n c . 
 
 Y o u   m a y   i n c o r p o r a t e   t h i s   A p p l e   s a m p l e   c o d e   i n t o   y o u r   p r o g r a m ( s )   w i t h o u t 
 r e s t r i c t i o n .     T h i s   A p p l e   s a m p l e   c o d e   h a s   b e e n   p r o v i d e d   " A S   I S "   a n d   t h e 
 r e s p o n s i b i l i t y   f o r   i t s   o p e r a t i o n   i s   y o u r s .     Y o u   a r e   n o t   p e r m i t t e d   t o 
 r e d i s t r i b u t e   t h i s   A p p l e   s a m p l e   c o d e   a s   " A p p l e   s a m p l e   c o d e "   a f t e r   h a v i n g 
 m a d e   c h a n g e s .     I f   y o u ' r e   g o i n g   t o   r e d i s t r i b u t e   t h e   c o d e ,   w e   r e q u i r e 
 t h a t   y o u   m a k e   i t   c l e a r   t h a t   t h e   c o d e   w a s   d e s c e n d e d   f r o m   A p p l e   s a m p l e 
 c o d e ,   b u t   t h a t   y o u ' v e   m a d e   c h a n g e s . 
   
  
 l     ��������  ��  ��        l      ��  ��    � �
This script takes a string from the user and then makes a new message
where each letter has a different font, size, and color.
     �    
 T h i s   s c r i p t   t a k e s   a   s t r i n g   f r o m   t h e   u s e r   a n d   t h e n   m a k e s   a   n e w   m e s s a g e 
 w h e r e   e a c h   l e t t e r   h a s   a   d i f f e r e n t   f o n t ,   s i z e ,   a n d   c o l o r . 
      l     ��������  ��  ��        j     �� �� 0 lowfontsize lowFontSize  m     ���� $      j    �� �� 0 highfontsize highFontSize  m    ���� H      j    �� �� 0 messagetext messageText  m       �    H a p p y   B i r t h d a y !      l     ��������  ��  ��       !   l   ' "���� " T    ' # # k   " $ $  % & % r    4 ' ( ' I   2�� ) *
�� .sysodlogaskr        TEXT ) b      + , + b     - . - b     / 0 / b     1 2 1 b     3 4 3 b    
 5 6 5 b     7 8 7 m     9 9 � : : 0 E n t e r   s o m e   m e s s a g e   t e x t : 8 o    ��
�� 
ret  6 o    	��
�� 
ret  4 m   
  ; ; � < < 0 M i n i m u m   C h a r a c t e r   S i z e :   2 l    =���� = c     > ? > o    ���� 0 lowfontsize lowFontSize ? m    ��
�� 
TEXT��  ��   0 o    ��
�� 
ret  . m     @ @ � A A 0 M a x i m u m   C h a r a c t e r   S i z e :   , l    B���� B c     C D C o    ���� 0 highfontsize highFontSize D m    ��
�� 
TEXT��  ��   * �� E F
�� 
dtxt E o   ! &���� 0 messagetext messageText F �� G H
�� 
btns G J   ' , I I  J K J m   ' ( L L � M M  C a n c e l K  N O N m   ( ) P P � Q Q  S e t   P r e f s O  R�� R m   ) * S S � T T  C o n t i n u e��   H �� U��
�� 
dflt U m   - .���� ��   ( o      ���� 0 	userinput 	userInput &  V W V l  5 5��������  ��  ��   W  X�� X Z   5" Y Z�� [ Y =  5 : \ ] \ l  5 8 ^���� ^ n   5 8 _ ` _ 1   6 8��
�� 
bhit ` o   5 6���� 0 	userinput 	userInput��  ��   ] m   8 9 a a � b b  S e t   P r e f s Z k   = � c c  d e d r   = D f g f m   = @���� 	 g o      ���� "0 minimumfontsize minimumFontSize e  h i h l  E E��������  ��  ��   i  j k j I  E l�� l m
�� .sysodlogaskr        TEXT l b   E Z n o n b   E V p q p b   E P r s r b   E L t u t b   E J v w v m   E H x x � y y F E n t e r   t h e   m i n i m u m   f o n t   s i z e   t o   u s e : w o   H I��
�� 
ret  u o   J K��
�� 
ret  s l 	 L O z���� z m   L O { { � | | $ ( M u s t   b e   a t   l e a s t  ��  ��   q l  P U }���� } c   P U ~  ~ o   P S���� "0 minimumfontsize minimumFontSize  m   S T��
�� 
TEXT��  ��   o m   V Y � � � � �  ) m �� � �
�� 
dtxt � o   [ `���� 0 lowfontsize lowFontSize � �� ���
�� 
btns � J   a f � �  ��� � m   a d � � � � �  O K��  ��   k  � � � r   m | � � � c   m x � � � n   m t � � � 1   p t��
�� 
ttxt � l  m p ����� � 1   m p��
�� 
rslt��  ��   � m   t w��
�� 
long � o      ���� 0 newfontsize newFontSize �  � � � Z   } � � ��� � � @  } � � � � o   } ����� 0 newfontsize newFontSize � o   � ����� "0 minimumfontsize minimumFontSize � r   � � � � � o   � ����� 0 newfontsize newFontSize � o      ���� 0 lowfontsize lowFontSize��   � r   � � � � � o   � ����� "0 minimumfontsize minimumFontSize � o      ���� 0 lowfontsize lowFontSize �  � � � l  � ���������  ��  ��   �  � � � I  � ��� � �
�� .sysodlogaskr        TEXT � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � m   � � � � � � � F E n t e r   t h e   m a x i m u m   f o n t   s i z e   t o   u s e : � o   � ���
�� 
ret  � o   � ���
�� 
ret  � l 	 � � ����� � m   � � � � � � � , ( M u s t   b e   g r e a t e r   t h a n  ��  ��   � l  � � ����� � c   � � � � � o   � ����� 0 lowfontsize lowFontSize � m   � ���
�� 
TEXT��  ��   � m   � � � � � � �  ) � �� � �
�� 
dtxt � o   � ����� 0 highfontsize highFontSize � �� ���
�� 
btns � J   � � � �  ��� � m   � � � � � � �  O K��  ��   �  � � � r   � � � � � c   � � � � � n   � � � � � 1   � ���
�� 
ttxt � l  � � ����� � 1   � ���
�� 
rslt��  ��   � m   � ���
�� 
long � o      ���� 0 newfontsize newFontSize �  � � � Z   � � � ��� � � ?  � � � � � o   � ����� 0 newfontsize newFontSize � o   � ����� 0 lowfontsize lowFontSize � r   � � � � � o   � ����� 0 newfontsize newFontSize � o      ���� 0 highfontsize highFontSize��   � r   � � � � � o   � ����� 0 lowfontsize lowFontSize � o      ���� 0 highfontsize highFontSize �  ��� � l  � ���������  ��  ��  ��  ��   [ l  �" � � � � k   �" � �  � � � r   � � � � n   � � � � 1   ��
�� 
ttxt � o   � ���� 0 	userinput 	userInput � o      ���� 0 thetext theText �  � � � Z  	  � ����� � > 	 � � � o  	���� 0 thetext theText � m   � � � � �   � r   � � � o  ���� 0 thetext theText � o      ���� 0 messagetext messageText��  ��   �  ��� �  S  !"��   � 1 + button returned of userInput is "Continue"    � � � � V   b u t t o n   r e t u r n e d   o f   u s e r I n p u t   i s   " C o n t i n u e "��  ��  ��   !  � � � l     ��������  ��  ��   �  � � � l (� ����� � r  (� � � � J  (� � �  � � � m  (+ � � � � � & A m e r i c a n   T y p e w r i t e r �  � � � m  +. � � � � � 2 A m e r i c a n   T y p e w r i t e r   L i g h t �  � � � m  .1 � � � � � 0 A m e r i c a n   T y p e w r i t e r   B o l d �  � � � m  14 � � �   : A m e r i c a n   T y p e w r i t e r   C o n d e n s e d �  m  47 � F A m e r i c a n   T y p e w r i t e r   C o n d e n s e d   L i g h t  m  7: � D A m e r i c a n   T y p e w r i t e r   C o n d e n s e d   B o l d 	
	 m  := � 
 A r i a l
  m  =@ �  A r i a l   I t a l i c  m  @C �  A r i a l   B o l d  m  CF � " A r i a l   B o l d   I t a l i c  m  FI �  A r i a l   B l a c k  m  IL �    B a s k e r v i l l e !"! m  LO## �$$ $ B a s k e r v i l l e   I t a l i c" %&% m  OR'' �(( ( B a s k e r v i l l e   S e m i B o l d& )*) m  RU++ �,,   B a s k e r v i l l e   B o l d* -.- m  UX// �00 6 B a s k e r v i l l e   S e m i B o l d   I t a l i c. 121 m  X[33 �44 . B a s k e r v i l l e   B o l d   I t a l i c2 565 m  [^77 �88 " B i g   C a s l o n   M e d i u m6 9:9 m  ^a;; �<<  C o m i c   S a n s   M S: =>= m  ad?? �@@ $ C o m i c   S a n s   M S   B o l d> ABA m  dgCC �DD  C o p p e r p l a t eB EFE m  gjGG �HH " C o p p e r p l a t e   L i g h tF IJI m  jmKK �LL   C o p p e r p l a t e   B o l dJ MNM m  mpOO �PP 
 D i d o tN QRQ m  psSS �TT  D i d o t   I t a l i cR UVU m  svWW �XX  D i d o t   B o l dV YZY m  vy[[ �\\  F u t u r a   M e d i u mZ ]^] m  y|__ �`` ( F u t u r a   M e d i u m   I t a l i c^ aba m  |cc �dd . F u t u r a   C o n d e n s e d   M e d i u mb efe m  �gg �hh 4 F u t u r a   C o n d e n s e d   E x t r a B o l df iji m  ��kk �ll  G e n e v aj mnm m  ��oo �pp  G i l l   S a n sn qrq m  ��ss �tt   G i l l   S a n s   I t a l i cr uvu m  ��ww �xx  G i l l   S a n s   L i g h tv yzy m  ��{{ �|| , G i l l   S a n s   L i g h t   I t a l i cz }~} m  �� ���  G i l l   S a n s   B o l d~ ��� m  ���� ��� * G i l l   S a n s   B o l d   I t a l i c� ��� m  ���� ���  H e r c u l a n u m� ��� m  ���� ���  L u c i d a   G r a n d e� ��� m  ���� ��� $ L u c i d a   G r a n d e   B o l d� ��� m  ���� ���   M a r k e r   F e l t   T h i n� ��� m  ���� ���   M a r k e r   F e l t   W i d e� ��� m  ���� ���  O p t i m a   R e g u l a r� ��� m  ���� ���  O p t i m a   I t a l i c� ��� m  ���� ���  O p t i m a   B o l d� ��� m  ���� ��� $ O p t i m a   B o l d   I t a l i c� ��� m  ���� ��� " O p t i m a   E x t r a B l a c k� ��� m  ���� ���  P a p y r u s� ��� m  ���� ���  V e r d a n a� ��� m  ���� ���  V e r d a n a   I t a l i c� ��� m  ���� ���  V e r d a n a   B o l d� ��� m  ���� ��� & V e r d a n a   B o l d   I t a l i c� ��� m  ���� ���  Z a p f i n o�   � o      �~�~ 0 fontlist fontList��  ��   � ��� l     �}�|�{�}  �|  �{  � ��z� l ����y�x� O  ����� k  ���� ��� I ���w�v�u
�w .miscactvnull��� ��� null�v  �u  � ��� r  � ��� I ���t�s�
�t .corecrel****      � null�s  � �r��
�r 
kocl� m  ���q
�q 
bcke� �p��o
�p 
prdt� K  ���� �n��
�n 
ctnt� o  ���m�m 0 messagetext messageText� �l��k
�l 
pvis� m  ���j
�j boovtrue�k  �o  � o      �i�i $0 crazytextmessage crazyTextMessage� ��� l �h�g�f�h  �g  �f  � ��e� O  ���� X  ���d�� k  ��� ��� r  ,��� l &��c�b� n  &��� 3  "&�a
�a 
cobj� o  "�`�` 0 fontlist fontList�c  �b  � n      ��� 1  '+�_
�_ 
font� o  &'�^�^ 0 eachcharacter eachCharacter� ��� r  -J��� l -D��]�\� I -D�[�Z�
�[ .sysorandnmbr    ��� nmbr�Z  � �Y��
�Y 
from� o  16�X�X 0 lowfontsize lowFontSize� �W��V
�W 
to  � o  9>�U�U 0 highfontsize highFontSize�V  �]  �\  � n      ��� 1  EI�T
�T 
ptsz� o  DE�S�S 0 eachcharacter eachCharacter� ��R� r  K���� J  K��� ��� I K\�Q�P�
�Q .sysorandnmbr    ��� nmbr�P  � �O��
�O 
from� m  OP�N�N  � �M��L
�M 
to  � m  SV�K�K   ���L  � � � I \m�J�I
�J .sysorandnmbr    ��� nmbr�I   �H
�H 
from m  `a�G�G   �F�E
�F 
to   m  dg�D�D   ���E    �C I m~�B�A
�B .sysorandnmbr    ��� nmbr�A   �@
�@ 
from m  qr�?�?   �>	�=
�> 
to  	 m  ux�<�<   ���=  �C  � n      

 m  ���;
�; 
colr o  ���:�: 0 eachcharacter eachCharacter�R  �d 0 eachcharacter eachCharacter� 2 
�9
�9 
cha � o  �8�8 $0 crazytextmessage crazyTextMessage�e  � m  ���                                                                                  emal  alis    (  Macintosh HD               ��½BD ����Mail.app                                                       ������½        ����  
 cu             Applications  /:System:Applications:Mail.app/     M a i l . a p p    M a c i n t o s h   H D  System/Applications/Mail.app  / ��  �y  �x  �z       
�7�6�5�7   �4�3�2�1�0�/�.�-�4 0 lowfontsize lowFontSize�3 0 highfontsize highFontSize�2 0 messagetext messageText
�1 .aevtoappnull  �   � ****�0 0 	userinput 	userInput�/ 0 thetext theText�. 0 fontlist fontList�- $0 crazytextmessage crazyTextMessage�6 $�5 H �  H a p p y   B i r t h d a y ! �,�+�*�)
�, .aevtoappnull  �   � **** k    �     � ��(�(  �+  �*   �'�' 0 eachcharacter eachCharacter k 9�& ;�% @�$�# L P S�"�!� �� a�� x { � ������ � � � �� � � � � �#'+/37;?CGKOSW[_cgkosw{�����������������������������
�	�������
�& 
ret 
�% 
TEXT
�$ 
dtxt
�# 
btns
�" 
dflt�! 
�  .sysodlogaskr        TEXT� 0 	userinput 	userInput
� 
bhit� 	� "0 minimumfontsize minimumFontSize� 
� 
rslt
� 
ttxt
� 
long� 0 newfontsize newFontSize� 0 thetext theText� 5� 0 fontlist fontList
� .miscactvnull��� ��� null
� 
kocl
� 
bcke
� 
prdt
� 
ctnt
� 
pvis
� .corecrel****      � null� $0 crazytextmessage crazyTextMessage
� 
cha 
�
 
cobj
�	 .corecnte****       ****
� 
font
� 
from
� 
to  
� .sysorandnmbr    ��� nmbr
� 
ptsz�   ��
� 
colr�)�&hZ��%�%�%b   �&%�%�%b  �&%�b  ����mv�m� E�O��,�  �a E` Oa �%�%a %_ �&%a %�b   �a kva  O_ a ,a &E` O_ _  _ Ec   Y _ Ec   Oa �%�%a %b   �&%a %�b  �a kva  O_ a ,a &E` O_ b    _ Ec  Y b   Ec  OPY %�a ,E` O_ a   _ Ec  Y hO[OY��Oa !a "a #a $a %a &a 'a (a )a *a +a ,a -a .a /a 0a 1a 2a 3a 4a 5a 6a 7a 8a 9a :a ;a <a =a >a ?a @a Aa Ba Ca Da Ea Fa Ga Ha Ia Ja Ka La Ma Na Oa Pa Qa Ra Sa Ta Ua VvE` WOa X �*j YO*a Za [a \a ]b  a ^ea a  _E` `O_ ` � �*a a-[a Za bl ckh  _ Wa b.�a d,FO*a eb   a fb  a  g�a h,FO*a eja fa ia  g*a eja fa ia  g*a eja fa ia  gmv�a j,F[OY��UU �
� 
bhit �  C o n t i n u e � ��
�  
ttxt��   ���� 5 5  � � � �#'+/37;?CGKOSW[_cgkosw{�����������������  ������
�� 
bcke��  
�� kfrmID  ascr  ��ޭ