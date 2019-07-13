# time-division-multiplexing
Time division multiplexing of 2 or more sinusoidal waves and reconstruction using filters.

Time division multiplexing and frequency division multiplexing are primarily employed so as to get a high throughput and maximizing the channel efficiency by passing 2 or more signals through a single channel.

----------------------------------------------------------------------------------------------------------------------------------
The input signals are sampled using an impulse train and they must satisfy the Nyquist Condition to avoid the aliasing effect.
                                                          
                                                          NYQUIST CONDITION
                                                          Sampling Frequency >= 2* Message Frequency 
                                                          
  Only if the input signals satisfy this criteria they could be reconstructed almost similar to the transmitted signals.
  
  Reconstruction Filter :
                          It is basically a low pass Butter-Worth filter with the necessary cutoff frequency and the order N =2 
                          
  -------------------------------------------------------------------------------------------------------------------------------------                                                        
                                                       
                                                       
