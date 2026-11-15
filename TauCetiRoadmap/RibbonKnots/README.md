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

Owned here: the ribbon disc, the ribbon knot and the ribbon immersion of a disc, with the push-in
of a ribbon-immersed disc to a ribbon disc (0.1), the ribbon concordance relation and its
order properties (1.1–1.4) with the inputs of Agol's proof stated in 1.3 and 1.4 (among them the
handle structure of the exterior of a ribbon concordance and the Gerstenhaber–Rothaus theorems),
Zemke's injectivity theorem (1.5), and Lisca's theorem with his set `R`, his theorem on lens
spaces bounding rational homology balls and the plumbing and branched-cover steps of its proof
(2.1).

Not owned here:

- Knots, sliceness, concordance and the concordance group are GeometricTopology's (Layer 4 and
  Layer 6.1), on the Tau Ceti carriers `TauCeti.SmoothCircleEmbedding`, `TauCeti.IsSmoothlySlice`
  and `TauCeti.SmoothEmbedding.Concordance`.
- The Seifert surface and the Seifert genus are GeometricTopology 4.3's; the Alexander polynomial
  and the determinant are GeometricTopology 4.4's; the Levine–Tristram signatures of slice knots
  are GeometricTopology 6.2's; two-bridge knots are GeometricTopology 4.10's; knot exteriors with
  their meridians and preferred longitudes are GeometricTopology 5.1's; Waldhausen's relative
  realization theorem is GeometricTopology 8.3.1's; the extension of a homeomorphism of exteriors
  over the meridional fillings is GeometricTopology 8.1's; smooth realization in dimension three
  and Cerf's theorem are GeometricTopology 11.2's and 3.4's. The residual finiteness of knot
  groups and the rigidity of peripheral injections of knot groups are asked of GeometricTopology
  below (gap:knot-group-residually-finite, gap:knot-group-peripheral-injection).
- Knot Floer homology is HeegaardFloer's (Layer 7.6); Zemke's injectivity theorem (Zemke 2019,
  Theorem 1.1) is a target of 1.5. The link Floer cobordism maps, their grading shifts, the map
  of a 2-knot in `S⁴` and the detection of the Seifert genus are asked of HeegaardFloer below
  (gap:link-floer-cobordism-maps, gap:link-floer-grading-shift, gap:link-floer-two-knot,
  gap:hfk-genus-detection).
- Donaldson's diagonalization theorem is FourManifolds' (§5.3); the form without a hypothesis on
  the fundamental group, which 2.1 uses, is asked of FourManifolds below
  (gap:donaldson-definite-any-pi1). Lens spaces and plumbing graphs are Tau Ceti's
  (`TauCeti.LensSpace`, `TauCeti.PlumbingGraph`).

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
- `Manifold.IsImmersion` and `unitInterval`.
- `Group.ResiduallyFinite`, `Matrix.specialOrthogonalGroup`, `MonoidHom.comp` and
  `MvPolynomial.eval`.

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
- `TauCeti.LowDimTopology.Plumbing.IntersectionForm`: `TauCeti.PlumbingGraph` and
  `TauCeti.PlumbingGraph.intersectionForm`.
- `TauCeti.Geometry.RealAlgebraic.Semialgebraic.Dimension.Basic`: `TauCeti.semialgebraicDim`;
  `TauCeti.Geometry.RealAlgebraic.Semialgebraic.Dimension.Projection`:
  `TauCeti.IsSemialgebraic.semialgebraicDim_image_comp_le`.

### From TauCetiRoadmap.GeometricTopology

- Section 4.3, the Seifert genus of a knot; section 4.4, its Alexander polynomial and its
  determinant `|Δ(−1)|`; section 4.10, the two-bridge knots `K(p, q)`. These are consumed by 1.5
  and 2.1, whose statements need them and are not statable at the pins.
- Section 5.1, knot exteriors with their meridians and preferred longitudes; section 8.3.1, the
  relative Waldhausen realization from peripheral group systems to maps of pairs; section 8.1,
  the extension of a homeomorphism of exteriors over the meridional fillings; sections 11.2 and
  3.4, the smooth realization of homeomorphisms in dimension three and Cerf's theorem. These are
  consumed by the proof of 1.4.

