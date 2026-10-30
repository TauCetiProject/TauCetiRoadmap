# Roadmap: noncommutative integration and martingale inequalities

**Summary.** Build the Lp spaces of von Neumann algebras as usable analytic spaces, from the
tracial Lp spaces, affiliated operators and continuous cores that VonNeumannAlgebras supplies:
singular numbers and the measure topology with the full exponent range 0<p<∞ (Layer 1),
semifinite Lp–Lq duality and complex and real interpolation (Layer 2), weight-independent
Haagerup Lp spaces for an arbitrary von Neumann algebra (Layer 3), Kosaki's state interpolation,
Lp inclusions and conditional expectations (Layer 4), Haagerup's finite-algebra reduction and the
Banach-space geometry of Lp (Layer 5), row and column spaces and the p=1 noncommutative
Khintchine inequality (Layer 6), tracial martingales and Burkholder–Gundy (Layer 7), and the
transfer to nontracial filtrations with the finite-tracial H¹–BMO endpoint (Layer 8). The end
theorems are Haagerup's reduction theorem, noncommutative Khintchine for 1≤p<∞ with
dimension-independent constants, the Ball–Carlen–Lieb convexity inequality, Burkholder–Gundy
for 1<p<∞, the UMD property of Lp(M), and finite-tracial H¹–BMO duality.

## Scope and ownership

This roadmap owns, by layer:

- Layer 1: generalized singular numbers of τ-measurable operators, the measure topology, the
  tracial Lp spaces for 0<p<1 with their p-triangle inequality, the convergence theorems, the
  integrated Ky Fan and concave inequalities, the Schatten quasi-ideals S_p for 0<p<1, weak Lp
  and the Lorentz gauges. VonNeumannAlgebras V10.TracialLp owns the τ-measurable operator algebra
  and Lp(M,τ) for 1≤p<∞ with completeness, Hölder, L¹=M_* and L²=GNS; Layer 1 extends that
  construction to smaller exponents and does not rebuild it.
- Layer 2: Lp–Lq duality for 1≤p<∞ and reflexivity, compatible Banach couples, the complex
  method and Calderón's upper method, the real K-method, and the identification of the
  interpolation spaces of a semifinite Lp couple. BanachSpaceTheory B1–B2 own the Banach duality,
  weak compactness and reflexivity criteria consumed here; PDE item 9 owns the scalar
  Riesz–Thorin theorem; the general Banach-couple functors and every noncommutative identification
  belong here.
- Layer 3: Haagerup Lp spaces, the dual-weight characterization with its operator-valued-weight
  inverse, the density map M_*≃L¹(M), the canonical functional tr_H, the norms and their
  completeness, duality, the standard form, bimodule structure, corners, weight independence and
  the comparison with the tracial model. VonNeumannAlgebras Layer 11 owns weights, modular
  groups, Connes cocycles, continuous cores with their dual action and trace, the dual fixed-point
  theorem and the Pedersen–Takesaki theorem; Layer 3 consumes them.
- Layer 4: Kosaki's complex-interpolation realization of Lp(M) from a faithful normal state, the
  re-embedding and reiteration rules, the Lp inclusions and contractive projections attached to a
  modular-invariant subalgebra, and the Bochner identification Lp(Ω;Lp(M))=Lp(L∞(Ω)⊗̄M).
  VonNeumannAlgebras Layer 11 owns Takesaki's conditional-expectation theorem on M itself.
- Layer 5: Haagerup's reduction theorem in the Haagerup–Junge–Xu form, sequential and directed,
  the reduction of Lp(M) to finite-tracial spaces, Clarkson's inequalities, the moduli of convexity
  and smoothness and the Ball–Carlen–Lieb inequality for every von Neumann algebra.
  BanachSpaceTheory B2 owns the Milman–Pettis theorem with the scalar Lᵖ uniform-convexity
  estimates; Layer 5 proves the noncommutative estimates and feeds them to that theorem.
- Layer 6: row and column spaces Lp(M;ℓ²_C), Lp(M;ℓ²_R), their sums and intersections, the
  random-sum norm with Kahane's moment comparison, and the p=1 Khintchine inequality for every von
  Neumann algebra.
- Layer 7: finite-tracial martingales, martingale Hardy spaces, Stein's inequality,
  Burkholder–Gundy for 1<p<∞, Lp convergence, martingale transforms, Khintchine for 1<p<∞ and the
  type and cotype of Lp.
- Layer 8: the transfer of Stein and Burkholder–Gundy to state-preserving nontracial filtrations,
  Khintchine in arbitrary Haagerup Lp, the UMD property, and the finite-tracial H¹–BMO duality.

The layers are cited elsewhere as I1–I8; Layer k here is Ik.

Left to named roadmaps: CStarAlgebras C3–C5 own operator spaces, matrix norms, completely
positive maps and spatial tensor products; OperatorTheory/OperatorIdeals owns singular values,
trace class, Hilbert–Schmidt operators and the Schatten scale S_p for 1≤p≤∞, which Layer 1
compares with Lp(B(H),Tr); OperatorTheory/Majorization owns the finite-dimensional Ky Fan
maximum principle MAJ-A28 and triangle inequality MAJ-A31, which the Layer 1 matrix Check
consumes; PDE owns the scalar Riesz–Thorin theorem; Tau Ceti owns the scalar Marcinkiewicz
interpolation theorem. Mathlib owns scalar Lp spaces, conditional expectations, filtrations and
martingales on probability spaces, finite-dimensional singular values and the Hadamard
three-lines theorem.

Outside this roadmap: subdiagonal Hardy algebras and their factorization theorems, the
classification of Schur multipliers, the isometric classification of noncommutative Lp spaces,
stochastic integration, and a uniform Khintchine theorem at p=∞.

## Conventions

Von Neumann algebras and Hilbert spaces are complex. A semifinite algebra carries an explicitly
chosen faithful normal semifinite trace τ; τ(1)<∞ is never assumed unless stated. Haagerup Lp
spaces are built for an arbitrary von Neumann algebra M. The martingale transfer theorem of
Layer 8 uses a faithful normal state φ and an increasing sequence of unital subalgebras invariant
under σ^φ with ultraweakly dense union. Finite tracial martingale theorems use τ(1)=1. Neither a
faithful state nor a trace-preserving expectation is implicit for an arbitrary algebra or
subalgebra.

Spaces are built for 0<p<∞ and L∞(M)=M. For p≥1 they carry Banach-space structures; for 0<p<1
they carry the p-norm `‖·‖_p` with the complete translation-invariant metric
`d(x,y)=‖x−y‖_p^p`, and no instance asserting the ordinary triangle inequality. The subunit range
is needed for products and square functions even where the principal inequalities have p≥1.
Khintchine is stated for 1≤p<∞, Burkholder–Gundy for 1<p<∞, and H¹–BMO duality in the
finite-tracial setting of Layer 7.

Exponents are elements of ℝ≥0∞ with p=∞ distinguished; finite positive exponents carry explicit
real and NNReal conversions. Exponent equations are written `1/r=1/p+1/q` with `1/∞=0`, and
positivity of finite exponents is explicit. Mathlib's `ENNReal.HolderTriple` and
`ENNReal.HolderConjugate` are used whenever their hypotheses match. `VonNeumannAlgebra` is used
when a faithful representation is present and `WStarAlgebra` otherwise, with the affiliated-operator
interfaces of VonNeumannAlgebras V10.Affiliation. `MeasureTheory.Lp`, `ContinuousLinearMap`,
`ContinuousLinearEquiv`, `LinearIsometryEquiv`, `CStarMatrix` and `UniformConvexSpace` keep their
Mathlib meanings. Closed sums and products of measurable operators are the operations of
V10.TracialLp's measurable algebra; every assertion about sums and products of unbounded operators
concerns those closures.

Three traces stay distinct: τ on a semifinite base algebra, Tr_core on a continuous core, and the
canonical functional tr_H on Haagerup L¹(M). The dual action follows VonNeumannAlgebras
Layer 11: `θ_s(u_t)=exp(i s t)u_t` and `Tr_core∘θ_s=exp(s)Tr_core`. Accordingly Haagerup Lp
consists of the Tr_core-measurable operators with `θ_s(x)=exp(s/p)x`. Sources with the opposite
dual character (Hiai, Theorem 10.15, has `τ∘θ_s=exp(−s)τ` and `θ_s(a)=exp(−s/p)a`) have the
parameter −s in place of s; the witness pinning the sign is in §3.2. For finite p a nonzero
Haagerup Lp element has `Tr_core(|x|^p)=∞` (Hiai, Remark 11.9); that expression is never its norm.

Matrix algebras M_d(ℂ) carry the unnormalized trace unless a tracial state is explicitly invoked;
the identification `μ_t(x)=s_⌊t⌋(x)` of §1.1 pins this convention. Row and column names follow
the matrix realization of §6.1: a column sequence has square function `∑a_k*a_k`.

The README is the roadmap. `Suggested.lean` states the headline theorems that are statable at the
pins, on the finite-dimensional carrier `CStarMatrix (Fin d) (Fin d) ℂ`: the Khintchine
inequalities `matrix_khintchine_high`, `matrix_khintchine_low` and `matrix_khintchine_one` and the
Ball–Carlen–Lieb inequalities `matrix_ball_carlen_lieb_low` and `matrix_ball_carlen_lieb_high`,
with the definitions `matrixLpGauge`, `columnSquare`, `rowSquare`, `randomSumGauge` and
`rowColumnSumGauge` they need.

## Exact supplier contracts

### From Mathlib

`LinearMap.singularValues` (zero-indexed decreasing singular values of a finite-dimensional
operator, an `ℕ →₀ ℝ`), `Matrix.trace`, `CStarMatrix` with `CStarMatrix.ofMatrix` and its
C*-norm, `CFC.nnrpow`, `CFC.sqrt` and `CFC.rpow` (continuous functional calculus powers of
nonnegative elements), `IsSelfAdjoint.instNonUnitalContinuousFunctionalCalculus`,
`CStarAlgebra.instNonnegSpectrumClass'`, `ENNReal.HolderTriple`, `ENNReal.HolderConjugate`,
`MeasureTheory.Lp` (scalar and Bochner Lp spaces), `MeasureTheory.condExp`,
`MeasureTheory.Filtration`, `MeasureTheory.Martingale`, `UniformConvexSpace`,
`Complex.HadamardThreeLines.norm_le_interpStrip_of_mem_verticalClosedStrip` (the three-lines
theorem), `ContinuousLinearMap`, `ContinuousLinearEquiv`, `LinearIsometryEquiv`, `StrongDual`,
`WeakDual`, `VonNeumannAlgebra`, `WStarAlgebra`. Mathlib has no Riesz–Thorin theorem, no Khintchine
or Kahane inequality, no Clarkson inequality, no type or cotype, no interpolation space, no trace
on a von Neumann algebra, no τ-measurable operator and no noncommutative Lp space.

### From Tau Ceti

The scalar Marcinkiewicz interpolation engine: `TauCeti.lintegral_rpow_le_of_meas_ofReal_lt_le`
and `TauCeti.meas_ofReal_lt_le_add_setLIntegral` (two finite exponents) and
`TauCeti.lintegral_rpow_le_of_mul_meas_ofReal_lt_le` with
`TauCeti.lintegral_rpow_le_of_mul_meas_lt_le_of_le_eLpNormEssSup` (the (1,∞) case), stated for
distribution functions of scalar functions. Tau Ceti has no Riesz–Thorin theorem, no Schatten
class, no Khintchine inequality and no noncommutative Lp space.

### From TauCetiRoadmap.VonNeumannAlgebras

V2's spatial von Neumann tensor products; V4.Core, V4.PositivePredual and V4.Normality for
preduals, normal functionals and normal maps; V5's projection comparison and the central
decomposition into σ-finite algebras; V6's tracial standard form `JMJ=M′`; V7.Index's
trace-preserving expectations; V8's discrete crossed products with their canonical expectation
extracting the identity coefficient; V10.ClosedOperators and V10.Affiliation for closed affiliated
operators and their polar decompositions; V10.TracialLp for the τ-measurable algebra and Lp(M,τ),
1≤p<∞, with completeness, Hölder, L¹=M_* and L²=GNS; V10.ModularTheory for Tomita–Takesaki theory
and the natural cone; Layer 11 for n.s.f. weights and their tensor products, standard forms,
modular groups and Connes cocycles, the Pedersen–Takesaki theorem, Takesaki's
conditional-expectation theorem, the continuous core with its canonical trace and dual action,
the dual fixed-point theorem `(M⋊G)^(dual G)=M`, and the weight-independence cocycle isomorphism
of cores.

### From TauCetiRoadmap.BanachSpaceTheory

B1 for annihilators, adjoints, the bidual embedding, Goldstine's theorem and weak-star
metrizability; B2 for Eberlein–Šmulian, the reflexivity criteria, James's theorem, Milman–Pettis
with the scalar Lᵖ uniform-convexity estimates, and weakly compact operators.

### From TauCetiRoadmap.CStarAlgebras

C3 for operator spaces, matrix norms and completely bounded maps; C4 for completely positive maps
and the Kadison–Schwarz inequality; C5 for spatial C*-tensor products and operator-space tensor
products.

### From TauCetiRoadmap.OperatorTheory

OperatorIdeals Part A for singular values and approximation numbers and Part B for the symmetric
ideals and the Schatten scale S_p, 1≤p≤∞, with S_∞ the compact operators; Majorization MAJ-A28
(Ky Fan maximum principle) and MAJ-A31 (Ky Fan triangle inequality `K_k(A+B)≤K_k(A)+K_k(B)`).

### From TauCetiRoadmap.PDE

Item 9: the scalar Riesz–Thorin theorem.

## How to read the build

Layer 1 completes the measurable-operator theory below the exponent 1 and proves the
singular-number inequalities every later norm estimate rests on. Layer 2 proves duality and
interpolation for a semifinite algebra, building the abstract couples and functors once. Layer 3
constructs Haagerup Lp for an arbitrary algebra and shows it agrees with the tracial model. Layer 4
realizes Lp(M) by Kosaki's interpolation from a state and builds the inclusions and expectations
that martingale theory needs. Layer 5 reduces an arbitrary algebra to finite-tracial ones and
proves the convexity inequalities. Layers 6 and 7 prove Khintchine and Burkholder–Gundy in the
finite-tracial setting, Layer 6 at p=1 by a duality argument valid for every algebra. Layer 8
transfers the martingale inequalities through the reduction and proves the H¹–BMO endpoint.
Layers 1–3 are sequential; Layer 4 needs Layers 2–3; Layer 5 needs Layers 3–4; Layer 6 needs
Layers 2–4; Layer 7 needs Layers 4 and 6; Layer 8 needs Layers 5–7.

## Layer 1: Singular numbers, measurable convergence and the full exponent range

Throughout, M is a von Neumann algebra with a faithful normal semifinite trace τ, and M̃ is the
τ-measurable operator algebra of V10.TracialLp.

### 1.1 Generalized singular numbers

For x∈M̃ define the distribution function `d_x(λ)=τ(1_(λ,∞)(|x|))` for λ≥0, with values in
ℝ≥0∞, and the singular-number function `μ_t(x)=inf {λ≥0 : d_x(λ)≤t}` for t>0. Prove that
μ_t(x) is finite for every t>0, because τ-measurability gives d_x(λ)<∞ for large λ (Hiai,
Definition 4.6 and Definition 4.14). Prove the equivalence with the projection-cut definition
`μ_t(x)=inf {‖x e‖ : e a projection in M, τ(1−e)≤t, x e bounded}` (Fack–Kosaki, Definition 2.1
and Proposition 2.2), including that the infimum in the distribution form is attained and the
conventions at t where d_x jumps. Prove the calculus of μ_t (Fack–Kosaki, Lemma 2.5; Hiai,
Proposition 4.17): t↦μ_t(x) is nonincreasing and right continuous with `μ_t(x)→‖x‖∈[0,∞]` as
t↓0; `μ_t(x)=μ_t(|x|)=μ_t(x*)`; `μ_t(αx)=|α|μ_t(x)`; `0≤x≤y` implies `μ_t(x)≤μ_t(y)`;
`μ_t(bxc)≤‖b‖‖c‖μ_t(x)` for b,c∈M; `μ_(s+t)(x+y)≤μ_s(x)+μ_t(y)`; `μ_(s+t)(xy)≤μ_s(x)μ_t(y)`;
`μ_t(f(|x|))=f(μ_t(x))` for continuous nondecreasing f on [0,∞) with f(0)=0; unitary
invariance `μ_t(uxv)=μ_t(x)` for unitaries u,v; and `|μ_t(x)−μ_t(y)|≤‖x−y‖`. Give the spectral
truncation and projection-intersection proofs, including the estimate
`τ(1−(e∧f))≤τ(1−e)+τ(1−f)` for the intersection of two projections. Prove the layer-cake
formula `τ(x)=∫₀^∞ μ_t(x)dt` for x∈M̃⁺ (Fack–Kosaki, Proposition 2.7; Hiai, Proposition 4.18) and
its consequence `τ(|x|^p)=∫₀^∞ μ_t(x)^p dt` for p>0.

