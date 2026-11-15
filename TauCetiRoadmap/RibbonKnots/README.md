# Roadmap: ribbon knots and ribbon concordance

**Summary.** This roadmap defines ribbon discs and ribbon knots on Tau Ceti's smooth slice discs
(`TauCeti.IsSmoothSliceDisc`), and ribbon concordances on Tau Ceti's smooth concordances
(`TauCeti.SmoothEmbedding.Concordance`), both through a Morse condition with no local maxima. Its
end theorems, for knots in the unit sphere `S³` of `ℝ⁴`, are: ribbon concordance is reflexive
and transitive (1.2); for a ribbon concordance `F` from `K₀` to `K₁`, the inclusion of the
complement of `K₀` into the complement of `F` in `S³ × [0, 1]` is injective on fundamental
groups and that of `K₁` surjective (Gordon, 1.3); if `K₀` and `K₁` are each ribbon concordant to
the other, they are smoothly ambient isotopic (Agol, 1.4). A knot is ribbon exactly when the unknot
is ribbon concordant to it (1.1). It also states, as targets whose carriers are owned elsewhere,
the monotonicity of the Seifert genus and of the degree of the Alexander polynomial under ribbon
concordance (1.5) and Lisca's theorem that a smoothly slice two-bridge knot is ribbon (2.1).

## Scope and ownership

Owned here: the ribbon disc and the ribbon knot (0.1), the ribbon concordance relation and its
order properties (1.1–1.4) with the three inputs of Agol's proof stated in 1.4, Zemke's
injectivity theorem (1.5), and Lisca's theorem with the branched-cover step of its proof (2.1).

Not owned here:

- Knots, sliceness, concordance and the concordance group are GeometricTopology's (Layer 4 and
  Layer 6.1), on the Tau Ceti carriers `TauCeti.SmoothCircleEmbedding`, `TauCeti.IsSmoothlySlice`
  and `TauCeti.SmoothEmbedding.Concordance`.
- The Seifert surface and the Seifert genus are GeometricTopology 4.3's; the Alexander polynomial
  and the determinant are GeometricTopology 4.4's; the Levine–Tristram signatures of slice knots
  are GeometricTopology 6.2's; two-bridge knots are GeometricTopology 4.10's; knot exteriors with
  their meridians and preferred longitudes are GeometricTopology 5.1's; Waldhausen's relative
  realization theorem is GeometricTopology 8.3.1's.
- Knot Floer homology is HeegaardFloer's (Layer 7.6); Zemke's injectivity theorem (Zemke 2019,
  Theorem 1.1) is a target of 1.5. Its concordance maps and the detection of the Seifert genus
  are asked of HeegaardFloer below (gap:hfk-concordance-maps, gap:hfk-genus-detection).
- Donaldson's diagonalization theorem is FourManifolds' (§5.3); the form without a hypothesis on
  the fundamental group, which 2.1 uses, is asked of FourManifolds below
  (gap:donaldson-definite-any-pi1). Lens spaces are Tau Ceti's (`TauCeti.LensSpace`).

## Conventions

- **Radial function.** The ribbon condition on a disc `Φ` is read on the squared radial function
  `radialFunction Φ z = ‖Φ z‖²` for `z` in the closed unit disc of `ℂ` (and `0` outside it), not
  on `‖Φ z‖`: the square is smooth where `Φ` passes through the origin, and where `Φ z ≠ 0` the two
  functions have the same critical points with the same indices. Witness: for the flat disc
  `Φ₀ z = ι z` of a great circle, `radialFunction Φ₀ z = |z|²`, with Hessian `2·id` at `0`.
