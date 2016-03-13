/*
  BioloidController.h - ArbotiX Library for Bioloid Pose Engine
  Copyright (c) 2008-2012 Michael E. Ferguson.  All right reserved.

  Copyright (c) 2012, 2013, 2016 Matthew Paulishen.

  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with this library; if not, write to the Free Software
  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/

#ifndef _VERSACOMA_BC_H_
#define _VERSACOMA_BC_H_

//#include <Arduino-compatibles.h>
#include <stdint.h>
#include <stdlib.h>
#include "dynamixel.h"

/* @def __FLASH__
 * @brief This is the attribute required to have the poses and sequences stored
 * into FLASH memory instead of RAM.
 */
#ifndef __FLASH__
#define __FLASH__ __attr_flash
#endif

class DynamixelServo
{
public:
	uint8_t		identity_;	// Device/Servo ID number
	int32_t		offset_;	// Actuator position offset (ticks)

	uint16_t	model_;		// Device/Servo model number
	int32_t		range_min_;	// Device/Servo minimum position value
							// (   0,    0, ...)
	int32_t		range_max_;	// Device/Servo maximum position value
							// (1024, 4096, ...)
	uint8_t		shift_;		// (   6,    4,   0)
	uint8_t		mode_;		// Device/Servo operating mode
}





/* @def BIOLOID_SHIFT
 * @brief This is a bit-shift value to increase resolution of internal pose
 * calculations within the BioloidController object.
 */
/// Desire some extra resolution during interpolation
// AX: use 16 bits, rather than 10
// MX: use 16 bits, rather than 12
//#define BIOLOID_SHIFT				6

/// BioloidController Pose
/** @class bc_pose_t 
 * @brief This is the base component of the BioloidController engine.
 * @details A bc_pose_t is a single servo's goal position.  It is an unsigned
 * integer. A bc_pose_t* is a pose.  It is an array of unsigned integers
 * representing a collection of servo goal positions to be reached simultaneously.
 */
typedef int32_t bc_pose_t;

/// BioloidController Sequence
/** @class bc_seq_t 
 * @brief This is the middle level component of the BioloidController engine.
 * @details A bc_seq_t is a transition.  It is a pointer to a pose and the
 * length of time that should be taken to transition to that pose.
 * A bc_seq_t* is a sequence.  It is an array of poses and the time taken to
 * transition from one pose to the next pose.
 */
typedef struct
{
	bc_pose_t * pose;					// address of pose
	uint32_t time;						// time interval for transition
} bc_seq_t; 							// BC sequence

/// RoboPlus Motion Page compatibility structure
/** @class rpm_page_t 
 * @brief This is the high level component of the BioloidController engine.
 * @details An rpm_page_t is a compatibility device to integrate RoboPlus Motion
 * files into BioloidController.  It is a pointer to a sequence, a 'next' index,
 * and a 'stop' index.  It is used exclusively as an array of rpm_page_t, with
 * the 'next' and 'stop' indices directing the engine to another rpm_page_t in
 * the array.
 */
typedef struct
{
	bc_seq_t * steps;					// pointer to sequence of "steps"/poses
	uint16_t next;						// index of next sequence
	uint16_t stop;						// index of stop sequence
} rpm_page_t;							// RPM sequence

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Bioloid Controller Class for CM9 clients.
class BioloidController
{
public:
/// Constructor and setup
	/**
	 * @brief Constructor for BioloidController Library.
	 * @see setup()
	 */
	BioloidController() {};
	/**
	 * @brief Basic setup function for BioloidController object.
	 * @details Allocates memory and initializes many internal variables.
	 * @param servo_count The number of servos to be controlled by object.
	 */
	void setup(uint8_t servo_count);


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Debug/Emergency controls
	/**
	 * @brief Debug function to suspend the motion engine.
	 * @see pause()
	 */
	void suspend() { pause(true); }	// set bcState_ = PAUSED
	/**
	 * @brief Debug function to resume the motion engine.
	 * @see pause()
	 */
	void resume() { pause(false); }	// set bcState_ = RUNNING

	/**
	 * @brief Debug function to suspend, resume, or restart the motion engine.
	 * @see suspend()
	 * @see resume()
	 */
	bool pause(bool);
	/**
	 * @brief Emergency Stop function.
	 * @details Stops the motion engine and sends broadcast message to disable
	 * torque on all servos.  Use resume() to restart the engine.
	 * @see resume()
	 * @see pause()
	 */
	void kill(void);					// set bcState_ = KILLED


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Pose Manipulation functions
	/**
	 * @brief Load a named pose from FLASH memory.
	 * @see writePose()
	 * @param addr Pointer to a pose (an array of bc_pose_t).
	 */
	void loadPose( bc_pose_t * addr );
	/**
	 * @brief Read the present position from each servo and store them in RAM
	 * as the current pose.
	 */
	void readPose();
	/**
	 * @brief Write current pose stored in RAM out to servos.
	 * @see loadPose()
	 */
	void writePose();