API for `μ_t`: the two definitions and their equality; monotonicity and right continuity in t;
the ten calculus laws above; the generalized-inverse relation `d_x(μ_t(x))≤t` and
`μ_t(x)≤λ ⟺ d_x(λ)≤t` for t>0, λ≥0 with d_x right continuous; the identification with the
decreasing rearrangement for a commutative algebra; the identification `μ_t(x)=s_⌊t⌋(x)` on
M_d(ℂ) with the unnormalized trace, where s₀≥s₁≥… are the entries of Mathlib's
`LinearMap.singularValues` and s_j=0 for j≥d.
*Needs:* VonNeumannAlgebras V10.Affiliation and V10.TracialLp; Mathlib `LinearMap.singularValues`;
Fack–Kosaki, §2.

**Checks.**
- On M₂(ℂ) with the unnormalized trace and x=diag(3,1): `d_x(λ)` is 2 for λ<1, 1 for 1≤λ<3 and 0
  for λ≥3, so μ_t(x)=3 on (0,1), 1 on [1,2) and 0 for t≥2, which is s_⌊t⌋(x). With the
  normalized trace tr/2 the same x has μ_t(x)=s_⌊2t⌋(x), so a definition reading the normalized
  trace would give μ_(1/2)(x)=1 instead of 3.
- On L∞(0,1) with Lebesgue measure and f=1_(0,1/2): d_f(λ)=1/2 for λ<1 and 0 for λ≥1, so
  μ_t(f)=1 for t<1/2 and μ_t(f)=0 for t≥1/2; a left-continuous convention would give
  μ_(1/2)(f)=1.
- On M₂(ℂ) with x=e₁₁ and y=e₂₂: μ_(1/2+1/2)(x+y)=μ₁(1)=1≤μ_(1/2)(x)+μ_(1/2)(y)=2 holds, while
  the unshifted pointwise bound `μ_t(x+y)≤μ_t(x)+μ_t(y)` fails at t=1, where the left side is
  1 and the right side is 0+0; the shift in `μ_(s+t)` is not decorative.
- For f(λ)=λ² and x=diag(3,1): μ_t(|x|²)=f(μ_t(x)) gives 9 on (0,1) and 1 on [1,2); with
  f(λ)=λ²+1, which has f(0)≠0, the formula fails for t≥2, where μ_t(|x|²+1)=0 (the trace of
  M₂(ℂ) is 2) while f(μ_t(x))=f(0)=1.

### 1.2 The measure topology

Define the neighbourhoods `V(ε,δ)={x∈M̃ : ∃ e a projection, τ(1−e)≤δ, x e bounded, ‖x e‖≤ε}`
for ε,δ>0, and prove `V(ε,δ)={x : μ_δ(x)≤ε}` up to the endpoint convention, so the filter they
generate is the filter of convergence of μ_t at every t (Hiai, Lemma 4.11 and Theorem 4.12; Fack–Kosaki, §3). Prove
that M̃ with this topology is a Hausdorff complete metrizable topological vector space and a
topological *-algebra: star, sum and product are continuous, and M is dense in M̃ by the spectral
cutoffs `x 1_[0,n](|x|)` (Hiai, Theorem 4.12). Prove the Fatou bound
`μ_t(x)≤liminf μ_t(x_n)` for x_n→x in measure and every t>0 (Fack–Kosaki, Lemma 3.4(i)), and
`τ(x)≤liminf τ(x_n)` for positive x_n→x in measure (Fack–Kosaki, Theorem 3.5(i)).

API for the measure topology: the neighbourhood basis and its comparison with μ_t; `V(ε,δ)`
is balanced, absorbing and satisfies `V(ε₁,δ₁)+V(ε₂,δ₂)⊆V(ε₁+ε₂,δ₁+δ₂)` and
`V(ε₁,δ₁)V(ε₂,δ₂)⊆V(ε₁ε₂,δ₁+δ₂)`; Hausdorffness; completeness; density of M; continuity of
the *-algebra operations; the Fatou bounds for μ_t and τ.
*Needs:* §1.1; VonNeumannAlgebras V10.TracialLp; Hiai, §4.1; Fack–Kosaki, §3.

**Checks.**
- For M=M_d(ℂ) with the unnormalized trace and δ<1, `τ(1−e)≤δ` forces e=1, so `V(ε,δ)` is the
  norm ball of radius ε: the measure topology is the norm topology, and M̃=M. The same holds for
  B(H) with the usual trace (Hiai, Example 4.13(1)); a definition allowing `τ(1−e)<δ` with
  δ=1 would admit rank-one cuts and give a strictly coarser topology on M₂(ℂ).
- For M=L∞(ℝ) with Lebesgue measure, `x_n=n 1_(0,1/n)` lies in `V(ε,1/n)` for every ε>0
  (cut by e=1−1_(0,1/n), for which x_n e=0), so x_n→0 in measure while `‖x_n‖_∞=n`: the
  measure topology is strictly coarser than the norm topology on an infinite diffuse algebra.
- Products: with x_n as above and y_n=1_(0,1/n), `x_n y_n=x_n→0` in measure, and the product
  law `V(ε₁,δ₁)V(ε₂,δ₂)⊆V(ε₁ε₂,δ₁+δ₂)` gives this from x_n∈V(ε,1/n), y_n∈V(ε,1/n); a law
  with `max(δ₁,δ₂)` in place of the sum is false for cuts supported on disjoint sets, for
  instance x=1_(0,1)·n and y=1_(1,2)·n, each in V(ε,1) but with x+y∉V(ε,1) when n>ε.
- Fatou: `x_n=1_(n,n+1)` on L∞(ℝ) converges to 0 in measure with τ(x_n)=1, so
  `τ(0)=0≤liminf τ(x_n)=1` is strict; an equality in place of the inequality is false.

### 1.3 Lp for 0<p<∞ and the convergence theorems

For 0<p<∞ define `Lp(M,τ)={x∈M̃ : τ(|x|^p)<∞}` with `‖x‖_p=τ(|x|^p)^(1/p)`, which for 1≤p<∞ is
V10.TracialLp's space. For 0<p<1 prove the p-triangle inequality `‖x+y‖_p^p≤‖x‖_p^p+‖y‖_p^p`
by the route of §1.4, and prove that `d(x,y)=‖x−y‖_p^p` is a complete translation-invariant
metric (Fack–Kosaki, Theorem 4.9(iii); Hiai, Lemma 5.3 and Theorem 5.10). Prove that convergence
in the p-gauge implies convergence in measure, by `V(ε,δ)∩Lp(M,τ)⊇{‖x‖_p≤εδ^(1/p)}`. Prove
dominated convergence: if x_n→x in measure and `|x_n|≤y` for one positive y∈Lp(M,τ), then
x∈Lp(M,τ) and `‖x_n−x‖_p→0` (Fack–Kosaki, Theorem 3.6, with S_n=S=y; Hiai,
Proposition 4.21). Prove density in Lp(M,τ) of the bounded elements of finite-trace support
`x 1_[1/n,n](|x|)`, for every finite p.

API for the subunit Lp: the p-triangle inequality; completeness of the metric; the comparison
with the measure topology; dominated convergence; density of spectral truncations; the adjoint,
modulus and bounded-multiplier laws `‖x*‖_p=‖x‖_p`, `‖|x|‖_p=‖x‖_p`, `‖bxc‖_p≤‖b‖‖c‖‖x‖_p`.
*Needs:* §1.1, §1.2, §1.4; VonNeumannAlgebras V10.TracialLp; Fack–Kosaki, §§3–4; Hiai, §5.

**Checks.**
- In ℓ^(1/2) (counting measure) with x=e₁ and y=e₂: `‖x+y‖_(1/2)^(1/2)=1+1=2=‖x‖_(1/2)^(1/2)+‖y‖_(1/2)^(1/2)`, while
  `‖x+y‖_(1/2)=(1+1)²=4>‖x‖_(1/2)+‖y‖_(1/2)=2`: the ordinary triangle inequality fails below
  p=1 and the p-th power is the right quantity.
- On L∞(0,∞) with Lebesgue measure and `x_n=n^(1/p)1_(0,1/n)`: `‖x_n‖_p^p=n·(1/n)=1` for every n
  while the support measure 1/n→0, so x_n→0 in measure with `‖x_n‖_p=1`: a bounded p-gauge does
  not give p-gauge convergence, so the converse of "gauge convergence implies measure
  convergence" is false and dominated convergence genuinely needs the dominating y.
- Dominated convergence on the same algebra with `x_n=1_(0,1/n)` and y=1_(0,1): `|x_n|≤y`,
  x_n→0 in measure, and `‖x_n‖_p^p=1/n→0`.
- `V(ε,δ)∩Lp⊇{‖x‖_p≤εδ^(1/p)}`: on L∞(ℝ) the function `x=ε1_(0,δ)` has `‖x‖_p=εδ^(1/p)` and
  lies on the boundary of `V(ε,δ)`; a comparison with `εδ` in place of `εδ^(1/p)` would be false
  for p≠1 and δ≠1.

### 1.4 Hölder, Ky Fan and concave integrated inequalities

Prove Hölder for all positive exponents: `‖xy‖_r≤‖x‖_p‖y‖_q` for p,q,r>0 with 1/r=1/p+1/q,
with constant one (Fack–Kosaki, Theorem 4.2(i)), together with the product log-submajorization
`∫₀ᵗ f(μ_s(xy))ds≤∫₀ᵗ f(μ_s(x)μ_s(y))ds` for increasing f with `t↦f(e^t)` convex, including the
extended-logarithm bookkeeping, truncation and endpoint limits (Fack–Kosaki, Theorem 4.2(ii)–(iii)).
Prove the integrated Ky Fan inequality `Φ_t(x+y)≤Φ_t(x)+Φ_t(y)` with
`Φ_t(x)=∫₀ᵗ μ_s(x)ds` (Fack–Kosaki, Theorem 4.4(ii)), the projection variational formula
`∫₀ᵗ μ_s(x)ds=sup{τ(e|x|e) : e a projection, τ(e)≤t}` when M has no minimal projection
(Fack–Kosaki, Lemma 4.1), and the absolute-value estimate `|x+y|≤u|x|u*+v|y|v*` for partial
isometries u,v∈M (Fack–Kosaki, Lemma 4.3). When the variational formula needs a diffuse algebra,
amplify by the probability algebra L∞([0,1]) and prove that x↦x⊗1 preserves the distribution
function and μ_t. For continuous increasing concave g with g(0)=0 prove
`∫₀ᵗ g(μ_s(x+y))ds≤∫₀ᵗ g(μ_s(x))ds+∫₀ᵗ g(μ_s(y))ds` (Fack–Kosaki, Theorem 4.7(i)) through the
positive-sum reduction by polar decomposition and compression. Supply the concave trace
inequality `τ((a+b)^r)≤τ(a^r)+τ(b^r)` for a,b≥0 and 0<r≤1 and deduce the p-triangle inequality
of §1.3 for arbitrary x,y by Fack–Kosaki's route: set `g(s)=s^r` with 0<r<p, insert the
rearrangement formula, and let r↑p (Fack–Kosaki, proof of Theorem 4.9(iii)). Pointwise
`μ_(s+t)` bounds alone do not give these constants.
*Needs:* §1.1; VonNeumannAlgebras V2 (the amplification tensor product); OperatorTheory/Majorization
MAJ-A28 and MAJ-A31 for the matrix Check; Fack–Kosaki, §4.

**Checks.**
- On M_d(ℂ) with the unnormalized trace, g the identity and t=k an integer, the concave
  integrated inequality is Ky Fan's singular-value inequality
  `∑_(j<k) s_j(x+y)≤∑_(j<k) s_j(x)+∑_(j<k) s_j(y)` (Fan 1951; Moslehian, *Ky Fan inequalities*,
  §3), which OperatorTheory/Majorization owns as MAJ-A31 with the maximum principle MAJ-A28; the
  Check consumes it from there and does not reprove it. For x=e₁₁ and y=e₂₂ in M₂(ℂ) both
  sides are 1≤2 at k=1 and 2≤2 at k=2.
- The concave inequality is not weak submajorization: a=(1,1) is weakly submajorized by
  b=(2,0), yet `∑√a_j=2>∑√b_j=√2`; so the proof must pass through Lemma 4.3 and the
  positive-sum reduction rather than through majorization of the sum.
- For x=e₁₁, y=e₁₂ in M₂(ℂ), g=√· and t=1: the singular values of x+y are (√2,0), so the
  left side is `√√2≈1.19` and the right side is 1+1.
- Hölder at p=q=2, r=1 on ℂ² with counting measure, x=y=(1,1): `‖xy‖₁=2=‖x‖₂‖y‖₂`; with a
  constant smaller than one the inequality would fail here.

### 1.5 Finite-trace inclusions and the commutative and Schatten identifications

For τ(1)<∞ and p≤q prove `‖x‖_p≤τ(1)^(1/p−1/q)‖x‖_q`, hence Lq(M,τ)⊆Lp(M,τ), and do not assert
any inclusion for an infinite trace. Identify the commutative construction for M=L∞(Ω,μ) with
the ordinary Lp(Ω,μ) of Mathlib's `MeasureTheory.Lp`, with μ_t the decreasing rearrangement.
Identify Lp(B(H),Tr) for 1≤p<∞ with OperatorTheory/OperatorIdeals' Schatten class S_p,
isometrically, with the finite-dimensional formula `‖x‖_p=(∑_j s_j(x)^p)^(1/p)` with the
unnormalized matrix trace; for p=∞ the space is B(H) itself, not the compact operators. For
0<p<1 define S_p by summability of the p-th powers of the singular values of a compact
operator, prove the p-triangle inequality, the ideal estimates `‖bxc‖_p≤‖b‖‖c‖‖x‖_p`,
completeness of the p-metric, and identify it with Lp(B(H),Tr).
*Needs:* §1.3, §1.4; OperatorTheory/OperatorIdeals Parts A–B; Mathlib `MeasureTheory.Lp`,
`LinearMap.singularValues`; Hiai, Example 5.2.

**Checks.**
- M=ℂ² with counting measure, x=(1,1), p=1, q=2: `‖x‖₁=2≤2^(1/2)·‖x‖₂=√2·√2=2`, with equality;
  the exponent 1/p−1/q is pinned, since 1/q−1/p would give 2≤1.
- For counting measure on ℕ the sequence (1/n) lies in ℓ² but not in ℓ¹, and for Lebesgue
  measure on (0,∞) the function `t^(−1/2)1_(0,1)` lies in L¹ but not in L² while `1_(1,∞)/t`
  lies in L² but not in L¹: neither inclusion holds for an infinite trace.
- On M₂(ℂ) with x=diag(3,1): `‖x‖₁=4`, `‖x‖₂=√10`, `‖x‖_∞=3`; the normalized trace would give
  2, √5 and 3, so the formula with `LinearMap.singularValues` pins the unnormalized convention.
- For 0<p<1 the diagonal operator with entries (1/n) lies in S_p exactly when p>1, so S_(1/2)
  excludes it while S_1 contains the entries (1/n²).

### 1.6 Weak Lp and Lorentz gauges

Define weak Lp by the gauge `sup_(t>0) t^(1/p)μ_t(x)` and prove its quasi-norm, adjoint and
ideal estimates. Define the Lorentz gauge `‖x‖_(p,q)=(∫₀^∞ (t^(1/p)μ_t(x))^q dt/t)^(1/q)` for
1≤p<∞, 1≤q<∞, and its q=∞ supremum version; prove that q=p recovers `‖x‖_p`, the embeddings
`L^(p,q₀)⊆L^(p,q₁)` for q₀≤q₁, and the truncation rules used by the real interpolation
identification of §2.5. Distinguish this rearrangement gauge from the equivalent Banach norms of
Lp,q for p>1 (Bergh–Löfström, §1.3).
*Needs:* §1.1, §1.3; Bergh–Löfström, §1.3.

**Checks.**
- On L∞(0,∞) with Lebesgue measure, `f(t)=t^(−1/p)` has μ_s(f)=s^(−1/p), so the weak Lp gauge
  is 1 while `∫ μ_s(f)^p ds=∫ ds/s=∞`: weak Lp strictly contains Lp.
- For q=p: `(∫ (t^(1/p)μ_t)^p dt/t)^(1/p)=(∫ μ_t^p dt)^(1/p)=‖x‖_p` by the rearrangement formula
  of §1.1; a gauge omitting the `dt/t` would not reduce to ‖x‖_p.
- For x=diag(3,1) in M₂(ℂ): the weak L¹ gauge is `max(1·3, 2·1)=3` while `‖x‖₁=4`, and the
  Lorentz (1,∞) gauge equals the weak gauge.

### Examples

