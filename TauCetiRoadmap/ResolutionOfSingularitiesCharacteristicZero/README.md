# Roadmap: resolution of singularities in characteristic zero

**Summary.** This roadmap constructs `qeResolution` for reduced noetherian quasi-excellent ℚ-schemes: a projective birational modification with regular source, preserving the entire regular locus, and a choice of resolving blowup sequence functorial for every regular morphism after empty steps are omitted. It develops the characteristic-zero field theory of Bierstone–Milman—marked ideals, controlled transforms, maximal contact, Samuel presentations, exceptional history and invariant transformation identities—then supplies Temkin’s local/formal reduction, algebraization and independence arguments. Embedded resolution, principalization, preservation of resolved pairs, strict-SNC compactifications, residual companions and relative boundary cleanup retain their precise source-supported hypotheses. The field case and the spectra of reduced affinoid algebras are named specializations.

## Scope and ownership

This roadmap owns finite resolving-sequence existence, resolution functors and their comparison theorems. It specifies invariant and transformation identities, and existence and functoriality of finite resolving blowup sequences. Executable procedures, algorithm implementations, certificates and termination proofs are outside its scope. SchemeAndStackFoundations owns étale coordinates, ideal sheaves, excellence predicates and their basic permanence, regular ring maps, Néron–Popescu approximation, modifications, regular schemes and the underlying SNC predicates. This roadmap constructs the scheme regular-morphism interface from that ring API in §7.0 and owns the resolution-dependent characteristic-zero adic-completion permanence theorem. StableReduction owns general blowups, their universal property and charts. RigidAnalyticGeometry owns affinoid excellence. GroebnerGeometry G4 owns the ordinary ideal-power associated-graded ring; its regular-local residue-field algebra comparison and the resulting ideal-order formulas belong here in §1.10. The enrichment of SNC component labels by birth order, all marked-ideal and presentation operations, and the local/formal machinery specific to resolution belong here. There is one regular-morphism predicate, one SNC predicate and one blowup construction throughout.

Layers 1–6 treat finite-type schemes over an arbitrary characteristic-zero field, including reduced schemes with several components and non-rational closed points. Layer 7 treats reduced noetherian quasi-excellent ℚ-schemes without a finite-type, separatedness, equidimensionality or universal-catenarity assumption. Smoothness over a field and regularity of a scheme are distinguished. The non-embedded theorem is intrinsic: a general quasi-excellent scheme need not admit local closed embeddings in regular schemes. The general principalization theorem in §7.7 has the semi-strict preservation and projective modification conclusions of its source; the stronger regular-centre and resolved-pair field assertions remain in Layers 3–6.

## Conventions

A noetherian scheme is quasi-compact and locally noetherian. A ℚ-scheme has a specified structure morphism to `Spec ℚ`; every residue field has characteristic zero. Quasi-excellence is the G-ring plus J-2 condition of SchemeAndStackFoundations §0.21; it does not include universal catenarity. The regular locus is the open set of points with regular local rings, using that supplier’s J-2 theorem. For reduced noetherian X it is dense. A resolution is birational component by component: there is one common dense open meeting every component over which the map is an isomorphism and whose inverse image is dense. This extends the integral `IsModification` contract of SchemeAndStackFoundations §4.11 without discarding components. An empty scheme has the empty resolution tower.

Blowup sequences carry centre ideals, their order, and all strict-transform boundary labels. Pullback compatibility identifies sequences after deleting empty centres; it does not delete a nonempty Cartier centre just because its blowup map is an isomorphism. A regular morphism is flat with geometrically regular fibres, with no finite-presentation assumption; its shared scheme predicate is `regularMorphism` of §7.0. A smooth morphism is regular; a completion morphism of a noetherian local G-ring is regular. The functorial general algorithm is not required to reproduce the identical Bierstone–Milman tower on varieties (Temkin 2011, Remark 1.3.2(i)). Its field input is the Bierstone–Milman algorithm with the regular-morphism comparison of Bierstone–Milman–Temkin.

In the field algorithm geometric invariant values and upper semicontinuity use closed points, as in Bierstone–Milman 1997, p. 213. Local algebraic order and the affine Lean cosupport are defined at every prime. Lengths are local-ring lengths, not dimensions over the ground field. Formal coordinates use the residue field with a chosen compatible coefficient-field section; neither a canonical coefficient field nor rationality of the point is assumed. Boundary components are globally labelled smooth components; self-intersecting branches cannot share a smooth-component label. Positive marks, zero and unit ideals, empty coefficient families and the distinct terminal values 0 and ∞ are retained explicitly.

## Exact supplier contracts

### From Mathlib

Use the pinned Mathlib at `6b7abb3`: `AlgebraicGeometry.Scheme`, `Scheme.IdealSheafData` and its `comap`, `PrimeSpectrum`, `Localization.AtPrime`, `IsLocalRing.maximalIdeal`, `IsRegularLocalRing`, `IsRegularRing`, `AlgebraicGeometry.IsReduced`, `AlgebraicGeometry.IsNoetherian`, `Smooth`, `Etale`, `IsProper`, `IsSeparated`, `LocallyOfFiniteType`, `QuasiCompact`, `Scheme.Hom.smoothLocus` and morphism restriction. Local algebra uses `Ideal.map`, ideal powers and suprema, `Module.length`, `MvPolynomial.pderiv`, `MvPowerSeries.coeff`, `MvPowerSeries.order`, `MvPowerSeries.order_mul`, `MvPowerSeries.pderiv`, `Matrix.det`, `Pi.wellQuasiOrderedLE` and `reesAlgebra`. These are the carriers for order, determinantal jets and coordinate charts; no resolution theorem is assumed from them.

### From Tau Ceti

Use the pinned Tau Ceti at `a91d3aa`. `TauCeti.AlgebraicGeometry.affineBlowupι`, `opensRange_affineBlowupι`, `iSup_opensRange_affineBlowupι` and `affineBlowupι_toSpecZero`, in `TauCeti.AlgebraicGeometry.Blowup.AffineCharts`, supply standard Rees charts and their covering and structure maps. `TauCeti.NodeAlgebra.isRegularLocalRing_stalk_blowup_iff`, in `TauCeti.AlgebraicGeometry.Blowup.Node`, is the nodal chart regularity test. `TauCeti.AlgebraicGeometry.isRegularRing_iff_isRegularLocalRing_stalk_Spec` and `TauCeti.AlgebraicGeometry.isRegularLocalRing_stalk_of_smooth`, in the scheme regular-local-ring and smooth-regular modules, identify affine and smooth stalk regularity. These supplied computations are used in chart checks, not reconstructed. Cartier-divisor vocabulary uses Tau Ceti’s `CartierDivisor` with effective local equations where its integral-scheme hypotheses hold; the arbitrary-scheme Cartier-separation target uses invertible ideal sheaves, so it retains its full generality.

`TauCeti.RingTheory.MvPolynomial.OrderAt` supplies `MvPolynomial.taylor`, `MvPolynomial.orderAt`, `MvPolynomial.orderAt_mul`, `MvPolynomial.succ_le_orderAt_iff` and `MvPolynomial.le_orderAt_iff_eval_foldl_pderiv`. RealAlgebraicGeometry Layer 7 owns polynomial Taylor order and its calculus. Multiplicativity uses a coefficient domain; the derivative characterizations use additive torsion-freeness, in particular a characteristic-zero field. This roadmap owns the comparison with localized ideal order in §1.10, including its finite-generator form, and the extension to non-rational primes.

### From GroebnerGeometry

[GroebnerGeometry G4](https://github.com/TauCetiProject/TauCetiRoadmap/pull/899) supplies the ordinary associated-graded ring `gr_I(A)=⊕_{n≥0} Iⁿ/I^(n+1)` for any ideal I of a commutative ring A, on its native quotient/direct-sum carrier. Use its nonnegative grading, unit, homogeneous quotient-class maps, degree-zero identification with `A/I`, product rule `[x]_r [y]_s=[xy]_(r+s)` and induced ring maps with identity and composition. Section 1.10 specializes this same carrier and these same maps to the maximal ideal of a regular local ring. Only this early ordinary ideal-power core is a supplier here.

### From SchemeAndStackFoundations

- §0.8, `etale_coordinates`: a smooth morphism admits an étale coordinate chart near a point. Its `quasi_sections` contract retains the closed-in-fibre and separable-residue hypotheses. This supplies regular coordinate charts; the Taylor, derivative and blowup compatibility are targets here.
- §0.15, `popescu_desingularization` and `popescu_colimit_of_geometricallyRegular`: a regular map between noetherian rings is a filtered colimit of smooth algebras. Use this for regular completion maps and finite-presentation descent, not as an algebraization theorem for every formal scheme.
- §0.21, `Excellence.RegularAlgebraMap`, `Excellence.IsGRing`, `Excellence.IsJ2`, `Excellence.IsQuasiExcellentRing`, `Excellence.IsExcellentRing`, the scheme excellence predicates and `regular_map_completion`: maximal-adic completions of local G-rings are regular ring maps, regular ring maps preserve reducedness in the noetherian setting, regular loci are open for J-2 finite-type algebras, and fields and complete noetherian local rings are excellent. The scheme regular-morphism construction and affine comparison are targets of §7.0 here. General adic-completion quasi-excellence and its resolution prerequisite are targets of §7.2 here, using these same excellence predicates.
- §0.28, `IdealPullback`: image ideals agree with localization and affine pullback, with composition and open-restriction coherence. In particular the affine image-ideal quotient agrees with closed-subscheme sections on affine inverse images; the arbitrary-open quotient requires the supplier’s sheaf comparison. Controlled transforms use these actual image ideals.
- Layer 4, §4.11: `Formal.IsModification`, strict transforms with an explicit retained dense open, their closure and exceptional-power-torsion comparison, transitivity and open gluing; the supplier’s integral birational statement is applied componentwise to reduced schemes here. §4.13 supplies regular schemes, regular-locus equality with the smooth locus over perfect fields, and normalization as resolution of curves when normalization is finite.
- Layer 4, §4.17: `Formal.SNCData`, its `stratum`, `divisor`, `IsTransverse`, `Formal.IsStrictNormalCrossings`, the normal-crossings variant, local equations, smooth pullback and `nc_to_snc`. Strictification concerns the **reduced** inverse-image support; multiplicities remain in the total ideal. This roadmap adds birth ordering and simultaneous-coordinate marked-centre conditions to this supplied data.

### From StableReduction

Layer 4 supplies the blowup of a finite-type quasi-coherent ideal as relative Proj of its Rees algebra, its projectivity and universal property, its exceptional invertible ideal, strict transforms, open restriction, flat base change and affine charts. Only these general blowup contracts are consumed. The resolution of arithmetic surfaces over a DVR and contraction theorems are not used as higher-dimensional characteristic-zero resolution inputs.

### From RigidAnalyticGeometry

§§1.1–1.2 supply noetherianity, the Jacobson property and excellence of affinoid algebras over complete nonarchimedean fields, in every characteristic; §1.2 includes regularity of Tate algebras, universal catenarity and geometrically regular formal fibres. Thus a reduced characteristic-zero affinoid algebra A has reduced noetherian quasi-excellent `Spec A`. The resolution application uses this exact algebraic contract, and requires no relative analytification or perfectoid supplier.

## How to read the build

Layer 1 develops orders, marked ideals and test transforms. Layer 2 constructs contact and Samuel presentations. Layer 3 constructs the history-sensitive invariant, its transformation identities and finite resolving-sequence existence theorems. Layer 4 gives residual companions and the distinct homogenization route. Layer 5 proves principalization, embedded and relative resolution and preservation of resolved points. Layer 6 gives projective SNC compactifications and Cartier separation. Layer 7 supplies the extra local/formal, algebraization, approximation and gluing arguments for quasi-excellent schemes and states the general theorems and their specializations. The worked examples retain the local computations distinguishing the constructions. `Suggested.lean` records only suggested forms statable against the pinned APIs; the README specifies every target, including the formal and functorial constructions.

## Layer 1: marked ideals, transforms and test equivalence

### 1.1 regularCoordinates

Prove `regularCoordinates`. For a smooth finite-type k-scheme M with `char(k)=0` and a closed point a, an étale coordinate neighbourhood gives a regular parameter system at a and a completion identification `Ô_M,a ≃ κ(a)[[X₁,…,Xₙ]]`. Taylor coefficients and partial derivatives of regular functions, including those restricted to a smooth coordinate submanifold, are regular after shrinking a single Zariski neighbourhood when the relevant Jacobian determinant is a unit. Coordinate blowup charts preserve these properties. The coefficient field is `κ(a)`, including non-rational closed points.

Here k is a characteristic-zero field; M is smooth of finite type; a is closed.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), §3.1–3.8, pp. 231–234; Example 3.12, pp. 236–237; 4.14–4.20, pp. 244–246).

For the proof, use the étale Jacobian inverse to define differentiation on localized regular functions; then construct the Taylor map over the residue field and apply completeness and the regular-parameter expansion; then use the explicit coordinate-subspace blowup substitutions from StableReduction Layer 4 and invert the finitely many required denominators.

On polynomial coordinate charts at k-rational points, use Tau Ceti’s `MvPolynomial.taylor` and its differentiation identities; §1.10 compares their order with local order. The residue-field and étale-chart extensions remain targets here.

*Needs:* SchemeAndStackFoundations §§0.8, 0.28, StableReduction Layer 4, Mathlib `MvPowerSeries.pderiv`.

### 1.2 stalkOrder

Define `stalkOrder`. For a quasi-coherent ideal I on a scheme X, stalkIdeal(I,a) is the ideal of `O_X`,a obtained from affine-section ideals by the germ maps. On a Noetherian local ring `(A,m)`, idealOrder(J)=sup{`r∈N : J⊆m`ʳ}, valued in `N∪{∞}`. For the smooth formal chart `κ(a)[[X]]`, it equals inf{order(f):`f∈J`}, where order is Mathlib total-degree order; order(0)=`∞` and order(A)=0. The local cosupport of `(I,d)` is {a:idealOrder(`I_a`)≥d}.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Remark 1.8, p. 216; Proposition 3.13 and Remark 3.14, p. 237; Corollary 3.20, p. 239; 4.1 and 4.7, pp. 241–243).

The API gives `stalkIdeal_affine`: An affine germ identifies stalkIdeal with localization of the corresponding section ideal; `idealOrder_eq_iInf`: In the finite-variable formal chart, idealOrder(J)=`inf_{f∈J} MvPowerSeries.order(f)`; `idealOrder_span`: For a finite generating family, its ideal order is the minimum of the generators’ orders.

For rational points of polynomial charts, the generator orders are the supplied `MvPolynomial.orderAt` by the comparison in §1.10; this does not replace localization at arbitrary primes.

*Needs:* Mathlib `AlgebraicGeometry.Scheme.IdealSheafData`, Mathlib `MvPowerSeries.order`, `regularCoordinates`, SchemeAndStackFoundations §§0.8, 0.28.

**Checks.**

- `order_zero_ideal`: The zero ideal has order `∞`, hence lies in every positive-mark cosupport.
- `order_unit_ideal`: The unit ideal has order 0 and empty positive-mark cosupport.
- `order_two_generators`: In `k[[x,y]]`, `(x³,y⁵)` has order 3; replacing minimum by sum would fail.

### 1.3 Birth-ordered SNC boundaries

Equip SchemeAndStackFoundations §4.17’s `Formal.SNCData` and `Formal.IsStrictNormalCrossings` with a total birth order on its finite labels; call this enrichment `sncBoundary`. On a smooth finite-type k-scheme M its components are smooth effective Cartier hypersurfaces `H_i`, with distinct germs at every intersection, such that around every point an étale coordinate chart identifies each incident `H_i` with a different coordinate hyperplane; nonincident components miss a smaller chart. A closed smooth submanifold N has simultaneous SNC with E when the same coordinates also make N a coordinate subspace not contained in any `H_i` used in its presentation. The empty boundary is allowed. Global labels must not identify two local branches of a self-intersecting component.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), §1, admissibility and normal-crossings convention, p. 213; Example 3.12, pp. 236–237; 4.1, p. 241).

The API gives `sncBoundary_empty`: An empty boundary on a smooth scheme is SNC; `sncBoundary_restrict`: Restriction to an open subscheme preserves labels and the SNC condition; `sncBoundary_coordinate`: Distinct coordinate hyperplanes in affine space form an SNC boundary.

*Needs:* Mathlib `AlgebraicGeometry.Scheme.IdealSheafData`, `regularCoordinates`, SchemeAndStackFoundations §0.28.

**Checks.**

- `snc_coordinate_axes`: The two axes of `A²` are SNC at their intersection.
- `snc_tangent_curves`: `y=0` and `y=x²` in `A²` are not SNC at 0.
- `snc_self_intersection`: A single labelled irreducible nodal curve is not a smooth SNC component.

### 1.4 markedIdeal

Define `markedIdeal`. A marked ideal on smooth M with boundary E consists of a smooth closed `N⊆M` simultaneous-SNC with E, a coherent ideal J on N, and a positive integer d. Its cosupport is `{a∈N:ord_a(J)≥d}`. A weighted presentation on N is a finite family `(h_i,µ_i)`, with positive rational marks and `µ_i≤ord_a(h_i)` at the distinguished point, together with the remaining labelled boundary. Its cosupport is the simultaneous order inequalities. Pairs with mark 0 impose no constraint and are discarded; zero functions and an empty family are retained with infinite normalized order. Passing to a common integral mark D replaces `h_i` by `h_i^(D/µ_i)`, with `D/µ_i` positive integral, and takes their generated ideal with mark D.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), 4.1–4.2, p. 241; Construction 4.23, p. 247).

The API gives the cosupport of a marked ideal (`ResolutionOfSingularities.MarkedIdeal.cosupport` on affine charts): membership is exactly `ord_a(J)≥d`.

*Needs:* `stalkOrder`, `sncBoundary`, Mathlib `MvPowerSeries.order_mul`.

**Checks.**

- `mark_changes_cosupport`: `(x²,2)` contains 0 whereas `(x²,3)` does not.
- `marked_zero_and_unit`: The zero ideal has full cosupport and the unit ideal has empty cosupport for `d>0`.
- `weighted_common_mark`: Pairs `(x²,2)`,`(y³,3)` become `((x⁶,y⁶),6)`, not `((x²,y³),6)`.

### 1.5 permissibleCentre

Define `permissibleCentre`. A permissible centre for `(N,J,d,E)` is a closed smooth `C⊆N` contained in its cosupport, with C and E simultaneously coordinate subspaces/hyperplanes in smooth local coordinates. For controlled-transform divisibility require `J⊆I_C`ᵈ, which is equivalent to the cosupport condition along the smooth centre in this setting. A centre may be contained in a boundary component; simultaneous SNC is the convention, not disjointness. An invariant-admissible resolution centre must also lie in a stratum of the current invariant.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), 4.3(i), p. 242; 4.15, p. 245; 6.7, pp. 255–256).

The API gives `permissibleCentre_idealPower`: `J⊆I_C`ᵈ supplies controlled-transform divisibility; `permissibleCentre_boundaryContained`: A coordinate centre contained in some `H_i` remains permissible if the order condition holds; `permissibleCentre_snc_after`: A permissible blowup has smooth ambient space and updated SNC boundary.

*Needs:* `markedIdeal`, `regularCoordinates`, StableReduction Layer 4.

**Checks.**

- `centre_contained_in_boundary`: For `E={x=0}`, `(x²,y²)` marked 2 in `A²`, the origin is permissible.
- `centre_outside_cosupport`: For `(x,2)`, the origin is not permissible.
- `centre_tangent_to_boundary`: `C={y=x²}` and `H={y=0}` in `A²` fail the simultaneous-coordinate condition at 0.

### 1.6 controlledTransform

Define `controlledTransform`. For a permissible blowup `π:M′→M` with new exceptional ideal `L=I_Enew`, totalTransform(J)=`J·O_N′`, controlledTransform(J,d)=`L^(−d)`·totalTransform(J), with mark d unchanged. This notation means the unique ideal `J′` with totalTransform(J)=`LᵈJ′`. StrictTransform(J) is saturation of totalTransform(J) by all powers of L; weakTransform(J) divides by the actual generic order along C. These are different operations. Update the boundary by strict transforms of old components plus the newly born exceptional hypersurface, even when blowing up a Cartier centre makes π an isomorphism.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Proposition 3.13 and Remark 3.14, p. 237; 4.4(i)–4.5, p. 242; Lemma 5.1, p. 248).

The API gives `controlledTransform_factor`: Total transform=`Lᵈ`·controlled transform; `controlledTransform_identityCartier`: A Cartier-centre identity blowup still divides the marked ideal by the centre equation to power d; `controlledTransform_flatBaseChange`: Whenever the pulled-back marked ideal and centre remain permissible, flat base change identifies their controlled transforms.

*Needs:* `permissibleCentre`, StableReduction Layer 4, Mathlib `AlgebraicGeometry.Scheme.IdealSheafData.comap`.

**Checks.**

- `cusp_controlled_chart`: For `(z²−x³,2)` at the origin, the x-chart gives z=xw and controlled equation `w²−x`; total equation is `x²(w²−x)`.
- `different_from_strict`: For `(x³,2)` blown up at the origin of `A²`, the x-chart controlled ideal is(x), while the strict transform is the unit ideal.
- `cartier_identity_not_trivial`: Blowing up centre(x) on `A¹` transforms `(x³,2)` to(x,2), despite the underlying map being an isomorphism.

### 1.7 testEquivalence

