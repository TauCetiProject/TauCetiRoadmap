import Mathlib

-- The library, one module per milestone. `Roadmap` may import `ArithmeticHeights`; the converse is
-- forbidden and `scripts/guards.sh` enforces it, so that no `sorry` can reach the library.
import ArithmeticHeights.Arakelov        -- Layers 0.1, 0.2
import ArithmeticHeights.Extension       -- Layer 0.3
import ArithmeticHeights.Absolute        -- Layer 0.4
import ArithmeticHeights.Affine          -- Layer 0.5
import ArithmeticHeights.Northcott       -- Layer 1.1
import ArithmeticHeights.MahlerMeasure   -- Layer 1.2
import ArithmeticHeights.NorthcottTheorem -- Layer 1.3
import ArithmeticHeights.Kronecker       -- Layer 1.4
import ArithmeticHeights.LowerBound      -- Layer 1.5
import ArithmeticHeights.Polynomial      -- Layer 2.1
import ArithmeticHeights.GaussLemma      -- Layer 2.2
import ArithmeticHeights.Gelfond         -- Layer 2.3
import ArithmeticHeights.LinearForm      -- Layer 2.4
import ArithmeticHeights.Matrix          -- Layer 2.5
import ArithmeticHeights.Plucker         -- Layer 3.1
import ArithmeticHeights.Subspace        -- Layer 3.2
import ArithmeticHeights.RowSpace        -- Layer 3.3
import ArithmeticHeights.CauchyBinet     -- Layer 3.4
import ArithmeticHeights.Hadamard        -- Layer 3.4
import ArithmeticHeights.Duality         -- Layer 3.5
import ArithmeticHeights.Laplace         -- Layer 3.6
import ArithmeticHeights.Nonarchimedean  -- Layer 3.6
import ArithmeticHeights.Submodular      -- Layer 3.6
import ArithmeticHeights.NorthcottSubspace -- Layer 3.7
import ArithmeticHeights.SuccessiveMinima -- Layer 4.1
import ArithmeticHeights.MinkowskiSecond -- Layer 4.2
import ArithmeticHeights.QuotientFubini  -- Layer 4.2
import ArithmeticHeights.GramCovolume    -- Layer 4.3
import ArithmeticHeights.RationalLattice -- Layer 4.3
import ArithmeticHeights.NumberFieldLattice -- Layer 4.3
import ArithmeticHeights.Extraction      -- Layer 4.4
import ArithmeticHeights.PrekopaLeindler -- Layer 4.5 (infrastructure)
import ArithmeticHeights.LogConcave      -- Layer 4.5 (infrastructure)
import ArithmeticHeights.GaussMeasure    -- Layer 4.5 (infrastructure)
import ArithmeticHeights.SliceBound      -- Layer 4.5 (infrastructure)
import ArithmeticHeights.ProductOfBalls  -- Layer 4.5 (infrastructure)
import ArithmeticHeights.CubeSlicing     -- Layer 4.5
import ArithmeticHeights.MinimaBasis    -- Layer 4.6
import ArithmeticHeights.Siegel          -- Layer 5.1
import ArithmeticHeights.BombieriVaaler  -- Layer 5.2
import ArithmeticHeights.MixedBall       -- Layer 5.3 (infrastructure)
import ArithmeticHeights.BombieriVaalerField -- Layer 5.3
import ArithmeticHeights.MixedCube       -- Layer 5.4 (infrastructure)
import ArithmeticHeights.BombieriVaalerMaxNorm -- Layer 5.4
import ArithmeticHeights.RowEntryHeight  -- Layer 5.5 (infrastructure)
import ArithmeticHeights.BombieriVaalerEntries -- Layer 5.5
import ArithmeticHeights.RestrictScalars -- Layer 5.6 (infrastructure)
import ArithmeticHeights.BombieriVaalerRelative -- Layer 5.6
import ArithmeticHeights.MonomialIndex    -- Layer 5.7 (infrastructure)
import ArithmeticHeights.AuxiliaryPolynomial -- Layer 5.7
import ArithmeticHeights.UnitHeight   -- Layer 6.1
import ArithmeticHeights.UnitTorsion  -- Layer 6.2
import ArithmeticHeights.Regulator    -- Layer 6.3
import ArithmeticHeights.SUnit        -- Layer 6.4
import ArithmeticHeights.SUnitTheorem -- Layer 6.5
import ArithmeticHeights.SRegulator   -- Layer 6.5

/-!
# Arithmetic heights and Siegel's lemma: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is the
roadmap, `ArithmeticHeights/README.md`, which every `README.md` below refers to.
The statements here suggest Lean forms for the milestones whose names and shapes are most likely
to drift, so that contributors and reviewers converge on them; discharging all of them finishes
neither a layer nor the roadmap.

Everything below is stated against Mathlib's `Mathlib/NumberTheory/Height/` (M. Stoll): the
`Height.AdmissibleAbsValues` class, `Height.mulHeight₁`, `Height.mulHeight`,
`Projectivization.mulHeight`, `NumberField.absMulHeight₁`, and the `Northcott` typeclass. None of
that is restated here; this roadmap consumes it.

## The two halves of this file

**Landed milestones appear as `example`s discharged by the library.** This file imports
`ArithmeticHeights`, so a milestone that has been proved is recorded here as its delivered
statement with the delivered declaration as the proof — a machine-checked index from each finished
milestone to the name that carries it, and the reason `lake build Roadmap` is worth running: if a
name or a shape drifts, this file stops compiling. Definitions are pinned through the lemma that
characterizes them, since several of them deliberately leave their bodies unexposed.

**Open milestones remain `sorry`s**, stated in the vocabulary the finished layers actually
deliver. ⚠ **There are none left.** With Layer 6.5 every milestone of the roadmap is landed, and
this file now carries no `sorry` at all; the convention is kept for the milestones a successor
roadmap will add. The names of open milestones are unqualified inside
`TauCetiRoadmap.ArithmeticHeights` so that the
prototype does not occupy Mathlib's root namespaces: `minorGcd` and `unitBallVolume` are local
to this file, and the theorems about the height of a subspace belong in `Submodule` when they
land. The successive minima were such a name until 4.1 landed them as `ZLattice.successiveMinimum`
in Mathlib's own namespace, beside `ZLattice.covolume`. Every height is Mathlib's
**relative** height over the fixed field unless it carries the `abs` prefix; a constant
transcribed from the literature is an absolute-height constant, and in the relative height it is
raised to `Height.totalWeight K`, exactly as Mathlib's `mulHeight₁_sum_le` carries
`#s ^ totalWeight K`.

## What the landed layers changed about the shapes below

Four of the pinned shapes did not survive contact with the proofs, and the `example`s record the
delivered form rather than the suggested one. The findings are argued in the roadmap, under the
milestones concerned.

* **The rank left the subspace height.** `subspaceMulHeight k V hV` is `Submodule.mulHeight V`:
  the rank is read off `V`, so the height is a total function of the subspace and `mulHeight (V ⊓
  W)` in 3.6 is well formed with no rank supplied. Every Layer 3 and Layer 5 signature stated in
  terms of it loses its rank arguments.
* **`minorDet` is not a definition.** The maximal minors are `exteriorPower.plucker m A.row`, by
  `exteriorPower.plucker_apply`, and the column enumeration is Mathlib's `Finset.orderEmbOfFin`,
  not the `Set.powersetCard.orderIsoOfFin` the milestone named, which does not exist.
* **Cauchy–Binet is ring-generic, and so are its "archimedean specializations".** `det (A Aᵀ) = ∑ₛ
  (det Aₛ)²` needs no ordered field and no real numbers, and the complex form is the same identity
  over a commutative star ring; `NumberField.InfinitePlace.det_map_embedding_mul_conjTranspose_self`
  is the one statement Layers 5.3 and 5.4 consume, at either kind of infinite place.
* **Gelfond's lower half needs hypotheses.** `p ≠ 0`, `q ≠ 0` and a number field — see the ⚠ under
  Layer 2.3 below.
* **Submodularity is a statement about the Arakelov height.** `H(V + W) · H(V ∩ W) ≤ H(V) · H(W)`
  is **false** for the sup-norm `Submodule.mulHeight`, and so are both of its corollaries: the
  lines `ℚ · (1, 1, 1)` and `ℚ · (1, -1, 0)` in `ℚ³` have height `1` each, meet in `0`, and span a
  plane of height `2`. The 3.6 statements below are therefore in `Submodule.arakelovMulHeight`,
  which is the normalization Bombieri–Gubler's Theorem 2.8.13 is stated in; the refutation is
  machine-checked in `ArithmeticHeights/Submodular.lean`, and so, now, is the theorem.
* **A measure does enter Layer 4.1.** Not the definition of the successive minima, and not the
  identification of the zeroth one as the least dilation containing a nonzero lattice point — but
  the bound on it *is* Minkowski's first theorem, so `ZLattice.successiveMinimum_zero_le_one`
  carries a `MeasureSpace`, a `BorelSpace` and `ZLattice.covolume`. And compactness of the body is
  two hypotheses used in two places: boundedness for positivity and for attainment, closedness for
  the gauge dictionary alone.
* **Layer 4.2's citation is off by three theorems.** Minkowski's second theorem is Cassels'
  Chapter VIII §4 **Theorem V**, whose kernel is his Theorem IV; Chapter VIII Theorem II is the
  Rogers–Chabauty inequality for a general distance function, and Chapter VIII Theorem I is the
  sphere case stated through the critical determinant `δ(F₀)`, not the volume, so it is not
  contained in either. And it is the `λ 0 ^ n` bound, not the lower bound, that follows from the
  first theorem applied to a scaled body; the lower bound is the cross-polytope computation.
* **Cassels' Lemma 2 is his Chapter I, Theorem I.** The adapted `ℤ`-basis Cassels' proof of Layer
  4.2 uses is not a fact about the minima at all: Cassels' Chapter VIII Lemma 2 is his Chapter I
  Theorem I, part B — a basis of the lattice triangular against a given independent family —
  applied to the family of Lemma 1. Mathlib has neither, and the second half of Lemma 1 itself,
  that nothing of gauge below the `j`-th minimum lies outside the span of the first `j` vectors,
  is the part Cassels calls obvious and needs a descent on `j`. All three have landed:
  `ZLattice.exists_basis_adapted`, `ZLattice.mem_span_of_gauge_lt_successiveMinimum` and
  `ZLattice.exists_basis_mem_span_int_of_gauge_lt`.
* **The quotient measure of a convex set decomposes because the slab is a fundamental domain.**
  The piece Layer 4.2's upper bound needed — Cassels' display (10), a Fubini decomposition of
  the quotient measure over `span (v 0, …, v (J − 1))` — is `Measure.prod_apply_symm` once
  `F ×ˢ univ` is known to be a fundamental domain for `Λ × 0`. The step with content is the other
  one, that inside `t · B` congruence modulo `L` is congruence modulo `Λ`, which Cassels reads off
  from coordinates and which coordinate-free needs a third fundamental domain,
  `(𝓕_Λ ∩ (A + Λ)) ∪ (𝓕_L ∖ (A + L))`; that is the only place the finiteness of the covolume is
  used. And the scaling step is not a change of variables: each slice is translated by its own
  vector, so no map of the space realizes it. All of this is
  `ArithmeticHeights/QuotientFubini.lean`, whose capstone
  `ZLattice.pow_mul_measure_inter_add_le` is Cassels' Theorem IV in one step.
* **Cassels' Lemma 2 is not on the path to Minkowski's second theorem.** Its adapted `ℤ`-basis is
  how he sees, in coordinates, that the translation of the `J`-th step stays inside the
  sublattice; coordinate-free the sublattice `L ∩ span (v 0, …, v (J − 1))` is at hand and the only
  thing the estimate wants of it is its `ℤ`-rank, which is the `ℝ`-dimension of its span. So the
  upper bound uses only the *first* of the two pieces Mathlib was missing, together with the
  dependence half of Cassels' Lemma 1. The adapted basis is still a milestone — Layer 4.6 wants
  it — but it is not a prerequisite of 4.2.
* **The upper bound is proved on the open dilates, and that is what removes closedness.** For a
  closed body `t · B` contains points of gauge exactly `t`, so congruence modulo `L` inside it is
  congruence modulo the sublattice only for `2 t < λ J` strictly, and the chain needs it at
  `2 t = λ J`. On `{gauge B < t}` — Cassels' own `t𝒴`, which is open — it holds there, and the
  null-set comparison the roadmap flagged as the layer's last open question costs one line:
  a convex set has null frontier, so `μ (interior B) = μ B`.
* **The covolume identity of 4.3 is two computations of the same sum of squares.** With `y` a
  saturated `ℤ`-basis of `V ∩ ℤⁿ` and `p` its tuple of maximal minors, the squared covolume is the
  Gram determinant of `y`, which Cauchy–Binet turns into `∑ₛ pₛ²`; and the height is `√(∑ₛ pₛ²)`
  because the finite places contribute `1`. The archimedean half of Schmidt's proof is therefore
  `ZLattice.covolume_sq_eq_det_gram` plus Layer 3.4, and its finite half is the *primitivity* of
  `p` — over `ℚ` there is no `N(𝔞)` to cancel, both occurrences of it being `1`.
* **Saturation is what makes 4.3 true, and primitivity is where it is spent.** Against a
  finite-index sublattice of `V ∩ ℤⁿ` the covolume grows by the index while the height does not
  move, so the identity fails for an arbitrary `ℤ`-basis of an arbitrary full-rank sublattice.
  `Submodule.gcd_plucker_eq_one` is the one statement that uses the hypothesis, and it needs no
  adapted basis, no Smith normal form and no splitting of the quotient: a prime dividing every
  maximal minor makes the reductions dependent over `ZMod q` — `exteriorPower.plucker_eq_zero_iff`
  of Layer 3.1 over a finite field — and saturation then divides the coefficients of the resulting
  relation by `q`.
* **Mathlib already carried the ambient the number-field case of 4.3 needs.**
  `NumberField.mixedEmbedding.euclidean.mixedSpace` is the mixed space as an inner product space,
  measure-preservingly equivalent to the usual one, and `covolume_integerLattice` computes the
  covolume of `𝓞 K` in it as `2⁻¹ ^ r₂ · √|discr K|` — the degenerate case of 4.3's display. So
  the `K` statement had a setting and a pinned normalization before any of Schmidt's argument was
  formalized, and the landed identity is stated with that covolume as its constant rather than
  with `2^{−r₂ k} |discr K|^{k/2}`, which keeps the constant out of the proof entirely.
* **Over `K` the Steinitz pseudo-basis is the route, and Schmidt's Lemmas 5–6 are never needed** —
  the reverse of what the roadmap advised. Writing `V ∩ (𝓞 K)ⁱ = 𝔞₁ y₁ ⊕ ⋯ ⊕ 𝔞_k y_k` makes the
  index `[σ(Λ) : Λ₀] = N(𝔞)` disappear before it is computed: the archimedean half runs on `y`
  alone and the ideals leave the single factor `N(𝔞₁ ⋯ 𝔞_k)`, which the finite places of the
  Plücker point give back. No ideal class is ever named, and `Submodule.exists_pseudoBasis` needs
  only that a nonzero fractional ideal is invertible — an explicit dual basis `∑ aⱼ bⱼ = 1` — so
  not even `Module.Projective` is invoked.
* **Schmidt's Lemma 4 is one Cauchy–Binet over a commutative star ring.** The mixed space is one,
  so `Matrix.det_mul_conjTranspose_self_eq_sum` of 3.4 applies to it verbatim,
  `exteriorPower.plucker_map` identifies the resulting coordinates with the mixed embedding of the
  Plücker point over `K`, and `Algebra.norm ℝ` descends the identity to `ℝ`. There is no
  decomposition by place, no Lagrange expansion in blocks of `d` rows, and no `(Re, Im)` change of
  variables — so the `2^{−r₂}` never appears in the archimedean half at all.
* **The extraction lemma's third statement is the one with the induction, and it knows about one
  field only.** `exists_linearIndependent_comp_of_lt_finrank_span` mentions neither the subfield
  `F`, nor `E`, nor the map: give it index bounds `m` and the hypothesis that the vectors indexed
  up to `m j` span more than `j` dimensions over `K`, and it selects. The two 4.4 statements the
  roadmap pinned are that lemma with `m j = d · j`, their hypothesis discharged by the counting
  half. So the milestone is two theorems about a tower and one about a vector space, and the bound
  function need not be monotone.
* **The counting half needs nothing of the map but `F`-linearity.** Not injectivity, not
  finiteness of the source or the target, and no relation between `K` and `E` beyond both
  containing `F`: `FiniteDimensional F K` is the file's only finiteness hypothesis. The mixed
  embedding's injectivity — load-bearing in 4.3 — is not used in 4.4 at all, so the arbitrary-tower
  statement is free rather than a generalisation bought with work.
* **Prékopa–Leindler tensorizes, so 4.5's analytic ladder is an induction on a product and not
  on coordinates.** `HasPrekopaLeindler.prod` — the inequality for `μ` and for `ν` gives it for
  `μ.prod ν` — is Tonelli's theorem and nothing else, and it mentions neither `ℝ` nor any
  dimension. With transport along a measure-preserving linear equivalence, the `n`-dimensional
  inequality is then three lines off the one-dimensional one, which is why the file is written
  around a predicate on a measure space rather than around `ℝ ^ n`. Bombieri–Gubler quote
  Prékopa's theorem for `ℝⁿ` whole; only the case `n = 1` has to be proved.
* **Stating 4.5's analytic rungs in `ℝ≥0∞` removes every side condition at once.** Taking the
  majorant `h` as given, with `f x ^ a * g y ^ b ≤ h (a • x + b • y)` as a hypothesis, avoids the
  sup-convolution whose Lebesgue-but-not-Borel measurability is the subject of Prékopa's erratum;
  and because `∫⁻` is defined for every measurable `ℝ≥0∞`-valued function there is no
  integrability hypothesis either. Bombieri–Gubler's C.3.4 says "if the integral is always
  finite"; `LogConcave.setLIntegral_prod_right` has no such hypothesis, and none on the first
  factor beyond its being a real vector space.
* **A symmetric convex set has non-symmetric slices, so 4.5's induction on blocks needs its own
  bound twice, once in each factor.** `A_y = {z | (y, z) ∈ A}` satisfies `A_{-y} = -A_y`, not
  `A_y = -A_y`, and the slice bound is false for a non-symmetric convex set — a small ball far from
  the origin has positive Gauss measure and empty intersection with the body. The remedy is to
  upgrade the bound from sets to even log-concave functions by the layer cake
  (`HasSliceBound.lintegral_le`) and apply it in each factor; that upgrade is also what lets the
  hypothesis "closed" be dropped from the set the bound is applied to, which matters because in the
  induction it is applied to superlevel sets of a marginal.
* **A log-concave even function is largest at the origin, and that is all the `ε`-thickening of
  C.3.8 needs.** Bombieri–Gubler take a limit of slice volumes and dominate it; but the slice
  volume `z ↦ vol_V {y | y + z ∈ Q}` is log-concave by C.3.4 and even because `Q` is symmetric, so
  `LogConcave.le_apply_zero` bounds it by its value at `0` — which is the number being estimated.
  No dominated convergence appears in `CubeSlicing.lean`; the only limit left is
  `exp (-π ε ^ 2) → 1`.
* **Layer 4.6's two cases are `|c| = 1` and `|c| ≥ 2`, and that is where the `max 1 (·)` comes
  from.** Cassels' Lemma 8 replaces the vector `y` that extends the basis across the `j`-th step of
  the flag by a shorter one. `y` is determined only modulo the previous sublattice
  (`ZLattice.extending_congr`), and `a j = c • y + w` with `c` a nonzero integer and `w` in that
  sublattice. If `|c| = 1` then `c • a j` is itself an admissible choice and costs
  `gauge B (a j)` exactly; if `|c| ≥ 2` then `y` has `a j`-coordinate `c⁻¹`, of modulus at most
  `½`, and rounding its remaining coordinates into `[−½, ½]` costs `(∑_{i ≤ j} gauge B (a i)) / 2`.
  Neither bound implies the other — at `j = 0` the sum bound `λ 0 / 2` is the *better* one, and
  `|c| = 1` is exactly the case it is unavailable in — so the delivered statement is a maximum,
  and the minima form inherits `max 1 ((i + 1) / 2)` rather than `(i + 1) / 2`.
* **4.6 is 4.2's adapted basis with a choice made at each step, and none of 4.1's analysis
  reappears.** The flag `ZLattice.flagPart` and the rank-one step `ZLattice.exists_extending` were
  already the content of `ArithmeticHeights/AdaptedBasis.lean`; all 4.6 adds is *which* vector is
  appended. So the general form carries no measure, no closedness and no boundedness of the body,
  using it only through the subadditivity and absolute homogeneity of its gauge; closedness and
  boundedness re-enter only in the minima corollary, the first for the gauge dictionary and the
  second for positivity of the minima.
* **Layer 5.1's height form is its sup-norm form, because the content can be divided out.** For
  a nonzero integer tuple `gcd x * H(x) = max i, |x i|` (`Rat.gcd_mul_mulHeight_intCast`), so the
  height is at most the sup norm and equals it exactly on primitive tuples — and the primitive
  multiple of a kernel vector is again a kernel vector. The restatement therefore buys vocabulary
  rather than strength; what it does *not* buy is invariance under `A ↦ U A`, and supplying that is
  the whole reason 5.2 exists.
* **5.1's exponent is sharp already at `N = M + 1`, and only the factor `N ^ (M / (N − M))` is
  slack.** The equations `B xᵢ = xᵢ₊₁` have kernel the line through `(1, B, …, B ^ M)`, so every
  nonzero integer solution has sup norm at least `B ^ M` against the bound `((M + 1) B) ^ M`;
  `k` such blocks side by side realize the same exponent with `N − M = k`, so the sharpness is not
  an artifact of a one-dimensional kernel. This is `Int.Matrix.exists_forall_pow_le_iSup_abs`.
* **The number-field corollary is a change of normalization on the left and nothing else, and its
  constant cannot be named.** Mathlib's `NumberField.house.exists_ne_zero_int_vec_house_le` bounds
  the *house* of each coordinate; for a tuple of algebraic integers the finite local factors are at
  most `1` and each infinite place is dominated by the house, and the weights `mult v` sum to
  `[K : ℚ]`, which is exactly the root the absolute height takes — so
  `NumberField.absMulHeight_le_iSup_house` transfers the bound with **no constant lost**. The
  constant itself, `c₁ K`, is `private` in Mathlib, so the restatement quantifies over it
  existentially, which is also the shape Bombieri–Gubler's Corollary 2.9.2 has.
* **5.2 needs Layer 3.5, which its pricing does not name.** The roadmap prices it at "3.4, 4.2,
  4.5 and the `ℚ`-case of 4.3", and 4.3 delivers the covolume of the solution lattice as the
  Arakelov height of the *solution space*. Turning that into the minors of `A` is the duality
  theorem `Matrix.arakelovMulHeight_ker_mulVecLin`, and nothing else will do: the Plücker
  coordinates of the kernel are the complementary minors, which is exactly what duality says. The
  `ℚ` spine is one rung longer than advertised, and every rung of it is landed.
* **The constant of Bombieri–Vaaler Theorem 2 is `1` because two powers of two cancel.** Layer 4.2
  bounds `(∏ λ i) · vol B` by `2 ^ n · covol L` and Layer 4.5 bounds `vol B` below by `2 ^ n` for
  `B` the central slice of the unit cube, so the product of the minima is at most the covolume with
  nothing left over (`ZLattice.prod_successiveMinimum_cubeSlice_le_covolume`). A body with a weaker
  slice bound leaves a constant behind — which is what a complex place does in Layer 5.4.
* **The absolute value in `√|det (A Aᵀ)|` is redundant, and so is `A ≠ 0`.** The Gram determinant
  of the rows is a sum of squares of minors (3.4), positive under the rank hypothesis
  (`Int.Matrix.det_pos`), and `Int.Matrix.minorGcd` is a normalized gcd of integers not all zero,
  hence at least `1`. The rank hypothesis itself is `(A * Aᵀ).det ≠ 0`, a condition on the integer
  matrix alone (`Int.Matrix.linearIndependent_row_map_rat_iff`), which subsumes `A ≠ 0`.
* **The basis form needs no `M < N`, and is sharp at `M = N`.** With `N − M = 0` both sides are
  `1`: the empty product on the left, and on the right the Arakelov height of the zero subspace.
  Only the one-vector form needs `M < N`, and there the exponent `1 / (N − M)` makes it
  unremovable.