- M_d(ℂ) with the unnormalized trace: M̃=M, μ_t=s_⌊t⌋, every Lp is M_d(ℂ) with the Schatten
  norm, and the measure topology is the norm topology.
- L∞(Ω,μ) for a σ-finite measure: M̃ is the algebra of measurable functions finite outside
  sets of finite measure, μ_t is the decreasing rearrangement, and Lp(M,τ) is Mathlib's Lp.
- B(H) with the usual trace: M̃=B(H), Lp is the Schatten class, and the finite-trace inclusions
  fail (the identity has infinite trace).

### Dependencies

Layer 1 needs VonNeumannAlgebras V2, V10.Affiliation and V10.TracialLp,
OperatorTheory/OperatorIdeals Parts A–B, OperatorTheory/Majorization MAJ-A28 and MAJ-A31, and
Mathlib `LinearMap.singularValues` and `MeasureTheory.Lp`.

## Layer 2: Duality and interpolation of semifinite spaces

### 2.1 Lp–Lq duality

For conjugate exponents 1≤p<∞ and q, prove that `y↦(x↦τ(xy))` is a linear isometry of Lq(M,τ)
onto the continuous complex-linear dual of Lp(M,τ) (Hiai, Theorem 5.13). Supply the norming
element `y=u*|x|^(p−1)/‖x‖_p^(p−1)` from the polar decomposition x=u|x|, surjectivity by
restriction to bounded finite-trace corners `eMe` with consistency of the corner representatives
along an exhaustion, and the p=1, q=∞ case, which recovers V10.TracialLp's identification
L¹(M,τ)=M_*. For 1<p<∞ deduce reflexivity by BanachSpaceTheory B2's criterion. At p=1 identify
L¹(M,τ) with the normal functionals M_*, never with the whole dual M* (Hiai, Corollary 5.14).
Prove cyclicity `τ(xy)=τ(yx)` for x∈Lp, y∈Lq with 1/p+1/q=1 (Hiai, Proposition 5.7).
*Needs:* §1.3, §1.4; VonNeumannAlgebras V4.Core and V10.TracialLp; BanachSpaceTheory B1–B2; Hiai, §5.

**Checks.**
- M=ℓ∞ with counting measure: L¹=ℓ¹ has dual ℓ∞=M, while M*=(ℓ∞)* is strictly larger than ℓ¹
  (it contains the limit functionals), so the p=1 statement identifies L¹ with M_*, not with M*.
- The norming element for x=diag(3,1) in M₂(ℂ) and p=2: y=x/‖x‖₂ gives τ(xy)=10/√10=√10=‖x‖₂.
- Cyclicity on M₂(ℂ) with x=e₁₂ and y=e₂₁: `τ(xy)=τ(e₁₁)=1=τ(e₂₂)=τ(yx)`, although xy≠yx;
  for x∈L¹ unbounded and y∈M the traced products are the closed products of §1.3.

### 2.2 Compatible couples

Define a compatible Banach couple as two Banach spaces E₀,E₁ with injective continuous linear maps
into a common Hausdorff topological vector space Z (Cwikel, Definition 1.1). Define the
intersection E₀∩E₁ with norm `max(‖x‖₀,‖x‖₁)` and the sum E₀+E₁ with norm
`inf{‖x₀‖₀+‖x₁‖₁ : x=x₀+x₁}`; construct the sum as the quotient of the Banach direct sum E₀⊕E₁
by the closed kernel of `(x₀,x₁)↦x₀+x₁`, prove it is a Banach space, and prove independence of Z
under compatible endpoint isometries (Cwikel, §1, lines following Definition 1.1). A couple
morphism is one linear map on E₀+E₁ whose restrictions to the endpoints are bounded; two
unrelated endpoint maps are never a morphism. Define regular couples (E₀∩E₁ dense in each
endpoint) (Cwikel, Definition 1.3). Define Peetre's K-functional `K(t,x)=inf_(x=x₀+x₁)(‖x₀‖₀+t‖x₁‖₁)`
on E₀+E₁ for t>0 and prove it is nonnegative, subadditive in x, nondecreasing and concave in t,
with `K(t,x)≤min(‖x‖₀,t‖x‖₁)` on E₀∩E₁ and `K(t,x)=‖x‖_(E₀+E₁)` at t=1.
*Needs:* BanachSpaceTheory B1; Mathlib `ContinuousLinearMap`, `Submodule.Quotient`; Cwikel, §1;
Bergh–Löfström, §§2.3 and 3.1.

**Checks.**
- The couple (L¹,L∞) on (0,∞) with Lebesgue measure: `K(t,f)=∫₀ᵗ f*(s)ds` (the formula after
  Fack–Kosaki, Theorem 4.4), so for f=1_(0,1) one has `K(t,f)=min(t,1)`: the decomposition
  f=f+0 costs 1 and f=0+f costs t.
- The couple (E,E) with equal norms: E₀∩E₁=E₀+E₁=E with the same norm and `K(t,x)=min(1,t)‖x‖`;
  a sum norm without the infimum would give 2‖x‖.
- Non-regular couple: (c₀,ℓ∞) inside ℓ∞ has intersection c₀, dense in c₀ but not in ℓ∞, so
  the duality theorem of §2.3 does not apply to it; this is the negative control for the
  regularity hypothesis.

### 2.3 The complex method and Calderón's upper method

Construct `[E₀,E₁]_θ` for 0<θ<1 from the space F of bounded continuous functions from the closed
strip `{0≤Re z≤1}` to E₀+E₁, holomorphic inside, whose boundary values on `Re z=j` lie in E_j,
are continuous there and tend to 0 at vertical infinity, with norm `max_j sup_t ‖f(j+it)‖_j`; the
interpolation space is the image of evaluation at θ with the quotient norm (Bergh–Löfström,
§4.1; Cwikel, §2.1). Prove boundedness of evaluation by Mathlib's three-lines theorem
`Complex.HadamardThreeLines.norm_le_interpStrip_of_mem_verticalClosedStrip` applied to
`z↦⟨f(z),φ⟩` for φ in the dual of E₀+E₁, completeness, density of E₀∩E₁ for regular couples,
functoriality, and the operator estimate `‖T‖_θ≤‖T‖₀^(1−θ)‖T‖₁^θ` (Bergh–Löfström,
Theorem 4.1.2). Include the nonvanishing boundary formulation and its equivalence by Gaussian
multipliers `exp(δz²)`, the symmetry `[E₀,E₁]_θ=[E₁,E₀]_(1−θ)`, and regularization by replacing
each endpoint by the closure of E₀∩E₁ in it. Construct Calderón's upper method `[E₀,E₁]^θ` from
continuous sum-valued strip functions of at most linear growth, holomorphic inside, whose
boundary differences `g(j+it)−g(j+is)` lie in E_j with uniformly bounded Lipschitz quotients,
with norm the infimum of those Lipschitz bounds over g with g′(θ) the given element (Cwikel,
§2.2; Bergh–Löfström, §4.1). For a regular couple embed the endpoint duals into (E₀∩E₁)* and
prove Calderón's duality `([E₀,E₁]_θ)*=[E₀*,E₁*]^θ` isometrically (Cwikel, §2, Calderón's
theorem; Bergh–Löfström, Theorem 4.5.1). Prove that the lower and upper methods coincide with
equal norms when one endpoint is reflexive, and keep them distinct without that hypothesis.
Prove reiteration: for a regular couple and `X_j=[E₀,E₁]_(θ_j)` with 0≤θ₀<θ₁≤1 (the original
endpoint at θ_j∈{0,1}) and E₀∩E₁ dense in X₀∩X₁, `[X₀,X₁]_η=[E₀,E₁]_((1−η)θ₀+ηθ₁)` with equal
norms for 0<η<1 (Bergh–Löfström, Theorem 4.6.1), by the affine strip composition for one
inequality and duality for the other.
*Needs:* §2.2; Mathlib `Complex.HadamardThreeLines.norm_le_interpStrip_of_mem_verticalClosedStrip`,
`DiffContOnCl`; BanachSpaceTheory B1–B2; Bergh–Löfström, Chapter 4; Cwikel, §2.

**Checks.**
- `[L¹,L∞]_θ=L^p` with `1/p=1−θ` on any measure space, by the scalar case of §2.5: θ=1/2 gives
  L²; a convention reading `1/p=θ` would give the wrong space for every θ≠1/2.
- On ℂ² with the two norms `‖·‖_∞` and `‖·‖_2`: `[ℓ∞₂,ℓ²₂]_(1/2)=ℓ⁴₂` isometrically, since
  `1/q=(1−θ)·0+θ/2=1/4` (the scalar Riesz–Thorin case of the sequence identity in §2.5).
- The duality theorem fails for the non-regular couple (c₀,ℓ∞) of §2.2, whose endpoint duals
  ℓ¹ and (ℓ∞)* are not both embedded in one space through E₀∩E₁=c₀ compatibly.
- Operator estimate: let T be the identity from the constant couple (E,E) to the couple (E,E′)
  where E′ is E with its norm doubled. Then ‖T‖₀=1, ‖T‖₁=2, and `[E,E′]_θ` carries exactly
  the norm 2^θ‖·‖ (the function `f(z)=2^(θ−z)x` has both boundary norms 2^θ‖x‖, and the
  three-lines theorem on functionals gives the reverse inequality), so ‖T‖_θ=2^θ: the estimate
  with the exponents interchanged would give 2^(1−θ), wrong for every θ≠1/2.

### 2.4 The real method

Construct `(E₀,E₁)_(θ,q)` for 0<θ<1 and 1≤q≤∞ as the elements of E₀+E₁ with finite norm
`‖t^(−θ)K(t,x)‖_(L^q((0,∞),dt/t))` (Bergh–Löfström, §3.1). Prove the sum and intersection
estimates `E₀∩E₁⊆(E₀,E₁)_(θ,q)⊆E₀+E₁` with norms, completeness, interpolation of operators with
`‖T‖_(θ,q)≤‖T‖₀^(1−θ)‖T‖₁^θ`, monotonicity in q, and invariance under endpoint isomorphisms
(Bergh–Löfström, Theorems 3.1.2 and 3.4.1). Prove the scalar identification
`(L¹,L∞)_(θ,q)=L^(p,q)` with `1/p=1−θ` for the Lorentz gauge of §1.6, using
`K(t,f)=∫₀ᵗ f*` and the weighted Hardy inequalities for nonincreasing functions in the full
range 1≤q≤∞ by dyadic integral-to-sum comparison (Bergh–Löfström, Theorem 5.2.1 and §5.3), and
reuse the scalar Marcinkiewicz engine of Tau Ceti for the weak-type endpoint estimates rather
than reproving distribution-function inequalities.
*Needs:* §1.6, §2.2; Tau Ceti `TauCeti.lintegral_rpow_le_of_meas_ofReal_lt_le`,
`TauCeti.lintegral_rpow_le_of_mul_meas_ofReal_lt_le`; Bergh–Löfström, Chapters 3 and 5.

**Checks.**
- (E,E)_(θ,q)=E with an equivalent norm: `K(t,x)=min(1,t)‖x‖`, and
  `‖t^(−θ)min(1,t)‖_(L^q(dt/t))` is finite exactly because 0<θ<1; at θ=0 or 1 the integral
  diverges, which is why the endpoints are excluded.
- `(L¹,L∞)_(1/2,2)=L²` with equivalent norms on (0,∞): for f=1_(0,1), `K(t,f)=min(t,1)` and
  `∫ t^(−1)min(t,1)² dt/t=∫₀¹ t dt+∫₁^∞ t^(−2) dt=1/2+1=3/2`, finite, matching `‖f‖₂=1` up to
  the equivalence constant.
- `(L¹,L∞)_(θ,∞)` is weak L^p: for `f=t^(−1/p)` the gauge `sup t^(−θ)K(t,f)` with
  `K(t,f)=∫₀ᵗ s^(−1/p)ds=t^(1−1/p)/(1−1/p)` is finite exactly when θ=1−1/p.

### 2.5 Interpolation of semifinite Lp couples

For a semifinite (M,τ), use M̃ as the ambient space of the couples (Lp₀,Lp₁) and prove, for
1≤p₀,p₁≤∞ and `1/p=(1−θ)/p₀+θ/p₁`, that `[Lp₀(M,τ),Lp₁(M,τ)]_θ=Lp(M,τ)` isometrically, including
the constant couple p₀=p₁ (Pisier–Xu, *Non-Commutative Lp-Spaces*, §2; Bergh–Löfström,
Theorem 5.1.1 for the scalar model). Construct the analytic families `z↦u|x|^(p(1−z)/p₀+pz/p₁)`
with spectral cutoffs for the inequality `‖x‖_θ≤‖x‖_p`, and prove the reverse inequality by the
duality of §2.1 and §2.3. For p₀<p₁ prove `(Lp₀,Lp₁)_(θ,q)=L^(p,q)(M,τ)` with equivalent norms
for 1≤q≤∞, so q=p gives Lp with an equivalent norm, by the singular-number retraction for a fixed
x∈L¹+M: compatible linear endpoint contractions T,S between the couple (L¹(M,τ),M) and the scalar
couple (L¹(0,∞),L∞(0,∞)) with `T(x)=μ(x)` and `S(μ(x))=x`, built from the spectral projections
of |x|; these maps depend on x and transfer the K-functional comparison `K(t,x)=∫₀ᵗ μ_s(x)ds`
(Fack–Kosaki, formula after Theorem 4.4). Prove the finite-vector-valued sequence identity
`[ℓ_(q₀)^N(E₀),ℓ_(q₁)^N(E₁)]_θ=ℓ_q^N([E₀,E₁]_θ)` with equal norms and `1/q=(1−θ)/q₀+θ/q₁`,
including the endpoint q_j=∞ on finite index sets (Bergh–Löfström, Theorem 5.1.2); this is the
interpolation lemma for the two-term Clarkson map of §5.5.
*Needs:* §1.1, §2.1, §2.3, §2.4; VonNeumannAlgebras V10.TracialLp; Bergh–Löfström, Chapter 5;
Pisier–Xu, *Non-Commutative Lp-Spaces*, §2.

**Checks.**
- p₀=1, p₁=∞, θ=1/2: `1/p=1/2`, so `[L¹(M,τ),M]_(1/2)=L²(M,τ)` isometrically; for M=M₂(ℂ)
  this is the Hilbert–Schmidt norm, and a convention with `1/p=θ/p₀+(1−θ)/p₁` would give the
  same here but L⁴ instead of L^(4/3) at θ=1/4.
- The retraction for x=diag(3,1) in M₂(ℂ): `T(x)=μ(x)=3·1_(0,1)+1·1_[1,2)` and `K(t,x)=∫₀ᵗ μ`
  equals 3t for t≤1 and 2+t for 1≤t≤2 and 4 beyond, with `K(1,x)=3=‖x‖_(L¹+M)`.
- The sequence identity at N=2, E₀=E₁=ℂ, q₀=∞, q₁=2, θ=1/2 gives `1/q=1/4`, the ℓ⁴₂ example of
  §2.3; without the endpoint q_j=∞ clause the identity would not cover the Clarkson map.

### 2.6 Noncommutative Riesz–Thorin

Deduce from §2.3 and §2.5 the noncommutative Riesz–Thorin theorem: a linear map between the
sums of two semifinite Lp couples that is bounded Lp_j→Lq_j (j=0,1) is bounded Lp_θ→Lq_θ with
`‖T‖≤‖T‖₀^(1−θ)‖T‖₁^θ`, for the interpolated exponents. Prove agreement with PDE's scalar
Riesz–Thorin theorem through the commutative identification of §1.5 and with finite-dimensional
Schatten interpolation through the matrix identification.
*Needs:* §1.5, §2.3, §2.5; PDE item 9.

**Checks.**
- The transpose on M_d(ℂ) is an isometry of S₁ and of S_∞, hence of every S_p; the estimate
  gives norm at most 1 at every θ.
- The map `x↦e₁₁xe₁₁` has norm 1 on every Lp, and the interpolated bound is 1.
- The scalar case on ℂ^N with counting measure is PDE's theorem: the identity has norm 1 from
  ℓ¹_N to ℓ∞_N and norm N from ℓ∞_N to ℓ¹_N, so at θ=1/2 the theorem bounds its norm on ℓ²_N by
  √N, consistent with the value 1 and showing that the bound is not sharp; the pairs (p_j,q_j)
  are interpolated together, never one exponent at a time.

### Examples

- (L¹(M,τ),M) for M=M_d(ℂ): every interpolation space is M_d(ℂ) with a Schatten norm, and the
  K-functional is the Ky Fan sum `K(t,x)=∫₀ᵗ s_⌊s⌋(x)ds`.
- (L¹,L∞) on (0,∞): `[·,·]_θ` gives Lp and `(·,·)_(θ,q)` gives L^(p,q) with `1/p=1−θ`.
- A couple with one reflexive endpoint, (L¹(M,τ),L²(M,τ)): lower and upper complex methods
  coincide.

### Dependencies

