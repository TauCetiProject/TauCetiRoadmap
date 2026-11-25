# Roadmap: Markov diffusion operators and the Bakry–Émery Γ-calculus

**Summary.** This roadmap builds the abstract theory of symmetric Markov diffusion operators of Bakry, Gentil and Ledoux [BGL, Chapter 3], together with its first consequences, the Poincaré, logarithmic Sobolev and Gaussian isoperimetric inequalities under a curvature-dimension condition [BGL, §§4.8, 4.9, 5.7, 8.5]. A *diffusion triple* `(E, μ, Γ)` is a σ-finite measure space with an algebra of test functions and a symmetric bilinear *carré du champ* `Γ` obeying the chain rule of first-order calculus. Its generator `L` is defined by integration by parts, `∫ g Lf dμ = −∫ Γ(f, g) dμ`. The Dirichlet form `ℰ(f) = ∫ Γ(f, f) dμ` closes to a self-adjoint operator and a symmetric sub-Markov semigroup `P_t = e^{tL}`. The iterated carré du champ `Γ₂(f) = ½ (L Γ(f) − 2 Γ(f, Lf))` defines the curvature-dimension condition `CD(ρ, n)`: `Γ₂(f) ≥ ρ Γ(f) + (Lf)²/n`.

The headline theorems are:
* on a full triple with `CD(ρ, ∞)`, the strong gradient bound `√Γ(P_t f) ≤ e^{−ρt} P_t √Γ(f)` for every `ρ ∈ ℝ` [BGL, Theorem 3.3.18];
* under `CD(ρ, ∞)`, mass conservation `P_t 1 = 1` on complete ESA triples with an extended algebra, and finiteness of `μ` when moreover the triple is ergodic and `ρ > 0` [BGL, Theorem 3.3.23];
* the extension of `Γ₂` and of the Hessian to the generator domain [BGL, Propositions 3.3.16–3.3.17];
* for a probability measure and `ρ > 0`, the Poincaré and logarithmic Sobolev inequalities with constant `1/ρ` when `n = ∞`, and with constant `(n−1)/(ρn)` when `1 < n < ∞` [BGL, Proposition 4.8.1, Theorem 4.8.4, Proposition 5.7.1, Theorem 5.7.4];
* the local Bobkov inequalities, equivalent to `CD(ρ, ∞)`, and for a probability measure and `ρ > 0` the Bobkov inequality `√ρ I(∫ f dμ) ≤ ∫ √(ρ I²(f) + Γ(f)) dμ`, with `I` the Gaussian isoperimetric profile; for Gibbs measures with `∇²V ≥ ρ > 0` it gives the Gaussian isoperimetric comparison `μ⁺(A) ≥ √ρ I(μ(A))` [BGL, Theorem 8.5.3, Corollaries 8.5.4–8.5.5];
* for every smooth `V` with positive-definite Hessian and `e^{−V}` integrable, the Brascamp–Lieb inequality `Var_{μ_V}(f) ≤ ∫ ⟨(∇²V)⁻¹ ∇f, ∇f⟩ dμ_V`, which improves the Bakry–Émery Poincaré inequality `P(1/ρ)`, by Hörmander's L² method and by the Helffer–Sjöstrand representation [BGL, Theorem 4.9.1].

The theory is instantiated on the circle, Brownian motion on `ℝᵈ`, the Ornstein–Uhlenbeck operator, the round spheres `S^{d−1}`, and the Gibbs probability measures `μ_V ∝ e^{−V} dx` on `ℝᵈ` for every smooth `V` with `e^{−V}` integrable. These instances carry `CD(0, 1)`, `CD(0, d)`, `CD(1, ∞)`, `CD(d−2, d−1)`, and `CD(ρ, ∞)` exactly when `∇²V ≥ ρ`, respectively.

The roadmap consumes Tau Ceti's strongly continuous semigroups (the completed OneParameterSemigroups roadmap) and its form-generated semigroups, and closed forms and the Friedrichs extension from OperatorTheory/UnboundedOperators. Elliptic regularity comes from the PDE roadmap; it is needed for the sphere and the Gibbs instances. The roadmap recovers the Euclidean Poincaré inequality of RandomMatrices §2.2 for uniformly convex Gibbs measures, beyond the Gaussian case implemented in Tau Ceti. Its Ornstein–Uhlenbeck case proves the Gaussian logarithmic Sobolev inequality, a target of RandomMatrices §2.2 of which Tau Ceti has only the sharpness. It consumes the Gaussian isoperimetric profile of GaussianIsoperimetryAndClusters §1.1, implemented in Tau Ceti, and recovers the Gaussian isoperimetric inequality of that roadmap for closed sets by the semigroup proof of Bakry and Ledoux.

Layer 1 sets up diffusion triples and the Γ-calculus on test functions. Layer 2 builds the Dirichlet form, the self-adjoint generator and the Markov semigroup. Layer 3 adds ergodicity, essential self-adjointness (ESA) and conservativeness. Layer 4 introduces the extended algebra, full and compact triples, `Γ₂`, and `CD(ρ, n)`. Layer 5 extends the Γ-calculus to the generator domain. Layer 6 proves the gradient bounds and mass conservation. Layers 7 and 8 prove the Poincaré and logarithmic Sobolev inequalities. Layer 9 builds the models. Layer 10 proves the Bobkov and Gaussian isoperimetric inequalities under `CD(ρ, ∞)`. Layer 11 proves the Brascamp–Lieb inequality for strictly convex potentials, and Prékopa's theorem from it.

## Conventions

- **Functions and measures.** `E` is a measurable space and `μ : Measure E` is σ-finite. When `μ` is finite it is a probability measure. Functions are real valued, `E → ℝ`. Equalities and inequalities between functions hold `μ`-almost everywhere (`=ᵐ[μ]`, `≤ᵐ[μ]`), except membership in an algebra, which is literal.
- **Operators on functions.** `Γ : (E → ℝ) → (E → ℝ) → (E → ℝ)` and `L : (E → ℝ) → (E → ℝ)` are total functions. Every hypothesis and conclusion about them is stated on the test algebra `A₀` or the extended algebra `A`; their values elsewhere carry no meaning and are never used. The extensions built in Layers 2 and 5 (the generator on `Lp ℝ 2 μ`, and `Γ`, `Γ₂` and the Hessian on `𝒟(ℰ)` and `𝒟(L)`) are separate objects, written with the same letters by abuse of notation; in Lean they get their own names. Write `Γ(f) = Γ(f, f)`.
- **Algebras.** The test algebra `A₀ : NonUnitalSubalgebra ℝ (E → ℝ)` consists of bounded measurable functions in every `Lᵖ(μ)`, `1 ≤ p < ∞`. It does not contain the constants when `μ` is infinite. The extended algebra `A : Subalgebra ℝ (E → ℝ)` contains `A₀` and the constants.
- **Signs.** `L` is nonpositive: `ℰ(f) = ∫ Γ(f) dμ = −∫ f Lf dμ ≥ 0`. The semigroup is `P_t = e^{tL}`, `t ≥ 0`.
- **Curvature-dimension.** `n : ℝ≥0∞` with `1 ≤ n`. The term `(Lf)²/n` is `(n⁻¹).toReal * (Lf)²`, so `n = ∞` removes it. `CD(ρ, n)` is defined on the test algebra `A₀`. [BGL, Definition 3.3.14] states it on the extended algebra `A`, and [BGL, Remark 3.3.15] explains why the inequality on `A₀` extends to `A`; prove that extension for every diffusion triple equipped with an extended algebra, since it uses only the ideal property, the chain rules and order detection (F1–F6), and not ESA, ergodicity or conservativeness. Never quantify over a separately supplied, unconstrained function class.
- **Inequalities.** The Poincaré inequality `P(C)` is `Var_μ(f) ≤ C ℰ(f)`. The logarithmic Sobolev inequality `LS(C)` is `Ent_μ(f²) ≤ 2C ℰ(f)`. These are the normalizations of Tau Ceti's `MeasureTheory.Measure.PoincareInequality` and `MeasureTheory.Measure.LogSobolevInequality`. Variance is Mathlib's `ProbabilityTheory.variance` and entropy is Tau Ceti's `MeasureTheory.Measure.entropy`.
- **Hilbert space.** The semigroup and generator act on `Lp ℝ 2 μ`. A function `f` in `A₀` and its class in `Lp ℝ 2 μ` are related by `MemLp.toLp`.

## Layer 1: diffusion triples and the Γ-calculus on test functions

### 1.1 Diffusion triples

A **diffusion triple** consists of `μ`, `A₀`, `Γ` and `L`, subject to [BGL, Definitions 3.1.1, 3.1.3, 3.1.8; properties D1–D3, D5, D6 and D8 of §3.4.1, D4 being a theorem of §1.2 and D7, D9 the constructions of Layer 2]:
* `μ` is σ-finite, and a probability measure when finite;
* the σ-algebra is countably generated up to `μ`-null sets;
* elements of `A₀` are measurable, bounded, and in every `Lᵖ(μ)` with `1 ≤ p < ∞`, and `A₀` is dense in each of these `Lᵖ(μ)`;
* `A₀` is stable under `(f₁, …, f_k) ↦ ψ(f₁, …, f_k)` for every smooth `ψ : ℝᵏ → ℝ` with `ψ(0) = 0`;
* there is an exhaustion: an a.e. increasing sequence in `A₀` converging a.e. to `1`;
* `Γ` maps `A₀ × A₀` into `A₀` and is symmetric, bilinear and nonnegative;
* `Γ` satisfies the diffusion property `Γ(ψ(f₁, …, f_k), g) = Σᵢ ∂ᵢψ(f₁, …, f_k) Γ(fᵢ, g)`;
* `L` maps `A₀` into `A₀`, with `∫ g Lf dμ = −∫ Γ(f, g) dμ` and `∫ Lf dμ = 0` for `f, g ∈ A₀`.

`Suggested.lean` gives the structure. The linearity of `L` and the chain rule for `L` are theorems, not fields.

### 1.2 The Γ-calculus on `A₀`