	/**
	 * @brief Get servo position value from pose currently stored in RAM.
	 * @param id The numerical ID of the target servo.
	 * @return The position value of the target servo in the pose.
	 */
	int16_t getCurPose(uint8_t id);	
	/**
	 * @brief Get servo position value from "next" pose currently stored in RAM.
	 * @param id The numerical ID of the target servo.
	 * @return The position value of the target servo in the "next" pose.
	 */
	int16_t getNextPose(uint8_t id);
	/**
	 * @brief Set the servo position value in the "next" pose currently stored in RAM.
	 * @param id The numerical ID of the target servo.
	 * @param pos The position value of the target servo.
	 */
	void setNextPose(uint8_t id, int32_t pos);

	/**
	 * @brief Set the number of servos used in the pose currently stored in RAM.
	 * @param num The number of servos to be used.
	 */
	void setPoseSize(uint8_t num);
	/**
	 * @brief Get the number of servos used in the pose currently stored in RAM.
	 * @return The number of servos used by the pose.
	 */
	uint8_t getPoseSize();


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Servo Manipulation functions
	/**
	 * @brief Set the numerical ID of a particular index in the ID storage array.
	 * @param index The index of the servo ID storage array to be changed.
	 * @param id The numerical ID to be assigned at that index.
	 */
	void setId(uint8_t index, uint8_t id);	
	/**
	 * @brief Get the numerical ID at a particular index in the ID storage array.
	 * @param The index of the ID storage array to be returned.
	 * @return The numerical ID of the servo at that index.
	 */
	uint8_t getId(uint8_t index);
	/**
	 * @brief Set the 'resolution' of servos used in the object.
	 * @details The 'resolution' is essentially the maximum permissible goal 
	 * position value (1023 for AX/RX/EX servos and 4096 for MX servos).
	 * Dynamixel Pro servos have larger signed integer ranges.
	 * @param id The numerical ID of the servo to have its range modified.
	 * @param range The desired range of the servo.
	 * @return The actual range of the servo used by the engine.
	 */
	uint16_t setResolution(uint8_t id, int32_t range);

