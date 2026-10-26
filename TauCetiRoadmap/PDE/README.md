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
`L u = -∂ⱼ(aⁱʲ ∂ᵢ u) + bⁱ ∂ᵢ u + c u` with bounded measurable coefficients, deliver the
**three pillars** for the Dirichlet problem `L u = f` in `Ω`, `u = g` on `∂Ω`:

1. **Existence and uniqueness** of a weak solution in `H¹(Ω)` (energy method: Gårding's
   inequality plus Lax–Milgram; the Fredholm alternative when coercivity fails).
2. **Regularity:** weak solutions are locally Hölder continuous
   (**De Giorgi–Nash–Moser**, the bounded-measurable-coefficient case), and smooth when
   the coefficients and data are smooth (interior `Hᵏ`/Schauder estimates).
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
-- De Giorgi–Nash–Moser interior regularity of the weak solution:
-- theorem weakSolution_holderOn (hu : IsWeakSolution L u f) (hcompact : K ⊆ Ω) (hK : IsCompact K) :
--     ∃ α ∈ Set.Ioc (0:ℝ) 1, HolderOnWith C α u K
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
- **Uniform ellipticity** with *explicit* constants `0 < λ ≤ Λ`:
  `λ‖ξ‖² ≤ aⁱʲ(x) ξᵢ ξⱼ ≤ Λ‖ξ‖²`. Almost every estimate's constant depends on `λ, Λ, n`
  and the domain only, so make that dependence visible, not hidden in a `∃ C`.
- **Coefficient regularity is a *dial*, and it selects the theory:**
  - *bounded measurable* `aⁱʲ` gives **divergence form**, **weak** solutions, De Giorgi–Nash–Moser;
  - *Hölder* `aⁱʲ ∈ C^{0,α}` gives **Schauder** `C^{2,α}` estimates (classical solutions);
  - *continuous / VMO* `aⁱʲ` gives **Calderón–Zygmund** `W^{2,p}` estimates (strong solutions).
  Keep these lanes distinct; do not state one result and silently assume the regularity of
  another.

"Named and separate" describes the hypotheses a statement carries, not new vocabulary to
define. Follow "Use Mathlib's vocabulary" in the top-level README: a coefficient bound is the
inline hypothesis `∀ x ∈ Ω, ‖b x‖ ≤ β`, never a bespoke boundedness predicate, because Mathlib
states such bounds inline and has `Bornology.IsBounded` when no constant is needed. Uniform
ellipticity is the case that does earn a named definition: its two-sided bound
`λ‖ξ‖² ≤ aⁱʲ ξᵢ ξⱼ ≤ Λ‖ξ‖²` has no Mathlib spelling, so define it once, with explicit `λ, Λ`.

## Getting the statements right

[GeometricMeasureTheory](../GeometricMeasureTheory/README.md), G3–G6, extends this roadmap's
weak-derivative and `W¹,¹` APIs to distributional BV, finite perimeter, scalar coarea, BV
compactness, and BV traces. Lane A retains ownership of Sobolev spaces, smooth density,
Sobolev Poincaré and domain trace/extension theory; GMT proves agreement of its BV versions
with those canonical constructions. [Isoperimetry](../Isoperimetry/README.md), I3 and I5,
owns sharp periodic Wirtinger with equality, and the sharp whole-space BV Sobolev inequality
with its extremizers. Lane A's general embedding and nonsharp estimates are independent
of those sharp results; no second weak-derivative or trace definition is introduced.

A few cross-cutting rules for the *shape* of a PDE statement: which hypotheses it carries
and which notion it names. These recur across the lanes below, and getting them right at
statement time is what keeps the formalized API reusable.

- **Name the solution concept.** State whether a theorem is about *classical* (`C²`, the
  PDE holds pointwise), *strong* (`W^{2,p}`, a.e.), or *weak* (`H¹`, against test
  functions) solutions, and which of these it assumes versus produces. The regularity lane
  is exactly the passage from weak to classical.