Prove, for `f, g, h ∈ A₀` and smooth `ψ` with `ψ(0) = 0` [BGL, (3.1.1), (3.1.6), (3.1.8)]:
* `L` is linear on `A₀`;
* the fundamental identity `L(fg) = f Lg + g Lf + 2 Γ(f, g)`;
* the chain rule `L ψ(f₁, …, f_k) = Σᵢ ∂ᵢψ Lfᵢ + Σᵢⱼ ∂ᵢ∂ⱼψ Γ(fᵢ, fⱼ)`;
* the Leibniz rule `Γ(fg, h) = f Γ(g, h) + g Γ(f, h)`;
* the Cauchy–Schwarz inequality `Γ(f, g)² ≤ Γ(f) Γ(g)`;
* the `L²` continuity estimate `|∫ Γ(f, g) dμ| ≤ ‖Lf‖₂ ‖g‖₂` [BGL, D4];
* `∫ Γ(f, g) dμ = −∫ f Lg dμ`, a symmetric bilinear form on `A₀`.

The fundamental identity holds a.e. and needs the diffusion property, but not the density of `A₀`: the defect `F = L(fg) − f Lg − g Lf − 2Γ(f, g)` lies in `A₀`, integration by parts, the diffusion property for `ψ(a, b) = ab` and the symmetry of `Γ` give `∫ h F dμ = 0` for every `h ∈ A₀`, and `h = F` gives `F = 0` a.e. Integration by parts alone, without the diffusion property, does not determine `Γ` pointwise.

**Checks.**
- On the circle `ℝ/2πℤ` with `Γ(f, g) = f'g'` and `L = d²/dx²`: `L(cos²) = −2 cos 2x` and `2 cos·L cos + 2Γ(cos) = −2cos² + 2sin² = −2 cos 2x`.
- Two-point space `{0, 1}` with the Markov chain generator `Lf(x) = f(1−x) − f(x)` and uniform measure: the carré du champ defined by the fundamental identity is `Γ(f) = (f(1) − f(0))²/2`. Then `Γ(f², f) ≠ 2f Γ(f)` for `f = 1_{1}`, so this is not a diffusion triple.

*Needs:* Mathlib `NonUnitalSubalgebra`, `MemLp`, `Lp`, `ContDiff`, `fderiv`.

## Layer 2: the Dirichlet form, the generator and the Markov semigroup

### 2.1 The closed form

The form `ℰ(f, g) = ∫ Γ(f, g) dμ` on the image of `A₀` in `Lp ℝ 2 μ` is nonnegative, symmetric and closable, because `−L` is a nonnegative symmetric operator on that image. Construct its closure, the **Dirichlet form** `ℰ` with domain `𝒟(ℰ)`, as a closed form in the sense of UnboundedOperators UO-D06. Prove that `A₀` is a form core, and that `𝒟(ℰ)` with the norm `(‖f‖₂² + ℰ(f))^{1/2}` is a Hilbert space [BGL, Definition 3.1.8, §3.1.4].

### 2.2 The generator and the semigroup

The **generator** is the nonpositive self-adjoint operator `L = −𝐄 : Lp ℝ 2 μ →ₗ.[ℝ] Lp ℝ 2 μ`, where `𝐄` is the nonnegative self-adjoint operator that UO-D06 associates with `ℰ` (`ℰ(u, v) = ⟪𝐄u, v⟫`; the Friedrichs extension of `−L` on `A₀`). It extends `L` on `A₀`. Its domain is characterized by `u ∈ 𝒟(L)` with `Lu = w` if and only if `u ∈ 𝒟(ℰ)` and `ℰ(u, v) = −⟪w, v⟫` for every `v ∈ A₀` [BGL, §3.1.4].