Layer 2 needs Layer 1, VonNeumannAlgebras V4.Core and V10.TracialLp, BanachSpaceTheory B1–B2,
PDE item 9, Tau Ceti's Marcinkiewicz engine, and Mathlib's three-lines theorem.

## Layer 3: Haagerup spaces and their intrinsic operations

### 3.1 The core and the covariance definition

For an arbitrary M choose an n.s.f. weight φ (VonNeumannAlgebras Layer 11), form the continuous
core `R=M⋊_(σ^φ)ℝ` with its canonical trace Tr_core and dual action θ, in the conventions above,
and extend θ to the Tr_core-measurable algebra R̃ as a one-parameter group of homeomorphic
*-automorphisms for the measure topology, using `θ_s(V(ε,δ)∩R)=V(ε,e^s δ)∩R` (Hiai,
Lemma 11.1, with the sign of s reversed). For finite p>0 define Haagerup's
`Lp(M,φ)={x∈R̃ : θ_s(x)=exp(s/p)x for all s}` (Hiai, Definition 11.7, with the opposite
character). Prove it is a linear subspace of R̃ closed under adjoint, that `|x|∈Lp` when `x∈Lp`,
that products carry Lp×Lq into Lr for 1/r=1/p+1/q, and that the partial isometry of the polar
decomposition of an Lp element lies in M=R^θ while its modulus satisfies the same covariance
(Hiai, after Definition 11.7, and Lemma 11.12 for p≥1). Put L∞(M)=M (Hiai, Proposition 11.8).
*Needs:* §1.2; VonNeumannAlgebras Layer 11 (continuous core, canonical trace, dual action, dual
fixed-point theorem `R^θ=M`); Hiai, §11.2.

**Checks.**
- For M semifinite with trace τ, R=M⊗̄L∞(ℝ) with trivial action, θ_s translation by s and
  `Tr_core=τ⊗e^u du` (so that `Tr_core∘θ_s=e^s Tr_core`): the function `u↦e^(−u/p)` tensored
  with x∈M satisfies `θ_s(x⊗e^(−u/p))=e^(s/p)x⊗e^(−u/p)`, so these elements lie in Lp(M,τ)
  in the Haagerup sense; with the character `e^(−s/p)` the elements `x⊗e^(u/p)` would be chosen
  instead, and the sign is pinned by the trace scaling.
- Distinct exponents meet only in 0: if `θ_s(x)=e^(s/p)x=e^(s/q)x` for all s with p≠q then
  x=0 (Hiai, after Definition 11.7); so Lp∩Lq={0} inside R̃, unlike the tracial spaces.
- The polar partial isometry: for x∈Lp with x=u|x|, uniqueness of polar decomposition applied
  to `θ_s(x)=θ_s(u)θ_s(|x|)=e^(s/p)x` gives `θ_s(u)=u`, hence u∈M; a definition putting u in R
  only would lose the M-bimodule structure.

### 3.2 Dual weights, densities and L¹(M)=M_*

Consume Layer 11's dual fixed-point theorem `R^θ=M` and the Pedersen–Takesaki theorem (Hiai,
Theorem 9.4), and compare the coefficient inclusion of M with the normalized Tr_core-density of
the dual weight, including supported nonfaithful weights and their domains. Prove the
dual-weight characterization: the map φ↦φ̂ is a bijection from the normal semifinite weights on
M onto the θ-invariant normal semifinite weights on R, with `s(φ̂)=s(φ)` (Hiai, Lemma 11.2(3)),
by the route: for a faithful θ-invariant ψ on R, the Connes cocycle `(Dψ:Dφ̂₁)_t` is θ-invariant,
hence a σ^(φ₁)-cocycle in M, hence of the form `(Dφ:Dφ₁)_t` for a unique φ, and `φ̂=ψ`; for a
nonfaithful ψ the support projection is θ-fixed, hence in M, and one adds the dual of a weight
supported on the complement, applies the faithful case and compresses, using Layer 11's cocycle
core isomorphism to identify the corner core pRp with the core of pMp (Hiai, proof of
Lemma 11.2). Construct the inverse through the canonical operator-valued weight T from R to M,
`φ̂=(φ∘π⁻¹)∘T` with `T(x)=∫θ_s(x)ds` (Haagerup 1978 II, Theorem 3.1(b),(d); Hiai,
Theorem 10.13), and prove uniqueness and support correspondence. For a normal semifinite weight
ω on M let h_ω be the positive operator affiliated with R with `ω̂=Tr_core(h_ω ·)` (Hiai,
Lemma 11.2(2) and (11.1)). Prove `Tr_core(1_(λ,∞)(h_ω))=ω(1)/λ` for λ>0 (Hiai, proof of
Lemma 11.3 and (11.7)) and deduce that h_ω is Tr_core-measurable iff ω is bounded (Hiai,
Lemma 11.3); this is the surjectivity step for positive elements of L¹(M). Prove that ω↦h_ω
extends to a linear order isomorphism `M_*≃L¹(M,φ)` with `h_(xωy*)=xh_ωy*`, `h_(ω*)=h_ω*` and
polar decomposition `h_ω=u h_|ω|` (Hiai, Theorem 11.5), independent of the decomposition of a
functional into positive parts. Define `tr_H(h_ω)=ω(1)` and prove positivity, faithfulness,
`|tr_H(x)|≤tr_H(|x|)` and `‖x‖₁=tr_H(|x|)=‖ω‖` (Hiai, Definition 11.6).
*Needs:* §3.1; VonNeumannAlgebras V4.PositivePredual and Layer 11 (Pedersen–Takesaki theorem,
Connes cocycles, dual fixed-point theorem, cocycle core isomorphism); Haagerup 1978 II,
Theorem 3.1; Hiai, §11.1.

**Checks.**
- Sign witness. With `Tr_core∘θ_s=e^s Tr_core` and ω̂ θ-invariant, `Tr_core(h_ω θ_s(y))=Tr_core(h_ω y)`
  and `Tr_core(h_ω θ_s(y))=e^s Tr_core(θ_(−s)(h_ω)y)` force `θ_s(h_ω)=e^s h_ω`: the density of
  a bounded functional lies in L¹ for the character `e^(s/1)`, and `h_ω^(1/p)` lies in Lp. With
  the opposite trace scaling the character would be `e^(−s)`, which is Hiai's (11.4).
- M=ℂ, ω=id: R=L∞(ℝ) with `Tr_core=e^u du`, ω̂=Lebesgue measure, `h_ω=e^(−u)`, and
  `Tr_core(1_(λ,∞)(h_ω))=∫_(u<−log λ) e^u du=1/λ=ω(1)/λ`; the density `e^(+u)` would give an
  infinite value and is excluded.
- `μ_t(h_ω)=inf{λ : ω(1)/λ≤t}=ω(1)/t` for t>0, so h_ω is measurable (the distribution is finite
  for every λ>0) while `Tr_core(h_ω)=∫₀^∞ ω(1)/t dt=∞`: a bounded functional has a measurable
  but not trace-class density.
- Nonfaithful case: ω=(1,0) on M=ℂ²: s(ω)=e₁₁, `h_ω=e₁₁⊗e^(−u)`, and the characterization
  recovers ω from ω̂ supported on `e₁₁⊗1`, which is θ-fixed; a weight on R whose support is
  not θ-fixed (such as `Tr_core(1_(0,1)(u)·)`) is not θ-invariant and is not a dual weight.

### 3.3 Norms, the μ formula, Hölder and completeness

Define `‖x‖_p=tr_H(|x|^p)^(1/p)` for x∈Lp(M,φ), 0<p<∞, noting `|x|^p∈L¹`. Prove definiteness
and `‖x*‖_p=‖x‖_p=‖|x|‖_p`. Prove the distribution formula `Tr_core(1_(λ,∞)(|x|))=λ^(−p)‖x‖_p^p`
for λ>0, equivalently `μ_t(x)=t^(−1/p)‖x‖_p` for t>0 (Hiai, Lemma 11.14, (11.9)), and deduce
`Tr_core(|x|^p)=∞` for x≠0 (Hiai, Remark 11.9) and `V(ε,δ)∩Lp(M)={‖x‖_p≤εδ^(1/p)}` (Hiai,
Lemma 11.14). Derive Hölder with constant one, `‖xy‖_r≤‖x‖_p‖y‖_q` for 1/r=1/p+1/q, from the
product log-submajorization of §1.4 applied in R̃: inserting `μ_t(x)=t^(−1/p)‖x‖_p` and
`μ_t(y)=t^(−1/q)‖y‖_q` the logarithmic t-terms cancel (Hiai, Theorem 11.22 for 1≤p,q≤∞ by
the three-lines route). Derive the triangle inequality for 1<p<∞ from the integrated Ky Fan
inequality of §1.4, since `∫₀¹ s^(−1/p)ds=p/(p−1)` is finite there, and at p=1 from the predual
norm (Hiai, Proposition 11.24 and Theorem 11.25). For 0<p<1 derive the p-triangle inequality
from the concave integrated inequality of §1.4 with `g(s)=s^r`, 0<r<p: insert the μ formula,
cancel the finite factor `∫₀¹ s^(−r/p)ds=p/(p−r)`, and let r↑p. Prove completeness of Lp(M) for
every finite p from the measure-topology comparison and the completeness of R̃ (Hiai,
Theorem 11.25(a), and the same argument below p=1); ordinary core Lp integrability cannot replace
this, since no nonzero element is core-integrable. Prove the bounded-multiplier estimate
`‖xay‖_p≤‖x‖‖y‖‖a‖_p` for x,y∈M (Hiai, Lemma 11.16).
*Needs:* §1.2, §1.4, §3.1, §3.2; Hiai, §11.2.

**Checks.**
- p=2, ‖x‖₂=1, λ=2: `Tr_core(1_(2,∞)(|x|))=2^(−2)=1/4`, and `μ₄(x)=inf{λ : λ^(−2)≤4}=1/2=4^(−1/2)`;
  a formula with `λ^(−1)` in place of `λ^(−p)` would give 1/2 for the distribution and would
  contradict `μ_t(|x|²)=μ_t(x)²`.
- The triangle inequality at p=2 from Ky Fan: `∫₀¹ s^(−1/2)ds=2` on both sides, giving
  `2‖x+y‖₂≤2‖x‖₂+2‖y‖₂`; at p=1 the integral `∫₀¹ s^(−1)ds` diverges and gives no information,
  which is why p=1 uses the predual norm.
- p=1/2, r=1/4: the concave inequality with `g(s)=s^(1/4)` and the μ formula gives
  `(1−1/2)^(−1)‖x+y‖_(1/2)^(1/4)≤(1−1/2)^(−1)(‖x‖_(1/2)^(1/4)+‖y‖_(1/2)^(1/4))`, that is
  `‖x+y‖_(1/2)^(1/4)≤‖x‖_(1/2)^(1/4)+‖y‖_(1/2)^(1/4)`; letting r↑1/2 gives the p-triangle
  inequality `‖x+y‖_(1/2)^(1/2)≤‖x‖_(1/2)^(1/2)+‖y‖_(1/2)^(1/2)`, which on M=ℂ² (the ℓ^(1/2) check
  of §1.3) is an equality for x=e₁, y=e₂.
- Hölder for M=ℂ, p=q=2: x=h^(1/2), y=h^(1/2) with h=h_id: `xy=h`, `‖h‖₁=1=‖x‖₂‖y‖₂`; in the
  log-submajorization the terms `log t^(−1/2)+log t^(−1/2)=log t^(−1)` match the left side.

### 3.4 Duality, the standard form, bimodule structure and corners

Develop polar powers `|x|^s∈L^(p/s)` for x∈Lp, the factorization x=yz with y∈Lp, z∈Lq and
`‖x‖_r=‖y‖_p‖z‖_q`, and cyclicity `tr_H(xy)=tr_H(yx)` for conjugate products (Hiai,
Proposition 11.20 and Proposition 11.29). Prove the duality `Lp(M)*≃Lq(M)` for 1≤p<∞ and
1/p+1/q=1 under `(x,y)↦tr_H(xy)` (Hiai, Theorem 11.28), reflexivity for 1<p<∞, and identify
L²(M) with the standard form of Layer 11: left and right actions, the involution `J=*` and the
positive cone L²(M)⁺ (Hiai, Theorem 11.30). Build the bounded bimodule actions of M, positivity,
supports, matrices M_n(Lp(M))=Lp(M_n(M)), functorial transport along normal *-isomorphisms, and
corners: `Lp(eMe)=eLp(M)e` for a projection e∈M (Hiai, Remark 11.31). Prove that the left and
right supports of every finite-p element are σ-finite projections, and the identity
`Lp(M)=⋃_e eLp(M)e` over σ-finite projections e, with compatible embeddings and norms of the
corners.
*Needs:* §3.1–§3.3; VonNeumannAlgebras V4.Core, V5 and Layer 11 (standard form); Hiai, §11.2.

**Checks.**
- Duality at p=1: `L¹(M)*=M` by `tr_H(hx)=ω(x)` for h=h_ω, which is the predual pairing of §3.2;
  `L¹(M)*` is not M* (the ℓ∞ example of §2.1).
- Corners: for M=M₂(ℂ) and e=e₁₁, `eL¹(M)e` is the Haagerup L¹ of ℂ, one-dimensional, and the
  norm of `e h_ω e` is `ω(e)`; a definition of the corner space through the core trace alone
  would not see the compatibility `tr_H(e h e)=ω(e)`.
- σ-finite supports: in `ℓ∞(I)` for an uncountable I, an element of L¹ is a summable family,
  so its support is countable; the union identity reads L¹=⋃ over countable subsets.

### 3.5 Weight independence and the tracial comparison

Consume Layer 11's cocycle isomorphism between the cores of two n.s.f. weights, preserving the
embedded M, the dual action and the canonical trace. Extend it to the measurable algebras, show it
carries h_ω to h_ω for every ω∈M_*⁺, and induces isometric isomorphisms `Lp(M,φ)→Lp(M,ψ)` for
every p, satisfying the identity and cocycle composition laws (Hiai, Remark 11.10). Define
weight-independent Lp(M) through this coherent family. For a semifinite trace τ identify
Lp(M,τ) of §1.3 with the Haagerup model by `x↦x h_τ^(1/p)`, the closed product formed through
common affiliated spectral truncations in the trivial-action core (Hiai, Example 11.11): prove the
product is Tr_core-measurable, that the map is a surjective isometry compatible with star,
products and duality, and that L∞ is identified by the fixed-point inclusion. Here h_τ is the
dual-weight density of τ, possibly unbounded and not assumed Tr_core-measurable or in L¹(M).
*Needs:* §3.1–§3.4; VonNeumannAlgebras Layer 11 (cocycle core isomorphism); Hiai, Remark 11.10
and Example 11.11.

**Checks.**
- M=M_d(ℂ) with τ the unnormalized trace: `h_τ=1⊗e^(−u)` in `M_d⊗̄L∞(ℝ)`, `x h_τ^(1/p)=x⊗e^(−u/p)`,
  and `tr_H(|x⊗e^(−u/p)|^p)=tr_H(|x|^p⊗e^(−u))=τ(|x|^p)`, so the map is isometric; with the
  state tr/d in place of τ the same element has norm `(τ(|x|^p)/d)^(1/p)`.
- For M=ℂ with τ=id, h_τ=h_id is measurable (§3.2); for M=ℓ∞(ℕ) with the counting trace, h_τ
  has `Tr_core(1_(λ,∞)(h_τ))=∞` for every λ, so it is not measurable and the identification must
  go through truncations `1_[0,n](h_τ)`.
- Independence: for M=M₂(ℂ) and the two weights tr and tr(diag(1,2)·), the cocycle isomorphism
  of cores is implemented by the unitary `diag(1,2)^(iu)` and carries `h_ω` to `h_ω`; the
  induced map on L¹ is the identity of M₂(ℂ) with the trace norm.

### Examples

- M semifinite: Lp(M) is the tracial Lp of Layer 1 with the trace norm, through §3.5.
- M=B(H): Lp(M)=S_p with the trace norm and the standard form on the Hilbert–Schmidt class.
- M a type III factor: every nonzero element of Lp(M), p<∞, is unbounded, and Lp∩Lq={0}
  inside R̃ for p≠q.

### Dependencies

Layer 3 needs Layers 1–2 and VonNeumannAlgebras V4.Core, V4.PositivePredual, V5 and Layer 11.

## Layer 4: State interpolation, inclusions and expectations

### 4.1 Kosaki's interpolation