	/**
	 * @brief Load joint calibration offsets.
	 * @details Enables reuse of unmodified poses and sequences by multiple
	 * robots by compensating for servo position control variations.
	 * @param addr The name/pointer of the int array containing the offset values.
	 */
//	void loadOffsets( int16_t * addr );


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Pose Interpolation
	/**
	 * @brief Function to initiate an interpolating transition.
	 * @details Interpolates from the current servo positions to the goal
	 * positions specified in the previously loaded pose.  Calls readPose()
	 * to ensure that the starting positions of the servos in the engine match
	 * the actual positions of servos to prevent erroneous jumps to an
	 * inaccurate "starting" pose.
	 * @param time The time taken to move from current pose to goal pose.
	 * @see loadPose()
	 * @see readPose()
	 */
	void interpolateSetup(uint32_t time);
	/**
	 * @brief Moves forward one time step in the current interpolation.
	 * @details When called, it will wait for time interval of interpolation
	 * to complete before writing the next intermediate pose to the servos.
	 * If interpolation is finished, then the function will return immediately.
	 * The time interval is user adjustable through the setFrameLength() and
	 * setTimeModifier() functions.
	 * @see setFrameLength()
	 * @see setTimeModifier()
	 */
	void interpolateStep();
	/**
	 * @brief Function to check if the engine is currently transitioning to a goal pose.
	 * @return Boolean state of interpolation.
	 */
	bool interpolating(void);
	/**
	 * @brief Function to set the engine interpolation state.
	 * @details Can be used to stop a transition to a goal pose, but cannot
	 * later restart the transition.  Use this function with care, as any
	 * stopped transition must be restarted by a new call to interpolateSetup().
	 * @param bolly Desired state of interpolation.
	 * @return Boolean state of interpolation.
	 */
	bool interpolating(bool bolly);


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Sequence Engine
	/**
	 * @brief Load a sequence from FLASH and begin playing it.
	 * @param addr Pointer to a sequence (an array of bc_seq_t).
	 * @see play()
	 */
	void playSeq( bc_seq_t * addr );
	/**
	 * @brief Move forward one time step in sequence.
	 * @details If the currently loaded 'goal' pose has been reached, it will
	 * load the next pose in the sequence using loadPose() and then
	 * interpolateSetup().  If the pose has not been reached, then it will
	 * write the next intermediate pose to the servos using interpolateStep().
	 * If the sequence has finished, it will return immediately.
	 * @see loadPose()
	 * @see interpolateSetup()
	 * @see interpolateStep()
	 */
	void play();
	/**
	 * @brief Function to check if the engine is currently playing a sequence.
	 * @return Boolean state of sequence.
	 */
	bool playing(void);
	/**
	 * @brief Function to set the engine sequence playing state.
	 * @details Can be used to stop playing a sequence, but cannot restart the
	 * sequence.  Use this function with care, as any stopped sequence must be
	 * restarted by a new call to playSeq().
	 * @param bolly Desired state of sequence playing.
	 * @return Boolean state of sequence playing.
	 */
	bool playing(bool bolly);
	/**
	 * @brief Function to return pointer of currently running sequence.
	 * @return Pointer to current sequence.
	 */
	bc_seq_t* checkSeq() {return sequence_;}


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// RoboPlus Compatibility functions
	/**
	 * @brief Starts a series of motion "pages" from the RoboPlusMotion_Array.
	 * @param index Index of "page" to play (may be identical to that used in Task).
	 */
	void MotionPage(uint16_t page_index);
	/**
	 * @brief Wrapper function for MotionPage(unsigned int).
	 * @param index Index of "page" to play (may be identical to that used in Task).
	 * @see MotionPage(unsigned int)
	 */
	void setMotionPage(uint16_t page_index) { MotionPage(page_index); }
	/**
	 * @brief Check the status of the currently running motion "page".
	 * @return Boolean state of motion engine.
	 */
	bool MotionStatus(void);
	/**
	 * @brief Retrieve the index of the currently running motion "page".
	 * @return The index of the currently running motion "page".
	 */
	uint16_t MotionPage();
	/**
	 * @brief Wrapper function for MotionPage().
	 * @return The index of the currently running motion "page".
	 * @see MotionPage()
	 */
	uint16_t getMotionPage() { return MotionPage(); }
	/**
	 * @brief Continue playing a motion "page".  Must be called periodically to progress to next intermediate pose, next goal pose, and/or next sequence.
	 * @see MotionPage(unsigned int)
	 * @see playSeq()
	 * @see play()
	 * @see loadPose()
	 * @see interpolateSetup()
	 * @see interpolateStep()
	 */
	void Play();
	/**
	 * @brief Setup function for the RoboPlusMotion Compatibility functions.
	 * @details Loads the location of the RoboPlusMotion_Array into the object,
	 * allocates memory, initializes many internal variables, and set servo IDs
	 * to those stored in FLASH that were imported from the RoboPlusMotion file.
	 * @param Pointer to the RoboPlusMotion_Array.
	 */
	void RPM_Setup(rpm_page_t* array);


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Engine Modifiers
	/**
	 * @brief Set the integer time modifier.  100(%) is default.
	 * @param mult The desired time modifier.
	 * @return The actual time modifier.
	 */
	uint32_t setTimeModifier(uint32_t mult);
	/**
	 * @brief Set the motion engine's interpolation time length.
	 * @details This is the time between each calculation of an intermediate
	 * pose.  Basically, the time between servo position updates.
	 * @param mult The desired time length.
	 * @return The actual time length.
	 */
	uint32_t setFrameLength(uint32_t time);



//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
private:
	// Servo IDs for this BioloidController object
	uint8_t * id_;
	// Present servo positions
	bc_pose_t * pose_;
	// Final desired servo positions
	bc_pose_t * nextpose_;
	// Change in each servo position per interpolation step
	int32_t * deltas_;
	// Calibration offsets for each servo
	int32_t * offsets_;
	// 'Resolution' of each servo
	int32_t * resolutions_;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Number of servos used by current pose.
	uint8_t poseSize_;
	// Number of servos controllable by this BioloidController object
	uint8_t numServos_;

	// Time {from millis()} when last position change occurred
	uint32_t lastframe_;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Currently running sequence
	bc_seq_t * sequence_;
	// Number of transitions remaining in current interpolation
	uint8_t transitions_;
	uint8_t seqIndex_;

	// MotionEngine control state
	enum
	{
		INTERPOLATING,
		INTERPOLATION_DONE,
		SEQUENCE_DONE
	} seqState_;


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// RoboPlusMotion Array pointer
	rpm_page_t * rpmArray_;
	// RoboPlusMotion Array index
	uint8_t rpmIndexNow_;
	uint8_t rpmIndexInput_;

	// RoboPlusMotion control state
	enum
	{
		PLAYING,
		STOPPING,
		STOPPED
	} rpmState_;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Debug/Emergency control state
	enum
	{
		KILLED,
		PAUSED,
		RUNNING
	} bcState_;


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Temporal modifier
	uint32_t timeModder_;
	// Length (in milliseconds) of each step in interpolation
	uint32_t frameLength_;
	
};
#endif //_VERSACOMA_BC_H_

