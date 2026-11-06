# Roadmap: Markov chains and renewal processes

Develop the theory of homogeneous Markov chains on countable state spaces and
ordinary renewal processes with nonnegative i.i.d. increments. The main results
are recurrence classification, convergence to equilibrium, the elementary and
Blackwell renewal theorems, renewal equations, and the limiting excess-life law.

Build the surrounding library: transition kernels and path laws, stopping-time
identities, return cycles and occupation measures, renewal measures and convolution,
and the connections between exponential renewals and Poisson processes.
`README.md` is the definitive specification; `Suggested.lean` records selected
interfaces and is not an exhaustive checklist.

Suggested homes: `TauCeti/Probability/MarkovChain/` and
`TauCeti/Probability/Renewal/`. Extend existing modules for shared process and
kernel facts.

## Scope and dependencies

This roadmap owns homogeneous discrete-time chains on nonempty countable measurable
spaces with measurable singletons, ordinary renewal processes with nonnegative i.i.d.
increments, and their connections to homogeneous Poisson processes.

| Material | Owner and interface consumed here |
| --- | --- |
| Scalar probability laws, their convolution and moment identities | [StandardDistributions](../StandardDistributions/README.md), Layers 0–5 and 7; use the existing Poisson, exponential, geometric, Gaussian and uniform APIs |
| Markov-chain path laws and recurrent excursion decomposition | [Exchangeability](../../Completed/Exchangeability/README.md), Layer 8; consume `TauCeti.Probability.markovChainLaw` and the excursion API, and connect them to the return-time conventions below |
| Random measures, point measures, Poisson construction and characterization | [PointProcesses][pp], Layers 0, 1 and 4 |
| Restriction, mapping, independent marking, thinning and superposition | [PointProcesses][pp], Layer 6 |
| Two-sided stationary renewal laws, Palm inversion and length bias | [PointProcesses][pp], Layer 8; ordinary renewal limits here do not require this layer |

Layer 7 specifies the temporal Poisson interfaces consumed here. Build missing
dependency material in its owning area with the specified interfaces, and consume
existing implementations directly.
General-state Harris recurrence, continuous-time Markov-chain generators, Brownian
motion, stochastic integration, SDEs, Palm theory, and renewal-reward theory are outside
this roadmap. The [StochasticCalculus proposal][sc] owns the Brownian and SDE material.

## Conventions

**Chains.** Write `κ : ProbabilityTheory.Kernel S S` with `IsMarkovKernel κ`.
The state space has `[Countable S] [Nonempty S] [MeasurableSpace S]` and
`[MeasurableSingletonClass S]`. No topology on the sample space is required.
Write $p_n(x,y) := (\kappa^n)(x,\{y\})$ and
$\mathbb P_x := \mathrm{markovChainLaw}(\delta_x,\kappa)$.
Distributions are probability measures, not a second probability-vector structure.
Give adapters to `PMF` and, for finite state spaces, row-stochastic matrices.

On a path $X$, distinguish the first entrance
$H_A := \inf\{n\geq 0:X_n\in A\}$ from the first return
$T_x^+ := \inf\{n\geq 1:X_n=x\}$; the empty infimum is infinity.
Use `WithTop ℕ` and Mathlib's `hittingAfter`, with starting indices zero and one.
Return-time means are extended nonnegative integrals; nonreturn with positive
probability gives infinite mean. Set $m_x := \mathbb E_x T_x^+$ and
$r_x := (m_x^{-1})_{\mathbb R}$, taking the inverse in `ℝ≥0∞` before `toReal`.
This gives $r_x=0$ when $m_x=\infty$; it avoids Lean's real-valued integral of
a nonintegrable function being mistaken for an expectation.

**Renewals.** Let $T_1,T_2,\ldots$ be measurable i.i.d. variables in $[0,\infty)$,
with common probability law $F$ and $F(\{0\})<1$. Zero increments are allowed.
Set

$$
S_0 := 0,\qquad S_n := \sum_{i=1}^n T_i,\qquad
N_t := \sum_{n\geq1}\mathbf1_{\{S_n\leq t\}}.
$$