Define `testEquivalence`. Two presentations with the same labelled boundary are equivalent if their cosupports agree after every finite admissible test sequence, including equality of the conditions for a point upstairs to remain in a transformed cosupport. Full equivalence permits (i) permissible controlled blowups, (ii) product with `A¹` at `(a,0)`, adding the artificial boundary `t=0`, and (iii) blowup of `H₀∩H₁` for two boundary hypersurfaces with pure pullback, without controlled division, at the unique point above a on the strict transform of the chosen `H₁`. The weaker relations use only (i,ii), or the restricted relation s*: an exceptional block follows a type (ii) or preceding type (iii) step; after a product it successively blows up the artificial/new exceptional hypersurface against strict transforms of one fixed old H, at the point on that strict transform. Empty test sequences are included. Equal initial cosupport alone is insufficient.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), (4.3)–(4.4) and Definition 4.6, p. 242; Definition 4.10, pp. 243–244).

The API gives `presentationEquivalent_equivalence`: Each of the three test policies defines an equivalence relation; `presentationEquivalent_transform`: A permitted first test preserves equivalence for every sequence of tests allowed after it. For s*, retain the exceptional-block history and its fixed old boundary label; do not reset the test policy at the transformed presentation; `presentationEquivalent_strength`: Full equivalence implies s*, which implies(i,ii) equivalence; converses are not asserted.

*Needs:* `controlledTransform`, `markedIdeal`, `sncBoundary`, StableReduction Layer 4.

**Checks.**

- `rescaling_test_equivalence`: `(x²,2)` and(`x⁴`,4) are equivalent under full tests.
- `same_initial_cosupport_fails`: `(x²,1)` and(`x³`,1) on `A¹` have the same initial cosupport; repeated Cartier-centre controlled blowups distinguish them.
- `exceptional_pullback_not_division`: A type (iii) chart `x=t`,y=tv pulls `x²y` to `t³v` with no division by its mark.

With the test relations and transform rules in place, prove `weightedPresentation_commonMark`: powering to a common positive integral mark preserves cosupports after every full test sequence; and `markedIdeal_rescale`: `(J,d)` and `(Jʳ,rd)` are fully test-equivalent for `r>0`. Controlled division commutes with these powers, while product and exceptional tests use pure pullback. These extend the common-mark construction of §1.4. (Bierstone–Milman 1997, Remark 4.2, p. 241; (4.4) and Definition 4.6, p. 242; Construction 4.23, p. 247.)

### 1.8 normalizedOrders

Define `normalizedOrders`. For a weighted presentation `P=(N,{(h_i,µ_i)},E)`, `µ(P)=min_i ord_a(h_i)/µ_i`. If finite, `µ_H(P)=min_i ord_{H∩N}(h_i)/µ_i` and `ν(P)=µ(P)−Σ_Hµ_H(P)≥0`. If every `h_i=0` or the family is empty, `µ(P)=ν(P)=∞`; no subtraction`∞−∞` is performed. The exceptional order is generic divisibility by the boundary equation, not order at a.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Definitions 4.7 and 4.9, p. 243).

The API gives `normalizedOrder_commonMark`: For common mark d, `µ=ord_a(J)/d`; `exceptionalOrder_divisibility`: `dµ_H` is the largest exponent of `x_H` dividing all common-mark generators; `residualOrder_nonnegative`: For finite `µ`, `ν=µ−Σµ_H≥0`; in the zero presentation `ν=∞`.

*Needs:* `markedIdeal`, `stalkOrder`, `sncBoundary`.

**Checks.**

- `exceptional_is_not_point_order`: For `(x²y³,2)` with `E={x=0}`, `µ=5/2`, `µ_H=1` and `ν=3/2`.
- `monomial_residual_zero`: For the same pair with `E={x=0,y=0}`, `ν=0`.
- `empty_presentation_infinite`: An empty coefficient family has residual order `∞`, not0.

### 1.9 ordersInvariant

Prove `ordersInvariant`. For presentations of the same codimension, normalized order `µ` is invariant under (i,ii) equivalence. If `µ` is finite, each labelled exceptional order `µ_H` and henceν is invariant under s* equivalence. Codimension must remain fixed for these comparisons.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Propositions 4.8 and 4.11, pp. 243–244; proofs§5, pp. 248–251).

For the proof, after product with a line, follow the distinguished axis through β point blowups and α controlled Cartier-centre steps. Their admissibility is equivalent to `β(µ−1)−α≥1`; these inequalities recover `µ`; then for a fixed boundary H, use the restricted exceptional chain `x_H=tʲy_H`. The eventual normalized-order differences recover `µ_H`; then subtract the finitely many recovered exceptional contributions.

*Needs:* `testEquivalence`, `normalizedOrders`, `controlledTransform`.

### 1.10 Affine order and marked sums

*Needs:* §§1.2, 1.4; GroebnerGeometry G4's ordinary ideal-power associated-graded core; Mathlib localizations, ideal powers and regular local rings.

`ResolutionOfSingularities.idealOrderAt I p` is the supremum of the integers n for which the localized ideal lies in the n-th maximal-ideal power. Its API `ResolutionOfSingularities.idealOrderAt.unit`, `ResolutionOfSingularities.idealOrderAt.zero`, `ResolutionOfSingularities.idealOrderAt.cosupport` has values zero and infinity for the unit and zero ideals and gives the positive-mark threshold. This affine carrier is separate from the global marked-ideal sheaf but agrees on affine regular charts. `ResolutionOfSingularities.MarkedIdeal` retains `ideal`, positive `mark` and `mark_pos`; `ResolutionOfSingularities.MarkedIdeal.cosupport` is this threshold set. On a ring with regular localizations, `ResolutionOfSingularities.MarkedIdeal.cosupport_pow` states that `(I, d)` and `(Iᵏ, kd)` have the same cosupport, and `ResolutionOfSingularities.MarkedIdeal.isClosed_cosupport` that the cosupport is closed on a regular ring of finite type over a field of characteristic zero. The sum `ResolutionOfSingularities.MarkedIdeal.markedSum J K` has ideal `J.ideal^K`.mark + `K.ideal^J`.mark and mark `J.mark*K.mark`. Its API `ResolutionOfSingularities.MarkedIdeal.markedSum_mark`, `ResolutionOfSingularities.MarkedIdeal.markedSum_ideal`, `ResolutionOfSingularities.MarkedIdeal.markedSum_cosupport` gives these formulas and the cosupport intersection under regular localizations; the powers have the opposite marks as exponents. (Bierstone–Milman 1997, §4.1–4.2, p. 241 and Construction 4.23, p. 247; the sum uses the common-mark calculation, and its order comparison uses the regular local associated graded ring.)

Construct `regularLocalAssociatedGraded` here: for a noetherian regular local ring `(A,m,κ)` of dimension d, equip GroebnerGeometry G4's supplied `gr_m(A)` with its κ-algebra structure through the supplied degree-zero identification `A/m≃κ`. For any chosen regular system of d parameters, prove that their supplied degree-one quotient classes give a degree-preserving κ-algebra isomorphism `κ[X₁,…,X_d] ≃ gr_m(A)`. It sends coefficients to their degree-zero classes and variables to these parameter classes, retaining the supplied grading, multiplication and induced maps. Prove that this graded ring is a domain and that initial forms multiply, using the supplied homogeneous product rule. The residue-field algebra comparison, parameter isomorphism and initial-form argument belong here. There is no equicharacteristic or coefficient-field-section hypothesis. (Stacks, Lemma [00NO](https://stacks.math.columbia.edu/tag/00NO).)

Prove `ResolutionOfSingularities.idealOrderAt_mul` and `ResolutionOfSingularities.idealOrderAt_pow`: at any prime p whose localization is regular local, `ord_p(IJ)=ord_p(I)+ord_p(J)` and `ord_p(Iʳ)=r • ord_p(I)` for `r>0`, including zero ideals with order `∞`. Also prove `ResolutionOfSingularities.idealOrderAt_sup`: `ord_p(I+J)=min(ord_p(I),ord_p(J))`, which needs no regularity. The graded domain and Krull intersection give the product formula; choose elements of least order in nonzero ideals, then induct for powers. These formulas supply the general regular-local proofs of `MarkedIdeal.cosupport_pow` and `MarkedIdeal.markedSum_cosupport`, separately from polynomial Taylor order. (Stacks, Lemma 00NO; Bierstone–Milman 1997, §4.1–4.2 and Construction 4.23.)

**Checks.**

- In dimension zero A is a field, and the comparison identifies the supplied degree-zero classes with κ in `gr_m(A)`; the unit and zero ideals have orders zero and `∞`, respectively, and the positive-power formula retains both cases.
- For `A=ℤ_(p)` and prime p, `gr_m(A)≃𝔽_p[T]` sends T to the supplied degree-one class of p and Tⁿ to the degree-n class of pⁿ; `(pᵃ)ʳ` has order ar. This mixed-characteristic case needs no section `𝔽_p→A`.
- For `A=k[[x,y]]`, `I=(x²,y³)` has order two, `Iʳ` has order 2r and `I+(y)` has order one. On `k[ε]/ε²`, the nonzero degree-one class squares to zero and the order-power formula fails, as in `OrderTests.dualNumbers`.

Prove `ResolutionOfSingularities.idealOrderAt_span_eq_orderAt`: for a field k, finite variable type σ, a point `a:σ→k`, its evaluation prime `p_a=ker(eval_a)` and any polynomial f, `idealOrderAt ((f),p_a)=MvPolynomial.orderAt f a`. Prove `ResolutionOfSingularities.idealOrderAt_span_eq_iInf_orderAt`: for any finite indexed family `(f_i)`, `idealOrderAt ((f_i),p_a)=inf_i MvPolynomial.orderAt f_i a`, with empty infimum `∞`. No characteristic-zero hypothesis is needed. Translate a to the origin, identify the evaluation maximal ideal with the coordinate ideal, and compare its powers before and after localization: a denominator nonvanishing at a has Taylor order zero, so multiplying by it cannot change order. Apply the finite-generator minimum formula. (Tau Ceti `RingTheory/MvPolynomial/OrderAt.lean`, `orderAt_def`, `orderAt_mul`, `orderAt_eq_zero_iff`; Bierstone–Milman 1997, §3, pp. 231–234 and Corollary 3.20, p. 239.)

*Needs:* RealAlgebraicGeometry Layer 7; Tau Ceti `TauCeti.RingTheory.MvPolynomial.OrderAt`; §1.2.

**Checks.**

- At any coordinate point, zero has both orders `∞` and the constant one has both orders zero; an empty generating family gives the zero ideal.
- At `(a,b)`, the ideal `((x−a)³,(y−b)⁵)` has both minimum orders three, in every characteristic.
- Over `𝔽_p`, `x^p` has order p at zero even though its ordinary derivative vanishes. The comparison needs no derivative criterion; over ℚ the prime `(x²+1)` has no rational evaluation point and still uses `idealOrderAt`.

**Checks.**

- `IdealOrderChecks.unit`: the unit ideal has order 0 at every prime; `ResolutionOfSingularities.MarkedIdeal.unit_cosupport` gives its empty positive-mark cosupport.
- `IdealOrderChecks.zero`: the zero ideal has order infinity and full cosupport.
- `OrderTests.dualNumbers`: on `k[ε]/ε²` the maximal ideal has order 1, whereas its square has infinite order; arbitrary local rings cannot replace regular charts in the power formula. `CompanionChecks.dualNumbers` gives the resulting different cosupports: `(m,2)` has empty cosupport but `(m²,4)` has full cosupport.
- `CompanionChecks.marks`: summing `(y²,2)` and `(x³,2)` gives ideal `(y⁴,x⁶)` and mark 4.
- `CompanionChecks.unit`: a unit summand gives the unit ideal and empty cosupport.
- `CompanionChecks.zero`: two zero ideals give zero ideal and full cosupport, with the positive product mark.

### Examples

The cusp, rescaling, exceptional pure pullback, dual-number and opposite-mark sum checks above distinguish order from reduced support, and controlled from strict transform.

### Dependencies

*Needs:* SchemeAndStackFoundations §§0.8, 0.28, 4.17; StableReduction Layer 4; Mathlib local algebra and power series.

*Lean:* `ResolutionOfSingularities.idealOrderAt`, `ResolutionOfSingularities.idealOrderAt_span_eq_orderAt`, `ResolutionOfSingularities.idealOrderAt_span_eq_iInf_orderAt`, `ResolutionOfSingularities.MarkedIdeal`, `ResolutionOfSingularities.MarkedIdeal.cosupport`, `ResolutionOfSingularities.MarkedIdeal.cosupport_pow`, `ResolutionOfSingularities.MarkedIdeal.markedSum`, `ResolutionOfSingularities.MarkedIdeal.markedSum_mark`, `ResolutionOfSingularities.MarkedIdeal.markedSum_ideal`, `ResolutionOfSingularities.MarkedIdeal.markedSum_cosupport`, `ResolutionOfSingularities.MarkedIdeal.isClosed_cosupport` and their examples, including the strict-containment residual cosupport and the degree-two prime order calculation. The polynomial controlled-transform identities and the localized Cartier-centre computation are also mirrored. Global marked sheaves, boundaries and test towers are README targets.

## Layer 2: contact, coefficients and Samuel presentations

### 2.1 maximalContact

Prove `maximalContact`. Let a presentation F on smooth N satisfy `µ(F)=1`. Suppose an integral-mark pair `(f*,d)` has `ord_a(f*)=d` and a d-th derivative in a coordinate `x_m` transverse to every remaining boundary component is a unit at a. Then `z=∂_(x_m)^(d−1)f`* has order 1; adjoining `(z,1)` preserves full test equivalence. Its hypersurface is smooth, contains the cosupport and remains simultaneous-SNC with the boundary after every allowed test transform. This applies to normalized presentations with empty remaining boundary and to the source’s inductively transformed presentations; it is not a theorem about arbitrary marked ideals with boundary.

Here the remaining-boundary transverse derivative condition is required.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Proposition 4.12 and Remarks 4.13, p. 244; Example 4.16, p. 245; proof, pp. 251–252).

For the proof, choose a direction where the degree-d initial form has nonzero d-th derivative; characteristic zero supplies the factorial units; then use the formal implicit-function criterion for z and the derivative blowup formula; then compare derivatives after controlled division, after product and after exceptional pure pullback to prove persistence.

*Needs:* `regularCoordinates`, `ordersInvariant`, `controlledTransform`.

### 2.2 coefficientPresentation

Define `coefficientPresentation`. For an integral weighted presentation F satisfying the maximal-contact hypotheses with contact coordinate z, restrict to `N₁={z=0}` and take all pairs(`c_{f,q}`,`d_f−q`), `0≤q<d_f`, where `c_{f,q}=(1/q!)∂_z^q f|_{z=0}`. Keep zero coefficients and an empty family. Equivalently choose a common mark D and take the ideal generated by `c_{f,q}^(D/(d_f−q))` with mark D. Ordinary coefficient generators without their weights do not specify the construction.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Construction 4.18 and Remarks 4.20, p. 246).

The API gives `coefficientPresentation_cosupport`: On `z=0` its cosupport equals that of F under the maximal-contact hypotheses; `coefficientPresentation_commonMark`: The common-mark ideal retains the powers `D/(d_f−q)`; `coefficientPresentation_transform`: After a permissible chart change, `c′_{f,q}=e^(−(d_f−q))π*c_{f,q}`.

*Needs:* `maximalContact`, `markedIdeal`, `regularCoordinates`, Mathlib `MvPowerSeries.pderiv`.

**Checks.**

- `cusp_coefficient_weights`: For `z²+x³` marked 2, the coefficient pairs are(`x³`,2),(0,1), and the residual ratio without boundary is `3/2`.
- `mixed_coefficient_weights`: For `z³+x⁴z+y⁵` marked3, the nonzero coefficient pairs are(`y⁵`,3),`(x⁴,2)`; common mark6 gives(`y¹⁰`,`x¹²`).
- `contact_pure_power`: For `zᵈ` marked d, all lower coefficients vanish, so the coefficient ideal is zero, not the unit ideal.

### 2.3 coefficientEquivalence

Prove `coefficientEquivalence`. Under the maximal-contact hypotheses, the original presentation on N and its coefficient presentation on `N₁` are fully test-equivalent, despite differing codimension by 1. After every permitted test sequence, the coefficient presentation of the transformed F is the transformed coefficient presentation, with the controlled coefficient formula and pure-pullback exceptional formula. Their data extend regularly on the same suitably shrunk open.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Proposition 4.19, p. 246; proof pp. 252–253; 4.20, p. 246).

For the proof, use the z-Taylor expansion to express the original order inequality by the lower coefficient inequalities; then use the adjoined(z,1) pair to ensure all relevant transformed cosupport points stay on the contact hypersurface; then compute derivatives in a permissible chart and treat type (iii) separately; divide by the individual coefficient mark only in type (i).

*Needs:* `coefficientPresentation`, `testEquivalence`, `controlledTransform`.

### 2.4 residualPresentation

Define `residualPresentation`. For a common-mark coefficient ideal `J=(h_i)`, mark d, finite normalized order `µ`, let M=`Π_Hx_H^(dµ_H)`, write `h_i=M g_i` and `ν=µ−Σµ_H`. If `ν>0` take pairs `(g_i,dν)`, and, when `ν<1`, also `(M,d(1−ν))`; discard zero-mark constraints and clear any remaining rational marks. If `ν=0` use the single pair `(M,d)`. If `ν=∞` terminate at the zero presentation. The resulting cosupport is the stratum where the previous invariant and ν retain their values. For positive finite ν its normalized order is 1.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Construction 4.23, p. 247; Proposition 4.24 and proof pp. 248,253–254).

The API gives `residualPresentation_normalized`: For `0<ν<∞` the new presentation has normalized order 1; `residualPresentation_stratum`: Its cosupport cuts out equality of the newly computed residual order within the old stratum; `residualPresentation_sstar`: Its s* class is determined by the preceding s* class and labelled remaining boundary.

*Needs:* `coefficientEquivalence`, `normalizedOrders`, `ordersInvariant`.

**Checks.**

- `residual_requires_guard`: For `(x²(x+y),3)`, `E={x=0}`, `µ=1`,`µ_H=2/3`,`ν=1/3`: residual pairs(`x+y`,1),`(x²,2)`; dropping the guard enlarges the locus along `x+y=0`.
- `residual_monomial_terminal`: For `(x²y³,2)` with both boundary axes,`ν=0` and the residual presentation is(`x²y³`,2).
- `residual_no_guard_above_one`: For `(x²y³,2)` with only `x=0`,`ν=3/2`; the residual pair is(`y³`,3) and no negative-mark guard is added.

### 2.5 initialDiagram

Define `initialDiagram`. For an ideal `I⊆K[[X₁,…,Xₙ]]`, exp(f) of nonzero f is its least nonzero coefficient exponent in graded lexicographic order `(|α|,α₁,…,αₙ)`. `D(I)`={exp(f):`0≠f∈I`} is upward closed for componentwise addition; its finitely many minimal vertices generate it under addition by `Nⁿ`. `D(0)=∅` and `D(1)=Nⁿ`. This is graded lexicographic order, not the pure lexOrder valuation.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), §3, Diagram of initial exponents, Theorem 3.17 and Corollary 3.19, p. 238; Corollary 3.20, p. 239).

The API gives `initialDiagram_upward`: `α∈D` and `β∈Nⁿ` imply`α+β∈D`; `initialDiagram_vertices`: D is the union of the translates `α+Nⁿ` for its finite minimal vertices; `initialDiagram_monomial`: For a monomial-generated ideal, D is the union of the generating translates.

*Needs:* Mathlib `MvPowerSeries.coeff`, Mathlib `Pi.wellQuasiOrderedLE`.

**Checks.**

- `diagram_zero_and_unit`: The zero and unit ideals have empty and full diagrams respectively.
- `diagram_xy`: For(`x²`,xy)⊆`K[[x,y]]`, the vertices are(2,0),(1,1).
- `graded_lex_not_pure_lex`: For `x+y²`, exp=(1,0) because degree1 precedes degree2; pure lex on(x,y) would choose(0,2).

### 2.6 formalDivision

Prove `formalDivision`. Let `F_i∈K[[X]]` have graded-lex initial exponents `α_i`. Let `Δ_i=(α_i+Nⁿ)\⋃_{j<i}(α_j+Nⁿ)`, and `Δ=Nⁿ\⋃_iΔ_i`. Every formal series G admits a unique decomposition `G=Σ_iQ_iF_i+R` with `α_i+supp(Q_i)⊆Δ_i` and `supp(R)⊆Δ`. Choosing generators with exponents the vertices of `D(I)` gives zero remainder exactly for `G∈I`; normalized vertex generators have prescribed initial monomials and remaining support outside `D(I)`.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Theorem 3.17, Remark 3.18 and Corollary 3.19, p. 238).

For the proof, recursively cancel the least remaining exponent in graded-lex order; the ordering is compatible with addition and only finitely many terms occur in each bounded degree; then completeness gives formal `Q_i` andR with the required supports; then compare least exponents to prove uniqueness; for vertex generators a nonzero remainder inI would contradict the definition ofD(I).

*Needs:* `initialDiagram`, Mathlib `MvPowerSeries.coeff`.

### 2.7 hilbertSamuel

