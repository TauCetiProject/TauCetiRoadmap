# Roadmap: Wiener chaos and Malliavin calculus

**Summary.** This roadmap builds Gaussian analysis in infinite dimension: the differential and
integral calculus of functionals of an isonormal Gaussian process indexed by a real Hilbert
space.

- Isonormal Gaussian processes: existence on every real Hilbert space, their laws, Wick powers
  and their covariances, and the density of exponential functionals.
- The Wiener–Itô chaos decomposition of the square-integrable functionals, with the orthonormal
  basis of normalized Hermite products along a Hilbert basis.
- Multiple Wiener–Itô integrals of symmetric kernels on a σ-finite measure space: their
  isometry, the identification of their range with the chaos, the chaos expansion with unique
  kernels, and the product formula with contractions.
- The Malliavin derivative: smooth cylinder functionals, closability, the Sobolev space of once
  differentiable functionals, the chain rule, its description through the chaos, the Gaussian
  Poincaré inequality, and the characterization of constants and of indicators.
- The divergence operator, the adjoint of the derivative: its domain, the product rules, its
  value on elementary processes and the Skorokhod isometry.
- The Ornstein–Uhlenbeck semigroup on Wiener space: semigroup properties, Mehler's formula,
  positivity and the contraction of every Lᵖ norm, the generator and the identity relating it
  to the derivative and the divergence, the pseudo-inverse, the commutation with the
  derivative, the integration-by-parts formula that feeds Stein's method, the logarithmic
  Sobolev inequality, Nelson's hypercontractivity and the equivalence of moments on a fixed
  chaos.
- In prose, the Brownian realization: multiple integrals as iterated Itô integrals, the
  Skorokhod integral of an adapted process as its Itô integral, and the Clark–Ocone formula.

The roadmap is a synthesis of several sources and follows none of them in order. Nualart (2006,
Chapter 1) and Nourdin–Peccati (2012, Chapters 1–2) are the main sources for every layer;
Nualart–Nualart (2018, Chapters 3–6) supplies the Brownian forms and short proofs; Bogachev
(1998, §§2.9 and 5.4–5.5) supplies the functional-inequality layer in the Gaussian-measure
language; Da Prato (2014, Chapters 2–3 and 11) supplies the white-noise construction on a
Hilbert space and the Clark–Ocone formula. The layers follow the proof-dependency order of the
subject.

The nearest roadmaps, and what passes between them:

- StochasticCalculus (on main) supplies Brownian motion, the Wiener integral of deterministic
  integrands as an isonormal process, the Itô integral and the martingale representation
  theorem; this roadmap consumes them only in its Brownian layer. It owns the Cameron–Martin
  theory, which this roadmap does not use.
- An open roadmap on the Ornstein–Uhlenbeck semigroup in finite dimension owns the
  finite-dimensional Mehler kernel, its generator, entropy decay and hypercontractivity, and
  excludes the infinite-dimensional case and Malliavin calculus. Nothing passes between the two:
  the infinite-dimensional semigroup here is defined through the chaos, and its
  hypercontractivity is proved from the logarithmic Sobolev inequality on Wiener space.
- RandomMatrices (on main) owns the Gaussian Poincaré and logarithmic Sobolev inequalities in
  finite dimension. Nothing passes between the two: the inequalities on Wiener space here are
  proved from the chaos and the semigroup.

[Suggested.lean](Suggested.lean) states, against the pinned Mathlib and Tau Ceti and each with
`sorry`, the headlines below that carry a Lean name, each with every conclusion this README
attaches to it, together with the definitions their statements need. It is not an exhaustive
acceptance test: the other headlines of this README are targets of the same standing, stated in
prose with their locators or proof routes.

Suggested home: `TauCeti/Probability/Malliavin/` for Layers 1–6 and
`TauCeti/Probability/BrownianMotion/Malliavin/` for Layer 7.

## How to read the build

Layer 1 fixes the isonormal process and its Wick powers; everything else is a statement about
functionals of it. Layer 2 decomposes the square-integrable functionals into orthogonal chaoses,
which is the coordinate system for all of Layers 4–6. Layer 3 specializes the index space to
L²(T, μ) and realizes each chaos as the range of a multiple integral; Layers 4–6 do not need
it, and the product formula is its main output. Layer 4 builds the derivative as a closed
operator by closing the graph of the gradient of smooth cylinder functionals, and computes its
domain in chaos coordinates. Layer 5 defines the divergence as the adjoint of the derivative.
Layer 6 defines the Ornstein–Uhlenbeck semigroup and its generator by their action on the chaos,
relates the generator to Layers 4–5, and proves the functional inequalities. Layer 7, stated in
prose, specializes to Brownian motion and connects with the Itô calculus of StochasticCalculus.

Each subsection states its targets, locators in the sources with printed pages, a proof route
for statements that adapt a source, and a *Needs:* line. Each layer ends with **Checks.**,
*Examples* and *Dependencies*.

## Conventions

- `H` is a real inner product space, complete where a statement needs it, and never assumed
  separable. `(Ω, P)` is a probability space. An isonormal process is a map `W : H → Ω → ℝ`
  (`IsIsonormal`).
- Square-integrable functionals are elements of `Lp ℝ 2 P`, and `H`-valued ones of `Lp H 2 P`.
  A function is turned into an `L²` class by `toL2`, whose value is `0` when the function is not
  square integrable; every statement that uses `toL2` proves or assumes the square integrability
  it needs. The square-integrable functionals of `W` are `gaussianL2`, the `L²` classes with a
  representative measurable for the σ-algebra `isonormalSigma` generated by `W`.
- Hermite polynomials are Mathlib's `Polynomial.hermite`, the monic probabilists' polynomials
  He₀ = 1, He₁ = x, He₂ = x² − 1, He₃ = x³ − 3x. Nualart's Hₙ is Heₙ/n!, and Nourdin–Peccati use
  Heₙ. The Wick power `wickPower` is the homogeneous form ‖h‖ⁿ Heₙ(W(h)/‖h‖), which is 1 at
  n = 0 and 0 at h = 0, n ≥ 1, so the chaos of order 0 is the constants also when `H = 0`.
- Statements about the divergence assume that `W` generates the σ-algebra up to null sets, in
  the form `gaussianL2 W P = ⊤`; without it the divergence of a process is unique only up to a
  functional orthogonal to every functional of `W`. The other layers make no such assumption,
  and their statements about all of `Lp ℝ 2 P` restrict to `gaussianL2` explicitly.
- The derivative and the divergence are total functions, `malliavinDeriv` and `divergence`, with
  value `0` outside their domains `sobolev12` and `divergenceDom`. Likewise the semigroup,
  generator and pseudo-inverse are total; the semigroup is only used at `t ≥ 0`.
- Lᵖ norms of functionals are `eLpNorm` values in `ℝ≥0∞`, so infinite norms are allowed on
  either side of an inequality.
- The implementation namespace is `TauCeti`; the prototypes in `Suggested.lean` live in this
  roadmap's namespace.

## Layer 1: isonormal Gaussian processes

### 1.1 Definition, existence and laws

- **Isonormal process** (`IsIsonormal`): measurable, jointly Gaussian in the sense of
  `IsGaussianProcess`, centred, and with covariance E[W(h)W(g)] = ⟪h, g⟫ (Nualart, Definition
  1.1.1, p. 4; Nourdin–Peccati, §2.1, p. 22).
- **Generated σ-algebra and functionals** (`isonormalSigma`, `gaussianL2`): the σ-algebra
  generated by the W(h) and the submodule `lpMeas` of its square-integrable classes (Nualart,
  p. 6; Nourdin–Peccati, p. 22).