- **Direction.** A concordance `F : SmoothEmbedding.Concordance K₀ K₁` has `K₀` at time `0` and
  `K₁` at time `1`; it is ribbon when its time function has no local maximum, and then
  `RibbonLE K₀ K₁`. This is Zemke's « ribbon concordance from `K₀` to `K₁` » (cobordism
  orientation); Gordon and Agol call the same object a ribbon concordance from `K₁` to `K₀` and
  write `K₁ ≥ K₀`. Witness: a ribbon disc for `K`, with a small disc around a minimum removed,
  is a ribbon concordance with the unknot at time `0`, so it gives `RibbonLE unknot K` (1.1), never
  `RibbonLE K unknot` unless `K` is the unknot.
- **Reading the circle.** The time function of a concordance is read on the plane through
  `Circle.exp : ℝ → Circle`, of period `2π`. Witness: `timeFunction F (s + 2π, t) =
  timeFunction F (s, t)`, so each critical point on the annulus is a `2πℤ`-orbit of critical
  points of the same index on the plane.

## Exact supplier contracts

### From Mathlib

- `Metric.closedBall`, `Metric.ball`, `Metric.sphere`, `EuclideanSpace ℝ (Fin 4)`, `fderiv`,
  `Circle.exp`, `ContinuousMap`, `FundamentalGroup` and `FundamentalGroup.map`.
- `Subgroup.Normal`, `Subgroup.FiniteIndex`, `Matrix.specialOrthogonalGroup`, `MonoidHom.comp`
  and `MvPolynomial.eval`.

### From Tau Ceti

- `TauCeti.Analysis.Calculus.Morse.Basic`: `TauCeti.HasNondegenerateCriticalPointsOn`;
  `TauCeti.Analysis.Calculus.Morse.Index`: `TauCeti.morseIndex`.
- `TauCeti.KnotTheory.Slice.Basic`: `TauCeti.IsSmoothSliceDisc`, `TauCeti.IsSmoothlySlice`,
  `TauCeti.isSmoothlySlice_rotate_iff`, `TauCeti.isSmoothlySlice_reverse_iff`,
  `TauCeti.isSmoothlySlice_congr_linearIsometryEquiv`.
- `TauCeti.KnotTheory.SmoothCircle`: `TauCeti.SmoothCircleEmbedding`,
  `TauCeti.SmoothCircleEmbedding.rotate`, `TauCeti.unknot`; `TauCeti.KnotTheory.KnotGroup`:
  `TauCeti.SmoothCircleEmbedding.KnotGroup`.
- `TauCeti.Geometry.Manifold.SmoothEmbedding.Concordance`: `TauCeti.SmoothEmbedding.Concordance`
  with `refl`, `symm`, `trans` and `ofDiffeotopy`;
  `TauCeti.Geometry.Manifold.SmoothEmbedding.SmoothAmbientIsotopy.Basic`:
  `TauCeti.SmoothEmbedding.SmoothAmbientIsotopic`.
- `TauCeti.Geometry.Manifold.Instances.Sphere`: `TauCeti.finrank_euclideanSpace_fin_succ_fact`;
  `TauCeti.Geometry.Manifold.Instances.LensSpace`: `TauCeti.LensSpace`.

### From TauCetiRoadmap.GeometricTopology

- Section 4.3, the Seifert genus of a knot; section 4.4, its Alexander polynomial and its
  determinant `|Δ(−1)|`; section 4.10, the two-bridge knots `K(p, q)`. These are consumed by 1.5
  and 2.1, whose statements need them and are not statable at the pins.
- Section 5.1, knot exteriors with their meridians and preferred longitudes, and section 8.3.1,
  the relative Waldhausen realization from peripheral group systems to maps of pairs, consumed by
  the proof of 1.4.

### From TauCetiRoadmap.HeegaardFloer

- Section 7.6, the knot Floer complexes, consumed by 1.5.

What HeegaardFloer must provide (gap:hfk-concordance-maps): for a decorated smooth concordance `C`
from `K₀` to `K₁` in `[0, 1] × S³`, a graded map `F_C : HFK̂(K₀) → HFK̂(K₁)`, functorial under
stacking and the identity on the product concordance.