* **The height form of Theorem 2 is strictly weaker than the sup-norm form.** The vectors realizing
  the successive minima need not be primitive, and by 5.1's `Rat.gcd_mul_mulHeight_intCast` the
  height is the sup norm divided by the content. The height form is nevertheless what Layer 5.4
  generalizes, and `Int.Matrix.exists_linearIndependent_mulVec_eq_zero_prod_mulHeight_le` is its
  `K = ℚ` case, discriminant `1`.
* **Layer 5.3 needs no rank hypothesis on `A`.** The duality theorem of 3.5 identifies the height
  of the solution space with the height of the row space for an arbitrary matrix, and the
  geometric half never looks at `A`; full row rank would only pin `k = N − M`.
* **The two powers of two of Layer 5.2 do not cancel over a number field.** 4.2 contributes
  `2^{d k}` and 4.3 contributes `2^{−r₂ k}`, leaving `2^{k(r₁ + r₂)}`, and the ℓ² unit balls
  leave `ω_k^{r₁} ω_{2k}^{r₂}` under it. The residue `(2^k/ω_k)^{r₁} (2^k/ω_{2k})^{r₂}` is exactly
  the ratio of a cube to a ball, and is what Layer 5.4 removes by slicing cubes instead.
* **The slice bound of 5.3 is an isometry, not an inequality.** At each infinite place the body is
  a euclidean ball, and the slice of a ball by a subspace is a ball of the smaller dimension, so
  `NumberField.mixedEmbedding.volume_preimage_mixedBall_mixedSpan` is an *identity* obtained by
  orthonormalizing a `K`-basis of `V` place by place. Layer 4.5 is not used at all.
* **Layer 4.5 is spent exactly once in the whole roadmap, and 5.4 is what spends it.** 5.3 proves
  the Hermitian inequality with no cube slicing at all, and 5.2 uses the cube case over `ℚ`; the
  product-of-balls form is needed only here, for the polydisc at a complex place. Vaaler says the
  same in the other direction: the Hermitian inequality follows from the max-norm theorem, which
  "is more difficult because it requires the cube-slicing inequality".
* **The anisotropy of 5.4's body is paid in the height, not in the slice bound.** The body one
  writes down first — the unit cube at each real place, the unit polydisc at each complex one —
  has slices of volume `2 ^ k` and `π ^ k`, and those two normalizations cannot be undone by a
  dilation, because the factor a real place wants (`2`) differs from the one a complex place wants
  (`√π`) and an anisotropic dilation does not preserve the subspace being sliced. So
  `NumberField.mixedEmbedding.mixedCube` is normalized to volume-one factors, its slice bound is a
  clean `1`, and the two constants reappear in the height estimate
  `NumberField.mixedEmbedding.mulHeight_le_pow_of_mem_smul_mixedCube`.
* **What survives in 5.4 is `(2/π)^{k r₂}`, and over `ℚ` it is `1`.** `2^{d k}` from 4.2 against
  `2^{−r₂ k}` from 4.3 and `2^{−r₁ k} π^{−r₂ k}` from the body leaves `(2/π)^{k r₂}`, since
  `d = r₁ + 2 r₂`. That is Bombieri–Vaaler's own constant; the form the literature quotes drops it,
  which is a genuine weakening exactly when `K` has a complex place. Like 5.3, 5.4 needs no rank
  hypothesis on `A`.
* **The `Fintype` instance must not appear in the statements about 5.4's body.** `mixedCube` is cut
  out by individual coordinates, so its definition and the convexity, closedness, boundedness and
  interior statements about it mention only the product topology of the mixed tuple space, which
  needs no `Fintype`; Mathlib's `unusedFintypeInType` linter enforces it, and the hypothesis is
  `Finite`, with `Fintype.ofFinite` supplying the sums inside the proofs. The ℓ² body of 5.3 is
  genuinely different — its definition names a norm.
* **The Hadamard inequality 5.5 needs is not the one 3.4 delivers, and it is deduced from it
  rather than proved again.** At an infinite place the local factor of the tuple of minors is a
  Gram determinant `σA (σA)ᴴ` with the *conjugate* transpose, whatever the kind of place, and
  `ℂ` carries no order in which 3.4's two-block argument runs. `Matrix.realify` doubles both the
  rows and the columns, `Matrix.det_realify_mul_transpose` identifies the real Gram determinant
  with the square of the Hermitian one, and real Hadamard then gives the complex inequality
  squared. Doubling only the *columns* — the real matrix `[Re B | Im B]`, whose Gram matrix is
  `Re (B Bᴴ)` — is not enough: `det (B Bᴴ) ≤ det (Re (B Bᴴ))` is a theorem of the same depth.
* **5.5 needs no rank hypothesis, and its exponent is the rank rather than the number of rows.**
  Bombieri–Gubler's Corollary 2.9.7 gets the non-maximal-rank case "by restricting to `R`
  independent rows"; that restriction is a lemma,
  `Matrix.exists_submatrix_row_linearIndependent`, not a hypothesis on the user. Corollary 2.9.7
  itself needs nothing new at all: it *is* 5.4, whose bound is already in terms of the row-space
  height and already carries no hypothesis on `A`.
* **The `√N` of 5.5 is `‖·‖₂ ≤ √N ‖·‖_∞` at an archimedean place, paid once per independent row
  and nowhere else.** It is the only cardinality paid anywhere in Layer 5, and
  `NumberField.arakelovMulHeight_le_mulHeight` — which is where it comes from — needs `ι`
  nonempty, so `[Nonempty ι]` propagates into every entry-height statement.
* **5.6 is the one milestone whose pinned signature survived contact with the proof unchanged.**
  The statement below is the `sorry` this file carried, with the same binders, the same exponents
  and the same normalizations, discharged by the library.
* **Descending the system to `K` is not enough; the conjugates are what make the bound
  basis-free.** Writing the rows of `A` in a `K`-basis of `F` and applying 2.9.8 over `K` gives a
  bound that *depends on the basis* and is false for a bad one: over `ℚ(√2)` the row `(1, √2)` has
  coordinate rows `(1, 0)` and `(0, 1)` in the basis `1, √2`, of height `1` each, but `(1, −1000)`
  and `(0, 1)` in the basis `1, 1000 + √2`. What is basis-free is the *span* of the coordinate
  rows, and the only route to it is Bombieri–Gubler's: the matrix of conjugates spans the same
  space over a field carrying all `r` embeddings, and there 2.9.8 costs `∏ᵢ H_Ar(σ_u Aᵢ)`, which
  is `∏ᵢ H_Ar(Aᵢ) ^ r` because the absolute height is invariant under an embedding.
* **Layer 0 had to grow two statements before 5.6 could quote "`H_Ar(σ A) = H_Ar(A)`".** Layer 0.3
  had the extension law for `Height.mulHeight` only, and 0.4 the embedding-invariance of
  `NumberField.absMulHeight` only; the Arakelov normalization needed both, and got them as
  `NumberField.arakelovMulHeight_pow_finrank` and `NumberField.arakelovMulHeight_rpow_comp`. The
  archimedean half of the first is the same count as for the sup norm, applied to a different
  local factor, so `NumberField.prod_infinitePlace_pow_mult_eq` now states it once for both.
* **"Rearrange the basis by increasing height" is load-bearing, not a flourish.** The product form
  bounds a basis of the solution space, whose dimension `k` exceeds `N − r M` whenever the
  descended system is not of full rank `r M` — which happens already for a single row over `F`
  with all entries in `K`. Dropping the surplus vectors is free, every height being at least `1`;
  dropping the discriminant they carry is not, since `|D| ≥ 1`. The geometric mean of the smallest
  `k'` of `k` numbers is at most the geometric mean of all `k`, which divides the exponent of
  `|D|` down to `(N − r M) / (2 d)` exactly: `Real.exists_injective_prod_pow_le`.
* **The auxiliary field is a compositum, and Layer 5.4 lost its `Fin m` to make room for the
  descended system.** No normality is used, so the field carrying the conjugates is built as
  `⨆ i, (σ i).fieldRange` inside `AlgebraicClosure K` rather than as a normal closure; and the
  invertibility of `(σ_u (e t))` is the non-vanishing of the discriminant, which Mathlib states
  only over an algebraically closed field, so the determinant is computed there and pulled back.
  The descended system has rows indexed by `Fin m × Fin r`, and since 5.4's bound is in terms of
  the row *space* its row index was inert: `NumberField.exists_basis_ker_prod_absMulHeight_le` and
  `Matrix.finrank_ker_mulVecLin` now take an arbitrary row type.
* **The coefficient vector of a polynomial is the whole of Layer 5.7, and it is a linear map.**
  Siegel's lemma produces a vector indexed by the monomials of degree at most `D`; the milestone
  is about the *polynomial* it names, so `MvPolynomial.ofDegreeLE` is stated as a `K`-linear map
  with `MvPolynomial.ofDegreeLE_injective`, which is what carries independence of the solution
  vectors over to independence of the polynomials. The bound is on Layer 2.1's
  `MvPolynomial.mulHeight`, so the degree bound `D` occurs in the hypotheses and not in the
  conclusion: `MvPolynomial.absMulHeight_coeff_degreeLE` makes the exchange.
* **The monomials of bounded degree are a Mathlib gap of exactly one equivalence.** Mathlib has
  `Finsupp.finite_of_degree_le` and, through `Finset.finsuppAntidiag`, stars and bars for degree
  *exactly* `D`; what is missing is the slack variable relating the two, which is
  `Finsupp.degreeLEEquivDegreeEq` and gives `Finsupp.card_subtype_degree_le` — there are
  `(D + r).choose r` monomials of degree at most `D` in `r` variables. The `Fintype` instance is
  noncomputable, by `Fintype.ofFinite`, and the monomials carry no linear order, so Layer 5.7
  installs an arbitrary well-order for the Plücker indexing exactly as Layer 2.2 does.
* **5.6's feasibility hypothesis was about the number of rows and should have been about the
  rank.** The descended system has `K`-rank at most `r · rank A`, not `r M`, because the image of
  `K ^ N` under `A` lies in the `F`-column space of `A`; so `r · rank A < N` already produces
  `N − r · rank A` solutions. That is `Matrix.le_finrank_ker_mulVecRestrict`, and it turned the
  two statements of 5.6 into four. Layer 5.7 quotes the rank form, since vanishing conditions on
  a polynomial are normally given with repetitions.
* **The logarithmic embedding is not the height, and the gap is the place it drops.** Both
  identities the milestone warns about are false, and Layer 6.1 says exactly when each holds:
  `logHeight₁ u = ∑_{w ≠ w₀} (logEmbedding u w)⁺` precisely when `w₀ u ≤ 1`, and
  `2 logHeight₁ u = ∑_{w ≠ w₀} |logEmbedding u w|` precisely when `w₀ u = 1`
  (`NumberField.Units.logHeight₁_eq_sum_posPart_logEmbedding_iff` and
  `..._two_mul_logHeight₁_eq_sum_abs_logEmbedding_iff`). What holds unconditionally is an
  identity, not an inequality: the height plus the dropped coordinate is the ℓ¹ norm, and the
  factor `2` between them is the whole of the two-sided comparison.
* **Northcott's theorem is the discreteness of the unit lattice.** The finiteness of the units of
  bounded height, `NumberField.Units.finite_setOf_logHeight₁_le`, is Northcott's theorem along the
  injection of `(𝓞 K)ˣ` into `K`; with the supremum-norm comparison it gives Mathlib's
  `unitLattice_inter_ball_finite` back, which is the hypothesis Dirichlet's unit theorem rests on.
  Layer 6.1 proves the easy direction and checks the other as an acceptance criterion rather than
  restating Mathlib's theorem.
* **The height of a unit detects torsion by itself, without Kronecker and without the kernel of
  the embedding.** Layer 6.2 asks for `absMulHeight₁ u = 1 ↔ u ∈ torsion K` "from Kronecker (1.4)
  and `logEmbedding_ker`", and neither is on the critical path: 6.1 writes `2 h(u)` as a sum of
  absolute values over the infinite places, a sum of non-negative reals vanishes exactly when
  every term does, and the resulting condition `∀ w, w u = 1` is Mathlib's
  `NumberField.Units.mem_torsion` verbatim. `logEmbedding_ker` would be worse than optional —
  Mathlib derives it *from* `mem_torsion`. Both named routes are kept as acceptance criteria.
* **Where Kronecker is needed is in dropping the unit hypothesis.** A nonzero algebraic integer of
  height one is a root of unity, hence a unit
  (`NumberField.RingOfIntegers.isUnit_of_absMulHeight₁_eq_one`), so "units of height one" is the
  whole of "algebraic integers of height one" and the hypothesis in 6.2 costs nothing. That is
  Layer 1.4 restricted to `𝓞 K`, and it is the only place in 6.2 where 1.4 is used.
* **The bound on the heights of a fundamental system is an existence statement, and that is the
  content rather than a caveat.** A unimodular change of basis multiplies the heights and leaves
  the regulator alone, so no such bound can hold for `fundSystem` or for every fundamental system.
  Layer 6.3's family comes from the successive minima and has nothing to do with Mathlib's; what
  makes it a *fundamental* system is `NumberField.Units.closure_sup_torsion_eq_top_of_span`, a
  basis of `unitLattice K` read back through the kernel of `logEmbedding`.
* **Hadamard's inequality is wanted in the ℓ¹ norm, and Layer 3.4 delivers the ℓ² one.** What
  Layer 6.1 hands over is the ℓ¹ norm of a row, so the ℓ² route would pay `√r` per row and then
  have to give it back; `Matrix.abs_det_le_prod_sum_abs`, the square-matrix corollary added to
  Layer 3.4, stays inside the ordered field and needs no `Real.sqrt` and no analysis. The `2 d` in
  the constant is Layer 6.1's factor `2`, not a loss in Hadamard's inequality.
* **Unit rank zero is where the two bounds meet.** Both products are empty, Hadamard's bound reads
  `R ≤ 1` and the reduced system reads `1 ≤ R`, so `regulator K = 1`
  (`NumberField.Units.regulator_eq_one_of_rank_eq_zero`) — a value Mathlib does not record, having
  only `regulator_pos`. The truncated `2 ^ (r − 1)` of the constant is `1` at `r = 0` and at
  `r = 1`, which is exactly `∏_{i < r} max 1 ((i + 1) / 2) = r! / 2 ^ (r − 1)`.
* **That the bounds are not vacuous has two different sources.** Layer 6.2 puts every member of
  Mathlib's `fundSystem` strictly above height one, because its logarithmic embedding is a basis
  vector of the unit lattice. For an arbitrary fundamental system that argument is unavailable and
  the positivity comes from 6.3 itself: the family has maximal rank because its regulator is the
  regulator of `K`, which is nonzero.
* **The height of an `S`-unit is really a statement about `S`-integers.** Layer 6.4 states the
  display for `x ∈ S.unit K`, and the proof uses only that the local factor `max (|x|_v) 1` is
  trivial away from `S` — which is `|x|_v ≤ 1`, the defining condition of an `S`-*integer*. What
  the `S`-unit condition buys is the same for `x⁻¹`, which is what makes the collection a group
  and is what Layer 6.5 needs; it buys nothing for the height. The library states
  `NumberField.mulHeight₁_eq_of_mem_integer` and derives the milestone's
  `NumberField.mulHeight₁_eq_of_mem_unit` from it.
* **The converse holds in a stronger, height-theoretic form.** The milestone asks only that all
  finite absolute values outside `S` being `1` implies `S`-unit, which is one direction of
  `Set.mem_unit_iff_finitePlace` and costs nothing. `NumberField.mulHeight₁_eq_iff_mem_integer`
  says more: for `x ≠ 0` the height identity *itself* forces `x` to be an `S`-integer, because
  every local factor is at least `1`, so a single place outside `S` with `|x|_v > 1` makes the
  full finite product strictly larger than its part over `S`. That is the sense in which `S`
  cannot be shrunk.
* **Layer 6.4 is one lemma about `WithZeroMulInt.toNNReal`, repeated.** The dictionary
  `NumberField.FinitePlace.mk_apply_eq_one_iff` — `|x|_v = 1` iff `v x = 1` — is an equivalence
  only because the norm of a prime exceeds `1`, which makes that map strictly monotone; Mathlib
  records the size as `IsDedekindDomain.HeightOneSpectrum.one_lt_absNorm` and has the dictionary
  itself only for algebraic integers, as `NumberField.FinitePlace.norm_eq_one_iff_notMem`.
  Everything else in the layer, membership and height alike, is a consequence.
* **Layer 6.5 spends the class group on one statement, and never names the class number.** What
  the rank computation needs of a place `v ∈ S` is a single `S`-unit whose valuation is nonzero at
  `v` and zero at every other prime, and the class of `v` having finite order in
  `ClassGroup (𝓞 K)` produces one: a generator of `v ^ orderOf [v]`. The size of that valuation is
  never computed, so `FractionalIdeal.count` and the factorization API do not appear, and the
  short exact sequence is never exhibited as short exact — rank-nullity over `ℤ` needs only that
  the cokernel be a torsion module.
* **The rank of the `S`-units is computed twice, by disjoint routes.**
  `Set.unit_finrank_numberField` gets `r₁ + r₂ − 1 + |S|` from the class group and Dirichlet's
  theorem, with no analysis; `NumberField.SUnit.finrank_unitLattice` gets the same number as the
  real dimension of the space the `S`-unit lattice fills. Neither proof uses the other, and the
  agreement is checked in both files.
* **Discreteness of the `S`-unit lattice is Northcott's theorem.** Layer 6.1 recorded as an
  acceptance criterion that Mathlib's `unitLattice_inter_ball_finite` *is* Northcott seen through
  the height, and deliberately did not use it as a proof because Mathlib had one. For `S`-units
  Mathlib has nothing and the reading becomes the proof: Layer 6.4's display bounds the height by
  the embedding, and `NumberField.finite_setOfPred_logHeight₁_le` finishes.
* **`S = ∅` recovers `NumberField.Units.regulator`, but not definitionally.** The index type of
  the `S`-logarithmic space is `{w // w ≠ w₀} ⊕ ↥S`, and `α ⊕ Empty` is not `α`;
  `NumberField.SUnit.regulator_empty` is a theorem, proved by transporting the covolume along a
  measure-preserving linear equivalence with `ZLattice.covolume_comap`.
* **The `S`-unit hypothesis, which Layer 6.4 did not need, is what the product formula needs.**
  The height display asks only for `|x|_v ≤ 1` away from `S`; the additive identity
  `NumberField.SUnit.sum_mult_mul_log_add_sum_log` asks for `|x|_v = 1` there, and fails for `2`
  at `S = ∅` — an `∅`-integer that is not an `∅`-unit.
* **The annihilator has to be transported before it has a height.** `Submodule.mulHeight` is
  defined on subspaces of `ι → K`, and the annihilator lives in the dual, so
  `mulHeight V.dualAnnihilator` does not typecheck: the identification along the standard basis is
  part of the statement, not a remark about it.

## ⚠ The roadmap is still preliminary

Milestone names and shapes may change again, including ones already implemented. What is recorded
below as landed is what the library proves today, not a settled API; the `example`s make a later
rename visible here rather than silently leaving this file behind.

