load './gnuplot-palettes-master/jet.pal'    
aspect_ratio = 2
no_of_img = 299 
    ####################STATISTICS###############################
    set terminal pngcairo size 1200,800 enhanced font 'Verdana,10'

    #set output './visual/stat/Energies.png'
    #set title 'simulation time [arb] vs. E_kin [arb]'
    #plot './data/E_stat/E_stat.dat' using 2:3 title "E_{kin}"   ,\
    #     './data/E_stat/E_stat.dat' using 2:4 title "E_{pot}"   ,\
    #     './data/E_stat/E_stat.dat' using 2:5 title "E_{tot}"  
    #
    #set output './visual/stat/Velocities.png'
    #set title 'simulation [arb] time vs. velocities [arb]'
    #plot './data/u_stat/u_stat.dat' using 2:3 title "v_{max}"   ,\
    #     './data/u_stat/u_stat.dat' using 2:4 title "v_{rms}"  
    #
    #
    #set output './visual/stat/Temp.png'
    #set title 'simulation time vs.Temperature measures [arb]'
    #plot './data/T_stat/T_stat.dat' using 2:3 title "max temp"  , \
    #     './data/T_stat/T_stat.dat' using 2:4 title "mean temp"   
    #
    #set output './visual/stat/Chem.png'
    #set title 'simulation time vs. Chemical field measures [arb]'
    #plot './data/C_stat/C_stat.dat' using 2:3 title "max Chem"  , \
    #     './data/C_stat/C_stat.dat' using 2:4 title "mean Chem"   
    #set output './visual/stat/Chem.png'
    #set title 'simulation time vs. Chemical field measures [arb]'
    #plot './data/C_stat/C_stat.dat' using 2:3 title "max Chem"  , \
    #     './data/C_stat/C_stat.dat' using 2:4 title "mean Chem"   
    #########Multiplot###############
    set output './visual/stat/stat_combo.png'
    set multiplot layout 4,2
    set xrange [0.0:59.0]


        set title 'simulation time vs.Temperature measures [arb]'
        plot './data/T_stat/T_stat.dat' using 2:3 title "max temp"  , \
             './data/T_stat/T_stat.dat' using 2:4 title "mean temp" , \
             './data/T_stat/T_stat.dat' using 2:5 title "min temp"   
        set title 'simulation time vs. Chemical field measures [arb]'
        plot './data/C_stat/C_stat.dat' using 2:3 title "max Chem"  , \
             './data/C_stat/C_stat.dat' using 2:4 title "mean Chem" , \
             './data/C_stat/C_stat.dat' using 2:5 title "min Chem"   


        set title 'simulation [arb] time vs. velocities (all directions) [arb]'
        plot './data/u_stat/u_stat.dat' using 2:3 title "v_{max}"   ,\
             './data/u_stat/u_stat.dat' using 2:4 title "v_{rms}"  
        set title 'simulation [arb] time vs. velocities (specific directions) [arb]'
        plot './data/u_stat/u_stat.dat' using 2:5 title "vx_{max}"   ,\
             './data/u_stat/u_stat.dat' using 2:6 title "vx_{min}"   ,\
             './data/u_stat/u_stat.dat' using 2:7 title "vy_{max}"   ,\
             './data/u_stat/u_stat.dat' using 2:8 title "vy_{min}"  

        set title 'simulation time [arb] vs. E_kin [arb]'
        plot './data/E_stat/E_stat.dat' using 2:3 title "E_{kin}"   ,\
             './data/E_stat/E_stat.dat' using 2:4 title "E_{pot}"   ,\
             './data/E_stat/E_stat.dat' using 2:5 title "E_{tot}"  
        set title 'simulation time vs. maximum of divergence field (should be near zero)'
        plot './data/sys_stat/sys_stat.dat' using 2:3 title "max div"

        set title 'simulation time vs. shearstrength '
        plot './data/sys_stat/sys_stat.dat' using 2:4 title "shear strength [arb]"
        set title 'simulation time vs. stepwidth dt [arb] '
        plot './data/sys_stat/sys_stat.dat' using 2:5 title "dt [arb]"
    unset multiplot
    ##########################################################################