Define `hilbertSamuel`. For a Noetherian local ring `(A,m)`, `H_A(ℓ)=length_A(A/m^(ℓ+1))`, a finite natural number. For `I⊆K[[X]]`, write `H_I` for `H_{K[[X]]/I}`. Geometric estimates use pointwise comparison in every ℓ. Centre scheduling uses the fixed total lexicographic order: unequal functions are compared at the least ℓ where they differ. This extends the pointwise order and preserves its equality relation. In a finite-type smooth ambient chart use the residue field `κ(a)`, not ground-field dimension. In the geometric invariant a point means a closed point, as fixed on BM1997 p. 213; the unnormalized intrinsic local function at arbitrary scheme points is not being asserted upper semicontinuous.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Closed-point convention and Remarks 1.3, pp. 213–214; Corollary 3.20, p. 239; Theorem 9.2 and Lemma 9.3, p. 276).

The API gives `hilbertSamuel_completion`: Completion preserves every `valueH_A(ℓ)`; `hilbertSamuel_diagram`: `H_I(ℓ)` counts `α∉D(I)` with |`α|≤ℓ`; `hilbertSamuel_order`: pointwise `H≤H′` means `∀ℓ, H(ℓ)≤H′(ℓ)`, and equality means equality of all values. Prove `hilbertSamuel_lex`: lexicographic comparison is total and extends pointwise comparison. Together with local finiteness, pointwise upper semicontinuity implies upper semicontinuity for this scheduling order: each lexicographic upper set of attained values is a finite union of pointwise upper sets. (Bierstone–Milman–Temkin, [§6.1](https://arxiv.org/html/0905.3580v1#S6.SS1).)

The affine signature `ResolutionOfSingularities.localQuotientHilbertSamuel A I` computes `H_(A/I)` as `length_A(A/(I + m^(ℓ+1)))`, including the zero quotient for the unit ideal. It takes values in `ℕ∞`; `ResolutionOfSingularities.localQuotientHilbertSamuel_finite` asserts finiteness for every ideal of a noetherian local A, identifying these values with natural numbers. `ResolutionOfSingularities.hilbertSamuel_completion` states equality with the function of the extended ideal in the maximal-adic completion.

*Needs:* Mathlib `Module.length`, `stalkOrder`, `formalDivision`, SchemeAndStackFoundations §§0.8, 0.28.

**Checks.**

- `hilbertSamuel_smooth`: For `K[[x₁,…,xₙ]]`, `H(ℓ)`=choose(`n+ℓ`,n).
- `hilbertSamuel_double_point`: For `K[[x]]/(x²)`, `H(0)=1` andH(ℓ)=2 forℓ≥1.
- `hilbertSamuel_nonrational_point`: A degree-two closed point hasH(0)=1 by local length, although its residue field hasQ-dimension2.

### 2.8 hsStabilization

Prove `hsStabilization`, stated as `ResolutionOfSingularities.hsStabilization`. Fix n. For ideals `I_j⊆K[[X₁,…,Xₙ]]`, if `H_{I_j}(ℓ)≥H_{I_{j+1}}(ℓ)` for every j,ℓ, then there is `j₀` such that all `H_{I_j}` with `j≥j₀` coincide. The statement concerns functions realized by formal ideals in fixed embedding dimension, not arbitrary natural-number-valued functions.

([Edward Bierstone and Pierre D. Milman](https://www.researchgate.net/publication/255647609_Uniformization_of_Analytic_Spaces), Theorem 5.2.1 and proof, pp. 820–821).

For the proof, replace each ideal by its finite-vertex initial diagram. In a strictly decreasing subsequence, successive finite vertex prefixes can be fixed on infinite subsequences because Hilbert counts bound their degrees; then diagonalize these prefixes. Dickson finite generation forces the limit diagram to have finitely many vertices, contradicting continuing strict decreases.

Prove `hsLexStabilization`, stated as `ResolutionOfSingularities.hsLexStabilization`: in the same fixed finite-variable formal ambient ring, every lexicographically nonincreasing sequence of realized Hilbert–Samuel functions is eventually constant. Establish stabilization for the lexicographic order itself by the finite-vertex diagram argument, retaining the least degree of each strict change; pointwise stabilization alone does not imply this assertion. This supplies the first-entry stabilization for the scheduled invariant words of Layer 3. (Bierstone–Milman–Temkin, §6.1, property (4); Bierstone–Milman, *Uniformization of analytic spaces*, Theorem 5.2.1, pp. 820–821.)

*Needs:* `hilbertSamuel`, `initialDiagram`, Mathlib `Pi.wellQuasiOrderedLE`.

**Checks.**

- For `I_j=(x^(max(N−j,1)))⊆K[[x]]`, the functions decrease in both orders and stabilize at the function of `K[[x]]/(x)`.
- In a common five-variable ambient ring, the completed five-axis curve has H(1)=6 and H(11)=56, whereas six distinct plane lines have H(1)=3 and H(11)=57. The first function is lexicographically larger despite pointwise incomparability; `hsLexStabilization` covers sequences containing this strict comparison.
- The arbitrary functions equal to one for `ℓ≥j` and zero for `ℓ<j` form a strictly lexicographically decreasing sequence. Realizability as Hilbert–Samuel functions is essential: these functions do not even have the required value one at zero.

### 2.9 finiteDegree

Prove `finiteDegree`. Let `D⊆Nⁿ` be upward closed and monotone: moving an entire exponent from coordinate i to a subsequent coordinate j keeps it in D. Its vertices `α_i` and disjoint division regions `Δ_i=α_i+□_i` determine, for any commutative ring A and homogeneous `H_i` of degree |`α_i`|, the degree-ℓ family `P(ℓ)={Y^βH_i:β∈□_i,|β|=ℓ−|α_i|}∪{Y^γ:γ∉D,|γ|=ℓ}`. There is a finite bound `k(D)` such that if `P(k)` spans the degree-k homogeneous module for some `k≥k(D)`, then `P(ℓ)` spans it for every `ℓ≥k`. The bound depends on the finite diagram cells; it is not just max|`α_i`|. Apply this criterion to the homogeneous supported-division blocks used in the proof of `hsSemicoherence`.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Theorem 8.1 and Definition 8.3, p. 274; proof, pp. 274–275; application, p. 282).

For the proof, partition the complement of D into finitely many coordinate cells and prove existence of a threshold from their cutoffs; then induct on the number of coordinates, splitting multiplication byY₁ from the coordinate-zero quotient; then use monotonicity to propagate supported spans above the threshold.

*Needs:* `initialDiagram`, `formalDivision`.

**Checks.**

- `FiniteDegreeChecks.emptyDiagram`: For `D=∅`, the complementary monomials span every homogeneous degree, independently of the `H_i`.
- `FiniteDegreeChecks.unitDiagram`: For `D=Nⁿ` with its single vertex 0, the family is all monomial multiples of the constant `H₁`; spanning in degree zero is equivalent to `H₁` being a unit of A.
- `FiniteDegreeChecks.oneVariable`: For `D=a+N` in one variable and `H₁`=cYᵃ, in each degree `ℓ≥a` the family consists of `cY^ℓ`, which spans exactly when c is a unit.

### 2.10 samuelJetIdeal

Define `samuelJetIdeal`. Given generators `f_i` in regular coordinates and a jet degree k, form `B_k` with rows α of|`α|≤k` and columns(i,β) of|`β|≤k`; its(α,`(i,β)`) entry is`D^(α−β)f_i/(α−β)`! when `β≤α`, otherwise 0. Let `r_k` be its rank at the distinguished point. `I°_S,k` is generated by all(`r_k+1`)-minors of `B_k`; `I_S,k=Σ_{j≤k}I°_S,j`. Its zero locus is the simultaneous lower-rank jet condition determining `H_x(j)≥H_a(j)` for `j≤k`. Changes of ideal generators preserve the resulting ideal, by coefficient-matrix factorization and Cauchy–Binet.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Definition 7.10, Remark 7.11 and (7.12), p. 265; Definition 7.13, p. 266; Remarks 9.1, p. 275).

The API gives `samuelJetIdeal_vanishing`: At a point its vanishing is equivalent to `H_x(j)≥H_a(j)` for every `j≤k`; `samuelJetIdeal_generatorIndependent`: Replacing generators of the same coherent ideal leaves`I_S`,k unchanged; `samuelJetIdeal_monotone`: `I_S`,`k⊆I_S`,`k+1`; all lower-degree rank conditions persist.

*Needs:* `regularCoordinates`, `hilbertSamuel`, Mathlib `Matrix.det`, Mathlib `MvPowerSeries.pderiv`.

**Checks.**

- `jet_zero_ideal`: For the zero ideal `B_k=0` and`I_S`,`k=0`, giving the entire smooth ambient locus.
- `jet_unit_ideal`: For the unit ideal the quotient jet dimension is 0 at every point; the rank bound adds no false singular stratum.
- `jet_double_origin`: For `f=x²(x−1)` at 0 in `A¹_ℚ`, the zero-jet ideal `(f)` also vanishes at 1, where f has order only one. The first-jet ideal `(f,f′)=(x)` excludes 1 and cuts out the order-two locus. For `f=x²` alone, `(x²)` and `(x)` have the same zero locus but different scheme structures.

### 2.11 samuelPresentationIdentity

Prove `samuelPresentationIdentity`. Let `I⊆K[[W,Z]]` with K a characteristic-zero field and `f_i∈I`. Assume all five generator and coordinate conditions of Bierstone–Milman (7.2), with the diagram and degree blocks of (7.1): orders `d_i=|α_i`| at the vertices of an abstract division diagram; supported homogeneous division for every degree block and supported formal division for I; nested essential-variable blocks `Z^ℓ`; the designated derivatives `g_j=D^(α_{i(j)}−e_j)f_{i(j)}` in the corresponding `(Z^ℓ)`, with invertible block Jacobians; and the subsequent-block derivative-vanishing conditions through degree `K≥max_i d_i−1`. These are hypotheses on the generators and coordinates. Write `f_i`=`Σ_γc_iγ(W)Z^γ` in the essential variables. For k≥max `d_i−1`, the ideal generated by the equations of N and `D_W^βc_iγ` with |`γ|<d_i` and|`β|<d_i−|γ`| equals `I_S`,k from the jet matrices, locally at the distinguished point. Consequently the simultaneous coefficient order inequalities cut out the Hilbert–Samuel equality stratum near a. The derivative inequality is strict; derivatives at the mark are not vanishing equations.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), (7.1)–(7.2), pp. 261–262; Definition 7.9, p. 265; Theorem 7.14 and proof, pp. 266–268; coefficient application in the proof of 9.6, p. 282).

For the proof, use the unit derivative Jacobian block to eliminate essential-variable columns; then apply the homogeneous supported division and blockwise determinantal identities to identify the ideals; then the lower derivatives exactly express order≥`d_i−|γ`|; retain the strict derivative bound.

*Needs:* `samuelJetIdeal`, `formalDivision`, `coefficientPresentation`, Mathlib `MvPowerSeries.pderiv`.

**Checks.**

- `SamuelHypothesesChecks.coordinates`: For `I=(x,y)`, the coordinate generators have order one, supported division and identity derivative Jacobian.
- `SamuelHypothesesChecks.purePower`: For `I=(z²)`, the generator has order two and the essential derivative 2z has invertible z-Jacobian in characteristic zero.
- `SamuelHypothesesChecks.wrongOrder`: The generator `x²` of `I=(x²)` cannot be assigned vertex (1) or order one.
- `SamuelHypothesesChecks.abstractDiagram`: For `I=(x+y)` in `Q[[x,y]]`, the abstract diagram generated by (1,0) admits homogeneous and formal supported division with remainder in `Q[[y]]`. The actual graded-lex initial diagram has vertex (0,1), although the complement counts agree. This tests the division hypotheses, rather than all the derivative conditions.

### 2.12 samuelTransform

Prove `samuelTransform`. For generators and coordinates satisfying the hypotheses of `samuelPresentationIdentity` and a smooth coordinate centre C contained in its Samuel stratum, equivalently with centre ideal `I_C` containing the Samuel stratum ideal, Hilbert–Samuel functions of the strict transforms do not increase. Equality at a point upstairs holds exactly when each controlled generator `f_i′` has its original order `d_i`; on that equality locus the transformed generators satisfy the same supported-division and derivative conditions and generate the strict-transform ideal. Coefficients obey`c_iγ′=e^(−(d_i−|γ|))π*c_iγ`. The permitted exceptional tests preserve the presented Hilbert–Samuel stratum by pure pullback.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Theorems 7.20–7.21, pp. 268–269; Corollary 7.24 and proof, pp. 270–271).

For the proof, use supported division to prove that division by the individual generator orders generates the strict transform; then compare the translated homogeneous ideal and the actual chart ideal using finite-jet matrix ranks; specialization cannot lower quotient dimension; then split charts according to the essential and nonessential centre variables. Preserve those generator and coordinate hypotheses in the equality case.

*Needs:* `formalDivision`, `samuelPresentationIdentity`, `controlledTransform`, `samuelJetIdeal`.

### 2.13 semicoherentPresentation

Define `semicoherentPresentation`. A semicoherent presentation of an invariant value λ near a consists of one Zariski neighbourhood V, a smooth submanifold `N⊆V` and finitely many regular weighted coefficient functions with labelled remaining boundary, giving at every point of the λ-stratum the same infinitesimal presentation and compatible admissible transforms. Data must be regular on this common V; a separate formal power-series presentation at each point does not meet the condition.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Definition and remarks 6.4, p. 254; Proposition 6.5, p. 255; 4.14, 4.20 and 4.25, pp. 244,246,248; Theorem 9.6, pp. 278–282).

The API gives `semicoherentPresentation_restrict`: Shrinking the common neighbourhood preserves its regular presentation data; `semicoherentPresentation_stratum`: Its cosupport agrees with the λ-stratum on the chosen neighbourhood; `semicoherentPresentation_transform`: Permissible transformations produce compatible regular presentations on their chart cover.

*Needs:* `markedIdeal`, `testEquivalence`, `regularCoordinates`.

**Checks.**

- `semicoherent_hypersurface`: over ℚ, `(y²−x³,2)` on `A²` has cosupport `{0}`. In the x-chart of the origin blowup its controlled equation is `w²−x`, whose mark-two cosupport is empty.
- `semicoherent_common_open`: on `D(1−x)⊂A¹_ℚ`, the regular pair `(x²/(1−x),2)` has cosupport `{0}`. The controlled transform for the Cartier centre `(x)` is the unit `1/(1−x)`, so its cosupport is empty.
- `semicoherent_nonrational`: for `z²+(x²+1)³` over ℚ at the degree-two closed point `(z,x²+1)`, maximal contact `z=0` gives the nonzero coefficient pair `((x²+1)³,2)`; its cosupport on that line is the degree-two point `(x²+1)`.

Finitely many regular rational-function coefficients are defined on the common intersection of their denominator-unit opens. Unrelated formal series at separate points, without common regular coefficient functions, do not give a semicoherent presentation.

### 2.14 hsSemicoherence

Prove `hsSemicoherence`. For a coherent closed subscheme `X⊆M` in the finite-type characteristic-zero setting, the function `a↦H_X`,a on the closed-point space is Zariski upper semicontinuous and locally takes finitely many values. Every closed a has a semicoherent presentation of its Hilbert–Samuel equality stratum by coefficient pairs(`c_iγ`,`d_i−|γ`|), satisfying the generator and coordinate hypotheses of `samuelPresentationIdentity`, and those presentations have the source’s admissible-transform properties. Generic coordinate changes, coefficient restrictions and supported division are used; formal generators are not assumed to be global regular functions.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Theorem 9.2, p. 276; Theorem 9.6 and proof, pp. 278–282; Remarks 9.15, pp. 282–283; closed-point convention, p. 213).

For the proof, use regular finite-jet determinantal equations and Noetherian stabilization of closed sets for upper semicontinuity. Vertex-prefix well-foundedness gives local finiteness of diagrams; then choose generic characteristic-zero coordinates making the diagram monotone, and construct essential-variable blocks with the invertible derivative Jacobian; then perform supported elimination by Cramer’s rule on finite jets, localize all denominators, and use the finite-degree theorem to extend the homogeneous support conditions to every degree; then identify coefficient-stratum and determinantal ideals by 7.14; shrink to a common neighbourhood and apply the transform theorem.

*Needs:* `semicoherentPresentation`, `samuelPresentationIdentity`, `samuelTransform`, `finiteDegree`, `hsStabilization`.

### 2.15 Derivative ideals

`ResolutionOfSingularities.derivativeIdeal I` in a polynomial ring is I plus the ideal generated by all first partial derivatives of elements of I. Its API `ResolutionOfSingularities.derivativeIdeal.contains`, `ResolutionOfSingularities.derivativeIdeal.zero`, `ResolutionOfSingularities.derivativeIdeal.unit`, `ResolutionOfSingularities.derivativeIdeal.monomial` retains I, handles the zero and unit ideals, and lowers a characteristic-zero monomial order. The finite-variable characteristic-zero theorem `ResolutionOfSingularities.exists_maximalContact` uses its `(d−1)`-st iterate to produce an order-one equation at a point of order `d>0`. The global differential-ideal construction in §2 glues these computations under smooth or étale coordinate changes. (Bierstone–Milman 1997, Proposition 4.12 and Remarks 4.13, p. 244, and the derivative-transform proof, pp. 251–252.)

At rational coordinate points, use §1.10’s localized-order comparisons with the supplied `MvPolynomial.succ_le_orderAt_iff` and `MvPolynomial.le_orderAt_iff_eval_foldl_pderiv`; their additive torsion-freeness hypothesis holds over a characteristic-zero field. The comparison theorem itself applies in positive characteristic, where these derivative criteria need not hold. At other primes use the local/étale argument of §§1.1–2.1.

**Checks.**

- `DerivativeIdealChecks.zero`: the derivative ideal of zero is zero.
- `DerivativeIdealChecks.unit`: the derivative ideal of the unit ideal is the unit ideal.
- `DerivativeIdealChecks.cubic`: over Q, the derivative ideal of `(x³)` is `(x²)`.
- `PolynomialOrderChecks.derivatives`, stated as `ResolutionOfSingularities.idealOrderAt_span_le_iff_eval_foldl_pderiv`: over a characteristic-zero field at a rational coordinate point, the localized principal-ideal order is at least n exactly when every iterated partial derivative of length less than n vanishes; this is the supplied Taylor-order criterion transported by §1.10.
- `MaxContactTests.characteristicTwoCusp`: differentiating `x²+y³` with respect to y in characteristic two gives `y²`.
- `MaxContactTests.characteristicTwoPower`: the derivative ideal of `(x²)` in characteristic two stays `(x²)`, so it supplies no order-one equation.
- `DerivTests.charP`: for every prime p over `𝔽_p`, the derivative ideal of `(x^p)` is `(x^p)`, including `(x³)` over `𝔽₃`. The product rule preserves this ideal when differentiating any of its elements.

### Examples

The pure-power, mixed-coefficient, abstract-diagram and non-rational-residue-field checks above fix the weights, division regions and local-length convention.

### Dependencies

*Needs:* Layer 1; SchemeAndStackFoundations §§0.8, 0.28; Mathlib formal power series, finite length and determinants.

*Lean:* `ResolutionOfSingularities.derivativeIdeal`, `ResolutionOfSingularities.exists_maximalContact` and the zero, unit, cubic, prime-characteristic, cusp homogenization, restricted-coefficient and generic-fibre differential-comparison examples. The jet Check is mirrored by a polynomial derivative-ideal calculation. Samuel presentations and their invariants are README targets.

## Layer 3: exceptional history, invariant transformations and finite sequences

### 3.1 exceptionalHistory

Define `exceptionalHistory`. For a point a on a finite admissible blowup tower, let `a_i` be its ancestors. `E¹(a)` consists of the surviving strict transforms of boundary components present at the earliest year when the current Hilbert–Samuel entry first attained its value. Remove `E¹`. Recursively, Eʳ(a) consists of surviving components of the remaining boundary present at the earliest year when the current prefix through `ν_r` first attained its value. Set `s_r`=card(Eʳ), and remove this old block before computing the next residual order. These blocks are disjoint and their birth years and strict-transform labels are retained; counting all exceptional components is not the definition.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Definitions 6.8 and 6.15, pp. 256,259; Proposition 6.6, pp. 255–256; Example 2.1, pp. 226–228).

The API gives `exceptionalHistory_disjoint`: The old blocks Eʳ are pairwise disjoint subsets of the current boundary; `exceptionalHistory_birth`: Each block is determined by the earliest attained prefix year, not just its current local equations; `exceptionalHistory_stratum`: On a fixed prefix stratum, blocks at nearby points are intersections with the blocks at a.

*Needs:* `sncBoundary`, `hilbertSamuel`, `samuelTransform`.

**Checks.**

- `history_year_zero`: With empty initial boundary all old blocks have cardinality0 in year zero.
- `history_new_exceptional`: When the first invariant entry remains unchanged after the first blowup, the newly born exceptional is not inE¹.
- `history_changes_centre`: The equationv₃²−`v₁v₂²` obtained in year4 ofExample 2.1 has invariant(2,0;0), while the same equation started in year 0 has(2,0;`3/2`,0;1,0;`∞`); their selected centres differ.

### 3.2 invariantWord

Define `invariantWord`. An invariant word has first entry H, a realized Hilbert–Samuel function, followed by `s₁` and finitely many positive rational residual entries `ν_r` with integer counters `s_r`, and terminal`ν_{t+1}∈{0,∞}`. Schedule words lexicographically using §2.7's total lexicographic comparison of H, ordinary counter/rational comparison, and `∞` as the largest terminal residual value. Retain pointwise H comparison for the geometric estimates. In fixed ambient dimension n, depth `t≤n`. For a realized word, the residual entries have bounded denominators on each fixed prefix stratum, as in `invariantProperties`. The bounds arise from the positive marks of a semicoherent presentation, rather than the polynomial-start index of H. For the cusp `H(ℓ)=2ℓ+1` that index is zero, while `ν₂=3/2` has denominator cleared by the order mark two. For hypersurfaces the first entry may be computed as ordinary order through the explicit hypersurface Hilbert–Samuel formula. A scalar multiplicity alone is not the complete invariant.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Remarks 1.3, pp. 213–214; Theorem 1.14, p. 220; 6.15–6.16, pp. 259–260; Remarks 9.15, pp. 282–283).