The semigroup `P_t` is `IsCoercive.formSemigroup` of the coercive form `ℰ + ⟪·,·⟫` on `𝒟(ℰ)`, shifted by `TauCeti.Semigroups.StronglyContinuousSemigroup.expShift` with parameter `−1` (Tau Ceti's convention is `expShift λ = e^{−λt} S(t)`, and the form semigroup is `e^{−t} P_t`). Prove that:
* its generator is `L`;
* it is a symmetric contraction semigroup on `Lp ℝ 2 μ`;
* `P_t u ∈ 𝒟(L)` for `t > 0`, with `‖L P_t u‖₂ ≤ ‖u‖₂ / t`;
* `ℰ(P_t u)` is nonincreasing in `t`.

### 2.3 Positivity and the sub-Markov property

Prove the Beurling–Deny criteria for `ℰ`: normal contractions operate on `𝒟(ℰ)` and do not increase `ℰ`. Deduce that `P_t` is positivity preserving and sub-Markov: `0 ≤ u ≤ 1` implies `0 ≤ P_t u ≤ 1` [BGL, §§1.7, 3.1; FOT, Chapter 1; Davies, Chapter 1]. Deduce that `P_t` extends to a contraction of every `Lᵖ(μ)`, `1 ≤ p ≤ ∞`: on `L^∞` from sub-Markovianity, and for `1 ≤ p < ∞` from Jensen's inequality `|P_t f|ᵖ ≤ P_t(|f|ᵖ)` (positivity and `P_t 1 ≤ 1`) together with `∫ P_t g dμ ≤ ∫ g dμ` for `g ≥ 0` (symmetry against indicators of sets of finite measure, and `P_t 1_B ≤ 1`). No interpolation theorem is needed.

**Checks.**
- Circle, normalized Haar measure: `P_t cos(kx) = e^{−k²t} cos(kx)` and `ℰ(cos(kx)) = k²/2`.
- On `ℝ` with Lebesgue measure and `A₀ = C_c^∞(ℝ)`, `P_t` is convolution with the heat kernel `(4πt)^{−1/2} e^{−x²/4t}`.

*Needs:* §1.2; UnboundedOperators UO-D06; Tau Ceti `IsCoercive.formSemigroup`, `TauCeti.Semigroups.StronglyContinuousSemigroup.expShift`, `TauCeti.Semigroups.ContractionSemigroup`.

## Layer 3: ergodicity, essential self-adjointness and conservativeness

- **Essential self-adjointness (ESA).** `L` restricted to `A₀` is essentially self-adjoint, i.e. `A₀` is a core for the generator [BGL, Definition 3.1.10].
- **Ergodicity.** `Lu = 0` implies that `u` is constant, and zero when `μ` is infinite [BGL, Definition 3.1.11]. Prove that ergodicity is equivalent to: `ℰ(u) = 0` implies `u` constant.
- **Conservativeness.** For some, equivalently every, exhaustion `(u_k)`, `P_t u_k → 1` a.e. for every `t` [BGL, Definition 3.1.12]. When `μ` is finite this says `P_t 1 = 1`. Prove the independence of the exhaustion, and that conservativeness gives `∫ P_t f dμ = ∫ f dμ` for `f ∈ L¹(μ)`.
- **Long-time behaviour** [BGL, Proposition 3.1.13]. Under ergodicity, `P_t f → 0` in `L²(μ)` for every `f ∈ L²(μ)` when `μ` is infinite, and `P_t f → ∫ f dμ` when `μ` is finite and the triple is conservative. Route, without the spectral theorem: `‖P_t f‖₂` is nonincreasing, and symmetry gives `‖P_t f − P_s f‖₂² = ‖P_t f‖₂² + ‖P_s f‖₂² − 2‖P_{(t+s)/2} f‖₂²`, so `P_t f` is Cauchy; its limit `g` is invariant, so `Lg = 0` and `g` is constant by ergodicity, zero when `μ` is infinite, and `∫ g dμ = ∫ f dμ` by conservativeness.
- **Finite measure.** If `μ` is finite and ESA holds, then `1 ∈ 𝒟(L)`, `L1 = 0`, `P_t 1 = 1`, and the triple is conservative.
- **Standard triples.** A standard triple is a diffusion triple that is ergodic and conservative [BGL, Definition 3.1.15]. Conservativeness is nonetheless proved, not assumed, in the models: for a finite measure it follows from ESA (previous item), and Theorem 3.3.23 (Layer 6) proves it for complete ESA diffusion triples with an extended algebra under `CD(ρ, ∞)`, which are not assumed standard.

**Checks.**
- The open interval `(0, 1)` with Lebesgue measure, `A₀ = C_c^∞((0, 1))`, `Γ(f) = f'²`, is a diffusion triple that is not ESA: the Dirichlet and Neumann realizations of `d²/dx²` are two distinct self-adjoint extensions.
- The circle is ESA, ergodic and conservative.

*Needs:* Layer 2.

## Layer 4: extended algebras, full and compact triples, `Γ₂` and `CD(ρ, n)`

### 4.1 Extended algebra, full and compact triples

The **extended algebra** `A` [BGL, Definition 3.3.1; hypotheses F1–F9] is an algebra of measurable functions containing `A₀` and the constants. Require all of the following:
* **Ideal property (F1):** `f h ∈ A₀` whenever `f ∈ A` and `h ∈ A₀`.
* **Order detection (F2):** if `f ∈ A` and `∫ h f dμ ≥ 0` for every nonnegative `h ∈ A₀`, then `f ≥ 0` a.e.
* **Smooth composition (F3):** `A` is stable under smooth functions of several variables.
* **Extended operators (F4–F6):** `L` maps `A` to `A`; `Γ` maps `A × A` to `A` and is given there by `Γ(f, g) = ½(L(fg) − f Lg − g Lf)`; `Γ(f, f) ≥ 0`; and the diffusion and generator chain rules hold on `A`.
* **Integration by parts (F7):** for `f ∈ A` and `g ∈ A₀`, `∫ Γ(f, g) dμ = −∫ g Lf dμ = −∫ f Lg dμ`.
* **Semigroup stability (F8):** for `f ∈ A₀` and `t ≥ 0`, `P_t f` has a representative in `A`.
* **Connexity (F9):** `f ∈ A` and `Γ(f) = 0` imply that `f` is constant [BGL, Definition 3.3.7].

A **full triple** is a standard triple equipped with such an extended algebra and satisfying essential self-adjointness (ESA) for `L` on `A₀` [BGL, Definition 3.3.25]. A **compact triple** is a full triple with `μ` a probability measure, `1 ∈ A₀` and `A = A₀` [BGL, Definition 3.3.26]; ESA is already part of the full-triple hypothesis. A diffusion triple is **complete** if there is a nonnegative exhaustion `(u_k)` in `A₀` with `Γ(u_k) ≤ 1/k` [BGL, Definition 3.3.9]. A diffusion triple is **weakly hypo-elliptic** if every `u ∈ L²(μ)` with `L*u = λu` for some `λ ∈ ℝ` is in `A` [BGL, Definition 3.3.8]. Connexity (F9) and weak hypo-ellipticity refer only to `A`, `Γ`, `L` and the semigroup, so they make sense for a diffusion triple equipped with an extended algebra satisfying F1–F9 that is not yet known to be ESA or ergodic; Layer 5 uses them in that setting.

Prove that `L` and `Γ(u, u)` on `A` depend only on a.e. classes, and the chain rules `Γ(ψ∘g, h) = ψ'(g) Γ(g, h)` and `Γ(f²) = 4f² Γ(f)` on `A`.

### 4.2 `Γ₂` and the curvature-dimension condition

Define `Γ₂(f, g) = ½ (L Γ(f, g) − Γ(f, Lg) − Γ(g, Lf))` on `A` [BGL, Definition 3.3.12]. Define `CD(ρ, n)` on `A₀` as in the Conventions and prove its extension to `A` for every diffusion triple with an extended algebra [BGL, Definition 3.3.14 and Remark 3.3.15]. The results of this subsection assume neither ESA nor ergodicity nor conservativeness, except where stated; Layer 6 uses them on triples not yet known to be full. Prove the following.
* `Γ₂` is symmetric and bilinear.
* The Hessian `H(f)(g, h) = ½ (Γ(g, Γ(f, h)) + Γ(h, Γ(f, g)) − Γ(f, Γ(g, h)))` is a first-order operator in `g` and `h`, and enters the product rule `Γ₂(hf, g) = h Γ₂(f, g) + f Γ₂(h, g) + 2 H(g)(h, f)` [BGL, (3.3.3)–(3.3.4)].
* The chain rule for `Γ₂(ψ(f))`.
* `CD(ρ, n)` is monotone: it implies `CD(ρ', n')` for `ρ' ≤ ρ` and `n' ≥ n`.
* Reinforced curvature: on a diffusion triple with an extended algebra under `CD(ρ, n)`, `Γ(Γ(f)) ≤ 4 (Γ₂(f) − ρ Γ(f)) Γ(f)` on `A` [BGL, (3.3.6)].
* The integrated identity `∫ Γ₂(f) dμ = ∫ (Lf)² dμ` for `f ∈ A₀` [BGL, (3.3.8)]. Hence `CD(ρ, n)` gives `ρ ℰ(f) + (1/n) ‖Lf‖₂² ≤ ‖Lf‖₂²` on `A₀`, and by ESA on `𝒟(L)`.

**Checks.**
- On `ℝᵈ` with Lebesgue measure: `Γ₂(f) = ‖∇²f‖²_HS ≥ (Δf)²/d`. So `CD(ρ, n)` holds if and only if `ρ ≤ 0` and `n ≥ d`.
- Ornstein–Uhlenbeck on `ℝ`, `Lf = f'' − x f'`: `Γ₂(f) = f''² + f'²`. This gives `CD(1, ∞)`. For `n < ∞`, `CD(ρ, n)` holds for no `ρ`: at `f ∈ A₀` equal to `x` on `[−R, R]`, it would need `1 ≥ ρ + x²/n` for `|x| < R`, and `R` is arbitrary.
- Circle: `Γ₂(f) = f''² = (Lf)²`, so `CD(0, 1)` holds.

*Needs:* Layer 3.

## Layer 5: the Γ-calculus on the generator domain

- **Weak hypo-ellipticity.** Here the triple is a diffusion triple equipped with an extended algebra `A` satisfying F1–F9 of Layer 4, complete and weakly hypo-elliptic. It is not assumed ESA or ergodic: these are the conclusions. Prove that if `u ∈ 𝒟(ℰ)` and `ℰ(u) = 0`, then `Lu = 0`, so `u ∈ A` by weak hypo-ellipticity, `Γ(u) = 0` by the agreement of `Γ` on `A ∩ 𝒟(ℰ)` (next item, proved independently of this one), and `u` is constant by connexity (F9), hence zero when `μ` is infinite. Deduce that the triple is ergodic [BGL, Proposition 3.3.10]. ESA [BGL, Proposition 3.3.11] needs a separate argument, the cutoff argument of [BGL, Proposition 3.2.1], and is where completeness is used. Since `L` is nonpositive and symmetric on `A₀`, it suffices that `L*u = λu` with `u ∈ L²(μ)` and `λ > 0` forces `u = 0`. Such `u` is in `A` by weak hypo-ellipticity, and `Lu = L*u = λu` by F7 [BGL, Proposition 3.3.5(i)]. Let `(ζ_k)` be the exhaustion of completeness. F7 with `ζ_k² u ∈ A₀` (F1), the Leibniz rule and `2|ζ_k u Γ(u, ζ_k)| ≤ ζ_k² Γ(u) + u² Γ(ζ_k)` give `λ ∫ ζ_k² u² dμ ≤ ∫ u² Γ(ζ_k) dμ ≤ ‖u‖₂²/k`, and monotone convergence gives `u = 0`.
- **`Γ` on the form domain.** Extend `Γ` to `𝒟(ℰ)` as an `L¹(μ)`-valued symmetric bilinear map, with Cauchy–Schwarz, the Leibniz rule on `𝒟(ℰ) ∩ L^∞(μ)` (an algebra, unlike `𝒟(ℰ)`), and agreement with `Γ` on `A ∩ 𝒟(ℰ)` [BGL, §3.1.4, Proposition 3.1.5, Proposition 3.3.5(ii)]; none of this uses ESA. Prove also: if `f ∈ A ∩ 𝒟(ℰ)` and `Lf ∈ L²(μ)`, then `f ∈ 𝒟(L)` [BGL, Proposition 3.3.5(iii)]; and under ESA, `f ∈ A ∩ L²(μ)` with `Lf ∈ L²(μ)` is in `𝒟(L)`, and `f ∈ A ∩ L²(μ)` with `Γ(f) ∈ L¹(μ)` is in `𝒟(ℰ)` [BGL, Proposition 3.3.6], as used in Layer 6.
- **`Γ₂` and the Hessian on the generator domain** [BGL, Proposition 3.3.16]. On a diffusion triple with an extended algebra, satisfying ESA and `CD(ρ, ∞)` for some `ρ ∈ ℝ` (the hypotheses of [BGL]; in particular on a full triple with `CD(ρ, n)`, which implies `CD(ρ, ∞)`):
  * `Γ`, `Γ₂` and the Hessian `H` extend from `A₀` to `𝒟(L)`, as `L¹(μ)` limits along every graph-norm convergent sequence, independently of the sequence;
  * `∫ Γ₂(u) dμ = ‖Lu‖₂²` and `∫ Γ(u) dμ = −⟪Lu, u⟫`;
  * the product rules hold;
  * under `CD(ρ, n)`, `CD(ρ, n)` and the Hessian inequality (3.3.7) extend to `𝒟(L)`.
- **Identification** [BGL, Proposition 3.3.17]. Under the same hypotheses:
  * For `f ∈ A ∩ 𝒟(L)`, the extensions agree with the algebraic `Γ₂` and `H`, and `∫ Γ₂(f) dμ = ∫ (Lf)² dμ`.
  * Symmetric integration by parts `∫ Lk·g dμ = ∫ k·Lg dμ` holds for `k ∈ A ∩ 𝒟(L)` and `g ∈ A ∩ 𝒟(ℰ)` with `Lg ∈ L²`; this item needs neither ESA nor CD, only Proposition 3.3.5(i), (iii) and self-adjointness.
  * Converse: for `f ∈ A ∩ L²(μ)` with `Γ(f), Γ₂(f) ∈ L¹(μ)`, `f ∈ 𝒟(L)`. Prove this for complete full triples with `CD(ρ, n)`, `n ∈ [1, ∞]`. For `n < ∞` completeness is not needed and the proof is short: `(Lf)² ≤ n (Γ₂(f) − ρ Γ(f))` puts `Lf` in `L²(μ)`, so `f ∈ 𝒟(L*)` by F7, and `f ∈ 𝒟(L)` by ESA; the case `n = ∞` is the one with content.

**Checks.**
- Ornstein–Uhlenbeck: `f(x) = x` is in `A ∩ 𝒟(L)` with `Γ₂(f) = 1` and `∫ (Lf)² dγ = ∫ x² dγ = 1`.

*Needs:* Layer 4.

## Layer 6: gradient bounds and mass conservation

On a diffusion triple with an extended algebra `A`, satisfying ESA and `CD(ρ, ∞)` (in particular on a full triple), for every `ρ ∈ ℝ`, `f ∈ A₀` and `t ≥ 0`, prove [BGL, Theorem 3.3.18 and its hypotheses]:
* the strong gradient bound `√Γ(P_t f) ≤ e^{−ρt} P_t(√Γ(f))` [BGL, Theorem 3.3.18], through the interpolation `s ↦ ∫ P_s h · Φ_ε(Γ(P_{t−s} f)) dμ` of [BGL, Lemmas 3.3.20–3.3.21], with `Φ_ε(r) = √(r + ε²) − ε`;
* the weak gradient bound `Γ(P_t f) ≤ e^{−2ρt} P_t(Γ(f))` [BGL, Corollary 3.3.19].

If moreover the triple is complete, it is conservative [BGL, Theorem 3.3.23]. If in addition the triple is ergodic and `ρ > 0`, then `μ` is finite. [BGL, Theorem 3.3.23] states the finiteness without ergodicity, which its proof needs; see the Checks. Run the route with test functions `ξ = η²`, `η ∈ A₀`, so that `√Γ(ξ) = 2|η|√Γ(η) ∈ L¹(μ)` also when `μ` is infinite. The triple is not assumed standard here, so conservativeness is a genuine conclusion; it is how the Brownian model of Layer 9 becomes a full triple.

**Checks.**
- On `ℝ`, with `f` smooth and compactly supported, `|∂ₓ P_t f| = |P_t f'| ≤ P_t |f'|`. Equality in the strong bound with `ρ = 0` needs `f'` of constant sign, which no nonzero `f ∈ A₀` has; it holds for bounded nondecreasing `f ∈ A`, for example `f = arctan`.
- Ornstein–Uhlenbeck: `∂ₓ P_t f = e^{−t} P_t f'`, so the strong bound holds with equality at `ρ = 1` for bounded nondecreasing `f ∈ A`, for example `f = arctan`.
- Finiteness needs ergodicity: on `ℝ × ℕ` with `γ ⊗` counting measure and the Ornstein–Uhlenbeck operator on each copy (`A₀` the functions that are `C_c^∞` on finitely many copies and `0` elsewhere, `A` the functions equal to a constant `c` on all but finitely many copies with `F − c` Schwartz on each), the triple is complete, ESA, conservative and `CD(1, ∞)`, F9 holds, but `μ` is infinite; the indicator of one copy is a nonconstant `u` with `Lu = 0`.
- These equality cases are computed from the explicit semigroups, outside the class `A₀` of the theorem; they show that the factor `e^{−ρt}` cannot be improved.

*Needs:* Layer 5.

## Layer 7: Poincaré inequalities and spectral gap under curvature

The **Poincaré inequality** `P(C)` of a diffusion triple with probability measure is `Var_μ(f) ≤ C ℰ(f)` for `f ∈ A₀` [BGL, Definition 4.2.1]. Prove the following.
* `P(C)` on `A₀` is equivalent to `P(C)` on `𝒟(ℰ)`.
* For `C > 0`, `P(C)` is equivalent to the spectral gap `ℰ(u) ≥ C⁻¹ ‖u − ∫u‖₂²` on `𝒟(ℰ)`. If moreover the triple is conservative, for example a full triple (Layer 3), `P(C)` is equivalent to the exponential decay `‖P_t u − ∫ u‖₂ ≤ e^{−t/C} ‖u − ∫ u‖₂` [BGL, Theorem 4.2.5(i)–(ii)]. Prove also that the decay with an `f`-dependent constant, `Var_μ(P_t f) ≤ c(f) e^{−2t/C}`, already implies `P(C)`, through the log-convexity of `t ↦ ‖P_t f‖₂²` [BGL, Theorem 4.2.5(iii), Lemma 4.2.6]. Without conservativeness this fails: on the interval `(0, 1)` of Layer 3, `P(1/π²)` holds but `P_t 1 ≠ 1`.
* A full triple with probability measure satisfies `P(C)` for some `C > 0` if and only if `ℰ(f) ≤ C ‖Lf‖₂²` on `𝒟(L)` [BGL, Proposition 4.8.3]; the direction from `ℰ(f) ≤ C ‖Lf‖₂²` to `P(C)` uses the long-time behaviour of Layer 3.
* Under `CD(ρ, ∞)` with `ρ > 0`, a full triple with probability measure satisfies `P(1/ρ)` [BGL, Proposition 4.8.1].
* Under `CD(ρ, n)` with `ρ > 0` and finite `n > 1`, it satisfies `P((n−1)/(ρn))` [BGL, Theorem 4.8.4]. The case `n = ∞` is Proposition 4.8.1 above.

**Checks.**
- The circle is `CD(0, 1)` and has spectral gap `1`, attained by `cos x`. Curvature `0` gives no bound, and the inequality `P(1)` holds by Fourier series.
- Ornstein–Uhlenbeck with `ρ = 1`: `P(1)` holds with equality for `f(x) = x`, an equality on `𝒟(ℰ)` through the first item (no nonzero `f ∈ A₀` attains it), agreeing with Tau Ceti's `TauCeti.Probability.poincareInequality_stdGaussian`.

*Needs:* Layers 3–5; Mathlib `ProbabilityTheory.variance`.

## Layer 8: entropy and logarithmic Sobolev inequalities under curvature

The **logarithmic Sobolev inequality** `LS(C)` of a diffusion triple with probability measure is `Ent_μ(f²) ≤ 2C ℰ(f)` for `f ∈ A₀` [BGL, Definition 5.1.1], with `Ent_μ` Tau Ceti's `MeasureTheory.Measure.entropy`. Define the Fisher information `I_μ(f) = ∫ Γ(f)/f dμ` for positive `f`. Prove the following.
* `LS(C)` extends from `A₀` to `𝒟(ℰ)`.
* On a conservative triple, `LS(C)` implies `P(C)` [BGL, Proposition 5.1.3, first assertion]: apply `LS(C)`, extended to `𝒟(ℰ)`, to `1 + εg` and let `ε → 0`. Conservativeness and the finiteness of `μ` give `1 ∈ 𝒟(L)` with `L1 = 0`, hence `1 + εg ∈ 𝒟(ℰ)` and `ℰ(1 + εg) = ε² ℰ(g)`; on the interval `(0, 1)` of Layer 3, `1 ∉ 𝒟(ℰ)`.
* Under `CD(ρ, ∞)` with `ρ > 0`, a full triple with probability measure satisfies `LS(1/ρ)` [BGL, Proposition 5.7.1]. The route is the de Bruijn identity `d/dt Ent_μ(P_t f) = −I_μ(P_t f)` [BGL, Proposition 5.2.2], the Fisher-information decay `I_μ(P_t f) ≤ e^{−2ρt} I_μ(f)`, and convergence `Ent_μ(P_t f) → 0`.
* Under `CD(ρ, n)` with `ρ > 0` and `1 < n < ∞`, it satisfies `LS((n−1)/(ρn))` [BGL, Theorem 5.7.4], through the integrated inequalities (5.7.7)–(5.7.12) for `e^g`.

**Checks.**
- Ornstein–Uhlenbeck, `ρ = 1`: `LS(1)` holds with equality for `f = e^{ax/2}`, an equality on `𝒟(ℰ)` through the first item, agreeing with Tau Ceti's sharpness computation `TauCeti.Probability.entropy_exp_half_sq_eq_two_energy_gaussianReal`.
- The round sphere `S²` (`d = 3`, `CD(1, 2)`) gets `LS(1/2)`.

*Needs:* Layers 6–7; Tau Ceti `MeasureTheory.Measure.entropy`.

## Layer 9: models

For each model, specify a concrete extended algebra `A`, prove the extended-algebra properties and ESA required in Layer 4, and compute its curvature-dimension bound. Merely asserting that a model is a full triple is not a target. Then instantiate Layer 6 on it, and Layers 7–8 on the models with a probability measure.

- **Circle.** `AddCircle (2π)` with normalized Haar measure, `A₀ = A = C^∞(AddCircle (2π))`, `Γ(f) = f'²`, `L = d²/dx²`. A compact triple with `CD(0, 1)`, and `P_t` diagonal on the Fourier basis.
- **Brownian motion on `ℝᵈ`, `d ≥ 1`.** Lebesgue measure, `A₀ = C_c^∞(ℝᵈ)` and `A = C^∞(ℝᵈ)`, `Γ(f) = ‖∇f‖²`, `L = Δ`. It is complete, connected and weakly hypo-elliptic, hence ESA and ergodic by Layer 5, and conservative by Layer 6 (with `CD(0, ∞)`): a full triple with infinite measure, with `CD(ρ, n) ⇔ ρ ≤ 0 ∧ n ≥ d`. `P_t` is convolution with the Gaussian kernel.
- **Ornstein–Uhlenbeck on `ℝᵈ`.** Standard Gaussian measure, `A₀ = C_c^∞(ℝᵈ)` and `A = C^∞(ℝᵈ)`, `L = Δ − x·∇`, `CD(1, ∞)`, with Hermite eigenfunctions (`Polynomial.hermite`) and the Mehler formula `P_t f(x) = ∫ f(e^{−t}x + √(1 − e^{−2t}) y) dγ(y)`.
- **Round spheres `S^{d−1} ⊂ ℝᵈ`, `d ≥ 2`.** The normalized surface measure (Mathlib `Measure.toSphere` of Lebesgue measure, normalized), `A₀ = A = C^∞(S^{d−1})` (equivalently, restrictions of smooth functions on `ℝᵈ`), and the Laplace–Beltrami operator, defined extrinsically by `Lf = Δ(f ∘ (x ↦ x/‖x‖))` on the sphere, with `f ∘ (x ↦ x/‖x‖)` the 0-homogeneous extension of `f`, so that this layer needs no Riemannian geometry; `Γ` and `Γ₂` are computed directly from this formula. `Γ(f) = ‖∇f‖² − (x·∇f)²` on the sphere, for any smooth extension `f` to `ℝᵈ`. A compact triple with `CD(d − 2, d − 1)`. The spherical harmonics of degree `k` are eigenfunctions with eigenvalue `−k(k + d − 2)`. For `d ≥ 3` this gives the Lichnerowicz gap `d − 1` and `LS(1/(d − 1))`. ESA: restrictions of polynomials of degree at most `m` form finite-dimensional `L`-invariant subspaces whose union is dense in `L²(μ)`, so `A₀` contains a dense set of eigenvectors of `L`, and a symmetric operator with such a set in its domain is essentially self-adjoint. F8: for `u ∈ 𝒟(L)` with `Lu = w`, the 0-homogeneous extension `ũ` satisfies `Δũ = ‖x‖⁻² w̃` weakly on the annulus `{1/2 < ‖x‖ < 2}`, so interior regularity (PDE §5.1) and the `𝒟(Lᵏ)` iteration of the Gibbs item give `P_t f ∈ C^∞(S^{d−1})`.
- **Gibbs measures on `ℝᵈ`.** For `V : ℝᵈ → ℝ` smooth with `∫ e^{−V} dx < ∞`, the probability measure `μ_V = e^{−V} dx / Z`, `A₀ = C_c^∞(ℝᵈ)`, the extended algebra `A = C^∞(ℝᵈ)`, and `L = Δ − ∇V·∇`.
  * `A = C^∞(ℝᵈ)` satisfies F1–F9, and the triple is complete, connected and weakly hypo-elliptic; by Layer 5 it is therefore ESA and ergodic, it is conservative because `μ_V` is finite (Layer 3), hence it is a full triple. Weak hypo-ellipticity: `u ∈ L²(μ_V)` with `L*u = λu` solves `Δu − ∇V·∇u = λu` in the sense of distributions; prove that such `u` is in `H¹_loc`, then interior regularity (PDE §5.1) with the right side `λu`, bootstrapped, makes `u` smooth. F8: for `f ∈ A₀` and `t > 0`, `P_t f ∈ 𝒟(Lᵏ)` for every `k`, since `P_t = (P_{t/k})ᵏ`, `P_s` maps `L²(μ)` into `𝒟(L)` (Layer 2) and commutes with `L` on `𝒟(L)`, and interior regularity applied to `L(L^{k−1} P_t f) = Lᵏ P_t f`, iterated in `k`, gives `P_t f ∈ C^∞(ℝᵈ)`.
  * `Γ₂(f) = ‖∇²f‖²_HS + ⟪∇²V ∇f, ∇f⟫`, so `CD(ρ, ∞)` holds if and only if `∇²V ≥ ρ`.
  * Bounded Lipschitz functions are in `𝒟(ℰ)` with `Γ(f) = ‖∇f‖²` a.e., with `∇f` given a.e. by Rademacher's theorem: approximate `f` by mollified cutoffs `(χ_R f) * η_δ ∈ C_c^∞(ℝᵈ)`, which converge in `𝒟(ℰ)` because `f` is bounded, `‖∇χ_R‖ ≤ 1/R`, and `μ_V` has a locally bounded density. This is the standing assumption of [BGL, §8.5] in the metric setting, proved here for Gibbs measures.
  * Smooth `f` with `f, ‖∇f‖ ∈ L²(μ_V)`, bounded or not, are in `𝒟(ℰ)` with `Γ(f) = ‖∇f‖²`: the cutoffs `χ_R f ∈ C_c^∞(ℝᵈ)` converge to `f` in `𝒟(ℰ)`, since `‖f ∇χ_R‖₂ ≤ ‖f‖₂/R`. Tau Ceti's `PoincareInequality` quantifies over such `f`, and `LogSobolevInequality` over smooth `f` with `‖∇f‖ ∈ L²(μ_V)` and `f², f² log f²` integrable, a class that the same cutoffs and the lower semicontinuity of `Ent_μ` handle; `A₀ = C_c^∞(ℝᵈ)` is in both classes (Tau Ceti's `MeasureTheory.Measure.poincareInequality_iff_forall_hasCompactSupport` is the Poincaré case), so the triple's `P(C)` and `LS(C)` (Layers 7–8, extended to `𝒟(ℰ)`) are equivalent to Tau Ceti's `μ_V.PoincareInequality C` and `μ_V.LogSobolevInequality C`, Ornstein–Uhlenbeck included.
  * For `ρ > 0`, `μ_V` satisfies `P(1/ρ)` and `LS(1/ρ)`, and hence Tau Ceti's `PoincareInequality (1/ρ)` and `LogSobolevInequality (1/ρ)`.

