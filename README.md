# Transient Heat Transfer Lecture FHNW
**script by Dr. Vivek Kumar, 19.12.2025 for FHNW**

1  A brief overview of the two cases.
We have two heated cyliders of radius, R, 0.01 and 0.3 m, respectively. The intial temeprature of both cylinders is 200°C and the ambient air is at 20°C and flows with a speed of 10 m/s around the cylinder.

Here is a summary of the calculations for both scenarios before we start to evaluate the experimental data. The Biot number ( 𝐵𝑖
 ) calculation uses the standard characteristic length for a cylinder:  Lc=R/2.
 |Parameter|Symbol|Scenario 1 (R=0.01 m)|Scenario 2 (D=0.3 m)|unit|
|:--------------------|:---------------:|:--------------:|:-------------:|:------------------|
|Cylinder Diameter|$R$|0.01 |0.3  |m|
|Characteristic Length|$L_c$=R/2|0.005|0.15 | m|
|Air Velocity|$U$|10 |10 |m/s|
|Air Densiy|$\rho$|1.3 |1.3 |kg/m^3|
|Air viscoisty at $T_0$ |$$\mu = \mu_0 \left(\frac{T_{\text{air}}}{T_0}\right)^{3/2} \left(\frac{T_0 + S}{T_{\text{air}} + S}\right)$$| $$1.825\cdot 10^{-5}$$ | $$1.825\cdot 10^{-5}$$ | Pa.s|
|Thermal conductivity air| $k_{fluid}$| 0.02436|  0.02436 |W/m⋅K| 
|Heat capacity air | $c_p$| 1006 |  1006 |W/m⋅K| 
|Thermal conductivity solid| $k_{solid}$| 13 |  13 |W/m⋅K| 
|Heat capacity solid | $c_{s}$| 502 |  1006 |W/m⋅K| 
|Thermal diffusivity solid| $\alpha =\frac{k_{solid}}{\rho c_s}$| $$3.32\cdot 10^{-6}$$| $$3.32\cdot 10^{-6}$$| m^2/s|
|Reynolds Number|$Re_D$|~ 13193| ~ 395000| -|
|Nusselt Number|$Nu_D = \frac{h D}{k_f}$|62.4|476.5|-|
|Prandlt Number|$Pr_D = \frac{\alpha}{\mu/\rho}$|0.71|0.71|-|
|Heat Transfer Coeff.|$h$|78.0 |20. |W/m^2⋅K|
|Biot Number|$Bi=\frac{h \cdot Lc}{k_{solid}}$ |0.03| 0.23|-|
|-|Lumped CapacitanceValidity| Valid ($Bi \le 0.1$)|Not Valid ($Bi \gt0.1$)|-|

The Nusselt number and respective heat transfer coefficients are estimated from the correlation proposed by Churchill & Bernstein. The correlation are also mentioned at the end of the section. The inital heat transfer coefficient helps to estimate approximately the Biot ($Bi$) number. The lumpedd capacitnace model is valid for $Bi\le 0.1$).

Source: "Introduction to Thermal Systems Engineering", Moran, Shaprio, Mundson, Dewitt, Kapitel 17.2, Gl. 17.35, Seite 419

# Transient Heat Transfer: The Lumped Capacitance Method

This notebook explores the analytical solution for transient heat transfer in a solid body using the Lumped Capacitance Method. This method is valid when the internal temperature gradients within the body are negligible compared to the temperature difference between the surface and the fluid.

## Assumptions and Validity

The Lumped Capacitance Method relies on one primary assumption:

Assumption: The temperature of the body, $T$, is uniform throughout the volume at any given time, $t$.

This assumption is valid when the Biot number ($Bi$) is small, typically $Bi \le 0.1$. The Biot number compares the conduction resistance within the body to the convection resistance at the surface:

$$Bi = \frac{h L_c}{k}$$

Where:

$h$: Convection heat transfer coefficient ($\text{W}/(\text{m}^2 \cdot \text{K})$)

$L_c$: Characteristic length ($V/A_s$, in $\text{m}$)

$k$: Thermal conductivity of the body ($\text{W}/(\text{m} \cdot \text{K})$)

If $Bi \le 0.1$, the internal temperature variation is less than $5\%$, validating the method.
We will come to the physical meaning of Biot number later. At the moment, just note the definition of the Bi number.

## Derivation of the Governing Equation

We start with an energy balance on the body for a small time interval $dt$:
Total Heat balance on the body  
$$Q_{\mathrm{stored}} = Q_{\mathrm{in}}- Q_{\mathrm{out}} + Q_{\mathrm{gen}}$$
For body with no heat generation and zero energy input from the system we can write  
$$Q_{\mathrm{stored}} = - Q_{\mathrm{out}}$$  

Now in differential form:  
$$\rho V c \frac{\partial T}{\partial t}  = - h A_s (T - T_\infty)$$

$$ \text{Rate of Change of Internal Energy} = \text{Rate of Heat Convection Out} $$

The heat lost via convection is $Q_{conv} =  h A_s (T - T_\infty)$, and the change in internal energy is $\frac{dU}{dt} = \rho V c_s \frac{dT}{dt}$.

Since, there are no spatial gradients, we can also write the equation in terms of total derivatives instead of partial derivates.
$$  \frac{dU}{dt} = -Q_{conv}$$

$$-h A_s (T - T_\infty) = \rho V c_s \frac{dT}{dt}$$

Where:

$T$: Body temperature ($\text{K}$)

