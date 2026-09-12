# Roadmap: partial differential equations

Mathlib master already carries a deep analysis stack: distributions, the Schwartz space,
the full Fourier transform with inversion and Plancherel, convolution and mollifiers, the
Gagliardo–Nirenberg–Sobolev inequality, **Bessel-potential Sobolev spaces**, the
Laplacian on inner-product spaces, harmonic-function theory, **Lax–Milgram**, the
**Fredholm alternative for compact operators**, and Picard–Lindelöf for ODEs. What is
still missing is the **PDE theory built on top**: weak-derivative Sobolev spaces on a
domain with their embedding/trace/compactness package, maximum principles, the
harmonic-analysis estimates (maximal function, Calderón–Zygmund, interpolation), and the
existence-and-regularity theorems for elliptic and parabolic equations.

The bar for "done": a researcher in elliptic or parabolic PDE looks at this material and
says *"the prerequisites are all here, in reusable form, and I can start my work."*

## The end goal (v1)

For a **bounded open `Ω ⊆ ℝⁿ`** and a **uniformly elliptic, divergence-form** operator
`L u = -∂ⱼ(aⁱʲ ∂ᵢ u) + bⁱ ∂ᵢ u + c u` with bounded measurable coefficients, with no
symmetry assumption on the principal coefficient field `a`, deliver the **three pillars**
for the Dirichlet problem `L u = f` in `Ω`, `u = g` on `∂Ω`:

1. **Existence and uniqueness** of a weak solution in `H¹(Ω)` (energy method: Gårding's
   inequality plus Lax–Milgram; the Fredholm alternative when coercivity fails).
2. **Regularity:** weak solutions are locally Hölder continuous
   (**De Giorgi–Nash–Moser**, the bounded-measurable-coefficient case), and smooth when
   the coefficients and data are smooth (the interior `Hᵏ` bootstrap of Lane E.20;
   divergence-form Schauder estimates give `C^{1,α}` under Hölder hypotheses).
