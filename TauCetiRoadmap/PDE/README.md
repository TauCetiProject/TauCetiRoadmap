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

1. **Solvability:** for the bounded weak form, coercivity gives a unique
   `H¹` solution for `f∈H^{-1}` (including scalar `L²` data) and boundary data
   with a specified `H¹` lifting. Under a Gårding bound and Rellich, the unshifted
   Fredholm problem is solvable exactly when the corrected forcing annihilates
   the adjoint kernel; solutions then form an affine translate of the kernel.
   At resonance this is neither unconditional existence nor uniqueness.
2. **Regularity:** homogeneous scalar principal-part equations have a locally
   Hölder representative by **De Giorgi–Nash–Moser**, for bounded measurable,
   not necessarily symmetric a. For forcing and lower-order terms, retain the
   explicit data ranges and scaled hypotheses of E20–E23; arbitrary `L²` forcing
   in arbitrary dimension does not imply Hölder regularity. Smooth coefficients
   and data give the interior `Hᵏ` bootstrap, while Hölder divergence-form
   coefficients/data give `C^{1,β}`, not unqualified `C^{2,α}`.
3. **Maximum and Harnack principles:** homogeneous scalar equations with their
   stated sign/coefficient and connectedness assumptions, with distinct classical
   and weak Hopf contracts, and potential theory as the constant-coefficient
   template. Each global/boundary conclusion carries its own domain regularity.

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
-- `-∂ⱼ(aⁱʲ ∂ᵢ u) = 0`. Four things the statement must carry, none of them optional:
-- the estimate is quantitative in `‖u‖` (a constant depending only on `n, λ, Λ, K, Ω` is
-- false: `u_M = M x₁` is harmonic and scales), the exponent is a `ℝ≥0` with `0 < α ≤ 1`,
-- the Hölder conclusion holds for a *representative*, since an `H¹` weak solution is
-- an a.e. equivalence class and may be altered on a null set, and the estimate is stated
-- **on a ball, with its scaling factor**.
--
-- The last point is not presentation. A version over an arbitrary `Ω` and a compact
-- `K ⊆ interior Ω` whose constant depends only on `n, Λ, p₀` is false, because it has no
-- radius or distance-to-boundary dependence: take the Laplacian, `Ω = B r`,
-- `K = closedBall 0 (r/2)` and `u x = x 1`. The Hölder seminorm is of order `r^(1−α)`
-- while `‖u‖_{L^{p₀}(Ω)}` is of order `r^(1 + n/p₀)`, so no `r`-free constant survives as
-- `r → 0`. The constant also depends on the normalized ellipticity ratio `Λ/λ`, not on `Λ`
-- alone, since the equation is invariant under `a ↦ a/λ`.
--
-- So the migration source (Armstrong–Kempe `holder_Moser`, stated on the unit ball for
-- `λ = 1`) is a unit-scale statement, and the rescaling argument that produces the
-- statement at radius `r` is itself part of the milestone. The compact-subset corollary is
-- then derived, with its geometric dependence on `dist K (∂Ω)` explicit rather than hidden
-- in the constant.
-- def holderExponent (n : ℕ) (ratio : ℝ) : ℝ≥0
-- def holderConstant (n : ℕ) (ratio p₀ : ℝ) : ℝ≥0
-- theorem holderExponent_pos … : 0 < holderExponent n ratio
-- theorem holderExponent_le_one … : holderExponent n ratio ≤ 1
--
-- the ball estimate, which is the primitive one:
-- theorem weakSolution_holderOn_ball (hn : 3 ≤ n) (hp₀ : 1 < p₀) (hr : 0 < r)
--     (helliptic : UniformlyElliptic λ Λ a) (hλ : 0 < λ)
--     (hu : IsHomogeneousWeakSolution a u (ball x₀ (2 * r)))
--     (hInt : IntegrableOn (fun x => |u x| ^ p₀) (ball x₀ (2 * r))) :
--     ∃ v, v =ᵐ[volume.restrict (ball x₀ (2 * r))] u ∧
--       HolderOnWith (Real.toNNReal
--           ((holderConstant n (Λ / λ) p₀ : ℝ) *
--             Real.rpow r (-(holderExponent n (Λ / λ) : ℝ) - (n : ℝ) / p₀) *
--             Real.rpow (∫ x in ball x₀ (2 * r), |u x| ^ p₀) (1 / p₀)))
--         (holderExponent n (Λ / λ)) v (ball x₀ r)
--
-- The displayed Bochner integral is a finite nonnegative real by hInt;
-- r,d>0 and p₀>1 make all rpow factors finite. Prove nonnegativity and
-- (Real.toNNReal B : ℝ)=B before deriving this native HolderOnWith statement
-- from the real inequality dist(v x,v y)≤B*dist(x,y)^α. Its constant is NNReal,
-- not ENNReal; no toReal-of-infinity or default integral value is used.
--
-- and the compact-subset corollary, derived from it by a covering argument:
-- theorem weakSolution_holderOn (hn : 3 ≤ n) (hp₀ : 1 < p₀)
--     (helliptic : UniformlyElliptic λ Λ a) (hλ : 0 < λ)
--     (hu : IsHomogeneousWeakSolution a u Ω) (hΩ : IsOpen Ω)
--     (hInt : IntegrableOn (fun x => |u x| ^ p₀) Ω) (hK : IsCompact K) (hKΩ : K ⊆ Ω)
--     (d : ℝ) (hd : 0 < d) (hdist : ∀ x ∈ K, ball x (2 * d) ⊆ Ω) :
--     ∃ v, v =ᵐ[volume.restrict Ω] u ∧
--       HolderOnWith (Real.toNNReal
--           ((holderConstant n (Λ / λ) p₀ : ℝ) *
--             Real.rpow d (-(holderExponent n (Λ / λ) : ℝ) - (n : ℝ) / p₀) *
--             Real.rpow (∫ x in Ω, |u x| ^ p₀) (1 / p₀)))
--         (holderExponent n (Λ / λ)) v K
```

## Standing hypotheses (spell them out)

Take n≥1 for the elliptic inequalities, gradients and boundary theorems below.
Retain dimension0 function spaces and their finite-dimensional algebraic cases;
do not apply a positive-domain Poincaré inequality to zero-dimensional constants.

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
- **Separate zero-boundary and mean normalization.** On a bounded open set,
  `‖u‖_p≤C‖∇u‖_p` holds for closure-defined `W^{1,p}_0`, `1≤p≤∞`, with
  a finite enclosing-width constant and no connectedness assumption. For
  Poincaré–Wirtinger use a nonempty **connected bounded Lipschitz domain**
  (or another explicitly quantified Poincaré domain):
  `‖u−u_Ω‖_p≤C(Ω,p)‖∇u‖_p`. Boundedness or finite measure alone does not
  give this mean-zero theorem. On finitely many components normalize each
  component separately and take their maximum constant; for infinitely many
  require a uniform component constant before asserting a global estimate.
  At p=∞ the zero-boundary closure is not identified with the trace kernel.
- **Pick the embedding regime and domain class.** For n≥2, subcritical `1≤p<n`
  gives the Sobolev exponent `p*=np/(n−p)`; `n<p<∞` gives Morrey exponent
  `1−n/p`; p=∞ has its separate Lipschitz representative theorem. The critical
  p=n case gives BMO/exponential integrability with its stated normalization,
  not an L∞ theorem. For n=1,p=1 use the absolutely continuous/FTOC estimate
  instead. Global domain conclusions require A6's extension hypotheses or
  zero extension from W0; arbitrary open Ω has the appropriate interior form.
- **Use weak compactness for existence; reserve norm compactness for Rellich.** Existence
  arguments run on *weak* sequential compactness of bounded sets in a reflexive space
  (Banach–Alaoglu / `WeakDual`). Norm compactness comes from one place,
  **Rellich–Kondrachov** gives compact `W^{1,p}(Ω)↪L^p(Ω)` on bounded
  Lipschitz/extension domains for finite p, with the separate endpoint proof
  in A6. Arbitrary bounded-open sets use the closure-defined W0/zero-extension
  version. This is the compactness used by the Fredholm/spectral lanes.
- **State maximum principles with their hypotheses.** The weak maximum principle for
  `Lu = -∂ⱼ(aⁱʲ∂ᵢu) + cu` needs `c ≥ 0` (or `Lu ≤ 0` with the right structure); the strong
  principle additionally needs `Ω` connected and, for classical `C²` solutions of a
  non-divergence operator, rests on the **Hopf boundary-point lemma** (for divergence-form
  weak solutions it comes instead from the weak Harnack inequality); Harnack is for nonnegative solutions. Make each of these a named hypothesis.
  The Hopf lemma carries a coefficient and boundary contract of its own, stricter than the
  standing one; see Lane C.13.
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
  `C_c^∞`-closure for every `1≤p≤∞`, finite-p (`1≤p<∞`) Meyers–Serrin
  `H = W` density in orders `k ≥ 2` (order 1, and every order on `ℝⁿ`, are
  consumed from Tau Ceti as in A2), and the agreement theorem with Fourier
  `H^{s,p}` on `ℝⁿ`.
  Keep the infinity spaces and their closure-defined subspaces; do not assign
  them full Sobolev-norm smooth density or whole-space compact-support density.
- **The embedding/trace/compactness package:** Morrey `C^{0,α}` embedding (`p > n`), the
  borderline `p = n` case, **Poincaré** and Poincaré–Wirtinger, the **trace operator** on
  `∂Ω` with kernel `= W^{1,p}_0` for `1≤p<∞`, the separately specified
  endpoint trace without that kernel claim, the **extension operator**, and
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
  parabolic maximum principle, and the concrete **heat semigroup**/kernel realization.
  General `C₀` generators, Hille–Yosida and shared `LinearPMap` resolvents are
  consumed from OneParameterSemigroups/OperatorTheory, as specified in F26.
  F27 additionally owns the complete classical whole-space bounded parabolic
  Hölder spaces, heat-potential estimates, continuity method, backward problems,
  BUC traces, all derivative orders and spatial weights below.

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
   On a bounded interval identify `W^{1,p}` classes with their unique absolutely
   continuous representatives whose derivatives lie in L^p, `1≤p≤∞`, and
   prove the endpoint/Fundamental-Theorem-of-Calculus and integration-by-parts
   identities. At p=2 this is H¹, not the entire class of all absolutely
   continuous functions. Compare A6's two endpoint traces and its finite-p
   closure/kernel statement with the existing interval-derivative partial
   operator in OperatorTheory/UnboundedOperators; that owner retains the
   operator, graph/adjoint and boundary-condition realizations.
2. **Density and `W^{k,p}_0`.** For every open Ω and integer `k≥0`, define
   `W^{k,p}_0(Ω)` as the closure of `C_c^∞(Ω)` in the full `W^{k,p}` norm,
   for **all** `1≤p≤∞`. For `1≤p<∞`, arbitrary-open-set Meyers–Serrin says
   that `C^∞(Ω)∩W^{k,p}(Ω)` is dense, without a boundary hypothesis. For
   `k = 1` this is Tau Ceti's `TauCeti.W1p.dense_contDiffOn_representatives`
   (`TauCeti/Analysis/Sobolev/W1p/MeyersSerrin.lean`, hypothesis `p ≠ ⊤`, for
   an additive Haar measure on a finite-dimensional real inner-product space);
   consume it. Prove the orders `k ≥ 2` here by the same construction: an
   interior exhaustion and locally finite partition of unity, mollification of
   each localized term at a support-preserving radius with summable Sobolev
   errors, and summation using local finiteness and the derivative/convolution
   identities. On `ℝⁿ`, smooth density in every order and `W^{k,p}_0=W^{k,p}`
   for finite p are Tau Ceti's `TauCeti.Wkp.dense_contDiff_representatives`
   (`Wkp/SmoothDensity.lean`) and `TauCeti.wkp0Submodule_top_eq_top`
   (`Wkp/Density.lean`), both under `p ≠ ⊤`; consume them. On a general domain
   that equality is not inferred from smooth-interior density. Preserve `W^{k,∞}` for coefficient
   and solution hypotheses, and develop local mollifier approximation in lower
   norms/weak-* derivative topologies under the appropriate boundedness
   hypotheses; do not assert full `W^{k,∞}`-norm smooth density. The constant1
   on ℝⁿ, `|x|` on (−1,1), and zero-trace `x(1−x)` on (0,1) are endpoint
   acceptance counterexamples.
3. **Reconcile with Mathlib's Bessel-potential scale.** Prove `W^{k,2}(ℝⁿ) = H^{k,2}(ℝⁿ)`
   (and the `1<p<∞` integer-order Calderón agreement) so the two definitions are known to
   coincide where both make sense; *do not* leave them as unrelated theories.
4. **Embeddings.** Consume Gagliardo–Nirenberg–Sobolev for `1≤p<n`.
   Build whole-space Morrey for `n<p<∞` with a Hölder representative of
   exponent `1−n/p`, and the p=∞ local/global Lipschitz version on its
   stated domains. Obtain domain-global estimates through A6's extension
   operator; on arbitrary open sets state interior estimates or use the
   zero-extension class rather than silently assuming an extension exists.
   For n≥2, build the critical p=n BMO/exponential-integrability statements
   with their normalization, not an L∞ embedding. Treat n=1,p=1 separately
   by the absolutely continuous representative/Fundamental Theorem of
   Calculus, which does give the one-dimensional L∞ estimate.
5. **Poincaré and Sobolev–Poincaré.** Prove zero-boundary Poincaré on
   closure-defined `W^{1,p}_0(Ω)` for bounded open Ω and `1≤p≤∞`, first on
   compactly supported smooth functions by integration along a bounded
   coordinate direction, then by the defining norm closure. On a nonempty
   connected bounded Lipschitz domain prove
   `‖u−u_Ω‖_p≤C(Ω,p)‖∇u‖_p`. For finite p use A6's independent extension/
   Rellich construction, a normalized contradiction sequence and the fact
   that a distributional zero gradient on a connected open set is constant.
   At p=∞ use an extension/local Lipschitz representative and a finite
   connected chart-chain/path bound, not finite-p norm density. Build that
   geometric bound for this domain class, retaining its dependence on the
   charts. Provide the componentwise theorem with uniform constants as in
   the normalization rule, and the two-disjoint-balls counterexample to a
   single global mean. On balls prove the scale-compatible Sobolev–Poincaré
   inequality `‖u−u_B‖_{L^{p*}(B)}≤C(n,p)‖∇u‖_{L^p(B)}` for `1≤p<n`;
   this converts Caccioppoli into E21's reverse-Hölder estimate.
6. **Trace, extension, Rellich.** On bounded Lipschitz domains and for
   `1≤p<∞`, construct the bounded trace
   `W^{1,p}(Ω)→L^p(∂Ω,μHE[n−1])`, agreeing with classical restriction,
   and prove `ker(trace)=W^{1,p}_0` in both directions by boundary charts,
   zero extension and inward cutoff/mollification. Construct the bounded
   `W^{1,p}` extension to ℝⁿ. At p=∞ retain a bounded trace from the
   continuous/Lipschitz representative and its agreement with finite-p
   traces on this bounded domain, and extension, but not the false kernel
   equality with the full-norm closure `W^{1,∞}_0`. Keep zero extension
   and its precise trace hypotheses separate from compact-support density.
   Prove Rellich `W^{1,p}(Ω)↪↪L^p(Ω)` for finite p on this bounded
   extension-domain class by extension and translation estimates. At p=∞
   prove the bounded-Lipschitz-domain compactness through uniformly bounded
   equi-Lipschitz extensions and Arzelà–Ascoli on the compact closure,
   not an inapplicable finite-p density proof. Give the distinct arbitrary-
   bounded-open compactness statements for `W^{1,p}_0` via zero extension,
   with finite-p target ranges `1≤q<p*` if p<n, every finite q if p=n,
   and continuous/Hölder compactness below the Morrey exponent if p>n.
   At p=∞ use the zero-extension equi-Lipschitz argument on bounded supports.
   These constructions use no mean-zero Poincaré theorem; A5's mean-zero
   proof may consume them.
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
7. **Hölder and Campanato spaces.** Build the globally finite-norm
   `C^{k,α}(Ω)` Banach spaces, with supremum norms of derivatives through k
   and the kth derivative Hölder seminorm, and their restriction/localization
   API. Distinguish `C^{k,α}_loc` with its compact-exhaustion topology from a
   Banach claim about all locally Hölder functions. Supply the Campanato/Morrey
   characterization used by the excess-decay proofs.
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
    lemma**, and the comparison principle.

    ⚠ The Hopf lemma does **not** inherit the standing hypotheses of this roadmap. Bounded
    measurable divergence-form coefficients do not suffice, even on a domain satisfying an
    interior-ball condition. In the half disk take `a = e_r ⊗ e_r + s² e_θ ⊗ e_θ` with
    `s > 1` and `u = r^s sin θ`. Then `a` is uniformly elliptic and bounded measurable,
    `div(a ∇u) = 0`, `u > 0` inside and `u(0) = 0`, and the inward normal derivative at the
    origin vanishes, since `u` vanishes to order `s > 1`. Nothing here inherits the
    bounded-measurable hypotheses that De Giorgi–Nash–Moser is stated under.

    The first Hopf milestone is the **classical non-divergence** boundary-point lemma
    (Gilbarg–Trudinger, Lemma 3.4). It is stated in Gilbarg–Trudinger's sign convention,
    positive principal part and `c ≤ 0`; negating `L` turns it into the roadmap's
    convention (`c ≥ 0`, hypothesis `Lu ≤ 0`), and the milestone should say which one it
    uses. Operator: `Lu = aⁱʲ∂ᵢ∂ⱼu + bⁱ∂ᵢu + cu` on an open `Ω`, with `a` symmetric,
    `λ‖ξ‖² ≤ ξ · a(x)ξ ≤ Λ‖ξ‖²` for constants `0 < λ ≤ Λ`, and `b`, `c` bounded on `Ω`
    (the barrier needs the upper bound `Λ` as well as `λ`); no continuity of `a`, `b`, `c` is
    needed. Solution: `u ∈ C²(Ω)` with `Lu ≥ 0`
    pointwise in `Ω`. Boundary point: `x₀ ∈ ∂Ω` with an **interior ball** `B ⊆ Ω`,
    `x₀ ∈ ∂B`; `u` is continuous at `x₀` and `u(x₀) > u(x)` for every `x ∈ Ω` (a strict
    boundary maximum). Zero-order sign: `c = 0`; or `c ≤ 0` and `u(x₀) ≥ 0`; or `u(x₀) = 0`
    with no sign on `c`. Conclusion: with `ν` the outer normal of `B` at `x₀`,
    `liminf_{t → 0⁺} (u(x₀) − u(x₀ − tν)) / t > 0`, so the outer normal derivative, *if it
    exists*, is positive; here the normal derivative is the one-sided limit
    `lim_{t → 0⁺} (u(x₀) − u(x₀ − tν)) / t`, since `u` is not defined outside `Ω`, and `B` is
    an open ball (shrinking it so that `∂B ∩ ∂Ω = {x₀}` is harmless). State the liminf form as the theorem and the derivative form as a
    corollary carrying the existence hypothesis. Minimum versions follow by `u ↦ −u` and
    are not separate milestones. The proof is the exponential barrier
    `e^{−κ|x−y|²} − e^{−κR²}` on an annulus of `B` plus the **classical weak maximum
    principle for non-divergence `L`** on `C²(A) ∩ C(Ā)` functions with `Lu ≥ 0`
    (Gilbarg–Trudinger, Theorem 3.1 for `c = 0` and Corollary 3.2 for `c ≤ 0`, with `|b|/λ`
    bounded). That is a named dependency of its own, distinct from the divergence-form weak
    maximum principle for weak solutions. The lemma is in turn the input to the classical
    strong maximum principle for non-divergence `L` (Gilbarg–Trudinger, Theorem 3.5). The
    strong maximum principle for divergence-form weak solutions does not go through Hopf;
    it follows from the weak Harnack inequality (Gilbarg–Trudinger, Theorem 8.19) in
    Lane E. For `a ∈ C¹(Ω)` with bounded first derivatives and classical `C²` solutions,
    `∂ⱼ(aⁱʲ∂ᵢu) = aⁱʲ∂ᵢ∂ⱼu + bⁱ∂ᵢu` holds at every point with the bounded drift
    `bⁱ = ∂ⱼaⁱʲ` (summed over `j`; the principal part only sees `(a + aᵀ)/2`), so that
    case is covered here. For merely Lipschitz `a` the drift exists only almost
    everywhere, the inequality `∂ⱼ(aⁱʲ∂ᵢu) ≥ 0` holds only a.e., and the pointwise lemma
    does not apply as stated: that case uses the a.e. maximum principle for strong
    solutions (the ABP estimate below) in place of Gilbarg–Trudinger, Theorem 3.1.

    A **divergence-form** Hopf lemma for weak solutions is a separate, later milestone, not
    a relaxation of this one, because the barrier proof differentiates `a` and so does not
    run with merely Hölder coefficients. Its source is Rosales, *Generalizing Hopf's
    boundary point lemma* (arXiv:1806.07003), Theorem 4.1 with Remark 4.2, and the
    milestone carries that theorem's contract. The operator is
    `Dᵢ(aⁱʲDⱼu + bⁱu) + cⁱDᵢu + du` with `aⁱʲ` **and** `bⁱ` in `C^{0,α}` on the closed ball,
    `cⁱ ∈ L^q` and `d ∈ L^{q/2}` together with a Morrey-space bound, `q > n`; `b, d` are
    weakly non-positive; `aⁱʲ` is symmetric at the boundary point; and
    `u ∈ C ∩ W^{1,2}` is a weak supersolution with a strict boundary **minimum** (Remark
    4.2 relaxes the value there to `≤ 0` and frees `α` from `1 − n/q`). The theorem is
    stated on the unit ball at `x₀ = −eₙ` with a positive normal **liminf** as
    conclusion, so the restriction to an interior ball and the affine rescaling to that
    normal form are part of the milestone. Its proof consumes Morrey's `C^{1,α}` estimate,
    the weak-solution existence theorem Gilbarg–Trudinger 8.34, and a weak maximum
    principle for weak solutions; these are named dependencies. A normal-derivative
    conclusion additionally needs that derivative to exist, for example from a boundary
    `C^{1,α}` regularity theorem, which is then a further dependency. If the symmetry
    hypothesis is to be dropped, the reduction that removes it is part of the milestone
    and must be written down.

    Separately prove the
    **Aleksandrov–Bakelman–Pucci estimate** for scalar non-divergence-form strong
    solutions; it is the maximum-principle input to Krylov–Safonov in Lane E.24. This
    consumes the `W^{2,n}_loc` strong-solution language from Lane A.1. C13 owns
    the convex-envelope/contact construction used here: for smooth approximants
    with nonnegative boundary values, extend `min(u,0)` by0 to a larger
    enclosing ball and construct its lower convex envelope there. Identify
    the interior negative contact set, prove the
    gradient-image ball inclusion from the boundary depth, and bound that
    image measure by the integral of the Hessian determinant on the contact
    set. Use GMT G2's area formula for the Lipschitz gradient on the compact
    contact pieces, prove the needed local regularity/approximations of this
    envelope, and the ellipticity determinant-to-trace bound. Exhaust/approximate
    to the `W^{2,n}` strong-solution statement with L^n right-hand side. These
    convex/approximation lemmas are constructed here, rather than assumed as
    unnamed measure theory. The estimate additionally
    requires convex envelopes, contact sets, and the measure estimate for the
    gradient/normal map, via an area formula for Lipschitz maps or Alexandrov twice
    differentiability. These inputs are not part of the otherwise-early Lane C theory and
    must be roadmapped explicitly.
14. **The Harnack inequality** for nonnegative harmonic functions, then for general
    elliptic `L` (this feeds De Giorgi–Nash–Moser in Lane E).
15. **Fundamental solution / Newtonian potential** of `Δ` on `ℝⁿ`, the **Green's
    function** and **Poisson kernel** on the ball/half-space, and **Perron's method**:
    existence for the Dirichlet problem `Δu = 0` in `Ω`, `u = g` on `∂Ω`, via subharmonic
    barriers. Pin Φ for **−ΔΦ=δ**, and use −Φ for the Δ convention;
    prove the convolution sign and normalization in each dimension. For a ball,
    construct the harmonic boundary correction from the trace of Φ*f, and prove
    `G_B f=Φ*f−H_B(trace(Φ*f))` with actual trace/weak equality and uniqueness.
    Boundary regularity/data assumptions for classical attainment remain explicit.
    ⚠ Perron yields a harmonic function for *any* bounded `Ω`; **boundary
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
    For boundary data use a specified H¹ lifting g̃ and solve for u−g̃∈H¹_0;
    on rough open sets this quotient condition defines the Dirichlet data,
    while on Lipschitz domains compare it to the actual Sobolev trace. This
    is the first end-to-end PDE theorem and should land early.
18. **The Fredholm alternative (non-coercive case).** For the weak form
    satisfying D16's Gårding bound, add a sufficiently large `L²` shift to
    obtain the coercive isomorphism `H¹_0→H^{-1}`. Use A6's compact
    `H¹_0↪L²` inclusion to reduce the original operator to identity minus
    compact. Consume FredholmAlternative to prove finite-dimensional kernel,
    closed range, index0, and the precise range formula: corrected forcing
    ℓ is solvable iff `ℓ(w)=0` for every w in the **weak adjoint kernel**
    `{w | ∀v, a(v,w)=0}` (the real bilinear convention here). Solutions are
    one particular solution plus `ker L`; prove uniqueness modulo that
    kernel and uniqueness when it is zero. Nonsymmetric a does not permit
    replacing the adjoint kernel by the kernel of L. For nonzero boundary
    data first choose an H¹ lifting g̃ and use ℓ=f−L g̃. State the dual
    pairing and the shift/compact reduction, not an unconditional
    existence-and-uniqueness promise at resonance.
19. **Spectrum of `−Δ`.** The Dirichlet eigenvalues/eigenfunctions of `−Δ` on a bounded
    `Ω`: a compact self-adjoint inverse (Rellich plus Lax–Milgram), then the eigenfunction
    basis from `InnerProductSpace/Spectrum`. The model **Sturm–Liouville** /
    separation-of-variables payoff. Consume the implemented Tau Ceti
    `Variational/Spectrum` and `Variational/Rayleigh` real coercive-form APIs.
    VariationalMethods supplies generic direct minimization (V1.4), the
    complex and shifted coercive-energy adapters (V2.3, V2.4), ordered
    constrained minima (V4.1) and the form-domain/`LinearPMap` operator
    comparison (V5.1, V5.2); Lane D/E retains the domain,
    boundary-condition and elliptic-regularity constructions.


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
    acquires scaled data norms: scalar `f∈L^q`, `q≥1`, `q>n/2`, and
    divergence datum `F∈L^s`, `s>n`, with the Hölder exponent restricted by
    their positive Morrey gains as well as the homogeneous exponent. Prove
    the corresponding data-to-Caccioppoli/iteration estimates; no arbitrary
    L² forcing is substituted for these assumptions. Then treat `b` and `c`, whose contributions enter through
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
    solution, not in the structural constants alone. The n≥3 migration cut
    does not erase n=1,2 from the scalar theorem: supply the one-dimensional
    absolutely continuous/flux argument, and the two-dimensional iteration
    using A4/A5's finite-q critical Sobolev–Poincaré estimates and E23's same
    Caccioppoli/truncation machinery, with their separate constants.

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

The stable identifiers in this lane are **F24** (Bochner/Gelfand), **F25**
(Galerkin), **F26** (heat realization) and **F27.1–F27.6** (classical Schauder).
Use these lane-qualified IDs in every cross-reference: E24–E26 denote the
non-divergence elliptic items, whereas F24–F26 denote these evolution items.
F27 always denotes the complete classical whole-space programme below.

24. **F24 — Bochner spaces and the Gelfand triple.** `L²(0,T;V)`, `H¹(0,T;V*)`, the triple
    `V ↪ H ↪ V*` (consume the Bochner integral), and the integration-by-parts/embedding
    `L²(V) ∩ H¹(V*) ↪ C([0,T];H)`.
25. **F25 — Linear parabolic existence.** The **Galerkin method**: finite-dimensional
    approximation (consume ODE existence), energy estimates, weak-compactness passage to
    the limit, giving existence/uniqueness for `∂ₜu + Lu = f`, `u(0) = u₀`. The parabolic
    maximum principle.
26. **F26 — Heat realization and concrete evolution applications.** Consume the general
    `C₀` semigroup, generator, growth/resolvent, Hille–Yosida and Lumer–Phillips
    APIs from [OneParameterSemigroups Part A](../OneParameterSemigroups/README.md#part-a--strongly-continuous-semigroups),
    using the shared native `LinearPMap` and `TauCeti.LinearPMap` resolvent
    vocabulary of [OperatorTheory](../OperatorTheory/README.md#ownership-boundaries).
    PDE owns the Gaussian kernel, its convolution semigroup on `L^p(ℝⁿ)` for
    `1≤p<∞` and on `BUC(ℝⁿ)`, its strong continuity and contraction bounds,
    and the exact closed generator. On L^p its domain is the u∈L^p whose
    distributional Δu is in L^p, with `C_c^∞` as a graph core; do not replace
    this by an unsupported full `W^{2,1}` assertion at p=1. On BUC the domain
    consists of u whose distributional Δu has a BUC representative, with the
    graph core of smooth functions with every derivative bounded. Construct
    this core by heat smoothing/graph convergence; `C_c^∞` is not uniformly
    dense in BUC and is not its proposed core. Prove both domain equalities
    and the actual action Δ, using distributional identities and integration
    of the convolution derivative before applying abstract generator uniqueness.
    Do not assert strong continuity on all `L^∞`; prove the BUC realization and
    compatible positive-time action on bounded data separately. Use the shared
    resolvent convention `(λI−A)⁻¹`; the heat generator is A=Δ, while the
    nonnegative elliptic operator in Lane D is −Δ. Construct the Fourier/kernel
    equality with the fixed2π convention, Duhamel formula, smoothing estimates
    and the comparison with the variational Dirichlet heat realization on bounded
    domains. Nonautonomous Galerkin equations in F25 are not a one-parameter
    semigroup without time independence. General generation is consumed, not
    redefined or re-proved in a second PDE engine.

27. **F27 — Classical whole-space parabolic Schauder theory.** Work with scalar real
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


### Extension lanes: dispersive, quasilinear and stochastic equations

These are part of the programme. Their prerequisites and constructions follow
Lanes A–F; none is implied by the homogeneous DGNM theorem. The identifiers
X1–X3 below do not change the stable F27.1–F27.6 identifiers.

**X0 shared analytic spaces.** Consume native Fourier transforms, tempered
distributions and Bessel potentials with the `2π` convention fixed above.
Build the missing smooth dyadic partition, Bernstein estimates and
Littlewood–Paley square-function theorem here as an extension of Lane B.10.
On ℝ^d distinguish homogeneous spaces (distributions modulo polynomials,
with the specified convergent dyadic reconstruction) from inhomogeneous
spaces. Define `B^s_{p,q}` by the dyadic `ℓ^q(L^p)` norm and prove independence
of the chosen annular cutoffs, completeness, Fourier/Bessel comparisons in
their actual exponent ranges and periodic versions on `𝕋^d=ℝ^d/ℤ^d`.
For noninteger s, write `𝒞^s=B^s_{∞,∞}`; the **little** space `c^s` is the
closure of smooth functions in this norm. Use little spaces when strong
continuity at t=0 or separable random-variable carriers is needed; smooth
functions are not asserted dense in every large `𝒞^s`. Construct Bony's
paraproducts from the dyadic blocks: low–high terms, high–low terms and the
resonant term. Prove the usual product map for exponents α<0<β with
α+β>0 into `𝒞^α`, including local-in-time weighted versions. Products of
two negative-regularity fields are not supplied by this theorem; X3.3–X3.4
construct their particular enhanced Gaussian products. Torus heat estimates
follow by Fourier series/periodization from F26 and the same dyadic estimates.
These are PDE-owned analytic constructions, not assumptions that generic
stochastic calculus has already built them.

**X1 Strichartz estimates for both Schrödinger and wave equations.**

- **X1.1 dispersive kernels and the time-pairing engine.** On ℝ^d with
  Lebesgue measure construct the unitary Schrödinger propagator
  `S(t)=exp(i t Δ)` with Fourier multiplier `exp(-4π² i t |ξ|²)`.
  Prove its group/strong-L²-continuity laws and
  `‖S(t)f‖∞≤(4π|t|)^(-d/2)‖f‖₁` for t≠0, first for Schwartz f and then
  by the proper bounded-operator extension. Set `D=√(-Δ)`, multiplier
  `2π|ξ|`, and construct `W±(t)=exp(±itD)`. For each smooth annular
  dyadic block P_j prove
  `‖W±(t)P_j f‖∞≤C 2^(jd)(1+2^j|t|)^(-(d-1)/2)‖f‖₁` for d≥2.
  This is a stationary-phase/polar-coordinate estimate owned here;
  no unlocalized wave `L¹→L∞` operator is inferred from it.

  Construct the reusable `TT*` time-pairing argument for an L²-energy
  family with decay `|t-s|^(-σ)`. For q,r≥2, σ-admissibility is
  `1/q+σ/r=σ/2`, excluding `(q,r,σ)=(2,∞,1)`; include the energy pair
  `(∞,2)`. State dual exponents with `1/∞=0`. Prove nonendpoint bounds
  by interpolation and fractional time integration. Own the endpoint
  proof: decompose the retarded bilinear pairing into Whitney rectangles
  with `|t-s|≈2^k`, prove the nearby-exponent localized bilinear bounds,
  then use bilinear real interpolation and dyadic summation to get the
  endpoint when σ>1. This precedes the retarded endpoint estimate; do
  not apply Christ–Kiselev at equality of the time exponents. For strict
  time-exponent inequalities prove the retarded truncation lemma separately.
  Consume existing interpolation/Bochner/Lp duality foundations, keeping
  real-linear versus complex-Hilbert adjoints explicit.

- **X1.2 Schrödinger contracts.** For every integer d≥1 call (q,r)
  admissible when `2≤q,r≤∞`, `2/q+d/r=d/2`, and
  `(q,r,d)≠(2,∞,2)`. For any two such pairs and every interval
  `I=[0,T]`, `0<T≤∞`, construct the mild solution of
  `i∂_t u+Δu=F`, `u(0)=f`, and prove
  `‖u‖_(L^q(I;L^r))≤C(‖f‖₂+‖F‖_(L^(q̃')(I;L^(r̃'))))`.
  The Duhamel convention is `u=S(t)f-i∫₀ᵗS(t-s)F(s)ds`.
  Constants are independent of T. Construct by completion of smooth
  data/forcing, prove the distributional equation, `C(I;L²)` when
  the forcing is in the stated dual Strichartz space, and uniqueness
  in the energy/Strichartz solution class through the Duhamel identity.
  Include the d≥3 endpoint `(2,2d/(d-2))`, the d=1 pair `(4,∞)` and
  the energy pair. Prove the analogous full-line homogeneous estimate.
  No `(2,∞,2)` endpoint is promised. Commutation with Bessel/Fourier
  derivatives gives regularity-shifted estimates on their exact domains.

- **X1.3 wave contracts.** For d≥2 let q,r≥2 satisfy
  `1/q+(d-1)/(2r)≤(d-1)/4`, excluding `(q,r,d)=(2,∞,3)`, and put
  `s(q,r)=d/2-d/r-1/q`. For r<∞ prove the full-line homogeneous
  bound `‖W±(t)f‖_(L^q_t L^r_x)≤C‖f‖_(Ḣ^s)`; the energy pair has
  s=0. Construct the Littlewood–Paley summation using q,r≥2 rather
  than interchanging an L∞ norm with a square sum. At r=∞ retain
  the valid endpoint-space bound with `Ḃ^s_{2,1}` on the right,
  including `(∞,∞)` with s=d/2; do not assert the false critical
  `Ḣ^(d/2)→L∞` embedding. Endpoint means q=2 when d≥4 and finite
  `r=2(d-1)/(d-3)`, handled by X1.1, not the excluded d=3 pair.

  For `∂_t²u-Δu=F`, data `(f,g)`, use
  `u=cos(tD)f+D⁻¹sin(tD)g+∫₀ᵗD⁻¹sin((t-s)D)F(s)ds`.
  Besides the finite-r homogeneous Sobolev theorem, prove the following
  explicit retarded bound for all the admissible pairs, including
  spatial-infinity pairs with their Besov summation:

      ‖u‖_(L^q([0,T];L^r)) ≤ C[‖f‖_(Ḃ^s_{2,1}) + ‖g‖_(Ḃ^(s-1)_{2,1})
          + Σ_j 2^(j(s+s̃-1))‖P_j F‖_(L^(q̃')([0,T];L^(r̃')))]

  Initial data and forcing belong to the indicated completed homogeneous
  classes; convergence of this dyadic series defines the solution, and
  constants are independent of T. First prove frequency-localized
  estimates, then the retarded time bounds and reconstruction. Export
  finite-r square-function improvements where their mixed norms justify
  them, without replacing the displayed universally valid ℓ¹ bound by
  an unjustified endpoint Sobolev assertion. Prove energy uniqueness
  and agreement with classical solutions for smooth data. Treat the
  one-dimensional wave equation separately by its two-translation
  d'Alembert formula and corresponding energy/finite-time bounds;
  it has no positive dispersive decay exponent. These results own the
  actual wave and Schrödinger dispersive theory; applications may
  consume them without a second generic propagator engine.

**X2 quasilinear elliptic existence with an actual compact map.**

- **X2.1 global linear input.** Let Ω⊂ℝ^d be a nonempty bounded C¹,¹
  domain, d≥1, fix `q>max(1,d/2)`, `s>max(2,d)`, and choose
  `0<β<min(α_DG,2-d/q,1-d/s,1)` using a proved uniform boundary
  DGNM exponent. For measurable real matrices a with
  `ξ·a(x)ξ≥λ|ξ|²`, `‖a(x)‖≤M` uniformly, construct the weak
  Dirichlet solution of `-div(a∇u)=f+div F`, trace g, for
  `f∈L²∩L^q`, `F∈L^s`, and g admitting a C¹ bounded extension
  to Ω̄. Lax–Milgram acts on u-g∈H¹₀. Prove a global estimate
  `‖u‖_(C^β(Ω̄))≤C(‖g‖_(C¹)+‖f‖₂+‖f‖_q+‖F‖_s)` with
  C depending on d,Ω,λ,M,q,s,β. This is a new boundary/forcing
  consequence to construct, not an unnamed use of interior E23:
  flatten finitely many boundary charts, subtract g, prove the
  boundary Caccioppoli/level-set decay (or the precise reflected
  zero-trace divergence equation), and combine the forced E23
  oscillation estimate and finite covering. Include the d=1
  direct energy/interval embedding argument. Prove continuous
  dependence in H¹ on uniform coefficient changes and data,
  and identify the continuous representative and its boundary trace.

- **X2.2 nonlinear map and homotopy.** Let A:Ω̄×ℝ→Mat(d,ℝ)
  be continuous, uniformly bounded/coercive with the same λ,M,
  and uniformly Lipschitz in the second variable. For v∈C(Ω̄)
  define T(v) to be X2.1's solution with `a(x)=A(x,v(x))`
  and fixed f,F,g. Construct T as an actual map C(Ω̄)→C(Ω̄).
  Uniform convergence of v gives uniform convergence of a;
  subtract the two weak equations and use coercivity to prove
  H¹ convergence. The uniform C^β estimate and Arzelà–Ascoli
  upgrade this to C(Ω̄) convergence. Thus T is continuous and
  maps every set into one fixed bounded C^β ball. It maps a
  sufficiently large closed convex sup-norm ball into itself.
  Consume [BanachAlgebras A8](../BanachAlgebras/README.md#a8-compact-operators-transitive-algebras-and-invariant-subspaces)
  (its real compact-map Schauder cut, which consumes the finite-span
  Brouwer theorem in [AlgebraicTopology Stage2.7](../AlgebraicTopology/README.md)), and obtain
  `u∈H¹`, u-g∈H¹₀, with
  `∫ A(x,u)∇u·∇φ=∫fφ-∫F·∇φ` for every φ∈H¹₀.
  Its representative belongs to C^β(Ω̄) with the same bound.
  Also export the Leray–Schauder realization: solutions of
  u=θT(u), θ∈[0,1], solve the linear equation with right side
  θ(f+div F) and boundary θg, so the same estimate is uniform
  in θ. Derive the needed Leray–Schauder/Schaefer existence adapter from
  that same compact-map theorem: choose R larger than every homotopy
  solution norm, apply Schauder to the compact radial truncation
  `v↦min(1,R/‖T(v)‖)T(v)` on the R-ball (value T(v) when
  its norm is at most R), and exclude a boundary fixed point with
  truncation factor below1 by the homotopy bound. No separate
  unbuilt degree engine is a premise of this application.
  Do not infer compactness from an unspecified quasilinear operator
  or claim uniqueness for arbitrary A(x,u).

- **X2.3 higher regularity and reusable parameter family.** Prove
  continuity/compactness uniformly for parameter families A_η,f_η,F_η,g_η
  with the above common bounds and uniform data convergence;
  produce the compact solution set and upper-semicontinuity conclusion,
  not a continuous single-valued nonlinear solution map absent uniqueness.
  For a C²,α domain, A C¹,α jointly on each bounded u range,
  f C^α, F C¹,α and g C²,α, bootstrap the constructed weak
  solutions to C²,α. Own global boundary Schauder adapters of
  E22/E25: first C^β gives Hölder coefficients, divergence-form
  Schauder gives C¹,β' for a positive β', the non-divergence
  rewritten equation then gives C²,β', and composition plus
  further Schauder yields the stated α. Keep constants on the
  bounded u range and prove the needed composition/chain rules.
  Uniqueness is a separate conclusion only in the linear case
  or under an explicitly proved strong-monotonicity estimate
  for the nonlinear weak operator on H¹₀; it is not an automatic
  consequence of Schauder or Leray–Schauder existence.

**X3 stochastic PDE: analytic Lp and both Da Prato–Debussche models.**

- **X3.0 stochastic/analytic foundations.** On a complete right-continuous
  probability basis let `(β_k)_(k∈ℕ)` be independent real Brownian
  motions relative to that basis. Consume SC's finite-dimensional
  predictable integral/isometry, versions, scalar BDG and localization.
  Construct here the cylindrical-noise integral by finite sums and
  completion, not by assuming a Hilbert-valued Radon Brownian motion
  with identity covariance in infinite dimension. For a Hilbert H,
  prove convergence in L²(Ω;C([0,T];H)) from predictable
  `∫₀ᵀ‖G_t‖_(HS(ℓ²,H))²dt`, initially in expectation, with
  isometry, dimension-independent Hilbert BDG, basis independence
  and local energy stopping; prove these through finite Hilbert
  norm-square Ito/Doob and orthogonal coordinate sums before passing
  to the limit. For the spatial Lp/Bessel spaces used below,
  p≥2, construct the particular integral from the pointwise
  ℓ²-square function, scalar BDG, Fubini and completion of simple
  predictable finite-coordinate data. Prove its stochastic convolution
  estimates; do not identify Hilbert–Schmidt norms with arbitrary
  Banach-valued stochastic-integral norms. This PDE-owned extension
  is beyond SC's finite-dimensional scope.

  Define predictable Bochner Lp spaces, distribution-valued path
  measurability and initial traces; for separable versions use the
  specified little Besov completions. X0 owns paraproduct and
  negative-regularity spaces. F26/F27 own deterministic heat
  realization and parabolic estimates; construct their periodic and
  distributional Besov heat consequences here. No generic C0
  semigroup or stochastic calculus engine is redefined.

- **X3.1 Krylov-type linear analytic Lp theorem.** On ℝ^d, d≥1,
  for every finite p≥2, γ∈ℝ and T<∞, construct the adapted
  distributional solution of

      du = (a^{ij}D_ij u + b^iD_i u + c u + f)dt + Σ_k(σ^{ik}D_i u + ν^k u + g^k)dβ_k,
      u(0) = u₀.

  Coefficients are predictable, uniformly smooth in x with all
  required derivatives bounded; σ and ν and their derivatives
  are ℓ²-valued with uniform bounds. a is real symmetric and
  `2a-σσᵀ≥κI`, κ>0, uniformly in (t,ω,x).
  There is a deterministic common spatial modulus for the highest
  coefficients; no time differentiability is assumed. Put
  `f∈L^p(Ω×[0,T];H_p^γ)`,
  `g∈L^p(Ω×[0,T];H_p^(γ+1)(ℓ²))`, predictably,
  and F₀-measurable u₀ with finite p-moment in
  `B^(γ+2-2/p)_{p,p}`. Define H_p by the existing Bessel-potential
  carrier and prove any normalization-equivalent norm comparison.
  Prove existence/uniqueness with

      E∫₀ᵀ‖u_t‖_(H_p^(γ+2))^p dt + E sup_(t≤T)‖u_t‖_(B^(γ+2-2/p)_{p,p})^p
          ≤ C[E‖u₀‖_(B^(γ+2-2/p)_{p,p})^p
              + E∫₀ᵀ(‖f_t‖_(H_p^γ)^p + ‖g_t‖_(H_p^(γ+1)(ℓ²))^p)dt]

  State continuous paths in that trace space and the test-function
  integral equation; uniqueness is in this solution class.

  Assign the proof in order: Fourier/energy heat estimate (p=2),
  stochastic Littlewood–Paley square-function estimate (p>2),
  constant-coefficient gradient-noise estimate using the strict
  stochastic-parabolicity margin, then spatial freezing, commutator
  estimates, partitions of unity, localization and method of
  continuity with a uniform estimate. These estimates are actual
  targets here; deterministic F27 does not imply them. Fractional
  γ follows multiplier/commutator estimates on X0/Bessel spaces.
  Export stopping/restriction and compatible finite-horizon solutions,
  finite-dimensional/truncated-noise convergence, deterministic-noise-zero
  comparison and coefficient/data stability with uniform bounds.
  Nonlinear locally Lipschitz lower-order perturbations use this
  proved estimate on a short horizon and maximal stopping continuation;
  global existence requires a stated global Lipschitz/linear-growth
  bound or a separately proved dissipative estimate. Boundary-value
  SPDEs require their own boundary/noise compatibility and are not
  silently included in this whole-space statement.

- **X3.2 enhancement and fixed-point prerequisites for singular models.**
  On the unit flat two-torus use normalized Lebesgue measure and
  eigenvalues of -Δ equal to `4π²|k|²`. Define real cylindrical
  space-time white noise on L² by the basis-independent X3.0
  construction, and stationary stochastic convolutions by integrating
  from -∞, on a two-sided Brownian basis with independent future
  increments. For `0<κ<1/12` construct the indicated Wick fields
  as limits of symmetric smooth Fourier cutoffs in every finite
  moment of `C([0,T];c^(-κ))`, allowing an arbitrarily smaller
  negative exponent in the estimates before the final embedding.
  Prove the actual covariance/contraction estimates and their
  summability with dyadic blocks, using Gaussian/Hermite chaos
  and hypercontractive finite-chaos moment bounds. Construct those
  bounds from Gaussian polynomial/orthogonality and the Gaussian
  semigroup before invoking them; they are not assumed from a
  name. Prove independence of mollifier after using its own
  covariance counterterms and identify equal limiting enhanced laws.
  All negative-field products below refer to these limits.

  Prove the periodic heat Schauder/time-weighted estimates and the
  mild-contraction lemma with Bony multiplication. In particular
  for initial data in `c^(-κ)`, use a remainder v continuous into
  `c^(-κ)` with
  `sup_(0<t≤T) t^(3κ/2)‖v_t‖_(c^(2κ))<∞`.
  Positive-time higher regularity follows from the equation and
  the convolution estimates. Establish local uniqueness, adaptedness,
  maximal lifetime and the continuation criterion in this space;
  do not multiply two arbitrary negative distributions.

- **X3.3 two-dimensional stochastic quantization (Φ⁴₂).** For m>0
  solve globally
  `du=(Δu-m²u-:u³:)dt+√2 dW` on the two-torus,
  for each F₀-measurable initial u₀∈c^(-κ) with finite moments
  when moment estimates are asserted. Let Z be stationary OU with
  generator Δ-m² and noise √2, so its covariance is
  `(-Δ+m²)^(-1)`. For a chosen cutoff let `C_ε=E[Z_ε(t,x)²]`,
  constant in t,x, and construct
  `:Z²:=lim(Z_ε²-C_ε)`,
  `:Z³:=lim(Z_ε³-3C_εZ_ε)` by X3.2.
  With u=Z+v the remainder equation is exactly
  `∂_t v=(Δ-m²)v-[v³+3v²Z+3v:Z²:+:Z³:]`,
  v(0)=u₀-Z₀. Construct its local mild solution, then globalize
  by an actual dissipative a-priori estimate for v on [δ,T],
  δ>0: control its L² supremum, gradient L² energy and L⁴
  space-time norm by a finite random function of initial norm,
  δ,T,m and the enhanced-noise norms. Prove this using coercivity
  of v⁴, negative-Besov duality/paraproduct interpolation and Young
  absorption; derive the higher positive-time norm bounds needed
  by the continuation criterion. This is a required producer,
  not an appeal to ordinary DGNM for distributional forcing.
  Prove pathwise uniqueness in the specified remainder class,
  global adapted c^(-κ)-continuous u, and convergence in probability
  on each finite horizon of smooth-noise equations
  `∂_t u_ε=(Δ-m²)u_ε-u_ε³+3C_εu_ε+√2 ξ_ε`
  with initial data converging in c^(-κ) and the same enhanced
  noise coupling. The counterterm sign and factor3 are fixed by
  this displayed expansion. Include cutoff independence, moments
  under corresponding initial moments and the stationary Gibbs
  measure construction as a follow-on: define finite-cutoff
  Wick quartic densities against the massive Gaussian free field,
  prove normalizability/tightness and limiting invariance using
  the finite-dimensional gradient dynamics and solution convergence.

- **X3.4 two-dimensional stochastic Navier–Stokes.** Let H be real
  mean-zero divergence-free L² vector fields on the two-torus,
  Π the Leray projector, A=-ΠΔ and ν>0. For cylindrical W on H
  consider `du+[νAu+Π div(u⊗u)]dt=dW`.
  Let Z solve `dZ+νAZdt=dW` stationarily, covariance
  `(2νA)^(-1)`. Construct
  `:Z⊗Z:=lim(Z_ε⊗Z_ε-C_ε)`,
  `C_ε=E[Z_ε(t,x)⊗Z_ε(t,x)]`, a constant matrix. For
  mean-zero divergence-free u₀∈c^(-κ), the remainder equation is
  `∂_t v+νAv+Πdiv[v⊗v+v⊗Z+Z⊗v+:Z⊗Z:]=0`,
  v(0)=u₀-Z₀. Construct the locally unique adapted mild solution
  in X3.2's weighted space, its maximal lifetime and a precise
  restart/blow-up alternative. Prove continuous dependence on the
  initial and enhanced data and convergence of smooth cutoffs up
  to every bounded stopping time below the maximal lifetime.
  Because C_ε is spatially constant, `Π div C_ε=0`; no
  Φ⁴-style scalar linear drift counterterm is inserted.

  Give the genuine Da Prato–Debussche global conclusion with its
  initial-law qualification. Let μ be the centered Gaussian law
  with covariance `(2νA)^(-1)` on the negative-regularity solenoidal
  space. Construct Galerkin invariant laws μ_N: the finite-dimensional
  convection field preserves enstrophy `‖A^(1/2)u‖₂²` and has
  zero phase-space divergence, so the Gaussian density proportional
  to `exp(-ν‖A^(1/2)u‖₂²)` is invariant under the noisy dynamics.
  Prove μ_N→μ with uniform finite moments of every fixed
  c^(-κ) norm, using a smaller negative exponent before compact
  embedding. Prove tightness of the stationary enhanced/Galerkin
  laws, identification with the local mild equation and its
  pathwise-unique solution, and the invariant-law localization
  argument that its maximal lifetime is infinite for μ-almost
  every initial state and almost every future noise. Obtain a
  global stationary Markov solution, μ invariance, and global
  pathwise solutions for any initial law absolutely continuous
  with respect to μ and independent future Brownian noise.
  The μ-null exceptional set is an actual part of this global
  theorem; do not infer global existence for every deterministic
  rough state from stationarity. Prove the necessary finite-time
  nonexplosion estimate using invariant negative-space moments
  and the local-lifetime/restart bound before taking N→∞.

  Preserve the classical all-initial-data direction separately:
  for an additive covariance Q with
  `Σ_k‖Qe_k‖_(H²)^2<∞` and solenoidal u₀∈H, construct the
  unique global variational/mild two-dimensional solution with
  `u∈C([0,T];H)∩L²(0,T;H¹)` almost surely, moment bounds
  under the corresponding initial moments, and Galerkin convergence.
  Use the actual divergence-free energy cancellation, Hilbert Ito,
  viscosity and BDG/Young/Gronwall. Compare this solution with the
  local paraproduct solution wherever both are defined. The
  cylindrical-identity-noise solution is not asserted to have
  this H¹ energy class: its stochastic background and remainder
  have different regularity. Export periodic pressure recovery,
  zero-mean/incompressibility preservation and stopped uniqueness
  in the stated classes. Neither this two-dimensional programme
  nor its smooth-noise variant claims three-dimensional global
  regularity.

The construction order is X0 and deterministic F26 → X1's dispersive
applications; A/D/E and X2.1 → X2.2–X2.3; SC finite-noise/Brownian
foundations plus X0/F26 → X3.0, then X3.1; X3.0/X0/F26 → X3.2,
then X3.3 and X3.4 separately. Krylov's linear Lp theorem is not a
premise for the singular negative-regularity products, and neither
singular model is a premise of the heat/integral foundations. Tao,
Keel–Tao, Krylov and Da Prato–Debussche supply proof references for
these distinct programmes; their names do not replace the estimates,
carriers and construction obligations stated above.

## Acceptance criteria ("checks along the way")

Concrete sanity checks that rule out vacuous or mis-stated definitions:

- **Spaces agree where they must:** `W^{k,2}(ℝⁿ) = H^{k,2}(ℝⁿ)` (Lane A.3) and
  `ker(trace) = W^{1,p}_0` for `1≤p<∞` on bounded Lipschitz domains
  (Lane A.6); test the separate infinity closure/trace distinction.
- **Poincaré is non-vacuous:** the constant is finite on a concrete bounded `Ω` (e.g. a
  ball) and the inequality genuinely *fails* on `ℝⁿ`. Formalize both directions so the
  hypothesis is known to be load-bearing.
- **End-to-end existence:** the Dirichlet problem `−Δu = f` in a ball, `u = 0` on the
  boundary, has a unique weak solution (Lane D.17), it is **smooth** for smooth `f`
  (Lane E.20), and equals the **Dirichlet Green potential**, or the whole-space
  Newtonian potential minus the actual harmonic function with its boundary trace
  (Lane C.15). First construct this equality for smooth compactly supported data,
  then pass to L² data through the weak/trace solution maps. For the unit ball in
  ℝ³ and f=1, verify u=(1−|x|²)/6: its Newtonian potential is
  (3−|x|²)/6 and the harmonic boundary correction is1/3. This joins all three
  lanes without assigning zero boundary values to the uncorrected potential.
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
- A. Lunardi, [*Linear and nonlinear diffusion problems*](https://people.dmi.unipr.it/alessandra.lunardi/LectureNotes/Cortona2004.pdf),
  Cortona lecture notes (2004), Corollary 4.2.10: the whole-space heat Cauchy problem
  in parabolic Hölder spaces; Chapter 3 supplies the interpolation framework.
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