The API gives `invariantWord_prefix`: Truncation preserves the exact sequence of residual entries and old-boundary counters; `invariantWord_compare`: the first differing entry in the scheduling order controls comparison, including pointwise-incomparable first functions; `invariantWord_terminal`: Terminal0 and `∞` are distinct and `0<∞`; positive entries precede the terminal branch. The scheduling order extends the geometric partial order. (Bierstone–Milman–Temkin, §6.1.)

*Needs:* `hilbertSamuel`, `normalizedOrders`, `exceptionalHistory`.

**Checks.**

- `word_multiplicity_tie`: `(2,0;5/2,0;1,0;∞)` exceeds `(2,0;3/2,1;1,0;∞)` in the hypersurface notation despite equal first multiplicity.
- `word_history_tie`: With the same first and residual entries, the first differing `s_r` changes the order.
- `word_terminal_zero_infinity`: A word ending 0 differs from the identical prefix ending `∞`; neither may be represented by an arbitrary finite rational.

### 3.3 recursiveInvariant

Define `recursiveInvariant` as the unique normalized invariant word of a semicoherent Hilbert–Samuel presentation and its labelled exceptional history. Successive entries are the normalized orders of maximal-contact coefficient presentations after removal of the remaining-boundary monomial and adjoining the old-boundary equations with mark one; terminal values distinguish a monomial residual presentation (0) from a zero coefficient presentation `(∞)`. For a first presentation of codimension r in ambient dimension n and embedding dimension `e=H(1)−1`, the normalization inserts (1,0) exactly `e−(n−r)−1` times when `n−r<e`, then reindexes as in Remark 9.15; for `n−r=e` it retains the first prefix. Existence and uniqueness follow by induction on dimension from coefficient test equivalence and residual normalization. This definition supplies the intrinsic word and its comparison theorems.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Definitions 6.12–6.15, pp. 258–259; Remark 9.15, pp. 282–283).

The API gives `resolutionInvariant_first`: Its first entry is precisely the local Hilbert–Samuel function; `resolutionInvariant_equivalent`: Equivalent initial presentations with the same history produce the same normalized word; `resolutionInvariant_hypersurface`: For hypersurfaces it agrees with the source’s order-first invariant after the hypersurface Hilbert–Samuel identification.

*Needs:* `hsSemicoherence`, `exceptionalHistory`, `invariantWord`, `residualPresentation`.

**Checks.**

- `invariant_smooth_empty_boundary`: For a smooth closed subvariety with empty boundary the word has its smooth Hilbert–Samuel entry with `s₁=0` and terminal `∞`.
- `invariant_cusp`: For `z²+x³` at 0 with empty boundary the hypersurface word is(2,0;`3/2`,0;`∞`).
- `invariant_bm_example`: For `x₃²−x₁²x₂³` at 0 in year 0, the hypersurface word is(2,0;`5/2`,0;1,0;`∞`).

### 3.4 invariantProperties

Prove `invariantProperties`. The recursive word is independent of permitted local presentations and smooth coordinate isomorphisms preserving the labelled history. On the closed-point spaces of every admissible finite tower it is Zariski upper semicontinuous with locally finitely many values for the total scheduling order, does not increase over each centre, and every nonincreasing sequence of realized scheduled values in bounded dimension stabilizes. The geometric pointwise first-entry nonincrease remains part of the assertion. Each equality stratum and boundary are simultaneously unions of coordinate subspaces. At terminal `∞` the stratum is smooth; at terminal 0 every irreducible stratum component Z equals `S∩⋂_{H⊇Z}H`.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Theorem 1.14(1)–(3), p. 220; proof in §§6.15–6.17, pp. 259–260; generalization in §§9.6, 9.15, pp. 278–283; closed-point convention §1, p. 213).

For the proof, recover each finite ratio from test equivalence; coefficient and guarded residual construction preserve the required class; then induct on prefixes using common regular semicoherent data and history-block constancy. Local finiteness transfers the geometric upper semicontinuity to the total scheduling order. Apply the chart order estimate for admissible nonincrease; use `hsLexStabilization` to stabilize the Hilbert–Samuel first entry; recursive denominator bounds and bounded word length then stabilize the subsequent entries; then at the terminal branch use the zero coefficient locus or the common boundary monomial to identify the coordinate-subspace strata. (Bierstone–Milman–Temkin, §6.1(2)–(4).)

*Needs:* `recursiveInvariant`, `ordersInvariant`, `semicoherentPresentation`, `hsLexStabilization`, `samuelTransform`.

### 3.5 monomialData

Define `monomialData`. In a terminal 0 presentation with common mark d, write its boundary monomial `M=Πx_H^(dΩ_H)`, `Ω_H≥0` rational. Cosupport at a point is`Σ_{H through a}Ω_H≥1`. A minimal monomial centre has a boundary subset I with `Σ_IΩ_H≥1` and `Σ_IΩ_H−1<Ω_i` for every `i∈I`. It is the coordinate intersection of those H together with the fixed preceding stratum equations. Let `µ` be the sum of the weights of the boundary components through the current point. Its denominator is bounded by the same terminal mark.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Theorem 1.14(4), p. 220; proof at the end of §6, pp. 259–260; Construction 4.23, p. 247).

The API gives `monomialCentre_minimal`: Minimality is equivalent to removing any one component dropping the sum below1; `monomialWeight_transform`: In the pivot i-chart, the new exceptional weight is`Σ_IΩ−1` and all surviving old weights stay fixed; `monomialMass_denominator`: A fixed common mark bounds denominators of`µ` and transformed weights.

*Needs:* `residualPresentation`, `invariantProperties`.

**Checks.**

- `monomial_two_axes`: Weights(`1/2`,`1/2`) have unique minimal centre{x,y}; the new exceptional weight is 0.
- `monomial_single_axis`: Weight3/2 has minimal one-component centre; its identity blowup changes the weight to `1/2`.
- `monomial_nonminimal`: For weights(1,1), the pair{x,y} is not minimal: either singleton already meets the threshold.

Define `extendedInvariant` on the admissible towers of §3.4. For each irreducible germ Z of the full invariant stratum S(a), label it by `I(Z)={H∈E(a):Z⊆H}`. This includes the old boundary blocks, not just the remaining labels in the terminal monomial presentation. Order these subsets by their 0–1 incidence vectors in increasing birth order, with `0<1`, retaining the original label positions under restriction. Put `J(a)=max{I(Z):Z is a component of S(a)}` and `invᵉ(a)=(inv(a),J(a))`, with the total word order of §3.2. At terminal zero the candidates come from the minimal monomial components together with the preceding stratum equations; at terminal infinity there is a single smooth stratum germ. Prove upper semicontinuity and local finiteness of the refinement. On a nonempty closed unresolved locus that is a union of invariant strata, select the locus of its single greatest extended value; its components form a smooth closed permissible centre. The invariant and component germs commute with open restriction and history-preserving local identifications, including the ambient comparisons of §5.5. If a selected maximum meets an open, its restriction is that open's maximum centre. If it misses the open, its step is empty there; continue until the next surviving maximum. This identifies the ordered restricted towers after deleting empty steps. (Bierstone–Milman 1997, Remarks 1.15–1.16, pp. 220–221; Remark 6.17, pp. 260–261; Bierstone–Milman–Temkin, §§4.3, 6.1.)

**Checks.**

- `CentreSelectionChecks.crossing`: in Example 2.1, year two, `z₃²−z₁³z₂⁴=0` has word `(2,0;0)` at the origin and stratum `V(z₃,z₁)∪V(z₃,z₂)`. With H₁ given by z₁=0 and born before H₂ given by z₂=0, `(1,0)>(0,1)`, so the selected centre is the z₂-axis. The entire two-axis union is singular at the origin and is not a permissible centre. (Bierstone–Milman 1997, Example 2.1, p. 227.)
- `CentreSelectionChecks.unique`: terminal weights `(1/2,1/2)` have only the minimal subset `{H₁,H₂}`; refinement keeps that coordinate intersection rather than introducing a choice.
- `CentreSelectionChecks.restriction`: on `D(z₁)` in the crossing example the H₁-centre is absent, so its restricted blowup step is empty. The surviving H₂ keeps its birth position; subsequent restricted centre selection agrees with the tower on that open.
- `CentreSelectionChecks.incomparableFunctions`: let `C_r=Spec ℚ[x₁,…,x_r]/(x_i x_j : i<j)` and let D be six distinct lines through the origin in `A²_ℚ`. At their origins `H_Cr(ℓ)=1+rℓ` and `H_D(ℓ)=Σ_{b=0}^{min(5,ℓ)}(ℓ−b+1)`. Thus `H_C5(1)=6>5=H_C4(1)>3=H_D(1)`, but `H_D(11)=57>56=H_C5(11)>45=H_C4(11)`. On `X=C₅⊔C₄⊔D` with empty boundary the total schedule first selects only `o₅`; on `U=C₄⊔D` this step is empty and the first surviving centre is `o₄`, followed by `o_D`. Each origin blowup resolves its curve. Selecting all pointwise partial maxima would give `o₅⊔o_D` on X and `o₄⊔o_D` on U, incompatible after deleting only empty steps.

### 3.6 monomialDecrease

Prove `monomialDecrease`. Blowing up a minimal monomial stratum component gives inv′≤inv; if inv′=inv then`µ′<µ`, because the pivot weight`Σ_IΩ−1` is less than every removed pivot weight by minimality. At a selected unresolved terminal `∞` stratum, blowing up the smooth full invariant stratum strictly lowers the complete word at every point over it. Thus the augmented pair (inv,`µ`), not bare multiplicity, strictly decreases over the selected centre.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Theorem 1.14(4), p. 220; proof in §6, pp. 259–260).

For the proof, write the coordinate chart transform of the common boundary monomial; then use minimality to make the new pivot exponent smaller and nonnegative; components that disappear from a chart only decrease mass; then at terminal `∞` use the vanishing coefficient presentation and maximal-contact equations to force a strict invariant drop.

The canonical tower uses the centre selected by `extendedInvariant`; the decrease theorem applies to each selected component.

*Needs:* `monomialData`, `extendedInvariant`, `invariantProperties`, `controlledTransform`.

### 3.7 finitePermissibleResolutionExists

Prove `finitePermissibleResolutionExists`. Let k have characteristic zero and M be a smooth finite-type k-scheme, with empty initial boundary. For a coherent ideal J generically nonzero on every component, there exists a finite tower of blowups with smooth SNC-permissible centres over `V(J)`, whose total transform is invertible with monomial exceptional support and whose weak transform is the unit ideal. For a reduced closed subscheme `X⊆M`, there exists such a finite tower with centres over `Sing(X)`, whose strict transform is smooth and simultaneous-SNC with the exceptional boundary. These towers are isomorphisms over M∖`V(J)` and, on X, over `Reg(X)`, respectively.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Theorem 1.10, pp. 216–217; Theorem 11.14, pp. 290–291; Theorem 13.2, pp. 297–298).

The conclusion is existence of finite ideal and embedded towers as in the cited theorems, with total, weak and strict transforms tracked separately. Choose successive greatest `extendedInvariant` loci in the total scheduling order. The first-entry stabilization is `hsLexStabilization`; after it stabilizes, use the residual denominator bounds and terminal monomial-mass decrease. Abstract open gluing, including comparison under closed smooth ambient enlargements, is proved in §5.5.

*Needs:* `permissibleCentre`, `controlledTransform`, `invariantProperties`, `extendedInvariant`, `monomialDecrease`, `hsSemicoherence`, StableReduction Layer 4, SchemeAndStackFoundations §§0.8, 0.28.

**Checks.**

- `FiniteResolutionChecks.emptyTower`: The unit ideal and a smooth embedded X with empty boundary admit the empty tower.
- `FiniteResolutionChecks.cusp`: The cusp `y²=x³` admits a finite permissible tower with smooth strict transform and SNC exceptional boundary, preserving every point of its smooth locus.
- `FiniteResolutionChecks.zeroComponent`: On `A¹`⊔`A¹`, an ideal zero on one component and unit on the other stays zero on the first component under every such tower and cannot have invertible total transform there; it is excluded by the generic-nonzero hypothesis.

### Examples

The cusp has residual entry `3/2`; the umbrella has a different maximum stratum; two identical equations with different birth histories need not choose the same centre. The terminal monomial mass decreases even when the word remains equal.

### Dependencies

*Needs:* Layers 1–2; SchemeAndStackFoundations §§0.8, 0.28; StableReduction Layer 4.

*Lean:* The global finite-tower and invariant theorems are README targets; the field endpoint is represented by `ResolutionOfSingularities.exists_resolution` in Layer 5.

## Layer 4: residual normalization and the companion route

### 4.1 Residual normalization, companions, homogenization and birth blocks

The intrinsic invariant is determined by marked presentations and their exceptional history. For a coefficient presentation with a common positive integer mark d, write its functions as `h=Dᵈg_h`. Here `D=∏ₕx_H^{μ_H}` has rational exponents, `dμ_H` is integral, and `Dᵈ` is the greatest common factor supported on the **remaining** labelled boundary. Define `residualPresentation` by `ν=min_h ord(g_h)/d`. When `ν>0` its pairs are `(g_h,dν)`, together with `(Dᵈ,d(1−ν))` **only when `ν<1`**. Choose a common mark clearing every denominator before using these pairs. The monomial guard keeps the new residual cosupport inside the original cosupport. Within the preceding invariant stratum, it cuts out the locus where the residual order retains its distinguished value; it need not preserve the entire original cosupport. Omitting it when `0<ν<1` can enlarge the permissible-centre locus. When `ν=0` the residual presentation is `(Dᵈ,d)`, with terminal value zero. When every coefficient is zero the terminal value is `∞`, without taking an order of an empty set of nonzero coefficients. Prove `residualPresentation.normalizedOrder`, `residualPresentation.testComparison`, `residualPresentation.transforms`, `residualPresentation.independent`, `residualPresentation.zeroTerminal` and `residualPresentation.infiniteTerminal`. The comparisons preserve the permitted blowup, product and labelled-exceptional tests, and are asserted at the fixed presentation codimension. (Bierstone–Milman 1997, Construction 4.23 and Proposition 4.24, pp. 247–248; Definitions 6.12–6.15, pp. 258–259.)

For the marked-ideal route, define `boundaryMonomialPart` as the largest divisor factor supported on the ordered SNC boundary, and `nonmonomialPart` by `I=M(I)N(I)`. This factorization is on the smooth ambient variety, for a coherent ideal generically nonzero on every component; it does not use a gcd in an arbitrary ring. Let c be the largest order of `N(I)` on the cosupport of `(I,b)`. If the cosupport is empty there is nothing to resolve. If `c=0`, the open neighbourhood `U=X`∖`V(N(I))` contains the cosupport, `N(I)|_U=O_U` and `I|_U=M(I)|_U`. The monomial marked-ideal resolution on U gives a resolution on X by `monomialRestrictionComparison` below. For `c>0` define `companionIdeal` as the marked sum `(N(I),c)+(M(I),b−c)` when `c<b`, and as `(N(I),c)` when `c≥b`. A marked sum `(J,a)+(K,e)`, for positive a,e, has common mark ae and ideal Jᵉ+Kᵃ; its cosupport is the intersection of the two cosupports on a smooth ambient variety. Thus no zero or negative mark is introduced. Prove `companionIdeal.maximalOrder`, `companionIdeal.cosupport`, `companionIdeal.permissible`, `companionIdeal.transformComparison` and `companionIdeal.orderDropsAfterResolution`. A finite permissible resolution of the companion removes the maximum c-stratum from the original cosupport. The order-drop theorem compares the new nonmonomial factor with the original maximum c; it applies to any tower satisfying the companion-resolution conclusion. This route is kept distinct from the Hilbert–Samuel normalization above. (Włodarczyk, *Simple Hironaka resolution in characteristic zero*, author version dated 27 January 2010, Definition 3.0.10 and Step 2a, p. 19; Step 2b, pp. 19–20; summary §3.1, pp. 20–21.)

The factor API gives `boundaryMonomialPart.factorization` (`I=M(I)N(I)`), `boundaryMonomialPart.maximal` (each labelled exponent is the largest generic divisibility exponent), `boundaryMonomialPart.restrict` (open restriction with surviving labels), `nonmonomialPart.noBoundaryFactor` (no remaining labelled boundary equation divides all residual generators), and `nonmonomialPart.localUnit` (order zero on the cosupport gives its unit neighbourhood). The factorization and these comparisons use invertible boundary ideals, so no global equation or arbitrary-ring gcd is chosen. The companion API above is applied only on the nonempty cosupport and in its positive-c branch.

**Checks.**

- With `I=(x³y²)`, `E={x=0}` and mark four, the factors are `(x³)` and `(y²)`. The positive residual maximum two gives companion ideal `(y⁴,x⁶)`, mark four.
- With the same I and both axes labelled, `M(I)=I` and `N(I)=1`; this is the locally monomial branch, and neither residual order nor companion requires a mark zero.
- With empty boundary, `M(I)=1`, `N(I)=I`. For `(y²−x³)` marked two the companion is its residual ideal marked two; an exceptional factor cannot be extracted just because the function vanishes at the point.