For a faithful normal state φ on M define the left embedding `j_φ:M→M_*`, `j_φ(x)(y)=φ(yx)`,
prove it is contractive, injective and has dense range, and form the compatible couple (M,M_*)
with j_φ. Construct Kosaki's isometric identification `[M,M_*]_(1/p)≃Lp(M)` for 1<p<∞ (Kosaki,
*Applications of the complex interpolation method to a von Neumann algebra*, cited by locator
as the main theorem of that paper, and Pisier–Xu, *Non-Commutative Lp-Spaces*, §3;
Haagerup–Junge–Xu, §5, use it in the same form). On the dense embedded copy
identify `j_φ(x)` with `x h_φ^(1/p)`, and prove compatibility with the GNS norm at p=2. Develop
the right embedding `x↦h_φ^(1/p)x` and the symmetric embedding, whose dense elements are
`h_φ^(1/(2p))xh_φ^(1/(2p))`, with their explicit identifications. Prove the weighted
analytic-family and modular-translation estimates used by these identifications, including
approximation by σ^φ-analytic elements.
*Needs:* §2.3, §3.2–§3.4; VonNeumannAlgebras Layer 11 (modular group, analytic elements); Hiai,
Lemma 12.5 (`σ^φ_t=Ad h_φ^(it)`); Pisier–Xu, *Non-Commutative Lp-Spaces*, §3.

**Checks.**
- M=ℂ, φ=id: the couple is (ℂ,ℂ) with equal norms, and `[ℂ,ℂ]_θ=ℂ` isometrically for every θ.
- M=M_d(ℂ), φ=tr/d: `h_φ=1/d` in the sense of §3.5 (density of the state against the trace), so
  `x h_φ^(1/p)` has Haagerup norm `(tr(|x|^p)/d)^(1/p)`, the normalized Schatten norm; the
  unnormalized Schatten norm belongs to the trace, which is not a state when d>1.
- Symmetric embedding on the same algebra: `h_φ^(1/(2p))xh_φ^(1/(2p))=d^(−1/p)x` agrees with the
  left embedding because h_φ is central. For the non-tracial state φ=tr(diag(1,2)·)/3 on
  M₂(ℂ), with `h_φ=diag(1,2)/3`, the left image of x=e₁₂ is `(2/3)^(1/p)e₁₂` and the symmetric
  image is `(2/9)^(1/(2p))e₁₂`, differing by the factor `2^(1/(2p))`: the identification of the
  two interpolation spaces is the modular translation `x↦h_φ^(−1/(2p))xh_φ^(1/(2p))` on
  analytic elements, not the identity map.

### 4.2 Re-embedding, reiteration and operator interpolation

Before interpolating two finite Haagerup exponents, re-embed both spaces compatibly into one
reference L¹(M) by `Lp(M)∋x↦x h_φ^(1−1/p)`; different covariance degrees inside R̃ do not form
the usual interpolation couple by their inclusion in R̃ alone. Prove the reiteration formula
`[Lp₀(M),Lp₁(M)]_θ=Lp(M)` with `1/p=(1−θ)/p₀+θ/p₁` and the operator-interpolation formulas with
these embeddings, by §2.3's reiteration applied to Kosaki's couple (Pisier–Xu,
*Non-Commutative Lp-Spaces*, §3). Do not assert that the real interpolation of an arbitrary
state couple is this isometric construction.
*Needs:* §2.3, §4.1.

**Checks.**
- p₀=1 (the predual), p₁=∞ (M), θ=1/2: the reiteration recovers Kosaki's L²(M) with its GNS norm.
- Inside R̃ the spaces L¹(M) and L²(M) intersect in 0 (§3.1), so a "couple" (L¹,L²) with the
  inclusions into R̃ has sum norm given by no decomposition and K-functional
  `K(t,x)=min(‖x‖₁,t‖x‖₂)` only after the re-embedding.
- For M semifinite the re-embedded couple is the tracial couple of §2.5 after §3.5, and the
  two reiteration formulas agree.

### 4.3 Inclusions and conditional expectations on Lp

For a unital von Neumann subalgebra N⊆M invariant under σ^φ, consume Layer 11's Takesaki theorem
giving the unique normal φ-preserving expectation `E:M→N` commuting with σ^φ (Hiai, Theorem 6.6;
Takesaki II, Theorem IX.4.2, cited by locator); every unital subalgebra of a finite tracial
algebra with its restricted trace is such a pair (Hiai, Theorem 6.4). Construct the core
inclusion `N⋊ℝ⊆M⋊ℝ`, its expectation, and the consistent isometric inclusions `Lp(N)→Lp(M)` and
positive contractive projections `E_p:Lp(M)→Lp(N)` for 1≤p≤∞ (Haagerup–Junge–Xu, §2, and
Junge–Xu as cited there), with the symmetric formula
`E_p(h_φ^(1/(2p))xh_φ^(1/(2p)))=h_(φ|N)^(1/(2p))E(x)h_(φ|N)^(1/(2p))` on dense elements. Prove
composition `E_p∘E′_p=E″_p` for a tower N⊆N′⊆M, idempotence, star preservation, duality
`(E_p)*=E_q` for 1/p+1/q=1, and the bimodule identity `E_r(axb)=aE_p(x)b` for a∈Lq(N),
x∈Lp(M), b∈Ls(N) with `1/r=1/q+1/p+1/s≤1` (Haagerup–Junge–Xu, §6, (6.5)). The p=1 map is the preadjoint of the inclusion
N→M; distinguish it from the inclusion of preduals implemented by E. Construct the inclusions
`Lp(N)→Lp(M)` for 0<p<1 through the core, and do not claim a contractive expectation there.
*Needs:* §3.4, §3.5, §4.1; VonNeumannAlgebras V7.Index and Layer 11 (Takesaki's
conditional-expectation theorem); Hiai, §6.1; Haagerup–Junge–Xu, §2.

**Checks.**
- Two-point counterexample below p=1: M=ℂ² with the state (1/2,1/2), N=ℂ, E the average,
  x=(1,0): `‖x‖_p=(1/2)^(1/p)` and `‖E(x)‖_p=1/2`, so E is contractive on Lp iff `1/2≤(1/2)^(1/p)`
  iff p≥1; at p=1/2 the values are 1/2 versus 1/4.
- Tracial case: M=M₂(ℂ) with tr/2, N the diagonal algebra, E the diagonal part: `E_p(e₁₂)=0`,
  `E_p(e₁₁)=e₁₁`, and `‖E_p(x)‖_p≤‖x‖_p` is the pinching inequality.
- Nontracial positive witness: for φ=tr(diag(1,2)·)/3 on M₂(ℂ) the diagonal algebra N is
  invariant under `σ^φ_t=Ad diag(1,2)^(it)`, the diagonal part E preserves φ and commutes with
  σ^φ, and Takesaki's theorem returns this E; the symmetric formula gives
  `E_p(h_φ^(1/(2p))e₁₂h_φ^(1/(2p)))=0` and `E_p(h_φ^(1/(2p))e₁₁h_φ^(1/(2p)))=(1/3)^(1/p)e₁₁`.
- A non-invariant subalgebra: M=M₂(ℂ) with φ=tr(diag(1,2)·)/3 and N the span of 1 and the
  symmetric matrix e₁₂+e₂₁: `σ^φ_t(e₁₂+e₂₁)=2^(−it)e₁₂+2^(it)e₂₁∉N` for t≠0, so no φ-preserving
  expectation onto N exists, and no E_p is constructed.
- p=1 preadjoint: for ω∈N_* the inclusion of preduals is `ω∘E∈M_*`, while E₁ sends ω∈M_* to its
  restriction `ω|N`; on M=ℂ², N=ℂ these are `c↦(c/2,c/2)` and `(a,b)↦a+b`, adjoint to each
  other but not inverse.

### 4.4 Bochner spaces

For a probability space (Ω,P) and 1≤p<∞ identify the Bochner space `Lp(Ω;Lp(M))` of Mathlib's
`MeasureTheory.Lp` with `Lp(L∞(Ω)⊗̄M)` for Layer 11's product state or weight, isometrically,
with density of simple tensors, the norm formula `‖f‖^p=∫‖f(ω)‖_p^p dP`, and compatibility with
conditional expectations in the Ω variable and with finite sign averages. Prove the
finite-matrix version `Lp(M_n(M))=Lp(M_n(ℂ)⊗̄M)` and the row and column versions used in
Layer 6.
*Needs:* §3.4, §3.5, §4.3; VonNeumannAlgebras V2 and Layer 11 (tensor-product weights); Mathlib
`MeasureTheory.Lp`; Pisier–Xu, *Non-Commutative Lp-Spaces*, §3.

**Checks.**
- Ω two points with masses 1/2, M=ℂ: both sides are ℓ^p₂ with the weights 1/2, and the norm
  formula reads `(|a|^p/2+|b|^p/2)^(1/p)`.
- Ω two points, M=M₂(ℂ): the norm of `f=(x,y)` is `((‖x‖_p^p+‖y‖_p^p)/2)^(1/p)`, which is the
  Lp norm of diag(x,y) in `M₂(M₂(ℂ))` with the weight (1/2)⊗τ, not the operator-space
  `max(‖x‖,‖y‖)`.
- Sign average: for `f(ε)=εx` on the two-point sign space, `E f=0` and `‖f‖=‖x‖_p`; so the
  conditional expectation onto the constants is contractive but not isometric.

### Examples

- M_d(ℂ) with tr/d: Kosaki's Lp is the normalized Schatten space, the symmetric and left
  embeddings coincide, and E_p for the diagonal subalgebra is the pinching.
- A finite tracial algebra with any unital subalgebra: the tracial expectation of Hiai,
  Theorem 6.4, and its Lp extensions, used by Layer 7.
- L∞(Ω)⊗̄M for a probability space: the Bochner identification of §4.4.

### Dependencies

Layer 4 needs Layers 2–3 and VonNeumannAlgebras V2, V7.Index and Layer 11, with Mathlib
`MeasureTheory.Lp`.

## Layer 5: Finite-algebra reduction and Lp geometry

### 5.1 The discrete reduction algebra

For σ-finite M with faithful normal state φ let `G=⋃_(n≥1) 2^(−n)ℤ` with the discrete topology
and `R=M⋊_(σ^φ|G)G`, a discrete crossed product of V8 (not the continuous core). Construct the
faithful normal state `φ̂=φ∘E_M` from V8's canonical expectation `E_M:R→M`. Prove that σ^φ̂
restricts to σ^φ on M, fixes each `λ(g)`, and that `σ^φ̂_g=Ad λ(g)` for g∈G (Haagerup–Junge–Xu,
§2, (2.2)–(2.3)). Let `b_n=f(λ(2^(−n)))` by Borel functional calculus with `f(e^(iθ))=θ` for
0≤θ<2π, so f(1)=0, put `a_n=2^n b_n` and `φ_n(x)=φ̂(e^(−a_n)x)`. Prove that b_n lies in the
centre of the centralizer of φ̂, derive `σ^(φ_n)_t=Ad(e^(−ita_n))∘σ^φ̂_t` and its period
`2^(−n)`, and set `R_n=R_(φ_n)`, the centralizer (Haagerup–Junge–Xu, Lemma 2.4(i)).
*Needs:* VonNeumannAlgebras V8 (discrete crossed products and the canonical expectation) and
Layer 11 (modular groups, Connes cocycles); Haagerup–Junge–Xu, §2.

**Checks.**
- Period witness: `e^(ib_n)=λ(2^(−n))` by the choice of f, so `e^(−i2^(−n)a_n)=e^(−ib_n)=λ(2^(−n))*`,
  and `σ^(φ_n)_(2^(−n))=Ad(λ(2^(−n))*)∘Ad(λ(2^(−n)))=id`. With the branch `f(e^(iθ))=θ` on
  `−π≤θ<π` the period is the same but b_n is no longer positive, and a_n no longer satisfies
  the monotone comparison used in §5.2.
- M=ℂ, φ=id: R is the group von Neumann algebra of the abelian group G, every state has
  centralizer R, so R_n=R and Φ_n=id for all n; the theorem of §5.2 is then trivial.
- M=M₂(ℂ) with φ=tr/2 (tracial): σ^φ is trivial, R=M₂(ℂ)⊗̄L(G) is finite with the trace φ̂, and
  R_n is the commutant of `λ(2^(−n))` in R, which is `M₂(ℂ)⊗̄L(G)` since G is abelian; so again
  R_n=R.

### 5.2 Finite stages and their expectations

Prove that each R_n is finite with the faithful finite trace `φ_n|R_n`, that `R_n⊆R_(n+1)`, and
that `⋃R_n` is ultraweakly dense in R (Haagerup–Junge–Xu, Theorem 2.1(i)–(ii), Lemma 2.4(ii)
and Lemma 2.7). Construct `Φ_n:R→R_n` by averaging σ^(φ_n) over one period, prove that it
preserves φ̂, commutes with σ^φ̂, and satisfies `Φ_nΦ_m=Φ_(min(n,m))` (Haagerup–Junge–Xu,
Theorem 2.1(iii)). Supply the spectral-logarithm compatibility `b_(n+1)` versus `b_n` and the
Gaussian and modular approximation estimates that give nestedness and density; periodicity alone
gives neither. The canonical expectation E_M and every Φ_n give the Lp maps of §4.3.
*Needs:* §4.3, §5.1; Haagerup–Junge–Xu, §2.

**Checks.**
- Nestedness witness: `λ(2^(−n))=λ(2^(−n−1))²`, so `b_n=2b_(n+1)` modulo 2π and `a_n=a_(n+1)`
  modulo `2^(n+1)π`; the centralizer of φ_n contains that of φ_(n+1) only through the exact
  identity `e^(−ita_n)=e^(−ita_(n+1))` at `t=2^(−n)`, which the spectral-logarithm compatibility
  supplies.
- `Φ_nΦ_m=Φ_(min)`: on M=ℂ all Φ_n are the identity; on a nontrivial R the averages over the
  periods `2^(−n)` and `2^(−m)` compose to the average over the longer period.
- Trace preservation: `φ_n|R_n` is a trace because `σ^(φ_n)` is trivial on its centralizer;
  φ̂|R_n is not a trace in general, which is why the finite stages carry φ_n and not φ̂.

### 5.3 Reduction of Lp(M)

Deduce Haagerup's reduction theorem: for σ-finite M and 0<p<∞ there are a Banach space X_p
(quasi-Banach for p<1), finite algebras (R_n,τ_n) and isometric embeddings `J_n:Lp(R_n,τ_n)→X_p`
with increasing ranges whose union is dense, and an isometric embedding of Lp(M) into X_p; for
1≤p<∞ both Lp(M) and each `J_n(Lp(R_n))` are 1-complemented (Haagerup–Junge–Xu, Theorem 3.1
and Remarks 3.2–3.4). For 1≤p<∞ prove `Φ_n(x)→x` in Lp(R) for every x, using dense bounded
state-weighted elements `a h_φ̂^(1/p)`, contractivity and truncation, including the row and
column matrix amplifications. For 0<p<1 the expectations act only on bounded coefficients: for
x∈R put `y_n=Φ_n(x)−x`, use weighted L² convergence and
`‖y_n h_φ̂^(1/p)‖_p≤‖y_n h_φ̂^(1/2)‖₂‖h_φ̂^(1/r)‖_r` with `1/p=1/2+1/r` (Hölder of §3.3) to prove
density of the finite-stage images; do not extend Φ_n as contractions below p=1. Transfer the
finite-tracial p-norm geometry to the dense union and its completion using the metric of §3.3.
When applying normalized-trace inequalities, normalize each finite trace and transport the norms
by the scalar isometry `x↦τ_n(1)^(−1/p)x`.
*Needs:* §3.3, §4.3, §5.2; Haagerup–Junge–Xu, §3.

**Checks.**
- For M finite with a tracial state, R_n=R for all n (§5.1) and the theorem says Lp(M) is
  1-complemented in Lp(R), which is the expectation E_M of §4.3.
- The Hölder exponent at p=1/2: `1/r=1/p−1/2=3/2`, so r=2/3 and the estimate reads
  `‖y_n h^2‖_(1/2)≤‖y_n h^(1/2)‖₂‖h^(3/2)‖_(2/3)` with `‖h^(3/2)‖_(2/3)=tr_H(h)^(3/2)=1` for
  h=h_φ̂; an exponent `1/r=1/2−1/p` would be negative here.
- Normalization: for τ_n(1)=d the map `x↦d^(−1/p)x` carries the unnormalized p-norm to the
  normalized one, so a constant proved for normalized traces transfers unchanged; forgetting
  the factor would change the Khintchine constants of Layer 7 by `d^(1/p)` on each stage.

### 5.4 The directed version for arbitrary M

For arbitrary M prove the directed-family version (Haagerup–Junge–Xu, Remark 2.8): using V5's
comparison theory and central decomposition, write M as a direct sum of σ-finite corners and
amplifications, and obtain a directed family (R_i, Φ_i) of finite algebras with units p_i≠1 in
general, satisfying `φ̂∘Φ_i=p_iφ̂p_i`, modular commutation and `Φ_iΦ_j=Φ_i` for i≤j. Establish
the p_i-corner inclusions `Lp(p_iRp_i)=p_iLp(R)p_i` of §3.4 before claiming their isometry or
1-complementation, and prove that the embeddings and finite-corner approximations agree on
overlaps. The index set need not be a sequence; finite does not mean finite-dimensional, and
nothing here asserts hyperfiniteness.
*Needs:* §3.4, §5.3; VonNeumannAlgebras V5; Haagerup–Junge–Xu, Remark 2.8.