**Checks.**
- `V(x) = ‖x‖²/2` recovers Ornstein–Uhlenbeck.
- `V(x) = x⁴/4 + x²/2` on `ℝ`: `V'' = 3x² + 1 ≥ 1` gives `CD(1, ∞)`, and `P(1)` holds although `μ_V` is not Gaussian.
- `V(x) = (x² − 1)²` on `ℝ`: `V'' ≥ −4`, so `CD(−4, ∞)`. The gradient bound holds with growth `e^{4t}`, and the triple is still full.
- The two-point chain of §1.2 and the interval of Layer 3 are the non-examples.

*Needs:* Layers 5–8; Mathlib `AddCircle.haarAddCircle`, `ProbabilityTheory.stdGaussian`, `Polynomial.hermite`, `MeasureTheory.Measure.toSphere`, `LipschitzWith.ae_differentiableAt`; Tau Ceti `MeasureTheory.Measure.PoincareInequality`, `MeasureTheory.Measure.LogSobolevInequality`; PDE §5.1 (E20).

## Layer 10: Bobkov and Gaussian isoperimetric inequalities under curvature

Let `I = φ ∘ Φ⁻¹` be the Gaussian isoperimetric profile, where `Φ` and `φ` are the standard normal distribution function and density. It is owned by GaussianIsoperimetryAndClusters §1.1, whose `Suggested.lean` defines `gaussianIsoperimetricProfile` (zero outside `(0, 1)`) and which `Suggested.lean` here imports; Tau Ceti implements it as `TauCeti.Probability.gaussianIsoperimetricProfile`. It satisfies `I(Φ(x)) = φ(x)`, `I(0) = I(1) = 0`, continuity, strict concavity, symmetry about `1/2` and `I I'' = −1` on `(0, 1)` [BGL, (8.5.7)]. This layer consumes it. For `ρ ∈ ℝ`, `α ≥ 0` and `t ≥ 0`, set `c_α(t) = (1 − e^{−2ρt})/ρ + α e^{−2ρt}` when `ρ ≠ 0` and `c_α(t) = 2t + α` when `ρ = 0`. Prove the following.
* **Local Bobkov inequalities** [BGL, Theorem 8.5.3]. On a full triple, the following are equivalent: `CD(ρ, ∞)`; for some `α ≥ 0`, for every `f ∈ A₀` with values in `[0, 1]` and every `t ≥ 0`, `√(I²(P_t f) + α Γ(P_t f)) ≤ P_t(√(I²(f) + c_α(t) Γ(f)))`; the same for every `α ≥ 0`. The direct implication goes through the interpolation of [BGL, Lemma 8.5.6], as in Layer 6, and the converse through a Taylor expansion at `t = 0`. Since `(I²)'' = 2(Φ⁻¹)² − 2` is unbounded at `0` and `1` and `√(I² + c v)` is not smooth at `v = 0`, run the interpolation on `f_δ = δ + (1 − 2δ) f ∈ A`, using `P_t f_δ = δ + (1 − 2δ) P_t f` (conservativeness, which is where the full-triple hypothesis enters), with `Γ` replaced by `Γ + ε`, and let `δ, ε → 0`.
* **Bobkov inequality** [BGL, Corollary 8.5.4]. A full triple with probability measure and `CD(ρ, ∞)`, `ρ > 0`, satisfies `√ρ I(∫ f dμ) ≤ ∫ √(ρ I²(f) + Γ(f)) dμ` for every `f ∈ 𝒟(ℰ)` with values in `[0, 1]`, with `Γ` on `𝒟(ℰ)` from Layer 5. For `f ∈ A₀` it follows from the local inequality with `α = 1/ρ`, for which `c_α(t) = 1/ρ`, and `P_t f → ∫ f dμ` by ergodicity. Prove the extension to `𝒟(ℰ)`: approximate `f` in `𝒟(ℰ)` by `f_k ∈ A₀`, and let `ψ_j` be smooth with `ψ_j(0) = 0`, values in `[0, 1]`, `|ψ_j'| ≤ 1`, converging pointwise to the clamp `v ↦ min(max(v, 0), 1)`. Then `ψ_j ∘ f_k ∈ A₀` has values in `[0, 1]` and `Γ(ψ_j ∘ f_k) ≤ Γ(f_k)`, so the inequality for `ψ_j ∘ f_k` gives `√ρ I(∫ ψ_j ∘ f_k dμ) ≤ ∫ √(ρ I²(ψ_j ∘ f_k) + Γ(f_k)) dμ`. Let `j → ∞`, then `k → ∞`, using `√Γ(f_k) → √Γ(f)` in `L²(μ)` and the continuity of `I`; only an upper bound of the right side is needed.
* **Bobkov implies log-Sobolev** [BGL, §8.5.2]. For bounded `g ∈ A₀` with `∫ g² dμ = 1`, apply the Bobkov inequality to `ε g²` and let `ε → 0`. The terms of order `ε √(2 log(1/ε))` cancel between the two sides, so the leading asymptotic `I(v) ∼ v √(2 log(1/v))` does not suffice. The argument uses the next-order asymptotic `I(v) + v Φ⁻¹(v) ∼ v / √(2 log(1/v))` as `v → 0`, which follows from the Mills-ratio expansion `1 − Φ(x) = φ(x) x⁻¹ (1 − x⁻² + O(x⁻⁴))`, uniformly over `v = ε g²(x)` with `g` bounded. With `√(a² + b²) ≤ a + b²/(2a)` and `Γ(g²) = 4 g² Γ(g)`, the terms of order `ε / √(2 log(1/ε))` give `ρ Ent_μ(g²) ≤ 2 ℰ(g)`, that is `LS(1/ρ)`. This recovers Proposition 5.7.1 of Layer 8.
* **Gaussian isoperimetry for Gibbs measures** [BGL, (8.5.10)–(8.5.11), Corollary 8.5.5]. Let `V` be smooth on `ℝᵈ` with `∇²V ≥ ρ > 0`, and `μ_V` the Gibbs measure of Layer 9. Bounded Lipschitz functions are in `𝒟(ℰ)` with `Γ(f) = ‖∇f‖²` a.e. (Layer 9), so the Bobkov inequality holds for them with `‖∇f‖²` in place of `Γ(f)`, as in [BGL, §8.5]. For `V = ‖x‖²/2` the statements below are corollaries of the general ones; GaussianIsoperimetryAndClusters §§8.1–8.3 owns the Gaussian case for arbitrary sets, the enlargement form being its Borell–Sudakov–Tsirelson inequality (§8.1). For every closed `A ⊆ ℝᵈ`, with `A_r = Metric.thickening r A` and the Minkowski content `μ_V⁺(A) = liminf_{r ↓ 0} (μ_V(A_r) − μ_V(A))/r` (`Suggested.lean` encodes the first item as "for every `c < √ρ I(μ_V(A))`, eventually `c r ≤ μ_V(A_r) − μ_V(A)`"; prove its equivalence with the `ℝ≥0∞`-valued `liminf` encoding of GaussianIsoperimetryAndClusters `gaussian_minkowskiContent_ge`):
  * `√ρ I(μ_V(A)) ≤ μ_V⁺(A)`, from the Bobkov inequality applied to `(1 − d(·, A)/r)₊`, `r ↓ 0`, for nonempty `A` (Mathlib's `Metric.infDist x ∅ = 0` makes this function `1` when `A = ∅`; that case is trivial, since `I(0) = 0`);
  * For every `a ∈ ℝ` with `Φ(a) ≤ μ_V(A)` and every `r > 0`, `Φ(a + √ρ r) ≤ μ_V(A_r)`. If `0 < μ_V(A) < 1` and `μ_V(A_r) < 1`, this is equivalent to `Φ⁻¹(μ_V(A_r)) ≥ Φ⁻¹(μ_V(A)) + √ρ r`. The CDF formulation avoids assigning real values to `Φ⁻¹` at 0 and 1; handle the null and full-measure endpoint cases explicitly when deriving the inverse-CDF form. Route: apply the previous item to the closed sets `Ā_s`, the closures of `A_s` for `s > 0` (note `A_0 = Metric.thickening 0 A = ∅`, so the argument starts at `s ↓ 0`, where `Ā_s` decreases to `A` because `A` is closed, hence `μ_V(Ā_s) → μ_V(A)`); since `(Ā_s)_h ⊆ A_{s+h} ⊆ Ā_{s+h}`, the lower right Dini derivative of `s ↦ μ_V(Ā_s)` is at least `√ρ I(μ_V(Ā_s))`, so that of `s ↦ Φ⁻¹(μ_V(Ā_s))` is at least `√ρ` while `0 < μ_V(Ā_s) < 1`. A nondecreasing function whose lower right Dini derivative is at least `√ρ` everywhere grows at least like `√ρ s`. Conclude with `Ā_{r'} ⊆ A_r` for `r' < r`, `r' ↑ r`, and the continuity of `Φ`.

**Checks.**
- `I(v) = φ(Φ⁻¹(v))` gives `I' = −Φ⁻¹` and `I'' = −1/I` on `(0, 1)`, as in Tau Ceti's `hasDerivAt_deriv_gaussianIsoperimetricProfile`.
- For `α = 1/ρ`, `c_α(t) = (1 − e^{−2ρt})/ρ + e^{−2ρt}/ρ = 1/ρ` for every `t`.
- Standard Gaussian, `V(x) = ‖x‖²/2`, `ρ = 1`: for a unit vector `u`, the half-space `H = {x · u ≤ r}` has `μ(H) = Φ(r)` and `μ⁺(H) = φ(r) = I(Φ(r))`, so the isoperimetric inequality is an equality. The two isoperimetric statements agree with the Minkowski-content and enlargement forms of GaussianIsoperimetryAndClusters, Layer 8.
- `V(x) = x⁴/4 + x²/2` on `ℝ`, `ρ = 1`: for `A = (−∞, a]`, `μ_V⁺(A)` is the density `e^{−V(a)}/Z`, and the inequality says `Φ⁻¹(μ_V((−∞, a]))` grows at least as fast as `a`.

*Needs:* Layers 3, 5, 6, 8, 9; GaussianIsoperimetryAndClusters §1.1 (the profile, implemented in Tau Ceti); Mathlib `Metric.thickening`.

## Layer 11: improved Poincaré inequalities: Brascamp–Lieb, Helffer–Sjöstrand and Hörmander's L² method

Throughout, `V : ℝᵈ → ℝ` is smooth and has positive-definite Hessian at every point, hence is strictly convex; assume `e^{−V}` is integrable. Let `μ_V` be the Gibbs probability measure of Layer 9, with generator `L = Δ − ∇V·∇`. No uniform lower bound `∇²V ≥ ρ > 0` is assumed, except where stated.
* **Brascamp–Lieb inequality** [BGL, Theorem 4.9.1; BrascampLieb]. For every smooth `f` with `f, ‖∇f‖ ∈ L²(μ_V)`, in particular every `f ∈ C_c^∞(ℝᵈ)`, `Var_{μ_V}(f) ≤ ∫ ⟨(∇²V)⁻¹ ∇f, ∇f⟩ dμ_V`. Consequently `Var_{μ_V}(f) ≤ ∫ ‖∇f‖²/λ_min(x) dμ_V`, with `λ_min(x)` the least eigenvalue of `∇²V(x)` [BGL, (4.9.4)]. When `∇²V ≥ ρ > 0` this recovers, and improves pointwise, the Bakry–Émery inequality `P(1/ρ)` of Layer 7.
* **Hörmander's L² method** [Hörmander]. This is the proof of the Brascamp–Lieb inequality. First assume `∇²V ≥ ε > 0`. By Layer 7, `μ_V` satisfies `P(1/ε)`, so for `f ∈ C_c^∞(ℝᵈ)` there is `h ∈ 𝒟(L)` with `−Lh = f − ∫ f dμ_V`. By interior regularity (PDE §5.1), `h` is smooth, and the integrated Bochner identity of Layers 5 and 9, `‖Lh‖₂² = ∫ (‖∇²h‖²_HS + ⟨∇²V ∇h, ∇h⟩) dμ_V`, gives `∫ ⟨∇²V ∇h, ∇h⟩ dμ_V ≤ Var_{μ_V}(f)`. Then `Var_{μ_V}(f) = ∫ ⟨∇f, ∇h⟩ dμ_V`, and the Cauchy–Schwarz inequality for the form `⟨(∇²V)⁻¹·, ·⟩` concludes. For any potential satisfying the standing assumptions but without a uniform positive lower bound, apply this to `V_ε = V + ε‖x‖²/2` and let `ε ↓ 0`, using `(∇²V + ε)⁻¹ ≤ (∇²V)⁻¹` and `μ_{V_ε} → μ_V`. For smooth `f` with `f, ‖∇f‖ ∈ L²(μ_V)`: such `f` is in `𝒟(ℰ)` by the cutoffs `χ_R f`, the same argument applies with `Var_{μ_V}(f) = ℰ(f, h)`, and the limit `ε ↓ 0` uses `μ_{V_ε} ≤ (Z_V / Z_{V_ε}) μ_V` with `Z_W = ∫ e^{−W} dx` and `Z_{V_ε} ↑ Z_V`: dominated convergence for `Var_{μ_{V_ε}}(f) → Var_{μ_V}(f)`, and on the right side only the bound by `(Z_V / Z_{V_ε}) ∫ ⟨(∇²V)⁻¹ ∇f, ∇f⟩ dμ_V`, since that integrand need not be integrable.
* **Helffer–Sjöstrand representation** [HelfferSjostrand; BGL, Lemma 4.9.2, (4.9.2)]. On `H = L²(μ_V; ℝᵈ)`, let `L⃗` act componentwise by `L`, and let `M` be multiplication by `∇²V`.
  * Prove the commutation `∇Lf = (L⃗ − M) ∇f` for smooth `f`.
  * The operator `M − L⃗` on `C_c^∞(ℝᵈ; ℝᵈ)` is symmetric and nonnegative. Let `𝐀` be its Friedrichs extension (UO-D06).
  * Prove the operator monotonicity of Lemma 4.9.2: if `ε ≤ A₁ ≤ A₂` as forms on a common core, with `ε > 0`, then `⟨A₂⁻¹u, u⟩ ≤ ⟨A₁⁻¹u, u⟩`.
  * When `∇²V ≥ ρ > 0`, `𝐀 ≥ ρ`. For smooth `f` with `f, ‖∇f‖ ∈ L²(μ_V)`, let `h` solve `−Lh = f − ∫ f dμ_V` as in the Hörmander route. Prove that `∇h ∈ 𝒟(𝐀)` with `𝐀 ∇h = ∇f`. First, `∇h` is in the form domain of `𝐀`: its form energy `∫ (‖∇²h‖²_HS + ⟨∇²V ∇h, ∇h⟩) dμ_V` is finite by the integrated Bochner identity, and the cutoffs `χ_R ∇h` approximate it in the form norm. Second, for every `v ∈ C_c^∞(ℝᵈ; ℝᵈ)` the form of `𝐀` evaluated at `(∇h, v)` equals `⟨∇f, v⟩_H`, by integration by parts and the commutation `∇Lh = (L⃗ − M) ∇h`; since `C_c^∞(ℝᵈ; ℝᵈ)` is a form core, this characterizes `𝐀 ∇h`. Deduce the Helffer–Sjöstrand representation `Cov_{μ_V}(f, g) = ⟨𝐀⁻¹ ∇f, ∇g⟩_H` for smooth `f, g` with `f, g, ‖∇f‖, ‖∇g‖ ∈ L²(μ_V)`.
  * With Lemma 4.9.2 applied to `A₁ = M ≥ ρ` and `A₂ = 𝐀`, this gives a second proof of the Brascamp–Lieb inequality when `∇²V ≥ ρ > 0`. Without a uniform positive lower bound, conclude by the approximation `V + ε‖x‖²/2` of the Hörmander route.
* **Prékopa's theorem from the Brascamp–Lieb inequality** [CorderoErausquin2005]. Let `W : ℝᵐ × ℝᵈ → ℝ` be smooth and jointly convex, with `∇²_x W(t, x)` positive definite for every `(t, x)`, and assume that for each compact `K ⊆ ℝᵐ` the function `x ↦ sup_{t ∈ K} e^{−W(t,x)}(1 + Σᵢ |∂_{tᵢ}W(t,x)|² + Σᵢ ‖∇_x ∂_{tᵢ}W(t,x)‖² + Σᵢⱼ |∂²_{tᵢtⱼ}W(t,x)|)` is integrable. Then `t ↦ −log ∫ e^{−W(t, x)} dx` is convex. The integrability hypothesis is part of the target statement; it justifies differentiation under the integral to second order. The second derivative in a direction `s ∈ ℝᵐ` is `E[∂²_s W] − Var(∂_s W)` under the probability measure proportional to `e^{−W(t, ·)}`. The function `∂_s W(t, ·)` is smooth but not compactly supported; by the integrability hypothesis it and its gradient are in `L²`, so the Brascamp–Lieb inequality, in the form above for smooth `f` with `f, ‖∇f‖ ∈ L²`, bounds `Var(∂_s W)` by `E[⟨(∇²_x W)⁻¹ ∇_x ∂_s W, ∇_x ∂_s W⟩]`. The joint convexity of `W`, through the Schur complement of `∇²_{(t,x)} W`, makes the difference nonnegative.

**Checks.**
- Gaussian `N(0, Σ)` with `Σ` positive definite, `V(x) = ⟨Σ⁻¹x, x⟩/2`, `∇²V = Σ⁻¹`: the Brascamp–Lieb inequality reads `Var(f) ≤ ∫ ⟨Σ ∇f, ∇f⟩ dμ`, with equality for every linear `f = ⟨a, x⟩`. The Bakry–Émery bound gives only `Var(f) ≤ λ_max(Σ) ∫ ‖∇f‖² dμ`, with equality only when `a` is a top eigenvector of `Σ`.
- Ornstein–Uhlenbeck, `Σ = I`: the constant vector field `u = e₁` satisfies `M u = u` and `L⃗ u = 0`, so `𝐀⁻¹ ∇x₁ = e₁` and `Cov(x₁, x₁) = 1`.
- `V(x) = x⁴/4 + x²/2` on `ℝ`: `Var(f) ≤ ∫ f'²/(3x² + 1) dμ_V`, strictly below the bound of `P(1)` when `f'` does not vanish a.e. on `ℝ ∖ {0}`.
- `V(x) = √(1 + x²)` on `ℝ`: `V'' = (1 + x²)^{−3/2} > 0` has infimum `0`, so `CD(ρ, ∞)` fails for every `ρ > 0`. The Brascamp–Lieb inequality still gives `Var(f) ≤ ∫ (1 + x²)^{3/2} f'² dμ_V`.
- Prékopa, `m = d = 1`, `W(t, x) = x²/2 + b t x + a t²/2` with `a ≥ b²`, so that `W` is jointly convex: `−log ∫ e^{−W(t, x)} dx = (a − b²) t²/2 − log √(2π)`, convex, and affine exactly in the Schur-complement equality case `a = b²`.

*Needs:* Layers 5, 7, 9; UnboundedOperators UO-D06; PDE §5.1 (E20), for the smoothness of `h`.

## Downstream consumers

No existing roadmap consumes this one. The future roadmaps of the table below build on its full triples, `Γ₂` and `CD(ρ, n)`. RandomMatrices §2.2 and GaussianIsoperimetryAndClusters Layer 8 are recovered, not consumed (see the Summary). The Gaussian logarithmic Sobolev inequality, a target of RandomMatrices §2.2 not yet implemented in Tau Ceti, follows from the Ornstein–Uhlenbeck case of Layer 9 (`LS(1)`) and its equivalence with `LogSobolevInequality`; RandomMatrices keeps the ownership of that target.

## Scope and ownership

This roadmap owns:
- the diffusion, standard, full and compact triple structures and their Γ-calculus (Layers 1, 3, 4);
- the Dirichlet form, generator and Markov semigroup of a diffusion triple, and its positivity and sub-Markov property (Layer 2);
- ergodicity, essential self-adjointness, conservativeness and their criteria (Layers 3, 5);
- the extension of the Γ-calculus to the form and generator domains (Layer 5);
- gradient bounds and mass conservation under curvature (Layer 6);
- the Poincaré and logarithmic Sobolev inequalities of triples under curvature, and their equivalence with Tau Ceti's Euclidean inequalities (Layers 7–9);
- the five models of Layer 9;
- the local and integrated Bobkov inequalities of triples under `CD(ρ, ∞)`, and the Gaussian isoperimetric comparison for Gibbs measures (Layer 10);
- the Brascamp–Lieb inequality for strictly convex Gibbs measures, the Helffer–Sjöstrand representation for uniformly convex ones (`∇²V ≥ ρ > 0`), and Prékopa's theorem (Layer 11).

It leaves to named owners:
- strongly continuous semigroups, generators and Hille–Yosida to OneParameterSemigroups, implemented in Tau Ceti, and form-generated semigroups to Tau Ceti's library (`IsCoercive.formSemigroup`);
- closed forms and the Friedrichs extension to OperatorTheory/UnboundedOperators (UO-D06);
- Euclidean Poincaré and logarithmic Sobolev inequalities, tensorization and Herbst's argument to RandomMatrices §2.2, implemented in Tau Ceti except the Gaussian logarithmic Sobolev inequality;
- Wasserstein distances, curvature-dimension conditions on metric measure spaces and Fokker–Planck flows to OptimalTransport;
- semigroups of stochastic differential equations to StochasticCalculus;
- elliptic regularity to PDE;
- the co-area formula to GeometricMeasureTheory, and Euclidean perimeter and isoperimetry to Isoperimetry;
- the Gaussian isoperimetric profile (§1.1, implemented in Tau Ceti), Gaussian perimeter, Gaussian isoperimetry for arbitrary sets with its Minkowski-content and functional forms (Layer 8), the uniqueness of Gaussian isoperimetric sets and Gaussian clusters to GaussianIsoperimetryAndClusters;
- Riemannian metrics, curvature, the Laplace–Beltrami operator and the Bochner formula to RiemannianGeometry.

It does not contain:
- the sections of [BGL] assigned to a row of the table below, outside the column "In this roadmap";
- the converse of Proposition 3.3.17 for `n = ∞` on triples that are not complete.

### Roadmap for a roadmap: the rest of Bakry–Gentil–Ledoux

*This subsection describes future roadmaps. Contributors should not work from it.* Every section of [BGL] is in this roadmap, in one row of the table, or owned by an existing roadmap; where a section is split, the column "In this roadmap" names the results kept here and the list after the table names the rest. Chapter 3 outside §3.2, that is §§3.1, 3.3 and 3.4, is in this roadmap, except the intermediate value theorem and slicing (Theorem 3.1.16, Proposition 3.1.17) and the intrinsic distance, Lipschitz functions and diameter of §3.3.7, which go to the row "Generalized functional and isoperimetric inequalities", and the converse of Proposition 3.3.17 for `n = ∞` on triples that are not complete, which no roadmap contains (Scope). Each future roadmap builds on the full triples, `Γ₂` and `CD(ρ, n)` of this one.

| Future roadmap | [BGL] sections | In this roadmap | Owned by an existing roadmap |
|---|---|---|---|
| Diffusion operators on manifolds | §3.2; Appendix C | the round spheres | Riemannian metrics, curvature, the Laplace–Beltrami operator and the Bochner formula: RiemannianGeometry |
| Poincaré and logarithmic Sobolev inequalities | Chapters 4–5 | §4.2 except Lemma 4.2.3 and Proposition 4.2.7; §4.8; Definition 5.1.1 and the first assertion of Proposition 5.1.3; Proposition 5.2.2 (de Bruijn); §5.7 except Proposition 5.7.3, the case `n = 1` and Proposition 5.7.5; Theorem 4.9.1, Lemma 4.9.2, (4.9.2) and (4.9.4) (Layer 11) | §4.3 tensorization, the Gaussian case of §4.1, Herbst's argument of §5.4: RandomMatrices §2.2 |
| Sobolev inequalities and heat kernels | Chapter 6; §§7.1–7.4 | — | interpolation: PDE |
| Generalized functional and isoperimetric inequalities | Theorem 3.1.16, Proposition 3.1.17, §3.3.7; §§7.5–7.7; Chapter 8 | §8.5.2 except the stability of the Bobkov inequality under products: Theorem 8.5.3, Corollary 8.5.4, (8.5.7)–(8.5.9) and the passage to `LS` for full triples; Corollary 8.5.5 and (8.5.10)–(8.5.11) for Gibbs measures on `ℝᵈ` (Layer 10) | co-area: GeometricMeasureTheory; Euclidean isoperimetry: Isoperimetry; Gaussian perimeter and the uniqueness of half-spaces: GaussianIsoperimetryAndClusters |
| Transportation inequalities | Chapter 9 | — | couplings and duality of §9.1, the Wasserstein contraction of §9.7 and the curvature of metric measure spaces of §9.8: OptimalTransport |
| Markov processes and model semigroups | Chapters 1–2; Appendix B | the case of symmetric diffusion triples in §§1.4.1–1.4.2, 1.6–1.8 and 1.16; §2.1; §§2.2.1 and 2.2.4; the circle in §2.5; the Ornstein–Uhlenbeck semigroup in §2.7 | §1.10 and Appendix B: StochasticCalculus |

Appendix A belongs to OneParameterSemigroups (§A.1), to OperatorTheory/UnboundedOperators (§§A.2–A.6, with OperatorTheory/SelfAdjointSpectralTheory SA-E01 for the spectral theorem of §A.4) and, for the Hilbert–Schmidt operators of §A.6, to OperatorTheory/OperatorIdeals. The sections of each row, in order:
* **Diffusion operators on manifolds:** second order operators on a manifold, their Γ and Γ₂, and the Bochner–Lichnerowicz formula `Γ₂ = ‖∇²f‖² + Ric(∇f, ∇f)` for the Laplace–Beltrami operator plus a drift (§3.2); smooth manifolds, Riemannian metrics and distance, and curvature-dimension conditions on weighted manifolds (§§C.1–C.6).
* **Poincaré and logarithmic Sobolev inequalities:** the Ornstein–Uhlenbeck example, tensorization, the exponential measure, Poincaré inequalities on the real line, Lyapunov functions, local Poincaré inequalities, the Riemannian Brascamp–Lieb inequality and the probabilistic representations, and further spectral inequalities (§§4.1, 4.3–4.7, 4.9 beyond Theorem 4.9.1, Lemma 4.9.2, (4.9.2) and (4.9.4), 4.10); the rest of §4.2 (Lemma 4.2.3, the bounded perturbation Proposition 4.2.7); the rest of §5.1 (defective inequalities `LS(C, D)` and their tightening with Rothaus' lemma, the second assertion of Proposition 5.1.3 and Lemma 5.1.4, the bounded perturbation Proposition 5.1.6, Lemma 5.1.7 and Proposition 5.1.8); the rest of §5.7 (Proposition 5.7.3, the case `n = 1` on the circle, the Sturm–Liouville example of Proposition 5.7.5); entropy decay and hypercontractivity beyond de Bruijn's identity, integrability of eigenvectors, exponential integrability, local logarithmic Sobolev inequalities and infinite-dimensional Harnack inequalities (§§5.2–5.6).
* **Sobolev inequalities and heat kernels:** Sobolev inequalities on the model spaces and in general, ultracontractivity, heat-kernel bounds and compact embeddings, tensorization, Lipschitz functions, local Sobolev inequalities, Sobolev inequalities under `CD(ρ, n)`, conformal invariance, Gagliardo–Nirenberg inequalities and fast diffusion equations (§§6.1–6.11); entropy–energy inequalities, off-diagonal heat-kernel bounds and Nash inequalities (§§7.1–7.4).
* **Generalized functional and isoperimetric inequalities:** the intermediate value theorem and slicing for ergodic triples (Theorem 3.1.16, Proposition 3.1.17), and the intrinsic distance (3.3.9), Lipschitz functions (Definition 3.3.24) and diameter (3.3.10) of §3.3.7; weak Poincaré inequalities, further families of functional inequalities and the model measures `μ_α` (§§7.5–7.7); capacity and co-area formulas, capacity criteria for Sobolev, Poincaré and logarithmic Sobolev inequalities, the co-area formula II and Proposition 8.5.2, the stability of the Bobkov inequality under products (§8.5.2), the Lévy–Gromov comparison in the metric setting of a Markov triple, Harnack inequalities, and the passage from concentration to isoperimetry (§§8.1–8.7).
* **Transportation inequalities:** optimal transport, transportation cost inequalities and transportation proofs, Hamilton–Jacobi equations and their hypercontractivity, transportation cost and logarithmic Sobolev inequalities, Wasserstein contraction of the heat flow, and curvature of metric measure spaces (§§9.1–9.8).
* **Markov processes and model semigroups:** Markov processes, kernels, Chapman–Kolmogorov and Fokker–Planck equations, the martingale problem (§1.4.3), symmetric semigroups, Dirichlet forms, ergodicity, Markov chains, stochastic differential equations, ellipticity and hypo-ellipticity, domains, and the curvature-dimension condition for semigroups (§§1.1–1.16); the stereographic projection and the spherical heat kernel (§§2.2.2–2.2.3), the hyperbolic heat semigroup, the half-line and Bessel semigroups, the bounded interval, Sturm–Liouville semigroups, and the Hermite, Laguerre and Jacobi semigroups of orthogonal polynomials (§§2.3–2.7, beyond the circle and Ornstein–Uhlenbeck); stochastic calculus (§§B.1–B.4).

## Exact supplier contracts

### From Mathlib

- `MeasureTheory.Measure`, `SigmaFinite`, `IsProbabilityMeasure`, `MeasureTheory.MemLp`, `MeasureTheory.Lp`, `MemLp.toLp`, `Filter.EventuallyEq` (`=ᵐ[μ]`).
- `NonUnitalSubalgebra`, `Subalgebra`.
- `ContDiff`, `fderiv`, `LipschitzWith.ae_differentiableAt` (`Analysis/Calculus/Rademacher.lean`), `Metric.thickening`, `Metric.infDist`, `EuclideanSpace`.
- `Measure.withDensity`, `Measure.real`; `ProbabilityTheory.cdf` (`Probability/CDF.lean`), `ProbabilityTheory.gaussianReal`, `ProbabilityTheory.gaussianPDFReal`.
- `LinearPMap` (`→ₗ.[ℝ]`), `IsCoercive` (`Analysis/Normed/Operator/NormedSpace.lean`).
- `ProbabilityTheory.variance` (`Probability/Moments/Variance.lean`).
- `AddCircle.haarAddCircle` (`Analysis/Fourier/AddCircle.lean`); `ProbabilityTheory.stdGaussian` (`Probability/Distributions/Gaussian/Multivariate.lean`); `Polynomial.hermite` (`RingTheory/Polynomial/Hermite/Basic.lean`); `MeasureTheory.Measure.toSphere` (`MeasureTheory/Constructions/HaarToSphere.lean`).

### From Tau Ceti

File paths under `TauCeti/`. The files `Analysis/Semigroups/Generation/Form.lean`, `MeasureTheory/Integral/Entropy.lean`, `Probability/Distributions/Gaussian/IsoperimetricProfile.lean` and `Probability/Concentration/Poincare/{LogSobolev, CompactSupport, Gaussian/Basic, Gaussian/LogSobolevSharpness}.lean` are on Tau Ceti `main` and more recent than the Tau Ceti commit pinned by this repository when this roadmap was written (`2fd255d`).

- `TauCeti.Semigroups.StronglyContinuousSemigroup`, `TauCeti.Semigroups.ContractionSemigroup` (`Analysis/Semigroups/Basic.lean`); `StronglyContinuousSemigroup.generator` and `isClosed_generator` (`Analysis/Semigroups/Generator/`); `StronglyContinuousSemigroup.expShift` (`Analysis/Semigroups/ExponentialShift.lean`), all in the namespace `TauCeti.Semigroups`.
- `IsCoercive.formSemigroup`, `IsCoercive.formGenerator`, `IsCoercive.formSemigroup_generator` (`Analysis/Semigroups/Generation/Form.lean`).
- `MeasureTheory.Measure.entropy` (`MeasureTheory/Integral/Entropy.lean`).
- `TauCeti.Probability.gaussianIsoperimetricProfile`, `gaussianIsoperimetricProfile_cdf`, `gaussianIsoperimetricProfile_zero`, `gaussianIsoperimetricProfile_one`, `gaussianIsoperimetricProfile_one_sub`, `continuous_gaussianIsoperimetricProfile`, `strictConcaveOn_gaussianIsoperimetricProfile`, `hasDerivAt_deriv_gaussianIsoperimetricProfile` (`Probability/Distributions/Gaussian/IsoperimetricProfile.lean`), built on `MeasureTheory.Measure.quantile` (`Probability/Quantile.lean`).
- `MeasureTheory.Measure.PoincareInequality`, `MeasureTheory.Measure.LogSobolevInequality` (`Probability/Concentration/Poincare/LogSobolev.lean`); `MeasureTheory.Measure.poincareInequality_iff_forall_hasCompactSupport` (`Probability/Concentration/Poincare/CompactSupport.lean`); `TauCeti.Probability.poincareInequality_stdGaussian` (`Probability/Concentration/Poincare/Gaussian/Basic.lean`); `TauCeti.Probability.entropy_exp_half_sq_eq_two_energy_gaussianReal` (`Probability/Concentration/Poincare/Gaussian/LogSobolevSharpness.lean`).

### From TauCetiRoadmap.OperatorTheory

UnboundedOperators UO-D06: closed, densely defined forms bounded below, their form-domain Hilbert space, the unique self-adjoint operator they represent (`existsUnique_selfAdjoint_of_closed_form`), and the Friedrichs extension.

### From TauCetiRoadmap.GaussianIsoperimetryAndClusters

§1.1: the Gaussian isoperimetric function `gaussianIsoperimetricProfile`, `I(v) = φ(Φ⁻¹(v))` on `(0, 1)` and `0` elsewhere, with the API listed under Tau Ceti above.

### From TauCetiRoadmap.PDE

§5.1 (E20): interior regularity for elliptic equations with smooth coefficients, applied on balls, since the drift `∇V` is smooth but unbounded: a weak solution `u ∈ H¹_loc` of `(Δ − ∇V·∇) u = g` with `g ∈ Hᵐ_loc` is in `H^{m+2}_loc`, hence smooth when `g` is. It is used for weak hypo-ellipticity (with `g = λu`, bootstrapped), for F8 of the Gibbs triple (with `g = Lᵏ P_t f`), for F8 of the sphere (with `V = 0` on an annulus and `g` the 0-homogeneous extension of `Lᵏ P_t f` times `‖x‖⁻²`), and for the Poisson equation `−Lh = f − ∫ f dμ_V` of Layer 11, where `h ∈ 𝒟(ℰ) ⊆ H¹_loc`. The preliminary step from a distributional solution `u ∈ L²_loc` to `u ∈ H¹_loc`, needed for weak hypo-ellipticity, is a target of Layer 9.

## Provenance

The `MarkovDiffusionOperators` repository ([github.com/djalilchafai/MarkovDiffusionOperators](https://github.com/djalilchafai/MarkovDiffusionOperators), Apache-2.0, by the author of this roadmap) is a cited source, not the specification. It contains a Lean formalization of most targets of this roadmap. Its proofs of the converse of Proposition 3.3.17 differ from [BGL], and it does not contain the gradient bounds for `ρ < 0` or Layers 10–11. Its maps are `CORRESPONDENCE.md` (book to Lean), `MarkovDiffusionOperators/BGL/FROZEN_REVIEW_BGL.md` (each structure field against [BGL]), `MarkovDiffusionOperators/BGL/Theory/GAPS.md`, and `ERRATA.md`. The main locations, relative to `MarkovDiffusionOperators/BGL/`, are:
* Layers 1, 3, 4: `Frozen/`, `Calculus/`, `Semigroup/`;
* Layer 2: `Analysis/Hilbert/`;
* Layers 4–6: `Theory/Gamma2Integral.lean`, `Theory/Strong/`, `Theory/Extension/`, `Theory/Conservation/`, `Theory/Interp/`;
* Layers 7–8: `Theory/Poincare.lean`, `Theory/LogSobolev*.lean`;
* Layer 9: `Instances/{Circle, Lebesgue, LebesgueRd, OU, SphereN, Gibbs, GibbsRd}/`.

## References

- [BGL] D. Bakry, I. Gentil, M. Ledoux, *Analysis and Geometry of Markov Diffusion Operators*, Grundlehren der mathematischen Wissenschaften 348, Springer, 2014, [Zbl 1376.60002](https://zbmath.org/?q=an%3A1376.60002). The standard reference on the subject.
- [BrascampLieb] H. J. Brascamp, E. H. Lieb, *On extensions of the Brunn–Minkowski and Prékopa–Leindler theorems, including inequalities for log concave functions, and with an application to the diffusion equation*, Journal of Functional Analysis 22 (1976), 366–389, [Zbl 0334.26009](https://zbmath.org/?q=an%3A0334.26009).
- [CorderoErausquin2005] D. Cordero-Erausquin, *On Berndtsson's generalization of Prékopa's theorem*, Mathematische Zeitschrift 249 (2005), 401–410, [Zbl 1079.32020](https://zbmath.org/?q=an%3A1079.32020).
- [Davies] E. B. Davies, *Heat Kernels and Spectral Theory*, Cambridge Tracts in Mathematics 92, Cambridge University Press, 1989, [Zbl 0699.35006](https://zbmath.org/?q=an%3A0699.35006).
- [FOT] M. Fukushima, Y. Oshima, M. Takeda, *Dirichlet Forms and Symmetric Markov Processes*, 2nd ed., de Gruyter Studies in Mathematics 19, de Gruyter, 2011, [Zbl 1227.31001](https://zbmath.org/?q=an%3A1227.31001). Beurling–Deny criteria, Chapter 1.
- [HelfferSjostrand] B. Helffer, J. Sjöstrand, *On the correlation for Kac-like models in the convex case*, Journal of Statistical Physics 74 (1994), 349–409, [Zbl 0946.35508](https://zbmath.org/?q=an%3A0946.35508).
- [Hörmander] L. Hörmander, *L² estimates and existence theorems for the ∂̄ operator*, Acta Mathematica 113 (1965), 89–152, [Zbl 0158.11002](https://zbmath.org/?q=an%3A0158.11002).