What HeegaardFloer must provide (gap:hfk-genus-detection): `g₃(K) = max{j : HFK̂(K, j) ≠ 0}`
(Ozsváth–Szabó, Theorem 1.2, as recalled in Zemke 2019, §1).

### From TauCetiRoadmap.FourManifolds

- §5.3, Donaldson's diagonalization theorem, consumed by the proof of 2.1.

What FourManifolds must provide (gap:donaldson-definite-any-pi1): the intersection lattice of a
closed oriented smooth negative-definite four-manifold, with no hypothesis on its fundamental
group, is diagonal (the theorem Lisca 2007, §1, cites as [4]).

## How to read the build

Layer 0 defines ribbon discs and ribbon knots from Tau Ceti's slice discs and Morse indices.
Layer 1 defines ribbon concordance on Tau Ceti's concordances, compares it with Layer 0's ribbon
discs, proves that it is reflexive and transitive, proves Gordon's lemma on fundamental groups and,
from it, residual finiteness, the extension of representations and a lemma of real algebraic
geometry, Agol's antisymmetry, which also uses GeometricTopology's knot exteriors and Waldhausen's
theorem; its last target, the monotonicity of genus and Alexander degree, needs GeometricTopology
and HeegaardFloer. Layer 2 states Lisca's theorem on GeometricTopology's two-bridge knots; its
proof uses Tau Ceti's lens spaces and FourManifolds' Donaldson theorem.

## Layer 0: ribbon discs

### 0.1 Ribbon discs and ribbon knots

Define the squared radial function `radialFunction Φ` of a map `Φ` from the closed unit disc of
`ℂ` to the closed unit ball of `E`, and a ribbon disc `IsRibbonDisc K Φ` for a smooth circle
embedding `K : S¹ → Sⁿ`: a smooth slice disc (`TauCeti.IsSmoothSliceDisc K Φ`) on whose open disc
`radialFunction Φ` has only nondegenerate critical points, none of index `2` (Livingston 2005,
Definition 2.3). Define `IsRibbon K` as the existence of a ribbon disc. Prove that a ribbon knot
is smoothly slice, and that being ribbon is invariant under rotation and reversal of the
parametrization and under linear isometries of `E` (by the arguments of
`TauCeti.isSmoothlySlice_rotate_iff`, `TauCeti.isSmoothlySlice_reverse_iff` and
`TauCeti.isSmoothlySlice_congr_linearIsometryEquiv`).

*Needs:* `TauCeti.IsSmoothSliceDisc`, `TauCeti.IsSmoothlySlice`,
`TauCeti.HasNondegenerateCriticalPointsOn`, `TauCeti.morseIndex`.

**Checks.**

- The flat disc `Φ₀ z = ι z` of a great circle has `radialFunction Φ₀ z = |z|²`: one critical
  point, `0`, with Hessian `2·id` and index `0`, so `IsRibbonDisc` holds. This excludes a
  definition forbidding every interior critical point, which would make no disc ribbon.
- On `E = ℝ⁴ = ℂ ⊕ ℝ²`, the disc `Φ z = (z/2, √(ρ(|z|²) − |z|²/4), 0)` with
  `ρ(s) = 1/2 − s/4 + 3s²/4` is a smooth slice disc of the unknot `z ↦ (z/2, √3/2, 0)`:
  `ρ(1) = 1`, `ρ(s) − 1 = (3s + 2)(s − 1)/4 < 0` for `s < 1`, `ρ(s) ≥ 23/48 > s/4` on `[0, 1]`,
  and `ρ′(1) = 5/4 > 0`. Its squared radial function `ρ(|z|²)` has a local maximum at `0`
  (Hessian `−id/2`, index `2`) and a degenerate circle of critical points at `|z|² = 1/6`, so it
  is not a ribbon disc. This excludes « ribbon disc = slice disc ».
- `radialFunction Φ₀` attains its maximum `1` on the boundary circle. Since the condition is
  asked on the open disc only, this does not count; a definition on the closed disc would make
  every disc fail.

### Examples