- **Existence** (`exists_isIsonormal`): every real Hilbert space carries an isonormal process on
  some probability space in the same universe (Nualart, Remark 3, p. 4, by Kolmogorov's
  extension theorem; Nourdin–Peccati, Proposition 2.1.1, p. 23, for separable `H` through an
  orthonormal basis and independent standard Gaussians; Da Prato, Propositions 2.18–2.20, p. 24,
  as the white-noise map of a Gaussian measure).
- **Laws** (`IsIsonormal.hasLaw`): W(h) has law N(0, ‖h‖²) (Da Prato, Proposition 2.18, p. 24).
- **Linearity** (`IsIsonormal.ae_eq_add`): W(ah + bg) = aW(h) + bW(g) almost surely (Nualart,
  Remark 1, p. 4).
- **Independence** (`IsIsonormal.indepFun_iff`): W(h) and W(g) are independent exactly when
  ⟪h, g⟫ = 0 (Nualart, Remark 2, p. 4).

*Proof route.* Existence without separability: pass to the completion, choose a `HilbertBasis`
indexed by a type ι, take Ω = ι → ℝ with the product of standard Gaussian laws
(`Measure.infinitePi`), and let W(h) be a measurable representative of the L²-convergent sum
∑ᵢ ⟪h, eᵢ⟫ xᵢ, which has only countably many nonzero terms; joint Gaussianity holds on finite
families because L² limits of jointly Gaussian vectors are jointly Gaussian. Linearity:
the variance of W(ah + bg) − aW(h) − bW(g) is ‖(ah + bg) − ah − bg‖² = 0. Independence: a jointly
Gaussian pair is independent exactly when it is uncorrelated.

*Needs:* Mathlib's Gaussian processes and `HasLaw`.

### 1.2 Wick powers and exponentials

- **Wick power** (`wickPower`): :W(h)ⁿ: = ‖h‖ⁿ Heₙ(W(h)/‖h‖) (Nualart, (1.2)–(1.4), p. 5, and
  Exercise 1.1.1, p. 23, for the homogeneous form).
- **Covariance of Wick powers** (`IsIsonormal.integral_wickPower_mul`):
  E[:W(h)ⁿ: :W(g)ᵐ:] equals n! ⟪h, g⟫ⁿ when n = m and 0 otherwise (Nualart, Lemma 1.1.1, p. 5,
  for unit vectors and Hₙ = Heₙ/n!; Nourdin–Peccati, Proposition 2.2.1, p. 26).
- **Exponentials are total** (`IsIsonormal.closure_span_exp`): the classes of exp(W(h)) span a
  dense subspace of `gaussianL2` (Nualart, Lemma 1.1.2, p. 5).

*Proof route.* For the covariance, expand both sides of
E[exp(sW(h) − s²‖h‖²/2) exp(tW(g) − t²‖g‖²/2)] = exp(st⟪h, g⟫) with the generating function of
the Heₙ and compare coefficients of sⁿtᵐ; the homogeneous form needs no case split at h = 0.
For totality, a functional orthogonal to every exp(W(h)) is orthogonal to every
exp(∑ tᵢ W(hᵢ)), so its conditional expectation on finitely many coordinates has a vanishing
Laplace transform.

*Needs:* §1.1; `Polynomial.hermite`.

**Checks.**

- `isIsonormal_inner_stdGaussian`: on a finite-dimensional inner product space with
  `stdGaussian`, the coordinates x ↦ ⟪h, x⟫ form an isonormal process.
- For ‖h‖ = ‖g‖ = 1 and ⟪h, g⟫ = ρ, E[He₂(W h) He₂(W g)] = 2ρ², E[He₃ He₃] = 6ρ³,
  E[He₄ He₄] = 24ρ⁴, and E[He₂ He₃] = E[He₁ He₃] = 0 (computed symbolically).
- Without normalization: for ‖h‖ = a, ‖g‖ = b, ⟪h, g⟫ = c, E[(W(h)² − a²)(W(g)² − b²)] = 2c².
- Negative control for the normalization: with Nualart's Hₙ = Heₙ/n! in place of Heₙ the
  covariance would be ⟪h, g⟫ⁿ/n!, giving 1/2 instead of 2 at n = 2, h = g, ‖h‖ = 1.
- At h = 0 the Wick power of order 0 is 1 and of order n ≥ 1 is 0, so the covariance formula
  gives 1 = 0! ⟪0, g⟫⁰ at n = m = 0 and 0 otherwise, without a junk value from 0/0.

### Examples

- The Wiener integral of deterministic integrands on L²([0, T]) is an isonormal process;
  StochasticCalculus §1.3 owns it (Nualart–Nualart, Example 3.5.1, p. 58).
- Fractional Brownian motion of Hurst index H ∈ (0, 1) defines an isonormal process on the
  completion of the step functions under its covariance (Nualart–Nualart, Example 3.5.3, p. 59).

### Dependencies

Mathlib's `IsGaussianProcess`, `HasLaw`, `gaussianReal`, `stdGaussian` and `lpMeas`.

## Layer 2: Wiener chaos

### 2.1 The chaos decomposition

- **Chaos and its projection** (`wienerChaos`, `chaosProj`): the chaos of order n is the closed
  span of the Wick powers of order n, and Jₙ is the orthogonal projection onto it, a
  `Submodule.starProjection` (Nualart, p. 6; Nourdin–Peccati, Definition 2.2.3, p. 27).
- **Orthogonality** (`IsIsonormal.orthogonalFamily_wienerChaos`): chaoses of different orders
  are orthogonal, an `OrthogonalFamily` (Nualart, p. 6, from Lemma 1.1.1).
- **Wiener–Itô decomposition** (`IsIsonormal.closure_iSup_wienerChaos`): the chaoses span a
  dense subspace of `gaussianL2` (Nualart, Theorem 1.1.1, p. 6; Nourdin–Peccati, Theorem 2.2.4,
  p. 27; Bogachev, (2.9.2), p. 78).
- **Expansion** (`IsIsonormal.hasSum_chaosProj`): every functional of `W` is the sum of its chaos
  components (Nualart, p. 6).
- Target in prose: the polynomials in finitely many W(h) of degree at most n span a dense
  subspace of the first n + 1 chaoses, and the polynomial functionals of `W` are dense in Lʳ
  for every r ≥ 1 (Nualart, p. 6, and Exercise 1.1.7, p. 24; Nourdin–Peccati, Theorem 2.2.4,
  p. 27).
- Target in prose: the decomposition for functionals with values in a separable Hilbert space,
  chaos by chaos (Nualart, Exercise 1.1.4, p. 24).

*Proof route.* Orthogonality from §1.2 and continuity. Density: the exponential exp(W(h)) is the
L²-convergent series ∑ₙ :W(h)ⁿ: exp(‖h‖²/2)/n!, so it lies in the closure of the sum of the
chaoses; conclude with §1.2. The expansion follows from orthogonality and density.

*Needs:* §1.2.

### 2.2 The Hermite basis

- **Hermite products** (`hermiteProduct`): for a `HilbertBasis` e of `H` and a finitely
  supported multi-index a, Φₐ = ∏ᵢ Heₐᵢ(W(eᵢ))/√(aᵢ!) (Nualart, Proposition 1.1.1, p. 7).
