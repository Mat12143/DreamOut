GDPC                                                                            #   <   res://.import/base.png-2c628743204fce894d065ec3666974d1.stex��      f       9q��L������{�@   res://.import/capybara.png-47881e71b59cff090a51f135a84bcc26.stex��      �      �5�.A�s};��ȝD   res://.import/giuratore.png-552dbfc179b1c9110d8ec11a3fc5f0e8.stex   ��      ~       k���x���Z��2�H   res://.import/giuratore_walk.png-f80653d05b03902b1fb10474c1d6b62d.stex  @�      �       �
�������R e�<   res://.import/gun.png-edc19339ae46fae383ca29a6abd4420b.stex `�      Z       r4SfrI�j��v��<   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex�y      �      ��p�*x�I���()�zP   res://.import/index.apple-touch-icon.png-bec44240503e0edb75d852ab0cc26d58.stex  �      ~/      7����ϓ8k���n�D   res://.import/index.icon.png-8466b9836b3b13bcc45e53125321ef39.stex  `A      �      ��p�*x�I���()�z@   res://.import/index.png-d03311572afeb237347e3aea48014cb0.stex   J      -      �c�5���J��;fD   res://.import/playerBullet.png-a1a551caf28ab84c91e9768989016e60.stex��      l       ܶ��Qa�u9�d�|2B@   res://.import/shoot.mp3-e2944a614193130b5284ef5c669938cb.mp3str ��      �,      ������`8�|}JA   res://World.tscn      .      <��	�V}T�v	���   res://default_env.tres  @      �       um�`�N��<*ỳ�84   res://exports/web/index.apple-touch-icon.png.import p>      �      ���<%���j}����F(   res://exports/web/index.icon.png.import @G      �      �+�q��PD�~O��?$   res://exports/web/index.png.import   w      �      3:VO+6Qq�%j�"�   res://icon.png  ��      �      G1?��z�c��vN��   res://icon.png.import   �      �      ñi6,��-5��bS�   res://project.binary��      �      t�'f�OM<ɕUr@�   res://scenes/Bullet.tscnp�      }      ����v�pt%9�F��   res://scenes/Capybara.tscn  ��      �      \�ބ�k�?��%��G�   res://scenes/Player.tscn��      	      ��p��5L�E�����o    res://scripts/Bullet.gd.remap    �      )       �+7� ��5��n�_��f   res://scripts/Bullet.gdc��      �      x�&�kͭ$��H�    res://scripts/GunPoint.gd.remap P�      +       <?P����9f�2����   res://scripts/GunPoint.gdc  ��      �       ��ir���υ��Lک�    res://scripts/Player.gd.remap   ��      )       �g��і��CY�e�<e�   res://scripts/Player.gdc��      �      �&CB?[o39b�[�   res://sfx/shoot.mp3.import  @�            gx��'ս� W�[n$   res://sprites/Bullets/gun.png.import��      �      "�h���}<����50   res://sprites/Bullets/playerBullet.png.import   ��      �      �Bu;�A�OT߆�[��(   res://sprites/Cursors/base.png.import   0�      �      t5���sLq��Xй,   res://sprites/Player/giuratore.png.import   p�      �      ^:�5-�6~D����F0   res://sprites/Player/giuratore_walk.png.import  ��      �      �N�,�A�yiO{�o�$   res://sprites/capybara.png.import   `�      �      �%����Ḧ́��W[gd_scene load_steps=3 format=2]

[ext_resource path="res://scenes/Player.tscn" type="PackedScene" id=1]
[ext_resource path="res://scenes/Capybara.tscn" type="PackedScene" id=2]

[node name="World" type="YSort"]

[node name="Player" parent="." instance=ExtResource( 1 )]
position = Vector2( 160, 80 )
acceleration = 650
max_speed = 150
friction = 1000

[node name="StaticBody2D" type="StaticBody2D" parent="."]

[node name="CollisionPolygon2D" type="CollisionPolygon2D" parent="StaticBody2D"]
polygon = PoolVector2Array( 0, 0, 32, 0, 8, 24, 56, 64, 24, 88, 24, 160, 48, 176, 72, 168, 96, 176, 136, 160, 176, 168, 240, 160, 216, 128, 248, 88, 280, 112, 296, 48, 248, 24, 232, 16, 248, 8, 248, 0, 320, 0, 320, 176, 0, 180 )

[node name="Capybara" parent="." instance=ExtResource( 2 )]
position = Vector2( 104, 104 )
  [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDST�   �             b/  WEBPRIFFV/  WEBPVP8LJ/  /��,͘i�F�[�?�m"�?A�Β�b��m#������DMI�!��s����m�<wo��D�?$Y��i���j��$�L3���C*�Q�u����ͤ�n+��K �$���m��?�vBDL *�H��ȶ��N�:��'��L�F�lRh�7��G��{z�����Kn#I�$Z���|�(��� ���r�mkۛ��#$@���ޓ齞���C=�3�Nlnr�6�"��{w���mm��ֶ����LH�v?����-�$���Y��H�ÝoI�,I�l��գ������o����;Å|�dI�$Y�����3���o�O�	DI��6}�u"�7  |��[��W�A���=�y��+���r�v+\!�M�@����X'�����k��u��6�x��̗7 ���7�B6P��ɧg5kРFBDD�� ����F@� ��u9�\6�m>��?��x#�Z��s�z��i�����C߮�-�@�	�$@B��vM�A�z�#�}ھk�56�>0�6�} ����7rQ^.���k�)���'=jԶ��.��0P�mנ�el������a��~h��� �������Z�>>���>b�t!�Hb`�́� 6�.!�R��ա�]�֔3��x����0cFx9�t�ǝ����~�����c�A�T��@'� $f��)��~*��[(	,�����T�/L�x9���;;<Ǐ�	����2�	�$R���E��N�-T�I���V��_�c���/ ��a_��y������m�AbȐQ�IЉ$HL�Ĵ�$ ����Z������Ɲ&̘���zŋ�^<ի��1n�q`��(C:)c��4��Ȧ�I1:`��+�l�I_~h�C�CM�5��򱃈�����T��m�S�X:��@��'b:AL�O"�Щ�(��U>��]~H;4b�5���������׺/����)KY�))�2��^3�$bH;,��� /,Gw5���-��.P�ǭ��#�EYb)CRR��3;5���lhwζ��sWl��#�[|�ub`�,�2� ��zZJ�
+۹����C�=G����Pe %�"E
����mI�d�������u��#��*waȐQ����2a�[8vY��z��+��nZ�b�
[��' h'FǄz�X�^�@����GMt�I���CZ*,��4�&"H1�D�N�M'`��~�%��u��U�������hǦEը� `��		� &����a*Hh��
��D":3D'ha���+��@��HLH�@�W�wȇ���$4������S���"jԀP�҉��v��
e?C{Yu��v�Mޗ���Ԛ*uؾ`�7`�A��
aܻ�� y���/��̺"���D��V�55�B��j@	�(q_�!�|��\�z����
�h@S���3�C5f���2b�Ď=����ЭY�&�P� ���5�=K��zSM|�)~�NI=CU���R�6w�.�ꎂ#��,[������5��SE��mm���p�n�	Ro��a7P�˗.E[Mͩ�8��:{��y���Ԏ4%#��L�rϬ{���Wk׺[��r|I��R4fD�Ą�t^��*v��J�z%�Ȼ���ҫ��&���,��b����֪��d%��k�����Oye��=�שc�f;�ܾER��ެ��I���e��Ym�~�W��4y�C��M��m�Y|�~!K����2[��z���wZIi7�FMn^�fް��Y[�-���v�/FV���&̘�Vn";���[�j�V��WO�����}��Y��u��ޑ��R˽D+�z�z�}v�,M�	��ݴ����{�=?m�,Z�Z���u���Nz�յڪ�K]���U��?�KLM�D�JNwF~��Fv���:�w�;ԁ��]l�کG��T�zg��8�SD���,O����?G�ɦ���̖]�/t��I�ى^X�ֶؙ�\׮~o'�d'�+)9}��a]'����ݱ��®��+|������ڵNX�N���N�zY��ɫ������͘V���f+|(�?�i����\e�w��v}���r�Wb*�ߣ.����s$fy�1����&n����\|�,�8j�,�nK��-Qvi�4�L�w���~��6��#�u�3~W<���u��[�^��V��$Ǘޠ?�A�l�N�X�9�X04߹�^,��N@cHu��91EeĈw��+ү�Z��i܋;�8��]6���s�2R+~�����r~q�ߗV��*Sx���P�r�Nt��W �/ ���FT�svH�(���?�Es��r5�4�u���No�2�Uy���uJX�����lg�S(SK.�2���Tk��up�F�)s�b��0����܆K�SV�z�[P������fҤQ�)G��0�2B�Nx�2����*W/�e��@?���-{I�x��V��~??o�W�v)ʔE��$`b�����h��3 �Bd���V��ϓ�<����W)r����������8���q��
 �76r����p?��'�"(����@��Pn:#� -����>�T2jj	н�!LX�[(=�'�\���.!�a',	ݝE4��o���%��1��껀�y�IF w���a�`�b�'�:4�p =av��;��A�:��z�A�    �Ai�gޒ�=-�,L ���s�鍂'L��>P��ZU�(ȍ'^@� ��V����h),p�&D/��n%�QTP �9Yu2��/�JI"�,E��>�$ν�{B|!���DA���d��vf�^H���Zu�"��¹��	�@O�{Ӏ��r3�6��C��t �ĺ], >��DZ�9s��P�Բ)`���@F�R�����-�RO<ܳ1�"�Hأ�V0��	�I�ї�ͺ@˽�Bl ��_�G"1����1{
���MLͭ���!!�A
R�L�0��x$�[�Ɩ ��#{��c����6pcRL��lL�\��n&[0"����� �~~���04�|�'�A<}�_0H�Gߏ�f��b�ul;�� ��b��O�'���N/�^�$2����tNu<�m����dkY��2}�� ��;u/�������u����R?y�x3?}�FR�����]������PP����O~���?�}���G�kY���O1ߦo$	`f�����l껆����R+)�޺�m�Yg������D�d�c;^������X��	h#F��O���9Ё9���.�ڲ�z�pa2����v�^�_X(޷~/v�c��QW��DԦu]��lKK�����)=���z�k��F}�q�nl��n@��'�I�WHj��߶����7�#㾠�9�ڃ~�����������[­��p쎷��k�[6p�k��zï�z���������0^��n��J�����ew��0��%������J�9-��}]�5�N�����b��死G���b�x�6�z[lž��,��f̦�d
 ��bK[���=-���
(a�A܂��W�aB�i��*���n�7q�e�~mw��.��N;�?�Iǝ*����m�#�ϗP�!�^�򽟟�W�f���F��TKlx7����˽}W��\oT�ē]�a�����G+��~��dm��������rw����j׾k\�zX��Ӏy�XG����Z�O�2`H�rK�/��~-�';2��~5I�^/�֎��Uٺ��|���˻�W��z��^P��UXLB���i��;X����:���Ͻ�Q˸^��b�W���b�ܚW�R[՚}������&�aՆ��}{˓Ws���ϛ�B����L���$�����f��f�F"p�Dm�[��o۵��q���sp$�Q�K��]�u�٧~8!����u8����j�������W a���n۵Śy��Nو�sEIiр�@�N�׿�o[W�m�Z���o΅ x  8�인��U��6c����}���7�xn�s}�s�j�ڭ{�6MY��Vl�]o����e�]fԓjf����_ۯ��g�۾W�%<�7�z����_��H�t�w�7[Y��B�(�|���}��\�Je��N��}f��C��%F�%�0�9'�<�?/܂@�?�8��M�}DX][3�D�Ny��v���ՖZ���(ٍt��{}��.��<W����Y�Ď��<�S�~7��5?���`y�W�O����w��Yؒ��nrӌ�nm����"d�Ȟ
(�c�W����߲����~��sC;��.x�m�i/�nc�{��Y��A��ʋ;�0�+F,x wl��nZy5t3͠}�W�5��y�}o8�*��,a�}IHX�;Դ��oX#���C2Ѐ��δ�w!UQY"�Ⱦ$P�S�q����6|�[��	��D��**�ح���S6��FMK����+4�@��T�RKj�w���s�W^_XE%K����?�����@�����q'�/̽h�h4�� ��|���,[���:K��}ay�t��[�z�\�s�&P���]�'/;�k��e�G�<�׽FM�Y�O�{��2��^�X�S�[�%��h�S�XiGS󴷕�s8�kU�ܒ7�N��óm}�hN_�0�7L�|���[Y�uK�z��9\���Y/y�7��Ӌ���_�;�[ԗD	�nx�L��YЭK����T�����l����W&�������K*kx��Rk�w���h�M\�>-�P���m���^0�����~���{_��}�k���y{g�rN'�'&[�杗�Ӿv�7~�^k�~���%�n|7��߷�����[��r�|�@�Y�߷��l�}g�F@��_�]_�*��bB����Z4��S�^�G���L������|�,[�k����讨�� ���Ů3�M�FA|�0gf��ac�9���[�}k��|h�&#`  ���'�AF{�sP$�/��.�X�|�v���|k��V8m�}�v�٪u�{c����Y*?�E��mr���ˏ��O��7+;���u�:�>s�L���V>�g:*Y4��g_�[���Oݻ?�4e"G�����ߦ��6�{�gGӺ[)y#�MW�q����2x�߯|�'m��3οzW�R;��9}f�J�|.?��'9u����~׾���?khaw��]�3fkӦ��2�2}:�ju)�Ȥ��>iNq��X�&�%'�tD�0 ��q2�Î�<�'�Q�K��t�'�"` n��靟N��pB�2����Y�����@``���`�r������A��ߵ;�j}�Q]�_y�ԨV���Sp���]yK�W��~����21Yɥ-=�I/�5�W'�h�c$��<(�@��M?���积��]�ꗝ��='UR�2ed��Q����ާ^�i���&=^�{�����Jw���Җ^y/���|]��~�${��@*���oyWd�mv�%����)�o���7x�n�k�1���  H؝�H���?a���j��N���X����lS/��s�{ͯUk�Gn���l��������߫_5;���W��{�!b�?w��o����}��t?������77ܻ����[��^�������u]�h�2����h��*����g��gb�k������_;v����j��̚ �{��;�޷����~��j��н��� v���M���+=�������ޮ3]`� 
�̾��v���߀��tZk�ό�+o�=��v�vfo�$�(��{m���_���������ӫՍ	+k\��po��N��+��)���v�~VZl��J�����[#�v����wQ~��*��D����tqڷJ�����SN�HH:.?���M��5�����W�vn\U��s��9X��u��2�.�{e/p]���[�JU9G�� �����f��}�\y7��]/�Z��^���]z�׼���x�~5�	G��p������\�ݱ;Q�v�>���?�
,_W��;��;���G��������ZM�	G$���l�2|�wv�]~�-�XOXP�i�dd�;/�ƚ9 @�����m\����o��������#��0��@`$������:yG޵[�^C+��+���ԙ@�]N&���&rx����2./?��
�@ �xJﳱٷ�Q��;|Cy�nH�]P�y�[r�qu�/�w`�d���׀���>?���pOZN�B�2/[���D"/������S&��=g���7=S�t�����=5�E�f���%�]^�f:l��Yo����9)�dqx��+�$LD��&��=r���F�a������Ąh��L�	,
8Q4�ӊxEq	O @X�݈��K �MH�+JL,�v�r�P�-�&�������#���#�)E8������ݟu~�W��%̙��=�����V���
�>��Vܜ��5�$������o�����y�W^I[��w�:���^�B+:{� C^�]����	��i�E���p�|ɶ�V�{־��M�=o���Yb����_��^r�2��-�)�.�\���Bݷ������%yZH��Q/��1�6����/�~�g}s�F��*�/��efk��Vן�L�W�V���P���6u\���P�R�!m�>��mn�GK+C���獠��tn�&���������_�����O}����u���������׿�����V�TYy��v��U�B3ߏo�~a.����\�T�JM�x���������۾oY	�f��g��[��I�:}��������'���[^}�Oj'��N��;���������|^ݫ�L�J��ʵ�2�ps���qź�wyڸL�JJ�w���y��e�^lm	�n����S��;G�;��Nw�����	'!
y֏ݭ�������я��#�1�a�4 ��[P��{/��q��Iw����7b0]$R87��6��L���DBY��w�S���5���p�پ��������5�)���3ן������������[��7k���:�HҸ�X+�$\�[	9-��;�f�����?�T:��w����{�{���0a|e��n�s��5[��0�������~������?�>�j��_����?o�����d�g�MA'H  �)F�G��Y���n��@/�?���)�4��v���|{�]��x�6!CM���S�Ƶ�;��$�	��I�O��'5��B��]����7����LJ��dw3#�u�~�:�3Ώ����s�������L~�'!!�; ��y�-�v�y�hҸ�8�^���w#Sc����i�^�� ��D	��w�ۋt�,۵_��^�
���^@MV����*P�}�@�<���\#��%ͽ �PQ��RAw6a�u��	 ��]YY��$m�_����W�0�ȹha�����U �����pBA'�����x�UjW 姜x}p%�f�G��0�`��A���\�&�WM�@*(���>�-��<�w	|���DP^֚����>��E�G#0���(ɦP�%-���~�  ,�
C� � ��U�7�D� ���f~�y�wP�ye38]�yh��eB���� Nmu����	�q���� �BA %	�$K�e�;6���6Ұ_��Y"�W p�y�C^��*�f�ǟ`1Y�� �F���RM��٦�]���y���a(�BL$7E#h4	 $0  `�f��W�>.�@B�>$�ͼh����-��@ �x�  pa_�����V 	Cb=��3�1IjJ\�t2� cd�4 ��{˷+}`��.5���ce���9����������3?oA ���0 ����᭫A�RS
���bO�s�F�JR&IЕ� 55 ��&Vϕ>B-A�F���c�����������f~�  �dB� k��2u���EcSS҅��0�q�9���[�, B�b!�GWJQ�������v�0#��>$��!{���]��K,	�V�����+�pC��@	�S�ʻ��t`h���zv��y��{�܋��F��h�������
�>�I�6"O�>��x��_�}�ׇކ{���vl�`�Ʌ�^r��q'�F�(V��( x�N�jv��[��r�ɡ4��+V�%qr>`�0@,�C` �]����>���Ԯ޶��8�|��KM��TT,[��
#I�����t @�W�[ ��D����!$�kg�m�����s�V����fr�p��Bܑh� �9�`4�+��E�=+H�������������HD@�� F ���}�S�ڨ��ƽ�s�3�ʻ�{ыݝF�#�qNWM����ܪ�n�x��@,�vkJ��@��D�D
�E�0�TkW��j��P��0�ɯ� ���4����<N.$$�F�$ЍI�I����Fzۼ��)���V�^:n81,MB���#�ևID� ������x�td�S��q�Uzi��p��.���c(t'K�B�]Sݴ��z�>��<�<^nw !�,��$�E9�|p���INN�sh0�;@` �$51Y$7�%����M�D��t?$�[����^S�����d�*�@'X��FK�k�AA�xb�  	! B�8�j^7?}E�����2��J+���-`$ $&ޱ��v��["��u�����SNI���S� ���޽�-��3�ye���� y�s�
�8-�T73��F@��でNlz7�|�7z���4y'; �BV�~]��w{@4s����O��=j��C~+�8'Ͻ
 �C��u��w����a@��-��tu8y��Ĉ;�N�ɚ��3}NDO ��~�T�  �|�u�w=+׹�� h�`w�T�6�U��T�ⰹ����2��ګ��=5M�������T�K�,	#�@h�*U�rBSRp�0��M&Oq�� ,�7�b!��0��q�T�8�&J.���LF��P�k��"YJ���Ɯu��Z��s�,��eO'�0��������ԩ�4��)@���)b�^b�$��7�n�,m"� �ըw�@ ��d��Xzʖ?	�E&����Rk�v/��=��q���<�˱����X�s���i\��Q�v��_x�:Y�)r�A#~��938���U��:H6Y"���P��O3��^< ���
#��ɮ���"ʾ4 +�ݫ٩�L��npys%�8u&N��h������Es��`i]�5?k��T�rhN��(����]!!uG��y*��o��H� �@ �  �F�ZviK�;u7/�o�[��k�5k6hPir���9�8\i�@���kug��2t�Ǹ�vj��\�Z�x� �܋ 1z�ÌL$ �7��{�����K �d��a ��QF���#CF ��5�7��s�VC[�S�(�����Y.�o�e,}�w�n�r��nկW��W�^�U��@��	 ��{�9��F	н5�v^[]����=�%  H$��c##KAӖ�,��gXb�3|4�~]��[ט�z�F���s�n���ah��ݹ�;�؅���^�g E���DP(诤�ȁ �?w��,nϫ��L�q�Ӯ�w�W،	A<(��ۗ���P�:rڒ�}�ۏs��Ly�g�'��k���3Ь���[���s��#%��cvZ/ zr��qo��m��-9���90����*L��	�x8���*=u��M�~��e��~���rK��T�PWq��`��^��t���������h���S���w��{=�e�^��u�M4�Ά4�i����[��@��|A�t�/;j�6Z��]
)6�L	�c#�[}�;��f�N�W�qG��'�	�K�4|�ϰ����z�����i�8�&O��Um]�
s$:�G�ݨ�;C/��3zB:�%7�O���w������x�7cf���W]m�l�
7aHY�;��G� �`�Xa��dT�T2��B�[�%_m;�QX��Ҟ�w������}Go���qw��.K߁����iK.Oy+���}�o�_��_~+���`3�����_�,�m�m�^j^�yy�Wz���,}��,I�����(���u�������-�
��M�I�$@n}�25s����
t����һ��O%KDOvdD�Cb!��%2\�D�D�t�SB��s���}�mݷ�=ʄt������ �&�l��w�ׯW_a�����nz7��*KM�����y@#�R�'��ӥ3����e^;�ٮ3w�_�ն�f;�f*H=��"��ǯ�?�3�o�������Q�yK�.v�����<18�>�Lb�IR�J��<e��g�h������WQ��vl3
+P�+Bn��µi�}��}u�OH�Z��p��V>��n�������y� ����BnA�@�)� ��K�@�F	h�� ���L!�
x9y�gXv���js�_�&��rl �@�x�2����Z����u�jm�&���mz7�y���a�x��1��ɼO�[�)������o"���Q4M@ċ�<�o4����(����f������nu�v��)�	s�0gb0x�h����{{^_oS�`J%�w�}�4������vx�����13� �l �p/�[��-O@)�,�&�&�H ��G u�d�db�+��o��ؒ�O����V��M��dSc`ϼ��l�Z?�쮟�lo����������������o��l���,S*�ҕJ� AM �h��& ���)-(�^�)���g�����и]����͵��֧\�JM��xbx��Y�}���z����_o�n��ח}����7 y9�J�@M		�#D�@ &"�0//
��\�-���1���Y��vng뫡���mf�25�t* ���}����u�|��e�~�ݪ��[_޲����MwBz	���h4���NnXr(�   '� _h�����;''��=���Vw�����2�m�
d�|� ��[�f�n۵��߳�ö>]! P.�9)i�i�#�_��Ι{�p��u� ��-!���)#s���o�Rh 	�b�w}�ݾ[w���t^�����_�S��(!��)A� 6Μ|A13����RĔ2�)W��e�.  �vT* 4��쐙Y������	\{  (��H `މ���~�/  H�����()�~�b�~� ` +�� &@D�=��� �����	��p� �0Bb��=zR��Jx��'#"���;�c�����g�Ci�G@O��K���Ep�3
�jԈL���B�P,$�B�0�w@�DHC������`�1a��k4h�6�с�ɦw  k�
րfM��>�iɞvH�p�ր-R;����!Ӄi���	�q�T��]�~�a�ޟ�	6�@L�O�����U��J�I��۱i� ��A���+���cmJ0A'�� ����vlTIJT�M��m�R�����|�	�H�s;ǦP�*�+fR�j�b�δ�K�E�b��`�ĐD1���D��c����Dg��P�b���lg�0�����̫.�iR�d�;�U�zlP�ΌtƀU�k�v�	@'�֖i�؉'%%���Q��ƫ���[�a��R�A>V,� 1�vb��!1�����h'�h�i_I΃��w�{W[Sc�������gο+ؘ���0�ɧjUne[<v��1bttb���ްii�Ʀ�&%%9��L75]�Å�c:5��z�l~��!�ô']6Y�cŚ�*��d���E�dO�N�(A��l&5���M�6��!�&Ld~�7]�x��+ȫ5��*H0�0���!.��>�X%�$S4���X�`�Y-�l�s��IWp�ן�#2Z\a��$Jhiǆi�0�3ha�$E��56�bv���l�/�����b�؅&T���R��Y�I����ʰB���3&ddT��}��é .8��5^�x�qp�.�&���,��m	�]�%T��0J��cG�t�ؑN��n�L��c���Z�T� 8`��~ ��|U0?��ì�m�vu��}z�v-��� !""L�pĄ�q��v�Vsz�xw���pQ>�o ��ܹS��&lp�m�ۣU�Z�4��V�4	0c��Z��n�޷�v��"��'�����/v~+5 ��tw�)(, ��-�N���ݙ��.�+�6=���|y   [remap]