What GeometricTopology must provide (gap:knot-group-residually-finite): for every smooth knot `K`
in `S³` and base point `x` of its complement, `Group.ResiduallyFinite (K.KnotGroup x)` (Hempel
1987; used in Agol 2022, proof of Theorem 1.2).

What GeometricTopology must provide (gap:knot-group-peripheral-injection): for knots `K`, `J` in
`S³`, an injective homomorphism from the group of `K` to the group of `J` that carries the
peripheral subgroup of `K` onto a conjugate of that of `J`, meridian to meridian and longitude to
longitude, is an isomorphism (Waldhausen's covering theorem, as used in Agol 2022, proof of
Theorem 1.2).

### From TauCetiRoadmap.HeegaardFloer

- Section 7.6, the knot Floer complexes, consumed by 1.5.

What HeegaardFloer must provide (gap:link-floer-cobordism-maps): for a decorated link cobordism
`(W, F)` between multi-based links in closed oriented 3-manifolds and `s ∈ Spinᶜ(W)`, a map
`F_{W,F,s} : HFL̂(Y₀, L₀, s|Y₀) → HFL̂(Y₁, L₁, s|Y₁)`, unchanged by isotopy of `F` rel boundary
and satisfying the composition law (Zemke 2019, §2, Definition 2.2).

What HeegaardFloer must provide (gap:link-floer-grading-shift): when `s` restricts to torsion
structures and the links are null-homologous, `F_{W,F,s}` shifts `gr_w` and `gr_z` by Zemke 2019,
§2, equations (7) and (8).

What HeegaardFloer must provide (gap:link-floer-two-knot): for a smooth 2-knot `S ⊂ S⁴` with one
dividing curve, `F_{S⁴,S} : 𝔽₂ → 𝔽₂` is an isomorphism (Zemke 2019, Lemma 2.3).

What HeegaardFloer must provide (gap:hfk-genus-detection): `g₃(K) = max{j : HFK̂(K, j) ≠ 0}`
(Ozsváth–Szabó 2004, Theorem 1.2, as recalled in Zemke 2019, §1).

### From TauCetiRoadmap.FourManifolds

- §5.3, Donaldson's diagonalization theorem, consumed by the proof of 2.1.

What FourManifolds must provide (gap:donaldson-definite-any-pi1): the intersection lattice of a
closed oriented smooth negative-definite four-manifold, with no hypothesis on its fundamental
group, is diagonal (the theorem Lisca 2007, §1, cites as [4]).

## How to read the build

Layer 0 defines ribbon discs and ribbon knots from Tau Ceti's slice discs and Morse indices, and
ribbon immersions of the disc, whose boundaries it proves ribbon. Layer 1 defines ribbon concordance
on Tau Ceti's concordances, compares it with Layer 0's ribbon discs, proves that it is reflexive and
transitive, proves the handle structure of the exterior of a ribbon concordance, the
Gerstenhaber–Rothaus theorems and, from them, Gordon's lemma on fundamental groups, then the
extension of representations, a lemma of real algebraic geometry and Agol's antisymmetry, which also
uses GeometricTopology's knot exteriors, Waldhausen's theorem and the residual finiteness of knot
groups; its last target, the monotonicity of genus and Alexander degree, needs GeometricTopology and
HeegaardFloer. Layer 2 states Lisca's theorem on GeometricTopology's two-bridge knots, with his
theorem on lens spaces bounding rational homology balls; its proof uses Tau Ceti's lens spaces and
plumbing graphs and FourManifolds' Donaldson theorem.

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