- **Build domain Sobolev spaces from weak derivatives, then connect them to the Fourier
  scale.** The PDE workhorse is `W^{k,p}(Ω)` on a domain via weak derivatives; build it,
  then *prove* it agrees with Mathlib's Fourier/Bessel-potential spaces
  (`TemperedDistribution.memSobolev`) on `ℝⁿ` in the range where they coincide
  (`1 < p < ∞`, integer `s`; Calderón). Don't reuse the Bessel definition as the domain
  theory: it is a whole-space notion and the two scales genuinely differ at `p = 1, ∞`.
- **Carry Poincaré's normalization.** `‖u‖ ≤ C‖∇u‖` holds on `W^{1,p}_0(Ω)` (zero trace),
  on `W^{1,p}_Γ(Ω)` for a boundary part `Γ` of positive measure (Poincaré–Friedrichs, Lane G),
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
  divergence-form/weak; its non-divergence-form counterpart is **Krylov–Safonov** (`Lᵖ`
  viscosity / `W^{2,p}` strong). They are different theories, so don't transfer one's
  conclusion under the other's hypotheses.

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
  (Riesz–Thorin and **Marcinkiewicz**, *neither* of which is in Mathlib). BMO and
  John–Nirenberg as a sub-lane.
- **Maximum principles & potential theory:** weak and strong maximum principles, the
  **Hopf lemma**, comparison principles, the **Harnack inequality**, the Newtonian
  potential / fundamental solution of `Δ`, the Green's function, the Poisson kernel on
  `ℝⁿ` (the half-space and the ball), and **Perron's method** for the Dirichlet problem.
- **Mixed and Neumann boundary conditions:** admissible boundary parts, the spaces
  `W^{1,p}_Γ` vanishing on a boundary part, Poincaré–Friedrichs, and the mixed and Neumann
  problems with their spectra.
- **Elliptic existence & regularity:** the energy/weak formulation and Gårding's
  inequality (then Lax–Milgram, *consumed*); interior and boundary `Hᵏ`/`Lᵖ` estimates
  (difference quotients, Calderón–Zygmund); **Schauder** `C^{2,α}` estimates;
  **De Giorgi–Nash–Moser**; eigenvalues of `−Δ` via the compact-self-adjoint spectral
  theorem.
- **Parabolic & evolution equations:** Bochner spaces `L²(0,T;H)`, the Gelfand triple
  `V ↪ H ↪ V*`, the **Galerkin method**, existence for linear parabolic equations, the
  parabolic maximum principle, the **heat semigroup** and **Hille–Yosida**. Lane F also
  owns bounded parabolic Hölder spaces, classical whole-space Schauder theory,
  uniformly continuous traces and spatial weights.

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
5. **Poincaré** on `W^{1,p}_0(Ω)` (bounded `Ω`) and **Poincaré–Wirtinger** (zero mean),
   with explicit constant dependence.
6. **Trace, extension, Rellich.** The **trace operator** `W^{1,p}(Ω) → L^p(∂Ω)` with
   `ker = W^{1,p}_0` (Lipschitz `∂Ω`), an **extension operator** `W^{1,p}(Ω) → W^{1,p}(ℝⁿ)`,
   and **Rellich–Kondrachov**: `W^{1,p}(Ω) ↪↪ L^p(Ω)` **compact** for bounded `Ω` (via
   Fréchet–Kolmogorov / Arzelà–Ascoli). This is the keystone for Lane D and the
   eigenvalue theory.
   This lane owns the common Lipschitz-domain predicate for open Euclidean sets: at each
   frontier point, after an affine isometry, the domain in an open product cylinder is
   the region above a Lipschitz graph over a hyperplane. Supply restriction to smaller
   charts, rigid-coordinate transport, and positive dilation; for bounded domains supply
   a finite chart cover with explicit Lipschitz constants. Use normalized Euclidean
   Hausdorff measure `μHE[n−1]` on the frontier. GMT G6 consumes this predicate for BV
   traces and proves its surface-measure comparisons. The chart-integration formulas for
   Sobolev traces consume GMT G2's area formula, independently of G6's BV trace comparison.
   `C¹` domains satisfy it by a
   proved local-graph comparison; cone conditions are separate hypotheses and do not
   redefine the Lipschitz predicate.