- **Orthonormal basis** (`IsIsonormal.hermiteProduct_spec`): the Φₐ are orthonormal, span a
  dense subspace of `gaussianL2`, and Φₐ lies in the chaos of order |a| = ∑ᵢ aᵢ (Nualart,
  Proposition 1.1.1, p. 7, for the basis of each chaos; Nourdin–Peccati, Theorem 2.2.4 and its
  proof, p. 27).
- Target in prose: the products Φₐ with |a| = n form an orthonormal basis of the chaos of
  order n (Nualart, Proposition 1.1.1, p. 7).

*Proof route.* Independence of the W(eᵢ) (§1.1) reduces orthonormality to one dimension, which
is the orthonormality of `TauCeti.gaussianHermiteHilbertBasis`. Density: on each finite set of
coordinates the products are the multi-index Gaussian Hermite basis of Tau Ceti
(`TauCeti/Probability/Distributions/Gaussian/Hermite/Pi/Basis.lean`) pulled back along
ω ↦ (W(eᵢ)(ω))ᵢ; every W(h) is the L² limit of finite sums ∑ ⟪h, eᵢ⟫ W(eᵢ), so the
functionals of finitely many coordinates are dense in `gaussianL2`. Membership in the chaos of
order |a|: the product of Hermite polynomials of independent coordinates is a polynomial of
degree |a| orthogonal to every polynomial of lower degree.

*Needs:* §2.1; Tau Ceti's Gaussian Hermite bases.

**Checks.**

- `IsIsonormal.chaosProj_zero`: the chaos of order 0 is the constants, so J₀F = E F, also when
  `H = 0`.
- He₂(W(h))² = He₄ + 4 He₂ + 2 for ‖h‖ = 1, so the square of an element of the second chaos has
  components in the chaoses of orders 4, 2 and 0 only, with E[He₂²] = 2 (computed symbolically).
- Negative control for orthogonality across orders: W(h)² is not in the second chaos for
  h ≠ 0, since its mean is ‖h‖² ≠ 0; its projection onto the second chaos is W(h)² − ‖h‖².
- Negative control for the normalization of Φₐ: without the factor 1/√(aᵢ!), Φ at a = (2)
  would have norm √2, not 1.
- For F = 1{W(h) > 0} with ‖h‖ = 1, ∑ₙ ‖JₙF‖² computed from Hermite coefficients approaches
  E F² = 1/2 (0.4836 at n ≤ 59, numerically).

### Examples

- For H = ℝⁿ with `stdGaussian`, the chaos of order k is the space of polynomials of degree k
  spanned by products of Hermite polynomials of total degree k, and the decomposition is the
  multivariate Hermite expansion of Tau Ceti.

### Dependencies

Mathlib's `OrthogonalFamily`, `HilbertBasis` and `Submodule.starProjection`; Tau Ceti's
`TauCeti.gaussianHermiteHilbertBasis` and its multi-index version.

## Layer 3: multiple Wiener–Itô integrals

The index space is `H = L²(T, μ)` for a σ-finite measure space, and kernels of order q are
elements of `Lp ℝ 2` for the product measure μ^q on `Fin q → T`, built with `Measure.pi`.

### 3.1 Definition and isometry

- **Kernels** (`kernelMeasure`, `tensorPow`, `symmetricKernels`): the product measure μ^q, the
  tensor power h^{⊗q}(t) = ∏ᵢ h(tᵢ), and the closed span of the tensor powers (Nualart, p. 8).
- **Multiple integrals** (`IsMultipleWienerIntegral`): continuous linear maps I_q sending
  h^{⊗q} to :W(h)^q: and vanishing on the kernels orthogonal to the symmetric ones (Nualart,
  Proposition 1.1.4, (1.15), p. 13, as the defining property; Nourdin–Peccati, Definition 2.7.1,
  p. 36, and Theorem 2.7.7, p. 39).
- **Existence and uniqueness** (`IsIsonormal.existsUnique_isMultipleWienerIntegral`).
- **Isometry** (`IsMultipleWienerIntegral.inner_eq`): E[I_q(f) I_q(g)] = q! ⟪f, g⟫ on symmetric
  kernels, and integrals of different orders are orthogonal (Nualart, property (iii), p. 9;
  Nourdin–Peccati, Proposition 2.7.5, p. 37).
- **Range** (`IsMultipleWienerIntegral.map_symmetricKernels`): I_q maps the symmetric kernels
  onto the chaos of order q (Nualart, Proposition 1.1.4, p. 13; Nourdin–Peccati, Theorem 2.7.7,
  p. 39).
- Target in prose: the symmetric kernels are exactly the kernels invariant under permutation of
  the variables, and I_q(f) = I_q(f̃) for the symmetrization f̃ (Nualart, property (ii), p. 9).
- Target in prose: for an atomless μ, I_q agrees with the classical construction by off-diagonal
  simple functions (Nualart, pp. 8–10).

*Proof route.* The adaptation defines I_q by its values on tensor powers instead of by
off-diagonal simple functions, so that no atomlessness is needed. ⟪h^{⊗q}, g^{⊗q}⟫ = ⟪h, g⟫^q
and §1.2 show that h^{⊗q} ↦ :W(h)^q:/√q! preserves inner products, so it extends linearly and
isometrically to the symmetric kernels; extend by 0 on the orthogonal complement. Uniqueness
follows from density and continuity. The range is closed and contains the generators of the
chaos.

*Needs:* §§1.2, 2.1; `Measure.pi`.

### 3.2 The chaos expansion

- **Expansion with unique kernels** (`IsMultipleWienerIntegral.existsUnique_hasSum`): every
  functional of `W` is ∑_q I_q(f_q) for a unique family of symmetric kernels (Nualart, Theorem
  1.1.2, p. 13; Nourdin–Peccati, Corollary 2.7.8, p. 40; Nualart–Nualart, Theorem 4.1.3,
  p. 65).
- Target in prose: Stroock's formula f_q = E[D^q F]/q! for F in the Sobolev space of order q
  (Nourdin–Peccati, Corollary 2.7.8, p. 40).

*Proof route.* §2.1 and §3.1; uniqueness from injectivity of I_q on symmetric kernels.

*Needs:* §§2.1, 3.1.

### 3.3 Contractions and the product formula

- **Contraction** (`contraction`, with the index maps `contractionArgLeft` and
  `contractionArgRight`): (f ⊗ᵣ g)(s, t) = ∫ f(s, u) g(t, u) dμ^r(u) for s ∈ T^{p−r},
  t ∈ T^{q−r} (Nualart, p. 10; Nourdin–Peccati, p. 41 and Appendix B.4).
- **Product formula** (`IsMultipleWienerIntegral.mul_ae_eq`): for symmetric f and g,
  I_p(f) I_q(g) = ∑_{r ≤ min(p, q)} r! C(p, r) C(q, r) I_{p+q−2r}(f ⊗ᵣ g) almost surely
  (Nualart, Proposition 1.1.3, (1.13), p. 12; Nourdin–Peccati, Theorem 2.7.10, p. 41).
- Target in prose: the case q = 1, I_p(f) I₁(g) = I_{p+1}(f ⊗ g) + p I_{p−1}(f ⊗₁ g)
  (Nualart, Proposition 1.1.2, p. 11).

