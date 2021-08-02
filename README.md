# AM Asynchronous Demodulation
## Required Hardware
- **Nooelec NESDR SMArt**: The [receiver](https://www.amazon.com/gp/product/B01GDN1T4S/ref=ppx_yo_dt_b_asin_title_o00_s00?ie=UTF8&psc=1) tuned by ther user using **fc** parameter brings the signal 
centered at fc with a bandwidth of 2.4 MHz down to baseband.
- **Antenna Mast**: Needed to receive signals.
- **Antenna Base**: Connects the antenna mast to the receiver.
- **Ham It Up Upconverter**: The [Upconverter](https://www.amazon.com/Ham-Up-Plus-Upconverter-Enclosure/dp/B076CYK8XZ/ref=sr_1_1_sspa?dchild=1&keywords=nooelec+ham+it+up+converter&qid=1627885534&s=electronics&sr=1-1-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUExODdSQzk2MExTQVFLJmVuY3J5cHRlZElkPUEwNzc1NzA4SVpCS0lHQVFORThWJmVuY3J5cHRlZEFkSWQ9QTA1Mjc4MDUyT0RUUUVWRFMyOFE0JndpZGdldE5hbWU9c3BfYXRmJmFjdGlvbj1jbGlja1JlZGlyZWN0JmRvTm90TG9nQ2xpY2s9dHJ1ZQ==)
upconverts the signal by 125 MHz set with **hamOffset** so the receiver can reach into the kHz range. The switch needs to be set
to **UPCONVERT**. The receiver connects with the **IF Out** output, and the **USB** connects to a wall outlet. **RF IN** connects to the antenna base.

## Required Software
- **MatLab Toolboxes**: The required toolboxes needed to run this code are: **DSP System Toolbox**, 
**Communications System Toolbox**, **Signal Processing Toolbox**
- **MatLab Support Packages**: The **RTL-SDR Support Package** needs to be installed by navigating in MatLab to 
**Home > Environment > Add-Ons > Get Hardware Support Packages**

## Constraints
- This code only works with the RTL-SDR radio.

## Operation
- Set **fc** to the desired radio station which should be in kHz (e3).
- **TunerGain** may need to be adjusted based on the location.
- **audioPlayer** may need to be adjusted, currently set to the default speaker driver. [Audio Device Writer](https://www.mathworks.com/help/dsp/ref/audiodevicewriter-system-object.html) documentation linked.
- The code is set to run on a true while loop so the user will need to manually stop the code.
- The code uses an envelope detector to demodulate the AM signal.
