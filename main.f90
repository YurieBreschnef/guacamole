program guacamole 
  !main program part, the main timestepping loop is implemented here, calling the actual
  !stepping routines in the timestepping_mod, and writing to files by calling write_all()
  !from IO_module.

  !use omp_lib
  !use iso_c_binding
  use plans
  use sys_state
  use init
  use exit_mod
  use timestepping
  use IO_mod
  use trafo
  use test
  implicit none
  if(debuglevel .GE. 1) write(*,*) '__________________START____________________________________'

  call init_all()
  call test_all()
  call write_all()
  if(debuglevel .GE.1) write(*,*) '__________________TIMESTEPPING_____________________________'


  do main_stp= 1,steps
    if(mod(state%step,(measure_every)).EQ.0) then
      call transform(state%u_f%val(:,:,1),state%u%val(:,:,1),-1,shearing,state%t)
      call transform(state%u_f%val(:,:,2),state%u%val(:,:,2),-1,shearing,state%t)
      call transform(state%temp_f%val,state%temp%val,-1,shearing,state%t)
      call transform(state%chem_f%val,state%chem%val,-1,shearing,state%t)

      !call dfftw_execute_dft(ifull2D,state%u_f%val(:,:,1),state%u%val(:,:,1))
      !call dfftw_execute_dft(ifull2D,state%u_f%val(:,:,2),state%u%val(:,:,2))
      !call dfftw_execute_dft(ifull2D,state%temp_f%val(:,:),state%temp%val(:,:))
      !call dfftw_execute_dft(ifull2D,state%chem_f%val(:,:),state%chem%val(:,:))
      call write_u_stat()
      call write_E_stat()
      call write_T_stat()
      call write_C_stat()
      call write_sys_stat()
    end if 

    if(mod(state%step,(steps/maxfiles)).EQ.0) then
      call write_all()
      !write(*,*) 'MAXVAL:', maxval(real(state%u%val(:,:,:,1)))
    end if 

  	if(mod(state%step,(steps/1000)).EQ.0) write(*,*) (state%step/(steps/1000)) ,'promille done.|  step:',main_stp, &
            '| t:',state%t,'| dt:',dt,'| shearing:',shearing,'|shearstrength:',shear


    if(state%t >tmax/6.0_rp) then
        shearing = 1
        shear = (state%t-tmax/6.0_rp)/(tmax/(5.0/6.0)) *0.05_rp
    end if

    call RK4_adjust_dt()
    call RK4_step()
    !call euler_step()
    !call BogSham_step()
    !state%step = state%step+1
    !state%t = state%t+dt
    
  end do

  if(debuglevel <= 1) write(*,*) '__________________END OF TIMESTEPPING______________________'
  if(debuglevel <= 1) write(*,*) '__________________END______________________________________'
  call exit_all()
end program guacamole 