do for [i=0:no_of_img] {
    set size ratio aspect_ratio 
#
#    set terminal pngcairo size 800,800 enhanced font 'Verdana,10'
#
#  	set output './visual/temp/'.i.'.png'
#  	set title 'temperature field'
#      	plot './data/temp/'.i.'.temp.dat' using 1:2:3  with image
#
#  	set output './visual/u/'.i.'.png'
#  	set title 'velocity field'
#      	plot './data/u/'.i.'.u.dat' using 1:2:($3*50):($4*50)  with vectors
#
#  	set output './visual/abs_u/'.i.'.png'
#  	set title 'absolute magnitude  ofvelocity field'
#      	plot './data/abs_u/'.i.'.abs_u.dat' using 1:2:3 with image
#
#  	set output './visual/u_f/'.i.'.png'
#   unset size
#   set title 'absolute of fourier spectrum'
#      	plot './data/u_f/'.i.'.u_f.dat' using 1:2:3  with image
#
#    set output './visual/chem/'.i.'.png'
#    set size ratio aspect_ratio 
#  	set title 'chemical field'
#      	plot './data/chem/'.i.'.chem.dat' using 1:2:3  with image
#
#	set output './visual/buo/'.i.'.png'
#	set title 'buoyancy field (B_therm*T_z - B_comp * S_z)'
#   	plot './data/buo/'.i.'.buo.dat' using 1:2:3  with image
#
#  	set output './visual/div/'.i.'.png'
#  	set title 'real part of div (u)'
#      	plot './data/div/'.i.'.div.dat' using 1:2:3 with image


    # Multiplot for better visibility:-----------------------------------
    
    set terminal pngcairo size 1600,800 enhanced font 'Verdana,10'
    set output './visual/combo/'.i.'.png'

		set multiplot layout 2,4

   #set cbrange [-300.0:300.0]
		set title 'temperature field'
      	plot './data/temp/'.i.'.temp.dat' using 1:2:3  with image
    #load './gnuplot-palettes-master/Greys.pal'    
   #set cbrange [-30.0:30.0]
		set title 'chemical field'
      	plot './data/chem/'.i.'.chem.dat' using 1:2:3  with image
    #load './gnuplot-palettes-master/jet.pal'    
   # unset cbrange

    #set cbrange [-0.0:5.0]
		set title 'absolute of u '
     	plot './data/abs_u/'.i.'.abs_u.dat' using 1:2:3  with image
    #unset cbrange

    #set cbrange [-0.8:0.8]
		set title 'z component of u '
      	plot './data/u/'.i.'.u.dat' using 1:2:4  with image
    #unset cbrange

    #set cbrange [-3.0:3.0]
		set title 'buoyancy field (B_therm*T_z - B_comp * S_z)'
     	plot './data/buo/'.i.'.buo.dat' using 1:2:3  with image
    #unset cbrange

		set title 'velocity field'
     	plot './data/u/'.i.'.u.dat' using 1:2:3:4  with vectors

		set title 'vorticity field'
     	plot './data/vort/'.i.'.vort.dat' using 1:2:3  with image


#		set title 'real part of div (u)'
#      	plot './data/div/'.i.'.div.dat' using 1:2:3 with image
  	set title 'fourier spectrum of chem field'
   	plot './data/chem_f/'.i.'.chem_f.dat' using 1:2:3 with image




		unset multiplot

    #MULTIPLOT temp/chem--------------------------------------------------
    set terminal pngcairo size 1024,1024 enhanced font 'Verdana,10'
    set output './visual/temp_chem_combo/'.i.'.png'

  	set multiplot layout 2,2

  	set title 'temperature field'
    plot './data/temp/'.i.'.temp.dat' using 1:2:3 with image
  	set title 'fourier spectrum of temp field'
   	plot './data/temp_f/'.i.'.temp_f.dat' using 1:2:3  with image
  	set title 'chemical field'
   	plot './data/chem/'.i.'.chem.dat' using 1:2:3 with image
  	set title 'fourier spectrum of chem field'
   	plot './data/chem_f/'.i.'.chem_f.dat' using 1:2:3 with image

  	unset multiplot
    unset size
}