Use `ℝ≥0` for time and increments and an extended count before proving finiteness.
The Lean sequence is indexed from zero: `T 0` represents $T_1$ and `S n` sums
`Finset.range n`. The artificial $S_0$ is not counted, but genuine arrivals at zero
are counted; thus $N_0$ need not vanish. Define $N_t$ as a natural number on the
full-measure nonexplosion event and give it the value zero on the exceptional event.
Prove measurability and invariance of laws under this choice.

Write $\mu := \int t\,F(dt)\in(0,\infty]$, $r := (\mu^{-1})_{\mathbb R}$ and
$m(t) := \mathbb E N_t$. Distinguish the law $F$ from its cdf
$F_{\leq}(t) := F([0,t])$. Convolution integrals include both endpoints of $[0,t]$.
The renewal measure is
$U := \sum_{n\geq0} F^{*n}$ with $F^{*0}:=\delta_0$; hence
$U([0,t])=1+m(t)$, including when $F$ has an atom at zero.

**Point processes.** Retain multiplicities. Use measurable maps into `Measure E`
and the integer-valued/point-measure interfaces of PointProcesses. A sigma-finite
intensity need not be finite on compact sets; use the locally finite carrier only
under its additional hypotheses. The homogeneous temporal Poisson specialization
has no points at zero and counts $(0,t]$, which agrees with the renewal convention
when increments are strictly positive.

## Existing library and design guidance

Consume the following modules and extend their APIs rather than restating them.
The source links identify the dependency versions used to check these interfaces.

| Foundation | Existing source |
| --- | --- |
| Kernel composition, powers and Chapman–Kolmogorov integral identity | [Mathlib `Kernel/Composition/Comp.lean`][kernel-comp] (`Kernel.pow_add`, `Kernel.pow_add_apply_eq_lintegral`) |
| Stationarity and detailed balance | [Mathlib `Kernel/Invariance.lean`][invariance] (`Kernel.Invariant`, `Kernel.IsReversible`, `Kernel.IsReversible.invariant`) |
| Infinite trajectory construction | [Mathlib `Kernel/IonescuTulcea/Traj.lean`][traj] and [TauCeti `Process/MarkovChain.lean`][chain] (`markovChainLaw`, its prefix and marginal laws) |
| Independent excursions at a recurrent state | [TauCeti `Exchangeability/Recurrence/MarkovChain.lean`][excursions] (`conditionallyIIDWith_excursionProcess`, `markovChainLaw_eq_map_pathOfExcursions`) |
| Filtrations, stopping times and first entrance | Mathlib `Probability/Process/Filtration`, `Stopping` and `HittingTime`; use `Adapted`, `Filtration.natural`, `IsStoppingTime` and `hittingAfter` |
| i.i.d. constructions and limit theorems | Mathlib `Probability/Independence/InfinitePi`, `StrongLaw`, `CentralLimitTheorem`, and `Process/FiniteDimensionalLaws` |
| Stieltjes measures and convolution | Mathlib `MeasureTheory/Measure/Stieltjes` and the measure convolution API; add only the half-line and renewal adapters |