Define a ribbon immersion of the disc in `Sⁿ` (`IsRibbonImmersion n g`; for `S³`, the ribbon
immersions of Lisca 2007, Theorem 1.2 (2)): a smooth immersion `g` of the closed unit disc of `ℂ`
into `Sⁿ` (`Manifold.IsImmersion`, for the half-space charts of the disc) whose double points form
finitely many pairs of arcs. There are injective paths `α₁, …, α_m` in the open disc and
`β₁, …, β_m` in the closed disc, each `β_i` meeting the boundary circle exactly at its two
endpoints, the `2m` paths having pairwise disjoint images, such that `g (α_i t) = g (β_i t)` for
all `i` and `t`, and every pair of distinct points of the disc with the same image under `g` is
`{α_i t, β_i t}` for some `i` and `t`. In particular `g` is injective on the boundary circle, and
its double points in `Sⁿ` form `m` disjoint arcs. Prove that a knot `K` bounding a ribbon-immersed
disc, that is, equal to `g` on the boundary circle for such a `g`, is ribbon
(`isRibbon_of_isRibbonImmersion`): push the interior of the disc radially into the ball, deeper
along the interior arcs `α_i`, which gives a smoothly embedded disc, and choose the push so that
the radial function on it is a Morse function with only critical points of index `0` and `1`
(Lisca 2007, §1, and §9, proof of Theorem 1.2).

*Needs:* `TauCeti.IsSmoothSliceDisc`, `TauCeti.IsSmoothlySlice`,
`TauCeti.HasNondegenerateCriticalPointsOn`, `TauCeti.morseIndex`, `Manifold.IsImmersion`,
`unitInterval`.

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
- In `S³ ⊂ ℂ ⊕ ℝ²`, the cap `g₀ z = (z/2, √(1 − |z|²/4), 0)` is an embedding, so a ribbon
  immersion with `m = 0`, bounded by the unknot `z ↦ (z/2, √3/2, 0)` of the second Check. Pushed
  in by the depth `d z = (1 − |z|²)/2`, it becomes `Φ z = (1 − d z) g₀ z`, with squared radial
  function `((1 + |z|²)/2)²`, whose derivative in `|z|²` is `(1 + |z|²)/2 > 0`: one critical
  point, `0`, with Hessian `id` and index `0`, so `Φ` is a ribbon disc. This excludes a definition
  of ribbon immersion asking for at least one pair of arcs.
- At an endpoint `β_i 0` on the boundary circle the depth is `0`, while `α_i 0`, with the same
  image, lies in the open disc, where the depth is positive. So the interior arcs, and only they,
  are pushed deeper; a reading that may push either sheet deeper is excluded.
- The trefoil `K(3, 1)` becomes the unknot after one crossing change, so it bounds an immersed
  disc whose only singularity is one clasp, an arc of double points whose two preimage arcs each
  have exactly one endpoint on the boundary circle. The trefoil is not slice (2.1, first Check),
  so the condition that `β_i` meets the boundary circle at both endpoints and `α_i` not at all
  cannot be weakened to admit clasps.

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

Prove that the exterior of a ribbon concordance from `K₀` to `K₁` is obtained from the exterior of
`K₀` by attaching one 1-handle for each minimum and one 2-handle for each saddle of the time
function, equally many, the 2-handles cancelling the 1-handles in rational homology (Agol 2022,
proof of Theorem 1.2; Daemi–Lidman–Vela-Vick–Wong 2022, proof of Proposition 2.1). Prove the
Gerstenhaber–Rothaus theorems. First, a system of `m` equations in `m` unknowns with constants in
a compact connected Lie group `G`, whose matrix of exponent sums in the unknowns has nonzero
determinant, has a solution in `G`. Second, with constants in a finite group `H`, such a system
has a solution in some finite group containing `H` (Gerstenhaber–Rothaus 1962, Theorems 1 and 2,
as used in Daemi–Lidman–Vela-Vick–Wong 2022, proof of Proposition 2.1).

Define `trackComplement F`, the complement of the track of `F` in `S³ × [0, 1]`. For a ribbon
concordance `F` from `K₀` to `K₁`, prove that the inclusion `x ↦ (x, 0)` of the complement of
`K₀` induces an injection on knot groups (`knotGroup_injective_of_isRibbonConcordance`) and the
inclusion `x ↦ (x, 1)` of the complement of `K₁` a surjection
(`knotGroup_surjective_of_isRibbonConcordance`) (Gordon 1981, Lemma 3.1, in
the direction of Zemke 2019, §1). The surjection follows from the handle structure read from the
time-1 end; the injection from residual finiteness and the second Gerstenhaber–Rothaus theorem
(Daemi–Lidman–Vela-Vick–Wong 2022, proof of Proposition 2.1).