- The unknot is ribbon, by the flat disc `Φ₀` of the first Check.
- The disc of the second Check shows that a ribbon knot can bound slice discs that are not ribbon.

### Dependencies

Tau Ceti only.

## Layer 1: ribbon concordance

### 1.1 Ribbon concordances

Write `S3` for the unit sphere of `ℝ⁴` and `Knot` for the smooth circle embeddings in it. Define
the time function `timeFunction F (s, t) = pr₂ (F (exp (i s), t))` of a concordance
`F : SmoothEmbedding.Concordance K₀ K₁` of knots in `S3`, a ribbon concordance
`IsRibbonConcordance F` (on the open slab `0 < t < 1` the time function has only nondegenerate
critical points, none of index `2`) and the relation `RibbonLE K₀ K₁`. The notion is Gordon's
(Gordon 1981, §1; Agol 2022, §1).

Prove that a knot `K` in `S³` is ribbon iff `RibbonLE unknot K` (`isRibbon_iff_ribbonLE_unknot`):
remove a small disc around the lowest minimum of the radial function and rescale the shell to
`S³ × [0, 1]`; conversely, cap the unknot end with a flat disc (Zemke 2019, §1, takes the right
side as the definition).

*Needs:* 0.1, `TauCeti.SmoothEmbedding.Concordance`, `TauCeti.HasNondegenerateCriticalPointsOn`,
`TauCeti.morseIndex`, `Circle.exp`, `TauCeti.unknot`,
`TauCeti.SmoothEmbedding.Concordance.ofDiffeotopy`, `TauCeti.SmoothEmbedding.Concordance.trans`,
`TauCeti.finrank_euclideanSpace_fin_succ_fact`.

**Checks.**

- For the product concordance `Concordance.refl K`, `timeFunction (refl K) (s, t) = t`, whose
  differential `(0, 1)` never vanishes: no critical point, so it is ribbon. This excludes asking
  for at least one critical point of each index.
- `Concordance.symm F` runs `F` backwards, `timeFunction F.symm (s, t) = 1 − timeFunction F
  (s, 1 − t)`, which negates the Hessian at each critical point and sends index `k` to `2 − k`.
  A ribbon concordance with a minimum therefore has a reverse with a maximum, which is not ribbon:
  the relation has a direction, and a symmetric definition is excluded.
- `timeFunction F (s + 2π, t) = timeFunction F (s, t)`: critical points come in `2πℤ`-orbits on
  the plane, and the Morse conditions on the plane and on `S¹ × (0, 1)` agree because
  `Circle.exp` is a local diffeomorphism. This excludes counting critical points on the plane.

### 1.2 Reflexivity and transitivity

Prove that `RibbonLE` is reflexive, by the product concordance, and `RibbonLE.trans`, by
stacking two ribbon concordances with `Concordance.trans` (Agol 2022, §1).

*Needs:* 1.1, `TauCeti.SmoothEmbedding.Concordance` with `refl` and `trans`.

**Checks.**

- Tau Ceti's stacked track runs each track at triple speed: below time `1/2` its time function is
  `(s, t) ↦ timeFunction F (s, 3t) / 3`, whose Hessian is `D H D / 3` with `D = diag(1, 3)` and
  `H` that of `timeFunction F`, so nondegeneracy and indices are preserved. Negating the time
  function, as `Concordance.symm` does (1.1, second Check), sends index `k` to `2 − k`; a change
  of the source coordinate alone, even `t ↦ −3t`, leaves every index unchanged.
- The critical values of the stack are those of the first concordance divided by `3`, in
  `(0, 1/3)`, and those of the second sent by `v ↦ (v + 2)/3`, in `(2/3, 1)`: on
  `1/3 ≤ t ≤ 2/3` both tracks are in their product collars and there is no critical point.
- The stack of `refl K` with itself is again a product track, with no critical point.

### 1.3 Gordon's lemma