**Checks.**
- M=ℓ∞(I) for uncountable I: the σ-finite corners are `ℓ∞(J)` for countable J⊆I, directed by
  inclusion; the family is not a sequence, and every element of L¹ lives in one corner (§3.4).
- M=B(H) with H non-separable: the corners `eB(H)e` for projections of separable range are
  σ-finite, and `Lp(eB(H)e)=eS_pe` agrees on overlaps.
- `φ̂∘Φ_i=p_iφ̂p_i` with p_i≠1 is not state preservation: on M=ℂ² with φ=(1/2,1/2) and p=e₁,
  `Φ=(a,b)↦(a,0)` satisfies it while `φ∘Φ≠φ`.

### 5.5 Clarkson inequalities, moduli and Ball–Carlen–Lieb

Prove Clarkson's inequalities for Lp(M), 1<p<∞: `‖x+y‖_p^p+‖x−y‖_p^p≤2^(p−1)(‖x‖_p^p+‖y‖_p^p)`
for 2≤p<∞ and the McCarthy form `‖x+y‖_p^q+‖x−y‖_p^q≤2(‖x‖_p^p+‖y‖_p^p)^(q/p)` for 1<p≤2
(Hiai, Proposition 5.11 for the tracial case and Proposition 11.26 for Haagerup Lp with p≥2),
with the two-term map `(x,y)↦(x+y,x−y)` interpolated by the sequence identity of §2.5 between
p=2 (where it is √2 times an isometry) and p=∞ or p=1. Define the modulus of convexity
`δ(ε)=inf{1−‖(x+y)/2‖ : ‖x‖≤1, ‖y‖≤1, ε≤‖x−y‖}` for 0<ε≤2, with value 1 for an empty
constraint set, and the modulus of smoothness `ρ(t)=sup{(‖x+ty‖+‖x−ty‖)/2−1 : ‖x‖=‖y‖=1}` for
t≥0, with value 0 in the zero space. Prove uniform convexity and uniform smoothness with
explicit moduli of exponent max(p,2) and min(p,2), including the quadratic estimates
`δ(ε)≥(p−1)ε²/8` for 1<p≤2 and `ρ(t)≤(p−1)t²/2` for 2≤p<∞, and connect the convexity
conclusion to Mathlib's `UniformConvexSpace` and hence to BanachSpaceTheory B2's Milman–Pettis
theorem, whose scalar Lᵖ estimates are the commutative case of these. Prove the
Ball–Carlen–Lieb inequality `(‖x+y‖_p²+‖x−y‖_p²)/2≥‖x‖_p²+(p−1)‖y‖_p²` for 1<p≤2 and the
reversed inequality for 2≤p<∞, for every von Neumann algebra (Ricard–Xu, Theorem 2;
Ball–Carlen–Lieb, Invent. Math. 115, for the Schatten case, cited by locator). For finite
tracial algebras build Ricard–Xu's tools: the resolvent functional calculus, the second
pseudo-derivative bound of `t↦τ(|x+ty|^p)`, the abelian conditional-expectation and
Kadison–Schwarz estimate (CStarAlgebras C4), support cuts and diffuse perturbation, and the 2×2
reduction `[[0,x],[x*,0]]` of nonselfadjoint elements; pass to arbitrary Haagerup Lp through
§5.3 and derive the 2≤p<∞ form from the 1<p≤2 form by the duality of §3.4. Nothing here
approximates a general finite algebra by matrix algebras. In `Suggested.lean`,
`matrix_ball_carlen_lieb_low` and `matrix_ball_carlen_lieb_high` state the two inequalities on
`CStarMatrix (Fin d) (Fin d) ℂ` with the gauge `matrixLpGauge`, for every d.
*Needs:* §2.5, §3.3, §3.4, §5.3; CStarAlgebras C4; BanachSpaceTheory B2; Mathlib
`UniformConvexSpace`; Ricard–Xu, §§1–2; Hiai, Propositions 5.11 and 11.26.

**Checks.**
- p=2: Clarkson is the parallelogram law with equality, `δ(ε)=1−(1−ε²/4)^(1/2)≥ε²/8` and
  `ρ(t)=(1+t²)^(1/2)−1≤t²/2`, matching the quadratic estimates at p=2; and Ball–Carlen–Lieb is
  the parallelogram identity in both directions.
- Scalars x=1, y=1 at p=3/2: `(2²+0)/2=2≥1+(1/2)·1=3/2`; at p=3: `2≤1+2·1=3`, the reversed
  inequality; at p=3/2 with the reversed sign the first would read 2≤3/2, false.
- p=1 is excluded: in ℓ¹₂ with x=e₁, y=e₂, `‖x‖=‖y‖=1`, `‖x−y‖=2` and `‖(x+y)/2‖=1`, so
  δ(2)=0 and the space is not uniformly convex; the constant (p−1) vanishes there.
- Empty constraint set: for ε>2 no pair qualifies and δ(ε)=1 by convention; in the zero space
  ρ(t)=0 for all t.
- A noncommutative witness for the quadratic bound: x=e₁₁, y=e₁₂ in M₂(ℂ), p=3/2:
  `‖x±y‖_p=√2` (singular values (√2,0)), so the left side is 2, and the right side is
  `1+(1/2)·1=3/2`.

### Examples

- M=M_d(ℂ) with tr/d: R_n=R, the reduction is trivial, and the convexity inequalities are the
  Schatten-class inequalities of Ball–Carlen–Lieb.
- M a σ-finite type III factor: R_n are finite algebras with increasing dense union in the
  discrete crossed product R, and Lp(M) embeds 1-complementedly into Lp(R).
- The Clarkson map on ℓ^p₂: the sequence identity of §2.5 with N=2 gives the constant `2^(1/p′)`
  between p=2 and p=∞.

### Dependencies

Layer 5 needs Layers 3–4, VonNeumannAlgebras V5, V8 and Layer 11, CStarAlgebras C4,
BanachSpaceTheory B2 and Mathlib `UniformConvexSpace`.

## Layer 6: Row and column spaces and the p=1 random-sum estimate

### 6.1 Row and column spaces

For a finite sequence a=(a_k) in Lp(M) define the column and row square functions and norms
`C_p(a)=‖(∑a_k*a_k)^(1/2)‖_p` and `R_p(a)=‖(∑a_ka_k*)^(1/2)‖_p`, realized as the norms of the
first column `∑a_k⊗e_(k,1)` and first row `∑a_k⊗e_(1,k)` in `Lp(M⊗̄B(ℓ²))` with the unnormalized
matrix trace (Pisier–Xu 1997, §1; Haagerup–Junge–Xu, §6). For finite p construct the completed
sequence spaces `Lp(M;ℓ²_C)` and `Lp(M;ℓ²_R)` with truncations, coordinate maps and the norm
formulas; at p=∞ use bounded finite partial square sums and their strong limits, and do not
assert that finite sequences are norm dense there. For p≥2 define `Lp(M;ℓ²_RC)` as the
intersection with norm `max(C_p,R_p)`; for 1≤p<2 define it as the sum with norm
`inf_(a=b+c)(C_p(b)+R_p(c))`. Prove that these are Banach spaces, identify the duals for
1≤p<∞ with the conjugate-exponent row and column spaces, with sum and intersection
interchanged (Pisier–Xu 1997, §1), and prove compatibility with interpolation (§2.5) and with
the conditional expectations of §4.3 applied coordinatewise. At p=2 both square functions give
the same norm `(∑‖a_k‖₂²)^(1/2)`. In `Suggested.lean`, on `CStarMatrix (Fin d) (Fin d) ℂ`,
`matrixLpGauge p x` is `tr(|x|^p)^(1/p)` with the unnormalized trace, `columnSquare a` and
`rowSquare a` are the two square functions, and `rowColumnSumGauge p a` is the sum norm
`inf_(a=b+c)(C_p(b)+R_p(c))`.
*Needs:* §1.5, §2.5, §3.4, §4.3, §4.4; VonNeumannAlgebras V2; CStarAlgebras C3 and C5;
Mathlib `CStarMatrix`, `CFC.sqrt`, `CFC.nnrpow`, `Matrix.trace`; Pisier–Xu 1997, §1.

**Checks.**
- Matrix units in M_n(ℂ): for `a_k=e_(1,k)`, k≤n, `∑a_k*a_k=∑e_(k,k)=1` so `C_p(a)=n^(1/p)`,
  while `∑a_ka_k*=n e_(1,1)` so `R_p(a)=√n`; for `a_k=e_(k,1)` the two values are
  interchanged. A definition with the roles of `a_k*a_k` and `a_ka_k*` swapped would call the
  first sequence a row sequence; the matrix realization pins the names.
- The realization: `(∑a_k⊗e_(k,1))*(∑a_j⊗e_(j,1))=∑a_k*a_k⊗e_(1,1)`, so the column element
  has modulus `(∑a_k*a_k)^(1/2)⊗e_(1,1)` and Lp norm `C_p(a)` for the unnormalized matrix
  trace; a normalized n×n matrix trace would divide this by `n^(1/p)`.
- p=2: `C₂(a)²=τ(∑a_k*a_k)=∑‖a_k‖₂²=τ(∑a_ka_k*)=R₂(a)²` by cyclicity (§2.1); at p=1 and
  `a=(e_(1,1),e_(1,2))` in M₂(ℂ) the values are `C₁=‖1‖₁=2` and `R₁=‖√2e₁₁‖₁=√2`, so the two
  norms differ.
- The sum norm at p=1 for a=(e_(1,1),e_(1,2)): the decomposition b=0, c=a gives `R₁(a)=√2`, and
  the dual element `x=(e_(1,1),e_(1,2))/√2`, with `‖∑x_k*x_k‖=1/2` and `‖∑x_kx_k*‖=1`, pairs
  to `(1+1)/√2=√2`, so by the duality of §6.3 no decomposition does better:
  `rowColumnSumGauge 1 a=√2<C₁(a)=2`.

### 6.2 Random sums and Kahane's inequality

For independent symmetric signs ε_k define the random-sum norm
`K_p(a)=(E‖∑ε_ka_k‖_p^p)^(1/p)`, with the uniform measure on the finite sign cube for finite
sequences; in `Suggested.lean` this is `randomSumGauge p a` on matrices. Prove invariance under
reindexing and sign changes of the coefficients, finite-to-infinite truncation, and Kahane's
inequality: for a Banach space E and finite moments 0<p,q<∞ there is a constant C(p,q),
independent of n and of E, with `(E‖∑ε_kx_k‖^q)^(1/q)≤C(p,q)(E‖∑ε_kx_k‖^p)^(1/p)` for x_k∈E
(Ledoux–Talagrand, *Probability in Banach Spaces*, Theorem 4.7 and Proposition 2.3, cited by
locator), through Lévy's reflection inequality `P(max_k‖S_k‖>t)≤2P(‖S_n‖>t)`, the symmetric-sum tail iteration
`P(‖S‖>3t)≤4P(‖S‖>t)²` (or the equivalent Hoffmann–Jørgensen inequality) and tail integration.
The contraction principle `E‖∑α_kε_kx_k‖≤max|α_k|·E‖∑ε_kx_k‖` is a separate theorem. Kahane's
inequality is what compares sources stated with a second moment (Pisier–Xu 1997, Theorem 2.8)
with the p-th moment displayed here.
*Needs:* §4.4; Mathlib `MeasureTheory.Lp` (the sign cube as a finite probability space);
Ledoux–Talagrand, §4.2.

**Checks.**
- One coefficient: `K_p((a))=‖a‖_p` for every p, since both signs give the same norm.
- Scalars a=(1,1), p=1: `K₁=E|ε₁+ε₂|=(2+0+0+2)/4=1`, while `K₂=√2`; Kahane's constant
  between p=1 and p=2 is at least √2 on this example, and the classical value is `C(1,2)=√2`.
- Lévy's inequality witness with n=2 scalars x₁=x₂=1 and t=1: `max_k|S_k|>1` happens with
  probability 1/2 (the sign pattern (+,+) or (−,−)), and `|S₂|>1` has probability 1/2, so the
  bound `1/2≤2·(1/2)` holds; dropping the factor 2 would still hold here but fails for
  x=(1,1,1) at t=1, where `P(max_k|S_k|>1)=1/2` (it needs |S₂|=2) and `P(|S₃|>1)=1/4`.

### 6.3 The p=1 Khintchine inequality

Prove the p=1 Khintchine inequality with universal constants: for every von Neumann algebra M
and every finite family a in L¹(M)=M_*,
`c·inf_(a=b+c)(C₁(b)+R₁(c))≤K₁(a)≤inf_(a=b+c)(C₁(b)+R₁(c))`, with `c=3^(−1/2)` (Pisier, GT,
Theorem 9.1 and its proof; Haagerup–Musat 2007, Theorem 2.11 and Proposition 2.12, for the
constant with matrix coefficients; Lust-Piquard–Pisier, Appendix IV, for the first proof, which
passes through the cotype 2 of M_* and is not the route here). The proof is a duality argument
from an L⁴ estimate in M; it uses neither a cotype-2 theorem for M_* nor 2-summing
factorization, so it does not depend on Layer 7, and it does not assume finite-dimensional
approximation of M. Its steps:

- Sign-cube duality. Let Ω_n be the sign cube with uniform probability and
  `L∞(Ω_n;M)=ℓ∞(Ω_n)⊗M`, the dual of `ℓ¹(Ω_n;M_*)`. For x=(x_k) in Mⁿ put
  `[x]=inf{‖Φ‖_∞ : Φ∈L∞(Ω_n;M), E(ε_kΦ)=x_k for every k}`. Prove from this duality that
  `K₁(a)=sup{|∑⟨x_k,a_k⟩| : [x]≤1}`, and from the p=1 case of §6.1's duality that
  `inf(C₁(b)+R₁(c))=sup{|∑⟨x_k,a_k⟩| : ‖x‖_RC≤1}` with
  `‖x‖_RC=max(‖∑x_k*x_k‖^(1/2),‖∑x_kx_k*‖^(1/2))` in M, so the lower estimate is equivalent to
  `[x]≤c⁻¹‖x‖_RC` for every n and x∈Mⁿ (Pisier, GT, proof of Theorem 9.1, (9.10)).
- Orthogonality. If `Φ=∑ε_ky_k+Φ′` with `E(ε_kΦ′)=0` for every k, then `∑y_k*y_k≤E(Φ*Φ)` and
  `∑y_ky_k*≤E(ΦΦ*)` (Pisier, GT, (9.11)). Hence `‖x‖_RC≤[x]`, which by the two dualities gives
  `K₁(a)≤min(C₁(a),R₁(a))`, and the triangle inequality for K₁ gives the upper estimate.
- Fourth moment. For self-adjoint x₁,…,x_n in a C*-algebra and `S=∑ε_kx_k`, prove
  `‖E(S⁴)‖≤3‖∑x_k²‖²` (Pisier, GT, Lemma 9.2, due to Pisier 1978 and Haagerup 1985). Expanding
  over pairings gives `E(S⁴)=A+B+C−2D` with `A=(∑x_i²)²`, `B=∑_i x_i(∑_j x_j²)x_i`,
  `C=∑_(i,j) x_ix_jx_ix_j` and `D=∑x_i⁴≥0`; bound A and B by `‖∑x_k²‖²` in the operator order
  and ‖C‖ by the same quantity through the operator Cauchy–Schwarz inequality
  `‖∑u_αv_α‖≤‖∑u_αu_α*‖^(1/2)‖∑v_α*v_α‖^(1/2)` with `u_(ij)=v_(ij)=x_ix_j` (CStarAlgebras C3).
- Truncation and iteration. Reduce to self-adjoint families by `z_k=[[0,x_k],[x_k*,0]]` in
  `M₂(M)`, for which `∑z_k²=diag(∑x_kx_k*,∑x_k*x_k)`, and compress a solution for z to its
  off-diagonal corner. For self-adjoint x with `‖∑x_k²‖<1` put `c₀=√3/2` and `Φ=h(S)` with
  h(t)=t on [−c₀,c₀] and h(t)=±c₀ beyond; then `‖Φ‖≤c₀` and `F=S−Φ` satisfies
  `F²≤S⁴/(16c₀²)=S⁴/12`, because `(|t|−c₀)²≤t⁴/(16c₀²)` is `(|t|−2c₀)²≥0`. So `‖E(F²)‖<1/4`, and
  by orthogonality `x̂_k=E(ε_kΦ)` satisfies `‖x−x̂‖_RC<1/2`; iterating on the remainder gives
  `[x]≤2c₀‖x‖_RC=√3‖x‖_RC` (Pisier, GT, proof of Theorem 9.1, the refinement of the truncation
  (9.12) with c=√3/2).