Prove `monomialRestrictionComparison`. For a coherent marked ideal `(I,b)`, `b>0`, on a smooth finite-type characteristic-zero variety X with ordered SNC boundary E, and an open U containing its cosupport, every finite permissible blowup tower on U extends uniquely up to unique isomorphism to a permissible tower on X. At each stage `U_i` is the inverse image of U; the restricted controlled ideals, marks and labelled boundaries agree with the tower on U, and the global cosupport lies in `U_i`. Consequently, empty terminal cosupport on U implies empty terminal cosupport on X. Indeed, each centre is closed in the current cosupport, which is closed in `X_i` and contained in `U_i`, so its immersion into `X_i` has closed image and is a closed immersion. Smoothness, the ideal-power condition and simultaneous SNC are local at that centre. Blowups commute with open restriction, and outside `U_i` every blowup is an isomorphism and the marked ideal retains empty cosupport. This proves the comparison by induction on the tower. For `c=0` above, the restricted ideal is monomial throughout such a tower. The affine statement `ResolutionOfSingularities.MarkedIdeal.residualUnitOnOpen` takes a factorization I=MN and order zero for N along the cosupport, and provides the open `U=Spec R`∖`V(N)`, with `N_𝔭=R_𝔭` and `I_𝔭=M_𝔭` for every 𝔭∈U; this affine assertion holds for every commutative ring. (Włodarczyk, [arXiv math/0401401v1](https://arxiv.org/pdf/math/0401401v1), Definition 2.1.5 and its first remark, p. 4; Definition 3.0.10 and Steps 2a–2b, pp. 20–21; [Stacks 01IQ](https://stacks.math.columbia.edu/tag/01IQ), Lemma 26.10.4; [Stacks 0805](https://stacks.math.columbia.edu/tag/0805), Lemma 31.33.3.)

*Needs:* `permissibleCentre`, `controlledTransform`, `sncBoundary_restrict`, StableReduction Layer 4.

**Checks.**

- `CompanionChecks.locallyMonomial`: on `X=Spec ℚ[x]`, `E={x=0}`, `I=(x²(x−1))` and `b=2`, `M(I)=(x²)`, `N(I)=(x−1)`, the cosupport is `{0}` and `c=0`. On `U=D(x−1)` the residual ideal is the unit ideal and `I|_U=M(I)|_U`. Globally `N(I)≠O_X` and `I≠M(I)`: at `x=1` the order of I is one. This enters the locally monomial branch even though I has a zero outside E; the order of I is at most b everywhere.
- `CompanionChecks.restrictionTower`: for the same ideal and mark, the centre `{0}` is closed and permissible on U and on X. Its Cartier-centre blowup is the identity on the ambient variety and has controlled ideal `(x−1)` with mark two, whose cosupport is empty on X. Its restriction to U is the unit marked ideal, and near `x=1` the marked ideal is unchanged.
- `CompanionChecks.emptyCosupport`: on `Spec ℚ[x]` with `E={x=0}`, `I=(x−1)` and `b=2` have empty cosupport; the empty tower resolves the marked ideal although its residual ideal is nonunit at `x=1`.

Define `MarkedIdeal.homogenize` on the same marked-ideal route. Let `(I,μ)` be a marked ideal on a smooth M over a characteristic-zero field, with ordered SNC boundary E, of maximal order: `ord_a(I)≤μ` at every point a, equivalently D^μ(I)=`O_M` for the iterated derivative ideals of §2.15 glued as in §2. Its tangent ideal is `T(I)=D^(μ−1)(I)`, and its homogenization is `H(I,μ)=(I+D(I)·T(I)+D²(I)·T(I)²+⋯+D^(μ−1)(I)·T(I)^(μ−1), μ)`, with the same mark and the same labelled boundary; for `μ=1` it is `(I,1)`. Prove `homogenize_equiv`: `(I,μ)` and `H(I,μ)` have the same cosupport and the same permissible test sequences of types (i) and (ii) of `testEquivalence`, with equal transformed cosupports along them, and the controlled transform of `H(I,μ)` along such a sequence is, with mark μ, the ideal sum over `0≤i<μ` of the products of the controlled transform of `(Dⁱ(I),μ−i)` with the i-th power of the controlled transform of `(T(I),1)`. Type (iii) tests are not asserted. Prove `homogenize_tangentTransport`: if u,`v∈T(I)` at a cosupport point a each have order exactly one, and each together with the equations of all incident components of E extends to a regular parameter system, there is an automorphism of the completed local ring of M at a that sends u to v, maps every component of E to itself, preserves the completion of `H(I)` and fixes the cosupport pointwise. Prove `homogenize_etaleGluing`: under the same hypotheses there are étale neighbourhoods `φ_u`,`φ_v` of a with `φ_u^*H(I,μ)=φ_v^*H(I,μ)`, `φ_u^*(u)=φ_v^*(v)`, `φ_u^*E=φ_v^*E` and `φ_u=φ_v` on the cosupport; these identities persist along every test sequence of `H(I,μ)`, and the strict transforms of the maximal-contact hypersurfaces `V(u)` and `V(v)` correspond. Smooth pullback commutes with homogenization. Consequently, on this route, the coefficient ideal of `H(I,μ)` on a maximal-contact hypersurface is independent of that hypersurface up to these étale identifications. This is Włodarczyk's mechanism. On the Bierstone–Milman presentation route in Layers 1–2 that independence comes instead from `coefficientEquivalence` and the invariants, and homogenization is not used there; the two routes share only the marked-ideal carrier, the transforms and the test sequences of §1. (Włodarczyk, *Simple Hironaka resolution in characteristic zero*, arXiv math/0401401v1, §2.9, the definition and Lemmas 2.9.1–2.9.5, pp. 9–12; Definitions 2.5.1, 2.7.1 and 2.7.5, pp. 6–7.)

For the proof, in order: `(1) H(I)⊇I`, so test sequences of `H(I,μ)` are test sequences of `(I,μ)`; conversely a test sequence of `(I,μ)` is one for every `(Dⁱ(I),μ−i)` and for `(T(I),1)`, and since `y^(−μ)·σ^*(Dⁱ(I)·T(I)ⁱ)=(y^(−(μ−i))·σ^*Dⁱ(I))·(y^(−1)·σ^*T(I))ⁱ` for an exceptional equation y, the transform formula and the equality of cosupports follow by induction along the sequence; product with a line is a smooth pullback, which commutes with the derivative ideals and hence with H, so type (ii) tests reduce to type (i) on `M×A¹`. (2) For tangent transport choose parameters `u=u_1`,`u_2`,…,`u_n` at a such that v,`u_2`,…,`u_n` are also parameters and the components of E through a are among `u_2`,…,`u_n`, and set `φ(u_1)=v` and `φ(u_i)=u_i` for `i≥2`. With `h=v−u∈T(I)`, Taylor expansion of `f(u_1+h,u_2,…,u_n)` puts `φ^*(f)` in `H(I)` for `f∈I`, and similarly maps each `Dⁱ(I)·T(I)`ⁱ into `H(I)`; so `φ^*` maps `H(I)` into itself, hence onto it by Noetherianity, and its fixed locus `h=0` contains the cosupport, on which h vanishes. (3) For gluing, take the étale maps to `Aⁿ` given by `(u_1,u_2,…,u_n)` and `(v,u_2,…,u_n)` on a neighbourhood of a, their fibre product and its component through a; the two projections agree on `h=0`, tangent transport identifies the pulled-back ideals on completions at every point, and since every test centre lies in the cosupport, both projections lift to every test blowup with the same identities.

*Needs:* `ResolutionOfSingularities.derivativeIdeal`, `testEquivalence`, `controlledTransform`, `companionIdeal`, `sncBoundary`, `regularCoordinates`, StableReduction Layer 4.

**Checks.**

- `HomogenizationTests.zeroDirection`: for `M=A¹_ℚ`, `I=(x²)`, `μ=2`, `a=0` and `E=∅`, `u=x` belongs to `T(I)=(x)` and has order one, but `v=0` has infinite order and is excluded from both transport and étale gluing; no completed-local-ring automorphism sends x to zero.
- `HomogenizationTests.markOne`: `H(I,1)=I`.
- `HomogenizationTests.cuspIdeal`: for `(y²−x³)` with mark 2, `D(I)=(y,x²)=T(I)` and `H((y²−x³),2)=(y²,x³,x²y)`. It differs from I, so homogenization is not the identity at mark two.
- `HomogenizationTests.transverseDirections`: for the cusp `(y²−x³)` with mark 2 and `E={x=0}`, the directions `u=y` and `v=y+x²` of `T(I)=(y,x²)` are transverse to E, and `y↦y+x²`, `x↦x` preserves `H=(y²,x³,x²y)` and E but not I, since its image of `y²−x³` is `y²−x³+2x²y+x⁴`. For `E={y=0}` no order-one element of `T(I)` is transverse to E, and tangent transport is not asserted: it needs transversality to E, not merely hypersurfaces containing the cosupport.

Define `exceptionalBirthBlocks` from the actual tower and the ancestors `a_i` of a point a. The first old block consists of the surviving components present at the earliest year when the current Hilbert–Samuel entry was attained. For the next block use the earliest year when the prefix **including the new residual `ν_r`** was attained, and take components of the remaining boundary at that year. Remove all earlier blocks before this selection. Adjoin each old block's equations with mark one; they enforce its incidence conditions in the next coefficient presentation. The API gives `exceptionalBirthBlocks.firstBlock`, `exceptionalBirthBlocks.nextBlock`, `exceptionalBirthBlocks.disjoint`, `exceptionalBirthBlocks.survivingTransform`, `exceptionalBirthBlocks.samePrefixLocality` and `exceptionalBirthBlocks.resetAtDrop`. The locality theorem follows by induction on the tower, splitting the cases of unchanged prefix, a new drop at the current year, and a prefix drop earlier at a neighbouring point. It is the ingredient that makes the counters `s_r` upper semicontinuous. (Bierstone–Milman, Proposition 6.6 and Definitions 6.8, pp. 255–256; Definition 6.15, p. 259.)

The intrinsic `recursiveInvariant` of §3 retains the Hilbert–Samuel function, all old-boundary counters and terminal value 0 or `∞`. Its normalized word is independent of the chosen smooth embedding. In `invariantProperties`, fixed-prefix denominator bounds come from the presentation marks: if `e₁` bounds the initial positive integer weights, each finite residual value satisfies `e_{r−1}`!`ν_r∈N`, with `e_r`=max{`e_{r−1}`!,`e_{r−1}`!`ν_r`}. These inequalities supply discreteness for the intrinsic stabilization theorem. (Bierstone–Milman, Remarks 1.3, pp. 213–214; Theorem 1.14(2), p. 220; proof, pp. 259–260; Remark 9.15, pp. 282–283.)

At terminal zero put `Ω_H=μ_H` and define `monomialComponents` to be the **minimal** boundary subsets I with `Σ_{H∈I}Ω_H≥1`. Equivalently, `0≤Σ_{H∈I}Ω_H−1<Ω_H` for every `H∈I`. Their coordinate intersections are precisely the irreducible stratum components. Define `monomialMultiplicity` as the sum of the incident `Ω_H`, with denominator bounded by the terminal common mark. On a chart pivoting at `H∈I`, the new pivot exponent is `Σ_{K∈I}Ω_K−1<Ω_H`; every other exponent is unchanged. If the recursive invariant stays fixed, this strictly lowers the auxiliary multiplicity. For a blowup of an unresolved terminal infinity stratum along its whole smooth equality stratum, that stratum has empty strict transform and the recursive invariant drops above the centre. These are `zeroTerminal_decrease` and `infiniteTerminal_decrease`. A claim that the recursive invariant drops after every monomial blowup would be false. (Bierstone–Milman, Theorem 1.14(3)–(4), p. 220, Remarks 1.15–1.16, pp. 220–221, and proof and Remark 6.17, pp. 260–261.)

The minimal-component API is `monomialComponents.mem_iff` (the threshold and every one-component removal inequality), `monomialComponents.stratumComponents` (the corresponding coordinate intersections are exactly the irreducible stratum components) and `monomialComponents.restrict` (discard labels missing the restricted chart). The canonical choice among these components uses `extendedInvariant` of §3.5, with the full component-containment labels and their birth positions. The auxiliary-mass API is `monomialMultiplicity.nonnegative`, `monomialMultiplicity.denominator` (the terminal common mark clears all masses), and `monomialMultiplicity.chartDecrease` (strict decrease when the full invariant stays equal). These use the same terminal presentation and birth labels as §3.5; they are not a second terminal invariant. The following singleton, empty and minimal-pair checks apply to both the component family and its mass.

**Checks.**

- `ResidualChecks.fractional`: common mark `d=4`, coefficient `h=x²y⁴` and remaining boundary `x=0` give `D⁴=x²`, `g=y⁴` and `ν=1`. If `h=x³y`, then `D⁴=x³` and `ν=1/4` and the companion pairs are `(y,1)` and `(x³,3)`. The latter pair cannot be discarded: at a point with x invertible the first pair alone has cosupport `y=0`, whereas the pair `(x³,3)` excludes it.
- `ResidualChecks.strictContainment`: the coefficient pair `((x³y),2)` of `(z²+x³y,2)`, with remaining boundary `x=0`, has cosupport `V(x)`. At the origin `µ=2`, `µ_H=3/2` and `ν=1/2`; the guarded residual pairs `(y,1)` and `(x³,1)` have cosupport `{0}`, a proper subset of `V(x)`. This is the residual-order equality locus inside the preceding stratum.
- `ResidualChecks.zeroInfinity`: `h=x⁴` with mark four has residual `ν=0` and a monomial terminal presentation; zero coefficient ideal has `ν=∞`. The unit ideal has empty cosupport at every positive mark. The zero ideal is handled separately by the generic-nonzero hypothesis of principalization.
- `CompanionChecks.marks`: `I=x³y²`, boundary `x=0` and `b=4` give `c=2` and companion `(y²,2)+(x³,2)`, represented by `(y⁴,x⁶)` with mark four. For `b=2` the companion is only `(y²,2)`; a globally unit residual `N(I)=1` gives `U=X` for the monomial route. No construction asks for a mark `b−c` when `c≥b`.
- `HistoryChecks.empty`: an empty tower with empty boundary has all old blocks empty and all counters zero. Initial boundary components are present in year zero; they enter the first old block, rather than the residual boundary.
- `HistoryChecks.reset`: when a prefix first drops in year two, its new birth block includes the surviving divisors present in that year; a divisor created later is residual. Removing earlier blocks prevents one divisor from contributing to two counters.
- `HistoryChecks.birth`: with two divisors born in years one and two, a first prefix born in year one has old block `{H₁}`, count one; the same current pair of divisors with the prefix first born in year two has old block `{H₁,H₂}`, count two. Counting only the current boundary fails this check.
- `DenominatorChecks.unitMark`: a normalized order-one presentation has initial bound one; its next finite residual values are integers. A residual value one half violates the mark-one integrality bound.
- `DenominatorChecks.cusp`: `H(ℓ)=2ℓ+1` has polynomial-start index zero, but the cusp order presentation has initial weight two and residual value three halves; the presentation factorial clears its denominator.
- `DenominatorChecks.fixedPrefix`: `e₁=2` and `ν₂=3/2` give `e₂=3`. A further entry `ν₃=5/6` has `e₂`!`ν₃=5` and `e₃=6`. An entry `1/3` immediately after `e₁=2` fails the integrality bound. The sequence 1,`1/2`,`1/3`,… cannot be used as a descending chain with that fixed initial mark bound. For the cusp take the presentation bound two even though its Samuel polynomial starts at zero.
- `MonomialComponentChecks.singleton`: for one incident component of weight one, the only minimal subset is that component and the pivot exponent becomes zero, so mass changes from one to zero.
- `MonomialComponentChecks.empty`: no incident boundary gives no subset of sum at least one, mass zero and empty terminal-zero cosupport.
- `MonomialComponentChecks.minimal`: with `Ω=(3/4,3/4)`, the only minimal subset is the pair. Its pivot exponent becomes `1/2`, below `3/4`; the total changes from `3/2` to `5/4`. With `Ω=(1,1/4)`, the singleton containing the first divisor is minimal, and the pair is excluded by minimality. With no incident boundary the terminal-zero cosupport is empty.

### Examples

The locally monomial ideal `x²(x−1)` and the cusp homogenization calculations above test the open-neighbourhood condition and boundary-transverse tangent transport. The birth-block and denominator examples distinguish the tower history from the current equations.

### Dependencies

*Needs:* Layers 1–3; StableReduction Layer 4; SchemeAndStackFoundations §§0.8, 0.28.

*Lean:* `ResolutionOfSingularities.MarkedIdeal.residualUnitOnOpen` and its `x²(x−1)` example. The global factorization, companion, homogenization and history APIs are README targets.

## Layer 5: principalization and preservation of the resolved locus

### 5.1 principalization

Prove `principalization`. For a nonzero coherent ideal J on a smooth finite-type characteristic-zero scheme M, assume J is nonzero at the generic point of every component. There is a finite sequence of smooth SNC-permissible blowups, an isomorphism on M∖`V(J)`, such that the total transformed ideal is invertible and, locally, a unit times a monomial in distinct smooth exceptional-coordinate divisors. Its weak transform is the unit ideal. The assertion starts with empty boundary; the final accumulated exceptional boundary is SNC. An arbitrary prescribed boundary belongs to the smooth-pair cleanup theorem with its separate hypotheses. The hypothesis excluding an identically zero component is essential: the zero ideal cannot become an invertible divisor ideal there.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Theorem 1.10, pp. 216–217; Remark 1.18, p. 225; §6, pp. 254–260).

For the proof, apply the ideal case of `finitePermissibleResolutionExists`, with centres over `V(J)`; track the total ideal as the accumulated exceptional factor times the weak transform; the final weak transform is a unit; the coordinate boundary then gives invertibility and SNC support.

*Needs:* `finitePermissibleResolutionExists`, `controlledTransform`, `recursiveInvariant`, StableReduction Layer 4.

### 5.2 embeddedResolution

Prove `embeddedResolution`. Let X be a reduced finite-type k-scheme, `char(k)=0`, embedded as a closed subscheme of a smooth M, with empty initial boundary. There is a finite `inv_X`-admissible sequence of smooth permissible blowups such that the final strict transform `X′` is smooth and `X′` together with the accumulated exceptional boundaryE′ has simultaneous SNC. The composite is an isomorphism over `Reg(X)`, and all centres lie over the original singular locus. For the source’s nonreduced extension, the exact conclusion is smooth `(X′_red)`, local constancy of`H_{X′,·}`, and simultaneous SNC with `E′`; it does not assert that a nonreduced `X′` is smooth or remains nonempty.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Theorem 11.4, p. 288; Corollary 11.9 and Lemma 11.11, p. 289; Proposition 11.13, p. 290; Theorem 11.14, pp. 290–291).

For the proof, apply the embedded case of `finitePermissibleResolutionExists` to the source’s closed bad locus `Σ_X=Sing(H_X)∪Sing(X_red)`, a union of invariant strata; then clean old boundary blocks on the smooth reduction as prescribed in11.14; then the source’s strict-transform and regular-locus lemmas show all chosen centres lie over `Sing(X)`, hence preserveReg(X).

*Needs:* `finitePermissibleResolutionExists`, `hsSemicoherence`, `controlledTransform`, SchemeAndStackFoundations §§0.8, 0.28.

### 5.3 resolvedLocus

Define `resolvedLocus`. For a smooth strict transform `X⊆M` with an ambient SNC family E whose components do not contain X locally, a point `a∈X` is resolved when X and E admit simultaneous coordinate-subspace/hyperplane equations at a, with distinct incident component germs. For every subset Λ of incident boundary labels, the intersection`X_Λ=X∩⋂_{H∈Λ}H` must be empty locally or smooth of the expected codimension |Λ| in X. The unresolved set Σ* is the union of the rank-defect loci where embedding dimension(`X_Λ`,a)>`dim(X,a)−|Λ`|, including improper/coincident restricted components. It is closed and is exactly the complement of the resolved locus.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Definition of Σ* and subset-intersection criterion, pp. 292–293; Theorem 12.4, Lemma 12.5 and Remarks 12.6, p. 293).

The API gives `resolvedLocus_subsetCriterion`: All boundary-subset intersections have the stated smooth expected codimension exactly at resolved points; `resolvedLocus_open`: The resolved locus is open and Σ* is closed; `resolvedLocus_restrict`: Open restriction preserves both loci.

*Needs:* `sncBoundary`, `regularCoordinates`, SchemeAndStackFoundations §§0.8, 0.28.

**Checks.**

- `resolved_transverse_axes`: `X=M=A²` and two distinct coordinate axes are resolved at 0.
- `resolved_tangency`: X={z=xy} and `E={z=0}` in `A³` are not resolved at 0; onX the divisorxy has an improper two-branch intersection as one restricted component.
- `resolved_empty_boundary`: Every point of smooth X is resolved with empty E.

### 5.4 preserveResolvedPoints

Prove `preserveResolvedPoints`, also called `smoothPairCleanup` in the relative construction. For smooth `X⊆M` and a labelled ambient SNC boundaryE with distinct incident germs, none containing X locally, a finite sequence of permissible centres contained in Σ* makesX and E simultaneous-SNC everywhere and is an isomorphism at every initially resolved point. Applied after the singularity-removal phase of embedded resolution starting with empty boundary, this gives the refinement of Theorem 12.2: the cleanup also avoids every already resolved point. The stronger preservation concerns the pair, not merely `Reg(X)`; pulling back an arbitrary divisor without cleanup does not establish it.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Theorem 12.2, p. 292; Theorem 12.4 and proof, pp. 293–295; Lemmas 12.7–12.8, p. 294; Example 12.9, pp. 295–296).

For the proof, on smooth X factor each restricted boundary ideal `I_i` as its exceptional monomial`D_i` times its proper residual ideal `J_i`. Resolve their product until nonunit`J_i` have order 1 and are distinct; then induct on dimension to resolve each resulting smooth divisor against the others; Lemma 12.7 transfers transversality from the hypersurface subproblem; then apply the strong monomial procedure12.8, with centres among new exceptional intersections, to eliminate common exceptional factors while remaining insideΣ*; then apply this smooth-pair cleanup to the intermediate space in12.1; its centres avoid resolved points of that intermediate pair. The first phase of empty-boundary embedded resolution separately preserves the original regular locus.

*Needs:* `embeddedResolution`, `resolvedLocus`, `principalization`, `monomialDecrease`, `finitePermissibleResolutionExists`.

### 5.5 localIsomorphismResolution

Prove `localIsomorphismResolution`. Every reduced finite-type characteristic-zero k-scheme X has a finite resolution morphism `X′→X`, an isomorphism over `Reg(X)`, obtained from its locally embedded smooth-ambient towers. Any isomorphism `X|U≃Y|V` of open subschemes lifts uniquely to an isomorphism between the restricted resolution spaces; the compatible centres and blowups agree throughout the towers after restricting and omitting empty blowup steps. Embedded pair cleanup may be incorporated. Compatibility with arbitrary smooth morphisms is not part of this assertion. The Lean file states the reduced, separated field milestone without functoriality as `ResolutionOfSingularities.exists_resolution`: a proper surjective morphism from a smooth scheme that is an isomorphism over the entire smooth locus and over a dense open.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Remarks 13.1, p. 296; Theorem 13.2 and proof, pp. 297–298).

For the proof, use local smooth embeddings of affine finite-type charts; then the codimension-normalized invariant, history and birth-order labels agree after ambient isomorphisms and closed smooth ambient enlargements. Synchronize a finite chart cover by the greatest currently present `extendedInvariant` value in the total scheduling order, inserting empty steps on charts missing that value. The centre ideals then agree on overlaps, including at terminal zero. Glue these ideals and their blowups using the ordinary blowup universal property and scheme open gluing. Refining the cover gives the same ordered tower; restriction deletes precisely its empty steps by §3.5. Isomorphisms identify the centre ideals inductively; the blowup lift is unique, so all overlaps satisfy the cocycle.

*Needs:* `recursiveInvariant`, `extendedInvariant`, `invariantProperties`, `finitePermissibleResolutionExists`, `preserveResolvedPoints`, StableReduction Layer 4, SchemeAndStackFoundations §§0.8, 0.28.

### 5.6 Relative embedded resolution with an initial boundary

*Needs:* §§5.2–5.5; Layers 1–4; StableReduction Layer 4; SchemeAndStackFoundations §§0.8, 0.28, 4.17.

State `relativeEmbeddedResolution` for a reduced closed finite-type characteristic-zero subscheme X of a smooth separated ambient scheme M, and a finite ordered SNC divisor E, with no component of E containing a component of X. The output is a finite tower of blowups with smooth centres permissible for the transforms of E; the strict transform `X′` is smooth and simultaneous-SNC with the transformed initial boundary and the accumulated exceptional divisor. The map is an isomorphism on the open locus where X was already smooth and simultaneous-SNC with E. This differs from the boundary-free theorem, whose isomorphism locus is all `Reg(X)`.