Define `trackComplement F`, the complement of the track of `F` in `S³ × [0, 1]`. For a ribbon
concordance `F` from `K₀` to `K₁`, prove that the inclusion `x ↦ (x, 0)` of the complement of
`K₀` induces an injection on knot groups (`knotGroup_injective_of_isRibbonConcordance`) and the
inclusion `x ↦ (x, 1)` of the complement of `K₁` a surjection
(`knotGroup_surjective_of_isRibbonConcordance`) (Gordon 1981, Lemma 3.1, in
the direction of Zemke 2019, §1).

*Needs:* 1.1, `FundamentalGroup.map`, `TauCeti.SmoothEmbedding.Concordance`,
`TauCeti.SmoothCircleEmbedding.KnotGroup`.

**Checks.**

- For `refl K`, `trackComplement (refl K)` is `(S³ ∖ K) × [0, 1]`, and both inclusions are
  homotopy equivalences: both maps are isomorphisms.
- For the concordance `RibbonLE unknot K` given by a ribbon disc of `K` (Layer 1 Examples), the
  injective end is the unknot, whose group `ℤ` embeds, and the surjective end is `K`: this is
  the homotopy-ribbon property of ribbon discs. Swapping the two ends would ask `ℤ` to surject
  onto the group of the complement, which fails as soon as that group is not cyclic.
- The statement quantifies over continuous maps `i` with `i x = (x, 0)` (or `(x, 1)`): such a map
  exists because the track is a product near both ends, and the statement does not depend on the
  choice, since two such maps are equal.

### 1.4 Agol's theorem

Prove `RibbonLE.antisymm`: if `RibbonLE K₀ K₁` and `RibbonLE K₁ K₀`, then `K₀` and `K₁` are
smoothly ambient isotopic. Stacking gives a ribbon self-concordance of `K₀`, whose exterior is a
relative s-cobordism by representation varieties of the knot groups into `SO(N)` (Agol 2022,
Theorem 1.2); with Gordon's lemma the inclusions induce isomorphisms preserving the peripheral
subgroups, and the knots are isotopic (Agol 2022, Theorem 1.1, through Gordon 1981, Lemma 3.2).

The proof uses three further results, each a target here:

- knot groups are residually finite (`knotGroup_residuallyFinite`: a nontrivial element survives
  in a finite quotient; Hempel 1987, as used in Agol 2022, proof of Theorem 1.2);
- every `SO(N)`-representation of the knot group of the time-`0` end of a ribbon concordance
  extends over the complement of the concordance (`exists_extension_of_isRibbonConcordance`;
  Agol 2022, proof of Theorem 1.2, citing Daemi, Lidman, Vela-Vick and Wong 2022,
  Proposition 2.1, after Gerstenhaber and Rothaus);
- if `Y ⊆ X` are real algebraic sets and a polynomial map sends `Y` onto `X`, then `Y = X`
  (`algebraicSet_eq_of_surjOn`; Agol 2022, Lemma A.2).

*Needs:* 1.2, 1.3, `TauCeti.SmoothEmbedding.SmoothAmbientIsotopic`,
`TauCeti.SmoothCircleEmbedding.KnotGroup`, `Matrix.specialOrthogonalGroup`, `MvPolynomial.eval`;
GeometricTopology 5.1 (knot exteriors, peripheral markings) and 8.3.1 (relative Waldhausen
realization).

**Checks.**

- For `a ≠ 1` in the circle, `K` and `K.rotate a` are ribbon concordant in both directions,
  through the trace of a rotation of the circle (time function `t`, no critical point), yet differ
  as maps since `K` is injective: the conclusion must be isotopy, not equality.
- Concordance alone is symmetric, so the theorem fails for it: the unknot and a nontrivial slice
  knot are concordant both ways but not isotopic. The ribbon condition is what is used.
- With `K₀ = unknot`: a knot `K` with `RibbonLE unknot K` and `RibbonLE K unknot` is isotopic
  to the unknot. A ribbon knot that is not the unknot, such as `K(9, 2)` of 2.1,
  therefore never satisfies `RibbonLE K unknot`.