Identify the commutative specialization with the classical scalar and Hilbert-space-valued
Khintchine inequality. In `Suggested.lean`, `matrix_khintchine_one` states the inequality on
`CStarMatrix (Fin d) (Fin d) ℂ` with `(√3)⁻¹·rowColumnSumGauge 1 a≤randomSumGauge 1 a≤rowColumnSumGauge 1 a`
for every d, n and a.
*Needs:* §2.1 (p=1 duality), §6.1, §6.2; CStarAlgebras C3; VonNeumannAlgebras V4.Core; Pisier,
GT, §9; Haagerup–Musat 2007, §2.

**Checks.**
- Pairing expansion on two families with `∑x_k²=2`. For scalars x₁=x₂=1, S takes the values
  ±2, 0, 0 and `E(S⁴)=8=4+4+4−4`. For the anticommuting Pauli matrices x₁=σ_x, x₂=σ_z, `S²=2`
  for every sign, so `E(S⁴)=4`, and the expansion gives A=B=4, C=2−2=0 (since `(σ_xσ_z)²=−1`),
  D=2; the commutative formula `3(∑x_k²)²−2∑x_k⁴=8` is wrong here.
- Optimality of 3: for scalars x_k=1, `E(S⁴)=3n²−2n`, so `‖E(S⁴)‖/‖∑x_k²‖²→3` as n→∞.
- Truncation witness: at `t=2c₀=√3`, `(|t|−c₀)²=3/4` and `t⁴/(16c₀²)=9/12=3/4`, equality; at
  t=1, `(1−c₀)²≈0.018≤1/12≈0.083`.
- Scalars a=(1,1), p=1: `K₁=1` (§6.2) and `inf(C₁(b)+R₁(c))=‖a‖_(ℓ²)=√2`, so the inequality reads
  `3^(−1/2)·√2≈0.816≤1≤√2`; the classical p=1 constant for n=2 is `1/√2`, so the universal
  constant `3^(−1/2)` is consistent with, and smaller than, the sharp scalar one.

### Examples

- Matrix units `(e_(1,k))` and `(e_(k,1))` in M_n(ℂ): `K_p=√n` for every p and every sign
  (the sum is rank one with singular value √n), which equals the larger of C_p and R_p; one
  square function alone gives `n^(1/p)`, so no dimension-independent theorem can use one of them
  alone for p≠2.
- M=ℂ: the sum norm is the ℓ² norm of the coefficients and the theorem is scalar Khintchine
  at p=1.
- M=L∞(Ω): the theorem is the Hilbert-space-valued Khintchine inequality in L¹(Ω;ℓ²).

### Dependencies

Layer 6 needs Layers 2–4, VonNeumannAlgebras V2 and V4.Core, CStarAlgebras C3 and C5, and
Mathlib `CStarMatrix`, `CFC.sqrt`, `CFC.nnrpow` and `Matrix.trace`.

## Layer 7: Tracial martingales and Burkholder–Gundy

### 7.1 Expectations and finite martingales

Let M carry a faithful normal tracial state τ and let (M_n) be an increasing sequence of unital
von Neumann subalgebras with ultraweakly dense union. Construct `E_n:M→M_n` by §4.3's tracial
specialization (Hiai, Theorem 6.4) and prove the tower laws `E_mE_n=E_(min(m,n))`, contractivity
on every Lp, 1≤p≤∞, self-adjointness `τ(E_n(x)y)=τ(xE_n(y))`, duality, and `E_n(x)→x` in Lp
for 1≤p<∞, by L² density of `⋃M_n` and interpolation or truncation. A finite Lp martingale is a
sequence with `x_n∈Lp(M_n)`, `E_n(x_(n+1))=x_n` and eventually constant; put `dx₀=x₀`,
`dx_n=x_n−x_(n−1)` and `E_(−1)=0`. Prove the terminal-value representation `x_n=E_n(x_∞)`,
difference reconstruction `x_n=∑_(k≤n)dx_k`, and orthogonality of the differences in L²
(Pisier–Xu 1997, §1).
*Needs:* §4.3; VonNeumannAlgebras V7.Index; Hiai, Theorem 6.4; Pisier–Xu 1997, §1.

**Checks.**
- M=M₂(ℂ) with tr/2, M₀=ℂ, M₁ the diagonal algebra, M₂=M: for x=e₁₂, `x₀=E₀(x)=0`, `x₁=0`,
  `x₂=e₁₂`, `dx=(0,0,e₁₂)`; for x=e₁₁, `x₀=1/2`, `x₁=e₁₁`, `dx=(1/2,e₁₁−1/2,0)` and
  `‖x₀‖₂²+‖dx₁‖₂²=1/4+1/4=1/2=‖e₁₁‖₂²`, the orthogonality.
- Tower law witness: `E₀E₁=E₀` since the trace of the diagonal part is the trace; a
  definition of E_n not preserving τ would break `E₀E₁=E₀`.
- Convergence: for the dyadic filtration of L∞[0,1], `E_n(x)→x` in Lp for p<∞ is the
  martingale convergence theorem, and fails in L∞ for x=1_(0,1/3).

### 7.2 Martingale Hardy spaces

Define `H_C^p` and `H_R^p` as the completions of the finite Lp martingales in the column and
row norms `‖x‖_(H_C^p)=C_p(dx)` and `‖x‖_(H_R^p)=R_p(dx)` of their difference sequences
(Pisier–Xu 1997, §1). For p≥2 define `H^p=H_C^p∩H_R^p` with the maximum norm; for 1≤p<2 define
`H^p=H_C^p+H_R^p` with the infimum over decompositions of x into two martingales, which is an
adapted decomposition and differs from the sequence decomposition of §6.1. Develop the
terminal-value and difference maps, dense finite subspaces, the dual pairings and bounded
coordinate projections.
*Needs:* §6.1, §7.1; Pisier–Xu 1997, §1.

**Checks.**
- For the martingale of x=e₁₂ in §7.1, `dx₂*dx₂=e₂₂` and `dx₂dx₂*=e₁₁`, so
  `‖x‖_(H_C^p)=‖x‖_(H_R^p)=1=sup_n‖x_n‖_p`.
- The adapted sum norm at p=1 is at least the sequence sum norm of §6.1 on dx, and can be
  strictly larger: a sequence decomposition `dx=b+c` with b not a martingale difference
  sequence is not admissible.
- At p=2, `‖x‖_(H^2)²=∑‖dx_k‖₂²=‖x_∞‖₂²` by orthogonality, so BG holds with constants 1.

### 7.3 Stein's inequality and Burkholder–Gundy

For 1<p<∞ prove Burkholder–Gundy: an Lp martingale is Lp-bounded iff it lies in H^p, and
`α_p^(−1)‖x‖_(H^p)≤sup_n‖x_n‖_p≤β_p‖x‖_(H^p)` with constants depending only on p, uniformly over
finite algebras and filtrations (Pisier–Xu 1997, Theorem 2.1). Build the tools in this order:
- Stein's inequality: `Q(a)_n=E_n(a_n)` is bounded on `Lp(M;ℓ²_C)` and `Lp(M;ℓ²_R)` for 1<p<∞
  with a constant γ_p, and projects onto adapted sequences (Pisier–Xu 1997, Theorem 2.3). The
  martingale-difference projection `(E_n−E_(n−1))(a_n)` is bounded by two applications of Stein.
- The randomized triangular double-sum estimate from a BG estimate at the same exponent, by
  alternating the two independent sign filtrations, with columns encoded by matrix units and the
  factor `d^(1/p)` if the auxiliary d×d trace is normalized (Pisier–Xu 1997, Lemma 2.5); this
  gives Stein from BG at that exponent and is not a circular assumption.
- The fourth-power square-function estimates by Hölder and the column matrix realization
  (Pisier–Xu 1997, Lemmas 2.6–2.7), using
  `x_n*x_n=∑_(k≤n)dx_k*dx_k+∑_(k≤n)dx_k*x_(k−1)+∑_(k≤n)x_(k−1)*dx_k` with `x_(−1)=0`, and
  estimating the two cross terms by Stein and the previous-exponent BG bound: the
  exponent-doubling step.
- Start at p=2 with equality, iterate the doubling step to p=4,8,…, interpolate the
  difference maps between the resulting exponents by §2.5, and obtain the range 1<p<2 by the
  sum/intersection duality of §6.1 and the self-adjointness of E_n (Pisier–Xu 1997, proof of
  Theorem 2.1).
*Needs:* §2.5, §4.4, §6.1, §7.1, §7.2; Pisier–Xu 1997, §2.

**Checks.**
- The Stein and difference projections differ: for the filtration of §7.1 and `a=(0,0,1)`,
  `Q(a)=(0,0,1)` while the difference projection gives `(0,0,E₂(1)−E₁(1))=(0,0,0)`; for
  `a=(0,0,e₁₂)` both give `(0,0,e₁₂)`.
- The identity for `x_n*x_n` at n=1 with x=e₁₁ in §7.1, where `dx₀=1/2` and `dx₁=e₁₁−1/2`:
  the square sum is `dx₀*dx₀+dx₁*dx₁=1/4+(e₁₁−1/2)²=1/4+1/4=1/2`, the cross sums with
  `x_(−1)=0` are `dx₁*x₀+x₀*dx₁=(e₁₁−1/2)/2+(e₁₁−1/2)/2=e₁₁−1/2`, and the total is
  `e₁₁=x₁*x₁`; without the convention `x_(−1)=0` the k=0 cross terms would be undefined.
- p=2: `α₂=β₂=1`; the doubling step from p=2 produces p=4 with a constant depending on γ₄ and
  β₂ only, so the constants are uniform in the algebra and filtration.

### 7.4 Convergence and martingale transforms

