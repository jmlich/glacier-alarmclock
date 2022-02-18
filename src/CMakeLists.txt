set(SRC 
    main.cpp
)

qtquick_compiler_add_resources(RESOURCES qml/glacier-alarmclock.qrc)

add_executable(glacier-alarmclock ${SRC} ${RESOURCES})

target_link_libraries(glacier-alarmclock
	Qt5::Gui
	Qt5::Qml
	Qt5::Quick
	Glacier::App)

install(TARGETS glacier-alarmclock RUNTIME
	DESTINATION ${CMAKE_INSTALL_BINDIR})