Use the embedded finite-tower existence theorem with E as the initial old block and empty initial **remaining** boundary. Contact is applied to normalized invariant presentations, with its transverse-parameter hypotheses. The singularity-removal tower has centres in `Sing(X_j)`, by the Hilbert–Samuel stratum comparison. On the resulting smooth X, apply `smoothPairCleanup`: on smooth X, write the restrictions of the original boundary equations as `I_i=D_iJ_i` with `D_i` supported on new exceptionals. Resolve the product of the `J_i` until its proper factors are distinct of order one, then use induction on `dim X` to arrange their simultaneous transversality. The lifting lemma for `W⊂X⊂M` transports transversality from these smooth hypersurfaces to X. Finally remove the remaining `D_i` factors by the monomial permissible blowup towers, whose centres are intersections of new exceptional components. Every cleanup centre lies in the closed locus where the pair is unresolved. Thus both phases avoid every originally resolved point. (Bierstone–Milman, initial-boundary tower (6.7), p. 256; Remarks 10.3 and singularity-removal proof, pp. 284–285; Theorems 12.2 and 12.4, pp. 292–293, Lemmas 12.5, 12.7–12.8 and proof, pp. 293–295.)

The no-contained-component condition ensures that every restricted original boundary equation is generically nonzero on smooth X; it is needed by the cleanup factorization. In dimension zero this condition means the boundary misses X, and the empty tower suffices. The abstract resolution of a reduced separated finite-type scheme is glued from boundary-free local embeddings using the normalized invariant and local-isomorphism comparison; its output is proper and is an isomorphism on the **entire** smooth locus. No functoriality for arbitrary smooth pullbacks is inferred from the local-isomorphism theorem. Preservation of singular SNC varieties is a different result, with component-preserving functoriality; it is not confused with making `X′` smooth. (Bierstone–Milman 1997, Remarks 13.1 and Theorem 13.2, pp. 296–298; Bierstone–Milman 2011, Definitions 3.3 and Theorem 3.4, pp. 16–17.)

**Checks.**

- `RelativeResolutionChecks.transverse`: `X:y=0` in `A²` with `E:x=0` is already resolved and remains unchanged. `X:y=x²` with the same E is also transverse at the origin: `d(y−x²)`=dy there is independent of dx, and the restricted boundary ideal is `k[x,y]/(y−x²,x)=k`. This pair is resolved, and the preservation theorem leaves the origin unchanged.
- `RelativeResolutionChecks.tangent`: `X:y=x²` with `E:y=0` is tangent at the origin; the restricted boundary ideal gives `k[x]/(x²)`, a double point. X is smooth but the pair is not simultaneously SNC there, so the cleanup may modify the origin. `X:x=y²` with `E:x=0` is the same configuration with the roles of the coordinates exchanged.
- `RelativeResolutionChecks.contained`: `X:x=0` and `E:x=0` have an identically zero restricted boundary equation; this lies outside the stated theorem. For a point outside E the zero-dimensional theorem returns the identity.
- `RelativeResolutionChecks.reduced`: a cusp is singular and is modified, while a disjoint smooth component is retained. The double line `y²=0` is not reduced, and cannot have a smooth strict transform isomorphic on a dense open of that nonreduced scheme.
- `RelativeResolutionChecks.sncVsSmooth`: xy=0 is an SNC divisor but a singular scheme. A resolution preserving its SNC locus leaves it unchanged; the smooth-resolution theorem must separate its branches. These are distinct targets.

### Examples

A transverse smooth pair is unchanged; a tangent pair requires cleanup; a boundary containing a component of X violates the relative theorem’s hypotheses. A generically nonreduced scheme cannot have a smooth birational source preserving a dense open.

### Dependencies

*Needs:* Layers 1–4; SchemeAndStackFoundations §§0.8, 0.28, 4.11, 4.13, 4.17; StableReduction Layer 4.

*Lean:* `ResolutionOfSingularities.exists_resolution` states the reduced separated finite-type field milestone: proper surjective smooth resolution, isomorphism over the entire smooth locus and over a dense open. The projective, boundary and functorial refinements are README targets.

## Layer 6: SNC compactification and Cartier separation

### 6.1 Projective closure