Extend the finite theorem to Lp-bounded martingales for 1<p<∞: existence and uniqueness of a
terminal element `x_∞∈Lp(M)` with `x_n=E_n(x_∞)` and `x_n→x_∞` in Lp (Pisier–Xu 1997,
Theorem 2.1, with §7.1's convergence). For scalar predictable signs, prove the boundedness of
the martingale transform `∑ε_kdx_k`. For operator-valued adapted coefficients retain the
commutation hypothesis that each coefficient at stage n−1 commutes with M_n, under which the
transform is bounded; no bound for an arbitrary bounded operator-valued transform is asserted.
*Needs:* §7.1, §7.3; Pisier–Xu 1997, §2.

**Checks.**
- The transform with signs (1,−1,1) applied to the martingale of x=e₁₁ in §7.1 gives
  `1/2−(e₁₁−1/2)+0=1−e₁₁=e₂₂`, with `‖e₂₂‖_p=‖e₁₁‖_p`.
- The role of commutation: for v_(k−1)∈M_(k−1) the sequence `v_(k−1)dx_k` is always a
  martingale difference sequence (adapted, and `E_(k−1)(v_(k−1)dx_k)=v_(k−1)E_(k−1)(dx_k)=0`);
  the column square function is bounded unconditionally by
  `dx_k*v_(k−1)*v_(k−1)dx_k≤‖v‖²dx_k*dx_k`, while the row square function
  `∑v_(k−1)dx_kdx_k*v_(k−1)*` is bounded by `‖v‖²∑dx_kdx_k*` only when v_(k−1) commutes with
  dx_k: in M₂(ℂ), `v=e₂₁` and `A=e₁₁` give `vAv*=e₂₂`, which is below no multiple of A.
- L¹ fails: the dyadic martingale `x_n=2^n1_(0,2^(−n))` on [0,1] is L¹-bounded (norm 1) and has
  no L¹ terminal element.

### 7.5 Khintchine for 1<p<∞, type and cotype

Apply BG to the sign-filtration martingale with differences `ε_ka_k` on `L∞(Ω_n)⊗̄M` (§4.4) to
prove Khintchine for 1<p<∞ with constants depending only on p: for p≥2,
`max(C_p,R_p)≤K_p≤B_p max(C_p,R_p)`, and for 1<p<2, `A_p inf(C_p(b)+R_p(c))≤K_p≤inf(C_p(b)+R_p(c))`
over decompositions a=b+c (Pisier–Xu 1997, Theorem 2.8, stated with second moments and
converted by Kahane's inequality of §6.2; Pisier, GT, Theorem 9.5, for the constants 1). In the
low range extract deterministic row and column decompositions by the first-sign coefficient
projections and prove their contraction bounds. The p=1 case is §6.3; no uniform p=∞
Khintchine theorem is claimed. In `Suggested.lean`, `matrix_khintchine_high` states the p≥2
inequality and `matrix_khintchine_low` the 1≤p<2 inequality with the sum gauge
`rowColumnSumGauge`, both on `CStarMatrix (Fin d) (Fin d) ℂ` with one constant for every d and
n. Prove the McCarthy trace-power superadditivity `∑τ(a_k^r)≤τ((∑a_k)^r)` for positive a_k and
r≥1, and its reverse for 0<r≤1, with truncation and the finiteness assumptions (Hiai,
Lemma 11.27 for the Haagerup case at p≥1), and combine these with the random-sum inequalities
and scalar moments to prove that Lp(M) has type min(p,2) and cotype max(p,2) with
dimension-independent constants (Pisier, GT, Definition 9.6 and Theorem 9.5).
*Needs:* §4.4, §6.1–§6.3, §7.3; Pisier–Xu 1997, Theorem 2.8; Pisier, GT, §9.

**Checks.**
- Matrix units (e_(1,k)) in M_n(ℂ), p≥2: `K_p=√n=max(C_p,R_p)`, so the lower constant 1 is
  attained; a lower bound through C_p alone would read `n^(1/p)≤√n`, which degenerates as
  n→∞.
- Scalars a=(1,1), p=4: `K₄⁴=E(ε₁+ε₂)⁴=(16+0+0+16)/4=8`, so `K₄=8^(1/4)≈1.68`, and
  `max(C₄,R₄)=√2≈1.41`: the lower bound `√2≤1.68` holds and `B₄≥8^(1/4)/√2=2^(1/4)`.
- Type and cotype at p=1 are excluded from the type-2 claim: in ℓ¹ with x_k=e_k,
  `(E‖∑ε_kx_k‖^p)^(1/p)=n` while `(∑‖x_k‖²)^(1/2)=√n`, so type 2 fails and type 1 holds;
  cotype 2 holds since `n≥√n`.
- McCarthy at r=2 on ℂ² with counting trace and a₁=(1,0), a₂=(0,1): `∑τ(a_k²)=2=τ((a₁+a₂)²)`,
  equality; with a₁=a₂=(1,0): `∑τ(a_k²)=2≤τ((2,0)²)=4`; at r=1/2 the reverse inequality
  reads `τ((2,0)^(1/2))=√2≤∑τ(a_k^(1/2))=2`, and the direction of the two inequalities is
  pinned by these values.

### Examples

- The dyadic filtration on L∞[0,1]: BG is the classical Burkholder–Gundy inequality, Stein's
  inequality is the classical Stein inequality, and H^p is the classical martingale Hardy space.
- M=M_n(ℂ) with tr/n and the filtration by block-diagonal algebras: a finite example in which
  every martingale is finite and the constants are checked numerically.
- `L∞(Ω_n)⊗̄M` with the sign filtration: the Khintchine inequality of §7.5.

### Dependencies

Layer 7 needs Layers 4 and 6, VonNeumannAlgebras V7.Index, and Hiai, §6.1.

## Layer 8: Nontracial transfer and the finite-tracial endpoint

### 8.1 Nontracial martingales

For M with a faithful normal state φ and an increasing σ^φ-invariant filtration (M_n) with
ultraweakly dense union, construct the φ-preserving expectations and their consistent Haagerup
Lp extensions E_(n,p) by §4.3. Define martingales, differences and the Hardy spaces of §7.2
with these maps, and prove the tower laws and finite-p mean convergence. Square-function
products of Lp elements live in Haagerup L^(p/2) (§3.1); use its multiplication and square-root
calculus, since no nonzero element is a bounded operator.
*Needs:* §3.1, §3.3, §4.3, §7.1, §7.2; Haagerup–Junge–Xu, §6.

**Checks.**
- For φ=tr(diag(1,2)·)/3 on M₂(ℂ) and the filtration M₀=ℂ, M₁ diagonal, M₂=M, the expectations
  exist (§4.3) and the martingale of `x h_φ^(1/p)` for x=e₁₂ has differences `(0,0,e₁₂h_φ^(1/p))`.
- For the same data and x=e₁₁: `E₀(e₁₁)=φ(e₁₁)=1/3`, so `x₀=(1/3)h_φ^(1/p)`, which differs from
  the tracial value 1/2.
- Square functions: with `h_φ=diag(1,2)/3`, `(e₁₂h_φ^(1/p))*(e₁₂h_φ^(1/p))=h_φ^(1/p)e₂₂h_φ^(1/p)=(2/3)^(2/p)e₂₂`,
  an element of L^(p/2)(M₂(ℂ)) of norm `(2/3)^(2/p)` (the trace-norm model of §3.5), whose
  square root `(2/3)^(1/p)` is `‖e₁₂h_φ^(1/p)‖_p`; a square function formed in Lp instead of
  L^(p/2) would have no meaning, since Lp∩L^(p/2)={0} in R̃.

### 8.2 Transfer through the reduction

Extend the filtration to the discrete reduction algebra `R=M⋊_(σ^φ|G)G` of §5.1 by
`R(M_n)=M_n⋊G`. Construct the expectations Ê_n and prove they commute with the canonical
expectation E_M and with every finite-reduction expectation Φ_m, first on the covariant
generators `xλ(g)` and then by normality; the common spectral logarithms defining Φ_m are what
makes this true (Haagerup–Junge–Xu, §6, (6.3)–(6.4)). The restrictions give filtrations on the
finite stages R_m whose conditional expectations preserve the finite traces `φ_m|R_m`, not only
φ̂. Prove that the row and column spaces and the Hardy spaces of M and of R_m embed
isometrically as 1-complemented subspaces of those of R for p≥1 (Haagerup–Junge–Xu,
Lemma 6.11), and that for finite p, `Φ_m(x)→x` in the square-function and Hardy norms, first on
finite bounded state-weighted martingales and then by density (Haagerup–Junge–Xu, Lemmas 6.10
and 6.12). Apply the finite-tracial estimates of §7.3 on each R_m and pass to the limit: Stein
and Burkholder–Gundy hold for the state-preserving nontracial filtration with the same constants
(Haagerup–Junge–Xu, Theorem 6.8); the contractions preserve the martingale decompositions in
the low-p sum norm.
*Needs:* §5.1–§5.3, §7.3, §8.1; VonNeumannAlgebras V8; Haagerup–Junge–Xu, §6.

**Checks.**
- Commutation witness on a covariant generator: `Ê_n(xλ(g))=E_n(x)λ(g)` and
  `Φ_m(xλ(g))=xΦ_m(λ(g))` with `Φ_m(λ(g))` a function of `λ(2^(−m))`, so both orders give
  `E_n(x)Φ_m(λ(g))`; if the Φ_m were defined through different spectral logarithms at
  different stages this would fail.
- For M tracial (§5.1, R_m=R) the transfer is the identity and the constants are those of §7.3.
- Trace preservation at the stages: for y∈R_m,
  `φ_m(Ê_n(y))=φ̂(e^(−a_m)Ê_n(y))=φ̂(Ê_n(e^(−a_m)y))=φ̂(e^(−a_m)y)=φ_m(y)`, using that Ê_n is
  R(M_n)-bimodular and φ̂-preserving and that `e^(−a_m)`, a function of `λ(2^(−m))`, lies in
  `R(M_0)⊆R(M_n)`; an extension of the filtration not containing the λ(g) would break this.

### 8.3 Khintchine in Haagerup Lp and the UMD property

Transfer the finite-sequence Khintchine inequality to arbitrary Haagerup Lp spaces through
§5.3 and §5.4 with the row/column-compatible inclusions and projections; the σ-finite-support
reduction of §3.4 removes the faithful-state assumption for this random-sum theorem
(Haagerup–Junge–Xu, after Theorem 6.8). The nontracial martingale assertion of §8.2 keeps its
state and filtration hypotheses. Deduce the UMD property of Lp(M) for 1<p<∞: for every
probability space, filtration and Lp(M)-valued martingale (Mathlib's `MeasureTheory.Filtration`
and `MeasureTheory.Martingale`, with values in the Banach space Lp(M)) and every choice of
scalar signs, `‖∑ε_kdf_k‖_(Lp(Ω;Lp(M)))≤C_p‖∑df_k‖_(Lp(Ω;Lp(M)))`. Prove it first at the outer
exponent p by the tensor-product realization of §4.4 and §7.4, then the classical
one-exponent-to-all-exponents implication by stopping times and good-λ inequalities on
ordinary probability spaces (Burkholder, *Martingales and singular integrals in Banach spaces*,
§2, cited by locator). For arbitrary M reduce finite simple-function martingales
through a common σ-finite corner containing their finitely many values (§3.4), then approximate.
The probability-space filtration here is distinct from a chain of von Neumann subalgebras.
*Needs:* §3.4, §4.4, §5.3, §5.4, §7.4, §7.5, §8.2; Mathlib `MeasureTheory.Filtration`,
`MeasureTheory.Martingale`, `MeasureTheory.Lp`; Haagerup–Junge–Xu, §6.

**Checks.**
- M=ℂ: the statement is the classical unconditionality of scalar martingale differences in
  Lp(Ω), 1<p<∞, with the Burkholder constant; L¹(Ω) is not UMD (the dyadic example of §7.4
  with signs), so p=1 is excluded.
- M=M_d(ℂ): Lp(M)=S_p^d, and UMD with a constant independent of d is the statement that S_p is
  UMD; the constant through §8.2 is the one of §7.3.
- A martingale with two values x,y∈Lp(M) lives in the corner `eLp(M)e` for e the join of the
  four supports (§3.4), so the reduction to σ-finite corners loses nothing.

### 8.4 The finite-tracial H¹–BMO duality

In the setting of Layer 7, with E_(−1)=0, define
`‖a‖_(BMO_C)=sup_n‖E_n(|a−E_(n−1)a|²)‖_∞^(1/2)` for a∈L²(M), the space BMO_C of those a with
finite value, `BMO_R={a : a*∈BMO_C}` and `BMO=BMO_C∩BMO_R` with the maximum norm (Pisier–Xu
1997, Appendix, the definitions preceding (A1)), and prove `‖a‖_BMO≤‖a‖_∞` for a∈M
(Pisier–Xu 1997, Appendix, (A1)). Prove completeness, compatibility with terminal approximations, and
independence of adding stationary tail stages; the n=0 term keeps constants visible, so no
quotient by constants is taken. Prove `(H_C^1)*≃BMO_C` and the row version with equivalent
norms under `(a,x)↦τ(a*x)`, the continuous extension of the finite pairing, conjugate-linear in
a, with `‖φ_a‖≤√2‖a‖_(BMO_C)` and `‖a‖_(BMO_C)≤√3‖φ_a‖` (Pisier–Xu 1997, Appendix, Theorem,
(A2)). Use increasing column square functions for the weighted Cauchy–Schwarz estimate, and
Hahn–Banach extension to `L¹(M;ℓ²_C)` plus conditional-expectation differences for surjectivity.
Deduce `(H¹)*≃BMO`, the endpoint bound `‖x‖₁≤√2‖x‖_(H¹)`, and L¹ convergence of H¹ martingales
(Pisier–Xu 1997, Appendix, Corollary, (A3)). Do not assert the reverse H¹ estimate for every
L¹-bounded martingale.
*Needs:* §6.1, §7.1–§7.3; BanachSpaceTheory B1 (Hahn–Banach extension); Pisier–Xu 1997,
Appendix.

**Checks.**
- Constants: for a=1, the n=0 term gives `E₀(|1|²)=1` and every later term is 0, so
  `‖1‖_(BMO_C)=1≠0`; a definition starting at n=1 would make BMO a quotient by constants.
- a=e₁₂ for the filtration of §7.1: `E₀(|a|²)=E₀(e₂₂)=1/2`, `E₁(|a−E₀a|²)=e₂₂` of norm 1,
  `E₂(|a−E₁a|²)=e₂₂`, so `‖a‖_(BMO_C)=1`; and `|a*|²=e₁₁` gives `‖a‖_(BMO_R)=1`, so
  `‖a‖_BMO=1=‖a‖_∞`, the equality case of (A1).
- The endpoint bound on the same a: `‖a‖₁=1≤√2·‖a‖_(H¹)=√2·1`.
- Reverse estimate fails: the dyadic martingale `x_n=2^n1_(0,2^(−n))` on [0,1] has
  `sup‖x_n‖₁=1` while its square function `S=(∑|dx_k|²)^(1/2)` is about `2^k/√3` on
  `(2^(−k),2^(−k+1))`, so `‖S‖₁=∑_k 2^(−k)·2^k/√3=∞`: an L¹-bounded martingale need not lie
  in H¹.

### Examples

- The dyadic filtration on L∞[0,1]: classical H¹–BMO duality (Garsia's form with the n=0 term
  included) and the classical UMD property of Lp.
- A type III factor with a faithful normal state and a modular-invariant filtration: BG and
  Stein hold in Haagerup Lp with the constants of Layer 7, through §8.2.
- M=B(H) with the trace: Khintchine in S_p for 1≤p<∞ through §8.3.

### Dependencies

Layer 8 needs Layers 5–7, VonNeumannAlgebras V8, BanachSpaceTheory B1, and Mathlib
`MeasureTheory.Filtration`, `MeasureTheory.Martingale` and `MeasureTheory.Lp`.

## Downstream consumers

- FreeProbability consumes Layer 4 (I4): the Lp inclusions and faithful normal expectations of
  §4.3.
- NoncommutativeGeometry consumes Layer 1 (I1): tracial Lp including 0<p<1, Hölder, the
  quasi-norm inequalities and weak Lp, specialized to B(H) and compared with the Schatten scale.
- VonNeumannAlgebras Layer 11 names Layer 4 (I4) as the owner of the Lp inclusions and
  contractive projections attached to Takesaki's expectation.

## References

- Bergh–Löfström, *Interpolation Spaces: An Introduction*, Springer 1976 (cited by locator):
  §1.3 for Lorentz spaces; §§2.3 and 3.1 for couples and the K-functional; Theorems 3.1.2 and
  3.4.1 for the real method; §4.1, Theorem 4.1.2, Theorem 4.5.1 and Theorem 4.6.1 for the complex
  methods, duality and reiteration; Theorems 5.1.1, 5.1.2 and 5.2.1 and §5.3 for the scalar Lp,
  sequence and Lorentz identifications.
- Fack–Kosaki, [*Generalized s-numbers of τ-measurable operators*](https://msp.org/pjm/1986/123-2/pjm-v123-n2-p03-s.pdf),
  Pacific J. Math. 123 (1986), 269–300: Definition 2.1, Proposition 2.2, Lemma 2.5 and
  Proposition 2.7 for singular numbers and the layer-cake formula; Lemma 3.4 and Theorems 3.5–3.6
  for Fatou and dominated convergence; Lemma 4.1 (projection variational formula, diffuse
  hypothesis), Theorem 4.2 (Hölder and log-submajorization), Lemma 4.3 (absolute-value
  estimate), Theorem 4.4 (integrated Ky Fan and the K-functional formula following it),
  Theorem 4.7(i) (concave integrated inequality), Lemma 4.8 and Theorem 4.9 (the μ formula,
  Hölder, triangle and p-triangle inequalities).
- Hiai, [*Concise lectures on selected topics of von Neumann algebras*](https://arxiv.org/abs/2004.02383):
  §4 (τ-measurable operators, Theorem 4.12, Propositions 4.17–4.21), §5 (tracial Lp,
  Theorems 5.10 and 5.13, Proposition 5.11), §6.1 (Theorems 6.4 and 6.6), §9 (Theorem 9.4),
  §10 (Theorems 10.13 and 10.15), §11 (Haagerup Lp: Lemmas 11.1–11.3, Theorem 11.5,
  Definitions 11.6–11.7, Proposition 11.8, Remarks 11.9–11.10, Example 11.11, Lemmas 11.12,
  11.14 and 11.16, Theorems 11.22, 11.25, 11.28 and 11.30, Propositions 11.20, 11.24, 11.26 and
  11.29, Remark 11.31), §12 (Lemma 12.5).
- Cwikel, [*Lecture notes on duality and interpolation spaces*](https://arxiv.org/abs/0803.3558):
  §1 (Definitions 1.1 and 1.3, sum and intersection norms) and §2 (Calderón's strip model, the
  upper method, regularization and Calderón's duality theorem).
- Pisier–Xu, *Non-Commutative Lp-Spaces*, Handbook of the Geometry of Banach Spaces 2 (2003),
  1459–1517 (cited by locator): §§1–3 for singular numbers, interpolation, Haagerup spaces and
  Kosaki's theorem, §5 for Clarkson and geometry, §§6–7 for Khintchine and martingales.
- Kosaki, *Applications of the complex interpolation method to a von Neumann algebra:
  non-commutative Lp-spaces*, J. Funct. Anal. 56 (1984), 29–78 (cited by locator), for the
  interpolation realization of §4.1.
- Haagerup–Junge–Xu, [*A reduction method for noncommutative Lp-spaces and applications*](https://arxiv.org/abs/0806.3635):
  Theorem 2.1, Lemmas 2.4 and 2.7, Remark 2.8, Theorem 3.1, Remarks 3.2–3.4, and §6, in
  particular Theorem 6.8 and Lemmas 6.10–6.12. Layer 5 constructs the reduction; Layer 8
  supplies the approximation arguments for martingales.
- Pisier–Xu, [*Non-commutative martingale inequalities*](https://arxiv.org/abs/math/9704209),
  Comm. Math. Phys. 189 (1997): §1 (row and column spaces, Hardy spaces), Theorems 2.1 and 2.3,
  Lemmas 2.5–2.7, Theorem 2.8, and the Appendix ((A1)–(A3), the H¹–BMO theorem and its
  corollary). The finite-tracial proof supplies Layer 7 independently of any UMD claim.
- Lust-Piquard–Pisier, *Non commutative Khintchine and Paley inequalities*, Ark. Mat. 29 (1991),
  241–260 (cited by locator), Appendix IV, for the first proof of the p=1 theorem for arbitrary
  preduals, through the cotype 2 of M_*. Its Paley proof is a separate route; §6.3 needs no
  subdiagonal Hardy factorization. Its x*x convention is called a row convention there; the
  names here follow the matrix realization of §6.1, and estimates are transported by the
  formulas, not by the names.
- Pisier, [*Grothendieck's theorem, past and present*](https://arxiv.org/abs/1101.4195)
  (arXiv version 3), §9: Theorem 9.1 and its proof for the sign-cube duality, orthogonality and
  truncation route of §6.3, Lemma 9.2 for the fourth-moment estimate, which it attributes to
  Pisier, *Grothendieck's theorem for noncommutative C*-algebras*, J. Funct. Anal. 29 (1978), and
  Haagerup, *The Grothendieck inequality for bilinear forms on C*-algebras*, Adv. Math. 56
  (1985); Theorem 9.5 for the constants 1 and Definition 9.6 for cotype 2.
- Haagerup–Musat, [*On the best constants in noncommutative Khintchine-type inequalities*](https://arxiv.org/abs/math/0611160),
  J. Funct. Anal. 250 (2007), 588–624: Theorem 2.11 (the constant 3^(−1/2) for Rademacher sums
  with matrix coefficients in the trace norm) and Proposition 2.12 (its dual form, proved by
  estimating `E(Y*Y)`, `E(YY*)` and their squares), which is the truncation route of §6.3.
- Ledoux–Talagrand, *Probability in Banach Spaces*, Springer 1991 (cited by locator),
  Proposition 2.3 for Lévy's inequalities and Theorem 4.7 for Kahane's inequality.
- Ky Fan, *Maximum properties and inequalities for the eigenvalues of completely continuous
  operators*, Proc. Natl. Acad. Sci. USA 37 (1951), 760–766 (cited by locator), for the matrix
  partial-sum singular-value inequality checked in §1.4; Moslehian,
  [*Ky Fan inequalities*](https://arxiv.org/abs/1108.1467), §3, states it with this attribution.
- Takesaki, *Theory of Operator Algebras II*, Springer 2003 (cited by locator): Chapter VIII, §3
  for the Pedersen–Takesaki theorem, Theorem IX.4.2 for the conditional-expectation theorem, and
  Chapter X for crossed products and dual weights; the statements used are those of Hiai, §§9–11.
- Haagerup, [*On the dual weights for crossed products of von Neumann algebras II*](https://doi.org/10.7146/math.scand.a-11769),
  Math. Scand. 43 (1978), 119–140: Theorem 1.1 (abelian groups) and Theorem 3.1 (arbitrary
  locally compact groups) for the canonical operator-valued weight T with `φ̂=(φ∘π⁻¹)∘T`, used in
  §3.2 for the inverse of the dual-weight map; the characterization of the θ-invariant weights as
  dual weights is Hiai, Lemma 11.2(3).
- Haagerup, *Lp spaces associated with an arbitrary von Neumann algebra*, Colloques
  Internationaux CNRS 274 (1979), 175–184: Theorems 1.2–1.3 and Definition 1.4/Proposition 1.5
  for the density and the isometric L¹ map of §3.2.
- Ball–Carlen–Lieb, *Sharp uniform convexity and smoothness inequalities for trace norms*,
  Invent. Math. 115 (1994), 463–482 (cited by locator), for the sharp Schatten inequalities;
  Ricard–Xu, [*A noncommutative martingale convexity inequality*](https://arxiv.org/abs/1405.0431),
  Theorem 2 and its finite-tracial proof, for the inequality in every von Neumann algebra used
  in §5.5.
- Burkholder, *Martingales and singular integrals in Banach spaces*, Handbook of the Geometry of
  Banach Spaces 1 (2001), 233–269 (cited by locator), §2, for the one-exponent-to-all-exponents
  implication of §8.3.