[Mathlib PR #44889][invariant-pr] develops invariant-measure and kernel-power
lemmas toward total-variation convergence. Follow that kernel design.
[PR #34713][stationary-pr] develops finite stochastic-matrix stationary
distributions; connect its vector formulation to `Kernel.Invariant`.
[PR #39913][period-pr] develops quiver periodicity: connect return lengths to
directed walks where useful, without making graph infrastructure a prerequisite
for defining the chain. Adopt these APIs when available and supply missing facts
in TauCeti with compatible statements.

The [Zulip discussion of Markov processes and adapted filtrations][zulip-markov]
motivates retaining an explicit filtration and measurable adaptation. State the
one-step Markov property relative to that filtration, then specialize to the
natural filtration. A Markov property for the natural filtration alone does not
imply the property for an arbitrary enlargement.
At the pinned Mathlib version, `Filtration.natural` asks for strong measurability.
For the countable-state adapter, equip the state space with the discrete topology,
prove its Borel compatibility, and identify this filtration with the supremum of
coordinate comaps. The public Markov hypothesis remains measurable adaptation.

## Layers and dependencies

| Layer | Content | Prerequisites |
| --- | --- | --- |
| 0 | Kernels, path laws and simulation | Existing kernel and trajectory APIs |
| 1 | Markov property and stopping times | Layer 0 |
| 2 | Recurrence, classes and occupation | Layer 1; i.i.d. strong law and excursions |
| 3 | Stationarity, coupling and equilibrium | Layer 2 |
| 4 | Ordinary renewal processes | i.i.d. construction and scalar laws |
| 5 | Renewal limit theorems | Layer 4; Layer 3 for the lattice proof; scalar LLN/CLT |
| 6 | Renewal equations and excess life | Layers 4–5; Stieltjes measures and convolution |
| 7 | Connections to Poisson processes | Layers 0, 4–5; PointProcesses Layers 0, 1, 4 and 6 |

Layer 2 uses the i.i.d. strong law directly for return cycles; it does not depend on
Layer 5. This avoids a cycle through the Markov-chain proof of lattice renewal limits.

## Layer 0: Kernels, laws and simulation

1. Prove that countable transition weights $p(x,y)\geq0$ with row sums one
   determine a unique Markov kernel. Provide singleton evaluation, `PMF`
   conversion, finite stochastic-matrix conversion, and compatibility with
   composition, powers and pushforward of initial laws.
2. Extend `markovChainLaw` with time-$n$ marginal $\kappa^n\circ\nu$,
   arbitrary finite-time cylinder probabilities, uniqueness from the initial law
   and prefix recursion, and measurable dependence on the starting state.
   Expose the path-law kernel $x\mapsto\mathbb P_x$ needed by Layer 1.
3. For a measurable process on any probability space, prove equivalence between
   its path law being `markovChainLaw ν κ` and the finite-path product formula.
   Transfer statements through this equality of laws; do not impose a canonical
   sample space on users.
4. Construct a measurable countable-state sampler from a uniform variable on
   $[0,1)$ for each probability law, and a sampler measurable jointly in the
   current state and the uniform variable for a kernel. Include finite and
   infinite enumerations, zero weights, and endpoint conventions. Prove that
   iterating the sampler with independent uniforms gives `markovChainLaw`.

Completion examples: an absorbing two-state chain, a deterministic cycle, and
a nearest-neighbor random walk on the integers. Check that kernel powers recover
their elementary transition laws.

## Layer 1: Deterministic and strong Markov properties

1. Define the filtration-relative one-step property by conditional expectations
   of bounded measurable real test functions. Include adaptation. Prove its
   equivalence to the prefix-law recursion for the natural filtration, with the
   initial law specified separately. Derive the multi-step conditional law using
   kernel powers.
2. Prove the path-valued Markov property: conditional on information through time
   $n$, the shifted future has law $\mathbb P_{X_n}$. Provide both bounded-test
   identities and event identities, with their measurability hypotheses.
3. Prove the strong Markov version for a stopping time
   $\tau:\Omega\to\mathrm{WithTop}\,\mathbb N$, on $\{\tau<\infty\}$,
   conditional on the stopped sigma-algebra. Values of $X_\tau$ and the shifted
   path outside that event must not affect the assertion. Give the simpler
   almost-surely finite specialization.
4. Provide stopping-time and measurability lemmas for entrances, returns,
   successive visits, shifted paths and concatenation. Starting at $x$, prove
   that $\mathbb P_x(T_x^+<\infty)=1$ implies infinitely many returns almost
   surely, by iterating the strong Markov property. This supplies the hypothesis
   of the existing excursion decomposition. Derive the i.i.d. return-gap law
   and prove that each gap equals excursion length plus one. Relate its existing
   visit-time convention to `hittingAfter` only on the event where the visit exists.

## Layer 2: State classification and occupation

1. Define reachability by $\exists n,\ p_n(x,y)>0$, communication by mutual
   reachability, and irreducibility by communication of every pair. Prove the
   equivalence-relation API, closed-class characterization and restriction to a
   closed class as a Markov kernel on a subtype.
2. Define recurrence by $\mathbb P_x(T_x^+<\infty)=1$, transience by its failure,
   positive recurrence by recurrence and $m_x<\infty$, and null recurrence by
   recurrence and $m_x=\infty$. Write $\rho_x:=\mathbb P_x(T_x^+<\infty)$,
   $V_x:=\sum_{n\geq1}\mathbf1_{\{X_n=x\}}$ for the number of positive-time visits,
   and $G(y,x):=\sum_{n\geq0}p_n(y,x)\in[0,\infty]$. Prove the dichotomy:
   $\mathbb P_x(V_x\geq k)=\rho_x^k$ for every $k\geq0$, so a recurrent $x$ has
   $V_x=\infty$ $\mathbb P_x$-almost surely, while for a transient $x$ the variable
   $1+V_x$ is geometric with parameter $1-\rho_x$ and
   $\mathbb E_xV_x=\rho_x/(1-\rho_x)<\infty$. Prove the Green-function identities
   $G(x,x)=(1-\rho_x)^{-1}$ in `ℝ≥0∞` and
   $G(y,x)=\mathbb P_y(H_{\{x\}}<\infty)\,G(x,x)$, and deduce

   $$x\text{ recurrent}\quad\Longleftrightarrow\quad
   \sum_{n\geq0}p_n(x,x)=\infty.$$

   For every initial law $\nu$, prove that the total number of visits
   $\sum_{n\geq0}\mathbf1_{\{X_n=x\}}$ has $\mathbb P_\nu$-mean
   $\mathbb P_\nu(H_{\{x\}}<\infty)\,G(x,x)$; hence visits to a transient state are
   almost surely finite from every initial law.
3. If $x$ reaches $y$ and $x$ is recurrent, prove that $y$ is recurrent and
   $\mathbb P_x(H_{\{y\}}<\infty)=\mathbb P_y(H_{\{x\}}<\infty)=1$. Deduce that
   recurrence and transience are class properties, that a recurrent class is
   closed, and that an irreducible recurrent chain satisfies
   $\mathbb P_\nu(H_{\{y\}}<\infty)=1$ for every initial law $\nu$ and every $y$.
   Prove that positive and null recurrence are class properties, using the
   occupation limits of item 4. Every finite closed communicating class is
   positive recurrent. On a finite nonempty state space there is a closed
   communicating class, and the chain enters the union of closed communicating
   classes almost surely.
4. For $V_y(n):=\sum_{k=1}^n\mathbf1_{\{X_k=y\}}$, prove
   $V_y(n)/n\to r_y$ almost surely under $\mathbb P_y$. Under an arbitrary
   initial law $\nu$, the limit is
   $\mathbf1_{\{H_{\{y\}}<\infty\}}r_y$. Prove the corresponding expectation
   limit $\mathbb P_\nu(H_{\{y\}}<\infty)r_y$ by bounded convergence.
   Supply the infinite-mean i.i.d. strong-law consequence by truncation, rather
   than using a finite-mean theorem outside its hypotheses.

Check a finite cycle (positive recurrent), simple symmetric random walk on
$\mathbb Z$ (null recurrent), and the walk with right-step probability
$p\in(0,1)\setminus\{1/2\}$ (transient). Prove the return/hitting estimates needed
for these classifications; their recurrence labels are not assumptions.

## Layer 3: Equilibrium and coupling

1. Use `Kernel.Invariant` for stationarity and `Kernel.IsReversible` for detailed
   balance. Prove their countable singleton formulas and the finite matrix
   adapters. Consume the existing implication from reversibility to invariance.
2. For an irreducible chain, prove that an invariant probability exists exactly
   when the chain is positive recurrent. Construct it by expected occupation in
   one return cycle, prove normalization and invariance, and prove uniqueness
   and $\pi(\{x\})=1/m_x$. No aperiodicity is needed for this result.
3. Define $d(x)$ as the gcd of positive return lengths, with gcd of the empty
   set zero; a chain is aperiodic when every state has period one.
   Prove constancy on communication classes. For $d(x)=1$, prove
   eventual positivity of all return lengths; for an irreducible aperiodic
   chain, prove eventual positivity of transitions between each fixed pair.
   Prove the additive-semigroup lemma: a subset of positive integers closed under
   addition and with gcd one contains every sufficiently large integer.
4. Build independent product chains, prove their path laws and stationary-product
   laws, and prove irreducibility and aperiodicity of the product of two
   irreducible aperiodic chains. For two chains with the same transition kernel,
   construct the meeting-time coupling and show that following one chain after
   their first meeting preserves the other marginal law. Bound the total-variation
   distance of item 5 at time $n$ by twice the probability of not having met
   by $n$. Whenever the product kernel is irreducible and recurrent, prove that
   the two coordinates meet almost surely for arbitrary initial laws, by Layer
   2.3 applied to the product chain. For an irreducible aperiodic positive
   recurrent kernel, the product kernel has invariant probability
   $\pi\otimes\pi$ and is therefore positive recurrent.
5. Measure total variation with Mathlib's `MeasureTheory.tvDist`
   ([mathlib4 #37730][tv-pr]), which takes values in $[0,2]$ on probability
   measures. On a countable space prove
   $\mathrm{tvDist}(\mu,\mu')=\sum_y|\mu(\{y\})-\mu'(\{y\})|$; the coupling bound
   of item 4 reads $\mathrm{tvDist}\leq2\,\mathbb P(\text{no meeting by }n)$.
   For an irreducible aperiodic positive recurrent chain and every initial
   probability $\nu$, prove $\mathrm{tvDist}(\nu\kappa^n,\pi)\to0$.
   For an irreducible aperiodic null recurrent or transient chain, prove
   $(\nu\kappa^n)(\{y\})\to0$ for each $y$ by cases on the product chain. If
   it is transient, $(\nu\kappa^n)(\{y\})^2$ is the probability that the product
   chain started from $\nu\otimes\nu$ is at $(y,y)$ at time $n$, which tends to
   zero by Layer 2.2. If it is recurrent, then $y$ is recurrent because
   $p_n(y,y)^2\leq p_n(y,y)$, hence null recurrent. Couple the chains
   started from $\nu$ and $\nu\kappa^i$ to get
   $|(\nu\kappa^n)(\{y\})-(\nu\kappa^{n+i})(\{y\})|\to0$ for each fixed $i$. By the strong Markov property at the first visit to $y$
   after time $n$, prove
   $\frac1k\sum_{i=1}^k(\nu\kappa^{n+i})(\{y\})\leq(1+\mathbb E_yV_y(k))/k$
   uniformly in $n$; Layer 2.4 makes the right side small. Do not turn the
   pointwise limit into total-variation convergence to the zero measure.
6. Formalize the hard-core sampling example on a finite nonempty simple graph.
   For activity $\lambda>0$, the state space consists of independent vertex
   sets and $\pi(I)\propto\lambda^{|I|}$. A step chooses a vertex uniformly,
   deletes it, then inserts it with probability $\lambda/(1+\lambda)$ when
   no neighbor is occupied. Prove detailed balance, irreducibility, aperiodicity
   and convergence. Specialize $\lambda=1$ to uniform sampling of independent sets.

## Layer 4: Ordinary renewal processes and renewal measures

1. Construct the i.i.d. increments on product space and transfer to arbitrary
   realizations. Prove measurability of arrivals and counts, $S_n\to\infty$
   almost surely, and simultaneous finiteness of $N_t$ for all finite $t$.
   Establish monotonicity, right continuity, and the inverse relations
   $N_t\geq n\iff S_n\leq t$ for $n\geq1$ and
   $S_{N_t}\leq t<S_{N_t+1}$ on the nonexplosion event.
2. Prove finite moments of every positive integer order for $N_t$ on each
   bounded time interval, using a comparison with increments in $\{0,a\}$
   with $a>0$ and positive chance of $a$. This supplies the local integrability
   needed below even when $\mu=\infty$.
3. Define convolution powers and $U$ as above using existing measure convolution.
   Prove $U$ is finite on bounded intervals, $U=\delta_0+F*U$, and
   $m(t)=\sum_{n\geq1}F^{*n}([0,t])$. Prove monotonicity and right continuity
   of $m$. Extend $m$ by zero on negative times and identify the restriction
   of its Stieltjes measure to the half-line with $U-\delta_0$. In particular,
   the measure has mass $m(0)$ at zero; it is not determined by increments
   $m(t)-m(s)$ for $0\leq s<t$ alone.
4. Work out deterministic increments $T_i=a>0$ and increments in $\{0,a\}$
   with $\mathbb P(T_i=a)=q\in(0,1]$. Give the count law and renewal function,
   including $m(0)=(1-q)/q$. For exponential increments of rate $\lambda>0$,
   derive the Poisson count law and $m(t)=\lambda t$ from scalar sum laws.

## Layer 5: Renewal limits

1. Prove $N_t/t\to r$ almost surely and $m(t)/t\to r$ as $t\to\infty$,
   including $\mu=\infty$. Prove uniform integrability of $N_t/t$ for
   $t\geq1$ using the comparison from Layer 4; also obtain $L^1$ convergence.
2. Under finite second moment and strictly positive variance $\sigma^2$ of
   $T_1$, identify its extended mean with a finite positive real $\mu$ and prove

   $$\frac{N_t-t/\mu}{\sigma\sqrt{t/\mu^3}}
     \ \xrightarrow{\mathrm{law}}\ \mathcal N(0,1).$$

   State this using Mathlib convergence in distribution, with a real-time limit
   or the equivalent assertion along every sequence $t_n\to\infty$.
   Build the inversion and rounding estimates from the scalar i.i.d. CLT.
3. Define lattice laws by support in $a\mathbb N$ for some $a>0$, without a
   translation. Prove existence and uniqueness of a maximal span when the law
   is lattice and $F(\{0\})<1$. For maximal span $a$, prove the lattice
   Blackwell limit

   $$m(a(n+1))-m(an)\longrightarrow ar.$$

   Set $q:=1-F(\{0\})$ and let $L$ have the conditional law of $T_1/a$
   given $T_1>0$. Build the chain on
   $C:=\{j\in\mathbb N:\mathbb P(L>j)>0\}$ that moves from $j>0$ to
   $j-1$ and from zero to a fresh $L-1$. Prove irreducibility, identify its
   return-time law as the law of $L$, and show its period is one by maximality
   of the span. Let $(R_n)_{n\geq0}$ be this chain started at zero, and prove
   $U(\{an\})=\mathbb P_0(R_n=0)/q$ for every $n\geq0$.
   Prove $\mathbb E L=\mu/(aq)$, including infinite mean. Layer 3 then
   yields the displayed limit. These identities account for zero-increment
   clusters rather than treating the original interarrival law as strictly positive.
4. For nonlattice $F$, prove, for every $h\geq0$,
   $m(t+h)-m(t)\to hr$. This includes infinite mean. Prove the local renewal bound
   $U([t,t+h])\leq U([0,h])$ for $t,h\geq0$ by conditioning at the first
   arrival at or after $t$, counting $S_0$ in $U$. Prove the limit by Feller's
   argument (vol. II, Chapter XI): by the local bound, every sequence $t_k\to\infty$
   has a subsequence along which the translates of $U$ by $-t_k$ converge vaguely
   on $\mathbb R$ to a Radon measure $\eta$ with $\eta=\eta*F$. Prove that for
   nonlattice $F$ every such measure with $\sup_x\eta([x,x+1])<\infty$ is a
   multiple $c$ of Lebesgue measure.
   Identify $c=r$ from $\int_{[0,t]}\mathbb P(T_1>t-s)\,U(ds)=1$ for $t\geq0$:
   pass to the limit by dominated convergence, using the local bound, when
   $\mu<\infty$, and by Fatou's lemma, giving $c=0$, when $\mu=\infty$.
   The local bound alone does not establish the limit.

## Layer 6: Renewal equations and excess life

1. For measurable real $h$ bounded on each $[0,t]$, define
   $(h*F)(t):=\int_{[0,t]}h(t-s)\,F(ds)$.
   Prove measurability, local boundedness, linearity, the convolution associativity
   needed for iteration, and absolute convergence of $\sum_{n\geq0}(h*F^{*n})(t)$
   uniformly on bounded time intervals. Use Layer 4's local finiteness of $U$.
2. Prove existence and uniqueness among measurable locally bounded solutions of
   $g=h+g*F$, with $g=h*U$. Give the equivalent formula $g=h+h*(U-\delta_0)$.
   At zero, prove $g(0)=h(0)/(1-F(\{0\}))$. Recover the renewal equation for
   $m$ with forcing $F_{\leq}$.
3. Prove the key renewal theorem for every nonnegative, nonincreasing,
   Lebesgue-integrable $h:[0,\infty)\to\mathbb R$: for nonlattice $F$,
   $(h*(U-\delta_0))(t)\to r\int_0^\infty h(s)\,ds$.
   Deduce the same limit for $h*U$ using $h(t)\to0$.
   Use Layer 5's uniform renewal-increment bound and prove the step-function
   approximations needed to justify the limit. Direct Riemann integrability in
   greater generality is outside scope.
4. Define the excess $E_t:=S_{N_t+1}-t$, prove measurability, and show that
   $e_x(t):=\mathbb P(E_t\leq x)$ solves the renewal equation with forcing
   $h_x(t):=F_{\leq}(t+x)-F_{\leq}(t)$ for each $x\geq0$.
   Prove the excess-tail representation with forcing
   $\overline F(t+x):=\mathbb P(T_1>t+x)$, which is nonincreasing.
   For nonlattice $F$ with finite mean, derive

   $$\mathbb P(E_t\leq x)\longrightarrow
     \frac1\mu\int_0^x \mathbb P(T_1>s)\,ds.$$

   Prove that the limit is a probability distribution and identify its density
   as $\overline F(x)/\mu$. Apply Layer 6.3 to the tail forcing, not directly to
   $h_x$, which need not be nonincreasing. For $\mu=\infty$, lattice or not,
   prove $\mathbb P(E_t\leq x)\to0$ for every finite $x$, using
   $\{E_t\leq x\}\subseteq\{N_{t+x}-N_t\geq1\}$ and Layer 5.3 or 5.4.

## Layer 7: Connections to Poisson processes

Consume the temporal specialization of [PointProcesses][pp], Layers 0, 1 and 4:
measurable point measures on the half-line, their count and arrival-time maps,
and the equivalence between a homogeneous Poisson random measure of intensity
$\lambda\,dt$, Poisson stationary independent increments of its count process,
and i.i.d. exponential gaps. Use $\lambda>0$, no point at zero, simplicity and
nonexplosion. PointProcesses Layer 6 supplies marking, thinning and superposition.

General enumeration of point measures, Poisson construction and uniqueness,
Laplace functionals, mapping and marking theorems, and stationary Palm renewal
laws belong to PointProcesses. The targets here connect its temporal API to
Layers 0–5:

1. Map the Layer 4 renewal construction with exponential increments to
   $\sum_{n\geq1}\delta_{S_n}$. Prove equality of count processes and path
   laws with the PointProcesses construction, including measurability of the
   conversions. Derive $N_t/t\to\lambda$ from Layer 5.
2. For $\lambda>0$ and a nonexplosive, nondecreasing, right-continuous
   integer-valued process with measurable coordinates and $N_0=0$, prove the microscopic characterization:
   it is a rate-$\lambda$ Poisson process exactly when it has stationary
   independent increments and, as $h\downarrow0$,

   $$\mathbb P(N_h=1)=\lambda h+o(h),\qquad
     \mathbb P(N_h\geq2)=o(h).$$

   Use the scalar Poisson limit theorem and control the probability that any
   subdivision interval contains two or more jumps. The conclusion includes
   simplicity. State path hypotheses on one event of probability one.
3. Prove that $(N_{t+s}-N_t)_{s\geq0}$ has the original Poisson-process law
   and is independent of the natural history at each deterministic $t$.
   Extend independence from cylinders to the generated sigma-algebra. For
   $\Delta>0$, identify $N_{n\Delta}$ as the Layer 0 chain with transition
   law $i+\mathrm{Poi}(\lambda\Delta)$.
4. As compatibility checks, derive the temporal thinning and superposition
   identities through the PointProcesses operations. Bernoulli thinning with
   $p\in[0,1]$ gives independent processes of rates $p\lambda$ and
   $(1-p)\lambda$; adding independent processes adds their rates. Treat
   zero rate as the identically zero process, separately from the positive-rate
   exponential-gap characterization.

## Completion checks

Every new definition must expose measurability, evaluation and extensionality
lemmas, the relevant law-transfer facts, and compatibility with the underlying
Mathlib or TauCeti object. Every milestone includes the examples and boundary
cases in its specification. Check in particular:

* A deterministic cycle has an invariant probability but does not converge to
  it from a point mass unless its length is one; aperiodicity belongs in Layer 3.5.
* The absorbing chain and the recurrent one-state chain distinguish entrance
  at zero from first return at one. A transient missing return has infinite mean.
* Deterministic renewal increments expose endpoint and lattice-span conventions;
  increments in $\{0,a\}$ expose the genuine atom of the count at time zero.
* The nonlattice excess-life limit has total mass one precisely under the
  finite-mean hypothesis used in Layer 6.4.
* The temporal Poisson adapters count $(0,t]$, agree with exponential-renewal
  counts, and preserve independence under thinning, including $p=0,1$.

Compilation of the suggested signatures checks their types, not the truth of
their admitted theorems or completion of these milestones.

## References

Vincent Tassion's [*Applied Stochastic Processes*, ETH Zürich, Spring 2025](https://metaphor.ethz.ch/x/2025/fs/401-3602-00L/sc/script.pdf)
(revision June 20, 2025) supplies the main source: Chapters 1–4 correspond to
Layers 0–3, Chapter 5 to Layers 4–5, and Chapter 6 to Layer 6. Chapters 7–9
motivate the PointProcesses dependencies and the specializations in Layer 7.

For full proofs, including results left to exercises or admitted in those notes,
use J. R. Norris, *Markov Chains*, Cambridge University Press (1997), Chapter 1,
and W. Feller,
*An Introduction to Probability Theory and Its Applications*, vol. II, second
edition (1971), Chapter XI on renewal theory. The point-process supplier follows
G. Last and M. Penrose, *Lectures on the Poisson Process* (2017), especially
Chapters 3 and 5 for construction, mapping, marking and thinning.

[pp]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/931ea77cf651829bfe94c96097a606967203bd42/TauCetiRoadmap/PointProcesses/README.md
[sc]: https://github.com/TauCetiProject/TauCetiRoadmap/pull/1030
[kernel-comp]: https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Probability/Kernel/Composition/Comp.lean
[invariance]: https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Probability/Kernel/Invariance.lean
[traj]: https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Probability/Kernel/IonescuTulcea/Traj.lean
[chain]: https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Probability/Process/MarkovChain.lean
[excursions]: https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Probability/Exchangeability/Recurrence/MarkovChain.lean
[tv-pr]: https://github.com/leanprover-community/mathlib4/pull/37730
[invariant-pr]: https://github.com/leanprover-community/mathlib4/pull/44889
[stationary-pr]: https://github.com/leanprover-community/mathlib4/pull/34713
[period-pr]: https://github.com/leanprover-community/mathlib4/pull/39913
[zulip-markov]: https://leanprover-community.github.io/archive/stream/509433-Brownian-motion/topic/Adapted.20Filtrations.20for.20Markov.20Chains.20and.20Markov.20Processes.html