importer="texture"
type="StreamTexture"
path="res://.import/index.apple-touch-icon.png-bec44240503e0edb75d852ab0cc26d58.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://exports/web/index.apple-touch-icon.png"
dest_files=[ "res://.import/index.apple-touch-icon.png-bec44240503e0edb75d852ab0cc26d58.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
          GDST@   @             �  WEBPRIFF�  WEBPVP8L�  /?����m��������_"�0@��^�"�v��s�}� �W��<f��Yn#I������wO���M`ҋ���N��m:�
��{-�4b7DԧQ��A �B�P��*B��v��
Q�-����^R�D���!(����T�B�*�*���%E["��M�\͆B�@�U$R�l)���{�B���@%P����g*Ųs�TP��a��dD
�6�9�UR�s����1ʲ�X�!�Ha�ߛ�$��N����i�a΁}c Rm��1��Q�c���fdB�5������J˚>>���s1��}����>����Y��?�TEDױ���s���\�T���4D����]ׯ�(aD��Ѓ!�a'\�G(��$+c$�|'�>����/B��c�v��_oH���9(l�fH������8��vV�m�^�|�m۶m�����q���k2�='���:_>��������á����-wӷU�x�˹�fa���������ӭ�M���SƷ7������|��v��v���m�d���ŝ,��L��Y��ݛ�X�\֣� ���{�#3���
�6������t`�
��t�4O��ǎ%����u[B�����O̲H��o߾��$���f���� �H��\��� �kߡ}�~$�f���N\�[�=�'��Nr:a���si����(9Lΰ���=����q-��W��LL%ɩ	��V����R)�=jM����d`�ԙHT�c���'ʦI��DD�R��C׶�&����|t Sw�|WV&�^��bt5WW,v�Ş�qf���+���Jf�t�s�-BG�t�"&�Ɗ����׵�Ջ�KL�2)gD� ���� NEƋ�R;k?.{L�$�y���{'��`��ٟ��i��{z�5��i������c���Z^�
h�+U�mC��b��J��uE�c�����h��}{�����i�'�9r�����ߨ򅿿��hR�Mt�Rb���C�DI��iZ�6i"�DN�3���J�zڷ#oL����Q �W��D@!'��;�� D*�K�J�%"�0�����pZԉO�A��b%�l�#��$A�W�A�*^i�$�%a��rvU5A�ɺ�'a<��&�DQ��r6ƈZC_B)�N�N(�����(z��y�&H�ض^��1Z4*,RQjԫ׶c����yq��4���?�R�����0�6f2Il9j��ZK�4���է�0؍è�ӈ�Uq�3�=[vQ�d$���±eϘA�����R�^��=%:�G�v��)�ǖ/��RcO���z .�ߺ��S&Q����o,X�`�����|��s�<3Z��lns'���vw���Y��>V����G�nuk:��5�U.�v��|����W���Z���4�@U3U�������|�r�?;�
         [remap]

importer="texture"
type="StreamTexture"
path="res://.import/index.icon.png-8466b9836b3b13bcc45e53125321ef39.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://exports/web/index.icon.png"
dest_files=[ "res://.import/index.icon.png-8466b9836b3b13bcc45e53125321ef39.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
              GDST   X            �,  WEBPRIFF�,  WEBPVP8L�,  /Õ�(n#����3�1�V�){#F��S@\~r#�r*��|L@@
,i��̬��Hۦ����mۆM1e�d(۶������mѶm|����i�7Xr]�m�-.ڻ���HN�����k۶�6�c�sѣ�= E��yDP�$ٴm�1�m۶m۶m۶m�]}��m��Z��m�H�����7�>�[�$K�$۪�����e��A����I��tn��?�F�$mꦾ�W�6g۶mo���l�l�,�mg�t��&�J�$In�l�xX�`��o۶)O���W��������Z��.��0C�.����iw�pm$d[8��
$�8.��mۛ4����� S	��*3� n��۶�D���W��L�c�-L����mڶ�}�ڶm�~߶m�?���m۶����$I�3���s�������?�?��������O��?��������O��?��������O��?�������L�2�j:�����N�+�4v�_������jӜ�|[��Ri�;�4��N�#��0�+V)O�����$������l����Gj�b�Ze�Gj<��Qk�]�l��G�c �A|�S�|��@g�	9��]���b����~�x��#`5��A
�o?{n?M��2 &p	���7�d�HX�l�n=N\��מ�(����U�   c�f�� (hn����=]��z��:�7�fA�v�Bx� '+���|���(nDQbenQp �| ��E��+5N_<�L6�|� 'p��B�C����/�>��$&���L  �qw�AX�q �~4�+q�55*���ơ؁0T�AK��l�ܢ�ֹI�I%�[  �y(�%p^L�-x�K�I[�fnQ�Xm�h��� 2yp�q���E�7��w�  �	x �}l�,�����L�v" �?�l������ᖀ�P�(��p+�����D�$`�^�-���C%AJ��֡  �Ɓ� [Ƕ�R-��S�6�5X.Ri)����6�6��
)r�o6�JK��5�/�un�����-  ���� ��8� ;������s%`�^�Dw�,����OW�7c�Zhݽ3�5�U\���:���#��<�����t}$�g�_��۽(JBsm�`�"۵�Bp{}�{>�k��n���wzzgg[w5���҇�t)��������]O�l`�S[y	64��^�gͺK%G��lI��z&���G���I�">�f��x�:pԞ��	�a}E�_���7��@=�����M��z��H[DHbz�b��GG�l����/H]�R�"$�� �K_G��� ���"$P���тB�
� 8O@��O�@S�r��`�>�O�! W�+(t����`G`
�ƂNp�jf���X:Z����` �N� ���X���ς�8�-����$���������wz��- H����~�8��;C;R�W  �X���5a����׏���(J� g[w�_?�	��h	��2�gHq�r���x��S[}�V��X�0�A@@o8k=:=_(NQ��E���x�b=g��אF�f�g�/��	���͂�@,o���>�O]�����pF���Y�fZڥ(J�&-���6c�xxF�	�-n>N�U_d���H`�34��-�[�6�⿩Q�[@\�F*�_Q��Q�J�{�1�'�S�V/����}�����zYPͼ���D�[�j��Y�t9�CÍ(N�(ɫDq28��8�6]^���r��n7�  p�:C+A�������&PIR�e���>��^�DQ�7�����#����K���3
  �������t�3��OO^� X�w�z�a����]��}�f���X�$��N���r,5��`�'O�5��(J�25���끋�#�b"j<\� 	w�F��pQ,nre�Z%��Rmq�pj�� ��+��S��Ή����!C�^��v/��O����K�C���m�h5�I�����rL�-��� � 6��>�反C  VB�F�9@t�΢(9��;����\2�EQr,�<��>�w�~������}j �;���`/��c"����������q��ӄ��>��@�ٽ8�u�����2`�����/WA�mY�el���@�� f�g���3  ��!�����^����Q �-�Y� ���*Mj��4�-o�  ���rc$��{��C�s  HB��|$�N��M-�)�C��.����X*d���d;!�-��n ޼�Ǎ�U�4^�� �&4rJ%A�@2�-��l	��P���Ou��M�:����ƔR(�� ���F�o  ��:�� ��\$⤥]��-�|�[�e2y�}jY��=Z����U_�F]���f��jh�;�}l���.��or�Ԓ����\����Z�(N�{g+��ɓ�Љ�×�W�
���]�ʿ�D���ל���	{�y���g�F'kQ����W'k�E ��������.�LN�[��}��޲P��v�J��-���CGs�
^�Ja%��c���X"j��ܢ ����Ԭ�������6�'����.`VW�k�gl��e��/���!���M ;K�\E�C�]�/ K)�C�^��|&D�!؆��K6+�=ޡ&�	���B�
�>�����"��=e����߄���!� ��r$@IR;�z8}�P��<\�  ��������f�����ǦfK���B�^�b��� ���25��;?-rA34��^5֟  [�V��{�M�2 &S�=����| x/D��	�G�-��l	X�V|>�z�0��mF�%�`l�K!��d�� �g��g���~T�?<�� ���ϗC�V��FE��w�,��"oZB ��.���.'���X�g H	�=K{�J�]�w`)��B$�P�K���7�s�o<C�y ��C�W*�\��G��ow,
��yc @IR;�I ���%�����X�$��V xwl��$X|��-A�"K�ՙ�
��)��. ,|���w�߅��X`ii��Xi���G�?�w6 \�97� 8#���<(�����.�V#֪��C����  �ݫ��ѽ���!��|�6a<\�DQ��.�=&'C��� �uh+Ij�|{]�m �/�9- ���'z,'�_?�=�<D��5 �w�EI8O�o� X�WB��!څ1��#'�˛������(�WC� ,nr�q�Ǎ�M /����`@PpН��gl�LvP'p��"DQ��! �����d��}j��H��9{���1�:]��D�%���EXYD'����?��%� ��<j��DQ�o�:7���+A*��C�c��B��E +w��������x��-�R@o��7���7-�m�m�;�/�w����ѽX��beq�i�������?���?!=�T�n?Mdk�;';"�WX���������~8oq�a���CXcQ���5�X'a]�:��8�uh��������AQ܈�D}����ֹ�t}42�Hvz�Nδq�VS����0��M�Jp[�89�z�:IvF�����:W�/���ב���50ع�������Ny�+��U�����l��ˑ��E*-5ԞJ�Z�)Mj��TZ��]<X�i)'{y��ɼx�{�����l\�w�޽:}�P]yKD�<V����/����;���Vn=N<X����Y�wX�ʴT@2E��ϼz��`92s?'3���u�rX�o�\]�w02٘��{�y��km������!ۧ���._4�wۧ�D��'�|�d=�ם��������ǩǫ�����6
�Vw�@�����}�E �_/�~5֟��2~l���~<^�|����o��<O���3�*JM�J��ͅ�G�í���ܢ��o�+���b��i	����!/���"�rj}߱�{���81�����u��Ri���R�4�~��zjp�0�*�M�ʫ�_@R7��}e��,J�Z���A�x���ԬT�?m驡�V�l��(U�� '�@N9�������E!����m���3��J��ޅ���=Yd�;gt���lV������/���Z��銑JKAG[FW�"���?��!I�%c,[ru�&�%�O��l)��p���^��0e�����x�
�ѽ0�;A�fK�O0G\�	r�`\�y��g]��/x�6�b�ȸt}��㔀��	��'/CA:�\��N��C�Y�	_^�ܷIv��?A����OPO��;���K�ܢ�ѽH��d�RU�(�奯���Iy�ˣ(nTU>��J*-ut/���]
�q�PG?A\ �T�r�}�s�V��7�=O^��>f���&+�����QG�Jfis�d��ͅ����ќޙ�x���MVf���>�����Y�f������  �B�~��e�B�$DM����N���O�̿|} `���WĽe!D"j�;�䤭s��s���c["NB�_�	xQCA3�����2mz����(��0��\��QO�,h9?4�)瀵 ��lɞg�; ���ٽ��?�MWf���.
O�o?{Vw��S�����$L'��9��S��˼��y���(��ύMW;���݋�����W�=�K;�$�}l)���럎Ǎ곷�F%��:�Wr�of��&�p5��WB�K6*�V#+��5���F���ͳ�2DY�f���p 0=_��$�~��A����� Y������./@��s@�6;�K�Za)MjK�  vB�]�	�B �`9���B���c  HB���Hf��
�����S*
�a���
��d�yP���LQ�(�8�v� �N))�����Py���j�#�|.��P����,|�N�?���9 �"��)=P�l<[)���(i�2E �zni*�����Ϟ�V)���ҿ>  `T�p���	Xy�:�������ܢ@0�GȎ+e���l����d���G7g� 8}!�J_����΋����Y"N�l������r�~ �Bqli쀀���Y�t7��/����44�Z�v;��Cė��`���~�I�j+/����20�y��8�m0�s���`4,nV6������ّ�U�&��˛�l��G�}i�R�h
��u�&S�_�&����E]��H^��{g���o�"�n�_��s���a,�$�����rd<[��?8ۺ�(}������ݥ��x��p9��oq�$,��P�+> ��`~A��u^t���/�{�W'���lT��ފ�F���V}��lTRi���d`�35_:U�]�=~`:�x���k ��J��;�s���ƾc�+����Gϓ�Г��㗡�EanQx�2t�~,~�6�{y��0`<���k  |��a^@^`��| ��u�^ `�h��|�|�)�� 4C4��g����@��S��+`7���!�6��ݰ����)h�4 ��3=A�^
r�ԇ��z@�#a$���Cs�� 7�.'�u�W4A���~�����r��������������>?S����9h�l Lu|.��N�~�r�Es���@�M9!�-"U�F��^�T햸a~��U�Q""����+�n�r��"uH���z�~�����t2�$��F62Qm&A�adG#�b�7T��zG�h����k��ll��z�J�E�ǉ��0����D��8�l�o5���n����#s�čXl;�W�=}�v�,�:�>64D�� �:?b�cc���L���t�	*�m�b�Xԓ���h�E�@J�@Q,4`�-�%t�>�p�n���7�H1�(�|G�'���2?�����:V����T�HS(����qR���1�/H5�r�fo��՛�SxY�ˢ����ʉr�a���<��H[L: �
�'��A�d7T9-�%<��b7���k�sذ�ڠ6?�E>�)�=�w!x�ǩ�C1�
�(*��A� ���|M�kY߂'�� �Į��#���؛����Ӟy�O
�'�''B�@���#:�db[�"���&����>�*����i�@[C�6��[�0m���B�-��C:B���1Z/�S���W��p�W*۸F�	i��7��xdN�
�3� �zZ���`C�n`���ƍxv(�#."=x�Hfﮁ |1�]8i�8G�m5?�7�?�z��^�6�x$LG\�
i���ۏ�ef�����]��K���؍4&�I�lD��`g��mR�L�4�B:�huͷ�ݑN��و�'�tb�O]��l�$AlGZa�~�nG`�$��EZ��'z4�̱�����	z!���IKA�@��DSj�Ė��ˑ`$��}�!�&."ݱ����R/t�x�:������O� N ]8)K�!���;���E�c���,�A���`H�m��x�צ����� ����~�J�]���\΄��'����l�i�sL��f���=�TQ����cc/�E�"����x�B&N@j��<���>��~u�g@*kc��^�_�dh(�C��5|r,�0N�	��m�ؤb��H	%&�KI�c9�ނ�J'u�e��{��&@Q��b�A*ʘ�g�6�kϙˢҧ�M��c%2{���y�� X=��qs�$lVۭ��[.j�SU℉.*��c0����%\�J6�� x�Kb���<���.�|��&�Z�mK]�c?1m��˓��J��+2c��r7{��q�]�MxT��P [�f=3�t�]�yW�:%��ԟH�]�W+��\��%6���:
��m�2m������.�V�(��mļ�Z�6��W8r�����J������T�sz1�r���%�aj�41ū^��l���ѣ�l�Ē��ϗx,��`06�NU��)v�''VNl`._L���B������+;� ;�bg����pB:�s+��M���X�{c�ɢ+�j�}�bj�b������� 5ud��]�����ܛW�՗u%��xS`�����z�Җo�j[���V�+��l|<�ʻ��ύ�5X�:V��=��O�zPQ�G�Ʋ\��^$�8웩��XY�;-�uA����}0*9>�_`��t�������]�'u�cI�&�8h�%���[�>���T.e߃4�)�=���
bm�UN%���䝷��V`�����Ӫ����:�-�I�Rc
bU���W۾����5����Z�J{z��g負��b!��+j�~��b��y�)1���V9��eŞ�؞��]w-%O�S`����m��I,�\�����_��J�hQ=q�Y�(���9P�u�*'�����	bzbz�3+�/�@��_+ӗ�+С�??(-0��
bQ�����[8U$��@��˵��&��!o�LN/���o1�rc�8-�B�/0�"6u~p���ߘ��]��t�z�m+�}&R���I,)���zj*������_�hV����ښs
���󑠤���/���KZ�����e _�[m��w4��k�P�}?��H�q�]"�p]���U G�<q0R����rg����dq�L�V`���P��V�g�dA���=�<<LBJoI�y�dw���8
��`�҅�����X����OBl��bI�\<@�D_@�Ao�L=�o )�*�FO��\�O��|#(x]�e�7�}�H��� ����� !���Qb�>��+���`�vHw >I��#�ˆ�r9��N:�rK�9��>o۝���T���P����g���_ӅW��]�:y'%�T�Zr�]A)6�@*=<��'���0�
o�t�
*�Re�
���Ը��X���nbR	�1�bK�*x��K7F[jk73={�.*�� "�P�xSy�TP�����ߟ%U�G*����R	1	��~F�B����5:�^��������c,R%N3^5�ڋ�������9�SeC�#%NX�bR
���!Z�jrd���nr����z��3ʑm��)�����"e�ci��(�Z0�.sLA�C�fg�j�#�A���K�ᴬBI�X��wh�8� �h��v�:7I;�=Ob�v蟟>C4k��t&N�F�."?�BK�[��)"����
-�y�,�ȏ�`�,��Q�-�1*8���C+��e�:�[�/�<�¡^1W�ѓ���I�M�Л.� �谥�:Q�A�����B�R��j�t�~�M,��4j��Y�iKp��C04�:��w����6�Ir'�A/�����.T��ݧ"�0�=����NY��F�!V/��u�T�����M�-�9"����&LoD(hB�tD?��Z��Tu�qs�]J2���׺ZLc�w|�S�����o�<
�c$���nҭ%�mlk�.�����#.�)�o��܆�w8�Rg��c������� �������vb�O������|�#ۂH�-���_��qX.���Ώ����v)�t_}�l{���:~p�AX�W�$իs,B[�-;λ�g,iǫ/xk�\�vD>̏�9[�*b����ؼ};%��B�N��<?
�¥�kF�_߃<��Q�2v�z�	47���,U�K��!�(�-�(�r�,����Ʒ���1\�r���g'̗U�j�9QJ�rn�A?X�ú�� *��ٱ��\��_�*�#?�G���������y���i��S\��np1rb��MB�_)��VYK�����D����"7)�����MN��^��,�w΀J7cM�A�@$���p����s�s��ֻ�b��vK�l^��x�=?y��U ��і5%�P/v�C�ti���e��&7zR�b�uS�?�G�g���&(K-���S�t�X�����"�]1Υ_���nR���œ����^pQ2�7첽b��3�ba�\��uu2�~w�G�����5��0��{�����\�w��I�c�P����߬��x6μ����!�b���_��!��a2v�ſi���4��C����������rI����f0�7O����S�Ţ���Ϳ��>�����E=o7S�S�-���o��Y�YZ�)�F"-��b�O�k���x��!��P�]\|󋧦���H߽�1��l��lΚ��iu��`ps��C��f�X�5/Q�\_*m�f�)稹����a>$O;��C�a�;V.���cq��i^��R5�X��t%�s���=xȸ�; 5��3\�.R��/���.�۸7���w�y�����Q4��/F����L�9���6ލ��>#߆�����i\�ߪ�l�k��u��G�x?�����������؋Kyu7Ɨ�����o&�~,e��xy����������u�ݛ�9�I�[soك�h>.���۸}��yg���]���Qq�����i\��)��Tƹ�ŭ���E$Z�W�B{IKrD�\'�"�q%�$�&�_e{=s����D"��_�W�1/_[��e��IE�?�=D��®i�صa�@b�K�&��ۺ�+� ����^��������ǥف6M[�
�	�E�ƞAK-�T��|L,��yA.;�vjIƜf��GL��;V�<�zY�mr�r�E9U���/�̜f��!UĐGVpV_~��ƣL�+��u�Ui�F\^�i��^�]g�Kx��X��\����&�!�y�"�+!�A�u!`�;@��P�+Z�|`n�����IGV�m"��KZ��$�aͷ�d�����v̪�(�p2���^����N�	U�(�����I9�7��#��0;C/���m�J�h6ӕ�=�0Z0-������~܇1?��$�Rnj���5����$1ׁݶ�L�w[Ju�K�0c{��>�{�Μ!��,�)����O&��ă����/�:�II� E��e���3A���s���Ed_�! Qn���){Q�4f��͎ns���d�v��W����R��6gtm q�Z,v��;Qr6)A���E;��5�b��Ē�M�'���3�M3���PU�ʵ�]7'��دӜ� 6�cN�Vw�*<���$r[�cJ�����$�2>�*�Rb�)�*I|�����"q��@O����o��V�F�AQԧ�w�(r~�t\a6(�;��EC��MH3��EqcܨF$��͞k&bi/�t��-ƈ�����2Hf�8�Tr�e l ?)�ɉ]���%S�>@�]X�[��L��������S>A�|kF.�U<�u�Q-z�bw�������� 3����$Q�ܡ�I���׍���{��E�i�cy��h�����a�1(Ltn1:M-s�Hm��4����7�^�?r���ңIQz�/��dç(j=�o��xAљ��Y�}�V���AeD����eZ�ij�S�SۘM�w'������2��f��B���'NZg�xT���h}���6F�`�5Ց��y | �����c�,Z+;1XOޣ��T�>��ɀ��3#?��2����a�D�}/!"|�H��XN�t�;y(�7�L&���O2m/x�]�5�!0:Y#<8A������ZT�����)�����T}�cL��4#?������Y������_��ٙp��۝Y��wj*:11��Ё|��a/�?����&S�4biՙI+k={������>}s�:��E61��IuqdZƑwE�̵]<��	k��Z�=��da2<"����}�=v��s�U�)�c���e&�	`
����c5�ԑ䅎�9X�E��Um���%3ő}��X��Q��T�%Յ��(�y���Jb�Z�����d��'[:0$�ĉ���۔��aO^��\Xy��J�WoÚ��ё�!8sx��.Z��,U�����	�N"I0�i��("���w�O!"�NޥHc�[	���)����ߵ\��ȎX�I�G_|d�ٵ�mBҸFA�>�����ҷE��ה��"@$��Yu!�}�2�o�V�El�&��r�TI�����Y0A�l:ɐ�ŵ�!Y���H�+Յ	/�Y���Cě�i0l�P�r��i�R1��Q�J:!����Z����v�lݬ��Bace��,�,���3��KpZ�kƱpK�Zt�������&Ɩ��]} \��(&��Ƀd����G׳�R���md��3~�>ZFpؾ ��Y�js�����e{椹[�=�o�2��p�vVw�V��s�Lq���g�+�}�a�ߤ��U�5'_�Y�{uN>��������E�x��K�AJ�I5�4|�WAh�Fyl�If8)��(�n<�B��W�%�6��7���x��e��G�ې拿\\�'��_	.n���_������G�����G��?��������O��?��������O��?��������O��?�����     [remap]

importer="texture"
type="StreamTexture"
path="res://.import/index.png-d03311572afeb237347e3aea48014cb0.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://exports/web/index.png"
dest_files=[ "res://.import/index.png-d03311572afeb237347e3aea48014cb0.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
             GDST@   @             �  WEBPRIFF�  WEBPVP8L�  /?����m��������_"�0@��^�"�v��s�}� �W��<f��Yn#I������wO���M`ҋ���N��m:�
��{-�4b7DԧQ��A �B�P��*B��v��
Q�-����^R�D���!(����T�B�*�*���%E["��M�\͆B�@�U$R�l)���{�B���@%P����g*Ųs�TP��a��dD
�6�9�UR�s����1ʲ�X�!�Ha�ߛ�$��N����i�a΁}c Rm��1��Q�c���fdB�5������J˚>>���s1��}����>����Y��?�TEDױ���s���\�T���4D����]ׯ�(aD��Ѓ!�a'\�G(��$+c$�|'�>����/B��c�v��_oH���9(l�fH������8��vV�m�^�|�m۶m�����q���k2�='���:_>��������á����-wӷU�x�˹�fa���������ӭ�M���SƷ7������|��v��v���m�d���ŝ,��L��Y��ݛ�X�\֣� ���{�#3���
�6������t`�
��t�4O��ǎ%����u[B�����O̲H��o߾��$���f���� �H��\��� �kߡ}�~$�f���N\�[�=�'��Nr:a���si����(9Lΰ���=����q-��W��LL%ɩ	��V����R)�=jM����d`�ԙHT�c���'ʦI��DD�R��C׶�&����|t Sw�|WV&�^��bt5WW,v�Ş�qf���+���Jf�t�s�-BG�t�"&�Ɗ����׵�Ջ�KL�2)gD� ���� NEƋ�R;k?.{L�$�y���{'��`��ٟ��i��{z�5��i������c���Z^�
h�+U�mC��b��J��uE�c�����h��}{�����i�'�9r�����ߨ򅿿��hR�Mt�Rb���C�DI��iZ�6i"�DN�3���J�zڷ#oL����Q �W��D@!'��;�� D*�K�J�%"�0�����pZԉO�A��b%�l�#��$A�W�A�*^i�$�%a��rvU5A�ɺ�'a<��&�DQ��r6ƈZC_B)�N�N(�����(z��y�&H�ض^��1Z4*,RQjԫ׶c����yq��4���?�R�����0�6f2Il9j��ZK�4���է�0؍è�ӈ�Uq�3�=[vQ�d$���±eϘA�����R�^��=%:�G�v��)�ǖ/��RcO���z .�ߺ��S&Q����o,X�`�����|��s�<3Z��lns'���vw���Y��>V����G�nuk:��5�U.�v��|����W���Z���4�@U3U�������|�r�?;�
         [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
            [gd_scene load_steps=4 format=2]

[ext_resource path="res://sprites/Bullets/playerBullet.png" type="Texture" id=1]
[ext_resource path="res://scripts/Bullet.gd" type="Script" id=2]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 3, 5 )

[node name="Bullet" type="Area2D"]
script = ExtResource( 2 )

[node name="Sprite" type="Sprite" parent="."]
rotation = 1.5708
texture = ExtResource( 1 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
position = Vector2( 1, 4.37114e-08 )
rotation = 1.5708
shape = SubResource( 1 )

[connection signal="body_entered" from="." to="." method="_on_Bullet_body_entered"]
   [gd_scene load_steps=3 format=2]

[ext_resource path="res://sprites/capybara.png" type="Texture" id=1]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 16, 16 )

[node name="Capybara" type="StaticBody2D"]
__meta__ = {
"_edit_group_": true
}

[node name="Sprite" type="Sprite" parent="."]
texture = ExtResource( 1 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
shape = SubResource( 1 )
          [gd_scene load_steps=10 format=2]

[ext_resource path="res://sprites/Player/giuratore_walk.png" type="Texture" id=1]
[ext_resource path="res://scripts/Player.gd" type="Script" id=2]
[ext_resource path="res://scenes/Bullet.tscn" type="PackedScene" id=3]
[ext_resource path="res://sprites/Bullets/gun.png" type="Texture" id=4]
[ext_resource path="res://scripts/GunPoint.gd" type="Script" id=5]
[ext_resource path="res://sfx/shoot.mp3" type="AudioStream" id=6]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 2, 3 )

[sub_resource type="Animation" id=2]
length = 0.001
tracks/0/type = "value"
tracks/0/path = NodePath("Sprite:frame")
tracks/0/interp = 1
tracks/0/loop_wrap = true
tracks/0/imported = false
tracks/0/enabled = true
tracks/0/keys = {
"times": PoolRealArray( 0 ),
"transitions": PoolRealArray( 1 ),
"update": 0,
"values": [ 0 ]
}

[sub_resource type="Animation" id=3]
resource_name = "Walk"
length = 0.6
loop = true
tracks/0/type = "value"
tracks/0/path = NodePath("Sprite:frame")
tracks/0/interp = 1
tracks/0/loop_wrap = true
tracks/0/imported = false
tracks/0/enabled = true
tracks/0/keys = {
"times": PoolRealArray( 0, 0.1, 0.2, 0.3, 0.4, 0.5 ),
"transitions": PoolRealArray( 1, 1, 1, 1, 1, 1 ),
"update": 1,
"values": [ 0, 1, 2, 3, 4, 5 ]
}

[node name="Player" type="KinematicBody2D" groups=["friendlyProjectilesPassThrough"]]
script = ExtResource( 2 )
fireDelay = 0.08
Bullet = ExtResource( 3 )

[node name="Sprite" type="Sprite" parent="."]
texture = ExtResource( 1 )
hframes = 6

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
position = Vector2( 0, 3 )
shape = SubResource( 1 )

[node name="AnimationPlayer" type="AnimationPlayer" parent="."]
anims/RESET = SubResource( 2 )
anims/Walk = SubResource( 3 )

[node name="Gun" type="Sprite" parent="."]
position = Vector2( 0, 3 )
scale = Vector2( 0.5, 0.5 )
texture = ExtResource( 4 )
script = ExtResource( 5 )

[node name="Position2D" type="Position2D" parent="Gun"]
position = Vector2( 14, 0 )

[node name="FireDelayTimer" type="Timer" parent="."]
one_shot = true

[node name="RollDelayTimer" type="Timer" parent="."]
one_shot = true

[node name="ShootSound" type="AudioStreamPlayer" parent="."]
stream = ExtResource( 6 )
volume_db = -15.0

[node name="Camera2D" type="Camera2D" parent="."]
current = true
             GDSC            @      ���ׄ�   ����Ҷ��   ���������������Ŷ���   ����׶��   �������ض���   ��������۶��   ζ��   ����������������������Ҷ   ���϶���   ����������ƶ   ���������Ӷ�   �        mobs      friendlyProjectilesPassThrough                     	      
                        #   	   ,   
   -      /      0      :      >      3YY8;�  YY0�  P�  QV�  �  �  T�  �  �  YY0�  P�  QV�  &�  T�	  P�  QVY�  -Y�  &�  T�	  P�  QV�  �
  PQY`      GDSC          
         �����Ӷ�   �����϶�   �������Ŷ���   ����׶��   ������¶   ������������������������ض��                         
                           	      
   3YYY0�  PQV�  -YY0�  P�  QV�  �  P�  PQQYY`     GDSC   '      (        ������������τ�   �����������ض���   ��������Ҷ��   �������ض���   ��������϶��   ��������϶��   �������������Ķ�   �������������Ķ�   �������������Ķ�   �������������Ķ�   ����������Ӷ   �����¶�   �������϶���   ��������   ��������������Ķ   ��������������Ķ   ����¶��   Զ��   �������Ӷ���   ����Ķ��   ��������Ҷ��   ��������۶��   ��ض   �������؄�   ���������������۶���   ���������Ҷ�   ���϶���   ���������������Ŷ���   ����׶��   �����������Ķ���   ζ��   ����¶��   ������������������޶   ϶��   ���������Ҷ�   �������������Ӷ�   ����������������Ҷ��   ���������Ҷ�   ����¶��   �     d      �    �������?            ui_right      ui_left       ui_down       ui_up         Walk      RESET         shoot                      	                        %      ,   	   3   
   4      ;      <      C      J      K      Q      Z      a      l      s      t      u      |      �      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &     '   	  (   3YY8;�  Y8;�  �  Y8;�  �  Y8;�  V�  �  Y8;�  V�  �  Y5;�  W�  Y5;�  W�	  YY8P�
  Q;�  YY;�  �  T�  Y5;�  W�  YY0�  PQV�  ;�  �  T�  PQ�  �  T�  P�  Q�  �  T�  W�  �  T�  �  W�  T�  PQ�  YY0�  P�  QV�  ;�  �  T�  �  �  T�  �  T�   P�  Q�  T�   P�  Q�  �  T�!  �  T�   P�  Q�  T�   P�  Q�  �  �  T�"  PQ�  &�  �  T�  V�  �  T�  P�	  Q�  �  �  T�#  P�  �  R�  �  Q�  (V�  �  T�  P�
  Q�  �  �  T�#  P�  T�  R�  �  Q�  �  �  �#  P�  Q�  �  &�  T�$  P�  Q�  T�%  PQV�  �  T�&  P�  Q�  �  PQY` RSRC                    AudioStreamMP3                                                                       resource_local_to_scene    resource_name    data    loop    loop_offset    script        
   local://1 �          AudioStreamMP3          �+  ID3    rTXXX     major_brand dashTXXX     minor_version 0TXXX     compatible_brands iso6mp41TSSE     Lavf58.20.100                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ����                 Info        '. !!!!!,,,,7777BBBBBMMMMYYYYdddddoooozzzz����������������������������������������������������   :LAME3.100�        �$WB  �  '.�Ց                                                                                                                                                                                                                                                ����  Y�Q���#��k�1�  �NҨ�sP�	 ��B b�8�[�@W8A{�w�����
�~����b���   " Gww?tDO�����  `b��DDDB���������s���www� D���U��%[�  �,��L��H#+�<�>���] �)�^0�� �'�K&#�R�r��Oî;��<�7�]í�Q�X{�M5[9�Q�x����G�bj��t����v/��	E,��J"1L&%XٿM������z�W{��H�6��ؙ���Z����)��v7�K��(!�{�._�"�%3����y�����Hr�R������N�J�����r�y��ڿv�U��?���*�0j�k�\�XX5�%�'?.F�����KE����}��F �#"؛>���� =�H�����u�����qfr�n�/ϗmi��1�yNl�(�굡�>��0�6�;.k"�Yj��;�c���uI�<�x�:)C~�&�d�`�Zp1��s���<��Ƹ��-��MN���*F'Hо�z��52��ePq�`���8M��=�oX�3v�V���l�ԟ:�,.��k��w&nPC��X  Q4�Fp�	d��S�	�c����g�9R�aȲ]�	>��L"5t�ߕ�*����.j�s?F�M%[[&���_�s&8iܛ�j�OtM������^\'�	���w=-bP�z�����ˬ������֫Y�v�Oe�[(\��'����͈��Ɖ �H�k���%�#\��O�E�Z ��   9��fӀ�LP���02�0)(��^YE�Nfl���{Ȝ*K�EʉT,�:I��������G�=�­������y�r��1uU0#X!$��l8"2)з:��[�R��ng����D~�`9��C�O(��R�����A	 ���'�}
�C�T�~�)��i��������|[k�R#ә�u��8)K�w:z���.��կ����Do%y`��HWN���lٛ�tAbQ����/8���A9��oK�j��6�-�B�������0��+���2�С9B�Z����L��b)Q�V���n�+�O�;;$���;)+0�r�r,CRI-sQ��~����'��W}sa�(����
ҩԎ� zB%2}��h;y���Ce.e��=9�
�暯�djU O�x���H̸$
�0���m�В.Ba�l@�D�L|HH- u��+ӓWHGS�2_���Q}��_����#��M�>-��$��!��RJƲn�}��qο�y���`�A	� �e�bi����:�����=�kkՁ@����aֹ �[��e�vb3���R�`R:>�H���j z�j�L]l�0�ȸ�/h}\�����]��Ny֨M����k[�ճ�]o
RAn�_b}�����w��l��l��zhEDƆP2��o9H���p����L�,�� �<*�Te�n�+5���cSf,�鞒LiB��R?q��ȟh˜��# ��)  p
�8-G^�?�u �� b4����8�}yi��tE��������`��{����g5b�T� j��Q,y@L�i�FJ���[����d(�;���dKr̋��:��[Q��3&[QI"��=Hn#0�vD�f�:�Jl����!���Q�W8���� �_��Ͳ!�m���>�z?�&>EE_;}!��\��ݞ�'?d't����ub������Rz(۴���5����sz��2�.+]E<9���`��������Dĝ��@������)�����h��*m\�&�e)Q컍8tj�H�܈+7u�H4�q��70U4B�dDǼ�֞H�|R��,�`�4�5TN*�Xf�����+��k����#��a�+fGpc�e_{��eu��;�D��f]��K��M��%z��t��najYi��E:2��	��r� g�i��:��Ŵ��.�'�H���ܓ��$���s�.�Ւ�����m}}`5� ���,�겚�f?�YJ��dʔ�|o�������w��7#����S^�$J�֦H���i����/�6?O��0���Yzr����J���i��s�ְ�4�h�.��}%�E)>���i�$�0ۘhV�)D�g�����yX��(�����#�����/������a(gx�hԍ���Rcʵ*$������H$�#���q򴝘-�I�-!X�A6D;pL�D*�R�)���|� 2-(�%�V���'�B��)>j�RH���e�Y� 3�ZÂ�Q���<���
�|N5�Eh  c3��+�C�4�)�"v1�ĉ���Ce�v�pMX�㍡�Ɍ�=.����w�����K#	��z��'��##��o4���:��T��&�ͥ���XĿ��W.��FF�ѠË��O'���ྃ�^���u��zC�xP�}o�~��^��pXcϹ0�NUR�4�5EY�L�d�JNS�H�3&t������T1͇����ė  �_��p��$��ܼ0�9[�^������� �"�."B�d�i�D_�'��]'�&܎I�o�U�;)^I�u�&.KV+��������:8/�@�A��~�Ռ�#���U�����Pl�iud�4I�Kp���&��ƚ`���9 g��E������.
�PQz��r�OIqިS���CYNy�c�D��b���Q'Ug\�c�uܛl�Q��C1��h2�/��0�MUN>l��kd�__�G�"M}e����\�����)�&�m��@Gj��M'%���>�yn��ySm�*K�+�U��������O@�g�LAME3.100UUUUUUUUUUUUU	�,�&RI�` ��5�\ � DI5�-�L�$���I�36��a�����-��B�B:�ג�_���B2�-L,�s-�˛�[��.y)l����� ٝKM$QҴ��5��~!8Ptzʩ`�yR�����*�59֎,ӏi�o1�S�m�T�uHTz$��v# '�Rؗ����',�լu�k�ԴC�2��%������޸�R�\�+�ۑ��D��0)#K �#)��H L8	A	CŁ�����i���>PбE�p7�1Z�6�YA�[���k�{ ;��V����z[���u�C������!V�c�^^��zx��dq���s�νMMM�ٙ����F������>2`َ��f7�h�"/�Mz7V���Q��yʡ��B!'��8�4�Ur���LAME3.100UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU���Km�~A�P����xh�"Pu!��K1���S67�fgW������i4$UVhaI�U��Z������O�1:���i5�ޘ��t��\@�����Ϫ�\�l%��e(mUkW���'��[�}�U���^����q.֦�@7m��I$�s�(,2Qm�c#,��DdS�cF���Y4�]t�""\Ib�X�%���� ��(�$���9p��E�ĿŹ�P<[Ө�
t�Hi�L"̻+0u5WV����hd�jI�:|W�����%	%�ai,�|-�I����ǫ�»�#'�Y ��LZ���*�r�|_B���> 8t�ѿ)�av.��i�ε&�l��#�k�:�r����  ��c�6�)dc3�A�$�c�Aw��2��x�A�D-*�J%�!NFN��]f}'Ȓ�p@Z�D�N�it���h��Y2��f���+1h��0��dwf)�㞦�m%����� �Ui��u��3鵧�f��#y���%�K���a�(��ߙ�c/����#T�u5���S��W�DݪyML7sx������7���kg�ؤ���nMg�<�j�_��X�j���@"��i�	���� f�J0��H^rD�<u	�gֵ��NAp,�"c1�9� k�2&s`I&��f(
�/�LOU$�ʪ��n��A�i��Q>�M�v.��؆�Q������z�q*�m�e.Y�J\.!u����Ԕ��JJKp�����G!���Q9�������Ϻ��<��oe��l���<���\����UC���	F�p��Ń�LAMEUUU�i"�%�@t���Ba��?@���n�}S�I��$�S E���6�0�+ɐ�Hµl^����ա'=H|T�-��t�g�m���3H2=������������UO� C%���`P��-�9 P��������Kd�Kwe�T��>���������)�!���Hn�hX��  ��k�Yϛe����($.�a�@�lq��X$��Dt�AA&�)�	�(����4F�6x��#��l��O� �ƀ�H���
�N�@�����>���n]�Ĥ�\,�H�i�śX�t%9N�B�F�bvX.'���S���&6����+���jUE��{h�2=6�Ѡ�2���T��\7�/�i�|�V��5�����g�21BݳL��y޾5���Ʒ�}�ɫ��&�*uM%i��nJ)���΋= BΆ�7��W�EV��}H$�y��~�;;^�y<	��WU(�F�T,�?�I#ؗ�V";iJ�oE��%'7}�ݱ�<��D�-�U��J*<��#!'r �8Z2������ 59G�0��c��=9�]Gd~��*G�F��/�<��SkT0��32��P2@Ej0�\u&�l�d��;�Ú4L��s9NʊF�z���(S����1C����צ@���Vc%��&�c9`эbcӉ(f�b�`���"�x]���*P:q� i���P��I���R|�s�I��M @ h�'�2Ê�Y�'hH �#�o��'���iT�6Sz%M��cMҙ�;��g^Y$����vz?#�3�RK�I��խ���Q�:���u1��;b�����=�*����_��^޿��Ͽn�cT}����Y���LAME3.100UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU��������M�0��D3����@UUUUUUUUUUUUUUUUUUUUKlm�IȜ���UБZT*���_�,�8��vV8a�t��Ñu���\p��j���(�tpb3F��,�u����,쐣D��ϰÚU
ͩ��u7�Sq�,���}��\6J%?�r;����:����{X���B���DM��Xܲݱ>$M�tFP�PuE�vBB�H^�'�-p�N�P�D��+���k"U�������r�r�,)�o׃m�m�I�C�,�2Q�dQ
Ca+����Q�|�X��ʞ	�h|^��o��LAME���h�vTG$�m��G�����)�Da��$6�(�9L�6���Ll�|�B�m�f.���Ehb #��"$h�ӝ�'k��A`х�[��c�Ai�U��z;����Wɘ����0���ļ��3I��s������>�/����v�BǓp��U�5��C;@ ������0@���Ű�Ɓ��0XT%1R8[d�Tc�S��p��6Sä0",!B�*���$�!�Bd�د$%�P��1�&�dC��Q~Z�'�;+��[��}1	��&ŷ	�qR/	�zı/F!t%�28���x���;O�iCI̽1+Hz����js헵���F�@��bA�b[g�r��g���)�NۂiW�L��������&�$�-s��T^�ILC��H�roaW35�G"�����	OJULAME3.100UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU���K$�܇�<M�0a��
�8�c����3�Є��#�II��±�1Ì��	��zH������d&cj����� )[�$�t��)ܼ�-&Bw�y�8�CcG�R�ď=��ʹ*�15�H�;��5�O��Mi�����H� *Ɩ�l� $r� Ra0~A�G����-��$>a�ݔ*'1�Z,(���%J�&IB �J~���^�y�} �d��NB�����i92�����a��A4��)4L���¬jm�+ ���� �'�S��**l�!�.s��B�Ba�r�2|B� �H�:�y.�7pc��"�Y�T��Ͳ667H�X�oyX��k�,f�x���Ii.���|��,��J�p��g�~���
;b�<{�O�VhvEG%�YD�8��2�[����+�z.�h#�D28z�zc�)"i�k
�����& Ԓ��6f��b�B[�04D�A ((4�-R`��4�`������7�`9�2�ڧ��������x�W�0̳�3�q�<����,:L����=k�s?A�6!��;3L�38B̌@����o׎���:d	�3��E!��E��[e�x�b���:��G6 -hV3�������̰��21@��  4�Bq0F���뛤��Zf4�a�\>�ɺM����/%����W#go�W�pN�n�p�]��(	�{�a�
4�j���'�j�=7G{R˴�e�����G`�7�`(�5i���[�W�Eɻu���Y\���Ԑr!+�K�B��E��~����J�j���c�Bww�0
&(>�+�ߡf� ri�FkVlX6�/�1P � ��@�x00�0<�J��+�M� �ũE hY}  x�POp��r��"�#���r�?+2FӖ�r���K���ZV��������U�o��3�E�d��/rੁ@��X"Ub��Tv(�� �$�f�
���+�I�D$M��G�ȖsA��3OIg�"a8�4��L�������I��mV^�7�e��T�O��8��0�'5Tu�%��������R�>�*S��0) � @K0$� T�
h�/ea" �"`��*���I�(p� :_����b��`U9w��ЂvZ�g��iQ���a�i��%e���!ޗ�;F��>jY<T\JA�[r�d劓Td6+C
�"]	�������|l���{b���
��1��́xTϦ$�y�I!��S.���*l^n{�c$BG���LAME3.100��Ͷ�[$��(y��a�-t~�B5T�¨D��ן6�[��b�$��XDY��s9��1t�ܺ|S�U��������џ��-�23a���F�7�-\Es�v̍;�Y]|��~��������􂤲��N7%2�i>��0�J0�B8�Bp��� X�(�p�� iTO�0��%^��`p�DE$��D������?]:zdňGb��i. $#,+H!��@M!�9Ĕ3��u���.�l#�GL���W�Ά��5r�>�K�'�f�:� ���
�4�44%0vݝV�Xz}�nU�B��z�Cƥc��t�j���V����VXX!����!��ԫ�Jz���I�v����T�a���y�YpZ6"1.���9�U]t��$�J�����!� .JB�OP@y��H]у#���(h@8xY�����ivG͖��4�~H����u/	�MP�r53��n��J���R�&E��ll�T$F�ն? ����� 	U��Us�3�u�<},�f��`@��.����U���)#�]�X�`�0�iz�	�$��iLt�D���-@�2f� ��. �L
=0X�T �
`@5� ��f:H3��b�0u�)�^Kq���*�����0�0����c,��!+N�4�C�h���(��i�w�E��	)<���r�R��q�*�ftR�)r0R���s*�3Q���bJ��6�0�ް�iG�g�2̖��pd��D5����ԭ��Ԍu�w�p��E:��N�9~�戅&�6!�*T�*��b|�zc|��s֛�v�4R��LAME3.100������������������������������������������������������������������������ -Tp�Lk�<k�Tca�������K��̴����=9DW�7Q�,��NV9t
<2p�NnE���Ѣio��eo��rR1�a����_�C�)�d�g�%lVx�pK?;\O3Nۅ�/� ��7o�),:�7s�X�J�[^\�%�l�P�)af�'^{oc9�m�=�~��V8o��eհ0����(���gm�۞9zB�\8]�:�(X�p���&�r�m��dm�*�v���/�uq��na�t2�B[NA�.ʽ��H��r�E��$�]ZV�sR�����O���Gsz���DH�k[f�uڬJ:W����}2i�$�ULAME3.100UUUUUUUU[$���P�'���%�In��mc���o�*�X�����L�N#DFQ��@��U�Y�N�E��Jod�-�e���f'DF��1䆮���jh9P��)\r����� ����Ɏ���6Z&�ml��Rc#9]C�C v)�Ŏ�Qi~���2$x �JUi'��������tMM5�E&��@,I���h`bA��D�)�*@p�@ǂ�D7S'�,9���:�`X��1���$��
��p�����̞C؄4r��D*Q_mR����b�C��s*ߝ�!� �.�y:!��%v#�!�1�ڦsK�5�+�U�kR�u4�1"�{I��=V��������W7�#3��;s�u)��qp�T�{$Xi÷�¤��Ǳ���)�ڹ2���MJLAME3.100�������������������������������������������������������������������������������������������������������������� �!5��q�۳aq�<<����������������������������������������������������� �����)�f!�E��������<
� T��[�7�GS�X� "Y͈�Ly/Y����f+�@~OQ:	`,I��p�t�ټ=CԎ�_��ȶ�G�n �Rx�#��-��X����mC��f���1p��J-�!�r�l����4����ڡ���_��ͬ����O�[�����\=V���h�3׸|�5�j�{_�y�7\F�+�ָ��*uC�[73f��>��׵w�@��T$���T-�jLAME3.100������������������������������������������������������������������������������������������������������������Ĭܩ��.���  4�  �������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������  RSRC     [remap]

importer="mp3"
type="AudioStreamMP3"
path="res://.import/shoot.mp3-e2944a614193130b5284ef5c669938cb.mp3str"

[deps]

source_file="res://sfx/shoot.mp3"
dest_files=[ "res://.import/shoot.mp3-e2944a614193130b5284ef5c669938cb.mp3str" ]

[params]

loop=false
loop_offset=0
           GDST                >   WEBPRIFF2   WEBPVP8L&   /�0C1�pABZHr�S!�����G���      [remap]

importer="texture"
type="StreamTexture"
path="res://.import/gun.png-edc19339ae46fae383ca29a6abd4420b.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://sprites/Bullets/gun.png"
dest_files=[ "res://.import/gun.png-edc19339ae46fae383ca29a6abd4420b.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
               GDST                P   WEBPRIFFD   WEBPVP8L8   /� H�c�@��	����Z@P��h�_AP�F�h��\�݉CD�C    [remap]

importer="texture"
type="StreamTexture"
path="res://.import/playerBullet.png-a1a551caf28ab84c91e9768989016e60.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://sprites/Bullets/playerBullet.png"
dest_files=[ "res://.import/playerBullet.png-a1a551caf28ab84c91e9768989016e60.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
    GDST                J   WEBPRIFF>   WEBPVP8L2   /�0��?��p��$9uf'�kv� �����O�%� ����5J          [remap]

importer="texture"
type="StreamTexture"
path="res://.import/base.png-2c628743204fce894d065ec3666974d1.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://sprites/Cursors/base.png"
dest_files=[ "res://.import/base.png-2c628743204fce894d065ec3666974d1.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
            GDST                b   WEBPRIFFV   WEBPVP8LJ   /� Hrٟq�@�������G[@P��h��l%4{��D��� �T����k�dOB��E���ON   [remap]

importer="texture"
type="StreamTexture"
path="res://.import/giuratore.png-552dbfc179b1c9110d8ec11a3fc5f0e8.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://sprites/Player/giuratore.png"
dest_files=[ "res://.import/giuratore.png-552dbfc179b1c9110d8ec11a3fc5f0e8.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
              GDST`                �   WEBPRIFF�   WEBPVP8Lv   /_� Hrٟq�@�������G[@P��h��$5:gB𕓀�O�Wضm�tf
9  �����ᡝ�f?g��	k�5Þ�wa��s��c��^ڃo���g���{W�`@      [remap]

importer="texture"
type="StreamTexture"
path="res://.import/giuratore_walk.png-f80653d05b03902b1fb10474c1d6b62d.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://sprites/Player/giuratore_walk.png"
dest_files=[ "res://.import/giuratore_walk.png-f80653d05b03902b1fb10474c1d6b62d.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
               GDST2   3             p  WEBPRIFFd  WEBPVP8LX  /1�͈I��È���	!A��F��1�����$I����#�,d�^�ʶm���� f�Y{۶������?⏟�����>��$9�dۖ��{D�`<��_3c�*#�M=K��ڶm[����{[�+�̼�?���k����z��D8-ضM�U�'�m۶m;����ٶm�Fl۶y�Y��۶�踷�;���Gwq ��AY^/g۞��u����� `xw|�/����W �9 ��
�"/������c��cO�ǖs���K8�c3�,?�e:�,�*s������r���`ղ����s��~��n����>�JS{|�</W�>)]=�ڧ�
����9�~�F�Pj�?^#�y�  �I�m�<���_r^�~l��|��-��^��*�&)h�u�;�L����4�ȸ��C������{�#��A�f���J�?��ǧ�c�>�\zǻp\��b�z��~�ߏ�W�ob-Ȼݧ3���[������.����տ��1p�Y��F�����}�d>1�ɼ����W���+����>4��M����4�?�Y.�����g�o�����Ӥ3���{����0G!�� �A�`�0��'�f��Iwݏ����H�c*�����'�=� � <���#���JF�jK �
�`�!X�K�0Krz���Ę�p|>2��:J=� �� ��������'f�̡�8�T2�T�4��Vb�t�mpМ��>���ٚw�fj��h�P��CY��g��w�H�u�W��PR,���l�b��2XПw�[�aNp{��Q�i������/��?  ���g�`+�K�t�i�\OE���F%�
�bZlK�T��vd.<�ݸw*���S��b��x`r��߹��<y�����N�W�̀n7]o_�?�N�Jm[*��&z�vj��Y���q.�����C:;��Z=�׽���o��  p�W�s����~��������?ۊ��:ɕL���d�Ԛ��N�zF��.%A c��1��ӌ�}v�} ���  �����x��+ ���u���W�)l���S�=�zw����h��6,�"y�J��0��ю����yr���>����O��wKi��?}��-�+�����F�t�{S���@$�I�S��h�\[��tB	ǡK {�����~�u��W?
xo�]��  �ʟ��t�  H��M�S�d#�&�L"�V�=�{�I�AU���'������=2�G��#�x���z�c}	8t��.���<в4�  ��o�eEP[�����=m ���N�["�F�ƐAʤ䦴G�4�������w�
�=����b{�K��m?=��1�K��b��<���YRN�y^h��.�؁�'{���"	Fft��C/��Ia	:����8�_�����ѣa�㦡�ݯ=��p~�{z� }ҕ_}ۙ� ��=�}�5t�Yz�p�� ���B�Xl�P�4���b'��((�'d	k��e�d0Z�JӺ[6o>��O{'S������?}�
�� h�H��6�Q���Tbi��N�&)�a�Q9�_C��JЏ)�Mrm����:u�`r�s\ns}B\�N�V�,@�y�� �<?  !#�����t8� [L��ʄ�P�%�OP��|'�kc.��d��1mҞ�@��K"��2�*�����8�~�aY������_�]   �뚥�bR et��F���갦Rfp����F��<�	DRd�J��MQ��^��HSn]�H�W�j],�&>�=^�����W������B,���	�7ƽ�$�*Jo.62�גcu6i�Z �
� \,�I%k���;�����d]�(�&��L��'���E� ���6��@Zd����$��p_x��B.�-��&�,"�d�`L���(�l�`K�"()�([
>ml��n�C�{��w�K� �w��A��+d��y>  ��]�C����\2�`-I���њ(8ɰ|�; U�J�����*����u��O�l\�Qci�	�_�}Ά6�+*zGS��	��4*��<�m��	Ƅ5Q!&��۞� 1�P4�@�n�Ԗ����p|x9��+m� �6 ���С��fn9��L�S��N:�L#-:!Q�ࢌ9��2��vJ^2�p�#��Hbwt۳�jl�nؕ|�	�������  @�|O6ו���j\f ��t1-M�6�D��́�u� x5��*k.�HAS^B,!p�H쩁���ls^(�� ��ux�?��k_���d�ὺ��L��w��Z	�@HK� H��-B��� ���cwPNj�a��J�1*���zc�щ�!c��8mră����>b��� ��|o�wG�PM�-w���6¦��G|`vȍ�VT���&
bAFj�͍��L�S[
�F���q��h[>�>�������   �Ud8D
�D43qDe�cН8-�E�vkR ����V�c!-Ä��eIG���h<e���>�p�{� ��	�?y_G�`�j����D#(�N�I���P�eNyiH�Ć1)!�CB'6��,�6>���elsɆN%V�ֲ]�n���2`�����5���/  Nu�������_Bv�-t��Fh��O�BФ���$1+Q��  8вD���#iP��م��nC�b��*���lyV��  �����r�ƞg��Ki����8a2U<M��=P�f����F��M�,i0IJ�A�IZ�5B�����T/��F�,H�*���׵�c?�p��������b ;��e��I�xl��[)��4�Ƃ����HZ#�]��ɖ��I���
$h��zX.���O
c��>����'�  ��q0���K��'hi�ƽ�S��ziI��la�Y��e,H���`Ҧd!�H��)B#�e�	ϐ.�xW�:υ�Ε��� ~�_�o����Tń�� 8�!���e1	i�`nLhs;iS��1�v��H�I�@cX@d�M����Uo8�N^}C�s{���X��+��|&l�e���j����V�%) B���H8º�"XQ%���ץ�}�G p0v��z����������;�t�2R��Zb,��Ҩ�F+;HB)-J�#1� %dh�ķ���F!c)<��h��ْ@� [޾χ�u\d��<-4�D�)�5X�$ZdD'ă�I+1O�Z�X"tE�H�4^M$`]��ǹqUX	   ��Ӭ]w܍�aG�İ�(Y[�$	�ְ �%�PТ�j�@H$�	�%A��ɂ�m�`c�Y��I�LdUT�ڸ�a^ �b�SY${�k=/�N�Bӓ't��45�$����=�����@�6H[h�:!�`
QM��{|p�����@���' ��I#��������_�u��D�k�ڸB��(��:�ZH�ɘ�TH0�朘G,`2*���vHfC�>PQG�ɵ��Ƶy�7�)�4KOb�/���/o^mo@5l�/�
;��=4�Ŕ@	Q��-3JL�҂$H�� ���زn��{������v�3�~:��(/�1}}����v����sU�*㵡
�(S�A4&�`"" �!ܠ���Ј�0m���h��������^��չ�d�����i�N:V]���'3��������*!h��""�ILE�"�1�` ����JMX����|(8�G�Y��5Iu���t�<��Ͷ���&#D��[p�`$>B�A"��@P �HP�XDA����#���Z�Z�g��f��/Yk��� `��n������� Y��3�׍,�9^�%�x&�I0���$2+X�`.�� �el
�� �O�8�sWlų�����ο��-X�[�Q�f�c��C�elz���)/I)�qa2o6	�D`-�/�	RH��X�+���p?��n��N�-��~o  �5.����}�[��Y�A�ĕN�<��� ґ�H�ȴҮ�L��HK�����j'ǭ�$�3�u�b�=Ë�R�$18�$��$  ��y�@W�W�_=�QwoF���ӣުwҗ�c5}���~ܔk���q��ko�\��������>��Bw����    [remap]

importer="texture"
type="StreamTexture"
path="res://.import/capybara.png-47881e71b59cff090a51f135a84bcc26.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://sprites/capybara.png"
dest_files=[ "res://.import/capybara.png-47881e71b59cff090a51f135a84bcc26.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
        [remap]

path="res://scripts/Bullet.gdc"
       [remap]

path="res://scripts/GunPoint.gdc"
     [remap]

path="res://scripts/Player.gdc"
       �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx��ytTU��?�ի%���@ȞY1JZ �iA�i�[P��e��c;�.`Ow+4�>�(}z�EF�Dm�:�h��IHHB�BR!{%�Zߛ?��	U�T�
���:��]~�������-�	Ì�{q*�h$e-
�)��'�d�b(��.�B�6��J�ĩ=;���Cv�j��E~Z��+��CQ�AA�����;�.�	�^P	���ARkUjQ�b�,#;�8�6��P~,� �0�h%*QzE� �"��T��
�=1p:lX�Pd�Y���(:g����kZx ��A���띊3G�Di� !�6����A҆ @�$JkD�$��/�nYE��< Q���<]V�5O!���>2<��f��8�I��8��f:a�|+�/�l9�DEp�-�t]9)C�o��M~�k��tw�r������w��|r�Ξ�	�S�)^� ��c�eg$�vE17ϟ�(�|���Ѧ*����
����^���uD�̴D����h�����R��O�bv�Y����j^�SN֝
������PP���������Y>����&�P��.3+�$��ݷ�����{n����_5c�99�fbסF&�k�mv���bN�T���F���A�9�
(.�'*"��[��c�{ԛmNު8���3�~V� az
�沵�f�sD��&+[���ke3o>r��������T�]����* ���f�~nX�Ȉ���w+�G���F�,U�� D�Դ0赍�!�B�q�c�(
ܱ��f�yT�:��1�� +����C|��-�T��D�M��\|�K�j��<yJ, ����n��1.FZ�d$I0݀8]��Jn_� ���j~����ցV���������1@M�)`F�BM����^x�>
����`��I�˿��wΛ	����W[�����v��E�����u��~��{R�(����3���������y����C��!��nHe�T�Z�����K�P`ǁF´�nH啝���=>id,�>�GW-糓F������m<P8�{o[D����w�Q��=N}�!+�����-�<{[���������w�u�L�����4�����Uc�s��F�륟��c�g�u�s��N��lu���}ן($D��ת8m�Q�V	l�;��(��ڌ���k�
s\��JDIͦOzp��مh����T���IDI���W�Iǧ�X���g��O��a�\:���>����g���%|����i)	�v��]u.�^�:Gk��i)	>��T@k{'	=�������@a�$zZ�;}�󩀒��T�6�Xq&1aWO�,&L�cřT�4P���g[�
p�2��~;� ��Ҭ�29�xri� ��?��)��_��@s[��^�ܴhnɝ4&'
��NanZ4��^Js[ǘ��2���x?Oܷ�$��3�$r����Q��1@�����~��Y�Qܑ�Hjl(}�v�4vSr�iT�1���f������(���A�ᥕ�$� X,�3'�0s����×ƺk~2~'�[�ё�&F�8{2O�y�n�-`^/FPB�?.�N�AO]]�� �n]β[�SR�kN%;>�k��5������]8������=p����Ցh������`}�
�J�8-��ʺ����� �fl˫[8�?E9q�2&������p��<�r�8x� [^݂��2�X��z�V+7N����V@j�A����hl��/+/'5�3�?;9
�(�Ef'Gyҍ���̣�h4RSS� ����������j�Z��jI��x��dE-y�a�X�/�����:��� +k�� �"˖/���+`��],[��UVV4u��P �˻�AA`��)*ZB\\��9lܸ�]{N��礑]6�Hnnqqq-a��Qxy�7�`=8A�Sm&�Q�����u�0hsPz����yJt�[�>�/ޫ�il�����.��ǳ���9��
_
��<s���wT�S������;F����-{k�����T�Z^���z�!t�۰؝^�^*���؝c
���;��7]h^
��PA��+@��gA*+�K��ˌ�)S�1��(Ե��ǯ�h����õ�M�`��p�cC�T")�z�j�w��V��@��D��N�^M\����m�zY��C�Ҙ�I����N�Ϭ��{�9�)����o���C���h�����ʆ.��׏(�ҫ���@�Tf%yZt���wg�4s�]f�q뗣�ǆi�l�⵲3t��I���O��v;Z�g��l��l��kAJѩU^wj�(��������{���)�9�T���KrE�V!�D���aw���x[�I��tZ�0Y �%E�͹���n�G�P�"5FӨ��M�K�!>R���$�.x����h=gϝ�K&@-F��=}�=�����5���s �CFwa���8��u?_����D#���x:R!5&��_�]���*�O��;�)Ȉ�@�g�����ou�Q�v���J�G�6�P�������7��-���	պ^#�C�S��[]3��1���IY��.Ȉ!6\K�:��?9�Ev��S]�l;��?/� ��5�p�X��f�1�;5�S�ye��Ƅ���,Da�>�� O.�AJL(���pL�C5ij޿hBƾ���ڎ�)s��9$D�p���I��e�,ə�+;?�t��v�p�-��&����	V���x���yuo-G&8->�xt�t������Rv��Y�4ZnT�4P]�HA�4�a�T�ǅ1`u\�,���hZ����S������o翿���{�릨ZRq��Y��fat�[����[z9��4�U�V��Anb$Kg������]������8�M0(WeU�H�\n_��¹�C�F�F�}����8d�N��.��]���u�,%Z�F-���E�'����q�L�\������=H�W'�L{�BP0Z���Y�̞���DE��I�N7���c��S���7�Xm�/`�	�+`����X_��KI��^��F\�aD�����~�+M����ㅤ��	SY��/�.�`���:�9Q�c �38K�j�0Y�D�8����W;ܲ�pTt��6P,� Nǵ��Æ�:(���&�N�/ X��i%�?�_P	�n�F�.^�G�E���鬫>?���"@v�2���A~�aԹ_[P, n��N������_rƢ��    IEND�B`�       ECFG      application/config/name         Gioco Pazzo    application/run/main_scene         res://World.tscn   application/config/icon         res://icon.png     display/window/size/width      @     display/window/size/height      �      display/window/size/resizable          !   display/window/size/always_on_top            display/window/size/test_width            display/window/size/test_height      �  !   display/mouse_cursor/custom_image(         res://sprites/Cursors/base.png     display/window/stretch/mode         2d     display/window/stretch/aspect         keep   importer_defaults/texture�              compress/mode                compress/lossy_quality    ffffff�?      compress/hdr_mode                compress/bptc_ldr                compress/normal_map              flags/repeat             flags/filter             flags/mipmaps                flags/anisotropic             
   flags/srgb              process/fix_alpha_border            process/premult_alpha                process/HDR_as_SRGB              process/invert_color             process/normal_map_invert_y              stream            
   size_limit            	   detect_3d             	   svg/scale        �?   input/ui_left�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script            InputEventJoypadButton        resource_local_to_scene           resource_name             device            button_index         pressure          pressed           script            InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   A      physical_scancode             unicode           echo          script         input/ui_right�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script            InputEventJoypadButton        resource_local_to_scene           resource_name             device            button_index         pressure          pressed           script            InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   D      physical_scancode             unicode           echo          script         input/ui_up�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script            InputEventJoypadButton        resource_local_to_scene           resource_name             device            button_index         pressure          pressed           script            InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   W      physical_scancode             unicode           echo          script         input/ui_down�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script            InputEventJoypadButton        resource_local_to_scene           resource_name             device            button_index         pressure          pressed           script            InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   S      physical_scancode             unicode           echo          script         input/shoot�              events              InputEventMouseButton         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           button_mask           position              global_position               factor       �?   button_index         pressed           doubleclick           script            deadzone      ?
   input/roll�              events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script            deadzone      ?)   physics/common/enable_pause_aware_picking         )   rendering/environment/default_environment          res://default_env.tres        