*Needs:* 1.1, `FundamentalGroup.map`, `TauCeti.SmoothEmbedding.Concordance`,
`TauCeti.SmoothCircleEmbedding.KnotGroup`, `Matrix.specialOrthogonalGroup`;
gap:knot-group-residually-finite.

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
smoothly ambient isotopic. Stacking gives a ribbon self-concordance of `K₀`. Its time-1 end
induces an isomorphism on fundamental groups. It is onto by Gordon's lemma, and one-to-one
because restriction is a polynomial surjection of `SO(N)`-representation varieties onto the larger
one, while by residual finiteness (gap:knot-group-residually-finite) every nontrivial element of
the knot group survives in some `SO(N)`-representation (Agol 2022, Theorem 1.2 and its proof).
The time-0 end of the concordance from `K₁` to `K₀` then injects the group of `K₁` into that of
`K₀`, meridian to meridian and longitude to longitude. By gap:knot-group-peripheral-injection this
injection is an isomorphism. Waldhausen's realization gives a homeomorphism of the exteriors,
which extends over the meridional fillings and is smoothed to an ambient isotopy (Agol 2022,
Theorem 1.1, through Gordon 1981, Lemma 3.2).

The proof uses two further results, each a target here:

- every `SO(N)`-representation of the knot group of the time-`0` end of a ribbon concordance
  extends over the complement of the concordance (`exists_extension_of_isRibbonConcordance`;
  Agol 2022, proof of Theorem 1.2, citing Daemi, Lidman, Vela-Vick and Wong 2022,
  Proposition 2.1, from the handle structure and the first Gerstenhaber–Rothaus theorem of 1.3);
- if `Y ⊆ X` are real algebraic sets and a polynomial map sends `Y` onto `X`, then `Y = X`
  (Agol 2022, Lemma A.2), through the fact that an algebraic subset of an irreducible real
  algebraic set with the same dimension is the whole set (Agol 2022, Lemma A.1).

