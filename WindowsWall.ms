rollout WindowsWall "WindowsWall" width:320 height:420
(
	label 'lbl3' "by Evgeny Fedotov" pos:[5,5] width:306 height:22 align:#left
	editText 'ch_l' "Wall width                        " pos:[5,100] width:300 height:25 align:#left
	editText 'ch_h' "Wall height                       " pos:[5,130] width:300 height:25 align:#left
	editText 'ch_t' "Wall thickness                  " pos:[5,160] width:300 height:25 align:#left
	editText 'ch_hdw' "Window pos width           " pos:[5,210] width:300 height:25 align:#left
	editText 'ch_pw' "Window pos height          " pos:[5,240] width:300 height:25 align:#left
	editText 'ch_lw' "Window width                  " pos:[5,270] width:300 height:25 align:#left
	editText 'ch_hw' "Window height                 " pos:[5,300] width:300 height:25 align:#left
	button 'btn1' "GO" pos:[65,348] width:176 height:61 align:#left
	
	on ch_l entered l do
		(
			::l = l as float
			)
	on ch_h entered h do
		(
			::h = h as float
			)
	on ch_t entered t do
		(
			::t = t as float
			)
	on ch_hdw entered hdw do
		(
			::hdw = hdw as float
			)
	on ch_pw entered pw do
		(
			::pw = pw as float
			)
	on ch_lw entered lw do
		(
			::lw = lw as float
			)
	on ch_hw entered hw do
		(
			::hw = hw as float
			)
	on btn1 pressed do
		(
			ep = editable_mesh name:(uniquename "EPoly") --create an empty EMesh
			convertTo ep Editable_Poly
			
			num1 = polyop.createVert ep [0,0,0]
			num2 = polyop.createVert ep [l,0,0]
			num3 = polyop.createVert ep [0,0,hdw]
			num4 = polyop.createVert ep [pw,0,hdw]
			num5 = polyop.createVert ep [pw+lw,0,hdw]
			num6 = polyop.createVert ep [l,0,hdw]
			num7 = polyop.createVert ep [0,0,hdw+hw]
			num8 = polyop.createVert ep [pw,0,hdw+hw]
			num9 = polyop.createVert ep [pw+lw,0,hdw+hw]
			num10 = polyop.createVert ep [l,0,hdw+hw]
			num11 = polyop.createVert ep [0,0,h]
			num12 = polyop.createVert ep [l,0,h]
			num13 = polyop.createVert ep [0,t,0]
			num14 = polyop.createVert ep [l,t,0]
			num15 = polyop.createVert ep [0,t,hdw]
			num16 = polyop.createVert ep [pw,t,hdw]
			num17 = polyop.createVert ep [pw+lw,t,hdw]
			num18 = polyop.createVert ep [l,t,hdw]
			num19 = polyop.createVert ep [0,t,hdw+hw]
			num20 = polyop.createVert ep [pw,t,hdw+hw]
			num21 = polyop.createVert ep [pw+lw,t,hdw+hw]
			num22 = polyop.createVert ep [l,t,hdw+hw]
			num23 = polyop.createVert ep [0,t,h]
			num24 = polyop.createVert ep [l,t,h]
			
			polyop.createPolygon ep #(num1, num2, num6, num5, num4, num3)
			polyop.createPolygon ep #(num3, num4, num8, num7)
			polyop.createPolygon ep #(num5, num6, num10, num9)
			polyop.createPolygon ep #(num7, num8, num9, num10, num12, num11)
			
			polyop.createPolygon ep #(num1, num2, num14, num13)
			polyop.createPolygon ep #(num2, num14, num18, num22, num24, num12, num10, num6)
			polyop.createPolygon ep #(num11, num12, num24, num23)
			polyop.createPolygon ep #(num1, num13, num15, num19, num23, num11, num7, num3)
			
			polyop.createPolygon ep #(num4, num5, num17, num16)
			polyop.createPolygon ep #(num5, num17, num21, num9)
			polyop.createPolygon ep #(num9, num21, num20, num8)
			polyop.createPolygon ep #(num4, num16, num20, num8)
			
			polyop.createPolygon ep #(num13, num14, num18, num17, num16, num15)
			polyop.createPolygon ep #(num15, num16, num20, num19)
			polyop.createPolygon ep #(num17, num18, num22, num21)
			polyop.createPolygon ep #(num19, num20, num21, num22, num24, num23)
			rot  = eulerangles 0 0 0
			rotate ep rot
			ep.pos = [0,0,0]
			
			uvw = Uvwmap maptype:4 length:1000 width:1000 height:3000
			addModifier ep uvw
			
			mtll = loadTempMaterialLibrary "D:\MaxScript\MatLibrary.mat"
			mt = mtll[1]
			ep.material = mt
			
			--lt = CoronaLight targeted:off width:200 height:200 intensity:20 pos:[500,500,500]
			--isSelected:on
			cam = CoronaCam pos:[3500,-3000,1400] targeted:off focalLength:27
			rotcam = eulerangles 90 0 0
			rotate cam rotcam
			
			render camera:cam outputwidth:1500 outputheight:1000 outputfile:"D:\MaxScript\1.jpg"
			
			)
			)

CreateDialog WindowsWall