3. **The maximum principle** (weak and strong) and the **Harnack inequality** for the
   homogeneous equation, with the classical potential theory (mean-value property,
   Newtonian potential, Perron's method) as the constant-coefficient template.

```lean
-- the shape we are building toward (state in Suggested.lean as the supporting types land):
-- variable {n : ℕ} {Ω : Set (EuclideanSpace ℝ (Fin n))} (hΩ : IsOpen Ω) (hb : IsBounded Ω)
--
-- the energy bilinear form of L, weak (distributional) formulation:
-- def energyForm (a : Ω → Matrix (Fin n) (Fin n) ℝ) (b : Ω → ...) (c : Ω → ℝ) :
--     (Wkp 1 2 Ω) → (Wkp 1 2 Ω) → ℝ
--
-- existence/uniqueness of the weak solution (Dirichlet, homogeneous BC), via Lax–Milgram:
-- theorem exists_unique_weakSolution (helliptic : UniformlyElliptic λ Λ a) (hcoercive : ...)
--     (f : Lp ℝ 2 (volume.restrict Ω)) :
--     ∃! u : Wkp0 1 2 Ω, ∀ v : Wkp0 1 2 Ω, energyForm a b c u v = ∫ x in Ω, f x * v x
--
-- De Giorgi–Nash–Moser interior regularity, for the homogeneous principal part
-- `-∂ⱼ(aⁱʲ ∂ᵢ u) = 0`. Three things the statement must carry, none of them optional:
-- the estimate is quantitative in `‖u‖` (a constant depending only on `n, λ, Λ, K, Ω` is
-- false: `u_M = M x₁` is harmonic and scales), the exponent is a `ℝ≥0` with `0 < α ≤ 1`,
-- and the Hölder conclusion holds for a *representative*, since an `H¹` weak solution is
-- an a.e. equivalence class and may be altered on a null set.
-- def holderExponent (n : ℕ) (Λ : ℝ) : ℝ≥0
-- def holderConstant (n : ℕ) (Λ p₀ : ℝ) : ℝ≥0
-- theorem holderExponent_pos … : 0 < holderExponent n Λ
-- theorem holderExponent_le_one … : holderExponent n Λ ≤ 1
-- theorem weakSolution_holderOn (hn : 3 ≤ n) (hp₀ : 1 < p₀)
--     (helliptic : UniformlyElliptic λ Λ a) (hu : IsHomogeneousWeakSolution a u Ω)
--     (hInt : IntegrableOn (fun x => |u x| ^ p₀) Ω) (hK : IsCompact K) (hKΩ : K ⊆ interior Ω) :
--     ∃ v, v =ᵐ[volume.restrict Ω] u ∧
--       HolderOnWith (holderConstant n Λ p₀ * ‖(‖u‖ ^ p₀)‖_{L¹(Ω)} ^ (1/p₀))
--         (holderExponent n Λ) v K
```

## Standing hypotheses (spell them out)

PDE theory is **example-driven and hypothesis-sensitive**: the same theorem is true in
many incomparable forms, and the art is in tracking exactly which structure each proof
needs. Separate typeclass assumptions let every result land in its correct generality, so
there will be **no** monolithic `EllipticPDE` class. State each of these as a named,
separate hypothesis:

- **Domain regularity.** Most of the theory needs a bounded open `Ω`. *Trace*,
  *extension*, and *Rellich–Kondrachov* additionally need boundary regularity
  (Lipschitz, or `C¹`, or the cone/segment condition). Carry the boundary hypothesis
  explicitly: interior estimates do **not** need it, global ones do.
- **Uniform ellipticity** for possibly non-symmetric coefficient fields, with *explicit*
  constants `0 < λ ≤ Λ`: for almost every `x ∈ Ω` and every `ξ ∈ ℝⁿ`, require
  `ξ · a(x)ξ ≥ λ‖ξ‖²` and `ξ · a(x)⁻¹ξ ≥ Λ⁻¹‖ξ‖²`. The first condition implies that
  `a(x)` is invertible. For symmetric `a(x)` these conditions are equivalent to the
  Loewner bounds `λI ≤ a(x) ≤ ΛI`; Loewner ordering is not a definition for a general
  non-symmetric field. Substituting `y = a(x)ξ` in the inverse condition gives
  `‖a(x)ξ‖² ≤ Λ (ξ · a(x)ξ)`, and Cauchy–Schwarz then yields the quadratic bound
  `ξ · a(x)ξ ≤ Λ‖ξ‖²`, the operator bound `‖a(x)ξ‖ ≤ Λ‖ξ‖`, and the mixed bound
  `|ζ · a(x)ξ| ≤ Λ‖ζ‖‖ξ‖`, all with the same `Λ`. Derive those as theorems rather than
  making an upper constant primitive.

  The other common formulation asks for coercivity together with an operator bound
  `‖a(x)‖ ≤ M`. It is **not** the same hypothesis at the same constants, and the inverse
  form is the *stronger* one: coercivity plus `‖a(x)‖ ≤ M` gives only
  `ξ · a(x)⁻¹ξ ≥ (λ/M²)‖ξ‖²`, so `(λ, M)` in the operator form becomes `(λ, M²/λ)` in the
  inverse form, while `(λ, Λ)` in the inverse form gives `(λ, Λ)` in the operator form. The
  gap is real, not an artifact: for `a = [[1, −k], [k, 1]]` the symmetric part of `a⁻¹` is
  `I/(1+k²)`, so `λ = 1` and `M = √(1+k²)` while the inverse condition forces `Λ ≥ 1+k²`.
  Record both formulations and both conversions, and state which one each estimate's
  constants are calibrated against; do not describe either as the sharp one in general.
  Use a pointwise specialization when stronger coefficient regularity makes it appropriate.
- **Coefficient regularity is a *dial*, but it turns separately for the two operator
  forms.** The v1 operator is divergence form; the non-divergence track in Lane E is a
  separate extension of the roadmap. Every entry below is an **interior** estimate for a
  solution that is assumed to exist, and every one of them is quantitative in the solution
  as well as the data, so each carries a local norm of `u` on the right-hand side. For the
  scalar principal-part models `Ldiv u = -div(a ∇u)` and `Lnondiv u = -aⁱʲ ∂ᵢ∂ⱼu`:
  - **Divergence form, weak solutions:** bounded measurable `a` gives
    **De Giorgi–Nash–Moser** for the homogeneous equation, and **Meyers** gradient
    self-improvement for `2 < p < 2 + ε` for the homogeneous equation or for
    `Ldiv u = div F` with `F ∈ Lᵖ`, where `ε` depends on the dimension and on `λ, Λ`;
    Meyers is not unconditional self-improvement under arbitrary forcing. For
    `Ldiv u = f + div F` with `a, F ∈ C^{0,α}` and `f ∈ L^q`, `q > n`, interior
    **Schauder `C^{1,β}`** regularity holds with `β = min(α, 1 - n/q)`. For
    `Ldiv u = div F` with `a ∈ VMO` and `F ∈ Lᵖ`, interior **`W^{1,p}`** estimates hold
    for `1 < p < ∞`, carrying the VMO modulus and its small radius. And `a ∈ W^{1,∞}`
    with **scalar forcing `f ∈ L²`** gives interior `H²`; a divergence datum `F ∈ L²`
    only puts the right-hand side in `H^{-1}` and does not.
  - **Non-divergence form, strong/classical solutions:** bounded measurable `a` with
    `f ∈ L^n_loc` gives **Krylov–Safonov** `C^{0,α}` regularity for `W^{2,n}_loc` strong
    solutions, the estimate carrying `‖f‖_{L^n}`; `a, f ∈ C^{0,α}` gives
    **Schauder `C^{2,α}`** estimates; and `a ∈ VMO`, `f ∈ Lᵖ` gives interior
    **Calderón–Zygmund `W^{2,p}`** estimates for `1 < p < ∞`. The last two are stated for
    symmetric `a`, or equivalently for `a.symm`, per the symmetrization note below.
  Both De Giorgi–Nash–Moser and Krylov–Safonov are scalar theories; do not silently
  generalize their conclusions to elliptic systems. Name the operator form, data slots,
  and solution concept in every theorem.

"Named and separate" describes the hypotheses a statement carries, not new vocabulary to
define. Follow "Use Mathlib's vocabulary" in the top-level README: a coefficient bound is the
inline hypothesis `∀ x ∈ Ω, ‖b x‖ ≤ β`, never a bespoke boundedness predicate, because Mathlib
states such bounds inline and has `Bornology.IsBounded` when no constant is needed. Uniform
ellipticity is the case that does earn a named definition: the coercivity bounds on `a(x)`
and `a(x)⁻¹` above have no Mathlib spelling, so define them once, with explicit `λ, Λ` and
without a symmetry field. Derive mixed bilinear and norm bounds as theorems rather than
making a changed upper constant primitive.

## Getting the statements right

A few cross-cutting rules for the *shape* of a PDE statement: which hypotheses it carries
and which notion it names. These recur across the lanes below, and getting them right at
statement time is what keeps the formalized API reusable.

- **Name the solution concept.** State whether a theorem is about *classical* (`C²`, the
  PDE holds pointwise), *strong* (`W^{2,p}`, a.e.), or *weak* (`H¹`, against test
  functions) solutions, and which of these it assumes versus produces. The regularity lane
  is exactly the passage from weak to classical.
- **Track ellipticity constants quantitatively.** Every energy, Harnack, Hölder, Schauder,
  and Calderón–Zygmund estimate must state how its constants and exponents depend on
  `λ, Λ` (or, after normalization, on the ellipticity ratio `Λ / λ`), as well as on the
  dimension, exponents, domain geometry, and coefficient moduli that actually enter.
  An unqualified `∃ C` is not an adequate final statement, and an intermediate norm-bound
  reformulation must not silently change `Λ`. State local estimates in rescaling-compatible
  form: on a ball of radius `r`, the coefficient parameters include the dimensionless
  quantities `r^α[a]_{C^{0,α}}`, `r‖∇a‖∞`, `r‖b‖∞`, and `r²‖c‖∞`. For VMO coefficients,
  carry the VMO modulus explicitly and state the estimate below the corresponding small
  radius `r₀`; membership in VMO alone supplies no quantitative rate.
- **Build domain Sobolev spaces from weak derivatives, then connect them to the Fourier
  scale.** The PDE workhorse is `W^{k,p}(Ω)` on a domain via weak derivatives; build it,
  then *prove* it agrees with Mathlib's Fourier/Bessel-potential spaces
  (`TemperedDistribution.memSobolev`) on `ℝⁿ` in the range where they coincide
  (`1 < p < ∞`, integer `s`; Calderón). Don't reuse the Bessel definition as the domain
  theory: it is a whole-space notion and the two scales genuinely differ at `p = 1, ∞`.
- **Carry Poincaré's normalization.** `‖u‖ ≤ C‖∇u‖` holds on `W^{1,p}_0(Ω)` (zero trace)
  or modulo constants (Poincaré–Wirtinger, zero mean), for `Ω` bounded (or of finite
  measure, or bounded in one direction). State that side condition explicitly; it is the
  load-bearing hypothesis (the inequality fails outright on `ℝⁿ`).
- **Pick the Sobolev-embedding regime by exponent.** Subcritical `p < n` gives
  `W^{1,p} ↪ L^{p*}`, `p* = np/(n−p)` (consume Gagliardo–Nirenberg–Sobolev); supercritical
  `p > n` gives Hölder `C^{0,1−n/p}` (Morrey); the borderline `p = n` gives
  BMO/exponential integrability (Trudinger–Moser), not `L^∞`. State the regime you mean
  rather than a single catch-all embedding.
- **Use weak compactness for existence; reserve norm compactness for Rellich.** Existence
  arguments run on *weak* sequential compactness of bounded sets in a reflexive space
  (Banach–Alaoglu / `WeakDual`). Norm compactness comes from one place,
  **Rellich–Kondrachov**: `W^{1,p}(Ω) ↪↪ L^p(Ω)` is compact for bounded `Ω`, the embedding
  that powers the Fredholm alternative and the eigenvalue expansions.
- **State maximum principles with their hypotheses.** The weak maximum principle for
  `Lu = -∂ⱼ(aⁱʲ∂ᵢu) + cu` needs `c ≥ 0` (or `Lu ≤ 0` with the right structure); the strong
  principle additionally needs `Ω` connected and rests on the **Hopf boundary-point
  lemma**; Harnack is for nonnegative solutions. Make each of these a named hypothesis.
- **Fix the Laplacian sign and Fourier convention once.** Pin the sign of `Δ` (Mathlib's
  convention in `InnerProductSpace/Laplacian.lean`), and note Mathlib's Bessel potential is
  `(1 − (2π)⁻² Δ)^{s/2}`, not `(1 − Δ)^{s/2}`, because of the `2π` in its Fourier
  transform. This is harmless when *defining* the spaces, but a mismatch in an estimate is
  a real error.
- **Keep divergence and non-divergence form apart.** De Giorgi–Nash–Moser is
  divergence-form/weak; its non-divergence-form counterpart is **Krylov–Safonov** for
  `W^{2,n}_loc` strong solutions. Do not add viscosity solutions without separately
  roadmapping their comparison, stability, and existence theory. The antisymmetric part
  of `a` matters in divergence form: it contributes to the weak bilinear form and makes
  the operator non-self-adjoint, although it vanishes from the diagonal energy. In
  non-divergence form, `∂ᵢ∂ⱼu` is symmetric, so only `a.symm = (a + aᵀ) / 2` contributes;
  the derived quadratic bounds let this track assume symmetric coefficients without
  changing `λ, Λ`. Never transfer one form's conclusion under the other's hypotheses.

## Inventory: what Mathlib master gives us (consume)

- **Distributions & test functions** in `Mathlib/Analysis/Distribution/*`:
  `Distribution` (`𝓓'(Ω, F)`, general `F`-valued, finite-dim domain), `TestFunction`
  (`𝓓(Ω)`), `ContDiffMapSupportedIn`, `TemperedDistribution` (`𝓢'`), `SchwartzSpace`
  (`𝓢`), `FourierSchwartz`, `FourierMultiplier`, `TemperateGrowth`, and the distributional
  `DerivNotation`. This is a *substantial* head start: the test-function/distribution
  pairing is already done.
- **Sobolev (Bessel potential)** in `Mathlib/Analysis/Distribution/Sobolev.lean`:
  `besselPotential`, `memSobolev` (the `H^{s,p}` scale), `memSobolev_two_iff_fourier`,
  and the operator actions `MemSobolev.lineDerivOp`, `MemSobolev.laplacian`. Reconcile
  with (do not duplicate) the weak-derivative spaces you build.
- **The Sobolev inequality** in `Mathlib/Analysis/FunctionalSpaces/SobolevInequality.lean`:
  `eLpNorm_le_eLpNorm_fderiv_of_eq` / `…_of_le` (Gagliardo–Nirenberg–Sobolev, van Doorn–
  Macbeth). The subcritical embedding estimate, already proved; *consume it directly* for
  the `p < n` case.
- **Fourier analysis** in `Mathlib/Analysis/Fourier/*`: `FourierTransform`, `Inversion`,
  `LpSpace` (Plancherel/Hausdorff–Young flavour), `FourierTransformDeriv`,
  `RiemannLebesgueLemma`, `PoissonSummation`, `Convolution`.
- **Convolution & mollifiers** in `Mathlib/Analysis/Convolution.lean` and
  `Mathlib/Analysis/Calculus/BumpFunction/*` (`ContDiffBump`, `Convolution`), the
  approximate-identity machinery for density and smoothing.
- **The Laplacian & harmonic functions** in
  `Mathlib/Analysis/InnerProductSpace/Laplacian.lean` (`Δ` on `E → F`, real f.d. inner
  product space), `…/InnerProductSpace/Harmonic/*` (`HarmonicAt`, `HarmonicOnNhd`, the
  algebra of harmonic functions), and `Mathlib/Analysis/Complex/Harmonic/*` (mean-value
  property, Liouville, Poisson kernel, harmonic ⇔ locally `Re` of analytic). The `n = 2`
  potential theory is essentially *there*.
- **Hilbert-space machinery for the energy method** in
  `Mathlib/Analysis/InnerProductSpace/LaxMilgram.lean` (`IsCoercive`,
  `continuousLinearEquivOfBilin`, i.e. **Lax–Milgram itself**),
  `…/InnerProductSpace/Dual.lean` (**Fréchet–Riesz** `toDual`),
  `…/InnerProductSpace/Adjoint.lean`, `…/InnerProductSpace/Projection/`.
- **Spectral theory** in `Mathlib/Analysis/InnerProductSpace/Spectrum.lean`: the spectral
  theorem for symmetric operators (finite-dim diagonalization; for **compact** operators,
  `finite_dimensional_eigenspace` and `eq_zero_of_forall_hasEigenvalue_eq_zero`), and
  `Mathlib/Analysis/Normed/Operator/Compact/FredholmAlternative.lean` (the **Fredholm
  alternative**). The eigenvalue/eigenfunction-expansion lane builds directly on these.
- **Functional-analysis backbone:** Hahn–Banach
  (`Mathlib/Analysis/Normed/Module/HahnBanach.lean`), Banach–Steinhaus
  (`…/Normed/Operator/BanachSteinhaus.lean`), open mapping / closed graph, weak topologies
  (`…/Normed/Module/WeakDual.lean`, `…/LocallyConvex/WeakDual.lean`), Arzelà–Ascoli
  (`Mathlib/Topology/ContinuousMap/Bounded/ArzelaAscoli.lean`).
- **Integration:** the Bochner integral (`Mathlib/MeasureTheory/Integral/Bochner/*`, the
  vector-valued integral the parabolic lane needs), `Lp`/`eLpNorm`, Hölder & Minkowski,
  conditional expectation, Besicovitch/Vitali covering
  (`Mathlib/MeasureTheory/Covering/*`).
- **ODEs** in `Mathlib/Analysis/ODE/*`: Picard–Lindelöf (`ExistUnique`), Grönwall. The
  Galerkin/method-of-lines and the characteristic-curve lanes consume these.

## Inventory: what is missing (build here)

- **Weak-derivative Sobolev spaces `W^{k,p}(Ω)`** on a domain (distinct from the
  Bessel-potential scale): weak derivatives, completeness, `W^{k,p}_0` as the
  `C_c^∞`-closure, Meyers–Serrin `H = W` density, and the agreement theorem with the
  Fourier `H^{s,p}` on `ℝⁿ`.
- **The embedding/trace/compactness package:** Morrey `C^{0,α}` embedding (`p > n`), the
  borderline `p = n` case, **Poincaré** and Poincaré–Wirtinger, the **trace operator** on
  `∂Ω` and its kernel `= W^{1,p}_0`, the **extension operator**, and
  **Rellich–Kondrachov** compactness.
- **Hölder spaces `C^{k,α}`** as Banach spaces (for Schauder), and the Campanato/Morrey
  space characterization.
- **Harmonic-analysis estimates:** the **Hardy–Littlewood maximal function** and its weak
  `(1,1)` / strong `(p,p)` bounds (vendor from the Carleson project), the
  **Calderón–Zygmund decomposition**, **singular integral operators** with the CZ kernel
  bounds, the **Mihlin–Hörmander multiplier theorem**, and **interpolation**
  (Riesz–Thorin and **Marcinkiewicz**, *neither* of which is in Mathlib). Add **Gehring's
  lemma** for reverse-Hölder self-improvement, and make BMO/VMO a real sub-lane:
  John–Nirenberg, the **Coifman–Rochberg–Weiss commutator theorem**, and Sarason's
  vanishing-mean-oscillation characterization.
- **Maximum principles & potential theory:** weak and strong maximum principles, the
  **Hopf lemma**, comparison principles, the **Aleksandrov–Bakelman–Pucci estimate** for
  non-divergence-form operators—including its convex-envelope, contact-set, and
  area-formula/Alexandrov measure-theory inputs—the **Harnack inequality**, the Newtonian
  potential / fundamental solution of `Δ`, the Green's function, the Poisson kernel on
  `ℝⁿ` (the half-space and the ball), and **Perron's method** for the Dirichlet problem.
- **Elliptic existence & regularity:** the energy/weak formulation for non-symmetric
  coefficients and Gårding's
  inequality (then Lax–Milgram, *consumed*); divergence-form `Hᵏ`, `W^{1,p}`, and
  `C^{1,α}` estimates; non-divergence-form `W^{2,p}` and `C^{2,α}` estimates;
  **De Giorgi–Nash–Moser** (port and reconcile Armstrong–Kempe's existing formalization)
  and **Krylov–Safonov**; eigenvalues of `−Δ` via the compact-self-adjoint spectral
  theorem.
- **Parabolic & evolution equations:** Bochner spaces `L²(0,T;H)`, the Gelfand triple
  `V ↪ H ↪ V*`, the **Galerkin method**, existence for linear parabolic equations, the
  parabolic maximum principle, the **heat semigroup** and **Hille–Yosida**.

---

## The build, in lanes

The ordering below is the dependency order, not a strict schedule, and the lanes are
deliberately parallelizable. As a lane makes the next one's *types* expressible in
`TauCeti/`, state those milestones in `Suggested.lean` (`sorry` is allowed there: it is
human-owned roadmap territory).

### Lane A: function spaces on a domain (the universal prerequisite)

Almost everything downstream waits on this, so do it first and do it right.

1. **`W^{k,p}(Ω)` via weak derivatives.** Define the weak (distributional) derivative of a
   locally integrable function, `W^{k,p}(Ω)` with its norm, and prove **completeness**.
   Build on Mathlib's `Distribution`/`TestFunction` pairing so the definition is the
   honest one (`∫ u ∂^α φ = (−1)^{|α|} ∫ (D^α u) φ` for all test `φ`).
2. **Density and `W^{k,p}_0`.** Mollification (consume `BumpFunction/Convolution`) gives
   `C^∞ ∩ W^{k,p}` dense (**Meyers–Serrin**, `H = W`); define `W^{k,p}_0(Ω)` as the
   `C_c^∞(Ω)`-closure. ⚠ `H = W` needs no boundary regularity; `W^{k,p}_0 = W^{k,p}` for
   `Ω = ℝⁿ` but **not** for bounded `Ω`.
3. **Reconcile with Mathlib's Bessel-potential scale.** Prove `W^{k,2}(ℝⁿ) = H^{k,2}(ℝⁿ)`
   (and the `1<p<∞` integer-order Calderón agreement) so the two definitions are known to
   coincide where both make sense; *do not* leave them as unrelated theories.
4. **Embeddings.** *Consume* Gagliardo–Nirenberg–Sobolev for `p<n`; **build** the Morrey
   embedding `W^{1,p}(Ω) ↪ C^{0,1−n/p}(Ω)` for `p>n`, and state (then prove) the
   borderline `p=n`.
5. **Poincaré and Sobolev–Poincaré.** Prove Poincaré on `W^{1,p}_0(Ω)` (bounded `Ω`),
   Poincaré–Wirtinger (zero mean), and the scale-compatible Sobolev–Poincaré inequality
   on balls `‖u - u_B‖_{L^{p*}(B)} ≤ C‖∇u‖_{L^p(B)}` for `p < n`, with explicit constant
   dependence. The last form turns Caccioppoli into the reverse-Hölder inequality used in
   Lane E.21.
6. **Trace, extension, Rellich.** The **trace operator** `W^{1,p}(Ω) → L^p(∂Ω)` with
   `ker = W^{1,p}_0` (Lipschitz `∂Ω`), an **extension operator** `W^{1,p}(Ω) → W^{1,p}(ℝⁿ)`,
   and **Rellich–Kondrachov**: `W^{1,p}(Ω) ↪↪ L^p(Ω)` **compact** for bounded `Ω` (via
   Fréchet–Kolmogorov / Arzelà–Ascoli). This is the keystone for Lane D and the
   eigenvalue theory.
7. **Hölder and Campanato spaces.** Build `C^{k,α}(Ω)` as Banach spaces, the target
   spaces for Schauder, together with the Campanato/Morrey characterization of Hölder
   regularity used by the excess-decay proofs.

### Lane B: harmonic-analysis estimates

The estimate engine for Calderón–Zygmund regularity and Schauder. Vendor heavily from the
**Carleson project**, which already has the maximal function and covering machinery.

8.  **Hardy–Littlewood maximal function** `Mf` and the **maximal inequality**: weak
    `(1,1)` (via Vitali, consuming `MeasureTheory/Covering/*`) and strong `(p,p)` for
    `p>1`, with the Lebesgue differentiation theorem as a corollary.
9.  **Interpolation.** **Marcinkiewicz** (real, weak-type to strong-type) and
    **Riesz–Thorin** (complex). *Neither is in Mathlib*; both are foundational and
    reusable far beyond PDE.
10. **Calderón–Zygmund.** The **CZ decomposition** of an `L¹` function at height `t`; the
    **CZ singular integral operators** (standard kernel bounds) bounded on `Lᵖ`, `1<p<∞`,
    and weak-`(1,1)`; the **Mihlin–Hörmander multiplier theorem** (consume Mathlib's
    `FourierMultiplier`). ⚠ A CZ operator is **not** bounded on `L¹` or `L^∞`; the
    endpoints are weak-`(1,1)` and `L^∞ → BMO`, and stating an `L¹`/`L^∞` bound is the
    classic error.
11. **Self-improvement, BMO, and VMO** (sub-lane): Gehring's lemma for reverse-Hölder
    inequalities; `BMO(ℝⁿ)`, the John–Nirenberg inequality, and the `L^∞ → BMO` endpoint
    for CZ operators; the Coifman–Rochberg–Weiss commutator theorem and Sarason's
    characterization of `VMO`. The last two are the perturbative engine for the VMO
    estimates in Lane E.

### Lane C: maximum principles and potential theory

Except for ABP, this is the classical, constant-coefficient theory: the cleanest lane and
a good early win, with much of the `n=2` case already in Mathlib's complex
harmonic-function files. ABP is a variable-coefficient extension with substantial
geometric-measure prerequisites and should be scheduled separately.

12. **Mean-value property and smoothness of harmonic functions** on `ℝⁿ` (consume the
    `n=2` complex theory; generalize the mean-value characterization to `ℝⁿ`).
13. **Maximum principles and ABP.** Prove the weak and strong maximum principles for `Δ`
    and then for general elliptic `L` (sign condition `c ≥ 0`), the **Hopf boundary-point
    lemma**, and the comparison principle. Separately prove the
    **Aleksandrov–Bakelman–Pucci estimate** for scalar non-divergence-form strong
    solutions; it is the maximum-principle input to Krylov–Safonov in Lane E.24. This
    consumes the `W^{2,n}_loc` strong-solution language from Lane A.1 and additionally
    requires convex envelopes, contact sets, and the measure estimate for the
    gradient/normal map, via an area formula for Lipschitz maps or Alexandrov twice
    differentiability. These inputs are not part of the otherwise-early Lane C theory and
    must be roadmapped explicitly.
14. **The Harnack inequality** for nonnegative harmonic functions, then for general
    elliptic `L` (this feeds De Giorgi–Nash–Moser in Lane E).
15. **Fundamental solution / Newtonian potential** of `Δ` on `ℝⁿ`, the **Green's
    function** and **Poisson kernel** on the ball/half-space, and **Perron's method**:
    existence for the Dirichlet problem `Δu = 0` in `Ω`, `u = g` on `∂Ω`, via subharmonic
    barriers. ⚠ Perron yields a harmonic function for *any* bounded `Ω`; **boundary
    attainment** of `g` is a separate statement needing a **barrier** at each boundary
    point (regular boundary points).

### Lane D: linear elliptic existence (the energy method)

The shortest path to a genuine PDE existence theorem, because Lax–Milgram is *already in
Mathlib*. This lane mostly assembles Lane A and Mathlib.

16. **Weak formulation.** The energy bilinear form `a(u,v) = ∫ aⁱʲ ∂ᵢu ∂ⱼv + …` on
    `H¹_0(Ω) × H¹_0(Ω)`; boundedness; **Gårding's inequality**
    `a(u,u) ≥ c₀‖u‖²_{H¹} − β‖u‖²_{L²}` from uniform ellipticity. Do not assume
    `aⁱʲ = aʲⁱ`: use coercivity of `a` for the lower energy bound and derive weak-form
    boundedness with the same `Λ` from coercivity of `a⁻¹`.
17. **Existence & uniqueness (coercive case).** When `a` is coercive, *consume* Lax–Milgram
    (`continuousLinearEquivOfBilin`) for the unique weak solution of the Dirichlet problem.
    This is the first end-to-end PDE theorem and should land early.
18. **The Fredholm alternative (non-coercive case).** Using Rellich (Lane A.6) to make the
    resolvent compact, *consume* `FredholmAlternative` to get the
    "either-unique-solution-or-finite-dim-kernel" dichotomy for `Lu = f`.
19. **Spectrum of `−Δ`.** The Dirichlet eigenvalues/eigenfunctions of `−Δ` on a bounded
    `Ω`: a compact self-adjoint inverse (Rellich plus Lax–Milgram), then the eigenfunction
    basis from `InnerProductSpace/Spectrum`. The model **Sturm–Liouville** /
    separation-of-variables payoff.

### Lane E: elliptic regularity

The deepest lane splits into two theories whose hypotheses and outputs must remain
visible. The v1 deliverable is the divergence-form weak theory. Non-divergence-form
strong/classical regularity is a separate extension, after the ABP and harmonic-analysis
prerequisites land. The v1 statements are scalar. Items 23 and 24 are scalar by necessity:
De Giorgi–Nash–Moser fails for general elliptic systems with bounded measurable
coefficients, and Krylov–Safonov uses the maximum principle. Items 20–22 and 25–26 have
systems analogues under the appropriate systems ellipticity hypotheses, so their APIs
should not preclude a later vector-valued generalization.

#### Divergence form: weak solutions

20. **Interior `H²`/`Hᵏ` estimates** via difference quotients. For
    `-div(a ∇u) = f`, require `a ∈ W^{1,∞}` and `f ∈ L²` to upgrade a weak `H¹` solution
    to `H²_loc`. More generally, `a ∈ W^{k,∞}` and `f ∈ H^{k-1}` give `H^{k+1}_loc`;
    smooth coefficients and data then bootstrap to smoothness. State global versions
    separately with the needed boundary regularity and compatibility, and expose all
    coefficient-derivative dependence in rescaling-compatible form.
21. **Gradient `W^{1,p}` estimates.** For `-div(a ∇u) = div F`, bounded measurable
    coefficients, Caccioppoli, Sobolev–Poincaré, and Gehring give higher integrability of
    an existing `H¹_loc` weak solution for `2 < p < 2 + ε(n, Λ / λ)` when
    `F ∈ L^p_loc`. State the lower-side result `2 - ε < p < 2` separately: its content is
    `W^{1,p}` well-posedness and the estimate `‖∇u‖_p ≤ C‖F‖_p`, with the needed domain
    hypotheses, rather than self-improvement of an `H¹` solution. Expose how both ranges
    degenerate with the ellipticity ratio and include Meyers' counterexample to an all-`p`
    bounded-measurable-coefficient claim. For `a ∈ VMO` and `F ∈ Lᵖ`, obtain the full
    **interior** range `1 < p < ∞`, consuming Lane B's commutator/VMO theory and carrying
    the VMO modulus and small radius `r₀` explicitly. State the global Dirichlet estimate
    separately: the full range needs, for example, `C¹` boundary, or a suitably small-BMO
    coefficient field on a sufficiently flat Reifenberg domain.
22. **Divergence-form Schauder estimates.** For `-div(a ∇u) = f + div F`, require
    `a, F ∈ C^{0,α}` and `f ∈ L^q` for some `q > n`; then prove interior `C^{1,β}` control
    of `u` with `β = min(α, 1 - n/q)`. Insufficient integrability of `f` removes this
    conclusion rather than merely lowering the exponent; Morrey-space data provide a
    useful alternative formulation. State the precise local estimate before global
    solvability, whose boundary version needs corresponding boundary and boundary-data
    regularity. A `C^{2,α}` conclusion requires one more derivative of the divergence-form
    coefficients, or belongs to the non-divergence track below.
23. **De Giorgi–Nash–Moser.** Local boundedness and **Hölder continuity** of weak
    solutions of divergence-form equations with **bounded measurable, not necessarily
    symmetric** coefficients, and the elliptic Harnack inequality in this generality.
    State the **homogeneous** principal part first: Hölder continuity and Harnack are
    theorems about `-div(a ∇u) = 0`, not about the standing operator with arbitrary
    forcing and lower-order terms. Then do the inhomogeneous equation, where the estimate
    acquires a norm of the data under an integrability hypothesis (`f ∈ L^q`, `q > n/2`,
    or a divergence datum `F`), and then `b` and `c`, whose contributions enter through
    the scaled quantities `r‖b‖∞` and `r²‖c‖∞` and which need a sign hypothesis for
    Harnack. Keep the Hölder exponent and all estimate constants explicit in `λ, Λ` (or
    `Λ / λ`) and dimension. Note that this is **divergence-form/weak**, whereas the
    non-divergence analogue is Krylov–Safonov. Do not silently generalize this scalar
    conclusion to elliptic systems.

    Port and reconcile the Armstrong–Kempe development, whose coefficient structure is the
    inverse-coercivity pair above and which derives its mixed upper bounds rather than
    assuming them. Reconciling means closing four gaps between their statement and ours,
    each of which is work this milestone owns: their `holder_Moser` is stated on the unit
    ball for coefficients normalized to `λ = 1` and transfers to a general ball and general
    `λ` only by scaling; it assumes `2 < n`; it concludes for a representative `v` with
    `v =ᵐ u` rather than for `u` itself; and its constant carries
    `(∫_{B₁} |u|^{p₀})^{1/p₀}` for `p₀ > 1`, so the estimate is quantitative in the
    solution, not in the structural constants alone.

#### Non-divergence form: strong/classical solutions

24. **ABP and Krylov–Safonov.** Combine the ABP estimate from Lane C.13 with the
    barrier/measure estimate and the Krylov–Safonov dyadic covering lemma to prove the
    Harnack inequality and interior `C^{0,α}` estimate for scalar
    `W^{2,n}_loc` strong solutions of `-aⁱʲ ∂ᵢ∂ⱼu = f` with bounded measurable uniformly
    elliptic coefficients and `f ∈ L^n_loc`. This regularity does not by itself produce
    `W^{2,p}` or `C^{1,α}` estimates. Viscosity solutions require a separate roadmap for
    comparison, stability, and existence.
25. **Non-divergence Schauder estimates.** For `a, f ∈ C^{0,α}`, prove interior
    `C^{2,α}` estimates and then global classical solvability under the corresponding
    `C^{2,α}` boundary and boundary-data hypotheses. Expose dependence on `λ, Λ`, `α`,
    dimension, geometry, and the rescaled coefficient Hölder seminorm.
26. **Non-divergence Calderón–Zygmund estimates.** First prove the constant-coefficient
    interior `W^{2,p}` estimate for `Δu = f`, expressing second derivatives through the
    Newtonian potential from Lane C.15 and consuming Lane B.10's CZ singular-integral
    bounds. Then use Lane B's commutator/VMO machinery for
    `-aⁱʲ ∂ᵢ∂ⱼu = f` with `a ∈ VMO`, obtaining interior `W^{2,p}` estimates for
    `1 < p < ∞`. Carry the VMO modulus and small radius `r₀` explicitly; state the global
    Dirichlet estimate separately with, for example, `C^{1,1}` boundary.

### Lane F: parabolic and evolution equations

27. **Bochner spaces and the Gelfand triple.** `L²(0,T;V)`, `H¹(0,T;V*)`, the triple
    `V ↪ H ↪ V*` (consume the Bochner integral), and the integration-by-parts/embedding
    `L²(V) ∩ H¹(V*) ↪ C([0,T];H)`.
28. **Linear parabolic existence.** The **Galerkin method**: finite-dimensional
    approximation (consume ODE existence), energy estimates, weak-compactness passage to
    the limit, giving existence/uniqueness for `∂ₜu + Lu = f`, `u(0) = u₀`. The parabolic
    maximum principle.
29. **Semigroups.** The **heat semigroup**, generators, and **Hille–Yosida**; the heat
    kernel on `ℝⁿ` (consume the Fourier transform) and the smoothing estimates.

### Stretch goals (state once the lanes above are solid)

- **Strichartz estimates** for the wave and Schrödinger equations (Tao, *Nonlinear
  Dispersive Equations*): the `TT*` method, the dispersive `L¹→L^∞` decay, and the
  endpoint Keel–Tao argument, consuming the Fourier/oscillatory-integral and
  interpolation lanes.
- **Quasilinear elliptic existence** via Schauder/Leray–Schauder fixed-point theory on top
  of Lane E (the De Giorgi–Nash–Moser a-priori estimates supply the compactness).
- **Stochastic PDE:** a result from Krylov's analytic `L_p`-theory of SPDE, or
  Da Prato–Debussche for the stochastic Navier–Stokes / 2D stochastic quantization,
  consuming the parabolic and Bochner lanes plus Mathlib's probability stack.

## Acceptance criteria ("checks along the way")

Concrete sanity checks that rule out vacuous or mis-stated definitions:

- **Spaces agree where they must:** `W^{k,2}(ℝⁿ) = H^{k,2}(ℝⁿ)` (Lane A.3) and
  `ker(trace) = W^{1,p}_0` (Lane A.6).
- **Poincaré is non-vacuous:** the constant is finite on a concrete bounded `Ω` (e.g. a
  ball) and the inequality genuinely *fails* on `ℝⁿ`. Formalize both directions so the
  hypothesis is known to be load-bearing.
- **End-to-end existence:** the Dirichlet problem `−Δu = f` in a ball, `u = 0` on the
  boundary, has a unique weak solution (Lane D.17), it is **smooth** for smooth `f`
  (Lane E.20), and it equals the **Newtonian-potential** solution (Lane C.15): three lanes
  meeting on one example.
- **Eigenvalues are real and positive:** the first Dirichlet eigenvalue of `−Δ` is
  positive (Lane D.19), matching the Poincaré constant.
- **Regularity actually upgrades:** exhibit a weak solution that is *only* `H¹` a priori
  and prove it is `C^{0,α}` (Lane E.23), the De Giorgi–Nash–Moser payoff on an example;
  include a genuinely non-symmetric coefficient field and expose the dependence of `α`
  and the Hölder bound on `λ, Λ`.
- **The two regularity tracks meet at the Laplacian:** for smooth `f`, compare the weak
  solution from Lane D.17 with both the divergence-form bootstrap (Lane E.20) and the
  non-divergence Schauder/Calderón–Zygmund estimates (Lanes E.25–26), while keeping each
  theorem's solution concept and hypotheses distinct.
- **Maximum principle bites:** a subsolution of `−Δu ≤ 0` attains its max on `∂Ω`
  (Lane C.13), with a counterexample showing the sign condition is necessary.

## References

- L. C. Evans, *Partial Differential Equations*, the default modern graduate text;
  Sobolev spaces (Ch. 5), second-order elliptic (Ch. 6), parabolic/Galerkin (Ch. 7),
  semigroups (Ch. 7), Hamilton–Jacobi & conservation laws.
- D. Gilbarg, N. Trudinger, *Elliptic Partial Differential Equations of Second Order*:
  maximum principles (Ch. 3), Schauder (Ch. 6), `Lᵖ` theory (Ch. 9), De Giorgi–Nash–Moser
  (Ch. 8); the canonical elliptic reference.
- S. Armstrong, J. Kempe, [*Formalization of De Giorgi–Nash–Moser Theory in
  Lean*](https://arxiv.org/abs/2604.05984), with the accompanying
  [`scottnarmstrong/DeGiorgi`](https://github.com/scottnarmstrong/DeGiorgi) repository
  (Apache-2.0, `sorry`-free, no custom axioms): the source for the non-symmetric
  inverse-coercivity definition (`EllipticCoeff`), its derived upper bounds
  (`quadratic_upper`, `mixed_bound`, both with the same `Λ`), and the Lane E.23 migration.
  Read `holder_Moser` in `DeGiorgi/Holder/PublicEstimate.lean` before writing Lane E.23's
  statement: it fixes the normalization, dimension, homogeneity, representative, and norm
  dependence that the migration has to reconcile.
- N. G. Meyers, [*An `Lᵖ`-estimate for the gradient of solutions of second order elliptic
  divergence equations*](https://www.numdam.org/item/ASNSP_1963_3_17_3_189_0/): the
  bounded-measurable-coefficient self-improvement near `p = 2` in Lane E.21.
- F. Chiarenza, M. Frasca, P. Longo,
  [*Interior `W^{2,p}` estimates for nondivergence elliptic equations with discontinuous
  coefficients*](https://hdl.handle.net/11568/17627) and
  [*`W^{2,p}`-solvability of the Dirichlet problem for nondivergence elliptic equations
  with VMO coefficients*](https://doi.org/10.2307/2154379): respectively the interior
  estimate and the global `C^{1,1}`-boundary theory in Lane E.26.
- G. Di Fazio, [*`L^p` estimates for divergence form elliptic equations with discontinuous
  coefficients*](https://www.iris.unict.it/handle/20.500.11769/2040), and P. Auscher,
  M. Qafsaoui, [*Observations on `W^{1,p}` estimates for divergence elliptic equations
  with VMO coefficients*](https://www.bdim.eu/item?id=BUMI_2002_8_5B_2_487_0): the
  commutator method and its non-symmetric, `C¹`-boundary refinement for Lane E.21.
- L. Grafakos, *Classical Fourier Analysis* (and *Modern*) / E. Stein, *Singular Integrals
  and Differentiability Properties of Functions*: maximal function, interpolation,
  Calderón–Zygmund, BMO. Baby versions in Stein–Shakarchi vol. 4, §3.3.
- T. Tao, *Nonlinear Dispersive Equations: Local and Global Analysis*: Strichartz
  estimates and the dispersive stretch goals.
- N. V. Krylov, *An Analytic Approach to SPDEs*; G. Da Prato, A. Debussche, *Stochastic
  Navier–Stokes*: the stochastic stretch goals.
- The **Carleson project** (van Doorn–Thiele), <https://github.com/fpvandoorn/carleson>,
  the path-finding high-analysis Lean project; the source to vendor the Hardy–Littlewood
  maximal function, Vitali covering, and Calderón–Zygmund machinery from.

## How to drive it

**Lane A comes first** and to a high standard, because almost everything downstream needs
`W^{k,p}(Ω)` and Rellich. Then Lanes B, C, D can proceed largely in parallel: Lane C
minus its ABP extension is the easiest early win and partly exists in Mathlib already; Lane D
(energy-method existence) is the shortest path to a real PDE theorem because Lax–Milgram
is *already there*; Lane B (harmonic analysis) is the long pole that Lane E's regularity
depends on. In Lane E, build the divergence-form v1 track first, including the imported
De Giorgi development. Treat the non-divergence strong/classical track as a follow-up once
ABP—including its convex-geometric measure theory—Campanato, commutators, and VMO are
available. Lane F and the stretch goals come last.

## Acknowledgements

This roadmap builds directly on earlier discussions on the [Lean
Zulip](https://leanprover.zulipchat.com/), and would not have been possible without them:

- [#AI authored projects > De Giorgi–Nash–Moser](https://leanprover.zulipchat.com/#narrow/channel/583339-AI%20authored%20projects/topic/De%20Giorgi%E2%80%93Nash%E2%80%93Moser),
  the De Giorgi–Nash–Moser formalization experiment that informed this roadmap's headline
  regularity target, with Filippo A. E. Nuccio, Przemek Chojecki, and others.
- [#mathlib4 > PDE Theory](https://leanprover.zulipchat.com/#narrow/channel/287929-mathlib4/topic/PDE%20Theory)
  (Anatole Dedecker, Michael Rothgang, Filippo A. E. Nuccio, Aditya Ramabadran), scoping
  the PDE theory to build on top of Mathlib's analysis stack.
- [#new members > elliptic PDEs](https://leanprover.zulipchat.com/#narrow/channel/113489-new%20members/topic/elliptic%20PDEs),
  discussing prerequisites for formalizing elliptic PDEs.

Thanks to everyone who contributed to these discussions.