*Needs:* 1.2, 1.3, `TauCeti.SmoothEmbedding.SmoothAmbientIsotopic`,
`TauCeti.SmoothCircleEmbedding.KnotGroup`, `Matrix.specialOrthogonalGroup`, `MvPolynomial.eval`,
`TauCeti.semialgebraicDim`, `TauCeti.IsSemialgebraic.semialgebraicDim_image_comp_le`;
GeometricTopology 5.1 (knot exteriors, peripheral markings), 8.3.1 (relative Waldhausen
realization), 8.1 (extension over the meridional filling), 11.2 and 3.4 (smooth realization,
Cerf's theorem); gap:knot-group-residually-finite, gap:knot-group-peripheral-injection.

**Checks.**

- For `a ≠ 1` in the circle, `K` and `K.rotate a` are ribbon concordant in both directions,
  through the trace of a rotation of the circle (time function `t`, no critical point), yet differ
  as maps since `K` is injective: the conclusion must be isotopy, not equality.
- Concordance alone is symmetric, so the theorem fails for it: the unknot and a nontrivial slice
  knot are concordant both ways but not isotopic. The ribbon condition is what is used.
- With `K₀ = unknot`: a knot `K` with `RibbonLE unknot K` and `RibbonLE K unknot` is isotopic
  to the unknot. A ribbon knot that is not the unknot, such as `K(9, 2)` of 2.1,
  therefore never satisfies `RibbonLE K unknot`.
- For `refl K`, `trackComplement (refl K) = (S³ ∖ K) × [0, 1]`, and `ρ` extends as `ρ` composed
  with the map induced by the projection to `S³ ∖ K`.
- The inclusion `Y ⊆ X` cannot be dropped: in `ℝ²`, the map
  `φ(x, y) = (x − y, 0)` sends `Y = {xy = 1}` onto the line `X = {y = 0}`, since `x − 1/x` takes
  every real value, yet `Y ≠ X` (after the remark in Agol 2022, proof of Lemma A.2).

### 1.5 Monotonicity under ribbon concordance

If `RibbonLE K₀ K₁`, then the Seifert genus of `K₀` is at most that of `K₁` (Zemke 2019,
Theorem 1.3) and the degree of the Alexander polynomial of `K₀` is at most that of `K₁` (Gordon
1981, Lemma 3.4); it follows from the divisibility of the Alexander polynomial of `K₁` by that
of `K₀`, proved from the surjection of 1.3 on Alexander modules (Friedl–Powell 2020,
Theorem 1.1). Prove first Zemke's injectivity theorem: for a ribbon concordance `C` from `K₀` to
`K₁`, the map `F_C : HFK̂(K₀) → HFK̂(K₁)` is injective (Zemke 2019, Theorem 1.1); with the
detection of the genus by knot Floer homology it gives the genus inequality (Zemke 2019,
Theorem 1.3). Prove on the way that two properly embedded discs in `D² × S²` meeting `S¹ × S²` in
the same unknot, each with one dividing arc, induce the same map in the `Spinᶜ` structure trivial
on `{0} × S²` (Zemke 2019, Lemma 3.1). Not statable at the pins: Tau Ceti has no Seifert genus,
no Alexander polynomial of a smooth circle embedding and no knot Floer homology.

*Needs:* 1.1, 1.3, GeometricTopology 4.3, GeometricTopology 4.4, HeegaardFloer 7.6,
gap:link-floer-cobordism-maps, gap:link-floer-grading-shift, gap:link-floer-two-knot,
gap:hfk-genus-detection.

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

Layer 0, Tau Ceti; 1.3 also gap:knot-group-residually-finite; 1.4 also GeometricTopology 3.4,
5.1, 8.1, 8.3.1 and 11.2 (gap:knot-group-residually-finite, gap:knot-group-peripheral-injection);
1.5 also GeometricTopology 4.3, 4.4 and HeegaardFloer 7.6 (gap:link-floer-cobordism-maps,
gap:link-floer-grading-shift, gap:link-floer-two-knot, gap:hfk-genus-detection).

## Layer 2: two-bridge knots

### 2.1 Lisca's theorem

For coprime `p > q > 0` with `p` odd, the two-bridge knot `K(p, q)` is ribbon if and only if it
is smoothly slice, if and only if the lens space `L(p, q)` smoothly bounds a rational homology
ball (Lisca 2007, Corollary 1.3, from Theorem 1.2 through Donaldson's diagonalization theorem).
Prove on the way that the double cover of `B⁴` branched along a slice disc of `K(p, q)`, `p` odd,
is a smooth rational homology ball bounded by `L(p, q)` (Lisca 2007, §1).

Let `R` be the smallest set of fractions `p/q`, `p > q > 0` coprime, that is closed under
`p/q ↦ p/(p − q)` and `p/q ↦ p/q′` (`0 < q′ < p`, `q q′ ≡ 1 mod p`) and contains every `m²/q` with
`0 < q < m²`, `q` coprime to `m` and of one of three types: (1) `q = mk ± 1` with `0 < k < m` and
`gcd(m, k) = 1`; (2) `q = d(m ± 1)` with `d > 1` dividing `2m ∓ 1`; (3) `q = d(m ± 1)` with
`d > 1` odd dividing `m ± 1` (Lisca 2007, Definition 1.1). Prove that for coprime `p > q > 0` the
lens space `L(p, q)` smoothly bounds a rational homology ball if and only if `p/q ∈ R` (Lisca
2007, Theorem 1.2): gluing the ball to `P(p, q)` and to `P(p, p − q)` gives closed
negative-definite four-manifolds, whose diagonal lattices contain the two plumbing lattices, and
the pairs of such embeddings are classified (Lisca 2007, §§2–7 and §9).

State as targets: for `p/q = [a₁, …, a_n]⁻` with every `a_i ≥ 2`, the linear plumbing `P(p, q)` of
disc bundles over `S²` with Euler numbers `−a₁, …, −a_n` is a smooth compact negative-definite
four-manifold bounded by `L(p, q)`, whose intersection lattice is that of `TauCeti.PlumbingGraph` on
the weighted chain (Lisca 2007, §9); and, for `p/q ∈ R` with `p` odd, `K(p, q)` bounds a
ribbon-immersed disc (Lisca 2007, §8), hence is ribbon by 0.1. Not statable at the pins: Tau Ceti
has no two-bridge knot as a smooth circle embedding, no branched cover and no plumbing of disc
bundles as a four-manifold, and Mathlib has no manifold structure on the boundary of a manifold with
boundary, in which `L(p, q)` would be identified with the boundary of the ball.

*Needs:* 0.1; GeometricTopology 4.10 and 4.4 (the determinant); the lens spaces of
`TauCeti/Geometry/Manifold/Instances/LensSpace.lean`; `TauCeti.PlumbingGraph`,
`TauCeti.PlumbingGraph.intersectionForm`; FourManifolds §5.3, gap:donaldson-definite-any-pi1.

**Checks.**

- `K(3, 1)` is the trefoil: `3` is not a perfect square, so it is not slice (Casson and Gordon,
  as recalled in Lisca 2007, §1), and `L(3, 1)` bounds no rational homology ball.
- `9/2` belongs to Lisca's set `R` (`p = 9 = 3²`, `q = 2 = 3·1 − 1`, type (1) of Lisca 2007,
  Definition 1.1), so `K(9, 2)` is ribbon and `L(9, 2)` bounds a rational homology ball.
- `K(5, 2)` is the figure-eight knot: its determinant `|Δ(−1)| = 5` is not a perfect square, so
  it is neither slice nor ribbon (Lisca 2007, §1) and `L(5, 2)` bounds no rational homology ball;
  its signature `0` does not detect this.
- `9/2 = [5, 2]⁻ = 5 − 1/2`, so `P(9, 2)` is the chain with Euler numbers `−5, −2`: intersection
  matrix `[[−5, 1], [1, −2]]`, negative definite (`−5 < 0`, determinant `9 > 0`), of determinant
  `9 = |H₁(L(9, 2))|`. The continued fraction with plus signs, `5 + 1/2 = 11/2`, would name the
  wrong lens space.

### Examples

- `K(25, 4)` and `K(25, 11)` are ribbon, and `L(25, 4)` and `L(25, 11)` bound rational homology
  balls: `25 = 5²`, `4 = 5·1 − 1`, `11 = 5·2 + 1` (type (1) of Lisca 2007, Definition 1.1, with
  Corollary 1.3).

### Dependencies

Layer 0, GeometricTopology 4.4 and 4.10, FourManifolds §5.3 (gap:donaldson-definite-any-pi1),
Tau Ceti's lens spaces and plumbing graphs.

## Downstream consumers

None known: no roadmap on `main` cites RibbonKnots.

## Research context

The slice–ribbon conjecture asks whether every smoothly slice knot is ribbon (Fox 1962, in the form
of Livingston 2005, §10, Problem 1). It is open. Lisca's theorem (2.1) settles it for two-bridge
knots. Gompf, Scharlemann and Thompson (2010) obtain slice knots with no known ribbon disc by
banding together the two components of slice links that contain the square knot. Dunfield and Gong
(2025) determine smooth sliceness for all but about 11,400 of the 352.2 million prime knots with at
most nineteen crossings, and every smoothly slice knot they find is ribbon. By an observation of
Casson, every slice knot becomes ribbon after connected sum with a suitably chosen ribbon knot
(Livingston 2005, §2.1). In the topological category the corresponding question is whether every
slice knot is homotopy ribbon, and Friedl and Powell (2020) extend Gordon's degree bound (1.5) to
homotopy ribbon concordance.

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
- M. Gerstenhaber, O. S. Rothaus, *The solution of sets of equations in groups*, Proc. Nat. Acad.
  Sci. U.S.A. 48 (1962), 1531–1533; doi:10.1073/pnas.48.9.1531.
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
- P. Ozsváth, Z. Szabó, *Holomorphic disks and genus bounds*, Geom. Topol. 8 (2004), 311–334;
  doi:10.2140/gt.2004.8.311; arXiv:math/0311496.
- C. Livingston, *A survey of classical knot concordance*, in *Handbook of Knot Theory*,
  Elsevier (2005), 319–347; doi:10.1016/B978-044451452-3/50008-3; arXiv:math/0307077.
- I. Zemke, *Knot Floer homology obstructs ribbon concordance*, Ann. of Math. (2) 190 (2019),
  931–947; doi:10.4007/annals.2019.190.3.5; arXiv:1902.04050.