7. **Hölder spaces `C^{k,α}(Ω)`** as Banach spaces, the target spaces for Schauder.
   Include the bounded global variant `C_b^{k,α}(ℝⁿ)`: its norm is the sum of the
   supremum norms of spatial derivatives through k and the spatial α seminorm of
   the kth derivative, using continuous multilinear operator norms for iterated
   Fréchet derivatives. Lane F consumes these spatial trace spaces.

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
11. **BMO and John–Nirenberg** (sub-lane): `BMO(ℝⁿ)`, the John–Nirenberg inequality, and
    the `L^∞ → BMO` endpoint for CZ operators.

### Lane C: maximum principles and potential theory

The classical, constant-coefficient theory; the cleanest lane and a good early win, with
much of the `n=2` case already in Mathlib's complex harmonic-function files.

12. **Mean-value property and smoothness of harmonic functions** on `ℝⁿ` (consume the
    `n=2` complex theory; generalize the mean-value characterization to `ℝⁿ`).
13. **The weak and strong maximum principles** for `Δ` and then for general elliptic `L`
    (sign condition `c ≥ 0`); the **Hopf boundary-point lemma**; the comparison principle.
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
    `a(u,u) ≥ α‖u‖²_{H¹} − β‖u‖²_{L²}` from uniform ellipticity.
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

The deepest lane, and the route from weak to classical solutions; it is the heart of the
classical elliptic theory (Schauder, De Giorgi–Nash–Moser).

20. **Interior `H²`/`Hᵏ` estimates** via difference quotients: a weak `H¹` solution with
    `L²` data is locally `H²`, bootstrapping to `C^∞` for smooth coefficients and data.
21. **Calderón–Zygmund `W^{2,p}` estimates** for strong solutions (consume Lane B): the
    `Lᵖ` theory of `D²u` for `Δu = f`, then variable continuous/VMO coefficients.
22. **Schauder estimates.** Interior and global `C^{2,α}` estimates for `C^{0,α}`
    coefficients (Lane B / Campanato approach), giving classical solvability of the
    Dirichlet problem in `C^{2,α}`.