*Proof route.* Both sides are continuous bilinear in (f, g) on symmetric kernels, by the
Cauchy–Schwarz bound ‖f ⊗ᵣ g‖ ≤ ‖f‖ ‖g‖ and the hypercontractive bound of §6.4 on the product
of two chaos elements (or by Nualart's direct estimate, p. 12). On tensor powers f = h^{⊗p},
g = k^{⊗q} with ‖h‖ = ‖k‖ = 1 the formula is the Hermite linearization
Heₚ(x) He_q(y) expanded through the generating function. The q = 1 case by induction gives an
alternative route (Nualart, proof of Proposition 1.1.3).

*Needs:* §§3.1–3.2.

**Checks.**

- He₂(x)² = He₄(x) + 4 He₂(x) + 2 and He₂(x) He₃(x) = He₅(x) + 6 He₃(x) + 6 He₁(x), the
  product formula for p = q = 2 and p = 2, q = 3 on unit tensor powers (coefficients
  r! C(p, r) C(q, r) = 1, 4, 2 and 1, 6, 6; computed symbolically).
- For p = q = 1, r = 1, f ⊗₁ g is the constant ⟪f, g⟫ on the one-point space Fin 0 → T, so
  the formula reads I₁(f) I₁(g) = I₂(f ⊗ g) + ⟪f, g⟫.
- Negative control for the factor r!: with C(p, r) C(q, r) alone, the constant term of He₂²
  would be 1 instead of 2, and E[He₂(W h)²] = 2 would fail.
- Negative control for symmetry in the isometry: for T = {a, b} with counting measure and
  f = 1{(a, b)} on T², ⟪f, f⟫ = 1 while I₂(f) = I₂(f̃) has E I₂(f)² = 2 ‖f̃‖² = 1, not
  2 ‖f‖² = 2.

### Examples

- On L²([0, T]) with Lebesgue measure, the multiple integrals are iterated Itô integrals
  (§7.2).

### Dependencies

Mathlib's `Measure.pi`.

## Layer 4: the Malliavin derivative

### 4.1 Smooth cylinder functionals

- **Smooth functions of polynomial growth** (`IsSmoothPolyGrowth`): smooth on ℝⁿ with every
  derivative bounded by C(1 + ‖x‖)ᵐ (Nualart, p. 25, the class C_p^∞).
- **Coordinates and gradient** (`wVec`, `cylinderGrad`): the vector (W(h₁), …, W(hₙ)) and
  ∑ᵢ ∂ᵢf(W(h₁), …, W(hₙ)) hᵢ (Nualart, Definition 1.2.1, (1.29), p. 25; Nourdin–Peccati,
  Definition 2.3.2, p. 29; Da Prato, p. 30).
- **Integration by parts** (`IsIsonormal.integral_inner_cylinderGrad`):
  E⟪DF, h⟫ = E[F W(h)] for smooth cylinder F (Nualart, Lemma 1.2.1, (1.30), p. 25).
- Target in prose: the product version E[G⟪DF, h⟫] = E[−F⟪DG, h⟫ + FG W(h)] (Nualart, Lemma
  1.2.2, (1.31), p. 26).

*Proof route.* Orthonormalize h₁, …, hₙ, h by Gram–Schmidt, rewrite F as a smooth function of
independent standard Gaussians, and integrate by parts in one coordinate against the Gaussian
density.

*Needs:* §1.1.

### 4.2 Closability and the Sobolev space

- **Graph, domain and derivative** (`smoothGraph`, `malliavinGraph`, `sobolev12`,
  `malliavinDeriv`): the closure in `Lp ℝ 2 P × Lp H 2 P` of the span of the pairs (F, DF) for
  smooth cylinder F, its first projection 𝔻^{1,2}, and the derivative read off the graph
  (Nualart, p. 27; Nourdin–Peccati, Remark 2.3.6, p. 30).
- **Closability** (`IsIsonormal.malliavinGraph_closable`): (0, G) in the closed graph forces
  G = 0 (Nualart, Proposition 1.2.1, p. 26; Nourdin–Peccati, Proposition 2.3.4, p. 29;
  Nualart–Nualart, Proposition 3.3.1, p. 53; Da Prato, Proposition 3.10, p. 32).
- **Derivative of a cylinder functional** (`IsIsonormal.malliavinDeriv_cylinder`): a smooth
  cylinder functional lies in 𝔻^{1,2} and its derivative is the gradient formula, whatever
  representation is chosen (Nualart, p. 25, well-definedness after Definition 1.2.1).
- **Integration by parts on 𝔻^{1,2}** (`IsIsonormal.integral_inner_malliavinDeriv`)
  (Nualart, Lemma 1.2.1, p. 25, extended by closure).

*Proof route.* Closability from the product integration-by-parts formula of §4.1: if Fₖ → 0 and
DFₖ → G, then E[G' ⟪G, h⟫] = 0 for every smooth cylinder G' with bounded derivatives and every
h, and such G' ⊗ h are dense in `Lp H 2 P` restricted to functionals of `W`; G itself is
`isonormalSigma`-measurable as a limit. The graph statements are then closure arguments.

*Needs:* §4.1; §2.1 for density.

### 4.3 The chain rule

- **Chain rule** (`IsIsonormal.malliavinDeriv_comp`): for F₁, …, Fₘ in 𝔻^{1,2} and φ of class
  C¹ on ℝᵐ with bounded derivative, φ(F) ∈ 𝔻^{1,2} and D φ(F) = ∑ᵢ ∂ᵢφ(F) DFᵢ (Nualart,
  Proposition 1.2.3, p. 28; Nourdin–Peccati, Proposition 2.3.7, p. 31; Nualart–Nualart,
  Proposition 3.3.2, p. 54).
- Target in prose: the Lipschitz chain rule, φ(F) ∈ 𝔻^{1,2} for Lipschitz φ with
  D φ(F) = ∑ᵢ Gᵢ DFᵢ for some bounded random vector G (Nualart, Proposition 1.2.4, p. 29;
  Nourdin–Peccati, Proposition 2.3.8, p. 31; Da Prato, Proposition 3.18, p. 36).
- Target in prose: the product rule D(FG) = F DG + G DF for F, G ∈ 𝔻^{1,2} with FG,
  F DG + G DF square integrable (Nualart, Exercise 1.2.12, p. 36; Nourdin–Peccati, Exercise
  2.3.10, p. 32).

*Proof route.* For smooth cylinder Fᵢ and smooth φ it is the classical chain rule; approximate φ
by mollification and Fᵢ in the graph norm, using the bound on the derivative of φ to pass to the
limit (Nualart, proof of Proposition 1.2.3).

*Needs:* §4.2.

### 4.4 The chaos description and the Poincaré inequality

- **Chaos description** (`IsIsonormal.mem_sobolev12_iff`): F ∈ 𝔻^{1,2} exactly when F is a
  functional of `W` with ∑ₙ n ‖JₙF‖² < ∞, and then E‖DF‖² = ∑ₙ n ‖JₙF‖² (Nualart, Proposition
  1.2.2, p. 28; Nualart–Nualart, Proposition 4.2.2, p. 66).
- **Gaussian Poincaré inequality** (`IsIsonormal.variance_le`): Var F ≤ E‖DF‖² for F in
  𝔻^{1,2} (Bogachev, Theorem 5.5.1, (5.5.2), p. 226; Nourdin–Peccati, Proposition 1.3.7, p. 12,
  in one dimension).
- Target in prose: D Jₙ F = J_{n−1} DF chaos by chaos, and D I_q(f) = q I_{q−1}(f(·, t)) in the
  white-noise realization (Nualart, Proposition 1.2.2, p. 28; Nourdin–Peccati, Proposition
  2.7.4, p. 37; Nualart–Nualart, Proposition 4.2.1, p. 65).

*Proof route.* On the chaos of order n, D maps :W(h)ⁿ: to n :W(h)ⁿ⁻¹: h, so
E‖D:W(h)ⁿ:‖² = n · n! ‖h‖²ⁿ = n E[:W(h)ⁿ:²]; orthogonality across orders and closedness give
the description. Poincaré: Var F = ∑_{n ≥ 1} ‖JₙF‖² ≤ ∑ₙ n ‖JₙF‖² = E‖DF‖².

*Needs:* §§2.1, 4.2, 4.3.

### 4.5 Constants and indicators

- **Zero derivative** (`IsIsonormal.malliavinDeriv_eq_zero_iff`): for F ∈ 𝔻^{1,2}, DF = 0
  exactly when F is the constant E F (Nualart, Proposition 1.2.5, p. 30; Bogachev, Example
  5.4.16, p. 225).
- **Indicators** (`IsIsonormal.indicator_mem_sobolev12_iff`): the indicator of a measurable set
  A lies in 𝔻^{1,2} exactly when P(A) ∈ {0, 1} (Nualart, Proposition 1.2.6, p. 30;
  Nualart–Nualart, Proposition 4.2.6, p. 68; Bogachev, Example 5.4.17, p. 225).

*Proof route.* Zero derivative: by §4.4 every chaos of positive order vanishes. Indicators: for
φ of class C¹ with bounded derivative and φ(x) = x² on [0, 1], D 1_A = D(1_A²) = 2·1_A D 1_A, so
D 1_A = 0, and 1_A is constant. A set that is not determined by `W` up to null sets has an
indicator outside `gaussianL2` unless P(A) ∈ {0, 1}.

*Needs:* §§4.3, 4.4.

**Checks.**

- For F = W(h)² with ‖h‖ = 1: E‖DF‖² = E[4W(h)²] = 4, Var F = 2, J₂F = He₂(W h) with
  ‖J₂F‖² = 2, so ∑ₙ n ‖JₙF‖² = 2 · 2 = 4, as `IsIsonormal.mem_sobolev12_iff` says, and the
  Poincaré inequality reads 2 ≤ 4.
- Equality in Poincaré: F = W(h) has Var F = ‖h‖² = E‖DF‖².
- Negative control for the factor n: with ∑ₙ ‖JₙF‖² in place of ∑ₙ n ‖JₙF‖², the chaos
  description would put every functional of `W` in 𝔻^{1,2}, including 1{W(h) > 0}, which
  `IsIsonormal.indicator_mem_sobolev12_iff` excludes; numerically the partial sums of
  n ‖JₙF‖² for that indicator grow like √n (0.298, 0.392, 0.561, 0.798 at n ≤ 5, 9, 19, 39).

### Examples

- For a Brownian motion B on [0, 1] realized as an isonormal process on L²([0, 1]),
  B_s = W(1{[0, s]}), so D_t B_s = 1{t ≤ s} by the gradient formula of §4.2, and
  D_t f(B_s) = f'(B_s) 1{t ≤ s} for f of class C¹ with bounded derivative by the chain rule.

### Dependencies

Mathlib's `iteratedFDeriv`, `fderiv` and `EuclideanSpace`.

## Layer 5: the divergence

### 5.1 Definition and domain

- **Divergence** (`IsDivergence`, `divergenceDom`, `divergence`): G is a divergence of
  u ∈ `Lp H 2 P` when E[FG] = E⟪DF, u⟫ for every F ∈ 𝔻^{1,2} (Nualart, Definition 1.3.1,
  (1.41)–(1.42), pp. 36–37; Nourdin–Peccati, Definitions 2.5.1–2.5.2, p. 33).
- **Domain and uniqueness** (`IsIsonormal.mem_divergenceDom_iff`): when `W` generates the
  σ-algebra, u is in the domain exactly when |E⟪DF, u⟫| ≤ c‖F‖₂ on 𝔻^{1,2}, and the divergence
  is then unique (Nualart, Definition 1.3.1, p. 37).
- **Mean zero** (`IsIsonormal.integral_divergence`) (Nualart, p. 37; Nourdin–Peccati, Remark
  2.5.3, p. 34).
- Target in prose: δ on the chaos, δ(u) = ∑ₙ I_{n+1}(f̃ₙ) for u with kernels fₙ, with the domain
  described by convergence of the series (Nualart, Proposition 1.3.7, p. 41;
  Nualart–Nualart, Proposition 4.3.1, p. 68).

*Proof route.* Riesz representation on the closure of 𝔻^{1,2}, which is the whole of `Lp ℝ 2 P`
by §2.1 and the generation hypothesis.

*Needs:* §4.2.

### 5.2 Product rules

- **Deterministic direction** (`IsIsonormal.divergence_smul_const`): for F ∈ 𝔻^{1,2} and
  h ∈ `H`, F W(h) − ⟪DF, h⟫ is square integrable, F h is in the domain, and
  δ(F h) = F W(h) − ⟪DF, h⟫ (Nualart, Proposition 1.3.4, p. 39; Da Prato, Proposition 3.15,
  p. 34, for the integrability).
- **Scalar factor** (`IsIsonormal.divergence_smul`): for F ∈ 𝔻^{1,2} and u in the domain with
  F u and F δ(u) − ⟪DF, u⟫ square integrable, F u is in the domain and
  δ(F u) = F δ(u) − ⟪DF, u⟫ (Nualart, Proposition 1.3.3, (1.48), p. 39; Nourdin–Peccati,
  Proposition 2.5.4, p. 34).

*Proof route.* Test against a smooth cylinder G and use the product rule of §4.3:
E⟪DG, F u⟫ = E⟪D(FG), u⟫ − E[G⟪DF, u⟫]; density of smooth cylinders in 𝔻^{1,2} extends it.

*Needs:* §§4.3, 5.1.

### 5.3 Elementary processes and the Skorokhod isometry

- **Elementary processes** (`IsIsonormal.divergence_elementary`): for u = ∑ⱼ Fⱼ gⱼ with smooth
  cylinder Fⱼ, u is in the domain, δ(u) = ∑ⱼ (Fⱼ W(gⱼ) − ⟪DFⱼ, gⱼ⟫), and
  E δ(u)² = E‖u‖² + ∑ᵢⱼ E[⟪DFᵢ, gⱼ⟫ ⟪DFⱼ, gᵢ⟫] (Nualart, (1.44) and Proposition 1.3.1, (1.45),
  p. 37; Nualart–Nualart, Proposition 3.2.3, p. 52).
- Target in prose: 𝔻^{1,2}(H) ⊂ Dom δ with the Skorokhod isometry
  E δ(u)² = E‖u‖² + E⟨Du, (Du)*⟩ in H ⊗ H, and the commutation D_h δ(u) = ⟪u, h⟫ + δ(D_h u)
  (Nualart, Proposition 1.3.1, (1.45)–(1.46), p. 37, and Proposition 1.3.2, p. 39, for the
  commutation when D_h u is in the domain of δ).

*Proof route.* §5.2 with F = Fⱼ, h = gⱼ, summed. The isometry: compute E[δ(u)²] = E⟪D δ(u), u⟫
with the commutation D δ(Fⱼ gⱼ) = Fⱼ gⱼ + W(gⱼ) DFⱼ − D⟪DFⱼ, gⱼ⟫ on smooth cylinders.

*Needs:* §§4.1, 5.2.

**Checks.**

- u = W(h) h with ‖h‖ = 1: δ(u) = W(h)² − 1, E δ(u)² = 2, E‖u‖² = 1, and the trace term
  ⟪D W(h), h⟫² = 1, so 2 = 1 + 1 (computed symbolically).
- Negative control for the correction term: without −⟪DF, h⟫, δ(W(h) h) would be W(h)², whose
  mean is 1, contradicting `IsIsonormal.integral_divergence`.
- Negative control for the generation hypothesis: if Ω carries an independent N(0, 1) variable
  Z not measurable for `isonormalSigma`, then G + Z is a divergence of u whenever G is, since
  Z is orthogonal to `gaussianL2`; this is why `IsIsonormal.mem_divergenceDom_iff` assumes
  `gaussianL2 W P = ⊤`.

### Dependencies

Layer 4 only.

## Layer 6: the Ornstein–Uhlenbeck semigroup on Wiener space

### 6.1 The semigroup and Mehler's formula

- **Semigroup** (`ouSemigroup`): P_t F = ∑ₙ e^{−nt} JₙF (Nualart, Definition 1.4.1, (1.66),
  p. 54; Nourdin–Peccati, Definition 2.8.1, p. 45; Bogachev, Theorem 2.9.2, p. 79).
- **Semigroup properties** (`IsIsonormal.ouSemigroup_semigroup`): P₀ = id on functionals of `W`,
  P_{s+t} = P_s P_t, contraction, symmetry and strong continuity at 0 (Nualart, p. 55 and
  Proposition 1.4.1, p. 57; Bogachev, Theorem 2.9.1, p. 78).
- **Mehler's formula** (`IsIsonormal.ouSemigroup_cylinder`): for an orthonormal family k₁, …, kₙ
  and f ∈ L² of the standard Gaussian on ℝⁿ,
  P_t f(W(k)) = ∫ f(e^{−t} W(k) + √(1 − e^{−2t}) y) dγₙ(y) (Nualart, (1.67), p. 55;
  Nourdin–Peccati, Theorem 2.8.2, p. 46; Nualart–Nualart, Proposition 5.1.2, p. 74).
- **Positivity** (`IsIsonormal.ae_nonneg_ouSemigroup`) (Nualart, p. 55).
- **Lᵖ contraction** (`IsIsonormal.eLpNorm_ouSemigroup_le`): ‖P_t F‖_p ≤ ‖F‖_p for 1 ≤ p ≤ ∞
  (Nourdin–Peccati, Proposition 2.8.6, p. 47; Bogachev, Theorem 2.9.1, p. 78).
- Target in prose: Mehler's formula for every functional of `W`, P_t F = E'[F(e^{−t}W +
  √(1 − e^{−2t}) W')] with W' an independent copy (Nualart, (1.67), p. 55).

*Proof route.* The semigroup identities are chaos-wise. Mehler on cylinders: both sides are
continuous in f on L²(γₙ), and on products of Hermite polynomials in independent coordinates the
right side multiplies Heₐ by e^{−|a|t} (the one-dimensional Mehler identity); conclude with
§2.2. Positivity and the Lᵖ contraction follow from Mehler and Jensen on cylinders and density.

*Needs:* §§2.1, 2.2.

### 6.2 The generator and its pseudo-inverse

- **Generator** (`ouGeneratorDom`, `ouGenerator`): L F = −∑ₙ n JₙF on
  {∑ₙ n² ‖JₙF‖² < ∞} (Nualart, p. 58; Nourdin–Peccati, Definition 2.8.7, p. 48).
- **Generator of the semigroup** (`IsIsonormal.tendsto_ouSemigroup_iff`): the difference
  quotients (P_t F − F)/t converge as t ↓ 0 exactly on the domain of L, with limit L F
  (Nualart, Proposition 1.4.2, p. 59).
- **L = −δD** (`IsIsonormal.mem_ouGeneratorDom_iff`): F is in the domain of L exactly when
  F ∈ 𝔻^{1,2} and DF is in the domain of δ, and then δ(DF) = −L F (Nualart, Proposition 1.4.3,
  p. 59; Nourdin–Peccati, Proposition 2.8.8, p. 48; Nualart–Nualart, Proposition 5.2.1, p. 79).
- **L on cylinders** (`IsIsonormal.ouGenerator_cylinder`):
  L F = ∑ᵢⱼ ∂ᵢ∂ⱼf ⟪kᵢ, kⱼ⟫ − ∑ᵢ ∂ᵢf W(kᵢ) for smooth cylinder F (Nualart, Proposition 1.4.4,
  (1.70), p. 60; Nourdin–Peccati, Theorem 2.8.9, p. 48).
- **Pseudo-inverse** (`ouPseudoInverse`, `IsIsonormal.ouPseudoInverse_spec`):
  L⁻¹F = −∑_{n ≥ 1} JₙF/n lies in the domain of L, and L L⁻¹ F = F − E F; for F in the domain,
  L⁻¹ L F = F − E F (Nourdin–Peccati, Definition 2.8.10 and Proposition 2.8.11, p. 49).
- Target in prose: the domain of L is the Sobolev space 𝔻^{2,2} (Nualart, p. 60).

*Proof route.* The generator statements are chaos-wise: (e^{−nt} − 1)/t → −n with
|(e^{−nt} − 1)/t| ≤ n. L = −δD from §4.4 and §5.1 by testing against single chaoses. L on
cylinders from §5.3 with uⱼ the gradient. For the pseudo-inverse, Lean's 0⁻¹ = 0 removes the
order-0 term.

*Needs:* §§4.4, 5.1, 5.3, 6.1.

### 6.3 Commutation and integration by parts

- **Commutation** (`IsIsonormal.malliavinDeriv_ouSemigroup`): for F ∈ 𝔻^{1,2} and t ≥ 0,
  P_t F ∈ 𝔻^{1,2} and ⟪D P_t F, h⟫ = e^{−t} P_t ⟪DF, h⟫ for every h (Nualart–Nualart, proof of
  Proposition 5.1.6, p. 78; Nourdin–Peccati, Proposition 1.3.4, p. 10, in one dimension).
- **Integration-by-parts formula** (`IsIsonormal.integral_mul_comp`): for F a functional of `W`,
  G ∈ 𝔻^{1,2} and g of class C¹ with bounded derivative,
  E[F g(G)] = E F · E g(G) + E[g'(G) ⟪DG, −DL⁻¹F⟫] (Nourdin–Peccati, Theorem 2.9.1, p. 53, for
  F ∈ 𝔻^{1,2}; Nualart–Nualart, Proposition 5.4.1, (5.8), p. 83, for F = G centred).

*Proof route.* Commutation from D Jₙ = J_{n−1} D (§4.4): D P_t F = ∑ₙ e^{−nt} J_{n−1} DF =
e^{−t} P_t DF. The formula: F − E F = L L⁻¹ F = −δ(DL⁻¹F) by §6.2, then duality (§5.1) and
the chain rule (§4.3) for g(G). The adaptation to F ∈ `gaussianL2` uses that L⁻¹F ∈ 𝔻^{1,2}
for every functional F of `W`; the generation hypothesis of Layer 5 is not needed, because
the chaos computation E[(F − E F) H] = E⟪DH, −DL⁻¹F⟫ holds directly for H ∈ 𝔻^{1,2}.

*Needs:* §§4.3, 4.4, 6.2.

### 6.4 Functional inequalities

- **Logarithmic Sobolev inequality** (`IsIsonormal.integral_sq_mul_log_le`): for F ∈ 𝔻^{1,2},
  F² log F² is integrable and E[F² log F²] − E F² log E F² ≤ 2 E‖DF‖² (Nourdin–Peccati, (2.8.5)
  in the proof of Theorem 2.8.12, p. 51; Bogachev, Theorem 5.5.1, (5.5.1), p. 226).
- **Nelson's hypercontractivity** (`IsIsonormal.eLpNorm_ouSemigroup_le_of_le`): for 1 ≤ p,
  t ≥ 0 and q ≤ 1 + e^{2t}(p − 1), ‖P_t F‖_q ≤ ‖F‖_p for every functional F of `W` (Nualart,
  Theorem 1.4.1, p. 61; Nourdin–Peccati, Theorem 2.8.12, p. 49; Nualart–Nualart, Theorem 5.1.3,
  p. 75; Bogachev, Theorem 5.5.3, p. 227).
- **Equivalence of moments on a chaos** (`IsIsonormal.eLpNorm_le_of_mem_wienerChaos`): for F in
  the chaos of order n and 1 < q ≤ r, ‖F‖_r ≤ ((r − 1)/(q − 1))^{n/2} ‖F‖_q
  (Nourdin–Peccati, Corollary 2.8.14, p. 52; Bogachev, Corollary 5.5.4, p. 227, for q = 2;
  Nualart, p. 62).
- Target in prose: Nelson's theorem for F ∈ Lᵖ outside L², by density, and its sharpness: for
  q > 1 + e^{2t}(p − 1), P_t is unbounded from Lᵖ to L^q (Nourdin–Peccati, Remark 2.8.15 and
  Exercise 2.8.16, p. 52).
- Target in prose: ‖JₙF‖_r ≤ (r − 1)^{n/2} ‖F‖₂ for r ≥ 2, the hypercontractive bound on chaos
  projections (Nualart, (1.71), p. 63; Bogachev, Corollary 5.5.4, p. 227).

*Proof route.* The logarithmic Sobolev inequality by semigroup interpolation: for smooth
cylinder F bounded below by a positive constant, d/dt E[P_t(F²) log P_t(F²)] is expressed through
E‖D P_t F²‖²/P_t F², and the commutation of §6.3 with Cauchy–Schwarz gives the bound with
constant 2 (Nourdin–Peccati, proof of Theorem 2.8.12, pp. 50–51); approximate in 𝔻^{1,2}.
Nelson's theorem follows from the logarithmic Sobolev inequality by Gross's differentiation of
t ↦ ‖P_t F‖_{q(t)} (Nourdin–Peccati, pp. 50–51), or chaos-wise by cylinder approximation and the
finite-dimensional theorem. Equivalence of moments: on the chaos of order n, P_t F = e^{−nt} F;
choose t with e^{2t} = (r − 1)/(q − 1).

*Needs:* §§6.1–6.3.

**Checks.**

- `IsIsonormal.ouSemigroup_of_mem_wienerChaos`: P_t multiplies the chaos of order n by e^{−nt}.
- Mehler at f(x) = x² in one dimension: ∫ (e^{−t}x + √(1 − e^{−2t}) y)² dγ(y) =
  e^{−2t}(x² − 1) + 1, matching P_t on 1 + He₂ (computed symbolically).
- L on F = W(h)², ‖h‖ = 1: the cylinder formula gives 2 − 2W(h)² = −2 He₂(W h), matching
  −2 J₂F.
- Nelson is attained by exponentials: for F = exp(W(h)), ‖h‖ = 1, p = 2, q = 4 and
  t = (log 3)/2, ‖P_t F‖₄ = ‖F‖₂ = e (computed symbolically).
- Equality in the logarithmic Sobolev inequality at F = exp(λ W(h)), ‖h‖ = 1: both sides equal
  2λ² e^{2λ²} (computed symbolically).
- Integration by parts at F = G = W(h), ‖h‖ = 1, g = sin: E[W sin W] = E[cos W] = e^{−1/2}, and
  ⟪DG, −DL⁻¹F⟫ = 1.
- Moment equivalence at F = He₂(W h), ‖h‖ = 1, q = 2, r = 4: ‖F‖₄ = 60^{1/4} ≈ 2.783 ≤
  3 · √2 ≈ 4.243. Negative control for the exponent n/2: the exponent 1/2 independent of n
  would give 3^{1/2} √2 ≈ 2.449 < 2.783, so it is false on the second chaos.
- Negative control for the time scale: with q ≤ 1 + e^{4t}(p − 1) in place of e^{2t}, the
  exponential example at p = 2 and e^{2t} = 3 would allow q = 10, but
  ‖P_t F‖₁₀ = e^{1/3 + 10/6} = e² > e = ‖F‖₂.

### Dependencies

Layers 2, 4 and 5.

## Layer 7: the Brownian realization (prose)

This layer is stated in prose: it specializes Layers 3–6 to a Brownian motion B on [0, T] with
the isonormal process given by the Wiener integral of StochasticCalculus §1.3, and it is the only
layer that consumes the Itô calculus.

### 7.1 Iterated Itô integrals

- Target in prose: for symmetric f ∈ L²([0, T]^q), I_q(f) = q! ∫_{0 < t₁ < ⋯ < t_q < T}
  f(t₁, …, t_q) dB_{t₁} ⋯ dB_{t_q}, an iterated Itô integral (Nualart, (1.27), p. 23;
  Nualart–Nualart, Proposition 4.1.2, p. 64, for tensor powers).

*Needs:* §3.1; StochasticCalculus Layer 3.

### 7.2 Skorokhod and Itô integrals

- Target in prose: every square-integrable process adapted to the Brownian filtration is in the
  domain of δ, and δ(u) is its Itô integral (Nualart, Proposition 1.3.11, p. 44;
  Nualart–Nualart, Theorem 3.4.2, p. 56).
- Target in prose: for u adapted and in 𝔻^{1,2}(L²[0, T]), the derivative of the Itô integral,
  D_t ∫ u dB = u_t + ∫_t^T D_t u_s dB_s (Nualart, Proposition 1.3.8, p. 43).

*Needs:* §§5.1–5.3; StochasticCalculus Layer 3.

### 7.3 The Clark–Ocone formula

- Target in prose: for F ∈ 𝔻^{1,2} measurable for the Brownian σ-algebra,
  F = E F + ∫₀^T E[D_t F | 𝓕_t] dB_t (Nualart, Proposition 1.3.14, (1.63), p. 46;
  Nualart–Nualart, Theorem 6.1.1, p. 87; Da Prato, Proposition 11.12, (11.18), p. 200).

*Proof route.* Uniqueness of the integrand in the martingale representation (StochasticCalculus
§6.1) and §7.2: for adapted v, E[F ∫ v dB] = E⟪DF, v⟫ = E ∫ E[D_t F | 𝓕_t] v_t dt.

*Needs:* §§4.2, 7.2; StochasticCalculus §6.1.

**Checks.**

- F = B₁³: E[D_t F | 𝓕_t] = 3(B_t² + 1 − t), and the Itô isometry gives
  ∫₀¹ 9 E[(B_t² + 1 − t)²] dt = 15 = E B₁⁶ (computed symbolically).

## Downstream consumers

- No roadmap on main consumes this one. A planned roadmap on the Malliavin–Stein method and the
  fourth moment theorem consumes §§4.2–4.4, 5.1, 6.2 and 6.3: the Bouleau–Hirsch criterion
  for absolute continuity, the total-variation bound through ⟪DF, −DL⁻¹F⟫, the fourth moment
  theorem on a fixed chaos and the Peccati–Tudor theorem.

## Scope and ownership

Completion means:

1. Isonormal processes on every real Hilbert space, their laws and Wick powers (Layer 1).
2. The Wiener–Itô chaos decomposition and the Hermite basis (Layer 2).
3. Multiple Wiener–Itô integrals with their isometry, range, the chaos expansion and the product
   formula (Layer 3).
4. The closed Malliavin derivative on 𝔻^{1,2}, its chain rule, chaos description, the
   Poincaré inequality, and the characterization of constants and indicators (Layer 4).
5. The divergence with its domain, product rules and the Skorokhod isometry on elementary
   processes (Layer 5).
6. The Ornstein–Uhlenbeck semigroup on Wiener space with Mehler's formula, the generator,
   L = −δD, the pseudo-inverse, the commutation and integration-by-parts formulas, the
   logarithmic Sobolev inequality, Nelson's hypercontractivity and the equivalence of moments
   on a chaos (Layer 6).
7. The Brownian realization of Layer 7, in prose.

**Not owned here.**

- Brownian motion, Wiener measure, the Wiener integral of deterministic integrands (as an
  isonormal process), the Itô integral and the martingale representation theorem are owned by
  StochasticCalculus (§§1.2–1.3, Layer 3 and §6.1), and the Cameron–Martin theory of Gaussian
  measures on Banach spaces and the identification of the Wiener Cameron–Martin space by its
  Layer 8. This roadmap consumes §1.3, Layer 3 and §6.1, and only in Layer 7.
- The finite-dimensional Ornstein–Uhlenbeck semigroup on ℝᵈ with its Mehler kernel,
  generator, Hermite eigenfunctions, entropy decay and finite-dimensional hypercontractivity
  belong to an open roadmap on the Ornstein–Uhlenbeck semigroup, which excludes the
  infinite-dimensional case, moment bounds on Wiener chaos and Malliavin calculus. This roadmap
  does not consume it: Layer 6 defines the semigroup through the chaos and proves Nelson's
  theorem from the logarithmic Sobolev inequality on Wiener space.
- The finite-dimensional Gaussian Poincaré and logarithmic Sobolev inequalities are owned by
  RandomMatrices §2.2; the infinite-dimensional ones here are proved from the chaos and the
  semigroup, without passing through them.
- Discrete analogues on the Boolean cube and Stein's method for one-dimensional normal
  approximation belong to separate open roadmaps.
- The one-dimensional Mehler formula, the finite-dimensional Poincaré inequality, Gaussian
  concentration in Banach spaces, the Wick–Isserlis formula, the Wiener integral and the dyadic
  Hermite basis of Brownian motion are formalized in Tau Ceti beyond the pinned version; at the
  pin this roadmap uses only the Gaussian Hermite bases.
- The CKMA synopsis of area 09 numbers these results: 09.1–09.9 (Layers 2–5 and 7), 09.11 and
  09.13 (Layer 6), 09.14 (§7.3); 09.12 (Meyer inequalities) and 09.15–09.16 (density criteria)
  are under *Beyond this roadmap* and *Downstream consumers*.

## Exact supplier contracts

### From Mathlib

- `ProbabilityTheory.IsGaussianProcess`, `ProbabilityTheory.HasLaw`,
  `ProbabilityTheory.gaussianReal`, `ProbabilityTheory.stdGaussian` and
  `ProbabilityTheory.variance`.
- `MeasureTheory.Lp`, `MeasureTheory.MemLp`, `MeasureTheory.eLpNorm`, `MeasureTheory.lpMeas`
  and `MeasureTheory.Measure.pi`.
- `Submodule.starProjection`, `OrthogonalFamily` and `HilbertBasis`.
- `Polynomial.hermite`, the monic probabilists' Hermite polynomials.
- Mathlib has no isonormal process, Wiener chaos, multiple integral, Malliavin derivative,
  divergence or infinite-dimensional Ornstein–Uhlenbeck semigroup, and no open Mathlib pull
  request on them.

### From Tau Ceti

- `TauCeti.gaussianHermiteHilbertBasis`
  (`TauCeti/Probability/Distributions/Gaussian/Hermite/Basis.lean`): the normalized Hermite
  polynomials Heₙ/√(n!) as a Hilbert basis of L² of the standard Gaussian, used in §2.2.
- The multi-index Gaussian Hermite basis and its expansion theorem
  (`TauCeti/Probability/Distributions/Gaussian/Hermite/Pi/Basis.lean` and
  `TauCeti/Probability/Distributions/Gaussian/Hermite/Pi/Parseval.lean`): the Hilbert basis
  ∏ᵢ Heₐᵢ(xᵢ)/√(aᵢ!) of L² of the standard Gaussian on a finite product, used for density in
  §2.2 and for Mehler's formula in §6.1.

### From other roadmaps

- [StochasticCalculus](../StochasticCalculus/README.md) (on main):
  - §1.3: the Wiener integral of deterministic L²([0, T]) integrands against a Brownian motion,
    an isonormal process; it is the isonormal process of Layer 7.
  - Layer 3: the Itô integral of square-integrable predictable integrands with the Itô isometry,
    for §§7.1–7.2.
  - §6.1: the L² martingale representation theorem in the augmented Brownian filtration, with a
    unique predictable integrand, for §7.3.
  - No other section of StochasticCalculus is consumed.

## Beyond this roadmap

- **Meyer inequalities** (CKMA 09.12): equivalence of ‖DF‖_{Lᵖ(H)} and ‖(−L)^{1/2}F‖_p for
  1 < p < ∞, through the Riesz transform and Pisier's method (Nualart, §1.5, p. 67;
  Nualart–Nualart, §5.3, p. 80), the continuity of the iterated divergence between Sobolev
  spaces (Nourdin–Peccati, Theorem 2.5.5, p. 35), and the Sobolev spaces 𝔻^{k,p} with their
  duality.
- **Higher derivatives and 𝔻^∞**: iterated derivatives, Stroock's formula in full, and the
  algebra 𝔻^∞ (Nualart, Remark 2, p. 31, and §1.5, p. 67).
- **Densities of Wiener functionals**: the Bouleau–Hirsch criterion, smoothness of densities
  under the nondegeneracy of the Malliavin matrix (CKMA 09.15–09.16; Nualart, §2.1, p. 85;
  Nourdin–Peccati, Theorem 2.10.1, p. 54), and Hörmander's theorem for SDEs (Nualart, §2.3,
  p. 125),
  which needs the SDE theory of StochasticCalculus Layer 9.
- **Malliavin–Stein method**: the fourth moment theorem, Peccati–Tudor, Breuer–Major and
  second-order Poincaré inequalities, owned by a planned roadmap that consumes this one.
- **Anticipating calculus**: the Skorokhod integral of non-adapted integrands with the
  anticipating Itô formula and Stratonovich integrals (Nualart, Chapter 3, p. 169).

## References

- D. Nualart, *The Malliavin Calculus and Related Topics*, 2nd ed., Probability and Its
  Applications, Springer, 2006. Chapter 1.
- I. Nourdin and G. Peccati, *Normal Approximations with Malliavin Calculus: From Stein's Method
  to Universality*, Cambridge Tracts in Mathematics 192, Cambridge University Press, 2012.
  Chapters 1–2.
- D. Nualart and E. Nualart, *Introduction to Malliavin Calculus*, Institute of Mathematical
  Statistics Textbooks 9, Cambridge University Press, 2018. Chapters 3–6.
- V. I. Bogachev, *Gaussian Measures*, Mathematical Surveys and Monographs 62, American
  Mathematical Society, 1998. §§2.9, 5.4–5.5.
- G. Da Prato, *Introduction to Stochastic Analysis and Malliavin Calculus*, 3rd ed., Edizioni
  della Normale, 2014. Chapters 2–3 and 11.