$T_\infty$: Ambient fluid temperature ($\text{K}$)

$A_s$: Surface area ($\text{m}^2$)

$V$: Volume of the solid body ($\text{m}^3$)

$\rho$: Density of the solid body  ($\text{kg}/\text{m}^3$)

$c$: Specific heat capacity of the body ($\text{J}/(\text{kg} \cdot \text{K})$)

##  Solving the Differential Equation
We rearrange the first-order ordinary differential equation (ODE) to separate variables:

$$\frac{dT}{T - T_\infty} = -\frac{h A_s}{\rho V c_s} dt$$

We integrate from the initial condition $(T=T_i \text{ at } t=0)$ to a general point $(T=T(t) \text{ at } t)$:

$$\int_{T_i}^T \frac{dT'}{T' - T_\infty} = -\frac{h A_s}{\rho V c_s} \int_0^t dt'$$

Let us now introduce $$\theta = T- T_\infty$$
We may now re-write the equation in terms of $\theta$

$$\rho \, V \, c_s \frac{\partial \theta}{\partial t}  = - h A_s \theta$$
or
$$\frac{\partial \theta}{\partial t}  = - \underbrace{\frac{h A_s}{\rho V \, c}}_{1/\tau_t} \: \theta = \frac{1}{\tau_t} \theta$$ 
or rearranging

$$\frac{\partial \theta}{\theta} = - \frac{1}{\tau_t} \; t$$
integrating from time $t= 0$ to time $t$
$$\int_{\theta_i}^{\theta}  \frac{\partial \theta}{\theta}  = - \int_{0}^{t}  \frac{t}{\tau_t}$$

Let $\tau_t = \frac{\rho V c_s}{h A_s}$ be the thermal time constant. Solving the integral gives:

$$\ln\left( \frac{\theta}{\theta_i}\right) = \ln\left(\frac{T(t) - T_\infty}{T_i - T_\infty}\right) = -\frac{t}{\tau_t}$$

Exponentiating both sides yields the final temperature profile:
$$\frac{\theta}{\theta_i}= \frac{T(t) - T_\infty}{T_i - T_\infty} = \exp \left(-\frac{h A_s}{\rho V c_s} t\right)  = e^{-t/\tau_t}$$

Now taking log on both sides:
$$\ln \left(\frac{T(t) - T_\infty}{T_i - T_\infty}\right) = -\left(\frac{h A_s}{\rho V c_s}\right) t$$

If we plot time t against the log of dimensionless temperature or $\theta/\theta_i$, the slope, $m$, of the curve provides $-\frac{h A_s}{\rho V c_s}$. Therefore one can estimate the heat transfer by doing a linear regression fit in order to obtain slope of the curve.

$$ h_{Exp} =   - m \frac{\rho V c_s}{A_s}$$ 

For a cylinder of Diameter $D = 2R$, the characterisitic length is equal to $\frac{R^2 L}{2 \pi R L}  = R/2$, we get

$$ h_{Exp} =   - \frac{m \rho R c_s}{2}$$ 
## Dimensional Analysis

To generalize the result, we introduce two dimensionless parameters:
Dimensionless Temperature ($\theta*$): Represents how close the body is to the ambient temperature.

$$\theta^*(t) = \frac{T(t) - T_\infty}{T_i - T_\infty}$$

Dimensionless Time ($\tau$): Represents time normalized by the thermal time constant of the system or the heated body.

$$\tau = \frac{t}{\tau_t} = \frac{h A_s}{\rho V c_s} t$$

Substituting these into the solution equation, we get an elegant dimensionless form:

$$\theta^*(\tau) = \exp({-\tau})$$

Time to Cool to Ambient Temperature

The question of how long it takes to cool the body to ambient temperature ($T = T_\infty$) means $\theta = 0$.

$$0 = e^{-\tau}$$

This equation is only satisfied as $\tau \to \infty$.
Here one may notice that we reduced the whole problem with five or six parameters to two primary variables. The advantage of this parameter reduction or parameter mapping is that, one solve the problem only once in the new parameter space and consequently  convert the problem to physical space. This approach is often taken in fluid mechanics and heat transfer in order to reduce the size of the problem by reducing the number of variables.

Conclusion: Theoretically, the body never reaches the ambient temperature; it only approaches it asymptotically. In engineering practice, the cooling time is often defined as the time taken to reach a specified fraction of the initial temperature difference, such as $\theta=0.01$ (99% of the cooling is complete).

For example, to reach $\theta = 0.01$:


$$0.01 = e^{-\tau} \implies \tau = -\ln(0.01) \approx 4.605$$


The time required is $t = 4.605 \cdot \tau_t$.
### Dimensionless numbers
Now let us reorganize the term $\tau$ so that we can appriciate similarity of scales and dimensionless numbers even further. Dimensionless numbers have hidden implicit physical meanings which may be very important to understand in order to carry out an engineering analysis and design improvements. It is much more important to know their physical meaning than remember their deifitions.  

$$\ln \left(\frac{T(t) - T_\infty}{T_i - T_\infty}\right) = -\left(\frac{h A_s}{\rho V c_s}\right) t$$

OR
\ln $$\theta^* = {-Bi Fo}$$

It can be seen that the above equation for the dimensionless temperature can be written in terms of two dimensionless factors. The Fourier number, represents the pure condutive time-scale or how fas the heat can be diffused in a body. The multiplicator Bi number tells us, how can we speed-up this time-scale or increase the speed of an heat-transfer process with the convection.   