23. **De Giorgi–Nash–Moser.** Local boundedness and **Hölder continuity** of weak
    solutions of divergence-form equations with **bounded measurable** coefficients, and
    the elliptic Harnack inequality in this generality (De Giorgi's iteration and/or
    Moser's). ⚠ This is *the* hard theorem of the lane, so budget for it accordingly;
    note it is **divergence-form/weak**, whereas the non-divergence analogue is
    Krylov–Safonov.

### Lane F: parabolic and evolution equations

24. **Bochner spaces and the Gelfand triple.** `L²(0,T;V)`, `H¹(0,T;V*)`, the triple
    `V ↪ H ↪ V*` (consume the Bochner integral), and the integration-by-parts/embedding
    `L²(V) ∩ H¹(V*) ↪ C([0,T];H)`.
25. **Linear parabolic existence.** The **Galerkin method**: finite-dimensional
    approximation (consume ODE existence), energy estimates, weak-compactness passage to
    the limit, giving existence/uniqueness for `∂ₜu + Lu = f`, `u(0) = u₀`. The parabolic
    maximum principle.
26. **Semigroups.** The **heat semigroup**, generators, and **Hille–Yosida**; the heat
    kernel on `ℝⁿ` (consume the Fourier transform) and the smoothing estimates.
27. **Classical whole-space parabolic Schauder theory.** Work with scalar real
    functions on `Q=ℝⁿ×[0,T]`, `T>0`, and fix `0<α<1`. Build the following
    interfaces in order; all estimates are global in the spatial variable.

    **F27.1 Spaces, calculus and traces.** Use the parabolic distance
    `d_par((x,t),(y,s))=‖x−y‖+√|t−s|`. Reuse Mathlib's
    [`Metric.Snowflaking`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Topology/MetricSpace/Snowflaking.html#Metric.Snowflaking)
    for time, the native [`WithLp 1` product metric](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/Normed/Lp/ProdLp.html#WithLp.instProdMetricSpace), and
    [`HolderOnWith`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Topology/MetricSpace/Holder.html#HolderOnWith).
    Transport a function through the coordinate homeomorphism to ordinary
    Euclidean space-time before differentiating. Spatial derivatives are
    `iteratedFDeriv ℝ` with their continuous multilinear operator norms.
    On every nondegenerate closed slab `[a,b]`, time derivatives use
    `derivWithin` on `Icc a b`, agreeing with interior derivatives and their
    continuous one-sided endpoint extensions; prove this agreement and
    uniqueness. Supply restriction and time reversal using the same carriers.

    Use native [`BoundedContinuousFunction`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Topology/ContinuousMap/Bounded/Basic.html#BoundedContinuousFunction) (`→ᵇ`) for bounded continuous
    derivative maps. For a map v on the slab subtype, use
    [`eHolderNorm α v`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Topology/MetricSpace/HolderNorm.html#eHolderNorm); require its finiteness (`MemHolder α v`) before
    taking its real value, denoted `[v]_{α,par}`. Native Hölder exponents are
    in `ℝ≥0`. Prove `[v]_{α,par}=sup_{z≠z′} ‖v(z)−v(z′)‖/d_par(z,z′)^α`
    and equivalence with the sum of the separate spatial α and temporal
    α/2 seminorms. For ordinary time slices, define `[v]_{t,γ}` as the real
    value of `⨆ x, eHolderNorm γ (fun t : Icc a b ↦ v(x,t))`, again
    requiring finiteness first. Use this with `γ=(1+α)/2`. For every integer
    `k≥0`, define `C_{par,b}^{k+α}(Q)` by continuous mixed derivatives
    `D_t^r D_x^β u` for `2r+|β|≤k`. Prove by Schwarz/Peano induction that
    every ordering of these factors exists, is continuous on the closed
    slab and agrees, including the one-sided endpoint derivatives.
    Its norm is the sum of their supremum norms, the parabolic α seminorms for `2r+|β|=k`, and the separate
    temporal `(1+α)/2` seminorms for `2r+|β|=k−1` (the last sum is empty
    for k=0). Here β is a spatial multi-index; prove equivalence with
    iterated-Fréchet-derivative operator norms. The time seminorms in this
    definition are required also when k is odd. Prove completeness,
    continuous inclusions between consecutive orders, restriction, product
    and bounded multiplication estimates. The k=0 and k=2 spaces are also
    denoted `C_b^{α,α/2}` and `C_b^{2+α,1+α/2}`.

    In the order-two norm the temporal `(1+α)/2` seminorm of `D_xu` is
    controlled by `C(n,α)([D_x²u]_{α,par}+[u_t]_{α,par})`; prove this
    using spatial centered differences at scale `√|t−s|`. Thus the norm
    obtained by omitting this controlled term is equivalent. For
    any slab `[a,b]` with `a<b` and `0<ε≤min(1,√((b−a)/2))`, prove the
    interpolation bounds
    `‖D_xu‖∞≤C(n)(ε‖D_x²u‖∞+ε⁻¹‖u‖∞)`,
    `‖D_x²u‖∞≤C(n,α)(ε^α[D_x²u]_{α,par}+ε⁻²‖u‖∞)`, and
    `‖u_t‖∞≤C(α)(ε^α[u_t]_{α,par}+ε⁻²‖u‖∞)`.
    Derive absorption of the lower-order spatial/time Hölder norms:
    `‖u‖_{α,par}+‖D_xu‖_{α,par}≤η‖u‖_{2+α,par}+C(n,α,T,η)‖u‖∞`
    for every `η>0`, with T replaced by b−a on `[a,b]`; all constants are
    independent of a. Prove the bounded initial/terminal trace maps into
    Lane A.7's spatial spaces `C_b^{k,α}(ℝⁿ)`, with its specified norm.

    **F27.2 Classical comparison and heat potentials.** Let
    `P u=u_t−a^{ij}u_{ij}−b^i u_i−cu`. Assume a symmetric matrix a and
    `a^{ij},b^i,c∈C_b^{α,α/2}(Q)`, with explicit `0<λ≤Λ` and
    `λI≤a≤ΛI`. Prove comparison for bounded functions continuous on Q,
    classical `C^{2,1}` for `t>0`, using a barrier at spatial infinity and
    a finite-horizon exponential change for c. For bounded f with `Pu≤f`,
    prove
    `‖u⁺‖∞≤exp(C_+ T)(‖u(·,0)⁺‖∞+T‖f⁺‖∞)`,
    where `C_+=max(0,sup_Q c)`; obtain uniqueness by applying comparison
    to differences. This is the classical whole-space theorem, with its
    own proof, rather than an inference from the weak Galerkin theorem.
    Consume Lane F's heat-kernel/semigroup item to construct the Cauchy
    potential `Γ(t)*u₀` and Duhamel potential `∫₀ᵗΓ(t−s)*f(s)ds`.
    F27 owns the pointwise kernel estimates used here: for every m,j≥0,
    `‖∂_t^j D_x^m Γ(x,t)‖≤C(n,m,j)t^{−(n+m+2j)/2}exp(−‖x‖²/(8t))`
    for t>0, as well as positivity, `∫Γ(t)=1`, and
    `∫D_x^m Γ(t)=0` for m≥1. Prove integrability and differentiation under
    these integrals. Prove the potentials' full order-two Hölder estimates
    and trace attainment,
    using `∫D²Γ=0` for the differentiated Duhamel term and estimates of
    both spatial and temporal differences. Reduce each constant symmetric
    elliptic matrix a₀ to the Laplacian by a linear coordinate change.
    Prove that `u↦(u_t−a₀^{ij}u_{ij},u(·,0))` is a bounded linear
    isomorphism from `C_b^{2+α,1+α/2}(Q)` onto
    `C_b^{α,α/2}(Q)×C_b^{2,α}(ℝⁿ)`. F27 owns this isomorphism and its
    Hölder estimates; the semigroup item supplies the kernel.

    **F27.3 Variable coefficients and backward problems.** For the
    coefficients in F27.2 and data `f∈C_b^{α,α/2}(Q)`,
    `u₀∈C_b^{2,α}(ℝⁿ)`, prove existence and uniqueness in
    `C_b^{2+α,1+α/2}(Q)`, the equation `Pu=f`, trace `u(·,0)=u₀`, and
    `‖u‖_{2+α,par}≤K(‖u₀‖_{2,α}+‖f‖_{α,par})`. K depends only on
    n, α, T, λ, Λ and coefficient norms. Prove freezing, interpolation,
    absorption and localization with space-time cutoffs and constants
    independent of the spatial center; obtain a global a priori estimate.
    Cutoffs near the initial slice equal one at t=0 on the smaller patch,
    so the localized estimate retains the initial trace.
    Apply the method of continuity from F27.2's heat operator along a
    uniformly elliptic coefficient path. The estimate is uniform on the
    path; invertibility is open by a Neumann series and closed by applying
    the estimate to differences as the parameter converges. This route
    uses no bounded-cylinder solvability theorem. Export the resulting
    bounded linear initial-data isomorphism `u↦(Pu,u(·,0))`.

    With `R(x,s)=(x,T−s)`, prove R is a parabolic isometry, preserves Q,
    and sends restrictions to the corresponding reversed slabs. If
    `v=u∘R`, `ã=a∘R`, `b̃=b∘R`, `c̃=c∘R`, and
    `P_back u=u_t+a^{ij}u_{ij}+b^i u_i+cu`, prove
    `P_back u=g` iff `P̃v=−g∘R`, with `v(·,0)=u(·,T)`; P̃ is the
    forward operator with reversed coefficients. Export the terminal-data
    isomorphism for P_back, including inhomogeneous traces. Prove
    continuity of the forward and backward inverses in operator norm as
    a,b,c vary in `C_b^{α,α/2}`, locally on uniformly elliptic sets with
    fixed ellipticity and coefficient-norm bounds.

    **F27.4 Uniformly continuous traces.** Here `BUC(ℝⁿ)` means the
    closed vector subspace of `ℝⁿ →ᵇ ℝ` consisting of `UniformContinuous`
    functions. For such u₀ and the coefficients/forcing of F27.3, construct
    a bounded continuous solution on Q, classical for `t>0`, with
    `‖u(·,t)−u₀‖∞→0` as `t↓0` and bounded
    `C_b^{2+α,1+α/2}` norm on every `[δ,T]`, `0<δ<T`.
    Prove the quantitative interior target
    `sup_{0<δ<T} δ^{1+α/2}‖u‖_{2+α,par;[δ,T]}≤C(‖u(·,0)‖∞+‖f‖_{α,par})`
    first for solutions in the base closed-slab space. C depends only on
    n, α, T, ellipticity and coefficient norms. Use time cutoffs on
    `[δ/2,T]`, interpolation at scale `√δ`, and absorption of the weighted
    supremum. The cutoff forcing `χ′u` requires this interpolation step;
    its Hölder norm is not bounded by `‖u‖∞` alone. The weighted supremum
    is finite for each smooth-data approximant before absorption, which
    makes the bound uniform independently of its higher initial norms.
    Use uniform smooth approximation, comparison to make solutions
    uniformly Cauchy, this weighted estimate, and compact-exhaustion
    derivative convergence. Prove uniqueness among bounded functions
    continuous on Q and `C^{2,1}` for `t>0` that solve the equation and
    have the specified initial trace. For a uniformly bounded family
    `g_i:ℝⁿ →ᵇ ℝ`, assume Mathlib's [`UniformEquicontinuous`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Topology/UniformSpace/Equicontinuity.html#UniformEquicontinuous), namely one
    common modulus of continuity on all of ℝⁿ. For fixed coefficients and
    forcing, obtain the quantitative common-modulus estimate
    `‖u_i(·,t)−g_i‖∞≤C(ω(√t)+t(‖g_i‖∞+‖f‖∞))`,
    where ω is a nonnegative nondecreasing common modulus with
    `‖g_i(x)−g_i(y)‖≤ω(‖x−y‖)` and `ω(r)→0` as `r↓0`.
    Prove it by compactly supported unit-mass mollification at scale
    `√t` and classical comparison, including the first/second derivative
    bounds of the mollifications from ω. Thus
    `sup_i ‖u_i(·,t)−g_i‖∞→0` and positive-time estimates are uniform
    over the family. Transport this version by time reversal.

    **F27.5 Every derivative order.** For every integer `k≥0`, take
    `a,b,c,f∈C_{par,b}^{k+α}(Q)` in the full norm of F27.1, the same
    ellipticity, and `u₀∈C_b^{k+2,α}(ℝⁿ)`. Prove that the initial and
    terminal operators are isomorphisms between `C_{par,b}^{k+2+α}(Q)`
    and `C_{par,b}^{k+α}(Q)×C_b^{k+2,α}(ℝⁿ)`, with estimates and
    coefficient/data dependence in these norms. Start the higher-space
    method of continuity from the heat potentials with the corresponding
    higher estimates. Prove the inductive a priori estimate for functions
    already in the higher space, absorbing lower terms via F27.1.
    Spatial differentiation reduces the order by one; use the equation
    to recover time derivatives and their temporal Hölder seminorms.
    Combine this estimate with higher-space continuity and base-space
    uniqueness. A separate regularity proof uses spatial difference
    quotients and the equation, with passage to the derivative limits and
    continuous one-sided endpoint traces. No extra boundary compatibility
    is needed on the whole space. Smooth data and coefficients whose derivatives
    of every required order are bounded and Hölder give solutions in
    every finite-order space. Export the corresponding positive-time
    estimates for F27.4.

    **F27.6 Spatial weights.** Let w(x)>0 be smooth and time-independent,
    with bounded, α-Hölder derivatives of `log w` of positive orders
    1 through `k+2`. There is no boundedness requirement on `log w`
    itself. Define the weighted class by `v=u/w∈C_{par,b}^{k+2+α}(Q)`.
    Prove `(Pu)/w=P_w v` with unchanged a and
    `b_w^i=b^i+2a^{ij}∂_j log w`,
    `c_w=c+a^{ij}(∂_{ij} log w+∂_i log w ∂_j log w)+b^i∂_i log w`.
    The forcing and trace become `f/w` and `u₀/w`. Prove these transformed
    coefficients belong to the required Hölder spaces, then transport
    the estimates, inverses, BUC trace theorem in the weighted uniform
    norm `‖u/w‖∞`, and time reversal.
    Include `w(x)=1+exp(x)` in dimension one, in every finite order.

### Lane G: mixed and Neumann boundary conditions

Boundary conditions imposed on a part of the boundary, built on Lane A's Lipschitz domains and
traces and Lane D's energy method; nothing in Lanes A and D changes.

28. **Admissible boundary parts.** A relatively open `Γ ⊆ frontier Ω` is admissible with
    constant `L` when `Ω` satisfies the Lipschitz-domain predicate of A.6 with constant `L` and,
    at each frontier point, its chart can be chosen so that `Γ` inside the cylinder is the part
    of the graph lying over all of the base, over none of it, or over the region on one side of
    an `L`-Lipschitz graph in the base (after a rotation of the base). Supply the same
    restriction, transport and dilation API as A.6 supplies for the domain predicate, and prove
    that `Γ = ∅` and `Γ = frontier Ω` are admissible for every Lipschitz domain.
29. **Functions vanishing on a boundary part.** For a relatively open `Γ ⊆ frontier Ω` and
    `1 ≤ p < ∞`, `W^{1,p}_Γ(Ω)` is the `W^{1,p}(Ω)`-closure of the restrictions to `Ω` of
    `φ ∈ C_c^∞(ℝⁿ)` with `tsupport φ` disjoint from `closure Γ`. Prove:
    - `W^{1,p}_Γ = W^{1,p}_0` when `Γ = frontier Ω`, for every open `Ω`;
    - `W^{1,p}_∅ = W^{1,p}` for Lipschitz `Ω` (from A.6's extension operator);
    - for admissible `Γ` (item 28),
      `W^{1,p}_Γ(Ω) = {u ∈ W^{1,p}(Ω) | trace u = 0 μHE[n−1]-a.e. on Γ}`. For `Γ = frontier Ω`
      this is A.6's identification `ker(trace) = W^{1,p}_0`, which this item cites rather than
      reproves.
30. **Poincaré–Friedrichs.** For a bounded connected `Ω`, an admissible `Γ` with
    `μHE[n−1] Γ > 0` and `1 ≤ p < ∞`: `‖u‖_p ≤ C ‖∇u‖_p` on `W^{1,p}_Γ(Ω)`. The proof is by
    contradiction from Rellich (A.6), so this constant is an existence statement, not an
    explicit one.
31. **The mixed and Neumann problems.** On a bounded Lipschitz `Ω` with admissible `Γ`, take the
    energy form `a` of D.16, Dirichlet data `g ∈ H¹(Ω)` and Neumann data
    `h ∈ L²(frontier Ω \ Γ, μHE[n−1])`. A weak solution is `u ∈ g + H¹_Γ(Ω)` with
    `a(u, v) = ∫_Ω f v + ∫_{frontier Ω \ Γ} h · trace v` for all `v ∈ H¹_Γ(Ω)`; the Neumann datum
    is the conormal derivative, defined by this identity. Prove:
    - existence and uniqueness when `a` is coercive on `H¹_Γ(Ω)`, in particular for
      `−∂ⱼ(aⁱʲ ∂ᵢ u) + c u` with `c ≥ 0`, `Ω` connected and `μHE[n−1] Γ > 0` (from item 30 and
      Lax–Milgram, as in D.17);
    - the pure Neumann problem (`Γ = ∅`, `c = 0`, `b = 0`, `Ω` connected): a solution exists if
      and only if `∫_Ω f + ∫_{frontier Ω} h = 0`, and it is unique up to an additive constant
      (from Poincaré–Wirtinger, A.5);
    - the Fredholm alternative for the mixed problem, as D.18 does for the Dirichlet problem.
32. **Mixed and Neumann spectra.** As D.19, on `H¹_Γ(Ω)` for a bounded connected Lipschitz `Ω`
    and admissible `Γ`: a compact self-adjoint inverse and an eigenfunction basis; the first
    eigenvalue is positive when `μHE[n−1] Γ > 0`, and for `Γ = ∅` it is `0`, with exactly the
    constants as eigenfunctions.

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
- **Mixed conditions are load-bearing:** on the open unit square with `Γ = {0} × (0,1)`,
  `Γ` is admissible, the mixed problem `−Δu = f`, `u = 0` on `Γ`, `∂_ν u = 0` on the other
  three sides has a unique weak solution, and its first eigenvalue is `π²/4`, attained by
  `sin(π x/2)` (Lane G.31, G.32). With `Γ = ∅` the constant `1` violates
  Poincaré–Friedrichs.
- **Regularity actually upgrades:** exhibit a weak solution that is *only* `H¹` a priori
  and prove it is `C^{0,α}` (Lane E.23), the De Giorgi–Nash–Moser payoff on an example.
- **Maximum principle bites:** a subsolution of `−Δu ≤ 0` attains its max on `∂Ω`
  (Lane C.13), with a counterexample showing the sign condition is necessary.

## References

- L. C. Evans, *Partial Differential Equations*, the default modern graduate text;
  Sobolev spaces (Ch. 5), second-order elliptic (Ch. 6), parabolic/Galerkin (Ch. 7),
  semigroups (Ch. 7), Hamilton–Jacobi & conservation laws.
- A. Lunardi, [*Linear and nonlinear diffusion problems*](https://people.dmi.unipr.it/alessandra.lunardi/LectureNotes/Cortona2004.pdf),
  Cortona lecture notes (2004), Corollary 4.2.10: the whole-space heat Cauchy problem
  in parabolic Hölder spaces; Chapter 3 supplies the interpolation framework.
- D. Gilbarg, N. Trudinger, *Elliptic Partial Differential Equations of Second Order*:
  maximum principles (Ch. 3), Schauder (Ch. 6), `Lᵖ` theory (Ch. 9), De Giorgi–Nash–Moser
  (Ch. 8); the canonical elliptic reference.
- K. Gröger, *A `W^{1,p}`-estimate for solutions to mixed boundary value problems for
  second order elliptic differential equations*, Math. Ann. 283 (1989): mixed boundary
  conditions and the function spaces `W^{1,p}_Γ`.
- S. Bauer, D. Pauly, M. Schomburg, *The Maxwell compactness property in bounded weak
  Lipschitz domains with mixed boundary conditions*, SIAM J. Math. Anal. 48 (2016):
  weak Lipschitz pairs, a bi-Lipschitz generalization of Lane G's admissible boundary parts.
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
(potential theory) is the easiest early win and partly exists in Mathlib already; Lane D
(energy-method existence) is the shortest path to a real PDE theorem because Lax–Milgram
is *already there*; Lane B (harmonic analysis) is the long pole that Lane E's regularity
depends on. Lane E is the deep core of the roadmap, and Lane F and the stretch goals come
last. Lane G needs only Lanes A and D and can proceed alongside Lanes E and F.

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
