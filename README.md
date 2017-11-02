# AuthenticationTest 
## Development environment
* Xcode 9.1, 9.2 beta
* macOS 10.12.6 or later
* iOS 11 (Face ID)

## iOS Simulator side
Use the iOS simulator to enable authentication with Face ID.

Face ID is disabled when building by default.
Check menu of the simulator **Hardware -> FaceID**.

![Hardware -> FaceID.png](https://qiita-image-store.s3.amazonaws.com/0/88266/0286504e-9932-3ac5-ec8e-3f22374cddf4.png "Hardware -> FaceID.png")

Tap **Enrolled** and then you’ll confirm checkmark.
Face ID is now active.

![Enrolled.png](https://qiita-image-store.s3.amazonaws.com/0/88266/420af305-8fe6-bef3-c592-5a174447503c.png "Enrolled.png")

If you execute the sample code and put a check in `Enrolled`, you will get a dialog asking for permission by pressing the button.

![first_dialog.png](https://qiita-image-store.s3.amazonaws.com/0/88266/ebf9dab7-b1e5-1adf-dc20-29a9a00f6970.png "first_dialog.png")


Tap the OK button to display the authentication dialog.

![faceid_wait.png](https://qiita-image-store.s3.amazonaws.com/0/88266/11486655-c5a0-d820-bdfd-be57149c2c66.png "faceid_wait.png")

f you select `Matching Face` under Enrolled in this state ...

![matchingface.png](https://qiita-image-store.s3.amazonaws.com/0/88266/3065ac21-b1c2-91da-c3ca-c3f76a3d4aa5.png "matchingface.png")

Success.

![success.png](https://qiita-image-store.s3.amazonaws.com/0/88266/1656bf8b-e788-17a7-2d2c-c92c1345a7ea.png "success.png")

Conversely, if you choose `Non-matching Face` ...

![notmatching.png](https://qiita-image-store.s3.amazonaws.com/0/88266/dda03229-1fbf-86a1-f754-90b4e9f0649e.png "notmatching.png")

Failed.

![failed.png](https://qiita-image-store.s3.amazonaws.com/0/88266/4ccdf1f2-7535-bc4b-dc07-930160cb35ed.png "failed.png")