The Layer 0.3 signatures are those of
[mathlib4#41606](https://github.com/leanprover-community/mathlib4/pull/41606) and deliberately
carry its names, so that adopting Mathlib's version is a deletion plus an import. Likewise Layer
6.5 follows [mathlib4#40791](https://github.com/leanprover-community/mathlib4/pull/40791).
-/

namespace TauCetiRoadmap.ArithmeticHeights

open Height NumberField Real Module Pointwise IntermediateField

noncomputable section

/-! ## Layer 0: normalizations and the extension dictionary -/

section Arakelov

variable {K : Type*} [Field K] [NumberField K] {ι : Type*} [Fintype ι]

/-- **Layer 0.1 — landed** as `NumberField.arakelovMulHeight` in `ArithmeticHeights/Arakelov.lean`:
the ℓ² norm at the archimedean places, weighted by `InfinitePlace.mult`, and the sup norm at the
finite places. This is the normalization in which the Bombieri–Vaaler constants of Layers 5.3 and
5.4 are stated; `Height.mulHeight` uses the sup norm everywhere. Both live in the library and every
bound says which one it is in.

The zero tuple takes the junk value `1`, as for `Height.mulHeight`: the displayed product is `0`
there, which would falsify `1 ≤ arakelovMulHeight` and both comparisons of Layer 0.2 below, which
are stated without a `x ≠ 0` hypothesis. The definition is pinned here by the displayed formula
away from that value. -/
example {x : ι → K} (hx : x ≠ 0) :
    arakelovMulHeight x =
      (∏ v : InfinitePlace K, (∑ i, v (x i) ^ 2) ^ (v.mult / 2 : ℝ)) *
        ∏ᶠ v : FinitePlace K, ⨆ i, v (x i) :=
  NumberField.arakelovMulHeight_eq hx

/-- **Layer 0.1.** The logarithmic Arakelov height. As everywhere in this development, the
logarithmic height is *defined* as the logarithm of the multiplicative one and never
independently. -/
example (x : ι → K) : arakelovLogHeight x = log (arakelovMulHeight x) := rfl

/-- **Layer 0.1.** The one-variable (affine) case: the Arakelov height of the point `(x : 1)` of
the projective line. Its archimedean local factor is `((v x) ^ 2 + 1) ^ (v.mult / 2)`, so — unlike
in the sup-norm normalization — this is **not** `Height.mulHeight₁ x`; the library refutes the
identification with `NumberField.arakelovMulHeight₁_one`. `Projectivization.arakelovMulHeight` and
its logarithmic companion are the descent to projective space. -/
example (x : K) : arakelovMulHeight₁ x = arakelovMulHeight ![x, 1] := rfl

/-- **Layer 0.1.** The Arakelov height is invariant under scaling, by the product formula, so it
descends to projective space exactly as `Height.mulHeight` does. -/
example (x : ι → K) {c : K} (hc : c ≠ 0) :
    arakelovMulHeight (c • x) = arakelovMulHeight x :=
  NumberField.arakelovMulHeight_smul_eq _ hc

/-- **Layer 0.2, lower comparison.** The sup norm is at most the ℓ² norm at every place. -/
example (x : ι → K) : Height.mulHeight x ≤ arakelovMulHeight x :=
  NumberField.mulHeight_le_arakelovMulHeight _

/-- **Layer 0.2, upper comparison — the lemma that transports the literature's constants into
Mathlib's normalization.** The exponent is `totalWeight K = finrank ℚ K`, the sum of the local
degrees at the archimedean places. `ι` must be nonempty: on the empty index type both heights
take the junk value `1` while the right-hand side is `0`. It is sharp — the library records the
all-ones tuple as attaining it. -/
example [Nonempty ι] (x : ι → K) :
    arakelovMulHeight x ≤ (Fintype.card ι : ℝ) ^ ((totalWeight K : ℝ) / 2) * Height.mulHeight x :=
  NumberField.arakelovMulHeight_le_mulHeight _

/-- **Layer 0.2.** On a subsingleton index type the two normalizations agree — both are `1`, by
the product formula. ⚠ This is *not* `arakelovMulHeight₁ = mulHeight₁`, which is false: already
`arakelovMulHeight₁ (1 : K) = 2 ^ (Height.totalWeight K / 2 : ℝ)` while `mulHeight₁ (1 : K) = 1`.
The one-variable heights are related only by the two comparisons above, applied to `![x, 1]`. -/
example [Subsingleton ι] (x : ι → K) : arakelovMulHeight x = Height.mulHeight x :=
  NumberField.arakelovMulHeight_eq_mulHeight_of_subsingleton _

end Arakelov

section Extension

variable {K L : Type*} [Field K] [Field L] [NumberField K] [NumberField L] [Algebra K L]

/-- **Layer 0.3 (mathlib4#41606) — landed** in `ArithmeticHeights/Extension.lean`. The relative
height over `L` is the `[L : K]`-th power of the relative height over `K`. This and the three
statements after it carry that PR's names. -/
example (x : K) : Height.mulHeight₁ x ^ finrank K L = Height.mulHeight₁ (algebraMap K L x) :=
  NumberField.mulHeight₁_pow_finrank _

/-- **Layer 0.3 (mathlib4#41606).** The tuple form. -/
example {ι : Type*} [Finite ι] (x : ι → K) :
    Height.mulHeight x ^ finrank K L = Height.mulHeight (algebraMap K L ∘ x) :=
  NumberField.mulHeight_pow_finrank _

/-- **Layer 0.3 (mathlib4#41606).** The logarithmic form. -/
example (x : K) : finrank K L • Height.logHeight₁ x = Height.logHeight₁ (algebraMap K L x) :=
  NumberField.finrank_nsmul_logHeight₁ _

/-- **Layer 0.3 (mathlib4#41606).** The logarithmic tuple form. -/
example {ι : Type*} [Finite ι] (x : ι → K) :
    finrank K L • Height.logHeight x = Height.logHeight (algebraMap K L ∘ x) :=
  NumberField.finrank_nsmul_logHeight _

end Extension

section Absolute

/-- **Layer 0.4 — landed** as `NumberField.absMulHeight` in `ArithmeticHeights/Absolute.lean`, with
`NumberField.absLogHeight` beside it: the relative height computed over the field generated by the
coordinates, normalized by the inverse of its degree. This is the tuple analogue of Mathlib's
`NumberField.absMulHeight₁`, which handles the one-variable case through `ℚ⟮x⟯`; the junk value `1`
off the algebraic numbers is inherited. The index type carries `Finite`, as `Height.mulHeight`
does, where the milestone asked for `Fintype`; nothing sums over it.

**Field-extension invariance, the statement the layer exists for.** Over *any* number field
containing the coordinates, the absolute height is the relative height taken to the power
`1 / [K : ℚ]`. With `mulHeight_pow_finrank`, this says the absolute height does not depend on the
field of definition. Mathlib's `NumberField.absMulHeight₁_eq` is the one-variable case. -/
example {K : Type*} [Field K] [NumberField K] {ι : Type*} [Finite ι] (x : ι → K) :
    absMulHeight x = Height.mulHeight x ^ ((finrank ℚ K : ℝ))⁻¹ :=
  NumberField.absMulHeight_eq _

/-- **Layer 0.4.** The absolute height of a tuple restricts to Mathlib's absolute height of an
element, so the two agree where both are defined. -/
example {K : Type*} [Field K] [CharZero K] (x : K) : absMulHeight ![x, 1] = absMulHeight₁ x :=
  NumberField.absMulHeight_eq_absMulHeight₁ _

/-- **Layer 0.4 — scaling invariance, for algebraic scalars.** The algebraicity hypothesis is not
decorative: for `c` transcendental and `x` a nonzero algebraic tuple, `c • x` has a transcendental
coordinate and `absMulHeight (c • x)` is the junk value `1`; the library refutes the unconditional
form. Consequently the descent to `Projectivization K (ι → K)` holds only over a field all of whose
elements are algebraic, `[Algebra.IsAlgebraic ℚ K]` (a number field, or `AlgebraicClosure ℚ`), and
is stated there. -/
example {K : Type*} [Field K] [CharZero K] {ι : Type*} [Finite ι] (x : ι → K) {c : K}
    (hc : c ≠ 0) (hc' : IsAlgebraic ℚ c) :
    absMulHeight (c • x) = absMulHeight x :=
  NumberField.absMulHeight_smul_eq _ hc hc'

end Absolute

section Affine

variable {K : Type*} [Field K] [Height.AdmissibleAbsValues K] {ι : Type*} [Finite ι]

/-- **Layer 0.5 — landed** as `Height.mulHeightAff` in `ArithmeticHeights/Affine.lean`, with
`Height.logHeightAff` beside it: the projective height of the tuple with a coordinate `1`
appended, the tuple analogue of Mathlib's `Height.mulHeight₁`. It is what a bound on a
non-homogeneous quantity — the value of a linear form (2.4), a determinant (2.5) — must be stated
in, since no scaling-invariant quantity can bound one. The appended coordinate is indexed by
`Option ι`, which needs no `Fintype` bookkeeping. -/
example (x : ι → K) : mulHeightAff x = Height.mulHeight fun o : Option ι ↦ o.elim 1 x := rfl

/-- **Layer 0.5.** The affine height dominates the projective height of the tuple, and — unlike
the projective height — the height of each single coordinate. That failure of scaling invariance
is the content of the definition: `Height.exists_mulHeightAff_smul_ne` records it as a theorem. -/
example (x : ι → K) : Height.mulHeight x ≤ mulHeightAff x :=
  Height.mulHeight_le_mulHeightAff _

example (x : ι → K) (i : ι) : Height.mulHeight₁ (x i) ≤ mulHeightAff x :=
  Height.mulHeight₁_le_mulHeightAff _ _

end Affine

/-! ## Layer 1: Northcott, Kronecker, and the Mahler-measure bridge -/

section Northcott

variable {K : Type*} [Field K] [NumberField K]

/-- **Layer 1.1 — landed** as `Projectivization.instNorthcottMulHeight` in
`ArithmeticHeights/Northcott.lean`, together with `Projectivization.instNorthcottLogHeight` and the
finiteness statements behind them, which `Mathlib/NumberTheory/Height/Northcott.lean` records as
its own TODO. They are stated over any field with `Northcott Height.mulHeight₁`, of which a number
field is the case that matters.

⚠ There is no such instance for `Height.mulHeight` on `ι → K`, and none is to be stated:
`mulHeight_smul_eq_mulHeight` puts the whole line `Kˣ • x` at one height, so
`{x | mulHeight x ≤ B}` is infinite for every `B ≥ 1`. Northcott is a property of the projective
height only, and the library refutes the tuple form. -/
example {ι : Type*} [Finite ι] : Northcott (Projectivization.mulHeight (K := K) (ι := ι)) :=
  Projectivization.instNorthcottMulHeight

/-- **Layer 1.2 — the bridge to Mathlib's Mahler measure, landed** as
`NumberField.absMulHeight₁_pow_natDegree` in `ArithmeticHeights/MahlerMeasure.lean`. For an
algebraic number `x` with primitive integer minimal polynomial `f`, the absolute height is the
`deg f`-th root of the Mahler measure of `f`. Stated as an equality of `deg`-th powers so that no
real exponentiation appears. The polynomial is pinned as the primitive `f : ℤ[X]` that is a nonzero
rational multiple of `minpoly ℚ x`; that determines `f` up to sign, and the Mahler measure ignores
the sign (for `x = 1/2`, `f = 2 X - 1`). The hypotheses force `x` algebraic, since `minpoly ℚ x = 0`
otherwise and `0` is not primitive. ⚠ It is **not** `minpoly ℤ x`, which Mathlib defines as `0` off
the algebraic integers, so a statement through `minpoly ℤ x` covers only integral `x` and cannot
feed Northcott's theorem 1.3. This identity is what makes Northcott's theorem and Kronecker's
theorem cheap. `NumberField.exists_isPrimitive_absMulHeight₁_pow_natDegree` is the existence form
the applications use, since no polynomial is given in advance. -/
example {x : ℂ} {f : Polynomial ℤ} (hf : f.IsPrimitive) {c : ℚ} (hc : c ≠ 0)
    (hfx : f.map (Int.castRingHom ℚ) = Polynomial.C c * minpoly ℚ x) :
    absMulHeight₁ x ^ f.natDegree = (f.map (Int.castRingHom ℂ)).mahlerMeasure :=
  NumberField.absMulHeight₁_pow_natDegree hf hc hfx

/-- **Layer 1.3 — Northcott's theorem, in the form with varying degree, landed** as
`NumberField.finite_setOfPred_absMulHeight₁_le_of_finrank_le` in
`ArithmeticHeights/NorthcottTheorem.lean`, over any field of characteristic zero rather than only
over `ℂ`. Mathlib's `NumberField.finite_setOfPred_mulHeight₁_le` fixes the field; this is the
statement that the literature calls Northcott's theorem, and it is what the elliptic-curve and
Diophantine applications need. -/
example (B : ℝ) (D : ℕ) :
    {x : ℂ | IsIntegral ℚ x ∧ absMulHeight₁ x ≤ B ∧ finrank ℚ ℚ⟮x⟯ ≤ D}.Finite :=
  NumberField.finite_setOfPred_absMulHeight₁_le_of_finrank_le _ _

/-- **Layer 1.4 — Kronecker's theorem, landed** as `NumberField.absMulHeight₁_eq_one_iff` in
`ArithmeticHeights/Kronecker.lean`. An algebraic number has absolute height one exactly when it is
zero or a root of unity. The algebraicity hypothesis is not decorative: `absMulHeight₁` takes the
junk value `1` on every transcendental, so the statement without it is false, and the library
refutes it. `Projectivization.absMulHeight_eq_one_iff` is the projective form. -/
example {x : ℂ} (hx : IsIntegral ℚ x) :
    absMulHeight₁ x = 1 ↔ x = 0 ∨ ∃ n, 0 < n ∧ x ^ n = 1 :=
  NumberField.absMulHeight₁_eq_one_iff hx

/-- **Layer 1.5 — landed** as `NumberField.exists_pos_forall_le_absLogHeight₁` in
`ArithmeticHeights/LowerBound.lean`: the lower bound away from one, in the shape Diophantine
arguments consume — for each degree bound there is a uniform positive gap. -/
example (D : ℕ) :
    ∃ c > 0, ∀ x : ℂ, IsIntegral ℚ x → x ≠ 0 → finrank ℚ ℚ⟮x⟯ ≤ D →
      (¬ ∃ n, 0 < n ∧ x ^ n = 1) → c ≤ absLogHeight₁ x :=
  NumberField.exists_pos_forall_le_absLogHeight₁ _

end Northcott

/-! ## Layer 2: heights of polynomials, linear forms, and matrices -/

section Polynomials

variable {K : Type*} [Field K] [Height.AdmissibleAbsValues K]

/-- **Layer 2.1 — landed** as `Polynomial.mulHeight` in `ArithmeticHeights/Polynomial.lean`, with
`Polynomial.logHeight` and the multivariate `MvPolynomial.mulHeight` beside it. The height of a
polynomial is the height of its coefficient `Finsupp`; `Polynomial.coeff` *is* that `Finsupp`, so
no new construction is made. -/
example (p : Polynomial K) : p.mulHeight = Finsupp.mulHeight p.coeff := rfl

/-- **Layer 2.1.** A constant polynomial has height `1`: its coefficient tuple has one entry, and
a one-entry tuple has height `1` by the product formula, with the zero polynomial at the junk
value. ⚠ Not `mulHeight₁ a`, which is the height of the *two*-entry tuple `![a, 1]`; the library
refutes the identification at `a = 2`. -/
example (a : K) : (Polynomial.C a).mulHeight = 1 := Polynomial.mulHeight_C _

/-- **Layer 2.1.** The compatibility with Mathlib's affine height: the linear polynomial with root
`a` has the height of `a`. -/
example (a : K) : (Polynomial.X - Polynomial.C a).mulHeight = Height.mulHeight₁ a :=
  Polynomial.mulHeight_X_sub_C _

/-- **Layer 2.2 — Gauss's lemma for heights, landed** as `Polynomial.iSup_coeff_mul` in
`ArithmeticHeights/GaussLemma.lean`, with a multivariate form beside it. At a nonarchimedean place
the local factor is exactly multiplicative. This is the only place where the ultrametric inequality
is used sharply, and it is what makes the loss in Gelfond's inequality purely archimedean. The
transport from local factors to heights is `Finsupp.mulHeight_le_of_forall_iSup_le` and its
companion, which are what Layer 2.3 instantiates. -/
example {v : AbsoluteValue K ℝ} (hv : IsNonarchimedean v) (p q : Polynomial K) :
    (⨆ n : ℕ, v ((p * q).coeff n)) = (⨆ n : ℕ, v (p.coeff n)) * ⨆ n : ℕ, v (q.coeff n) :=
  Polynomial.iSup_coeff_mul hv _ _

/-- **Layer 2.3 — Gelfond's inequality, upper half, landed** as `Polynomial.mulHeight_mul_le` in
`ArithmeticHeights/Gelfond.lean`. The literature's `2 ^ (deg p + deg q)` is the absolute-height
constant; the relative height picks it up once per archimedean place with multiplicity, hence the
exponent `totalWeight K`. `Polynomial.mulHeight_mul_le_min_natDegree` is the same bound with the
sharp elementary constant `min (natDegree p) (natDegree q) + 1`, which — unlike the power of two —
is attained, and `MvPolynomial.mulHeight_mul_le` is the multivariate form. -/
example (p q : Polynomial K) :
    (p * q).mulHeight ≤
      2 ^ ((p.natDegree + q.natDegree) * totalWeight K) * (p.mulHeight * q.mulHeight) :=
  Polynomial.mulHeight_mul_le _ _

end Polynomials

section GelfondLower

/-- **Layer 2.3 — Gelfond's inequality, lower half, landed** as
`Polynomial.mulHeight_mul_mulHeight_le` in `ArithmeticHeights/Gelfond.lean`. Together with the
upper half this bounds the height of a factor, which is the direction transcendence arguments use.

⚠ **Two hypotheses the milestone did not carry.** `p ≠ 0` and `q ≠ 0` cannot be dropped: the junk
value breaks the inequality at `p = 0`, where the left side is `mulHeight q` — unbounded — against
a right side of `2 ^ (natDegree q * totalWeight K) * mulHeight 0`; over `ℚ` with `q = X - C 100`
that reads `100 ≤ 2`. And the statement cannot be made over a general `[AdmissibleAbsValues K]` at
all: that class puts no condition on `archAbsVal`, so there is no embedding `K →+* ℂ` to run the
Mahler-measure argument through. Over a **number field** every archimedean absolute value is
`NumberField.place φ`, and that is where the lower half lives. The upper half has neither problem,
because it uses only the triangle inequality. -/
example {K : Type*} [Field K] [NumberField K] {p q : Polynomial K} (hp : p ≠ 0) (hq : q ≠ 0) :
    p.mulHeight * q.mulHeight ≤
      2 ^ ((p.natDegree + q.natDegree) * totalWeight K) * (p * q).mulHeight :=
  Polynomial.mulHeight_mul_mulHeight_le hp hq

end GelfondLower

section LinearForms

variable {K : Type*} [Field K] [Height.AdmissibleAbsValues K] {ι : Type*} [Fintype ι]

/-- **Layer 2.4 — landed** as `Height.mulHeight₁_sum_mul_le` in
`ArithmeticHeights/LinearForm.lean`: the value of a linear form against the affine heights of its
coefficients and of the point, with the constant `Nat.card ι ^ totalWeight K`. The affine height of
Layer 0.5 is what appears, and must: `Height.exists_not_mulHeight_add_le` records that the naive
tuple analogue of Mathlib's `mulHeight₁_sum_le` is false over `ℚ` for every constant.
`NumberField.arakelovMulHeight_linearMap_apply_le` is the same bound in the Arakelov
normalization, where the constant is `1`. -/
example [Nonempty ι] (a x : ι → K) :
    Height.mulHeight₁ (∑ i, a i * x i) ≤
      (Nat.card ι : ℝ) ^ totalWeight K * (mulHeightAff a * mulHeightAff x) :=
  Height.mulHeight₁_sum_mul_le _ _

end LinearForms

section Matrices

variable {K : Type*} [Field K] [Height.AdmissibleAbsValues K] {m n : Type*} [Fintype m] [Fintype n]

/-- **Layer 2.5 — landed** as `Matrix.mulHeight` in `ArithmeticHeights/Matrix.lean`, with
`Matrix.logHeight`, the affine `Matrix.mulHeightAff` and the Arakelov `Matrix.arakelovMulHeight`
beside it. The height of a matrix is the height of the tuple of its **entries**. The height of its
row space — the height of the tuple of maximal minors, `H(A)` in Bombieri–Vaaler — is
`(Submodule.span K (Set.range A.row)).mulHeight` and is never called the height of `A`. The
classical literature uses one symbol for both; this library does not. -/
example (A : Matrix m n K) : A.mulHeight = Height.mulHeight fun q : m × n ↦ A q.1 q.2 := rfl

/-- **Layer 2.5.** The height of a matrix is invariant under transpose. -/
example (A : Matrix m n K) : A.transpose.mulHeight = A.mulHeight := Matrix.mulHeight_transpose _

/-- **Layer 2.5.** The submatrix bound. -/
example {m' n' : Type*} [Fintype m'] [Fintype n'] (A : Matrix m n K) (f : m' → m) (g : n' → n) :
    (A.submatrix f g).mulHeight ≤ A.mulHeight :=
  Matrix.mulHeight_submatrix_le _ _ _

/-- **Layer 2.5.** The product bound. The archimedean loss at one place is the inner dimension
`card n` (the triangle inequality on a sum of `card n` terms), so in the relative height it is
`card n ^ totalWeight K`; over `ℚ(i)`, `A = ![![1, 1]]` and `B = ![![N, 0], ![N, 1]]` show the
exponent is needed. `n` must be nonempty: for `n` empty, `A * B = 0` has the junk height `1`
against a right-hand side of `0`. In the Arakelov normalization the constant disappears —
`Matrix.arakelovMulHeight_mul_le`. -/
example {p : Type*} [Fintype p] [Nonempty n] (A : Matrix m n K) (B : Matrix n p K) :
    (A * B).mulHeight ≤ (Fintype.card n : ℝ) ^ totalWeight K * (A.mulHeight * B.mulHeight) :=
  Matrix.mulHeight_mul_le _ _

/-- **Layer 2.5.** The determinant, against the affine heights of the columns. The affine height is
not decoration: `Matrix.exists_not_mulHeight₁_det_le` records that no constant bounds the height of
a determinant by the projective height of the matrix. -/
example [DecidableEq n] (A : Matrix n n K) :
    Height.mulHeight₁ A.det ≤
      ((Fintype.card n).factorial : ℝ) ^ totalWeight K * ∏ j, mulHeightAff fun i ↦ A i j :=
  Matrix.mulHeight₁_det_le _

end Matrices

/-! ## Layer 3: Plücker coordinates and the height of a subspace -/

section Plucker

variable {R : Type*} [CommRing R] {ι : Type*} [Fintype ι] [LinearOrder ι]

/-- **Layer 3.1 — landed** as `exteriorPower.plucker` in `ArithmeticHeights/Plucker.lean`: the
coordinate tuple of the wedge `v 0 ∧ ⋯ ∧ v (k-1)` in the basis `(Pi.basisFun R ι).exteriorPower k`
of `⋀[R]^k (ι → R)`, indexed by `Set.powersetCard ι k`. Over a commutative ring, so that Layer 3.4
is the ring-generic Cauchy–Binet identity.

**The Plücker coordinates are the maximal minors by construction**, which is what makes 3.3's
`minorDet` unnecessary: the coordinate at `s` is the determinant of the `k × k` matrix cut out of
the rows `v` by the columns `s`, taken in the order of `ι`. The enumeration is
`Set.powersetCard.ofFinEmbEquiv`, Mathlib's, and `Matrix.plucker_row_eq_det_submatrix` of 3.3
restates it with `Finset.orderEmbOfFin`. ⚠ The `Set.powersetCard.orderIsoOfFin` the milestone named
does not exist; `Finset.orderIsoOfFin` does, and
`Matrix.plucker_row_eq_det_submatrix_orderIso` is the statement in that spelling. -/
example (k : ℕ) (v : Fin k → (ι → R)) (s : Set.powersetCard ι k) :
    exteriorPower.plucker k v s =
      (Matrix.of fun i j ↦ v i (Set.powersetCard.ofFinEmbEquiv.symm s j)).det :=
  exteriorPower.plucker_apply _ _ _

/-- **Layer 3.1.** The coordinate tuple vanishes exactly on a linearly dependent family, so a basis
of `V` produces a nonzero tuple — the nondegeneracy the Plücker point needs. -/
example {K : Type*} [Field K] (k : ℕ) (v : Fin k → (ι → K)) :
    exteriorPower.plucker k v = 0 ↔ ¬ LinearIndependent K v :=
  exteriorPower.plucker_eq_zero_iff _ _

end Plucker

section PluckerPoint

variable {K : Type*} [Field K] {ι : Type*} [Fintype ι] [LinearOrder ι] {k : ℕ}

/-- **Layer 3.1 — the Plücker point, landed** as `Submodule.pluckerPoint` in
`ArithmeticHeights/Plucker.lean`. The wedge of a basis of `V`, read in the basis
`(Pi.basisFun K ι).exteriorPower k`, is a nonzero tuple indexed by `Set.powersetCard ι k`; a change
of basis multiplies it by a determinant, hence a unit, so the induced point of projective space
depends only on `V`. `Submodule.pluckerPoint_eq_mk` is that basis-independence in the form actually
used — the value on *any* basis — and `Submodule.pluckerPoint_span_range` the same for a linearly
independent spanning family. The `[LinearOrder ι]` is what `Module.Basis.exteriorPower` needs to
order each wedge of basis vectors; a different order changes the coordinates by signs only, so the
height of 3.2 does not depend on it.

⚠ Unlike the milestone's sketch, the body is deliberately **exposed**: 3.3 has to see
`pluckerPoint` as the `Projectivization.mk` of a coordinate tuple. It is the four subspace *heights*
whose bodies stay unexposed. -/
example (V : Submodule K (ι → K)) (hV : finrank K V = k) (b : Basis (Fin k) K V)
    (hb : exteriorPower.plucker k (fun i ↦ ((b i : ι → K))) ≠ 0) :
    V.pluckerPoint hV = Projectivization.mk K (exteriorPower.plucker k fun i ↦ ((b i : ι → K))) hb :=
  Submodule.pluckerPoint_eq_mk hV b hb

/-- **Layer 3.1.** The Plücker map is injective on subspaces of a fixed rank — what entitles it to
be called an embedding, and the input to Northcott for subspaces (3.7). -/
example (k : ℕ) :
    Function.Injective fun V : {V : Submodule K (ι → K) // finrank K V = k} ↦
      V.1.pluckerPoint V.2 :=
  Submodule.pluckerPoint_injective _

variable [Height.AdmissibleAbsValues K]

/-- **Layer 3.2 — Schmidt's height of a subspace, landed** as `Submodule.mulHeight` in
`ArithmeticHeights/Subspace.lean`, with `Submodule.logHeight`, the Arakelov
`Submodule.arakelovMulHeight` (`H_Ar(V)`, Bombieri–Gubler 2.8.11 — the quantity on the right-hand
side of Bombieri–Vaaler) and the absolute `Submodule.absMulHeight` beside it.

⚠ **The rank does not belong in the definition.** The milestone's `subspaceMulHeight k V hV` takes
the rank and its proof as arguments, and every signature stated in terms of it then carries them
too — two rank hypotheses in 3.3 for one and the same subspace, one for `V` and one for its
annihilator in 3.5, and `mulHeight (V ⊓ W)` in 3.6 ill formed until a rank for `V ⊓ W` has been
produced. Instead the definition takes `k := finrank K V` and `hV := rfl`, so each of the six
subspace heights — three normalizations, multiplicative and logarithmic — is a total function of
`V` alone, and the lemma below re-types it along an arbitrary proof of the rank. That lemma, not
the definition, is what every proof enters through, so the six bodies are left unexposed, as
Mathlib leaves `Projectivization.mulHeight`'s. -/
example {V : Submodule K (ι → K)} (hV : finrank K V = k) :
    V.mulHeight = Projectivization.mulHeight (V.pluckerPoint hV) :=
  Submodule.mulHeight_eq_mulHeight_pluckerPoint hV

/-- **Layer 3.2.** The height of a subspace is at least one — unconditionally, the rank having left
the statement. -/
example (V : Submodule K (ι → K)) : 1 ≤ V.mulHeight := Submodule.one_le_mulHeight _

/-- **Layer 3.2 — the compatibility that makes the definition the right one.** The height of a
line is the projective height of the point it defines. The same holds for the Arakelov and absolute
variants, and `Submodule.mulHeight_span_range` is the general form: the height of the span of a
linearly independent family is the height of its tuple of Plücker coordinates. -/
example {x : ι → K} (hx : x ≠ 0) : (K ∙ x).mulHeight = Height.mulHeight x :=
  Submodule.mulHeight_span_singleton hx

end PluckerPoint

section RowSpace

variable {K : Type*} [Field K] [Height.AdmissibleAbsValues K] {ι : Type*} [Fintype ι]
  [LinearOrder ι] {m : ℕ}

/-- **Layer 3.3 — the matrix dictionary (Bombieri–Gubler, Remark 2.8.7), landed** in
`ArithmeticHeights/RowSpace.lean`. The height of the row space of a full-rank matrix is the height
of its tuple of maximal minors — `H(A)` of Bombieri–Vaaler, which is *not* `Matrix.mulHeight A`.
This is what lets Layer 5 pass between a subspace and a matrix cutting it out.

⚠ **Neither the row space nor the minors is a new definition.** The row space is
`Submodule.span K (Set.range A.row)`, which is `LinearMap.range A.vecMulLinear` by Mathlib's
`Matrix.range_vecMulLinear`, and the minors are `exteriorPower.plucker m A.row` of 3.1; a third
name for either would force every later statement to choose between three spellings of one object.
Full row rank is `LinearIndependent K A.row`, with
`Matrix.linearIndependent_row_iff_rank_eq` and
`Matrix.linearIndependent_row_iff_plucker_row_ne_zero` the other two forms. -/
example {A : Matrix (Fin m) ι K} (hA : LinearIndependent K A.row) :
    (Submodule.span K (Set.range A.row)).mulHeight =
      Height.mulHeight fun s : Set.powersetCard ι m ↦
        (A.submatrix id ((s : Finset ι).orderEmbOfFin (Set.powersetCard.card_eq s))).det :=
  Matrix.mulHeight_span_range_row hA

/-- **Layer 3.3.** The index identification, stated once and for all: the Plücker coordinate at `s`
is the minor on the columns `s`, enumerated by `Finset.orderEmbOfFin`. -/
example {R : Type*} [CommRing R] (A : Matrix (Fin m) ι R) (s : Set.powersetCard ι m) :
    exteriorPower.plucker m A.row s =
      (A.submatrix id ((s : Finset ι).orderEmbOfFin (Set.powersetCard.card_eq s))).det :=
  Matrix.plucker_row_eq_det_submatrix _ _

/-- **Layer 3.3 (Bombieri–Vaaler (2.5)) — the quantitative form of the invariance under row
operations**, over any commutative ring and for *every* square `U`, not only an invertible one. -/
example {R : Type*} [CommRing R] (U : Matrix (Fin m) (Fin m) R) (A : Matrix (Fin m) ι R) :
    exteriorPower.plucker m (U * A).row = U.det • exteriorPower.plucker m A.row :=
  Matrix.plucker_row_mul _ _

/-- **Layer 3.3 (Bombieri–Gubler, Remark 2.8.7).** Invariance of the height of the row space under
row operations. This is the invariance that the naïve Siegel bound of 5.1 lacks and that
Bombieri–Vaaler achieves. The Arakelov and absolute companions are stated beside it, and
`Matrix.span_range_row_mul` is the underlying statement that the row space itself is unchanged. -/
example {U : Matrix (Fin m) (Fin m) K} (hU : IsUnit U.det) (A : Matrix (Fin m) ι K) :
    (Submodule.span K (Set.range (U * A).row)).mulHeight =
      (Submodule.span K (Set.range A.row)).mulHeight :=
  Matrix.mulHeight_span_range_row_mul hU _

end RowSpace

section CauchyBinet

variable {R : Type*} [CommRing R] {ι : Type*} [Fintype ι] [LinearOrder ι] {m : ℕ}

/-- **Layer 3.4 — the Cauchy–Binet identity** (Schmidt 1967, §2 Lemma 1; Bombieri–Gubler,
Proposition 2.8.8), **landed** in `ArithmeticHeights/CauchyBinet.lean`: the determinant of `A Bᵀ` is
the sum over the `m`-element column sets of the products of the corresponding maximal minors.
`Matrix.det_mul_eq_sum_plucker` is the general `det (A B) = ∑_S det A_S · det Bˢ` — what the name
refers to — and `Matrix.det_mul_transpose_eq_sum_det_submatrix` and
`Matrix.det_mul_eq_sum_det_submatrix` spell both with `Matrix.submatrix` in place of `plucker`.

The identity is not a determinant expansion: `exteriorPower.sum_plucker_mul_plucker` pairs two
wedges along `Basis.toDual` of the standard basis, which is the diagonal form on the induced basis
on one side and a determinant of dot products on the other. No permutation sum, no rank hypothesis,
no field. -/
example (A B : Matrix (Fin m) ι R) :
    (A * B.transpose).det =
      ∑ s : Set.powersetCard ι m, exteriorPower.plucker m A.row s * exteriorPower.plucker m B.row s :=
  Matrix.det_mul_transpose_eq_sum_plucker _ _

/-- **Layer 3.4 — Cauchy–Binet at a real place.** The ℓ² local factor of the minor vector is the
square root of the Gram determinant `det (A Aᵀ)`. This is exactly where the `√(det (A Aᵀ))` of the
Bombieri–Vaaler bound comes from, so it is a named milestone rather than a step inside a proof.

⚠ It is not a specialization to `ℝ`: the identity holds over any commutative ring, the "sum of
squares" being nothing but the diagonal of Cauchy–Binet. -/
example (A : Matrix (Fin m) ι R) :
    (A * A.transpose).det = ∑ s : Set.powersetCard ι m, exteriorPower.plucker m A.row s ^ 2 :=
  Matrix.det_mul_transpose_self_eq_sum_sq _

/-- **Layer 3.4 — Cauchy–Binet at a complex place.** The same identity with the conjugate
transpose: `∑ |det A_s|² = det (A A*)`, a real number cast to the field. Without this form the
Bombieri–Vaaler constant is only available for totally real fields.

⚠ Again not a specialization to `ℂ`: `Matrix.det_mul_conjTranspose_self_eq_sum` is the statement
over a commutative star ring, and `RCLike` enters only to write the summand as `‖·‖²`. -/
example {K : Type*} [RCLike K] (A : Matrix (Fin m) ι K) :
    (A * A.conjTranspose).det =
      ((∑ s : Set.powersetCard ι m, ‖exteriorPower.plucker m A.row s‖ ^ 2 : ℝ) : K) :=
  Matrix.det_mul_conjTranspose_self_eq_sum_sq_norm _

/-- **Layer 3.4 — the one statement Layers 5.3 and 5.4 consume.** At an infinite place of a number
field, real or complex, the Gram determinant read through `v.embedding` is `∑ₛ v (det Aₛ)²` — the
quantity Layer 0.1 raises to the power `mult v / 2`. The real place is not a separate case: there
the conjugate transpose *is* the transpose. -/
example {K : Type*} [Field K] (v : InfinitePlace K) (A : Matrix (Fin m) ι K) :
    ((A.map v.embedding) * (A.map v.embedding).conjTranspose).det =
      ((∑ s : Set.powersetCard ι m, v (exteriorPower.plucker m A.row s) ^ 2 : ℝ) : ℂ) :=
  NumberField.InfinitePlace.det_map_embedding_mul_conjTranspose_self _ _

/-- **Layer 3.4 — the Gram criterion**, which the milestone does not ask for and Layer 5 needs: over
an ordered field the Gram determinant of the rows detects full row rank. This is what makes
`√(det (A Aᵀ))` nonzero in the Bombieri–Vaaler bound, and a third form of full row rank beside
3.3's two. -/
example {K : Type*} [Field K] [LinearOrder K] [IsStrictOrderedRing K] (A : Matrix (Fin m) ι K) :
    (A * A.transpose).det = 0 ↔ ¬ LinearIndependent K A.row :=
  Matrix.det_mul_transpose_self_eq_zero_iff _

/-- **Layer 3.4 — the generalized Hadamard inequality** (Schmidt 1967, §2 Lemma 2;
Bombieri–Vaaler (2.6); Bombieri–Gubler's Fischer inequality, Remark 2.8.9), **landed** in
`ArithmeticHeights/Hadamard.lean`, the companion the milestone asks to prove alongside the
identity. `Matrix.det_mul_transpose_self_le_mul` is the same for a matrix whose rows are indexed by
`Fin (p + q)` and cut at `p`.

⚠ It is a second theorem, not a corollary, and Mathlib has none of the three things the textbook
proof of Fischer's inequality runs through — determinant monotonicity on the positive-semidefinite
order, a block Laplace expansion of a maximal minor, the exterior power of a contraction. What
replaces the missing monotonicity is Cauchy–Binet over a doubled column index. Everything is over an
arbitrary ordered field; nothing here is analytic. -/
example {K : Type*} [Field K] [LinearOrder K] [IsStrictOrderedRing K] {p q : ℕ}
    (A : Matrix (Fin p) ι K) (B : Matrix (Fin q) ι K) :
    ((A.fromRows B) * (A.fromRows B).transpose).det ≤
      (A * A.transpose).det * (B * B.transpose).det :=
  Matrix.det_mul_transpose_self_fromRows_le _ _

/-- **Layer 3.4 — Hadamard's inequality**, the fully split case, by induction from the two-block
form. This is the statement Layer 5.5 imports; `H_u(A) ≤ H_u(A₁) H_u(A₂)` at the finite places and
the assembly of the local bounds into `H_Ar^row(A) ≤ ∏ₘ H_Ar(A ₘ)` belong to 5.5 and are not
proved here. -/
example {K : Type*} [Field K] [LinearOrder K] [IsStrictOrderedRing K] (A : Matrix (Fin m) ι K) :
    (A * A.transpose).det ≤ ∏ i, A.row i ⬝ᵥ A.row i :=
  Matrix.det_mul_transpose_self_le_prod _

end CauchyBinet

section Duality

variable {K : Type*} [Field K] [Height.AdmissibleAbsValues K] {ι : Type*} [Fintype ι]
  [LinearOrder ι]

/-- **Layer 3.5 — the duality theorem** (W. M. Schmidt 1967, §1, equations (2) and (4);
Bombieri–Gubler, Proposition 2.8.10) — **landed** as
`Submodule.mulHeight_comap_piEquiv_dualAnnihilator` in `ArithmeticHeights/Duality.lean`, with its
Arakelov and absolute companions and every logarithmic form. The height of a subspace equals the
height of its annihilator in the dual, identified with `ι → K` through the standard basis. No rank
hypothesis appears, the rank having left the height in 3.2.

The milestone's `map` along the inverse identification and the delivered `comap` along the
identification are the same subspace, by `Submodule.comap_piEquiv_dualAnnihilator_eq_map`; the
`comap` is the spelling in which the annihilator is visibly the orthogonal complement for the
standard bilinear form (`Submodule.mem_comap_piEquiv_dualAnnihilator`).

⚠ The route the milestone names — the complementation isomorphism
`⋀^k V ≅ ⋀^n V ⊗ ⋀^(n−k) V*` — is not the one taken, and the delivered proof uses no exterior
algebra at all: it needs neither a Laplace expansion along a block of rows nor Jacobi's identity
for complementary minors, neither of which Mathlib has. What it does need, and what Mathlib also
lacks, is that no height sees a change of sign in a coordinate; that is
`Height.mulHeight_eq_of_forall_eq_or_eq_neg` and its two companions, proved in the same file.
`Height.mulHeight_neg`, which the milestone's route names, does not exist and would not suffice:
the sign in Schmidt's involution `τ` depends on the index. -/
example (V : Submodule K (ι → K)) :
    (V.dualAnnihilator.map (Module.piEquiv ι K K).symm.toLinearMap).mulHeight = V.mulHeight := by
  rw [← Submodule.comap_piEquiv_dualAnnihilator_eq_map]
  exact Submodule.mulHeight_comap_piEquiv_dualAnnihilator V

/-- **Layer 3.5 (Bombieri–Gubler, Corollary 2.8.12) — landed** as
`Matrix.mulHeight_ker_mulVecLin`, with the same five companions: the height of a subspace is the
height of any matrix cutting it out. This is the form Layer 5 consumes, and it carries no
hypothesis on the rank of `A`.

`Submodule.exists_plucker_eq_plucker_compl` is the coordinate statement behind both — Schmidt's
involution itself: a subspace and its annihilator have bases whose Plücker coordinates agree at
complementary indices, up to a sign at each index and one common nonzero factor. -/
example {m : Type*} (A : Matrix m ι K) :
    (LinearMap.ker A.mulVecLin).mulHeight = (Submodule.span K (Set.range A.row)).mulHeight :=
  Matrix.mulHeight_ker_mulVecLin A

end Duality

section Submodular

variable {K : Type*} [Field K] [NumberField K] {ι : Type*} [Fintype ι] [LinearOrder ι]

/-- **Layer 3.6 — submodularity (Bombieri–Gubler, Theorem 2.8.13; Schmidt, Struppeck–Vaaler),
landed** as `Submodule.arakelovMulHeight_sup_mul_arakelovMulHeight_inf_le`. The height of a
subspace is submodular in the subspace lattice.

⚠ The milestone's sup-norm form is **false**, and so are both corollaries below in that form: the
lines `ℚ · (1, 1, 1)` and `ℚ · (1, -1, 0)` in `ℚ³` have `Submodule.mulHeight` equal to `1` each,
meet in `0`, and span a plane of `Submodule.mulHeight` `2`, so `2 · 1 > 1 · 1`; transporting the
same pair through the duality theorem of 3.5 refutes the corollary for the intersection. Both are
machine-checked in `ArithmeticHeights/Submodular.lean`. In the ℓ² normalization the same pair
gives an equality: the two rows are orthogonal, so the Gram determinant is `6 = 3 · 2`. -/
example (V W : Submodule K (ι → K)) :
    (V ⊔ W).arakelovMulHeight * (V ⊓ W).arakelovMulHeight ≤
      V.arakelovMulHeight * W.arakelovMulHeight :=
  Submodule.arakelovMulHeight_sup_mul_arakelovMulHeight_inf_le V W

/-- **Layer 3.6, landed.** The corollary of submodularity and `1 ≤ H` for the intersection.
⚠ Subspace heights are **not** monotone under inclusion: in `ℚ²`, `H(⊤) = 1` while
`H(span {![1, N]}) = N`. There is no statement bounding `H(W)` by `H(V)` for `W ≤ V`; these two
product bounds are what submodularity gives. -/
example (V W : Submodule K (ι → K)) :
    (V ⊓ W).arakelovMulHeight ≤ V.arakelovMulHeight * W.arakelovMulHeight :=
  Submodule.arakelovMulHeight_inf_le_mul V W

/-- **Layer 3.6, landed.** The same for the sum. -/
example (V W : Submodule K (ι → K)) :
    (V ⊔ W).arakelovMulHeight ≤ V.arakelovMulHeight * W.arakelovMulHeight :=
  Submodule.arakelovMulHeight_sup_le_mul V W

/-- **Layer 3.6, landed.** The logarithmic form: `h_Ar` is a submodular function on the subspace
lattice. -/
example (V W : Submodule K (ι → K)) :
    (V ⊔ W).arakelovLogHeight + (V ⊓ W).arakelovLogHeight ≤
      V.arakelovLogHeight + W.arakelovLogHeight :=
  Submodule.arakelovLogHeight_sup_add_arakelovLogHeight_inf_le V W

/-- **Layer 3.6 — the archimedean half, landed** as
`NumberField.InfinitePlace.sum_sq_plucker_append_mul_le`: the local factor `∑ₛ v(pₛ)²` of the
tuple of Plücker coordinates is submodular at every infinite place. Underneath it is
**Koteljanskii's inequality** for Gram determinants, `Matrix.det_mul_transpose_self_fromRows_mul_le`
over an ordered field and `Matrix.det_mul_conjTranspose_self_fromRows_mul_le` over `ℝ` or `ℂ`,
which is Layer 3.4's Fischer inequality with a common first block of rows. -/
example (v : NumberField.InfinitePlace K) {p q r : ℕ} (a : Fin p → (ι → K))
    (b : Fin q → (ι → K)) (c : Fin r → (ι → K)) :
    (∑ s : Set.powersetCard ι (p + (q + r)),
          v (exteriorPower.plucker (p + (q + r)) (Fin.append a (Fin.append b c)) s) ^ 2) *
        (∑ s : Set.powersetCard ι p, v (exteriorPower.plucker p a s) ^ 2)
      ≤ (∑ s : Set.powersetCard ι (p + q),
            v (exteriorPower.plucker (p + q) (Fin.append a b) s) ^ 2) *
          (∑ s : Set.powersetCard ι (p + r),
            v (exteriorPower.plucker (p + r) (Fin.append a c) s) ^ 2) :=
  NumberField.InfinitePlace.sum_sq_plucker_append_mul_le v a b c

/-- **Layer 3.6 — the finite half, landed** as
`NumberField.FinitePlace.iSup_plucker_append_mul_le`: the local factor `maxₛ v(pₛ)` of the tuple of
Plücker coordinates is submodular at every finite place. It is proved in
`ArithmeticHeights/Nonarchimedean.lean` by normalizing the common block to an integral basis of its
saturated lattice `span A ∩ Oᵥⁿ`, after which the inequality collapses to the submultiplicativity
`‖p(B;C)‖ᵥ ≤ ‖p(B)‖ᵥ ‖p(C)‖ᵥ` applied twice. -/
example (v : NumberField.FinitePlace K) {p q r : ℕ} (a : Fin p → (ι → K))
    (b : Fin q → (ι → K)) (c : Fin r → (ι → K)) :
    (⨆ s : Set.powersetCard ι (p + (q + r)),
          v (exteriorPower.plucker (p + (q + r)) (Fin.append a (Fin.append b c)) s)) *
        (⨆ s : Set.powersetCard ι p, v (exteriorPower.plucker p a s))
      ≤ (⨆ s : Set.powersetCard ι (p + q),
            v (exteriorPower.plucker (p + q) (Fin.append a b) s)) *
          ⨆ s : Set.powersetCard ι (p + r),
            v (exteriorPower.plucker (p + r) (Fin.append a c) s) :=
  NumberField.FinitePlace.iSup_plucker_append_mul_le v a b c

/-- **Layer 3.6 — the Grassmann–Plücker comultiplication, landed** as
`exteriorPower.plucker_append_eq_sum`: the Plücker coordinates of a stack are the bilinear
combination of those of the two blocks, with the structure constants of the wedge product, which
`exteriorPower.wedgeCoeff_eq_zero_or_eq_one_or_eq_neg_one` shows are signs. This is the Laplace
expansion along a block of rows — `exteriorPower.det_append_eq_sum` states it for a determinant —
and it is the second route to the finite-place inequality above. -/
example {q r : ℕ} (B : Fin q → (ι → K)) (C : Fin r → (ι → K))
    (s : Set.powersetCard ι (q + r)) :
    exteriorPower.plucker (q + r) (Fin.append B C) s
      = ∑ t : Set.powersetCard ι q, ∑ t' : Set.powersetCard ι r,
          exteriorPower.wedgeCoeff t t' s *
            (exteriorPower.plucker q B t * exteriorPower.plucker r C t') :=
  exteriorPower.plucker_append_eq_sum B C s

/-- **Layer 3.6 — the reduction, landed** as `Submodule.exists_append_span_eq`: one triple of
families spans all four subspaces of the milestone, so that the four heights are the heights of
four Plücker vectors built from the same three families. -/
example (V W : Submodule K (ι → K)) :
    ∃ (k m n : ℕ) (u : Fin k → (ι → K)) (b : Fin m → (ι → K)) (c : Fin n → (ι → K)),
      LinearIndependent K (Fin.append u (Fin.append b c)) ∧
        Submodule.span K (Set.range u) = V ⊓ W ∧
        Submodule.span K (Set.range (Fin.append u b)) = V ∧
        Submodule.span K (Set.range (Fin.append u c)) = W ∧
        Submodule.span K (Set.range (Fin.append u (Fin.append b c))) = V ⊔ W := by
  obtain ⟨k, m, n, u, b, c, _, _, _, hubc, hsu, hsub, hsuc, hsubc⟩ :=
    Submodule.exists_append_span_eq V W
  exact ⟨k, m, n, u, b, c, hubc, hsu, hsub, hsuc, hsubc⟩

end Submodular

section NorthcottSubspace

variable {K : Type*} [Field K] [NumberField K] {ι : Type*} [Fintype ι] [LinearOrder ι]

/-- **Layer 3.7 — Northcott for subspaces, landed** as
`Submodule.finite_setOf_finrank_eq_and_mulHeight_le` in
`ArithmeticHeights/NorthcottSubspace.lean`: immediate from injectivity of the Plücker map (3.1)
and Northcott on projective space (1.1). The rank is a condition on `V` rather than a parameter
of the height. -/
example (k : ℕ) (B : ℝ) :
    {V : Submodule K (ι → K) | finrank K V = k ∧ V.mulHeight ≤ B}.Finite :=
  Submodule.finite_setOf_finrank_eq_and_mulHeight_le k B

/-- **Layer 3.7 — the rank-free strengthening.** A subspace of `ι → K` has rank at most
`Fintype.card ι`, so bounding the height alone already bounds the number of subspaces: the rank
is not a second parameter that has to be fixed. This is what the `Northcott` instances below are
stated in terms of. -/
example (B : ℝ) : {V : Submodule K (ι → K) | V.mulHeight ≤ B}.Finite :=
  Submodule.finite_setOf_mulHeight_le B

/-- **Layer 3.7 — the `Northcott` instances**, one for each of the six subspace heights. The
instance form, and not the finiteness statement, is what `Northcott.exists_min_image` consumes. -/
example : Northcott (Submodule.mulHeight (K := K) (ι := ι)) ∧
    Northcott (Submodule.logHeight (K := K) (ι := ι)) ∧
      Northcott (Submodule.arakelovMulHeight (K := K) (ι := ι)) ∧
        Northcott (Submodule.arakelovLogHeight (K := K) (ι := ι)) ∧
          Northcott (Submodule.absMulHeight (K := K) (ι := ι)) ∧
            Northcott (Submodule.absLogHeight (K := K) (ι := ι)) :=
  ⟨inferInstance, inferInstance, inferInstance, inferInstance, inferInstance, inferInstance⟩

/-- **Layer 3.7 — the minimum principle**, the consequence the instances exist for: a nonempty
set of subspaces contains one of least height. -/
example (s : Set (Submodule K (ι → K))) (hs : s.Nonempty) :
    ∃ V ∈ s, ∀ W ∈ s, V.mulHeight ≤ W.mulHeight :=
  Northcott.exists_min_image _ s hs

end NorthcottSubspace

/-! ## Layer 4: successive minima, Minkowski's second theorem, extraction, and cube slicing -/

section SuccessiveMinima

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]

/-- **Layer 4.1 — the definition, landed** as `ZLattice.successiveMinimum` in
`ArithmeticHeights/SuccessiveMinima.lean`, with exactly the body the milestone pinned: the least
dilation of `B` containing `i + 1` linearly independent points of `L`. The name gained the
`ZLattice` namespace on landing, beside `ZLattice.covolume`; nothing else about the shape moved.
For `i ≥ finrank ℝ E` no such family exists and the value is `sInf ∅ = 0`, so every statement
about the minima carries `i < finrank ℝ E`. -/
example (L : Submodule ℤ E) (B : Set E) (i : ℕ) :
    ZLattice.successiveMinimum L B i = sInf {t : ℝ | 0 < t ∧ ∃ v : Fin (i + 1) → E,
      (∀ j, v j ∈ (t • B) ∩ (L : Set E)) ∧ LinearIndependent ℝ v} :=
  rfl

/-- **Layer 4.1 — the gauge dictionary, landed** as `gauge_le_iff_mem_smul`, the ⚠ the milestone
asks for as its own lemma: Cassels' distance functions and the convex-body form are the same
thing, and `IsClosed B` is exactly what the translation costs. Dilations of an open body are
*not* the sublevel sets of its gauge, which is what the ⚠ under 4.1 in the roadmap records. -/
example {B : Set E} (hB₀ : Convex ℝ B) (hB₄ : IsClosed B) (hB₁ : ∀ x ∈ B, -x ∈ B)
    (hB₂ : (interior B).Nonempty) {t : ℝ} (ht : 0 < t) {x : E} :
    gauge B x ≤ t ↔ x ∈ t • B :=
  gauge_le_iff_mem_smul hB₀ hB₄ (hB₀.mem_nhds_zero_of_symmetric hB₁ hB₂) ht

/-- **Layer 4.1 — positivity, landed** as `ZLattice.successiveMinimum_pos`: a bounded body meets
the discrete lattice in finitely many points at each dilation, so no small dilation contains a
nonzero lattice point. This is where boundedness of the body is used. -/
example (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    {B : Set E} (hB₀ : Convex ℝ B) (hB₁ : ∀ x ∈ B, -x ∈ B) (hB₂ : (interior B).Nonempty)
    (hB₃ : Bornology.IsBounded B) {i : ℕ} (hi : i < Module.finrank ℝ E) :
    0 < ZLattice.successiveMinimum L B i :=
  ZLattice.successiveMinimum_pos L hB₀ hB₁ hB₂ hB₃ hi

/-- **Layer 4.1 — the junk value above the dimension, landed** as
`ZLattice.successiveMinimum_eq_zero_of_le`. Together with positivity this is why every statement
about the minima is restricted to `i < finrank ℝ E`: the minima are *not* a monotone function of
the index on all of `ℕ`, and a product over indices above the dimension is zero. -/
example (L : Submodule ℤ E) (B : Set E) {i : ℕ} (hi : Module.finrank ℝ E ≤ i) :
    ZLattice.successiveMinimum L B i = 0 :=
  ZLattice.successiveMinimum_eq_zero_of_le L B hi

/-- **Layer 4.1 — monotone in the index and homogeneous of degree `-1` in the body, landed** as
`ZLattice.successiveMinimum_le_of_le` and `ZLattice.successiveMinimum_smul`. The first carries
`j < finrank ℝ E` for the reason above. -/
example (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    {B : Set E} (hB₀ : Convex ℝ B) (hB₁ : ∀ x ∈ B, -x ∈ B) (hB₂ : (interior B).Nonempty)
    {i j : ℕ} (hij : i ≤ j) (hj : j < Module.finrank ℝ E) {c : ℝ} (hc : 0 < c) :
    ZLattice.successiveMinimum L B i ≤ ZLattice.successiveMinimum L B j ∧
      ZLattice.successiveMinimum L (c • B) i = c⁻¹ * ZLattice.successiveMinimum L B i :=
  ⟨ZLattice.successiveMinimum_le_of_le hij hj hB₀ hB₁ hB₂,
    ZLattice.successiveMinimum_smul L B i hc⟩

/-- **Layer 4.1 — attainment, landed** as
`ZLattice.exists_linearIndependent_gauge_eq_successiveMinimum`: Cassels' Lemma 1, one independent
family of lattice vectors realizing *all* the minima at once, not one family for each index.

⚠ The gauge form needs no closedness; it is the body form below that does. -/
example (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    {B : Set E} (hB₀ : Convex ℝ B) (hB₁ : ∀ x ∈ B, -x ∈ B) (hB₂ : (interior B).Nonempty)
    (hB₃ : Bornology.IsBounded B) :
    ∃ v : Fin (Module.finrank ℝ E) → E, (∀ j, v j ∈ (L : Set E)) ∧ LinearIndependent ℝ v ∧
      ∀ j : Fin (Module.finrank ℝ E), gauge B (v j) = ZLattice.successiveMinimum L B j :=
  ZLattice.exists_linearIndependent_gauge_eq_successiveMinimum L hB₀ hB₁ hB₂ hB₃

/-- **Layer 4.1 — attainment in the body, landed** as
`ZLattice.exists_linearIndependent_mem_smul_successiveMinimum`. This is the form 4.2 and 4.6
consume, and `IsClosed B` is what it costs over the gauge form. -/
example (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    {B : Set E} (hB₀ : Convex ℝ B) (hB₁ : ∀ x ∈ B, -x ∈ B) (hB₂ : (interior B).Nonempty)
    (hB₃ : Bornology.IsBounded B) (hB₄ : IsClosed B) :
    ∃ v : Fin (Module.finrank ℝ E) → E, (∀ j, v j ∈ (L : Set E)) ∧ LinearIndependent ℝ v ∧
      ∀ j : Fin (Module.finrank ℝ E),
        v j ∈ (ZLattice.successiveMinimum L B j) • B :=
  ZLattice.exists_linearIndependent_mem_smul_successiveMinimum L hB₀ hB₁ hB₂ hB₃ hB₄

/-- **Layer 4.1 — Minkowski's first theorem as the case `i = 0`, landed** as
`ZLattice.successiveMinimum_zero_eq` and `ZLattice.successiveMinimum_zero_le_one`. The first is
measure-free — the zeroth minimum asks only for a nonzero lattice point — and the second is
Mathlib's `exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure` read as that case.

⚠ The docstring above claimed no measure enters 4.1. It does not enter the definition, and the
identification of the zeroth minimum is measure-free, but the bound itself is a statement about
`ZLattice.covolume` and is the one place in 4.1 a measure appears. -/
example [MeasureTheory.MeasureSpace E] [BorelSpace E] [Nontrivial E]
    [MeasureTheory.Measure.IsAddHaarMeasure (MeasureTheory.volume : MeasureTheory.Measure E)]
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L] {B : Set E} (hB₀ : Convex ℝ B)
    (hB₁ : ∀ x ∈ B, -x ∈ B) (hB₅ : IsCompact B)
    (h : 2 ^ Module.finrank ℝ E * ZLattice.covolume L ≤ (MeasureTheory.volume B).toReal) :
    ZLattice.successiveMinimum L B 0 =
        sInf {t : ℝ | 0 < t ∧ ∃ x ∈ (t • B) ∩ (L : Set E), x ≠ 0} ∧
      ZLattice.successiveMinimum L B 0 ≤ 1 :=
  ⟨ZLattice.successiveMinimum_zero_eq L B,
    ZLattice.successiveMinimum_zero_le_one L MeasureTheory.volume hB₀ hB₁ hB₅ h⟩

/-- **Layer 4.2 — Minkowski's second theorem, the lower bound, landed** as
`ZLattice.covolume_le_prod_successiveMinimum_mul_measure`. The pinned shape survived; the
hypotheses shrank, since the vectors realizing the minima are used through their gauges and the
cross-polytope they span meets the body through the half of the gauge dictionary that holds for
any body. Neither closedness nor compactness enters. -/
example [MeasureTheory.MeasureSpace E] [BorelSpace E]
    [MeasureTheory.Measure.IsAddHaarMeasure (MeasureTheory.volume : MeasureTheory.Measure E)]
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L] {B : Set E} (hB₀ : Convex ℝ B)
    (hB₁ : ∀ x ∈ B, -x ∈ B) (hB₂ : (interior B).Nonempty) (hB₃ : Bornology.IsBounded B) :
    (2 : ℝ) ^ Module.finrank ℝ E / (Nat.factorial (Module.finrank ℝ E)) *
        ZLattice.covolume L ≤
      (∏ i ∈ Finset.range (Module.finrank ℝ E), ZLattice.successiveMinimum L B i) *
        (MeasureTheory.volume B).toReal :=
  ZLattice.covolume_le_prod_successiveMinimum_mul_measure L MeasureTheory.volume hB₀ hB₁ hB₂ hB₃

/-- **Layer 4.2 — the upper bound for the zeroth minimum, landed** as
`ZLattice.pow_successiveMinimum_zero_mul_measure_le`: `λ 0 ^ n * vol B ≤ 2 ^ n * covolume L`, which
is Minkowski's first theorem made homogeneous by applying it to a dilated body. It is the upper
bound below with `∏ i < n, λ i` weakened to `λ 0 ^ n`, and it is everything the first theorem
gives: the substantial half is a different argument. -/
example [MeasureTheory.MeasureSpace E] [BorelSpace E] [Nontrivial E]
    [MeasureTheory.Measure.IsAddHaarMeasure (MeasureTheory.volume : MeasureTheory.Measure E)]
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L] {B : Set E} (hB₀ : Convex ℝ B)
    (hB₁ : ∀ x ∈ B, -x ∈ B) (hB₂ : (interior B).Nonempty) (hB₅ : IsCompact B) :
    ZLattice.successiveMinimum L B 0 ^ Module.finrank ℝ E * (MeasureTheory.volume B).toReal ≤
      (2 : ℝ) ^ Module.finrank ℝ E * ZLattice.covolume L :=
  ZLattice.pow_successiveMinimum_zero_mul_measure_le L MeasureTheory.volume hB₀ hB₁ hB₂ hB₅

/-- **Layer 4.2 — Minkowski's second theorem, the substantial half, landed** as
`ZLattice.prod_successiveMinimum_mul_measure_le`. This is the direction Layer 5 and 6.3 consume.
It is Cassels' Chapter VIII **Theorem V**, not Theorem II — Theorem II of that chapter is the
Rogers–Chabauty bound `λ 1 ⋯ λ n ≤ 2 ^ ((n − 1) / 2) δ(F) d(Λ)` for a general distance function, a
different theorem with a different constant — and Cassels says of it that the proof "remains
difficult". The route is Weyl's, through Cassels' Theorem IV: the linear map that would make it a
packing statement does not map the body into itself (machine-checked at the end of
`ArithmeticHeights/MinkowskiSecond.lean`), so the set inclusion is replaced by a measure estimate
for the image of `t • B` in `E ⧸ L`, scaled up from `t = λ 0 / 2` to `t = λ (n − 1) / 2` one
minimum at a time. That estimate is `ZLattice.pow_mul_measure_inter_add_le` of
`ArithmeticHeights/QuotientFubini.lean`, Cassels' Theorem IV in one step. ⚠ The chain runs on the
*open* dilates `{gauge B < t}`, which is what lets the separation hypothesis hold at `2 t = λ J`
rather than only below it, and it is why no closedness or compactness of the body appears; the
body and its interior have the same measure because a convex set has null frontier. ⚠ Cassels'
Lemma 2 turns out not to be needed: the adapted basis is his way of seeing in coordinates that a
translation stays inside `L ∩ span (v 0, …, v (J − 1))`, and coordinate-free the only thing wanted
of that sublattice is its rank. -/
example [MeasureTheory.MeasureSpace E] [BorelSpace E]
    [MeasureTheory.Measure.IsAddHaarMeasure (MeasureTheory.volume : MeasureTheory.Measure E)]
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L] {B : Set E} (hB₀ : Convex ℝ B)
    (hB₁ : ∀ x ∈ B, -x ∈ B) (hB₂ : (interior B).Nonempty) (hB₃ : Bornology.IsBounded B) :
    (∏ i ∈ Finset.range (Module.finrank ℝ E), ZLattice.successiveMinimum L B i) *
        (MeasureTheory.volume B).toReal ≤
      (2 : ℝ) ^ Module.finrank ℝ E * ZLattice.covolume L :=
  ZLattice.prod_successiveMinimum_mul_measure_le L MeasureTheory.volume hB₀ hB₁ hB₂ hB₃

/-- **Layer 4.6 — a basis from any independent family, landed** as
`ZLattice.exists_basis_gauge_le`. For `ℝ`-independent lattice vectors `a 0, …, a (n − 1)` there is
a `ℤ`-basis of `L` whose `j`-th member has gauge at most
`max (gauge B (a j)) (½ ∑_{i ≤ j} gauge B (a i))`: extend a basis of
`L ∩ span (a 0, …, a (j − 1))` by one vector and reduce its coefficients on the `a i` into
`[−½, ½]`. The pinned shape survived intact. No measure enters, and neither does closedness or
boundedness of the body — the library form drops `IsZLattice ℝ L` too, since an independent
family of `finrank ℝ E` lattice vectors already forces it. -/
example (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    {B : Set E} (hB₀ : Convex ℝ B) (hB₁ : ∀ x ∈ B, -x ∈ B) (hB₂ : (interior B).Nonempty)
    (a : Fin (Module.finrank ℝ E) → L) (ha : LinearIndependent ℝ (fun i ↦ (a i : E))) :
    ∃ b : Module.Basis (Fin (Module.finrank ℝ E)) ℤ L, ∀ j,
      gauge B (b j : E) ≤
        max (gauge B (a j : E)) ((∑ i ∈ Finset.Iic j, gauge B (a i : E)) / 2) :=
  ZLattice.exists_basis_gauge_le L hB₀ hB₁ hB₂ rfl (fun i ↦ (a i).2) ha

/-- **Layer 4.6 — a basis from the minima, landed** as
`ZLattice.exists_basis_mem_smul_successiveMinimum` (Cassels, p. 135, Lemma 8, as Bugeaud–Győry
cite it). The independent vectors realizing the minima need not be a basis of `L`; some basis has
its `i`-th member (zero-indexed) in `max 1 ((i + 1) / 2) · λ i` times `B`, a total loss of
`n! / 2 ^ (n − 1)` against 4.2. This is what 6.3 consumes. -/
example (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] {B : Set E} (hB₀ : Convex ℝ B) (hB₁ : ∀ x ∈ B, -x ∈ B)
    (hB₂ : (interior B).Nonempty) (hB₃ : Bornology.IsBounded B) (hB₄ : IsClosed B) :
    ∃ b : Module.Basis (Fin (Module.finrank ℝ E)) ℤ L, ∀ i : Fin (Module.finrank ℝ E),
      (b i : E) ∈ (max 1 ((((i : ℕ) : ℝ) + 1) / 2) * ZLattice.successiveMinimum L B i) • B :=
  ZLattice.exists_basis_mem_smul_successiveMinimum L hB₀ hB₁ hB₂ hB₃ hB₄

end SuccessiveMinima

section RationalLattice

variable {ι : Type*} [Fintype ι] [LinearOrder ι]

/-- **Layer 4.3 over `ℚ` — the covolume identity, landed** as `Submodule.covolume_intLattice` in
`ArithmeticHeights/RationalLattice.lean`. This is W. M. Schmidt 1967, §3, Theorem 1 in the case
`K = ℚ`, where the degree, the discriminant and the number of complex places are `1`, `1` and `0`,
so that every constant of the general display `2 ^ (−r₂ k) · |discr K| ^ (k / 2) · H_Ar(V) ^ d`
disappears and the identity is the bare statement that a covolume is an Arakelov height. The
lattice is the integral points `V ∩ ℤⁿ` read inside `Submodule.realSpan`, the real span of `V` in
`EuclideanSpace ℝ ι`: a sublattice of `ℤⁿ` of rank below `#ι` has no covolume in `ℝ^ι`, and a
subspace of a real vector space carries a canonical measure only through an inner product, which
is why the ambient is `EuclideanSpace` and not `ι → ℝ`. ⚠ The identity is **false** for an
arbitrary full-rank sublattice of `V ∩ ℤⁿ`; saturation is the content. -/
example (V : Submodule ℚ (ι → ℚ)) :
    ZLattice.covolume V.intLattice = V.arakelovMulHeight :=
  V.covolume_intLattice

/-- **Layer 4.3 over `ℚ` — the rank-one case, landed** as
`Submodule.covolume_intLattice_span_singleton`: the covolume of the lattice cut out by a line is
the Arakelov height of any rational point spanning it, hence the euclidean norm of the primitive
integer point on it. This is the acceptance check that the identity has the right normalization at
`k = 1`. -/
example {x : ι → ℚ} (hx : x ≠ 0) :
    ZLattice.covolume (Submodule.span ℚ {x}).intLattice = NumberField.arakelovMulHeight x :=
  Submodule.covolume_intLattice_span_singleton hx

/-- **Layer 4.3 over `ℚ` — the primitivity of the Plücker point, landed** as
`Submodule.gcd_plucker_eq_one`: the maximal minors of a saturated integral basis are coprime. This
is what Schmidt's Lemmas 5 and 6 come to over `ℚ`, and it is the only place the saturation
hypothesis enters. -/
example {k : ℕ} {V : Submodule ℚ (ι → ℚ)} {y : Fin k → (ι → ℤ)}
    (hy : LinearIndependent ℚ (fun i ↦ Rat.piIntCast ι (y i)))
    (hspan : Submodule.span ℚ (Set.range fun i ↦ Rat.piIntCast ι (y i)) = V)
    (hsat : Submodule.span ℤ (Set.range y) = V.intPoints) :
    (Finset.univ : Finset (Set.powersetCard ι k)).gcd (exteriorPower.plucker k y) = 1 :=
  V.gcd_plucker_eq_one hy hspan hsat

/-- **Layer 4.3 — the covolume as a Gram determinant, landed** as
`ZLattice.covolume_sq_eq_det_gram`, the infrastructure half. Mathlib's `ZLattice.covolume_eq_det`
is the same computation in `ι → ℝ` against the Lebesgue measure, where the answer is the
determinant of the basis matrix; in an inner product space there is no ambient basis to take a
determinant against, and the Gram matrix replaces it. This is what makes the archimedean half of
4.3 a one-liner, and it is stated for an arbitrary lattice, not only for a lattice of rational
points. -/
example {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
    [MeasurableSpace E] [BorelSpace E] (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    {κ : Type*} [Fintype κ] [DecidableEq κ] (b : Module.Basis κ ℤ L) :
    ZLattice.covolume L ^ 2 = (Matrix.of fun i j ↦ inner ℝ (b i : E) (b j : E)).det :=
  ZLattice.covolume_sq_eq_det_gram L b

/-- **Layer 4.3 over `ℚ` — the Arakelov height of a primitive integer tuple, landed** as
`NumberField.arakelovMulHeight_intCast_of_gcd_eq_one`: over `ℚ` it is the euclidean norm. Mathlib's
`Rat.mulHeight_eq_max_abs_of_gcd_eq_one` is the same statement for the sup norm; the finite-place
half is shared and is Mathlib's, the archimedean half is the ℓ² normalization of Layer 0.1. -/
example {κ : Type*} [Fintype κ] {x : κ → ℤ} (hx : (Finset.univ : Finset κ).gcd x = 1) :
    NumberField.arakelovMulHeight (((↑) : ℤ → ℚ) ∘ x) = Real.sqrt (∑ i, ((x i : ℝ)) ^ 2) :=
  NumberField.arakelovMulHeight_intCast_of_gcd_eq_one hx

end RationalLattice

section NumberFieldLattice

open scoped nonZeroDivisors Matrix Classical

variable {K : Type*} [Field K] [NumberField K] {ι : Type*} [Fintype ι] [LinearOrder ι]

/-- **Layer 4.3 over a number field — the covolume identity, landed** as
`Submodule.covolume_mixedLattice` in `ArithmeticHeights/NumberFieldLattice.lean`. This is
W. M. Schmidt 1967, §3, Theorem 1: the lattice `V ∩ (𝓞 K)ⁱ`, read inside `Submodule.mixedSpan` —
the real span of `V` in `PiLp 2 (fun _ : ι ↦ euclidean.mixedSpace K)` — has covolume the covolume
of `𝓞 K` itself, `2⁻¹ ^ r₂ · √|discr K|`, raised to `dim V`, times the Arakelov height of `V`.
The height is the one *relative* to `K`, so the absolute height of the roadmap's display enters
with the exponent `d = [K : ℚ]`; and the constant is Mathlib's `covolume_integerLattice` rather
than a recomputed `2^{−r₂ k} |discr K|^{k/2}`, which is what keeps it out of the proof. Over `ℚ`
this is `Submodule.covolume_intLattice`, every factor being `1`. -/
example (V : Submodule K (ι → K)) :
    ZLattice.covolume V.mixedLattice
      = ((2 : ℝ)⁻¹ ^ NumberField.InfinitePlace.nrComplexPlaces K
          * Real.sqrt |NumberField.discr K|) ^ finrank K V * V.arakelovMulHeight :=
  V.covolume_mixedLattice

/-- **Layer 4.3 — the rank of the real carrier, landed** as `Submodule.finrank_mixedSpan`: the
real span of a `k`-dimensional subspace of `Kⁱ` has dimension `d k`, which is what makes
`Submodule.mixedLattice` a `ZLattice` of full rank in it. -/
example (V : Submodule K (ι → K)) :
    finrank ℝ V.mixedSpan = finrank ℚ K * finrank K V :=
  V.finrank_mixedSpan

/-- **Layer 4.3 — the pseudo-basis, landed** as `Submodule.exists_pseudoBasis_mem` in
`ArithmeticHeights/PseudoBasis.lean`, over an arbitrary Dedekind domain: a finitely generated
module of rank `k` in `ι → K` is `𝔞₁ y₁ ⊕ ⋯ ⊕ 𝔞_k y_k` with the `yᵢ` in the module itself. The
normalization `yᵢ ∈ M` is what makes the Plücker coordinates integral, and the proof uses only
that a nonzero fractional ideal is invertible — no `Module.Projective`, no structure theorem. -/
example {A K : Type*} [CommRing A] [IsDedekindDomain A] [Field K] [Algebra A K]
    [IsFractionRing A K] {ι : Type*} [Finite ι] (k : ℕ) (M : Submodule A (ι → K)) (hM : M.FG)
    (hk : finrank K (Submodule.span K (M : Set (ι → K))) = k) :
    ∃ (y : Fin k → (ι → K)) (𝔞 : Fin k → FractionalIdeal A⁰ K),
      LinearIndependent K y ∧ (∀ i, 𝔞 i ≠ 0) ∧ (∀ i, y i ∈ M) ∧
      (∀ x, x ∈ M ↔ ∃ c : Fin k → K, (∀ i, c i ∈ 𝔞 i) ∧ x = ∑ i, c i • y i) :=
  Submodule.exists_pseudoBasis_mem k M hM hk

/-- **Layer 4.3 — Schmidt's Lemma 4, landed** as `NumberField.mixedEmbedding.norm_det_gram`: the
algebra norm over `ℝ` of the Gram determinant of the mixed embedding of a matrix over `K` is the
archimedean local factor of the Arakelov height of its Plücker point. This is the whole
archimedean half, and it is Cauchy–Binet (3.4) over the mixed space read as a commutative star
ring — with no decomposition by place, and with no `2^{−r₂}` anywhere in it. -/
example {m : ℕ} (Y : Matrix (Fin m) ι K) :
    Algebra.norm ℝ ((Y.map (NumberField.mixedEmbedding K))
        * (Y.map (NumberField.mixedEmbedding K))ᴴ).det
      = ∏ w : NumberField.InfinitePlace K,
          (∑ s : Set.powersetCard ι m, w (exteriorPower.plucker m Y.row s) ^ 2) ^ w.mult :=
  NumberField.mixedEmbedding.norm_det_gram Y

/-- **Layer 4.3 — primitivity over `𝓞 K`, landed** as `Submodule.prod_mul_plucker_eq_one`: for a
pseudo-basis of `V ∩ (𝓞 K)ⁱ`, the product of the ideals times the ideal generated by the Plücker
coordinates is the unit ideal. This replaces both of Schmidt's Lemmas 5 and 6, it is the exact
analogue of `Submodule.gcd_plucker_eq_one` over `ℚ`, and it is the only place saturation is
spent. -/
example (V : Submodule K (ι → K)) {k : ℕ} {y : Fin k → (ι → K)}
    {𝔞 : Fin k → FractionalIdeal (NumberField.RingOfIntegers K)⁰ K}
    {p : Set.powersetCard ι k → NumberField.RingOfIntegers K}
    (hy : LinearIndependent K y) (h𝔞 : ∀ i, 𝔞 i ≠ 0)
    (hchar : ∀ x, x ∈ V.integerPoints ↔
      ∃ c : Fin k → K, (∀ i, c i ∈ 𝔞 i) ∧ x = ∑ i, c i • y i)
    (hp : ∀ s, (p s : K) = exteriorPower.plucker k y s) :
    (∏ i, 𝔞 i)
        * (Ideal.span (Set.range p) : FractionalIdeal (NumberField.RingOfIntegers K)⁰ K) = 1 :=
  V.prod_mul_plucker_eq_one hy h𝔞 hchar hp

/-- **Layer 4.3 — the finite places of a tuple of algebraic integers, landed** as
`NumberField.FinitePlace.finprod_iSup_eq_inv_absNorm` in
`ArithmeticHeights/FinitePlaceIdeal.lean`: the finite part of the height of a tuple is the inverse
absolute norm of the ideal it generates. This is what turns the ideal identity above into a height
identity, and it is the number-field replacement for "the finite places contribute `1`". -/
example {σ : Type*} [Finite σ] {x : σ → NumberField.RingOfIntegers K} (hx : ∃ i, x i ≠ 0) :
    ∏ᶠ v : NumberField.FinitePlace K, (⨆ i, v ((x i : K)))
      = ((Ideal.absNorm (Ideal.span (Set.range x)) : ℝ))⁻¹ :=
  NumberField.FinitePlace.finprod_iSup_eq_inv_absNorm hx

end NumberFieldLattice

section Extraction

variable {F K E V W : Type*}
variable [Field F] [Field K] [Field E]
variable [Algebra F K] [Algebra F E] [FiniteDimensional F K]
variable [AddCommGroup V] [Module F V] [Module K V] [IsScalarTower F K V]
variable [AddCommGroup W] [Module F W] [Module E W] [IsScalarTower F E W]

/-- **Layer 4.4 — the counting half of the extraction lemma, landed** as
`LinearIndependent.fintype_card_le_finrank_mul_finrank_span`. A family of vectors of a
`K`-vector space whose image under an `F`-linear map is linearly independent over a field
`E ⊇ F` has size at most `[K : F]` times the `K`-dimension of its span. With `F = ℚ`, `E = ℝ`
and the mixed embedding as the map: `ℝ`-independent lattice vectors of a `K`-subspace span, over
`K`, a subspace of dimension at least their number divided by the degree. -/
example
    (f : V →ₗ[F] W) {ι : Type*} [Fintype ι] {u : ι → V}
    (h : LinearIndependent E (f ∘ u)) :
    Fintype.card ι ≤ finrank F K * finrank K (Submodule.span K (Set.range u)) :=
  h.fintype_card_le_finrank_mul_finrank_span (K := K) f

/-- **Layer 4.4 — the selection half, landed** as
`LinearIndependent.exists_linearIndependent_comp_finrank_mul`. From `d · k` vectors with
`E`-independent images, a `K`-linearly independent subfamily of size `k` whose `j`-th member
(zero-indexed) is among the first `d · j + 1` — members of the family, never linear combinations,
so each keeps the norm bound of the successive minimum it realizes. -/
example
    (f : V →ₗ[F] W) {k : ℕ} {u : Fin (finrank F K * k) → V}
    (h : LinearIndependent E (f ∘ u)) :
    ∃ s : Fin k → Fin (finrank F K * k), LinearIndependent K (u ∘ s) ∧
      ∀ j : Fin k, (s j).val ≤ finrank F K * j.val :=
  h.exists_linearIndependent_comp_finrank_mul (K := K) f

/-- **Layer 4.4 — greedy selection under arbitrary index bounds, landed** as
`exists_linearIndependent_comp_of_lt_finrank_span`. The third statement of the milestone, and the
one carrying the induction: it mentions neither `F`, `E` nor `f`, and the bound function `m` need
not be monotone. The two statements above are this one supplied with `m j = d · j`, its hypothesis
discharged by the counting half. -/
example {n : ℕ} (u : Fin n → V) {k : ℕ} (m : Fin k → ℕ)
    (hm : ∀ j : Fin k, j.val < finrank K (Submodule.span K (u '' {i : Fin n | i.val ≤ m j}))) :
    ∃ s : Fin k → Fin n, LinearIndependent K (u ∘ s) ∧ ∀ j : Fin k, (s j).val ≤ m j :=
  exists_linearIndependent_comp_of_lt_finrank_span u m hm

end Extraction

section CubeSlicing

/-- **Layer 4.5 — the unit-ball volume `ω_n`, landed** as `unitBallVolume` in
`ArithmeticHeights/CubeSlicing.lean`: the archimedean slice volume of 5.3 and the normalizing
constant of the product-of-balls body below. -/
example (n : ℕ) : unitBallVolume n
    = (MeasureTheory.volume (Metric.ball (0 : EuclideanSpace ℝ (Fin n)) 1)).toReal := rfl

open MeasureTheory in
/-- **Layer 4.5 — the Prékopa–Leindler inequality, landed** (Bombieri–Gubler, Lemma C.3.3, the one
step of Appendix C.3 they import rather than prove) as `Real.prekopaLeindler` on `ℝ`, and through
`HasPrekopaLeindler.prod` and `HasPrekopaLeindler.of_measurePreserving` as
`hasPrekopaLeindler_euclideanSpace` on the space cube slicing is stated on. This is the reverse
of Hölder's inequality; Mathlib has neither it nor Brunn–Minkowski, so
`Real.volume_add_volume_le_volume_add` — the one-dimensional Brunn–Minkowski inequality — is
landed with it. -/
example (n : ℕ) (a b : ℝ) (ha : 0 < a) (hb : 0 < b) (hab : a + b = 1)
    (f g h : EuclideanSpace ℝ (Fin n) → ENNReal)
    (hf : Measurable f) (hg : Measurable g) (hh : Measurable h)
    (key : ∀ x y, f x ^ a * g y ^ b ≤ h (a • x + b • y)) :
    (∫⁻ x, f x) ^ a * (∫⁻ y, g y) ^ b ≤ ∫⁻ z, h z :=
  hasPrekopaLeindler_euclideanSpace n a b ha hb hab f g h hf hg hh key

open MeasureTheory in
/-- **Layer 4.5 — log-concavity of a marginal, landed** (Bombieri–Gubler, Lemma C.3.4) as
`LogConcave.setLIntegral_prod_right`. This is the only consumer of Prékopa–Leindler inside the
roadmap, and the rung C.3.7's induction on the number of blocks stands on. -/
example {n m : ℕ} (f : EuclideanSpace ℝ (Fin n) × EuclideanSpace ℝ (Fin m) → ENNReal)
    (hf : Measurable f) (hlc : LogConcave f) {A : Set (EuclideanSpace ℝ (Fin m))}
    (hA : MeasurableSet A) (hAc : Convex ℝ A) :
    LogConcave fun x => ∫⁻ y in A, f (x, y) :=
  hlc.setLIntegral_prod_right (hasPrekopaLeindler_euclideanSpace m) hf hA hAc

open MeasureTheory in
/-- **Layer 4.5 — the Gauss measure of a symmetric convex set is at most its volume inside a
product of balls of volume one, landed** (Bombieri–Gubler, Lemma C.3.7) as
`hasSliceBound_prodBall`. This is the inequality Theorem C.3.8 is extracted from; the induction is
on the coordinates, with `HasSliceBound.prod` as the step and `hasSliceBound_unitVolumeBall` — a
ray-by-ray comparison through polar decomposition — as the base case. -/
example {N r : ℕ} (blk : Fin N → Fin r) (A : Set (EuclideanSpace ℝ (Fin N)))
    (hA : MeasurableSet A) (hAc : Convex ℝ A) (hAs : ∀ x ∈ A, -x ∈ A) :
    ∫⁻ x in A, gaussDensity x ≤ volume (A ∩ prodBall blk) :=
  hasSliceBound_prodBall blk A hA hAc hAs

/-- **Layer 4.5 — the product-of-balls theorem, landed** (Bombieri–Gubler, Theorem C.3.8) as
`one_le_volume_inter_prodBall`. Partition the `N` coordinates into blocks by `blk : Fin N → Fin r`,
and let `Q` be the product over the blocks of the euclidean ball **of volume `1`** in the block's
coordinates, i.e. of radius `ω_m ^ (-1/m)` for a block of size `m`. Then every central slice of
`Q` by a subspace `V` has volume at least `1`, the volume on `V` being the canonical one of its
inner-product structure (Mathlib's `measureSpaceOfInnerProductSpace`). The blocks of size `1`
give the cube case below; blocks of size `2` are the complex places of Layer 5. -/
example {N r : ℕ} (blk : Fin N → Fin r)
    (V : Submodule ℝ (EuclideanSpace ℝ (Fin N))) :
    1 ≤ MeasureTheory.volume {x : V | ∀ i : Fin r,
      ∑ j ∈ Finset.univ.filter (fun j ↦ blk j = i), (x : EuclideanSpace ℝ (Fin N)) j ^ 2 ≤
        unitBallVolume (Finset.univ.filter (fun j ↦ blk j = i)).card ^
          (-(2 / ((Finset.univ.filter (fun j ↦ blk j = i)).card : ℝ)))} :=
  one_le_volume_inter_prodBall blk V

/-- **Layer 4.5 — Vaaler's cube-slicing theorem, landed** (Vaaler 1979) as
`two_pow_finrank_le_volume_inter_cube`: the case of blocks of size `1`, rescaled, so that every
central slice of the cube `[−1, 1]ᴺ` by a `k`-dimensional subspace has `k`-volume at least `2 ^ k`.
Coordinate subspaces give equality, so the bound is sharp. This is what the `ℚ` spine 5.2
consumes. -/
example {N : ℕ} (V : Submodule ℝ (EuclideanSpace ℝ (Fin N))) :
    (2 : ENNReal) ^ finrank ℝ V ≤
      MeasureTheory.volume {x : V | ∀ i, |(x : EuclideanSpace ℝ (Fin N)) i| ≤ 1} :=
  two_pow_finrank_le_volume_inter_cube V

/-- **Layer 4.5 — the inscribed-cube bound at a complex place, landed** as
`two_pow_le_volume_inter_polydisc`. A `k`-dimensional complex subspace of `ℂⁿ`, viewed as a
`2k`-dimensional real subspace of `ℝ^{2n}` with coordinates `(Re, Im)`, meets the unit polydisc in
volume at least `2 ^ k`: the polydisc contains the cube of half-side `1 / √2`, of volume
`(2/√2)^{2k} = 2^k` on the slice by the cube case. This is the lemma that gives the first bound of
5.4 from the cube case alone; the product-of-balls form gives `π ^ k` here and hence 5.4's sharper
constant. Stated for a real subspace closed under the complex structure `J`, `J (x, y) = (-y, x)`,
expressed coordinatewise — **and that hypothesis is not needed**, so it is absent from the
delivered form: the cube case gives `√2 ^ k` on the slice, and `2 ^ (k / 2) ≤ √2 ^ k` holds
whether or not `k` is even. -/
example {n : ℕ}
    (V : Submodule ℝ (EuclideanSpace ℝ (Fin n × Fin 2))) :
    (2 : ENNReal) ^ (finrank ℝ V / 2) ≤
      MeasureTheory.volume {x : V | ∀ i : Fin n,
        (x : EuclideanSpace ℝ (Fin n × Fin 2)) (i, 0) ^ 2 +
          (x : EuclideanSpace ℝ (Fin n × Fin 2)) (i, 1) ^ 2 ≤ 1} :=
  two_pow_le_volume_inter_polydisc V

end CubeSlicing

/-! ## Layer 5: Siegel's lemma and Bombieri–Vaaler (the summit)

Every statement over a number field is in the **absolute** normalization on both sides: absolute
heights of the solutions on the left, and on the right the absolute Arakelov height of the row
space, i.e. `Submodule.arakelovMulHeight … ^ (finrank ℚ K)⁻¹`. Over `ℤ` the two normalizations
coincide.

The row space of `A` is `Submodule.span K (Set.range A.row)` and full row rank is
`LinearIndependent K A.row`, both as Layer 3.3 delivers them; `Submodule.arakelovMulHeight` is
Layer 3.2's `H_Ar`, which no longer takes a rank. -/

/-! ### Layer 5.1 — classical Siegel, in height form

Mathlib's `Int.Matrix.exists_ne_zero_int_vec_norm_le` in this roadmap's vocabulary: the
translation it is read through, the statement itself, the sharpness of its exponent, and the
number-field corollary, which is Mathlib's `house`-normalized version with the left-hand side
changed. -/

section SiegelClassical

/-- **Layer 5.1 — the sup-norm-to-height translation, landed** as
`Rat.gcd_mul_mulHeight_intCast`: the height of an integer tuple is its sup norm divided by the
greatest common divisor of its entries. Mathlib's `Rat.mulHeight_eq_max_abs_of_gcd_eq_one` is the
primitive case. -/
example {ι : Type*} [Fintype ι] [Nonempty ι] {x : ι → ℤ} (hx : x ≠ 0) :
    ((Finset.univ.gcd x : ℤ) : ℝ) * Height.mulHeight (((↑) : ℤ → ℚ) ∘ x) =
      ((⨆ i, |x i| : ℤ) : ℝ) :=
  Rat.gcd_mul_mulHeight_intCast hx

/-- **Layer 5.1 — classical Siegel in height form, landed** (Bombieri–Gubler, Lemma 2.9.1;
Hindry–Silverman, Lemma D.4.1) as `Int.Matrix.exists_ne_zero_mulVec_eq_zero_mulHeight_le`, with
`Int.Matrix.exists_ne_zero_mulVec_eq_zero_iSup_abs_le` the sup-norm form it is read off. The
hypothesis `1 ≤ B` is what removes the `max 1 ‖A‖` of Mathlib's statement, and costs nothing. -/
example {m n : Type*} [Fintype m] [Fintype n] (A : Matrix m n ℤ) {B : ℤ} (hB : 1 ≤ B)
    (hA : ∀ i j, |A i j| ≤ B) (hmn : Fintype.card m < Fintype.card n)
    (hm : 0 < Fintype.card m) :
    ∃ x : n → ℤ, x ≠ 0 ∧ A.mulVec x = 0 ∧
      Height.mulHeight (((↑) : ℤ → ℚ) ∘ x) ≤ ((Fintype.card n : ℝ) * B) ^
        ((Fintype.card m : ℝ) / ((Fintype.card n : ℝ) - Fintype.card m)) :=
  Int.Matrix.exists_ne_zero_mulVec_eq_zero_mulHeight_le A hB hA hmn hm

/-- **Layer 5.1 — the exponent `M / (N − M)` is sharp, landed** as
`Int.Matrix.exists_forall_pow_le_iSup_abs`: the `M × (M + 1)` system `B xᵢ = xᵢ₊₁` has entries
bounded by `B` and no nonzero solution of sup norm below `B ^ M`. -/
example (M : ℕ) {B : ℤ} (hB : 1 ≤ B) :
    ∃ A : Matrix (Fin M) (Fin (M + 1)) ℤ, (∀ i j, |A i j| ≤ B) ∧
      ∀ x : Fin (M + 1) → ℤ, x ≠ 0 → A.mulVec x = 0 → B ^ M ≤ ⨆ j, |x j| :=
  Int.Matrix.exists_forall_pow_le_iSup_abs M hB

/-- **Layer 5.1 — the number-field corollary, landed** (Bombieri–Gubler, Corollary 2.9.2) as
`NumberField.exists_forall_exists_ne_zero_mulVec_eq_zero_absMulHeight_le`. The constant is
Mathlib's and is `private` there, so it is quantified over; the content on this side is
`NumberField.absMulHeight_le_iSup_house`, which turns the house bound on each coordinate into a
bound on the absolute height of the tuple without losing a constant. -/
example (K : Type*) [Field K] [NumberField K] :
    ∃ C : ℝ, ∀ (p q : ℕ) (a : Matrix (Fin p) (Fin q) (𝓞 K)) (A : ℝ), a ≠ 0 → 0 < p → p < q →
      (∀ k l, house ((a k l : K)) ≤ A) →
      ∃ ξ : Fin q → 𝓞 K, ξ ≠ 0 ∧ a.mulVec ξ = 0 ∧
        absMulHeight (fun l ↦ ((ξ l : K))) ≤ C * ((C * q * A) ^ ((p : ℝ) / (q - p))) :=
  NumberField.exists_forall_exists_ne_zero_mulVec_eq_zero_absMulHeight_le K

end SiegelClassical

section Siegel

variable {K : Type*} [Field K] [NumberField K] {ι : Type*} [Fintype ι] [LinearOrder ι]

/-! ### Layer 5 over `ℤ`

Bombieri–Vaaler 1983, Theorems 1 and 2. The Gram matrix is `A * Aᵀ`, the `M × M` determinant of the
rows; `Aᵀ * A` is `N × N` and singular whenever `M < N`, and stating it that way is the standard
slip these signatures exist to prevent. Layer 3.4's Gram criterion,
`Matrix.det_mul_transpose_self_eq_zero_iff`, is what makes the left-hand side of the bound nonzero
under `hrank`. -/

section SiegelInt

variable {ι : Type*} [Fintype ι] [LinearOrder ι] {m : ℕ}

/-! Layer 5.2 is landed in `ArithmeticHeights/BombieriVaaler.lean`. Two shapes drifted on the way
in, and both are visible below. The row index is `Fin m` rather than a general `Fintype`, which is
what `exteriorPower.plucker` and the whole of Layer 3 are stated for, so `Int.Matrix.minorGcd`
needs no `Fintype.equivFin` and no `Finset.image`. And the rank hypothesis is linear independence
of the rows over `ℚ`, which `Int.Matrix.linearIndependent_row_map_rat_iff` identifies with
`(A * A.transpose).det ≠ 0` — a condition on the integer matrix alone, and the one that makes `A ≠ 0`
redundant. The absolute values around the determinant and the divisor are gone with it: the Gram
determinant of the rows is a sum of squares, hence positive here, and `Int.Matrix.minorGcd` is a
normalized greatest common divisor, hence at least `1`. -/

/-- **Layer 5.2 — the hypothesis, landed** as `Int.Matrix.linearIndependent_row_map_rat_iff`: full
row rank over `ℚ` is exactly non-vanishing of the Gram determinant over `ℤ`. This is Layer 3.4's
Gram criterion, and it is what replaces `hA : A ≠ 0` together with `hrank`. -/
example (A : Matrix (Fin m) ι ℤ) :
    LinearIndependent ℚ (A.map ((↑) : ℤ → ℚ)).row ↔ (A * A.transpose).det ≠ 0 :=
  Int.Matrix.linearIndependent_row_map_rat_iff A

/-- **Layer 5.2 — the identity the bound is, landed** as
`Int.Matrix.minorGcd_mul_arakelovMulHeight_ker`: `D` times the Arakelov height of the solution
space is `√(det (A A.transpose))`. Layer 3.5's duality carries the height of the solution space to the row
space, Layer 3.3 reads that off the maximal minors, and Layer 3.4's Cauchy–Binet identity turns
their euclidean norm into the Gram determinant. -/
example (A : Matrix (Fin m) ι ℤ) (hA : LinearIndependent ℚ (A.map ((↑) : ℤ → ℚ)).row) :
    ((Int.Matrix.minorGcd A : ℤ) : ℝ) *
        (LinearMap.ker (A.map ((↑) : ℤ → ℚ)).mulVecLin).arakelovMulHeight
      = Real.sqrt (((A * A.transpose).det : ℤ) : ℝ) :=
  Int.Matrix.minorGcd_mul_arakelovMulHeight_ker A hA

/-- **Layer 5.2, Bombieri–Vaaler Theorem 2 — a small basis, landed** as
`Int.Matrix.exists_linearIndependent_mulVec_eq_zero_prod_iSup_abs_le`. The statement Layers 5.3 and
5.4 generalize to a number field. Over `ℤ` the extraction 4.4 is vacuous — the minima vectors of
4.2 are already the basis — and the constant is 3.4's Cauchy–Binet determinant with 4.5's slice
bound; the adele-free assembly is written out in Aliev–Henk §6. No hypothesis `M < N` is needed. -/
example (A : Matrix (Fin m) ι ℤ) (hA : LinearIndependent ℚ (A.map ((↑) : ℤ → ℚ)).row) :
    ∃ x : Fin (Fintype.card ι - m) → (ι → ℤ), LinearIndependent ℤ x ∧ (∀ l, A.mulVec (x l) = 0) ∧
      (∏ l, ((⨆ i, |x l i| : ℤ) : ℝ)) ≤
        Real.sqrt (((A * A.transpose).det : ℤ) : ℝ) / ((Int.Matrix.minorGcd A : ℤ) : ℝ) :=
  Int.Matrix.exists_linearIndependent_mulVec_eq_zero_prod_iSup_abs_le A hA

/-- **Layer 5.2, Theorem 2 in height form, landed** as
`Int.Matrix.exists_linearIndependent_mulVec_eq_zero_prod_mulHeight_le` — the `K = ℚ` case of Layer
5.4, whose discriminant factor is `1` there. It is strictly weaker than the sup-norm form, by
Layer 5.1's `Rat.gcd_mul_mulHeight_intCast`. -/
example (A : Matrix (Fin m) ι ℤ) (hA : LinearIndependent ℚ (A.map ((↑) : ℤ → ℚ)).row) :
    ∃ x : Fin (Fintype.card ι - m) → (ι → ℤ), LinearIndependent ℤ x ∧ (∀ l, A.mulVec (x l) = 0) ∧
      (∏ l, Height.mulHeight (((↑) : ℤ → ℚ) ∘ x l)) ≤
        Real.sqrt (((A * A.transpose).det : ℤ) : ℝ) / ((Int.Matrix.minorGcd A : ℤ) : ℝ) :=
  Int.Matrix.exists_linearIndependent_mulVec_eq_zero_prod_mulHeight_le A hA

/-- **Layer 5.2, Bombieri–Vaaler Theorem 1 — one small solution, landed** as
`Int.Matrix.exists_ne_zero_mulVec_eq_zero_iSup_abs_le_det_rpow`. -/
example (A : Matrix (Fin m) ι ℤ) (hA : LinearIndependent ℚ (A.map ((↑) : ℤ → ℚ)).row)
    (hmn : m < Fintype.card ι) :
    ∃ x : ι → ℤ, x ≠ 0 ∧ A.mulVec x = 0 ∧
      ((⨆ i, |x i| : ℤ) : ℝ) ≤
        (Real.sqrt (((A * A.transpose).det : ℤ) : ℝ) / ((Int.Matrix.minorGcd A : ℤ) : ℝ)) ^
          (((Fintype.card ι : ℝ) - m)⁻¹) :=
  Int.Matrix.exists_ne_zero_mulVec_eq_zero_iSup_abs_le_det_rpow A hA hmn

/-- **Layer 5.2 — the invariance, landed** as `Int.Matrix.sqrt_det_div_minorGcd_unit_mul`
(Bombieri–Vaaler (2.5)): the bound is a height on the Grassmannian, so a row operation of
determinant `±1` does not move it. This is what Theorem 1 has over Layer 5.1. -/
example {U : Matrix (Fin m) (Fin m) ℤ} (hU : IsUnit U.det) (A : Matrix (Fin m) ι ℤ) :
    Real.sqrt ((((U * A) * (U * A).transpose).det : ℤ) : ℝ) / ((Int.Matrix.minorGcd (U * A) : ℤ) : ℝ)
      = Real.sqrt (((A * A.transpose).det : ℤ) : ℝ) / ((Int.Matrix.minorGcd A : ℤ) : ℝ) :=
  Int.Matrix.sqrt_det_div_minorGcd_unit_mul hU A

end SiegelInt

/-! Layer 5.3 is landed in `ArithmeticHeights/BombieriVaalerField.lean`, on the geometry of
`ArithmeticHeights/MixedBall.lean`. One hypothesis drifted out: the milestone's `hA` — full row
rank of `A` — is **not needed**. Layer 3.5's `Matrix.arakelovMulHeight_ker_mulVecLin` identifies
the height of the solution space with the height of the row space for an arbitrary matrix, and
the geometric half never looks at `A`; `hA` would only pin `k = N − M`. The landed statement takes
`k` implicitly, from `hk`. -/

/-- **Layer 5.3 — Bombieri–Vaaler over a number field, Hermitian form, landed** as
`NumberField.exists_basis_ker_prod_arakelovMulHeight_rpow_le` (Bombieri–Vaaler 1983; the
inequality Vaaler 2003 quotes as (1.3)). For `A` an `M × N` matrix over a number field `K` of
degree `d` with `r₁` real and `r₂` complex places, the solution space of `A x = 0` has a basis
`x₁, …, x_k` with coordinates in `𝓞 K` and

`∏ l, H_Ar(x l) ≤ [(2^k / ω_k)^{r₁} (2^k / ω_{2k})^{r₂}]^{1/d} · |D_{K/ℚ}| ^ (k / (2 d)) · H_Ar(A)`,

absolute Arakelov heights on both sides, `H_Ar(A)` the Arakelov height of the row space. This
needs 4.1–4.4 and no cube slicing: the slices of the ℓ² balls are balls. The hypothesis `hA` is
carried here only to record that the milestone asked for it; the proof does not use it. -/
example {m : ℕ} (A : Matrix (Fin m) ι K) (_hA : LinearIndependent K A.row)
    (k : ℕ) (hk : finrank K (LinearMap.ker A.mulVecLin) = k) :
    ∃ b : Basis (Fin k) K (LinearMap.ker A.mulVecLin),
      (∀ l j, IsIntegral ℤ ((b l : ι → K) j)) ∧
      (∏ l, arakelovMulHeight (fun j ↦ (b l : ι → K) j) ^ (finrank ℚ K : ℝ)⁻¹) ≤
        ((2 ^ k / unitBallVolume k) ^ NumberField.InfinitePlace.nrRealPlaces K *
            (2 ^ k / unitBallVolume (2 * k)) ^ NumberField.InfinitePlace.nrComplexPlaces K) ^
              (finrank ℚ K : ℝ)⁻¹ *
          |(NumberField.discr K : ℝ)| ^ ((k : ℝ) / (2 * finrank ℚ K)) *
          (Submodule.span K (Set.range A.row)).arakelovMulHeight ^ (finrank ℚ K : ℝ)⁻¹ :=
  NumberField.exists_basis_ker_prod_arakelovMulHeight_rpow_le A hk

/-- **Layer 5.3 for a subspace, in relative heights, landed** as
`NumberField.exists_basis_prod_arakelovMulHeight_le`. This is the form the proof produces: no
roots are taken, and the basis vectors are exhibited as integral points of `V` rather than
through a `Basis`. -/
example (V : Submodule K (ι → K)) :
    ∃ x : Fin (finrank K V) → (ι → K), LinearIndependent K x ∧
      (∀ l, x l ∈ V.integerPoints) ∧
      (∏ l, arakelovMulHeight (x l))
        ≤ ((2 : ℝ) ^ finrank K V / unitBallVolume (finrank K V)) ^
              NumberField.InfinitePlace.nrRealPlaces K
            * ((2 : ℝ) ^ finrank K V / unitBallVolume (2 * finrank K V)) ^
              NumberField.InfinitePlace.nrComplexPlaces K
            * (Real.sqrt |(NumberField.discr K : ℝ)| ^ finrank K V * V.arakelovMulHeight) :=
  NumberField.exists_basis_prod_arakelovMulHeight_le V

/-- **Layer 5.3 — the slice bound, landed** as
`NumberField.mixedEmbedding.volume_preimage_mixedBall_mixedSpan`. The body of the milestone is the
product over the infinite places of the ℓ² unit balls, and its slice by the real span of a
`K`-subspace of dimension `k` has volume `ω_k^{r₁} ω_{2k}^{r₂}` — the slice of a euclidean ball by
a subspace is a euclidean ball, so Layer 4.5 is not used. -/
example (V : Submodule K (ι → K)) :
    MeasureTheory.volume ((Subtype.val : ↥V.mixedSpan → NumberField.mixedEmbedding.mixedPi K ι) ⁻¹'
        NumberField.mixedEmbedding.mixedBall K ι)
      = ENNReal.ofReal (unitBallVolume (finrank K V)) ^
            NumberField.InfinitePlace.nrRealPlaces K
          * ENNReal.ofReal (unitBallVolume (2 * finrank K V)) ^
            NumberField.InfinitePlace.nrComplexPlaces K :=
  NumberField.mixedEmbedding.volume_preimage_mixedBall_mixedSpan V

/-- **Layer 5.3 — the height estimate, landed** as
`NumberField.mixedEmbedding.arakelovMulHeight_le_of_mem_smul_mixedBall`. An integral tuple whose
mixed embedding lies in `r · B` has Arakelov height at most `r ^ d`: the archimedean factors are
weighted by `mult v` and `∑_v mult v = d`, and the finite factors of an integral tuple are at most
one. This is what converts a successive minimum into a height. -/
example {r : ℝ} (hr : 0 < r) {x : ι → K} (hx : x ≠ 0)
    (hint : ∀ l, ∃ z : 𝓞 K, (z : K) = x l)
    (hmem : mixedPiEmb K ι x ∈ r • NumberField.mixedEmbedding.mixedBall K ι) :
    arakelovMulHeight x ≤ r ^ finrank ℚ K :=
  NumberField.mixedEmbedding.arakelovMulHeight_le_of_mem_smul_mixedBall hr hx hint hmem

/-! ### Layer 5.4 — landed

**Bombieri–Vaaler over a number field, max-norm form**, in
`ArithmeticHeights/BombieriVaalerMaxNorm.lean` on `ArithmeticHeights/MixedCube.lean`. Two drifts
from the shapes this file pinned. The rank hypothesis on `A` is **unnecessary**, for the reason it
was unnecessary in 5.3 — it is kept in the `example`s below, unused, to record that; and the
dimension `k` is a hypothesis rather than an argument, which also lets the statement read at
`k = 0`. Both constants are delivered, and the subspace form the proof actually produces — in the
relative sup-norm height, with no roots taken — is delivered beside them.
-/

/-- **Layer 5.4 — the summit, landed** as
`NumberField.exists_basis_ker_prod_absMulHeight_le`. -/
example {m : ℕ} (A : Matrix (Fin m) ι K) (_hA : LinearIndependent K A.row)
    (k : ℕ) (hk : finrank K (LinearMap.ker A.mulVecLin) = k) :
    ∃ b : Basis (Fin k) K (LinearMap.ker A.mulVecLin),
      (∀ l j, IsIntegral ℤ ((b l : ι → K) j)) ∧
      (∏ l, absMulHeight (fun j ↦ (b l : ι → K) j)) ≤
        |(NumberField.discr K : ℝ)| ^ ((k : ℝ) / (2 * finrank ℚ K)) *
          (Submodule.span K (Set.range A.row)).arakelovMulHeight ^ (finrank ℚ K : ℝ)⁻¹ :=
  NumberField.exists_basis_ker_prod_absMulHeight_le A hk

/-- **Layer 5.4 — the same at Bombieri–Vaaler's own constant, landed** as
`NumberField.exists_basis_ker_prod_absMulHeight_le'`. The product-of-balls form of 4.5 at the
complex places gives the factor `(2 / π) ^ (k r₂ / d)`, which is `≤ 1`, so this implies the
statement above and is strictly sharper whenever `K` has a complex place. -/
example {m : ℕ} (A : Matrix (Fin m) ι K) (_hA : LinearIndependent K A.row)
    (k : ℕ) (hk : finrank K (LinearMap.ker A.mulVecLin) = k) :
    ∃ b : Basis (Fin k) K (LinearMap.ker A.mulVecLin),
      (∀ l j, IsIntegral ℤ ((b l : ι → K) j)) ∧
      (∏ l, absMulHeight (fun j ↦ (b l : ι → K) j)) ≤
        (2 / Real.pi) ^
            ((k * NumberField.InfinitePlace.nrComplexPlaces K : ℝ) / finrank ℚ K) *
          |(NumberField.discr K : ℝ)| ^ ((k : ℝ) / (2 * finrank ℚ K)) *
          (Submodule.span K (Set.range A.row)).arakelovMulHeight ^ (finrank ℚ K : ℝ)⁻¹ :=
  NumberField.exists_basis_ker_prod_absMulHeight_le' A hk

/-- **Layer 5.4 — the subspace form the proof produces, landed** as
`NumberField.exists_basis_prod_mulHeight_le`: relative sup-norm heights on the left, the relative
Arakelov height of `V` on the right, no roots taken, and the basis exhibited as integral points of
`V` rather than through a `Basis`. -/
example (V : Submodule K (ι → K)) :
    ∃ x : Fin (finrank K V) → (ι → K), LinearIndependent K x ∧
      (∀ l, x l ∈ V.integerPoints) ∧
      (∏ l, Height.mulHeight (x l))
        ≤ (2 / Real.pi) ^
              (finrank K V * NumberField.InfinitePlace.nrComplexPlaces K)
            * (Real.sqrt |(NumberField.discr K : ℝ)| ^ finrank K V * V.arakelovMulHeight) :=
  NumberField.exists_basis_prod_mulHeight_le V

/-- **Layer 5.4 — the slice bound, landed** as
`NumberField.mixedEmbedding.one_le_volume_preimage_mixedCube`. The body is the product over the
infinite places of the sup-norm balls of the local coordinates, normalized so that every
one-coordinate factor has volume one; in the standard real coordinates it *is* a product of
euclidean balls of volume one, so Vaaler's theorem of Layer 4.5 applies verbatim and the bound is
a clean `1`. -/
example (V : Submodule K (ι → K)) :
    1 ≤ MeasureTheory.volume {y : ↥V.mixedSpan |
        (y : NumberField.mixedEmbedding.mixedPi K ι) ∈
          NumberField.mixedEmbedding.mixedCube K ι} :=
  NumberField.mixedEmbedding.one_le_volume_preimage_mixedCube V.mixedSpan

/-- **Layer 5.4 — the height estimate, landed** as
`NumberField.mixedEmbedding.mulHeight_le_pow_of_mem_smul_mixedCube`. This is where the
normalization of the body is paid back: an integral tuple in `r · B` has relative sup-norm height
at most `2^{−r₁} π^{−r₂} · r ^ d`, and those are the two constants that combine with `2^{d k}`
from 4.2 and `2^{−r₂ k}` from 4.3 into `(2/π)^{k r₂}`. -/
example {r : ℝ} (hr : 0 < r) {x : ι → K} (hx : x ≠ 0)
    (hint : ∀ l, ∃ z : 𝓞 K, (z : K) = x l)
    (hmem : mixedPiEmb K ι x ∈ r • NumberField.mixedEmbedding.mixedCube K ι) :
    Height.mulHeight x ≤
      ((2 : ℝ)⁻¹ ^ NumberField.InfinitePlace.nrRealPlaces K
          * (Real.pi : ℝ)⁻¹ ^ NumberField.InfinitePlace.nrComplexPlaces K) * r ^ finrank ℚ K :=
  NumberField.mixedEmbedding.mulHeight_le_pow_of_mem_smul_mixedCube hr hx hint hmem

/-! ### Layer 5.5 — landed

**The corollaries applications quote**, in `ArithmeticHeights/BombieriVaalerEntries.lean` on
`ArithmeticHeights/RowEntryHeight.lean`. The shape this file pinned is delivered exactly, as
`NumberField.exists_ne_zero_mem_ker_absMulHeight_le_of_linearIndependent_row`; the drift is that
the independence hypothesis is **not needed**, and the library's primary statements are in terms
of `A.rank`, of which the pinned form is the special case. Corollary 2.9.7, the non-maximal-rank
product bound over the row-space height, needed nothing new: it is 5.4.
-/

/-- **Layer 5.5 — the single small solution, landed** as
`NumberField.exists_ne_zero_mem_ker_absMulHeight_le_of_linearIndependent_row`, in exactly the
shape pinned here. -/
example {m : ℕ} (A : Matrix (Fin m) ι K)
    (hA : LinearIndependent K A.row) (hm : m < Fintype.card ι) :
    ∃ x : ι → K, x ≠ 0 ∧ A.mulVec x = 0 ∧ (∀ j, IsIntegral ℤ (x j)) ∧
      absMulHeight x ≤
        |(NumberField.discr K : ℝ)| ^ (2 * finrank ℚ K : ℝ)⁻¹ *
          (Real.sqrt (Fintype.card ι) * A.mulHeight ^ (finrank ℚ K : ℝ)⁻¹) ^
            ((m : ℝ) / (Fintype.card ι - m)) :=
  NumberField.exists_ne_zero_mem_ker_absMulHeight_le_of_linearIndependent_row A hA hm

/-- **Layer 5.5 — the same without a rank hypothesis, landed** as
`NumberField.exists_ne_zero_mem_ker_absMulHeight_le`: the exponent is `rank A`, and the only
hypothesis is that the system is underdetermined. -/
example {m : ℕ} (A : Matrix (Fin m) ι K) (hm : A.rank < Fintype.card ι) :
    ∃ x : ι → K, x ≠ 0 ∧ A.mulVec x = 0 ∧ (∀ j, IsIntegral ℤ (x j)) ∧
      absMulHeight x ≤
        |(NumberField.discr K : ℝ)| ^ (2 * finrank ℚ K : ℝ)⁻¹ *
          (Real.sqrt (Fintype.card ι) * A.mulHeight ^ (finrank ℚ K : ℝ)⁻¹) ^
            ((A.rank : ℝ) / (Fintype.card ι - A.rank)) :=
  NumberField.exists_ne_zero_mem_ker_absMulHeight_le A hm

/-- **Layer 5.5 — the product bound over a basis of the solution space, landed** as
`NumberField.exists_basis_ker_prod_absMulHeight_le_entries`. This is Bombieri–Gubler's Corollary
2.9.9; the single solution above is extracted from it by `H ≥ 1`. -/
example [Nonempty ι] {m : ℕ} (A : Matrix (Fin m) ι K) {k : ℕ}
    (hk : finrank K (LinearMap.ker A.mulVecLin) = k) :
    ∃ b : Basis (Fin k) K (LinearMap.ker A.mulVecLin),
      (∀ l j, IsIntegral ℤ ((b l : ι → K) j)) ∧
      (∏ l, absMulHeight (fun j ↦ (b l : ι → K) j)) ≤
        |(NumberField.discr K : ℝ)| ^ ((k : ℝ) / (2 * finrank ℚ K)) *
          (Real.sqrt (Fintype.card ι) * A.mulHeight ^ (finrank ℚ K : ℝ)⁻¹) ^ A.rank :=
  NumberField.exists_basis_ker_prod_absMulHeight_le_entries A hk

/-- **Layer 5.5 — the row space against the rows, landed** as
`Matrix.arakelovMulHeight_span_range_row_le_prod`. This is 2.9.8, the inequality the milestone is
really about; the `√N` and the exponent `rank A` come after it. -/
example {m : ℕ} {A : Matrix (Fin m) ι K} (hA : LinearIndependent K A.row) :
    (Submodule.span K (Set.range A.row)).arakelovMulHeight
      ≤ ∏ i, arakelovMulHeight (A i) :=
  Matrix.arakelovMulHeight_span_range_row_le_prod hA

/-- **Layer 3.4 — Hadamard's inequality at a complex place, landed** as
`Matrix.sum_sq_norm_plucker_row_le_prod`. Layer 3.4 delivered the inequality in an ordered field,
which is not what an infinite place of a number field produces; this is the Hermitian form, and
5.5 is its only consumer. -/
example {m : ℕ} (B : Matrix (Fin m) ι ℂ) :
    ∑ s : Set.powersetCard ι m, ‖exteriorPower.plucker m B.row s‖ ^ 2
      ≤ ∏ i, ∑ j, ‖B i j‖ ^ 2 :=
  Matrix.sum_sq_norm_plucker_row_le_prod B

/-! ### Layer 5.6 — landed

The milestone is `NumberField.exists_linearIndependent_mem_ker_prod_absMulHeight_le` in
`ArithmeticHeights/BombieriVaalerRelative.lean`, on
`ArithmeticHeights/RestrictScalars.lean`. This is the one signature this file pinned that the
proof did not change: the statement below is the `sorry` it carried, discharged by the library.
-/

/-- **Layer 5.6 — the relative version, landed** (Bombieri–Gubler, Theorem 2.9.19): the entries
lie in a finite extension `F/K` of degree `r` while the solutions are required to lie in `K`. With
`M` rows and `r M < N`, there are `N − r M` `K`-linearly independent solutions with

`∏ l, H(x l) ≤ |D_{K/ℚ}| ^ ((N − r M) / (2 d)) · ∏ i, H_Ar(A i) ^ r`,

`H_Ar(A i)` the absolute Arakelov height of the `i`-th row, an element of `F ^ N`. This is the
form transcendence arguments use when the auxiliary construction and the field of definition
differ. -/
example (F : Type*) [Field F] [NumberField F] [Algebra K F] {m : ℕ} (A : Matrix (Fin m) ι F)
    (hmn : finrank K F * m < Fintype.card ι) :
    ∃ x : Fin (Fintype.card ι - finrank K F * m) → (ι → K),
      LinearIndependent K x ∧ (∀ l, A.mulVec (fun j ↦ algebraMap K F (x l j)) = 0) ∧
      (∀ l j, IsIntegral ℤ (x l j)) ∧
      (∏ l, absMulHeight (x l)) ≤
        |(NumberField.discr K : ℝ)| ^
            ((Fintype.card ι - finrank K F * m : ℝ) / (2 * finrank ℚ K)) *
          ∏ i, (arakelovMulHeight (A i) ^ (finrank ℚ F : ℝ)⁻¹) ^ finrank K F :=
  NumberField.exists_linearIndependent_mem_ker_prod_absMulHeight_le A hmn

/-- **Layer 5.6 — the single small solution, landed** as
`NumberField.exists_ne_zero_mem_ker_absMulHeight_le_relative`. This is the form
Bombieri–Gubler's own applications of 2.9.19 quote. -/
example (F : Type*) [Field F] [NumberField F] [Algebra K F] {m : ℕ} (A : Matrix (Fin m) ι F)
    (hmn : finrank K F * m < Fintype.card ι) :
    ∃ x : ι → K, x ≠ 0 ∧ A.mulVec (fun j ↦ algebraMap K F (x j)) = 0 ∧
      (∀ j, IsIntegral ℤ (x j)) ∧
      absMulHeight x ≤
        |(NumberField.discr K : ℝ)| ^ (2 * finrank ℚ K : ℝ)⁻¹ *
          (∏ i, (arakelovMulHeight (A i) ^ (finrank ℚ F : ℝ)⁻¹) ^ finrank K F)
            ^ ((Fintype.card ι - finrank K F * m : ℝ))⁻¹ :=
  NumberField.exists_ne_zero_mem_ker_absMulHeight_le_relative A hmn

/-- **Layer 5.6 — the product bound over a basis of the solution space, landed** as
`NumberField.exists_basis_ker_prod_absMulHeight_le_relative`. The solution space is the kernel of
`Matrix.mulVecRestrict`, the `K`-linear map `x ↦ A x` on `K`-rational vectors; no basis of `F/K`
appears. Its exponent on the discriminant is the dimension of that kernel, which is why the
milestone above needs the rearrangement by increasing height. -/
example (F : Type*) [Field F] [NumberField F] [Algebra K F] {m : ℕ} (A : Matrix (Fin m) ι F)
    {k : ℕ} (hk : finrank K (LinearMap.ker (Matrix.mulVecRestrict (K := K) A)) = k) :
    ∃ b : Basis (Fin k) K (LinearMap.ker (Matrix.mulVecRestrict (K := K) A)),
      (∀ l j, IsIntegral ℤ ((b l : ι → K) j)) ∧
      (∏ l, absMulHeight fun j ↦ (b l : ι → K) j) ≤
        |(NumberField.discr K : ℝ)| ^ ((k : ℝ) / (2 * finrank ℚ K)) *
          ∏ i, (arakelovMulHeight (A i) ^ (finrank ℚ F : ℝ)⁻¹) ^ finrank K F :=
  NumberField.exists_basis_ker_prod_absMulHeight_le_relative A hk

/-- **Layer 5.6 — 2.9.8 over a finite extension, landed** as
`Matrix.arakelovMulHeight_span_restrictScalars_rpow_le'`. The inequality the milestone is really
about: the height of the row space of the descended system against the rows of `A` over `F`. The
field carrying the conjugates is built inside the proof and appears in no statement. -/
example (F : Type*) [Field F] [NumberField F] [Algebra K F] {m r : ℕ} (e : Basis (Fin r) K F)
    (A : Matrix (Fin m) ι F) :
    (Submodule.span K (Set.range (Matrix.restrictScalars e A).row)).arakelovMulHeight
        ^ (finrank ℚ K : ℝ)⁻¹
      ≤ ∏ i, (arakelovMulHeight (A i) ^ (finrank ℚ F : ℝ)⁻¹) ^ r :=
  Matrix.arakelovMulHeight_span_restrictScalars_rpow_le' e A

/-- **Layer 0.3 — the Arakelov extension law, landed** as
`NumberField.arakelovMulHeight_pow_finrank`, and **Layer 0.4 — the embedding-invariance of the
absolute Arakelov height, landed** as `NumberField.arakelovMulHeight_rpow_comp`. Both were added
when 5.6 landed; the second is what turns `H_Ar(σ Aᵢ) = H_Ar(Aᵢ)` into a theorem. -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L] {κ : Type*} [Fintype κ] (x : κ → K) :
    arakelovMulHeight x ^ finrank K L = arakelovMulHeight (algebraMap K L ∘ x) :=
  NumberField.arakelovMulHeight_pow_finrank x

end Siegel

/-! ### Layer 5.7 — landed

**The auxiliary-polynomial form**, in `ArithmeticHeights/AuxiliaryPolynomial.lean` on
`ArithmeticHeights/MonomialIndex.lean`. This file never pinned a signature for 5.7, so what
follows records the delivered shape rather than a discharged `sorry`. Two things about it were
decided by the proof and not by the roadmap: the bound is on Layer 2.1's height of the
*polynomial*, so the degree bound `D` occurs only in the hypotheses; and the relative form's
feasibility hypothesis is `r · rank A < N`, which sent Layer 5.6 back for a rank form of both its
statements.
-/

section AuxiliaryPolynomial

variable {K : Type*} [Field K] [NumberField K] {σ : Type*} [Finite σ] {N D : ℕ}

/-- **Layer 5.7 — the auxiliary polynomial, landed** as
`MvPolynomial.exists_ne_zero_mem_ker_mulHeight_rpow_le`. `N` linear conditions on the
coefficients of a polynomial in the variables `σ` of total degree at most `D`, of rank `R` less
than the number `M` of such monomials, are satisfied by a nonzero polynomial with integral
coefficients and `H(P) ≤ |D| ^ (1 / (2 d)) · (√M · H(A)) ^ (R / (M − R))`. -/
example (A : Matrix (Fin N) {m : σ →₀ ℕ // m.degree ≤ D} K)
    (hA : A.rank < Fintype.card {m : σ →₀ ℕ // m.degree ≤ D}) :
    ∃ P : MvPolynomial σ K, P ≠ 0 ∧ P.totalDegree ≤ D ∧
      (∀ m, IsIntegral ℤ (P.coeff m)) ∧
      A.mulVec (fun m ↦ P.coeff (m : σ →₀ ℕ)) = 0 ∧
      P.mulHeight ^ ((finrank ℚ K : ℝ))⁻¹ ≤
        |(NumberField.discr K : ℝ)| ^ (2 * finrank ℚ K : ℝ)⁻¹ *
          (Real.sqrt (Fintype.card {m : σ →₀ ℕ // m.degree ≤ D}) *
              A.mulHeight ^ ((finrank ℚ K : ℝ))⁻¹) ^
            ((A.rank : ℝ) / (Fintype.card {m : σ →₀ ℕ // m.degree ≤ D} - A.rank)) :=
  MvPolynomial.exists_ne_zero_mem_ker_mulHeight_rpow_le A hA

/-- **Layer 5.7 under the hypothesis users check, landed** as
`MvPolynomial.exists_ne_zero_mem_ker_mulHeight_rpow_le_of_lt`: fewer conditions than
coefficients, at the cost of the weaker exponent `N / (M − N)`. Without the feasibility
hypothesis the statement is false — one variable, `D = 0` and the condition "the coefficient
vanishes". -/
example (A : Matrix (Fin N) {m : σ →₀ ℕ // m.degree ≤ D} K)
    (hN : N < Fintype.card {m : σ →₀ ℕ // m.degree ≤ D}) :
    ∃ P : MvPolynomial σ K, P ≠ 0 ∧ P.totalDegree ≤ D ∧
      (∀ m, IsIntegral ℤ (P.coeff m)) ∧
      A.mulVec (fun m ↦ P.coeff (m : σ →₀ ℕ)) = 0 ∧
      P.mulHeight ^ ((finrank ℚ K : ℝ))⁻¹ ≤
        |(NumberField.discr K : ℝ)| ^ (2 * finrank ℚ K : ℝ)⁻¹ *
          (Real.sqrt (Fintype.card {m : σ →₀ ℕ // m.degree ≤ D}) *
              A.mulHeight ^ ((finrank ℚ K : ℝ))⁻¹) ^
            ((N : ℝ) / (Fintype.card {m : σ →₀ ℕ // m.degree ≤ D} - N)) :=
  MvPolynomial.exists_ne_zero_mem_ker_mulHeight_rpow_le_of_lt A hN

/-- **Layer 5.7 — the basis form, landed** as
`MvPolynomial.exists_linearIndependent_mem_ker_prod_mulHeight_rpow_le`. The independence is
independence of the *polynomials*, carried over from the solution vectors by the injective linear
map `MvPolynomial.ofDegreeLE`. -/
example (A : Matrix (Fin N) {m : σ →₀ ℕ // m.degree ≤ D} K) {k : ℕ}
    (hk : finrank K (LinearMap.ker A.mulVecLin) = k) :
    ∃ P : Fin k → MvPolynomial σ K, LinearIndependent K P ∧
      (∀ l, (P l).totalDegree ≤ D) ∧ (∀ l m, IsIntegral ℤ ((P l).coeff m)) ∧
      (∀ l, A.mulVec (fun m ↦ (P l).coeff (m : σ →₀ ℕ)) = 0) ∧
      ∏ l, (P l).mulHeight ^ ((finrank ℚ K : ℝ))⁻¹ ≤
        |(NumberField.discr K : ℝ)| ^ ((k : ℝ) / (2 * finrank ℚ K)) *
          (Real.sqrt (Fintype.card {m : σ →₀ ℕ // m.degree ≤ D}) *
              A.mulHeight ^ ((finrank ℚ K : ℝ))⁻¹) ^ A.rank :=
  MvPolynomial.exists_linearIndependent_mem_ker_prod_mulHeight_rpow_le A hk

/-- **Layer 5.7 — the relative form, landed** as
`MvPolynomial.exists_ne_zero_mem_ker_mulHeight_rpow_le_relative`: the conditions have
coefficients in `F / K` of degree `s` while the polynomial is required to be defined over `K`,
and the feasibility hypothesis is `s · rank A < M`. -/
example {F : Type*} [Field F] [NumberField F] [Algebra K F]
    (A : Matrix (Fin N) {m : σ →₀ ℕ // m.degree ≤ D} F)
    (hA : finrank K F * A.rank < Fintype.card {m : σ →₀ ℕ // m.degree ≤ D}) :
    ∃ P : MvPolynomial σ K, P ≠ 0 ∧ P.totalDegree ≤ D ∧
      (∀ m, IsIntegral ℤ (P.coeff m)) ∧
      A.mulVec (fun m ↦ algebraMap K F (P.coeff (m : σ →₀ ℕ))) = 0 ∧
      P.mulHeight ^ ((finrank ℚ K : ℝ))⁻¹ ≤
        |(NumberField.discr K : ℝ)| ^ (2 * finrank ℚ K : ℝ)⁻¹ *
          (∏ i, (arakelovMulHeight (A i) ^ ((finrank ℚ F : ℝ))⁻¹) ^ finrank K F) ^
            ((Fintype.card {m : σ →₀ ℕ // m.degree ≤ D} - finrank K F * A.rank : ℝ))⁻¹ :=
  MvPolynomial.exists_ne_zero_mem_ker_mulHeight_rpow_le_relative A hA

/-- **Layer 5.7 — the relative basis form, landed** as
`MvPolynomial.exists_linearIndependent_mem_ker_prod_mulHeight_rpow_le_relative`. -/
example {F : Type*} [Field F] [NumberField F] [Algebra K F]
    (A : Matrix (Fin N) {m : σ →₀ ℕ // m.degree ≤ D} F)
    (hA : finrank K F * A.rank < Fintype.card {m : σ →₀ ℕ // m.degree ≤ D}) :
    ∃ P : Fin (Fintype.card {m : σ →₀ ℕ // m.degree ≤ D} - finrank K F * A.rank) →
        MvPolynomial σ K,
      LinearIndependent K P ∧ (∀ l, (P l).totalDegree ≤ D) ∧
      (∀ l m, IsIntegral ℤ ((P l).coeff m)) ∧
      (∀ l, A.mulVec (fun m ↦ algebraMap K F ((P l).coeff (m : σ →₀ ℕ))) = 0) ∧
      ∏ l, (P l).mulHeight ^ ((finrank ℚ K : ℝ))⁻¹ ≤
        |(NumberField.discr K : ℝ)| ^
            ((Fintype.card {m : σ →₀ ℕ // m.degree ≤ D} - finrank K F * A.rank : ℝ) /
              (2 * finrank ℚ K)) *
          ∏ i, (arakelovMulHeight (A i) ^ ((finrank ℚ F : ℝ))⁻¹) ^ finrank K F :=
  MvPolynomial.exists_linearIndependent_mem_ker_prod_mulHeight_rpow_le_relative A hA

/-- **Layer 5.7 — the dimension of the coefficient space, landed** as
`Finsupp.card_subtype_degree_le`: there are `(D + r).choose r` monomials of degree at most `D` in
`r` variables. Mathlib has stars and bars for degree *exactly* `D`, through
`Finset.finsuppAntidiag`; the slack variable is `Finsupp.degreeLEEquivDegreeEq`. -/
example : Fintype.card {m : σ →₀ ℕ // m.degree ≤ D}
    = (D + Nat.card σ).choose (Nat.card σ) := by
  have : Fintype σ := Fintype.ofFinite σ
  rw [Finsupp.card_subtype_degree_le, Nat.card_eq_fintype_card]

/-- **Layer 5.6 with the rank in place of the number of rows, landed** as
`NumberField.exists_linearIndependent_mem_ker_prod_absMulHeight_le_rank`. Added when 5.7 landed:
the descended system has `K`-rank at most `r · rank A`, so `r · rank A < N` already produces
`N − r · rank A` solutions. -/
example {F : Type*} [Field F] [NumberField F] [Algebra K F] {ι : Type*} [Fintype ι]
    [LinearOrder ι] {m : ℕ} (A : Matrix (Fin m) ι F)
    (hmn : finrank K F * A.rank < Fintype.card ι) :
    ∃ x : Fin (Fintype.card ι - finrank K F * A.rank) → (ι → K),
      LinearIndependent K x ∧
      (∀ l, A.mulVec (fun j ↦ algebraMap K F (x l j)) = 0) ∧
      (∀ l j, IsIntegral ℤ (x l j)) ∧
      (∏ l, absMulHeight (x l)) ≤
        |(NumberField.discr K : ℝ)| ^
            ((Fintype.card ι - finrank K F * A.rank : ℝ) / (2 * finrank ℚ K))
          * ∏ i, (arakelovMulHeight (A i) ^ (finrank ℚ F : ℝ)⁻¹) ^ finrank K F :=
  NumberField.exists_linearIndependent_mem_ker_prod_absMulHeight_le_rank A hmn

end AuxiliaryPolynomial

/-! ## Layer 6: heights and the unit group

Mathlib proves Dirichlet's unit theorem in full (`NumberField.Units.logEmbedding`, `unitLattice`,
`unitLattice_span_eq_top`, `rank`, `fundSystem`, `regulator`) and has `S`-integers and `S`-units
(`Set.integer`, `Set.unit` in `Mathlib/RingTheory/DedekindDomain/SInteger.lean`). This layer
builds the height-side dictionary around them and the `S`-unit theorem Mathlib does not have; it
re-proves none of the unit theorem and redefines none of the `S`-objects. -/

/-! ### Layer 6.1 — landed

The height of a unit, and Dirichlet's logarithmic embedding:
`ArithmeticHeights/UnitHeight.lean`. -/

section UnitHeight

variable {K : Type*} [Field K] [NumberField K]

open NumberField.InfinitePlace in
/-- **Layer 6.1 — the height of a unit is carried by the infinite places, landed** as
`NumberField.Units.logHeight₁_eq_sum_posPart`. Every finite local factor of a unit is `1`, by
`NumberField.FinitePlace.apply_units_eq_one`, so the height is the sum of the positive parts of
the weighted logarithms over the infinite places. -/
example (u : (𝓞 K)ˣ) :
    logHeight₁ ((u : 𝓞 K) : K)
      = ∑ w : InfinitePlace K, ((w.mult : ℝ) * Real.log (w ((u : 𝓞 K) : K)))⁺ :=
  NumberField.Units.logHeight₁_eq_sum_posPart u

open NumberField.InfinitePlace in
/-- **Layer 6.1 — twice the height is the ℓ¹ norm of the full vector of weighted logarithms,
landed** as `NumberField.Units.two_mul_logHeight₁_eq_sum_abs`. The vector sums to `0` by the
product formula, so its negative parts repeat its positive ones. -/
example (u : (𝓞 K)ˣ) :
    2 * logHeight₁ ((u : 𝓞 K) : K)
      = ∑ w : InfinitePlace K, |(w.mult : ℝ) * Real.log (w ((u : 𝓞 K) : K))| :=
  NumberField.Units.two_mul_logHeight₁_eq_sum_abs u

open scoped Classical in
open NumberField.InfinitePlace NumberField.Units.dirichletUnitTheorem in
/-- **Layer 6.1 — the height through Dirichlet's logarithmic embedding, landed** as
`NumberField.Units.logHeight₁_eq_sum_posPart_logEmbedding`. `logEmbedding` drops the coordinate
at the distinguished place `w₀`; by the product formula that coordinate is minus the sum of the
others, and it is the second summand here. ⚠ It is not zero in general. -/
example (u : (𝓞 K)ˣ) :
    logHeight₁ ((u : 𝓞 K) : K)
      = (∑ w : {w : InfinitePlace K // w ≠ w₀},
          (NumberField.Units.logEmbedding K (Additive.ofMul u) w)⁺)
        + (-∑ w : {w : InfinitePlace K // w ≠ w₀},
            NumberField.Units.logEmbedding K (Additive.ofMul u) w)⁺ :=
  NumberField.Units.logHeight₁_eq_sum_posPart_logEmbedding u

open scoped Classical in
open NumberField.InfinitePlace NumberField.Units.dirichletUnitTheorem in
/-- **Layer 6.1 — the two-sided comparison with the ℓ¹ norm of the logarithmic embedding,
landed** as `NumberField.Units.sum_abs_logEmbedding_le_two_mul_logHeight₁` and
`NumberField.Units.logHeight₁_le_sum_abs_logEmbedding`. The factor `2` is sharp: it is the
dropped coordinate, and `NumberField.Units.two_mul_logHeight₁_eq_sum_abs_logEmbedding_iff` says
when it vanishes. -/
example (u : (𝓞 K)ˣ) :
    (∑ w : {w : InfinitePlace K // w ≠ w₀},
        |NumberField.Units.logEmbedding K (Additive.ofMul u) w|) / 2
        ≤ logHeight₁ ((u : 𝓞 K) : K) ∧
      logHeight₁ ((u : 𝓞 K) : K)
        ≤ ∑ w : {w : InfinitePlace K // w ≠ w₀},
            |NumberField.Units.logEmbedding K (Additive.ofMul u) w| :=
  ⟨by linarith [NumberField.Units.sum_abs_logEmbedding_le_two_mul_logHeight₁ u],
    NumberField.Units.logHeight₁_le_sum_abs_logEmbedding u⟩

/-- **Layer 6.1 — the units of bounded height are finite, landed** as
`NumberField.Units.finite_setOf_logHeight₁_le`. This is Northcott (Layer 1.1) along the injection
of `(𝓞 K)ˣ` into `K`, and the same comparison run backwards recovers Mathlib's
`unitLattice_inter_ball_finite`, which `ArithmeticHeights/UnitHeight.lean` checks. -/
example (B : ℝ) : {u : (𝓞 K)ˣ | logHeight₁ ((u : 𝓞 K) : K) ≤ B}.Finite :=
  NumberField.Units.finite_setOf_logHeight₁_le B

end UnitHeight

/-! ### Layer 6.2 — landed

Units of height one: `ArithmeticHeights/UnitTorsion.lean`. -/

section UnitTorsion

variable {K : Type*} [Field K] [NumberField K]

/-- **Layer 6.2 — units of height one, landed** as
`NumberField.Units.absMulHeight₁_eq_one_iff_mem_torsion`. The height-theoretic identification of
the torsion subgroup. ⚠ Neither Kronecker (1.4) nor `logEmbedding_ker` is needed: by 6.1 twice
the height is a sum of absolute values over the infinite places, so it vanishes exactly when each
term does, which is Mathlib's `NumberField.Units.mem_torsion` verbatim. Both routes the milestone
names are checked as acceptance criteria instead. -/
example (u : (𝓞 K)ˣ) :
    NumberField.absMulHeight₁ ((u : 𝓞 K) : K) = 1 ↔ u ∈ NumberField.Units.torsion K :=
  NumberField.Units.absMulHeight₁_eq_one_iff_mem_torsion u

open NumberField.InfinitePlace in
/-- **Layer 6.2 — the step that does the work, landed** as
`NumberField.Units.logHeight₁_eq_zero_iff_forall_infinitePlace`. A unit has height one exactly
when every infinite place sends it to `1`. -/
example (u : (𝓞 K)ˣ) :
    logHeight₁ ((u : 𝓞 K) : K) = 0 ↔ ∀ w : InfinitePlace K, w ((u : 𝓞 K) : K) = 1 :=
  NumberField.Units.logHeight₁_eq_zero_iff_forall_infinitePlace u

/-- **Layer 6.2 — the height and the logarithmic embedding vanish together, landed** as
`NumberField.Units.logHeight₁_eq_zero_iff_logEmbedding_eq_zero`. 6.1's two-sided comparison
carries a factor `2` and so says nothing about the common zero set; this does. -/
example (u : (𝓞 K)ˣ) :
    logHeight₁ ((u : 𝓞 K) : K) = 0
      ↔ NumberField.Units.logEmbedding K (Additive.ofMul u) = 0 :=
  NumberField.Units.logHeight₁_eq_zero_iff_logEmbedding_eq_zero u

/-- **Layer 6.2 — the unit hypothesis is no restriction, landed** as
`NumberField.RingOfIntegers.isUnit_of_absMulHeight₁_eq_one`, with
`NumberField.RingOfIntegers.absMulHeight₁_eq_one_iff_isOfFinOrder` beside it. A nonzero algebraic
integer of height one is a root of unity, hence a unit. This is where Kronecker (1.4) is actually
used. -/
example {x : 𝓞 K} (hx : x ≠ 0) (h : NumberField.absMulHeight₁ (x : K) = 1) : IsUnit x :=
  NumberField.RingOfIntegers.isUnit_of_absMulHeight₁_eq_one hx h

/-- **Layer 6.2 — the gap above one is strict off the torsion subgroup, landed** as
`NumberField.Units.absLogHeight₁_pos_of_notMem_torsion`, and applied to Mathlib's `fundSystem` as
`NumberField.Units.prod_absLogHeight₁_fundSystem_pos`: the product of heights that Layer 6.3
bounds the regulator by is positive, so the bound is not vacuous. -/
example : 0 < ∏ i, NumberField.absLogHeight₁ ((NumberField.Units.fundSystem K i : 𝓞 K) : K) :=
  NumberField.Units.prod_absLogHeight₁_fundSystem_pos K

end UnitTorsion

/-! ### Layer 6.3 — landed

The regulator and the heights of a fundamental system: `ArithmeticHeights/Regulator.lean`. -/

section Regulator

variable {K : Type*} [Field K] [NumberField K]

/-- **Layer 6.3 — Hadamard's bound, landed** as
`NumberField.Units.regulator_le_prod_absLogHeight₁`, with
`NumberField.Units.regOfFamily_le_prod_absLogHeight₁` for an arbitrary family and
`NumberField.Units.regulator_le_prod_logHeight₁` in the relative height, where the constant is
`2 ^ r`. ⚠ The pinned route named the ℓ² form of Hadamard's inequality; the library uses the ℓ¹
form, `Matrix.abs_det_le_prod_sum_abs`, added to Layer 3.4 for this layer. The `2 d` and not a `d`
is Layer 6.1's factor `2` — the coordinate `logEmbedding` drops — and not a loss in Hadamard's
inequality. -/
example :
    NumberField.Units.regulator K ≤
      (2 * Module.finrank ℚ K : ℝ) ^ NumberField.Units.rank K *
        ∏ i, NumberField.absLogHeight₁ ((NumberField.Units.fundSystem K i : 𝓞 K) : K) :=
  NumberField.Units.regulator_le_prod_absLogHeight₁ K

/-- **Layer 6.3 — a fundamental system of small height exists, landed** as
`NumberField.Units.exists_fundSystem_prod_absLogHeight₁_le`. The pinned shape and the pinned
constant survived intact. Layer 4.2 against the ℓ¹ unit ball of the log space
(`NumberField.Units.volume_logBall`, `NumberField.Units.prod_successiveMinimum_logBall_le`), the
basis of Layer 4.6, and the comparison of Layer 6.1. -/
example :
    ∃ ε : Fin (NumberField.Units.rank K) → (𝓞 K)ˣ,
      Subgroup.closure (Set.range ε) ⊔ NumberField.Units.torsion K = ⊤ ∧
      ∏ i, NumberField.absLogHeight₁ ((ε i : 𝓞 K) : K) ≤
        ((NumberField.Units.rank K).factorial : ℝ) ^ 2 /
            (2 ^ (NumberField.Units.rank K - 1) *
              (Module.finrank ℚ K : ℝ) ^ NumberField.Units.rank K) *
          NumberField.Units.regulator K :=
  NumberField.Units.exists_fundSystem_prod_absLogHeight₁_le K

/-- **Layer 6.3 — a family of units that spans the unit lattice is a fundamental system, landed**
as `NumberField.Units.closure_sup_torsion_eq_top_of_span`. This is the step that turns the basis
of Layer 4.6 — a basis of `unitLattice K` and nothing more — into a generating set modulo torsion,
and it is what makes the statement above about *fundamental* systems. -/
example {m : ℕ} (ε : Fin m → (𝓞 K)ˣ)
    (h : Submodule.span ℤ (Set.range fun i ↦
        NumberField.Units.logEmbedding K (Additive.ofMul (ε i)))
      = NumberField.Units.unitLattice K) :
    Subgroup.closure (Set.range ε) ⊔ NumberField.Units.torsion K = ⊤ :=
  NumberField.Units.closure_sup_torsion_eq_top_of_span ε h

/-- **Layer 6.3 — neither bound is vacuous, landed** as
`NumberField.Units.prod_absLogHeight₁_pos_of_closure_sup_torsion_eq_top`. For Mathlib's
`fundSystem` this is Layer 6.2; for an arbitrary fundamental system that route is not available,
and the positivity instead comes from this layer — such a family has maximal rank because its
regulator is the regulator of `K`, and a linearly independent family has no zero member. -/
example {u : Fin (NumberField.Units.rank K) → (𝓞 K)ˣ}
    (h : Subgroup.closure (Set.range u) ⊔ NumberField.Units.torsion K = ⊤) :
    0 < ∏ i, NumberField.absLogHeight₁ ((u i : 𝓞 K) : K) :=
  NumberField.Units.prod_absLogHeight₁_pos_of_closure_sup_torsion_eq_top h

/-- **Layer 6.3 — at unit rank zero the two bounds meet, landed** as
`NumberField.Units.regulator_eq_one_of_rank_eq_zero`. Both products are empty, so Hadamard's bound
reads `R ≤ 1` and the reduced system reads `1 ≤ R`. Mathlib records
`NumberField.Units.regulator_pos` but not this value. -/
example (h : NumberField.Units.rank K = 0) : NumberField.Units.regulator K = 1 :=
  NumberField.Units.regulator_eq_one_of_rank_eq_zero K h

end Regulator

/-! ### Layer 6.4 — landed

`S`-integers, `S`-units, and where their height lives: `ArithmeticHeights/SUnit.lean`. -/

section SUnit

variable {K : Type*} [Field K] [NumberField K]

/-- **Layer 6.4 — the height of an `S`-unit, landed** as
`NumberField.mulHeight₁_eq_of_mem_unit`: the height is carried by the infinite places together
with the places of `S`. ⚠ The library proves this from
`NumberField.mulHeight₁_eq_of_mem_integer`, which asks only that `x` be an `S`-integer; the
`S`-unit hypothesis is not what the display needs. -/
example (S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 K))) {x : Kˣ} (hx : x ∈ S.unit K) :
    mulHeight₁ (x : K)
      = (∏ w : InfinitePlace K, max (w (x : K)) 1 ^ w.mult)
        * ∏ᶠ v ∈ S, max (FinitePlace.mk v (x : K)) 1 :=
  NumberField.mulHeight₁_eq_of_mem_unit S hx

/-- **Layer 6.4 — the converse, landed** as `Set.mem_unit_iff_finitePlace`: an element of `Kˣ`
whose absolute values at the finite places outside `S` are all `1` is an `S`-unit. -/
example (S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 K))) (x : Kˣ)
    (h : ∀ v ∉ S, FinitePlace.mk v (x : K) = 1) : x ∈ S.unit K :=
  (Set.mem_unit_iff_finitePlace S x).mpr h

/-- **Layer 6.4 — the display characterizes the `S`-integers, landed** as
`NumberField.mulHeight₁_eq_iff_mem_integer`. Every local factor is at least `1`, so one finite
place outside `S` carrying absolute value greater than `1` already breaks the identity: `S` cannot
be shrunk. -/
example (S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 K))) {x : K} (hx : x ≠ 0) :
    mulHeight₁ x
        = (∏ w : InfinitePlace K, max (w x) 1 ^ w.mult)
          * ∏ᶠ v ∈ S, max (FinitePlace.mk v x) 1
      ↔ x ∈ S.integer K :=
  NumberField.mulHeight₁_eq_iff_mem_integer S hx

/-- **Layer 6.4 — `S = ∅` recovers `𝓞 K` and its units, landed** as
`Set.mem_integer_empty_iff` and `Set.mem_unit_empty_iff`. Mathlib reaches the second through
`IsDedekindDomain.integer_empty`, `Set.unitEquivUnitsInteger` and `Algebra.botEquivOfInjective`;
the library argues directly, `x` and `x⁻¹` both having every valuation at most `1`. -/
example {x : Kˣ} :
    x ∈ (∅ : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 K))).unit K ↔
      ∃ u : (𝓞 K)ˣ, ((u : 𝓞 K) : K) = (x : K) :=
  Set.mem_unit_empty_iff

/-- **Layer 6.4 — the finite part of the height of a rational, landed** as
`NumberField.FinitePlace.finprod_apply_ratCast`. This is the acceptance test the roadmap names for
this layer, and the statement of the provenance file `FinitePlaceProduct.lean`. -/
example {q : ℚ} (hq : q ≠ 0) :
    ∏ᶠ w : FinitePlace K, w (q : K) = (|(q : ℝ)| ^ finrank ℚ K)⁻¹ :=
  NumberField.FinitePlace.finprod_apply_ratCast hq

end SUnit

/-! ### Layer 6.5 — landed

The `S`-unit theorem, the `S`-logarithmic embedding and the `S`-regulator:
`ArithmeticHeights/SUnitTheorem.lean` and `ArithmeticHeights/SRegulator.lean`. -/

section SUnitTheorem

variable {K : Type*} [Field K] [NumberField K]

/-- **Layer 6.5 — the `S`-unit theorem, landed** in the form and under the name of mathlib4#40791,
as `Set.unit_finrank_numberField`. For a finite set `S` of finite places, Mathlib's `S`-unit group
`S.unit K` has `ℤ`-rank `r₁ + r₂ − 1 + |S|`. -/
example (S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 K))) (hS : S.Finite) :
    Module.finrank ℤ (Additive (S.unit K)) = NumberField.Units.rank K + Nat.card S :=
  Set.unit_finrank_numberField S hS

/-- **Layer 6.5 — the `S`-units are finitely generated, landed** as `Set.unit_fg`. This and the
rank statement above are the two open TODOs of Mathlib's
`Mathlib/RingTheory/DedekindDomain/SInteger.lean`. -/
example (S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 K))) (hS : S.Finite) :
    Group.FG (S.unit K) := S.unit_fg hS

/-- **Layer 6.5 — a fundamental system of `S`-units, landed** as `Set.exists_unit_fundSystem`, in
the shape of Mathlib's `NumberField.Units.exist_unique_eq_mul_prod`. ⚠ The library also carries
`Set.exists_unit_fundSystem'`, where the root of unity is unique as well: it is determined by the
exponents, so the pinned uniqueness is the weaker of the two available. -/
example (S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 K))) (hS : S.Finite) :
    ∃ ε : Fin (NumberField.Units.rank K + Nat.card S) → S.unit K,
      ∀ x : S.unit K, ∃! e : Fin (NumberField.Units.rank K + Nat.card S) → ℤ,
        ∃ ζ ∈ CommGroup.torsion (S.unit K), x = ζ * ∏ i, ε i ^ e i :=
  S.exists_unit_fundSystem hS

/-- **Layer 6.5 — the `S`-logarithmic embedding has image a full lattice, landed** as
`NumberField.SUnit.unitLattice_span_eq_top` together with the discreteness instance, so that
`NumberField.SUnit.unitLattice S` is an `IsZLattice`. Its rank is read off the dimension of the
space, independently of the group-theoretic computation above. -/
example (S : Finset (IsDedekindDomain.HeightOneSpectrum (𝓞 K))) :
    Module.finrank ℤ (NumberField.SUnit.unitLattice S) = NumberField.Units.rank K + S.card :=
  NumberField.SUnit.finrank_unitLattice S

/-- **Layer 6.5 — the `S`-regulator, landed** as `NumberField.SUnit.regulator`, the covolume of
the `S`-unit lattice, with `S = ∅` giving back `NumberField.Units.regulator`. ⚠ The recovery is a
theorem and not a definitional unfolding; see the findings above. -/
example : NumberField.SUnit.regulator (∅ : Finset (IsDedekindDomain.HeightOneSpectrum (𝓞 K)))
    = NumberField.Units.regulator K :=
  NumberField.SUnit.regulator_empty

open scoped Classical in
/-- **Layer 6.5 — the `S`-analogue of Layer 6.1, landed** as
`NumberField.SUnit.two_mul_logHeight₁_eq_sum_abs_logEmbedding_add_abs_sum`: twice the height of an
`S`-unit is the ℓ¹ norm of the coordinates the `S`-logarithmic embedding keeps plus the size of
the one it drops. As in 6.1 this is an identity, not an inequality. -/
example (S : Finset (IsDedekindDomain.HeightOneSpectrum (𝓞 K)))
    (x : ((S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 K))).unit K)) :
    2 * Height.logHeight₁ ((x : Kˣ) : K)
      = (∑ i, |NumberField.SUnit.logEmbedding S (Additive.ofMul x) i|)
        + |∑ i, NumberField.SUnit.logEmbedding S (Additive.ofMul x) i| :=
  NumberField.SUnit.two_mul_logHeight₁_eq_sum_abs_logEmbedding_add_abs_sum x

end SUnitTheorem

/-! ## Worked examples (acceptance criteria)

The cheap checks that the definitions mean what they should. All five the roadmap lists are
discharged in the library, in the file of the layer they test, and are not restated here — an
`example` is anonymous, so repeating one would mean repeating its proof.

* `Height.mulHeight₁ (3 / 4 : ℚ) = 4`, the rational height from Mathlib's `Rat.mulHeight₁_eq_max`:
  `ArithmeticHeights/Absolute.lean`, where the absolute and relative heights are compared over `ℚ`.
  A definition that does not give `4` has numerator and denominator confused.
* `NumberField.arakelovMulHeight ![(1 : ℚ), 1] = √2` and `Height.mulHeight ![(1 : ℚ), 1] = 1`:
  `ArithmeticHeights/Arakelov.lean`. The two normalizations genuinely differ, so the `√N` of 5.5
  and the `H_Ar` on the right of 5.3 and 5.4 are not cosmetic.
* The rejection test for Layer 1.4 — a transcendental has absolute height one by the junk value,
  not by Kronecker: `ArithmeticHeights/Kronecker.lean`, stated for an arbitrary element that is not
  integral over `ℚ` rather than for `π`, which needs a transcendence proof to instantiate.
* The rejection test for Layer 2.1 — `(C (2 : ℚ)).mulHeight = 1` against
  `Height.mulHeight₁ (2 : ℚ) = 2`, refuting `mulHeight (C a) = mulHeight₁ a`:
  `ArithmeticHeights/Polynomial.lean`.

Every landed file carries acceptance, rejection and conformance examples of its own beyond these;
they are listed under *Worked examples* in the roadmap.
-/

end

end TauCetiRoadmap.ArithmeticHeights