Prove `projectiveClosure`: for a reduced quasi-projective finite-type k-scheme U, with a chosen locally closed immersion in `ℙⁿ_k`, its reduced scheme-theoretic closure Y is projective over k and contains U as a dense open; the immersion of U retains its given scheme structure. The closure meets every component of U and has no additional component disjoint from U. Prove that forming the closure inside an open ambient neighbourhood of U gives the restriction of Y, and identify the ideal of the reduced complement by coherent ideal sheaves. Use the scheme-theoretic closure, noetherianity and the projective-space construction, not a properness-to-projectivity inference. (Stacks, [Definition 01W8](https://stacks.math.columbia.edu/tag/01W8), [Lemma 01WA](https://stacks.math.columbia.edu/tag/01WA), and [Section 01R5](https://stacks.math.columbia.edu/tag/01R5), on scheme-theoretic images.)

*Needs:* Mathlib schemes, projective spectrum and scheme-theoretic image; SchemeAndStackFoundations §0.28; StableReduction Layer 4 for subsequent projective modifications.

**Checks.**

- The usual immersion of `𝔸¹` has reduced closure `ℙ¹` with exactly one missing point.
- For `𝔾_m²` in `ℙ¹×ℙ¹` the reduced complement has four components, rather than the two missing affine axes alone.
- A nonreduced double line is excluded from the reduced-input assertion; reduction of its closure cannot retain its nonreduced open structure.

### 6.2 sncCompactification

Define `sncCompactification`. For a smooth quasi-projective finite-type variety U over a characteristic-zero field k, choose its reduced projective closure Y using `projectiveClosure` of §6.1. Choose the local-isomorphism-compatible finite resolution of Y, preserving `U⊆Reg(Y)`. On the smooth projective result `Y₁`, principalize the coherent ideal of the reduced complement `Y₁`∖U, whose support misses U and contains all exceptional divisors of `Y₁→Y`. The final smooth projective variety `Ū` contains the same U as a dense open, and its complement is a reduced strict-SNC divisor with globally smooth labelled components. Each glued abstract resolving step is the blowup of its globally glued coherent centre ideal, hence is projective by StableReduction Layer 4. The compactification depends on the chosen closure; no universal or canonical choice of closure is asserted.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Theorem 1.10, pp. 216–217; Theorem 11.14, pp. 290–291; Theorem 12.2, p. 292; Theorem 13.2, pp. 297–298; and the deduction of the compactification statement).

The API gives `sncCompactification_open`: The prescribedU embeds openly and densely, and every modification restricts to its identity; `sncCompactification_boundary`: The reduced complement is the support of the transformed boundary ideal, with labelled strict-SNC components; `sncCompactification_projective`: The final structure morphism is projective; it is not deduced from properness alone.

*Needs:* `localIsomorphismResolution`, `principalization`, `preserveResolvedPoints`, `projectiveClosure`, StableReduction Layer 4.

**Checks.**

- `compactify_affine_line`: `A¹` embeds inP¹ with the single smooth boundary point∞.
- `compactify_two_torus`: `G_m`² embeds inP¹×`P¹` with the four coordinate boundary curves, a strict-SNC divisor.
- `compactify_preserves_smooth_open`: A smooth open avoiding the boundary ideal is unchanged even if its chosen projective closure is singular elsewhere.

### 6.3 cartierSeparation

Define `cartierSeparation`. For any scheme X and two effective Cartier divisors `D₁`,`D₂`, set `I=O_X(−D₁)+O_X(−D₂)` and `p:X̃=Bl_I X→X`. Its invertible exceptional ideal defines an effective Cartier divisor F. The residual divisors `D′_i=p*D_i−F` are effective Cartier divisors with disjoint supports and `p*D₁+D′₂=p*D₂+D′₁`. Locally `x_i` generate `D_i`; their degree-one Rees sections `x′_i` generate `O_X`̃(1), obey `x′₁x₂=x′₂x₁` and have no common zero. This statement requires neither characteristic zero nor smoothness, integrality or Noetherianity. The blowup centre is locally generated by two regular elements.

([George Boxer and Vincent Pilloni](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §4.1.10, Proposition-construction 4.1.11 and proof, p. 42; application in 4.1.13, pp. 42–43).

The API gives `cartierSeparation_residual`: `p*D_i=F+D′_i` for `i=1`,2; `cartierSeparation_disjoint`: The residual ideal sum is the unit ideal, equivalently the residual supports are disjoint; `cartierSeparation_difference`: `D′₁−D′₂=p*(D₁−D₂)`, or equivalently `p*D₁+D′₂=p*D₂+D′₁`.

*Needs:* StableReduction Layer 4, SchemeAndStackFoundations §0.28, Mathlib `reesAlgebra`.

**Checks.**

- `separate_coordinate_axes`: For `D₁=(x)`,`D₂=(y)` on `A²`, blowing up `(x,y)` separates the strict transforms of the two axes.
- `separate_equal_divisors`: If `D₁=D₂`, the blowup of their invertible ideal is the identity and both residual divisors are zero.
- `separate_unequal_multiplicities`: On `A¹`, `D₁=2[0]`,`D₂=3[0]`: the identity blowup of `(t²)` gives `D′₁=0`,`D′₂=[0]`, satisfying `2[0]+[0]=3[0]+0`.

### 6.4 SNC coordinate contract

Prove `sncCoordinates`: for smooth X of finite type over a characteristic-zero field and a labelled strict-SNC reduced divisor D, every point has an étale neighbourhood with local boundary equation `t₁⋯t_b=0`, each labelled component given by a distinct `t_i`, and `0≤b≤dim X`. All multiple intersections have the expected codimension, with the labels and transitions supplied by the SNC local-equation API. Over ℂ these charts give local holomorphic coordinates with the same labelled equation by the analytic inverse-function theorem; constructing analytification itself belongs to the consumer. (Bierstone–Milman 1997, §1, p. 213 and Example 3.12, pp. 236–237; SchemeAndStackFoundations §4.17.)

*Needs:* `sncBoundary`; SchemeAndStackFoundations §§0.8, 4.17.

**Checks.**

- With `b=0` the chart is entirely in the smooth open complement.
- On a smooth curve a reduced boundary point has `b=1`, a single parameter equation.
- A cusp boundary and three lines through a point on a surface fail this coordinate criterion.

### Examples

The affine-line and torus compactifications, equal Cartier divisors and unequal multiplicities above distinguish reduced SNC support from the total transformed divisor.

### Dependencies

*Needs:* Layers 1–5; SchemeAndStackFoundations §§0.28, 4.11, 4.17; StableReduction Layer 4; Mathlib Rees algebra and projective spectrum.

*Lean:* Compactification, Cartier separation and SNC coordinate refinements are README targets.

## Layer 7: quasi-excellent schemes and regular functoriality

### 7.0 Scheme regular morphisms

For a scheme morphism `f:Y→X` with locally noetherian fibres, construct the shared predicate `regularMorphism f`: f is flat and each fibre is geometrically regular over its residue field. No finite-presentation hypothesis is imposed. Prove `regularMorphism.affine_iff`: f is regular if and only if, for every pair of affine opens `U⊆Y`, `V⊆X` with `f(U)⊆V`, the section map `O_X(V)→O_Y(U)` satisfies SchemeAndStackFoundations §0.21's `Excellence.RegularAlgebraMap`. Equivalently it suffices to test an affine cover of X and affine covers of its inverse images. Use the supplied geometric-regularity predicate on affine fibre charts. This roadmap owns this scheme construction and comparison, and all regular-morphism assertions here use it. (Stacks, Definition [07R7](https://stacks.math.columbia.edu/tag/07R7) and Lemma [07R8](https://stacks.math.columbia.edu/tag/07R8).)

Prove its open-restriction and isomorphism invariance, identity and composition API, keeping locally noetherian fibres for the composite. Smooth morphisms are regular, and the spectrum map of the maximal-adic completion of a noetherian local G-ring is regular by the supplied ring theorem. (Stacks, Lemmas [07R9](https://stacks.math.columbia.edu/tag/07R9) and [07QI](https://stacks.math.columbia.edu/tag/07QI); SchemeAndStackFoundations §0.21, `regular_map_completion`.)

*Needs:* SchemeAndStackFoundations §0.21; Mathlib scheme flatness, fibres and affine section maps.

**Checks.**

- The identity of any scheme is regular, including the empty scheme; its fibres are spectra of fields and on identical affine charts the comparison is the identity ring map.
- For a field k, `Spec k[[t]]→Spec k[t]_(t)` is regular by the local G-ring completion theorem, although it is not of finite presentation.
- `Spec k[ε]/(ε²)→Spec k` is flat but not regular: its unique fibre has nilpotents and is not geometrically regular. Flatness alone cannot serve as the predicate.

### 7.1 The regular-morphism field input

Define `smoothFunctorialInvariant` for reduced characteristic-zero varieties and their admissible towers. Put `ΛF(ℓ)=Σ_{j=0}^ℓF(j)`. At a closed point x, let d be the dimension of the current variety, q(x) the smallest dimension of an irreducible component through x, and #(x) the number of distinct such dimensions. Replace the Hilbert–Samuel first entry of §3’s construction by `(#(x),Λ^(d−q(x))H_X,x)`, with lexicographic comparison of the pair and of the function values as in the source. Retain the marked-presentation construction of the remaining entries, with histories taken along the newly selected tower. Apply §3.5's `extendedInvariant` construction to this modified word and its current birth labels to select centres. Prove independence of local embeddings, upper semicontinuity, admissibility of the selected maximum centres, finite resolving-sequence existence and compatibility of centre selection with arbitrary smooth morphisms, allowing varying relative dimension. Define FVar to be this modified resolving-sequence functor. The unchanged `recursiveInvariant` specifies the field targets of Layers 1–6; neither equality of the two towers nor equality of their component order is asserted. (Bierstone–Milman–Temkin, §6.3 and Remark 6.2; Bierstone–Milman 1997, Remarks 1.15–1.16, pp. 220–221.)

**Checks.**

- For the cusp C over ℚ, the smooth map `C ⊔ (C×A¹) → C ⊔ C` is identity on the first summand and projection on the second. At singular closed points `H_C(ℓ)=2ℓ+1` and `H_(C×A¹)(ℓ)=(ℓ+1)²`. Upstairs d=2, so the modified first functions agree after summing the cusp function once. Both singular components enter the pulled-back centre. The ordinary maximum-Hilbert–Samuel rule selects only the cylinder upstairs; neither nonempty pulled-back centre can be omitted.
- On a pure-dimensional variety q(x)=d at every closed point and #(x)=1, so the first entry has the original Hilbert–Samuel order. On disjoint components of different dimensions the summation exponents can differ.
- At the meeting of a surface and a curve, #(x)=2, whereas away from their intersection it is one. Counting the number of components, rather than the number of distinct dimensions, would give a different invariant when two surface components meet.

Prove `samuelPresentation_genericFibre`: let `X→T` be dominant between characteristic-zero k-varieties with T integral, let η be its generic point, and let b be a closed point of `X_η`, with image a in X. Locally at a choose a minimal smooth ambient embedding `X↪Z` extending the map to T. There is a common open neighbourhood in Z and a Samuel marked presentation at a whose pullback presents the Samuel stratum at b. For possibly nonclosed a, the function presented is `H^k_X,a=Λ^trdeg_k κ(a) H_(O_X,a)`; this agrees with §2.7 at closed points. The local rings at a and b agree, but these extended functions can differ by summation. Construct the presentation using the compatible initial diagrams, essential-variable blocks and regular coefficient functions of §§2.5–2.14. Combine it with the common-presentation property of §6.3 for the modified first entry. (Bierstone–Milman–Temkin, Proposition 6.3, §§6.1–6.2 and §§6.5–6.6.)

**Checks.**

- For `X=C×A¹_t→A¹_t`, b is the cusp point over `ℚ(t)` and a is the generic point of its singular line. Their raw local function is `2ℓ+1`; the k-extended function at a is `(ℓ+1)²`. The cusp mark-two presentation pulls back to the generic-fibre cusp presentation despite this difference.
- For `T=Spec k` the generic-fibre embedding is the identity and the same Samuel presentation suffices.
- For a smooth projection `A²→A¹`, both Samuel strata are the full smooth spaces, although their closed-point Hilbert–Samuel functions have different dimensions. A zero presentation has full cosupport on both sides.

Prove `fieldResolution_regularPullback`: FVar on finite disjoint unions of reduced characteristic-zero varieties commutes with every regular morphism after omission of empty blowups. Each summand is finite type over its own field, with no irreducibility assumption; no common field is required. Apply affine open gluing for nonseparated schemes. Centres and the final scheme are smooth over the respective fields on each summand, and centres lie above the original singular locus. Synchronize all summands by the total maximum selection for `smoothFunctorialInvariant`, retaining empty steps on summands missing the selected value. Prove independence of the displayed disjoint-union decomposition and restriction to any subunion after deleting empty steps. Compare modified values with the common dimension normalization of §7.1; changing that dimension under restriction applies a common summation shift, which preserves the lexicographic comparisons. The invariant and centre comparison must also handle passage to a generic fibre, extension of the ground field, and localization. Local-isomorphism compatibility from §5.5 alone does not imply this assertion. (Bierstone–Milman–Temkin, *ℚ-universal desingularization*, Theorem 1.1, Theorem 1.2, Corollary 4.6 and Remarks 4.7(2); Temkin 2011v2, §§2.1.14, 2.3.5–2.3.6.)

For the proof, factor a regular morphism of connected affine varieties as a smooth morphism, a generic-fibre embedding and a ground-field extension, as in Bierstone–Milman–Temkin Theorem 1.2. Use `smoothFunctorialInvariant` for the smooth factor and `samuelPresentation_genericFibre` for the passage from variety strata to marked presentations. For a generic-fibre embedding between smooth ambient varieties, prove pullback test equivalence of coefficient marked ideals using Lemmas 5.2 and 5.6. Proposition 5.3 and Theorem 1.3 compare the marked-ideal towers; the Samuel-presentation bridge and modified maximum selection then identify the variety centres, and induction identifies their labelled histories. Absolute differential ideals need not equal the relative differential ideals on the generic fibre (Remark 1.4). The coefficient construction using only normal-direction Taylor derivatives has the separate pullback equality of Remark 5.7. Their §7 approximation argument extends the smooth-functorial ℚ-variety input to the field inputs required by Temkin.

*Needs:* Layers 1–5; SchemeAndStackFoundations §§0.8, 0.15, 0.21; StableReduction Layer 4; Mathlib localization and filtered categories.

**Checks.**

- An extension `k→L` of characteristic-zero fields gives the pulled-back tower, even when L is not finite over k.
- `Spec ℚ ⊔ Spec ℚ(s)` lies in the domain and has the empty tower. It is not finite type over a single field: any such field embeds in ℚ and hence equals ℚ, but the field ℚ(s) is not a finitely generated ℚ-algebra. Singular summands over these two fields use the same synchronized value order, with empty steps retained before restriction.
- For a family over an integral base, a centre disjoint from the generic fibre disappears from the generic-fibre tower; the other centres have the same pullbacks and order.
- `ResolutionOfSingularities.genericFibre_derivativeIdeal`: for `f=x⁴+y⁴+t x²y²` on `Spec ℚ[t,x,y]`, the absolute derivative ideal contains `x²y²=∂ₜf`. Over `ℚ(t)`, the relative ideal `(f,∂ₓf,∂ᵧf)` does not contain `x²y²`: Euler’s identity removes f, and the degree-four multiples of the two cubic derivatives cannot produce it. Equivalent coefficient marked ideals, rather than equal differential ideals, give the centre comparison.
- The normalization of a cusp is not a regular morphism: it is finite birational but not flat at the singular point. There is no assertion that pulling back the cusp’s centres to its normalization gives the normalization’s empty tower.

### 7.2 Local and formal reduction

Use SchemeAndStackFoundations §§4.7–4.8’s `Formal.AdicThickeningSystem` and `Formal.Scheme.formalCompletion` as the common carrier for the formal inputs of `qeLocalFormalReduction`. Here `formalCompletion X Z` means that supplier’s system of closed subschemes `V(I_Z^(n+1))`. Work with systems locally presented as `(Spec A/I^(n+1))_n`, with A noetherian and I-adically complete and separated and I finitely generated. Recover A as the inverse limit of its quotients using Mathlib `AdicCompletion.of_bijective`; restriction is the system of localized quotient rings, with completed section ring `lim_n (A/I^(n+1))_f`. The morphisms used here extend the specified ideals of definition to each other, so they are level-preserving. Replacing an ideal of definition by cofinal powers compares cofinal systems, rather than asserting a level-preserving identity. Rig-regularity, principal formal pairs, the resolution-specific reduction and their regular-pullback API are targets here on this carrier. (Temkin 2008, §3.1; Temkin 2011, §§2.4.1–2.4.4.)

The prerequisites have the following order: special formal excellence; the restricted algebraization and supported-blowup arguments of §7.3; weak resolution; characteristic-zero completion permanence; the general formal API; §§7.4–7.6. The restricted arguments use only completions with reduced closed fibre of finite type over a field and their supported blowups. They do not use completion permanence for an arbitrary quasi-excellent ring.

Prove `specialFormalExcellence`. For a noetherian formal ℚ-scheme whose reduced closed fibre is of finite type over a characteristic-zero field k, every affine formal open has excellent section ring. Locally these are quotients of `k{T₁,…,T_n}[[R₁,…,R_m]]`, with the topology defined by the R variables. Prove this presentation, excellence of these rings and their quotients, and preservation of this class under formal restriction and supported formal blowup. In the locally principal case, a chosen nonzerodivisor t defining the topology gives a presentation topologically of finite type over `k[[t]]`. This is the restricted category needed for weak resolution. (Temkin 2008, Propositions 3.2.1 and 3.2.3, Corollary 3.2.2, using the Valabrega results cited there.)

**Checks.**

- `k[x][[t]]`, completed along `(t)`, is excellent by the special-formal theorem. It is not local: the maximal ideals `(t,x)` and `(t,x−1)` are distinct. Excellence of complete local rings alone does not cover this example.
- `k[[x,y]]` with ideal `(x,y)` is special and excellent, although that ideal is not principal. The principal algebraization theorem still needs its separate hypothesis.
- A completed localization of `k[x][[t]]` at x has levels `k[x,x⁻¹,t]/(t^(n+1))` and remains special. Its section ring is the t-adic completion of the localization, rather than an assertion that ordinary localization is already complete.

Prove `weakQeResolution`. For a noetherian quasi-excellent ℚ-scheme S, every reduced noetherian S-scheme essentially of finite type admits a projective birational modification with regular source. In particular this holds for local schemes and their modifications occurring in the local resolution criterion. No regular-centre or functoriality conclusion is required of this prerequisite. Use the local criterion and noetherian induction to reduce to a modification of a local scheme with singular locus in the fibre over its closed point. That fibre is of finite type over the residue field; make a Cartier divisor containing it and complete along that divisor. The completion is special, so `specialFormalExcellence` supplies its excellence and completed-localization compatibility independently of general completion permanence. Apply the restricted §7.3 algebraization, resolve its field model by Layers 1–6, and algebraize the supported formal modification. The open-ideal extension and induction arguments give the global weak modification; the componentwise extension includes reduced schemes. (Temkin 2008, Proposition 2.3.4, Lemma 2.3.7, Theorem 3.4.1, Corollary 3.4.2 and Theorem 3.4.3.)

**Checks.**

- A regular local ring, including a characteristic-zero field, admits the identity modification.
- The complete local cusp is reduced and excellent and admits a regular-source modification, even though it is not a finite-type algebra over its coefficient field.
- Over a local S, the exceptional fibre of a blowup is of finite type over its residue field; its formal completion is a special input. Completing along an arbitrary closed subset of a general S need not give a formal variety, and is not used in this weak proof.

Prove `adicCompletion_quasiExcellent`. Let A be a noetherian ℚ-algebra, I an ideal, and A complete and separated for the I-adic topology. Then A is quasi-excellent if and only if `A/I` is quasi-excellent. Consequently the I-adic completion of every noetherian quasi-excellent ℚ-algebra is quasi-excellent, as are its completed localizations. This roadmap owns the resolution-dependent proof, using `weakQeResolution` for local schemes essentially of finite type as the weak-resolution input to the Nishimura–Nishimura theorem; it uses no strong functorial theorem of §7.5. Use SchemeAndStackFoundations’ quasi-excellence predicate and quotient/localization permanence. Also prove regularity of `A→Â_I` for a noetherian G-ring A from its geometrically regular formal fibres; together with the permanence theorem this supplies singular-locus comparison in the completed category. (Temkin 2011v2, Theorem 2.1.6, Remark 2.1.7 and Lemma 2.1.5(iii); the completion-permanence source is Nishimura–Nishimura, Theorem B, cited there.)

**Checks.**

- For `A=k[x][[t]]`, `I=(t)`, the quotient `k[x]` is excellent and the theorem gives quasi-excellence of A without a locality hypothesis, agreeing with `specialFormalExcellence`.
- For `I=0` the equivalence is the identity assertion. For a nilpotent I, A is already I-adically complete and quasi-excellence is equivalent to that of its quotient; reducedness is not a hypothesis.
- For a noetherian quasi-excellent ℚ-algebra B, the completed localization of `Â_I` at f has quotient `(B/I)_f`, hence is quasi-excellent by the same theorem. Local G-ring maximal-adic completion alone does not supply this nonlocal assertion.

For a noetherian quasi-excellent formal ℚ-scheme covered by `Spf A`, regularity means regularity of the relevant localizations of A. With `adicCompletion_quasiExcellent`, prove affine-cover independence as in Temkin 2011 §2.4. Define `rigRegular` to mean that the singular locus is supported on the closed fibre, equivalently cut out by an open ideal; this is algebraic rig-regularity, not a choice of analytic generic fibre. Define a `principalFormalPair` to consist of such a formal scheme and a specified invertible ideal of definition, locally generated by one nonzerodivisor. A formal variety has reduced closed fibre of finite type over a characteristic-zero field; the field is not part of its intrinsic isomorphism type. The formal resolution domain consists of finite disjoint unions of rig-regular locally principal formal varieties over possibly different fields, including the empty union. `specialFormalExcellence` and the principal presentations apply componentwise. Regular maps of these pairs preserve the specified ideal by extension. Prove the restriction, completed-localization, change-of-generator and regular-pullback API for these notions. Prove that completion of a quasi-excellent ℚ-scheme along Z has the same singular locus on Z, and that regular maps of schemes inducing the closed-subscheme pullback give regular maps on completions. In the restricted special category these comparisons use `specialFormalExcellence` and regularity of the completion maps; the general statements use `adicCompletion_quasiExcellent`. (Temkin 2008, Lemma 3.1.4, with its quasi-excellent-completion hypothesis, and Corollary 3.1.5; Temkin 2011v2, Lemmas 2.4.4–2.4.5, §§3.1.1–3.1.4 and Theorem 3.1.5.)

Prove `qeLocalFormalReduction`: to resolve a reduced noetherian quasi-excellent ℚ-scheme, reduce by localization and noetherian induction to modifications of local schemes whose remaining singular loci are schemes of finite type over a residue field. Make that bad locus lie in a Cartier divisor Z which is a finite disjoint union of possibly nonreduced finite-type schemes over residue fields; `Z_red` is a finite disjoint union of reduced varieties. Retain the specified invertible ideal `I_Z`, including its multiplicities, in the principal formal pair and its levels `V(I_Z^(n+1))`. The completion along Z is then an object of the enlarged formal domain: it splits as a finite disjoint union of rig-regular locally principal formal varieties over those residue fields. Resolving it by a synchronized tower of closed-fibre-supported formal blowups and algebraizing the centres resolves the scheme near the selected bad locus. State both the existence reduction of Temkin 2008, Proposition 2.3.4 and Theorem 3.4.3, and the functorial codimension induction of Temkin 2011, §4.3, with the small-singular-locus pairs of §3.4.2; that paper's §2.1.1 permits nonreduced finite-type schemes as varieties. The latter construction modifies and resolves centres as well as the ambient scheme, so that regularity and naturality survive patching. A naive extension of a smooth centre from a local scheme can become singular at its specializations and is insufficient.

The intended signatures are rig-regularity on the locally noetherian affine-chart systems above, locally principal formal pairs with ideal-preserving regular maps, and reduction from resolving these pairs to resolving reduced noetherian quasi-excellent ℚ-schemes. Use the supplier’s quotient-scheme sheaves, transition maps and open gluing. Construct the supported completed blowup towers and their chart comparisons in §§7.3–7.4 by completing ordinary blowups and retaining the specified ideal of definition; blowing up each quotient independently is not the formal blowup construction. The restriction, change-of-generator and regular-pullback comparisons are asserted for this same system carrier.

*Needs:* SchemeAndStackFoundations §§0.15, 0.21, 0.28, 4.7–4.8, 4.11; StableReduction Layer 4; Layer 1 order and ideal-transform conventions.

**Checks.**

- Completion of `Spec k[x]` along `(x)` has ring `k[[x]]` and levels `k[x]/(x^(n+1))`; replacing `(x)` by `(x²)` gives the same formal topology through a cofinal subsequence.
- `FormalReductionChecks.nonreducedCartierFibre`: blowing up `Spec k[u²,u³]` at `(u²,u³)` gives `Spec k[u]`; the u²-chart has ring `k[u²,u³,u³/u²]=k[u]`, and the u³-chart is its open `D(u)`. The pulled-back centre ideal is `(u²)`, so its Cartier fibre is `Spec k[u]/(u²)`, with reduced fibre `Spec k`. Its levels are `k[u]/(u^(2(n+1)))`; replacing the ideal by `(u)` changes the specified pair and its levels, even though the formal topology is the same.
- The completion of the cusp at its singular point is rig-regular: its punctured spectrum is regular. Completion of a family singular along a direction not contained in the chosen closed fibre is not rig-regular for that ideal of definition.
- `Spf k[[t]]`, with ideal `(t)`, is a principal formal pair. The maximal ideal `(x,y)` in `k[[x,y]]` is an ideal of definition but is not locally principal; it does not satisfy the principal-pair hypothesis.
- `Spf ℚ[[t]] ⊔ Spf ℚ(s)[[u]]`, with ideals `(t)` and `(u)`, belongs to the formal domain although its reduced closed fibre is not finite type over one field. Completion of `Spec ℚ[t] ⊔ Spec ℚ(s)[u]` along these ideals gives exactly this object, and each subunion recovers its restricted tower after omission of empty steps.
- `t` and `ut`, for a unit u, give the same invertible ideal and closed fibre; a generator change must not change the intrinsic completed resolution.
- A smooth scheme has no bad locus: reduction returns the empty sequence. It cannot introduce centres in its regular locus merely to choose a Cartier divisor.
- On two affine opens with common singular point, the reduction must yield the same restricted centres by naturality. Arbitrary unrelated formal resolutions cannot be glued into the functorial theorem.

### 7.3 Algebraization and supported centres

Prove `rigRegularAlgebraization`: let k be a characteristic-zero field, let `S=Spf k[[t]]`, and let 𝔛 be an affine formal S-scheme topologically of finite type, with t a nonzerodivisor defining its topology. If 𝔛 is rig-regular, it is rig-smooth over S and admits an algebraization of finite type over `k[t]`, after the henselian and étale descent of the algebraization. More generally retain the precise statement of Temkin 2008, Proposition 3.3.1: for a complete discretely valued K of characteristic zero, a dense subfield L, `O=L∩K°`, and affine rig-regular 𝔛 topologically of finite type over `Spf K°`, 𝔛 is the completion of a finite-type O-scheme along its closed fibre. The auxiliary field, parameter and algebraization are choices; independence of the resulting resolution is §7.4. (Temkin 2008, Proposition 3.3.1, Proposition 3.3.2 and its Jacobian criterion, pp. 19–21; Temkin 2011, Remark 3.1.4 and Theorem 3.1.5.)

For the proof, establish the characteristic-zero equivalence of rig-regularity and rig-smoothness in this principal finite-type setting; a Jacobian ideal contains a power of the ideal of definition. Apply Elkik’s algebraization theorem for rig-smooth finite-type affine formal schemes over a complete principal base. Descend the finite algebra presentation from the henselization to an étale neighbourhood and then to a finite-type O-model. Prove the completion comparison on quotients and all completed affine overlaps. This is Elkik’s smooth-outside-the-closed-fibre algebraization, not Grothendieck existence for proper schemes and not algebraization of an arbitrary formal scheme or arbitrary formal divisor. (Elkik, [*Solutions d’équations à coefficients dans un anneau hensélien*](https://www.numdam.org/item/ASENS_1973_4_6_4_553_0/), Annales scientifiques de l’École Normale Supérieure, 4e série, 6(4) (1973), 553–603, §III, Theorem 7, p. 582; Temkin 2008, §3.3.)

Prove `supportedFormalTower_algebraizes`: for a noetherian quasi-excellent scheme X, a closed subscheme Z and `𝔛=formalCompletion X Z`, every finite blowup sequence of 𝔛 with centres supported on its closed fibre algebraizes uniquely, up to the isomorphism of marked blowup sequences, to a Z-supported sequence on X. Its completion is the prescribed sequence. If `Sing(X)⊆Z`, regularity of all formal centres and of the final formal source gives regularity of the algebraic centres and of the final algebraic source, which is already regular away from Z. An open centre ideal contains a power of the definition ideal and is defined on a finite thickening of Z; this proves the centre-algebraization step without an unrestricted formal existence theorem. Blowup commutes with completion and gives the induction over the tower. (Temkin 2008, Lemmas 2.1.7–2.1.9 and Corollary 3.4.2; Temkin 2011, Lemma 2.4.3.)

For the weak-resolution prerequisite of §7.2, first establish these algebraization and supported-blowup statements only when the completion is special: its excellence comes from `specialFormalExcellence`, and formal-centre extension uses the finite thickenings. Apply the field existence theorems without an independence or regular-functoriality requirement. The general characteristic-zero supported-tower comparison uses `adicCompletion_quasiExcellent` after weak resolution is established. Thus neither the weak proof nor completion permanence depends on §7.4’s independence theorem or §7.5’s strong resolution.

The intended outputs are an algebraic model with an isomorphism of its completion to 𝔛, and an algebraization equivalence for closed-fibre-supported marked blowup sequences. Prove the model’s quotient comparisons, the induced blowup-completion isomorphisms, preservation of supports, and naturality for regular maps preserving the closed fibre.

*Needs:* §7.2; SchemeAndStackFoundations §§0.12–0.15, 0.21, 0.28, 4.7–4.8; StableReduction Layer 4; Layers 1–5 for resolving the algebraic model.

**Checks.**

- `Spf k[[t]]⟨x⟩` is the t-adic completion of `Spec k[t,x]`; the target must recover its quotients `k[t,x]/(t^(n+1))`.
- For a centre ideal containing `t^N`, its image on `X_{N−1}` determines the open formal ideal and its algebraic extension. Distinct arbitrary non-open ideals need not have this extension property.
- Completing `Spec k[t,x,y]` along t leaves a singular scheme `xy=0` singular off the closed fibre; the rig-regular hypothesis fails, and this argument cannot invoke smoothness of its generic fibre.
- A formal divisor chosen independently of the rig-smooth formal ambient model need not algebraize with that model. Pair principalization in §7.7 uses the separate strict-transform argument rather than inferring pair algebraization here.
- The empty supported tower algebraizes to the identity. A nonempty Cartier centre retains its marked step even when the algebraic blowup is an isomorphism.

### 7.4 Independence from the algebraization and approximation

Define an `ElkikPair` over a characteristic-zero field k as an affine finite-type k-scheme X with a principal invertible ideal I and `Sing(X)⊆V(I)`. Maps of pairs preserve the ideal by extension. After shrinking away from `V(I)`, the morphism to `𝔸¹_k` given by a generator of I is smooth off that fibre. Its conductor is a finite integer r with `I^r⊆H`, where H is an Elkik singular ideal controlling the lifting theorem; with the intrinsic Gabber–Ramero ideal one can take the least such r and then minimize over generators as in the source. Prove the ideal’s nonsmooth support and the conductor’s base-change bound, invariance under generator choice in its minimized version, and compatibility with smooth extension. The finite-type obstruction ideal and lifting statement used here are targets of this roadmap. They can be constructed from a polynomial presentation’s conormal sequence and its square-zero lifting obstructions; no cotangent-complex roadmap is a supplier. (Temkin 2011, §§3.2.1–3.2.6 and §§3.3.1–3.3.3.)

Prove `elkikLifting`: for Elkik pairs `(X,I)`, `(Y,J)` over the same k and conductor r for `(X,I)`, if `n>r` and a smooth k-morphism of their n-th fibre pairs extends to a smooth k-morphism of their `(n+r)`-th fibre pairs, then it lifts to a henselian-smooth k-morphism of their henselized pairs. All these maps preserve the specified ideals by extension. Retain the source convention `X_n=V(I^n)` or reindex every fibre and bound consistently. If the fibre map is a k-isomorphism then the lift is a k-isomorphism; in particular the henselized pair is determined up to k-isomorphism by a sufficiently thick fibre, with bound `m>2r` as in Temkin 2011, Proposition 3.3.1. Use Elkik’s approximation/lifting theorem or the Gabber–Ramero version cited there, keeping its ideal-of-definition and conductor hypotheses. This is existence of a compatible lift, not uniqueness of every lifting of a finite jet. Maps over different fields, or smooth maps not linear over the displayed k, use `thickFibre_resolutionComparison` instead (Temkin 2011, §3.3.8).

Prove `thickFibre_resolutionComparison`: let FVar be the regular-functorial field algorithm from §7.1. For two Elkik pairs, possibly over different characteristic-zero fields, and n sufficiently large depending on the pairs, a regular morphism between their sufficiently thick fibres identifies the restrictions of their resolving towers to thinner fibres, including centre subschemes and the omission of empty steps. The conductor loss and successive losses along the finite tower are retained. In the notation of Temkin 2011, Proposition 3.3.5, there is an r depending on the target pair such that a regular map of `(n²+r)`-th fibres gives compatible n-th tower restrictions for all sufficiently large n. Consequently the completed tower depends only on the intrinsic formal pair, independently of its algebraization, field of definition and parameter generator. It glues to the unique formal desingularization functor on finite disjoint unions of rig-regular locally principal formal varieties compatible with FVar. Use FVar on the disjoint union of algebraic models to synchronize their towers, rather than an arbitrary interleaving of separate towers. Prove independence of that presentation, restriction to each subunion after deleting empty steps and identity and composition coherence for regular ideal-preserving maps. (Temkin 2011v2, §§2.3.5–2.3.6, Lemma 3.3.4, Proposition 3.3.5, Theorem 3.1.5 and its proof in §3.4.1.)

For the proof, recover the henselized models from thick fibres with controlled loss and compare the field towers using regular functoriality. For pairs over different fields, descend finite data to ℚ-varieties with smooth transition maps using Bierstone–Milman–Temkin §7, then descend the given finite-stage map to a smooth map on a neighbourhood of its image. SchemeAndStackFoundations §0.15 supplies Néron–Popescu for the noetherian regular maps occurring here, particularly local G-ring completion maps, and §0.21 verifies their regularity. Finite presentation makes a finite list of centres and equations descend to a finite smooth stage; one must prove compatibility of these descents, not select a stage independently for every point. Popescu supplies smooth approximation, while Elkik supplies the formal algebraization and thick-fibre lifting. Neither implies that every quasi-excellent scheme is itself of finite type over a field.

*Needs:* §§7.1–7.3; SchemeAndStackFoundations §§0.9, 0.12–0.15, 0.21; StableReduction Layer 4.

**Checks.**

- A smooth affine pair with ideal `(t)` has no singular support and an empty tower; any two algebraizations of its formal completion give that same empty tower.
- `(Spec k[t,x,y]/(xy−t), (t))` has a nonzerodivisor t and regular total space; it is an Elkik pair. The generic fibre is smooth and the conductor is finite. Replacing `(t)` by a noninvertible maximal ideal is outside the pair’s hypotheses.
- For `(Spec k[x,y,z]/(xy), (z))` the singular locus contains points with z invertible. No power of z lies in an ideal cutting out that nonsmooth locus, so the required finite conductor does not exist.
- Replacing a parameter by a unit multiple preserves I and the completed resolving tower; changing the abstract field of definition while retaining the same formal pair must do the same.
- A first-order fibre alone need not determine a singularity or a tower. `xy=t²` and `xy=t³` have the same fibre at t=0 but different higher thickenings; the theorem requires a thickness exceeding the conductor-dependent bounds.
- For `k=ℚ(s)`, the automorphism `s↦s+1` of the coefficient field induces a smooth map of the pair `(Spec k[t],(t))` as an abstract scheme, preserving `(t)`, but is not a k-morphism. It is outside `elkikLifting` and is covered by the regular-map comparison.
- For a characteristic-zero complete noetherian local G-ring A, `A→Â` is regular and the Popescu input applies. The normalization map of a cusp is not regular, so no smooth-colimit or pullback assertion is made for it.

### 7.5 Strong non-embedded resolution

Prove `qeResolution`: for every reduced noetherian quasi-excellent ℚ-scheme X there is a finite sequence of blowups in closed regular centres, all disjoint from the inverse image of `Reg(X)`, whose composite `π:X′→X` is projective and birational component by component and whose source X′ is regular. The restriction over the **entire** regular locus is an isomorphism. Properness and surjectivity follow; no component is discarded. No embedding in a regular scheme, finite-type hypothesis over ℚ, separatedness or finite-dimensionality hypothesis is imposed. The regular-centre conclusion is the meaning of “strong” here; it does not require centres in maximal Hilbert–Samuel strata. (Temkin 2011, Theorem 1.2.1(i)–(iii), §§1.3.1–1.3.3 and §4.3; the existence reduction is also Temkin 2008, Theorem 3.4.3.)

For the proof, resolve the small-singular-locus pairs by §§7.2–7.4: complete along their chosen Cartier divisor, algebraize the rig-regular principal formal variety, apply the field algorithm, use thick-fibre independence, and algebraize the supported regular centres. Then carry out Temkin’s induction on codimension, inserting resolutions of bad centres and of the ambient scheme while preserving the previously resolved open. Regular-morphism locality and noetherian quasi-compactness give a finite sequence on X, even when there is no global bound on its Krull dimension. Projectivity is obtained from the actual composite of blowups, not from the mere existence of a proper birational morphism. Reducedness makes `Reg(X)` dense in every component, so the projective morphism is a modification and is surjective. This proof uses the field case as its algebraization-model input, rather than assuming a new resolution theorem from a supplier.

*Needs:* §§7.1–7.4; SchemeAndStackFoundations §§0.15, 0.21, 0.28, 4.11, 4.13; StableReduction Layer 4.

**Checks.**

- For regular X, including the empty scheme and a spectrum of a characteristic-zero field, the empty tower gives the identity.
- A reduced nodal curve with two components has two regular branches in its resolved source and neither component disappears. A theorem restricted to integral X would fail to provide this case.
- `Spec k[[x,y]]/(y²−x³)` is complete, excellent, reduced and not required to be finite type over k; it admits a regular projective resolution preserving its punctured regular locus.
- `Spec k[ε]/(ε²)` is excellent but nonreduced. A regular source cannot be isomorphic on a dense open of this one-point scheme, so it is excluded from the birational assertion.

### 7.6 Functoriality for all regular morphisms

Prove `qeResolution_regularFunctorial`: choose the strong resolving sequence F(X) in §7.5 for every reduced noetherian quasi-excellent ℚ-scheme. For every regular morphism `f:Y→X` between these schemes, F(Y) is the base change `F(X)×_X Y` after exactly its empty blowup steps are omitted. This is an isomorphism of sequences with centre ideals, with identity and composition coherence; its last stage gives a cartesian square of the resolved schemes. Regular morphisms need not be of finite type, surjective, or over a common larger ground field. A nonempty Cartier centre remains a marked step. (Temkin 2011, Theorem 1.2.1(iv), §§1.3.1–1.3.2, Theorem 3.4.1 and §4.3.)

Use regular functoriality of the field input, finite-thickening independence and regularity of maps on completions to make the small-singular-locus algorithm natural. Temkin’s insertion and codimension induction then preserve the comparison with all regular maps. Universal properties of blowups give the unique marked lifts and their cocycle equations. The resulting general functor need not coincide on varieties with the original FVar, although FVar is used to construct it. Prove the restriction-to-opens, étale, smooth, localization and completion comparison corollaries. The last applies to `Spec Â→Spec A` for a noetherian local quasi-excellent A, which is regular by its G-ring property.

*Needs:* §7.5 and the naturality assertions of §§7.1–7.4; SchemeAndStackFoundations §§0.15, 0.21; StableReduction Layer 4.

**Checks.**

- On an open subset missing a selected centre, its corresponding pulled-back step is empty and is removed. Steps with nonempty centres remain in order.
- Smooth products and arbitrary characteristic-zero field extensions commute with the final resolved space. The change in the local Hilbert–Samuel function caused by added smooth variables cannot be used to disprove this tower comparison.
- Completion of the local cusp pulls back its algebraic resolving tower; this tests a regular morphism outside the finite-presentation case.
- For a chain `Z→Y→X` of regular maps, deleting empty steps in two stages produces the same sequence and comparison as deleting them after composite pullback.
- A closed immersion into the singular locus is generally not regular as a morphism, even if its source is a regular scheme. Such a map has no functorial pullback assertion.

### 7.7 Quasi-excellent embedded principalization and SNC support

Prove `qePairPrincipalization`: let X be a reduced noetherian quasi-excellent ℚ-scheme and J a coherent ideal nonzero at the generic point of every component. There exists a projective birational modification `π:X′→X` with X′ regular and `J·O_X′` invertible, locally generated by a monomial in a regular system of parameters. Arrange that its **reduced support**, together with the exceptional support, is strict normal crossings. The map can preserve every point where X is regular and the ideal already defines a strictly monomial divisor with no self-intersection of its irreducible components, and preserves `Reg(X)∖V(J)`. No claim that its general centres are regular, or that this pair construction is functorial for all regular morphisms, is deduced from the two cited Temkin papers. These extra field conclusions remain separate targets in §§3.7, 5.1–5.6. (Temkin 2008, Theorem 1.1(iii), Definitions 2.2.1–2.2.3, Proposition 4.2.1, Lemma 4.2.4 and proof of Theorem 1.1 in §4.3; extension from integral to reduced schemes is Lemma 2.3.7.)

Here the strictly monomial locus means the source’s semi-strict preservation locus: regular ambient scheme, local parameter monomial for the divisor, and no self-intersection of its global irreducible components. “Monomial” allows positive multiplicities; the invertible total ideal is not asserted to be a radical ideal. Include arbitrary reduced X rather than assuming X regular; the open preserved is accordingly smaller than `X∖V(J)` when X is singular there. For regular X it contains `X∖V(J)`. A composite of blowups is projective; the normal-crossings-to-strict-normal-crossings step is the supplier’s §4.17 `nc_to_snc`, applied to reduced support and labelled strict transforms.

For the proof, use the pair version of Temkin’s local reduction, the local/formal desingularization of §7.3, and his separate regularization and principalization of strict transforms. Pair algebraization is not assumed. First principalize and regularize the appropriate strict transforms as in Temkin 2008 §§4.1–4.2, then monomialize the remaining total ideal using the formal result and induction. Track the semi-strict open at every extension and strictification. To include the exceptional support explicitly, retain a closed boundary containing the exceptional loci after preliminary modification, and apply the same pair monomialization to the product with the transformed ideal; on the final regular scheme a product of nonzero ideals that is invertible makes each factor invertible, and each factor’s support is a subset of the resulting SNC support. Preserve the prescribed strictly monomial open by choosing this additional boundary away from it. This is an existence and support theorem, with its own proof, not a consequence of the bare regular-source theorem.

State `qeEmbeddedStrictTransform` as a separate companion in the source-supported form: for a reduced closed Z in a noetherian quasi-excellent ℚ-scheme X, with Z nowhere dense in every component of X, one can make X′ regular and its total inverse image of Z a monomial Cartier divisor, with strict-SNC reduced support, preserving the semi-strict pair locus. A literal strict transform of Z along a blowup supported on Z may be empty; it is not the strict transform of an embedded resolution preserving the whole `Reg(Z)`. The full smooth strict-transform and relative resolved-pair assertions, with centres avoiding `Reg(Z)` or the initially resolved pair, are the field targets in Layer 5. The 2011 non-embedded paper supplies no boundary theorem; its introduction explicitly assigns that problem to a separate work.

*Needs:* §§7.2–7.5; Layers 1–6 for the field input; SchemeAndStackFoundations §§0.21, 0.28, 4.11, 4.13, 4.17; StableReduction Layer 4.

**Checks.**

- On a regular scheme the unit ideal has empty support and admits the identity; on a singular scheme the unit ideal still requires a regular-source modification, so the preservation condition cannot be all of `X∖V(J)`.
- On `Spec k[[x,y]]`, the ideal `(x²y³)` is already strictly monomial; the identity preserves it with its multiplicities. Its reduced support is `xy=0`, not `x²y³=0` as a reduced divisor.
- An irreducible nodal divisor has normal crossings locally but a self-intersecting global component; semi-strict preservation allows its node to be modified to obtain globally regular labelled components.
- An ideal vanishing identically on one connected component cannot become invertible there. The generic-nonzero hypothesis excludes it even if the ideal is globally nonzero.
- Blowing up the full ideal of a closed centre can make its strict transform empty while its total transform is a nonempty exceptional divisor. This distinguishes pair principalization from the embedded strict-transform theorem in §5.2.

### 7.8 Field and affinoid specializations

Prove `resolution_field`: every reduced finite-type scheme over any characteristic-zero field k has a projective birational regular resolution preserving `Reg(X)`, and the source is smooth over k. Include the nonseparated case by the natural affine gluing of §7.6. The choice F(X) is functorial for regular morphisms, while the explicit field tower, embedded theorems and all invariant computations of Layers 1–6 remain the Bierstone–Milman proof route. For a separated finite-type X the suggested Lean milestone `ResolutionOfSingularities.exists_resolution` records properness, surjectivity, smoothness and the isomorphism over the entire smooth locus and over a dense open; the README also requires projectivity and the general theorem. (Bierstone–Milman 1997, Theorems 11.14 and 13.2; Bierstone–Milman–Temkin, Theorem 1.1; Temkin 2011, Theorem 1.2.1.)

Prove `resolution_affinoid`: for a complete nonarchimedean field K of characteristic zero and a reduced K-affinoid algebra A, `Spec A` has a projective birational modification with regular source, isomorphic over its entire regular locus; the same holds for every reduced finite-type scheme over A. Use exactly RigidAnalyticGeometry §§1.1–1.2’s noetherianity and excellence of affinoid algebras, SchemeAndStackFoundations §0.21’s finite-type permanence and §7.5. The assertion is about algebraic schemes over A; A need not be finitely generated as an ordinary K-algebra. Analytification, smoothness of the analytified resolution and proper-surjective analytic comparison are consumer contracts, not hypotheses used in this proof. For `K⊇ℚ_p` this gives the exact projective modification required by DiamondsAndVStacks D6.9. (Temkin 2011, Theorem 1.2.1 and §5.2; RigidAnalyticGeometry §1.2, excellence theorem, citing Conrad §1.1.)

*Needs:* §§7.5–7.7; SchemeAndStackFoundations §§0.21, 4.13; RigidAnalyticGeometry §§1.1–1.2.

**Checks.**

- A smooth affine space over k and a smooth affinoid with A regular admit the identity resolution. The latter is not derived by treating its Tate series as polynomials of finite degree.
- For `A=K⟨u,v⟩/(uv)`, the two regular branches survive in the resolution; `Spec A` is not integral and requires the reduced theorem.
- For `A=K⟨x,y⟩/(y²−x³)`, the singular closed point is modified and every regular point is preserved. The same conclusion holds for its local completion by regular functoriality.
- `K⟨ε⟩/(ε²)` is an excellent affinoid algebra but fails reducedness; no smooth or regular birational resolution preserving a dense open is asserted for it.
- A perfectoid algebra such as `K⟨T^(1/p^∞)⟩` is not a noetherian K-affinoid algebra of finite type in the classical sense; affinoid excellence here does not apply to it.

### Examples

The complete local cusp, the two-branch affinoid node, parameter change and completion pullback checks distinguish the quasi-excellent theorem from a finite-type field assertion. Normal crossings with a self-intersecting component and a monomial with multiplicities distinguish the pair theorem’s preservation locus and reduced SNC support.

### Dependencies

*Needs:* Layers 1–6; SchemeAndStackFoundations §§0.8–0.9, 0.12–0.15, 0.21, 0.28, 4.7–4.8, 4.11, 4.13, 4.17; StableReduction Layer 4; RigidAnalyticGeometry §§1.1–1.2; Mathlib and Tau Ceti as specified above.

*Lean:* `ResolutionOfSingularities.exists_resolution` is the field milestone. SchemeAndStackFoundations §0.21 owns the scheme excellence predicates and ring regular-map predicate; this roadmap owns `regularMorphism` and its affine comparison in §7.0. The scheme regular-morphism interface, formal categories, supported formal blowup functor and algebraization are README targets without admitted Lean carriers.

## Worked examples


`OrderTests.zeroIdeal` has order `∞` at every point. `OrderTests.dualNumbers` on `R = k[ε]/(ε²)`, `m = (ε)`, computes `ord(m) = 1` but `ord(m²) = ∞`. Thus the power identity requires regular local stalks, as in `MarkedIdeal.cosupport_pow`; order `∞` implies stalk zero only under the Noetherian Krull-intersection hypothesis.

`OrderTests.unitIdeal` `ord O_M = 0`; `OrderTests.cusp` `ord_0 (y² − x³) = 2`; `OrderTests.notZeroSet` `ord_0 (x²) = 2` although its reduced zero set `V(x)` is smooth; `V(x²)` itself is nonreduced and not smooth.

`MarkedTests.emptyCentre` `∅` is permissible; `MarkedTests.cuspOrigin` 0 is permissible for `((y² − x³), 2)`; `MarkedTests.tangentNotNC` `V(y − x²)` is not permissible when `E = (V(y))`.

`TransformTests.emptyCentre` `C = ∅` gives `I' = I`; `TransformTests.cuspChart` in the chart `y = x y'` the controlled transform of `((y² − x³), 2)` is `(y'² − x)`; `TransformTests.notStrict` strict ≠ controlled transform of the cusp for marking 1.

`EquivTests.refl`; `EquivTests.power` `((x), 1)` ~ `((x²), 2)`; `EquivTests.notEquiv` `((x², y), 1)` and `((x, y), 1)` separate after blowing up 0.

`MonomialTests.minimalSubset` takes `I = (x⁴y)`, `d = 4` and ordered coordinate boundary. `{x}` qualifies, while `{x,y}` is excluded by minimality; arbitrary qualifying supersets would choose a different centre. `MonomialTests.exponent` takes `I = (x³y³)`, `d = 4`: in the x-chart the transform is `(x²v³)`. `MonomialTests.unit` has empty cosupport for `I = O` and a positive mark.

`DerivTests.unit` `D(O_M) = O_M`; `DerivTests.cusp` `D((y² − x³)) = (y, x²)` at 0; `DerivTests.charP` over `𝔽_p`, `D((x^p)) = (x^p)`.

`MaxContactTests.orderOne` `d = 1`, `I = (f)` smooth: `H = V(f)`; `MaxContactTests.cusp` `V(y)` for `((y² − x³), 2)`; `MaxContactTests.notAnyContaining` for `I = (y²−x⁵)`, mark 2, `V(x)` contains the initial cosupport but fails persistence: in the x-chart the controlled transform is `(v²−x³)`, with order 2 at (0,0), a point outside the strict transform of `V(x)`. For the ordinary cusp `(y²−x³)`, the cosupport is already empty after that blowup, so it would not discriminate.

`MaxContactTests.characteristicTwoCusp` computes `D((x²+y³)) = (x²,y²)` over `F₂`, since `∂_y(y³) = y²`; it is not equal to I. `MaxContactTests.boundaryTransversality` distinguishes existence of an order-one derivative from transversality to an arbitrary accumulated boundary. The companion-ideal and old-boundary reduction in Layer 4 supplies the transverse contact presentations used here.

For the differential-ideal coefficient construction put `C(I,d)=Σ_{0≤j<d}(D^j(I))^(d!/(d−j))`, with mark d!, and restrict it to the selected maximal-contact hypersurface. Its API gives the positive integral exponents, agreement of its marked cosupport with the derivative-order conditions, and controlled-transform compatibility from the derivative formula (Włodarczyk, §§2.5–2.7; Bierstone–Milman, Construction 4.18, p. 246). This differential-ideal construction includes tangential derivatives; it need not equal the Taylor-coefficient ideal as an unmarked ideal. For every `j < d`, `d−j` is a positive integer dividing d!, so all exponents d!/`(d−j)` are defined positive integers. For `d = 1` the sum has only `j = 0`.

`CoeffTests.orderOne` `C(I, 1) = I`; `CoeffTests.cusp` with `H = V(y)`, `C|_H = (x³, x⁴)` marked 2; `CoeffTests.notPlainRestriction` for `I = (y³+x⁷+x³y)`, `d = 3` and `H = V(y)`, one has `(D I)|_H = (x³)`, `(D²I)|_H = (x²)`, hence `C|_H = (x¹⁴,x⁹,x¹²) = (x⁹)`, marked 6. Plain restriction is `(x⁷)`, marked 3. The cusp check simplifies to `(x³)`, marked 2, and therefore does not distinguish these constructions.

The homogenization checks `HomogenizationTests.markOne`, `HomogenizationTests.cuspIdeal` and `HomogenizationTests.transverseDirections` are listed under `MarkedIdeal.homogenize` in Layer 4.

`InvTests.offCosupp` undefined off the cosupport; `InvTests.cusp` `inv_0` begins with `(2; 0; 3/2)`; `InvTests.umbrella` for `x² = y²z` the maximum is attained only at 0.

`PrincipalizationTests.zeroComponent` takes `M = A¹` ⊔ `A¹` and I zero on the first component and unit on the second. `I ≠ 0` globally, but its total transform stays zero on the first component and cannot be an invertible divisor ideal; this excludes the weaker nonzero hypothesis. A zero total ideal on a nonempty ambient component retained birationally cannot be principalized. An auxiliary zero marked presentation can instead lose its supporting submanifold under strict transform: for `M=A²_ℚ`, `N=V(x)`, `J=0`, mark one and empty boundary, the permissible centre `C=N` has `J⊆I_C`. Its ambient blowup is the identity because C is Cartier, while the strict transform of N is the closure of the inverse image of `N∖C=∅`, hence empty. Thus its transformed cosupport is empty while M survives. (Stacks, Lemma 31.33.7, tag [0807](https://stacks.math.columbia.edu/tag/0807); §§1.4–1.6.)

`ResolutionTests.genericallyNonreduced` takes `Spec k[ε]/(ε²)`. A smooth scheme cannot be isomorphic to any dense open of this one-point nonreduced scheme; reducedness is indispensable for the asserted birational resolution.

Over ℂ use the holomorphic coordinates of §6.4 for these chart checks. `ChartTests.interior` `b = 0` is a smooth chart of U; `ChartTests.curve` on a curve, a disc with `D = {z_1 = 0}`; `ChartTests.cuspNotSNC` no such chart at a cusp of D.


## Downstream consumers

The resolution interfaces exported for AlgebraicModuliForArithmeticGeometry’s Layers 5, 8 and 9 are `resolution_field`, `relativeEmbeddedResolution`, `sncCompactification` and `cartierSeparation`, together with the marked-ideal and invariant APIs of Layers 1–4. Their affine signatures use namespace `ResolutionOfSingularities` as listed in the Lean lines of each layer. The export for DiamondsAndVStacks D6.9 is `resolution_affinoid`: for reduced characteristic-zero affinoid A, a projective birational regular-source modification of `Spec A` preserving its entire regular locus; relative analytification and proper-surjective comparison belong to that application. The exports for ComplexComparisonPartII C−1.4 are `sncCoordinates` and `sncCompactification`: labelled local boundary equations `t₁⋯t_b=0`, globally smooth components and the prescribed smooth open unchanged. The proofs of these exports use only the suppliers listed above and earlier targets here. The interfaces for InverseGaloisAndArithmeticFundamentalGroups’s characteristic-zero fundamental-group comparison are `localIsomorphismResolution` (§5.5) and `sncCompactification` (§6.2). The supplier locations for the shared field interfaces are fixed below.

| Interface supplied here | Supplier section | Applications |
| --- | --- | --- |
| `localIsomorphismResolution` | §5.5 | AlgebraicModuliForArithmeticGeometry; InverseGaloisAndArithmeticFundamentalGroups |
| `relativeEmbeddedResolution` | §5.6 | AlgebraicModuliForArithmeticGeometry |
| `sncCompactification` | §6.2 | AlgebraicModuliForArithmeticGeometry; ComplexComparisonPartII; InverseGaloisAndArithmeticFundamentalGroups |
| `cartierSeparation` | §6.3 | AlgebraicModuliForArithmeticGeometry |
| `sncBoundary`, `sncCoordinates` | §§1.3, 6.4 | AlgebraicModuliForArithmeticGeometry; ComplexComparisonPartII |
| `resolution_field` | §7.8 | AlgebraicModuliForArithmeticGeometry |
| `resolution_affinoid` | §7.8 | DiamondsAndVStacks |

These interface names retain the field targets’ spellings. Their affine Lean namespace is `ResolutionOfSingularities`. AlgebraicModuliForArithmeticGeometry §§9.1–9.7 consumes these interfaces and supplies its application comparisons. `exists_resolution` here includes reduced schemes and preservation of the entire smooth locus; its dense-open conclusion also supplies the integral field specialization.

## References

- Edward Bierstone and Pierre D. Milman, [*Canonical desingularization in characteristic zero by blowing up the maximum strata of a local invariant*](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Inventiones mathematicae 128 (1997), 207–302; the local locators in Layers 1–6 refer to its printed pages.
- Edward Bierstone and Pierre D. Milman, [*Uniformization of analytic spaces*](https://doi.org/10.1090/S0894-0347-1989-1001853-2), Journal of the AMS 2 (1989), §5.2, for stabilization of realized Hilbert–Samuel functions.
- Edward Bierstone, Pierre D. Milman and Michael Temkin, [*ℚ-universal desingularization*](https://arxiv.org/abs/0905.3580), Theorems 1.1–1.2, Corollary 4.6 and §7, for the regular-morphism field input.
- Michael Temkin, [*Desingularization of quasi-excellent schemes in characteristic zero*](https://arxiv.org/abs/math/0703678), Advances in Mathematics 219 (2008), 488–522; Theorem 1.1, Proposition 2.3.4, §3 and §§4.1–4.3.
- Michael Temkin, [*Functorial desingularization of quasi-excellent schemes in characteristic zero: the non-embedded case*](https://arxiv.org/abs/0904.1592), arXiv version 2 (2011); Theorem 1.2.1, §§1.3.1–1.3.3, §2.4, §§3.1–3.4 and §4.3.
- Renée Elkik, [*Solutions d’équations à coefficients dans un anneau hensélien*](https://www.numdam.org/item/ASENS_1973_4_6_4_553_0/), Annales scientifiques de l’École Normale Supérieure, 4e série, 6(4) (1973), 553–603, §III, Theorem 7, p. 582, for algebraization; the lifting results are used in Temkin’s §3.
- Jarosław Włodarczyk, [*Simple Hironaka resolution in characteristic zero*](https://arxiv.org/abs/math/0401401), §2.9 and §3; the version-specific locators for companions and homogenization are recorded in Layer 4.
- Edward Bierstone and Pierre D. Milman, [*Resolution except for minimal singularities I*](https://arxiv.org/abs/1107.5595), Definitions 3.3 and Theorem 3.4, for the distinction between preserving singular SNC schemes and making the source smooth.
- George Boxer and Vincent Pilloni, [*Higher Hida theory for Siegel modular forms*](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), Proposition-construction 4.1.11, p. 42, for separation of two effective Cartier divisors.
- Brian Conrad, [*Irreducible components of rigid spaces*](https://www.numdam.org/item/10.5802/aif.1681.pdf), §1.1; RigidAnalyticGeometry §1.2 supplies the affinoid excellence theorem.
- [The Stacks Project](https://stacks.math.columbia.edu/), tags [07GC](https://stacks.math.columbia.edu/tag/07GC), [01IQ](https://stacks.math.columbia.edu/tag/01IQ) and [0805](https://stacks.math.columbia.edu/tag/0805), for Néron–Popescu, the closed-immersion criterion and blowup restriction.