- For the unknot the knot group is `ℤ`, and `g ≠ 0` survives in `ℤ/m` for every `m > |g|`. For
  `refl K`, `trackComplement (refl K) = (S³ ∖ K) × [0, 1]`, and `ρ` extends as `ρ` composed with
  the map induced by the projection to `S³ ∖ K`.
- The inclusion `Y ⊆ X` cannot be dropped in `algebraicSet_eq_of_surjOn`: in `ℝ²`, the map
  `φ(x, y) = (x − y, 0)` sends `Y = {xy = 1}` onto the line `X = {y = 0}`, since `x − 1/x` takes
  every real value, yet `Y ≠ X` (after the remark in Agol 2022, proof of Lemma A.2).

### 1.5 Monotonicity under ribbon concordance

If `RibbonLE K₀ K₁`, then the Seifert genus of `K₀` is at most that of `K₁` (Zemke 2019,
Theorem 1.3) and the degree of the Alexander polynomial of `K₀` is at most that of `K₁` (Gordon
1981, Lemma 3.4). Prove first Zemke's injectivity theorem: for a ribbon concordance `C` from
`K₀` to `K₁`, the map `F_C : HFK̂(K₀) → HFK̂(K₁)` is injective (Zemke 2019, Theorem 1.1); with the
detection of the genus by knot Floer homology it gives the genus inequality (Zemke 2019,
Theorem 1.3). Not statable at the pins: Tau Ceti has no Seifert genus, no Alexander polynomial of
a smooth circle embedding and no knot Floer homology.

*Needs:* 1.1, GeometricTopology 4.3, GeometricTopology 4.4, HeegaardFloer 7.6,
gap:hfk-concordance-maps, gap:hfk-genus-detection.

**Checks.**

- For `refl K` both inequalities are equalities.
- With `RibbonLE unknot K` for a ribbon knot `K`, the genus inequality reads `0 ≤ g(K)`:
  monotonicity says nothing about ribbon knots themselves.
- The genus inequality alone rules out `RibbonLE K unknot` for every knot of positive genus,
  such as the trefoil, without Agol's theorem.

### Examples

- `RibbonLE K K` for every knot, by `refl`.
- A ribbon disc for `K` with a small disc around a minimum removed gives `RibbonLE unknot K`.

### Dependencies

Layer 0, Tau Ceti; 1.4 also GeometricTopology 5.1 and 8.3.1; 1.5 also GeometricTopology 4.3,
4.4 and HeegaardFloer 7.6 (gap:hfk-concordance-maps, gap:hfk-genus-detection).

## Layer 2: two-bridge knots

### 2.1 Lisca's theorem

For coprime `p > q > 0` with `p` odd, the two-bridge knot `K(p, q)` is ribbon if and only if it
is smoothly slice, if and only if the lens space `L(p, q)` smoothly bounds a rational homology
ball (Lisca 2007, Corollary 1.3, from Theorem 1.2 through Donaldson's diagonalization theorem).
Prove on the way that the double cover of `B⁴` branched along a slice disc of `K(p, q)`, `p` odd,
is a smooth rational homology ball bounded by `L(p, q)` (Lisca 2007, §1). Not statable at the
pins: Tau Ceti has no two-bridge knot as a smooth circle embedding and no branched cover.

*Needs:* 0.1; GeometricTopology 4.10 and 4.4 (the determinant); the lens spaces of
`TauCeti/Geometry/Manifold/Instances/LensSpace.lean`; FourManifolds §5.3,
gap:donaldson-definite-any-pi1.

**Checks.**

- `K(3, 1)` is the trefoil: `3` is not a perfect square, so it is not slice (Casson and Gordon,
  as recalled in Lisca 2007, §1), and `L(3, 1)` bounds no rational homology ball.
- `9/2` belongs to Lisca's set `R` (`p = 9 = 3²`, `q = 2 = 3·1 − 1`, type (1) of Lisca 2007,
  Definition 1.1), so `K(9, 2)` is ribbon and `L(9, 2)` bounds a rational homology ball.
