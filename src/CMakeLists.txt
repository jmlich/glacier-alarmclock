set(SRC 
    main.cpp
)

qt_add_resources(RESOURCES qml/glacier-alarmclock.qrc)

add_executable(glacier-alarmclock ${SRC} ${RESOURCES})

target_link_libraries(glacier-alarmclock
	Qt6::Gui
	Qt6::Qml
	Qt6::Quick
	Glacier::App)

install(TARGETS glacier-alarmclock RUNTIME
	DESTINATION ${CMAKE_INSTALL_BINDIR})