- `K(5, 2)` is the figure-eight knot: its determinant `|Δ(−1)| = 5` is not a perfect square, so
  it is neither slice nor ribbon (Lisca 2007, §1) and `L(5, 2)` bounds no rational homology ball;
  its signature `0` does not detect this.

### Examples

- Lisca 2007, Corollary 1.3, for the full list of the fractions `p/q` concerned.

### Dependencies

Layer 0, GeometricTopology 4.4 and 4.10, FourManifolds §5.3 (gap:donaldson-definite-any-pi1),
Tau Ceti's lens spaces.

## Downstream consumers

None known: no roadmap on `main` cites RibbonKnots.

## Research context

The slice–ribbon conjecture asks whether every smoothly slice knot is ribbon (Fox 1962, in the
form of Livingston 2005, §10, Problem 1). It is open. Lisca's theorem (2.1) settles it for
two-bridge knots. Gompf, Scharlemann and Thompson (2010) give fibered slice knots that are
potential counterexamples. Dunfield and Gong (2025) determine smooth sliceness for all but about
11,400 of the 352.2 million prime knots with at most nineteen crossings, and every smoothly slice
knot they find is ribbon. By an observation of Casson, every slice knot becomes ribbon after
connected sum with a suitably chosen ribbon knot (Livingston 2005, §2.1). In the topological
category the corresponding question is whether every slice knot is homotopy ribbon, and Friedl
and Powell (2020) extend Gordon's degree bound (1.5) to homotopy ribbon concordance.

## References

- I. Agol, *Ribbon concordance of knots is a partial ordering*, Comm. Amer. Math. Soc. 2 (2022),
  374–379; doi:10.1090/cams/15; arXiv:2201.03626.
- A. Daemi, T. Lidman, D. S. Vela-Vick, C.-M. M. Wong, *Ribbon homology cobordisms*, Adv. Math.
  408 (2022), Paper No. 108580; doi:10.1016/j.aim.2022.108580; arXiv:1904.09721.
- N. M. Dunfield, S. Gong, *Ribbon concordances and slice obstructions: experiments and
  examples*, arXiv:2512.21825 (2025).
- R. H. Fox, *Some problems in knot theory*, in *Topology of 3-manifolds and related topics*,
  Prentice-Hall (1962), 168–176.
- S. Friedl, M. Powell, *Homotopy ribbon concordance and Alexander polynomials*, Arch. Math. 115
  (2020), 717–725; doi:10.1007/s00013-020-01517-5; arXiv:1907.09031.
- R. E. Gompf, M. Scharlemann, A. Thompson, *Fibered knots and potential counterexamples to the
  property 2R and slice-ribbon conjectures*, Geom. Topol. 14 (2010), 2305–2347;
  arXiv:1103.1601.
- C. McA. Gordon, *Ribbon concordance of knots in the 3-sphere*, Math. Ann. 257 (1981), 157–170;
  doi:10.1007/BF01458281.
- J. Hempel, *Residual finiteness for 3-manifolds*, in *Combinatorial group theory and topology
  (Alta, Utah, 1984)*, Ann. of Math. Stud. 111, Princeton Univ. Press (1987), 379–396;
  doi:10.1515/9781400882083-018.
- P. Lisca, *Lens spaces, rational balls and the ribbon conjecture*, Geom. Topol. 11 (2007),
  429–472; doi:10.2140/gt.2007.11.429; arXiv:math/0701610.
- C. Livingston, *A survey of classical knot concordance*, in *Handbook of Knot Theory*,
  Elsevier (2005), 319–347; doi:10.1016/B978-044451452-3/50008-3; arXiv:math/0307077.
- I. Zemke, *Knot Floer homology obstructs ribbon concordance*, Ann. of Math. (2) 190 (2019),
  931–947; doi:10.4007/annals.2019.190.3.5; arXiv:1902.04050.
