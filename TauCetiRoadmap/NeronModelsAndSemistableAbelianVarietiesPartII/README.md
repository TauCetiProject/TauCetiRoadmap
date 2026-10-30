# Roadmap: néron models and semistable abelian varieties, part II — genus-one fibrations and rational elliptic surfaces

**Summary.** Build the geometry of genus-one fibrations needed to compare multiple fibers with their Jacobians
and to classify a particular family of rational elliptic surfaces over F₂. The construction starts with finite
pinching and full conductor ideals, passes through actual fiber schemes, canonical bundles and geometric
Picard lattices, and ends with the classification of fourteen equation representatives. The fourteen equations
and their resolved invariants are Checks of one classification-list target. The classification theorem follows
from bounded Weierstrass normal forms, admissible equivalence and the geometric and arithmetic fibre conditions.
The signatures in `Suggested.lean` use native Mathlib and Tau Ceti carriers.

## Scope and ownership

This roadmap owns finite Ferrand pinching beyond smooth-section clutching; arbitrary-subring conductors and
their global reconstruction maps; the explicit quadratic pinching chart and its proper curve; the genus-one
specialization of multiple-fiber isogeny arguments; the extension from smooth generic curves to regular
nonsmooth genus-one curves; and the geometric and arithmetic classification of the stated
rational-elliptic-surface family. It also owns the surface realization of the Picard lattice and the local LLR
comparison inputs not covered by semistable reduction alone. It owns the general genus-one surface theory
that the classification rests on: the genus-one fibration carrier over a smooth proper curve base (§2.1), the
geometric fibre classification (§§2.3, 2.5), the canonical bundle formula and the degree of the Hodge line
(§§4.1–4.2), the general-base Picard restriction and Shioda–Tate generation (§§4.7–4.8) and the regular minimal
Jacobian fibration (§4.17); later roadmaps import these by section and do not restate them.

Existing notions are used through their owners. StableReduction Layers 1–2 supply normalization, nodes, the
conductor and normalization sequence, coherent genus and curve duality; Layer 3 supplies smooth-section
clutching; Layers 4–5 supply intersection theory and smooth-generic regular/minimal models; Layer 6 supplies
NumericalType and NumericalPicard. StableReduction names Kodaira fibre geometry as Layer 5 work but states no
classification target, so the classification of fibre types is specified here in full (§2.5), together with
its extension to primitive multiple divisors and to regular nonsmooth generic genus-one curves.
NeronModelsAndSemistableAbelianVarieties is a prerequisite, and the dependency runs one way: that roadmap
writes its one-node curve by an equation and only points here for general pinching, while this roadmap uses
its Néron models (Layer 1), component groups and minimal-model smooth locus (Layer 2) and semistable Picard
comparison (Layer 3, §§3.8–3.9, and Layer 4). The abstract integral lattices, their duals and ADE models
belong to IntegralLattices and the pinned Tau Ceti library. Their identification with geometric component
classes is the new work.

General Lang surjectivity and finite-field torsor triviality belong to ReductiveGroupsPartII §RG2.3.7, whose
prose statement includes smooth geometrically connected finite-type groups; its Lean carrier is affine.
General Tsen and Brauer vanishing belong to SchemeAndStackFoundations SF.2; the Picard obstruction sequence belongs to its SF.3 and
ComplexComparisonPartII §C3.2d.4. This roadmap uses their genus-one and projective-line consequences. It
does not construct another elliptic-curve, polynomial quotient, ring pullback, model, lattice or
numerical-Picard carrier.

Tau Ceti’s `RingTheory/Ideal/Conductor.lean` provides coprime ideal extension/contraction for a common ambient ideal,
including `TauCeti.quotientComapEquivOfCoprime`; it does not define the arbitrary-subring conductor used here.
Tau Ceti’s `AlgebraicGeometry/WeilDivisor/Scheme/GenusOne.lean` provides pointed degree-one Riemann–Roch and the point/Pic⁰
comparison. Neither result supplies the regular surface, its fibers, or a scheme presentation of every pointed
genus-one curve. Those comparisons have separate targets below.

Point counts of Weierstrass equations are Tau Ceti's: `WeierstrassCurve.pointCount` and `frobeniusTrace` at
the pinned library, and EllipticCurves Layer 3's values 1, −1 and 0 of q+1−pointCount at a split node, a
nonsplit node and a cusp, supplied by `AlgebraicGeometry/EllipticCurve/SingularPointCount.lean` as `frobeniusTrace_eq_one_of_splits`,
`frobeniusTrace_eq_neg_one_of_not_splits` and `frobeniusTrace_eq_zero_of_c₄_eq_zero`; split and nonsplit are
measured there by the splitting of the pinned `WeierstrassCurve.nodePolynomial`. The single-component
fibre counts of §§2.10–2.13 for I₁ and II are these equation-level counts; the multi-component fibre counts
are new here. Weight reversal rev_i agrees with Mathlib's `Polynomial.reflect i` on polynomials of
degree at most i; above that weight `reflect` keeps a coefficient that
rev_i drops. The chart identities of §4.10 assume the degree bounds, and rev_i is kept
because its output always satisfies the weight bound.

## Conventions

All rings are commutative with identity; ring maps preserve identity. The zero ring, nilpotents and zero
localizations are permitted wherever the statement does not explicitly require a field or a domain. Conductors
are full ideals, never radicals. For a scheme morphism `f:Y→P`, its ring map goes from target sections to
source sections. Categorical composition `i≫f` means first `i`, then `f`. The additive conductor difference is
source restriction minus the image of the target-conductor section.

A genus-one fibration has a smooth proper geometrically integral surface, a smooth proper geometrically
integral curve base, a proper flat contraction and a regular geometrically integral generic curve with H⁰
equal to its field of definition and H¹ of dimension one. Elliptic means that generic curve is smooth;
quasielliptic means regular but nonsmooth. Relative minimality rules out vertical exceptional curves of the
first kind. For a fiber divisor ΣnᵢCᵢ, write m=gcd(nᵢ), `F_ind=Σ(nᵢ/m)Cᵢ` and `F_red=ΣCᵢ`. Primitive and reduced
are different notions.

Point counts include singular points and ignore nilpotent thickening, because maps from fields factor through
reduction. `WeierstrassCurve.pointCount` counts all affine equation solutions plus the point at infinity; it
is an elliptic group cardinality only under smoothness. In the tables Eᵢ denotes the smooth binary curve with
i points. The five-curve list `F2Model` and the fourteen-equation list use zero-based Lean indices;
mathematical model numbers start at one. Every extension-count assertion has r≥1; q is an actual
finite-field size and is at least two.

The Weierstrass equation is y²+a₁xy+a₃y=x³+a₂x²+a₄x+a₆. Coefficients have weights 1,2,3,4,6; the discriminant
has weight 12. At s=1/t, use x′=s²x, y′=s³y and aᵢ′(s)=sⁱaᵢ(1/s). Reversal is at the specified weight,
including trailing zeros. Projective bundles use the quotient convention P(E)=Proj Sym E; the evaluation f*E→L
induces the associated morphism.

Geometric component lattices use the intersection pairing: roots have square −2. The abstract positive ADE
form is sign-reversed before comparison. The fiber/section plane in the ordered basis (F,O) has Gram matrix
[[0,1],[1,−1]], determinant −1. On H², geometric Frobenius has eigenvalue q times the corresponding
Picard-action eigenvalue; twisting by (1) removes q. This fixes the sign and twist in the point-count
criterion.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Use `CommRingCat.pullbackCone` and `pullbackConeIsLimit` for the actual ring fiber product.
`Ideal.Quotient.mk`, `Ideal.quotientMap`, ideal map/comap, `Subring`, `Subalgebra`, module quotients, tensor
products, `IsLocalization` and `Localization.Away` supply the algebraic carriers. `Polynomial`, its
coefficient and monic-division API, `AdjoinRoot.mkₐ`, multivariable-polynomial quotients and finite-field
tensor splitting supply the polynomial calculations. Mathlib's `conductor R x` concerns the subalgebra R[x];
the new conductor must agree with it when that subring is chosen, without reducing the general definition to a
monogenic one.

Use native `Scheme`, `Scheme.Hom.appLE`, `IsClosedImmersion`, `IsFinite`, scheme pullbacks, gluing,
`IdealSheafData.subscheme`, `subschemeι`, `comap`, `comapIso`, `subschemeMap`, `ofIdealTop`, `ofIdeals` and
`ofIdeals_ideal`. The section identifications must be those induced by the actual inclusions, restrictions and
`ΓSpecIso`; existence of an abstract ring equivalence is insufficient. Native normalization, relative
normalization and function-field comparisons are used with their integral/noetherian hypotheses. General
projective geometry and genuine coherent cohomology are taken from the supplier layers below, rather than
encoded by arbitrary proposition fields.

`WeierstrassCurve`, its discriminant and invariant formulas, `VariableChange` and its coefficient action are
native equation data. Tau Ceti’s `AlgebraicGeometry/EllipticCurve/Scheme/ProjModel.lean` supplies
`WeierstrassCurve.projModel`, its base morphism `projModelOver`, its zero-section `projModelZero`,
and `projModelVariableChangeIso`. The last isomorphism goes from (V • W).projModel to W.projModel
and commutes with the base maps and the zero-sections. Use it for the projective realization of
admissible coordinate changes; the pinching-chart comparisons of §2.43 and the global surface
contraction of §4.13 are additional targets. Tau Ceti's `AlgebraicGeometry/EllipticCurve/PointCount.lean` supplies
`WeierstrassCurve.pointCount`, `pointCount_eq_card_point` for smooth finite-field curves, and
`frobeniusTrace=q+1−pointCount`. `TauCeti.Model`, from
`AlgebraicGeometry/Curves/StableReduction/Model/Basic.lean`, is the native flat finite-presentation
DVR model with specified generic-fiber comparison; regularity and minimality remain additional conditions. Native
`TauCeti.IntegralLattice`, `IsEven`, `IsUnimodular`, the norm-one vector weight of type D
(`checkerboardLattice_form_checkerboardVector_self`) and `discriminant_typeE₆RootLattice` are used only after
constructing the geometric pairing comparison.

`RingTheory/Ideal/Conductor.lean` supplies `TauCeti.quotientComapEquivOfCoprime`: for a subring
S of B, a B-ideal C contained in S and a B-ideal J with J+C=B, the inclusion induces
S/(J∩S) ≃ B/J. This coprime quotient comparison is used with its actual inclusion map.
The arbitrary-subring conductor and the reconstruction without a coprimality hypothesis
are the distinct targets of Layer 1.

Tau Ceti’s `AlgebraicGeometry/Modules/RationalFunctions.lean` supplies, for an irreducible
scheme X, `TauCeti.AlgebraicGeometry.Scheme.fromSpecFunctionField`, `genericPoint_mem`,
`fromSpecFunctionField_preimage` and `instUniqueSpecFunctionField`. For nonempty opens it supplies
`rationalFunctionsRingEquiv`, `rationalFunctionsEquiv` and `rationalFunctionsRingEquiv_map`;
`rationalFunctionsSectionsEquiv` is defined on every open. All these names are in
`TauCeti.AlgebraicGeometry.Scheme`. The comparisons in §§2.57–2.62 use these maps and their
restriction laws on the actual curve and normalization schemes.

### From existing Tau Ceti roadmaps

StableReduction Layer 1 supplies finite normalization, local node/branch comparisons, the conductor and the
normalization exact sequence, and the splitting of nodes and branches after a finite separable field
extension; reducedness of the target alone is insufficient. Layer 2 supplies coherent cohomology of proper
curves (finite dimensionality, vanishing above degree one, the full cohomology-and-base-change theorem),
local constancy of the fibre Euler characteristic χ(X_b,O) in proper flat families, and curve duality. Local
freeness of `R¹f_*O` is not part of this contract in general: Layer 2 derives it for proper flat nodal
families, and otherwise it holds only under cohomological flatness, which §3.3 obtains from Raynaud's
criterion; a wild multiple fibre keeps a nonzero torsion part T of `R¹f_*O` (§4.1). Together with
`f_*O = O`, χ-constancy is the Euler-characteristic input used in §3.3; the values H⁰(P¹,O)=k and H¹(P¹,O)=0 are the
genus-zero case. Layer 4 supplies blowup/intersection operations, including negative semidefiniteness of the
component matrix of a fibre. The sharper form used here, that the form vanishes exactly on multiples of the
multiplicity vector and hence every proper principal submatrix is negative definite, is the linear-algebra
lemma of Stacks Lemma 55.2.3 (tag 0C5X), proved here as part of §2.5. Layer 5 supplies regular relatively
minimal models of smooth positive-genus generic curves, their uniqueness, components, multiplicities,
adjunction and the genus formula. Sections extend by Mathlib’s `IsProper.eq_valuativeCriterion`,
listed in StableReduction’s existing-library dependencies under “Valuative criterion”. Layer 6 supplies the abstract
numerical-Picard construction; the map from an actual fiber divisor to its weighted numerical type is
constructed here.

JacobianChallenge Layers A–D supply divisors and degrees, coherent genus, Riemann–Roch/duality, flat base
change and the Picard functor; Layers E–F supply abelian varieties and the pointed Abel–Jacobi map. The
genus-one bijection between points of residue degree one and Pic⁰ is the pinned Tau Ceti library's
`TauCeti.AlgebraicGeometry.SchemeWeilDivisor.degreeOneEquivPicZero`
(`AlgebraicGeometry/WeilDivisor/Scheme/GenusOne.lean`). AlgebraicCurves Layer 12 supplies
the scheme/function-field dictionary and Layer 10 the Weierstrass normal forms of elliptic function fields
(Stichtenoth, Prop. 6.1.2), including the two characteristic-two forms; together they give the Weierstrass
presentation of a pointed smooth proper genus-one curve used in §2.22. That consumer compares the
pointed curve with the supplied `WeierstrassCurve.projModel`, preserving its `projModelZero`.

EllipticCurves Layer 1 supplies genuine finite isogenies, dual isogenies and degrees; Layer 3 supplies
finite-field Frobenius, the count identity `#E(𝔽_{qⁿ}) = deg(1 − π_qⁿ)` and the bad-reduction values of
q+1−pointCount, and the invariance of all extension counts under an isogeny is derived from these in §3.8;
Layer 4 supplies the Kodaira reduction symbols and Tate's algorithm over perfect residue fields. The comparison from its local algorithm to
resolved surface components is an explicit target here. IntegralLattices Layers 0–1 supply the
abstract lattices, duals and discriminant forms; Layer 6, targets 6C and 6F, supplies the
positive definite even unimodular rank-eight classification and the Gram/coordinate E₈ comparison.
The surface-to-lattice realization is constructed here.

### From foundational roadmaps

SchemeAndStackFoundations Layer 0 (SF.0), §0.27, supplies flat exactness and finite-module
annihilators under flat scalar extension (Stacks
Lemma 10.40.4, tag 07T8); §0.28 supplies ideal restriction and quotient/localization comparisons,
including the ideal-pullback and ideal-restriction formulas on affine opens. SF.1 supplies genuine algebraic spaces on the small étale site, étale descent, fibre products of
spaces and the quotient of a scheme by an étale equivalence relation (Stacks Theorem 65.10.5, tag 02WW).
The diagonal properties of Stacks Lemma 65.13.1 (tag 02X4) are supplied by SF.1 §1.3’s
the diagonal of an algebraic space is locally quasi-finite; locally quasi-finite implies locally of finite type. Three
Stacks inputs that SF.1 does not state are targets of §1.9 here: étale algebras lift along surjections of rings
(Lemma 10.143.10, tag 04D1); a separated locally quasi-finite morphism to a
scheme is representable (Proposition 67.50.2, Section 67.50, tag 0417); and quasi-separatedness and
separatedness descend along a surjective universally closed morphism (Lemma 67.9.8, tag 05Z2). The
flat-module patching equivalence over a ring fibre product (Ferrand, Théorème 2.2(iv), p. 560; Stacks Lemma
15.6.8, tag 0D2I) is also a target here (§1.3). The finite-pinching specialization below constructs its
presentation and proves its descent hypotheses using those carriers; preservation of an already constructed
square is not a substitute for presentation effectivity.

SchemeAndStackFoundations Layer 2 (SF.2), §2.16, supplies Tsen for a one-variable function field
over algebraically closed constants (Theorems 59.67.10–12, tag 0A2M). Its Layer 3 (SF.3), §3.6,
supplies Picard torsors without a rational point, using JacobianChallenge Layer D’s Picard/Brauer
obstruction sequence over a field. Its Layer 5 (SF.5) supplies intersection, adjunction and Hodge
index on smooth projective surfaces over algebraically closed fields. Flat base change of quasi-coherent cohomology is JacobianChallenge's (Layers A–D), as
SchemeAndStackFoundations also records. The rational-surface blowup and cycle-class realizations
needed beyond these contracts are explicit Layer 4 and Layer 5 targets here; no unnamed rational-surface
classification or nonexistent étale-cohomology layer is assumed.

AlgebraicModuliForArithmeticGeometry Layer 1 §1.1 supplies the quotient-convention projective bundle and
relative Proj. Layer 3 §3.5 supplies effective polarized descent and projective finite quotients; apply it only
with a chosen invariant polarization and the free finite constant-group action specified below. Layer 7 §7.3
supplies Raynaud's condition (N)* and the degree-one cohomological-flatness criterion: a proper flat finite-presentation
relative curve over a trait satisfying (N)* is cohomologically flat in degree zero when its strict-henselian
generic fiber has a divisor of degree one; a section suffices. (N)* includes the stated
normality/no-embedded-point condition and `f_*O=O`. ComplexComparisonPartII §§C3.2d.2–C3.2d.4
supplies Picard representability, separatedness and the Brauer obstruction sequence. Raynaud's
multiplicity/order argument is specialized and proved below with all these hypotheses.

NeronModelsAndSemistableAbelianVarieties Layer 1 supplies Néron models; Layer 2 the identity component, the
component group, the smooth locus of the minimal regular model (2.7) and the geometric component groups by
Kodaira type (2.8); Layer 3, §§3.8–3.9, the degree-zero Picard scheme of a semistable curve and its
identification with the Néron identity component; and Layer 4 the Picard schemes of semistable curves and the
monodromy pairing. Additive torsors, LLR discriminant/Lie-lattice comparisons, local period equals
fiber multiplicity and the corrected obstruction factors are developed in Layer 3 here. Thus the stronger
comparison is not silently imported from a semistable theorem. ReductiveGroupsPartII §RG2.3.7’s prose
target *lang-theorem* supplies Lang for every smooth geometrically connected finite-type group over a finite
field, including an elliptic curve and PGL₂ (Lang (1956), Theorem 1 and corollary, pp. 556–557). Its Lean target
its Lang surjectivity statement has the affine carrier `FiniteTypeCommHopfAlgCat`, and it has no compiled PGL₂ carrier.
The Jacobian application of §2.15 and the PGL₂ application of §2.16 consume the prose target.

EtaleCohomologyFoundations §§F.0.3, F.2.1–F.2.7, F.3–F.7 and F.10.1–F.10.5 (including F.10.2b)
supplies finite-coefficient cohomology, adic realization, finiteness, duality, purity/Gysin and cycle
classes, projective bundles, blowups, geometric Frobenius, Tate twists and perfect-complex traces.
EtaleCohomologyFoundations §§0.9–0.11 supplies the algebraic cycle-class, projective-bundle
and smooth-trace normalizations.
InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 supplies the curve, finite-coefficient
and rational trace formulas and the constant-sheaf point-count trace. Layer 5 here
specializes these constructions to P² and equivariant point blowups, preserving their canonical maps,
then constructs the rational-surface cycle-class comparison and rank-ten point-count criterion.

## How to read the build

Layer 1 constructs finite pinching and its actual global conductor maps. Layer 2 applies it to genus-one
fibers and the five binary elliptic classes. Layer 3 proves the local multiple-fiber comparison. Layer 4
constructs canonical bundles, geometric lattices and the bounded global cubic; Layer 5 turns resolved-surface
counts and marked graph arguments into Picard constancy. Layer 6 gives the fourteen-model list with equations
and resolved invariants as Checks. Layer 7 proves admissible equivalence and classification by normal-form case
analysis, with uniqueness from the fibre and j-invariants. The README specifies every geometric target;
`Suggested.lean` states Ferrand's scheme existence theorem
(`ferrand_scheme_pushout_exists`), the affine matrix classification
(`canonicalFiber_affineMatrixClassification`), finite-field genus-one rational points
(`genusOne_finiteField_hasPoint`), the five-class geometric classification
(`genusOne_F2_classification`) and the characteristic restriction for regular nonsmooth
genus-one curves (`regularGenusOne_char_two_or_three`). Its only supporting definition is
`F2Model`. The remaining targets are stated in this README.

| Layer | Mathematical content |
| --- | --- |
| 1 | Finite pinching and full conductor maps |
| 2 | Genus-one fibres, Kodaira geometry and binary elliptic curves |
| 3 | Multiple-fibre isogenies and local comparisons |
| 4 | Canonical bundles, Picard lattices and global equations |
| 5 | Resolved counts, graph rigidity and Picard constancy |
| 6 | One fourteen-model list, its invariant Checks and nonrational-fibre theorems |
| 7 | Admissible equivalence and classification by normal forms |

## Layer 1: finite pinching and full conductors

### 1.1 ferrand geometric pushouts

Define the geometric pushout for a specified commutative square Z→Y, Z→Z′, Y→P, Z′→P by two conditions: the
underlying space is the quotient pushout, and `O_P` is the fiber product of the three direct-image structure
sheaves. In schemes the latter is checked naturally on every open; in algebraic spaces it is a comparison on
the small étale site. Define the Ferrand pushout by additionally requiring Z→Y closed and Z→Z′ finite. This is a
condition on a constructed square, not an existence assertion. Witaszek's universal-homeomorphism
specialization also requires his qcqs conditions.

Schemes over a common base, or algebraic spaces over a common scheme base via the SchemeAndStackFoundations
SF.1 carrier.

Use actual scheme morphisms and their maps on spaces and sections. For every open U⊂P impose the pullback of
the three section rings on a⁻¹U, b⁻¹U and (ai)⁻¹U; these natural conditions express the sheaf equality. In the
algebraic-space extension use the small étale site and test the sheaf comparison on affine étale charts;
Zariski sections alone are insufficient. Restrict to closed i and finite g for Ferrand data; restrict instead
to qcqs i and universal-homeomorphism g,a for Witaszek 2.17.

([Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), §§4.1,5.1,5.4,7.1, pp565,568,570,575–578;
[Witaszek](https://par.nsf.gov/servlets/purl/10429755), Definition 2.17, p669; Lemmas 2.23,2.25, pp672–673.)

The construction needs the following maps and laws.

- For B→C surjective and A′→C finite, `Spec(B×_C A′)` gives the finite-pinching
  geometric square.

- For a Ferrand square, or a Witaszek2.17 geometric square with its full hypotheses,
  compatible Y→T and Z′→T induce a unique P→T.

- For a Ferrand square, or a Witaszek2.17 geometric square with qcqs
  hypotheses, every flat T→P induces a geometric square on all four base changes.

- With qcqs i and universal-homeomorphism g,a, the general predicate is
  equivalent to Witaszek Definition2.17.

- In a Ferrand pushout a identifies Y∖Z with P∖Z′.

- The conductor square of a finite inclusion of reduced Noetherian rings is this
  geometric square; no birational hypothesis is necessary.

- For algebraic spaces Y,Z,Z′ over a scheme S, a closed immersion
  i:Z→Y and a finite morphism g:Z→Z′ have a categorical pushout P=Y⊔Z Z′ in algebraic S-spaces, with affine
  canonical maps Y→P and Z′→P. No Noetherian, quasi-separated, reduced, radicial or scheme affine-neighborhood
  hypothesis is imposed.

- For a finite pinching datum whose three components Y,Z,Z′ are schemes, its
  algebraic-space pushout P is a scheme if and only if for every point z′∈Z′ the finite set i(g⁻¹(z′)) lies in
  an affine open of Y. Under this condition the canonical scheme pushout agrees with P, including universality
  against algebraic-space targets.

- For a finite surjective morphism of reduced Noetherian schemes, the
  actual globally constructed conductor subschemes and induced map give a geometric and categorical Scheme
  pushout, with the native cartesian comparison and flat-recomputed conductor compatibility; no birational
  hypothesis is imposed.

**Checks.**

- For char k≠2, pinching t=±1 of A¹ gives k+(t²−1)k[t]=k[t²−1,t(t²−1)]={f:f(1)=f(−1)}.

- Pinching V(t²) to Spec k gives k+t²k[t]=k[t²,t³].

- If g is an isomorphism, the square has P≅Y with its actual structure sheaf.

- The subring k[t²,t⁵] misses t³, so the corresponding universal-homeomorphism square with V(t²)→Spec k is not
  the geometric pushout.

- Pinching a separable quadratic closed point on P¹ gives the nonsplit rational node; its normalization has
  two conjugate geometric branches.

- For surjective B→C and finite A′→C, the algebraic-space pushout is canonically `Spec(B×_C A′)`, and the Hom
  comparison is bijective for every algebraic-space target.

- If a k-scheme Y has two distinct closed k-points with no common affine open, pinching their disjoint union
  to Spec k produces an algebraic space which is not a scheme.

*Needs:* `AlgebraicGeometry.IsClosedImmersion`; `AlgebraicGeometry.IsFinite`;
`AlgebraicGeometry.Scheme.Hom.appLE`; SchemeAndStackFoundations SF.1, scheme/étale-space contracts.

### 1.2 conductor of an arbitrary subring

For A⊂B, define the conductor c(A,B) as the B-ideal of elements b for which bx lies in A for every
x∈B. Multiplication by one shows it is contained in A; every B-ideal contained in A is contained in this
conductor. No finiteness, reduction, normality or birationality is part of the definition.

The greatest-ideal proof multiplies a member of an ambient ideal by an arbitrary ambient element. Compare its
monogenic specialization with Mathlib’s conductor through equality of subrings.

The representative constructor is kept separate, to distinguish the arbitrary-subring ideal
from Mathlib's monogenic `conductor R x`. Their equality when A=R[x] is part of the comparison API; all
examples use the same full ideal.

([Witaszek](https://par.nsf.gov/servlets/purl/10429755), Definition2.27, p674;
[Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Theorem5.1, printed p568, complete
principal-localization paragraph, with Lemma1.3(b) and its converse, pp556–557; [Stacks, tag
0ET0](https://stacks.math.columbia.edu/tag/0ET0), Lemma37.14.1, full.)

The construction needs the following maps and laws.

- For any commutative ring B (the zero ring included), subring A and b in B,
  b belongs to the full B-ideal c(A,B) if and only if bx belongs to A for every x in B; no reducedness,
  Noetherianity or birationality is imposed. Unfold the definition.

- For an arbitrary subring S⊂B, every element of its ambient conductor c(S,B)
  belongs to S. Evaluate the defining condition b·x∈S at x=1.

- A B-ideal I is contained in c(A,B) iff its underlying set lies in A.

- A⊂A′ implies c(A,B)⊂c(A′,B).

- For A the underlying subring of R[x]⊂B this is Mathlib's `conductor R x`;
  the two carriers are literally the same set.

- For any commutative ring B, subring S⊂B and t∈S whose ambient
  value lies in c(S,B), the native map `S_t→B_t` induced by the subtype inclusion is bijective, for any native
  localization carriers. Uses §1.21, §1.2, `Ideal.map_comap_le`, `Ideal.mem_map_of_mem`,
  `Subring.subtype_injective`, `RingHom.injective_iff_ker_eq_bot`. Contract the actual conductor to I⊂S. The
  native map-comap inequality and the containment of the conductor in A show that map(I) equals the actual set image
  of I. The subtype inclusion is injective, so its kernel is zero. Apply the general common-ideal localization
  lemma to this I and t.

**Checks.**

- c(B,B)=B.

- The conductor of k[t²,t³]⊂k[t] is t²k[t].

- The diagonal ℤ/4⊂ℤ/4×ℤ/4 has conductor zero,
  although its ambient ring contains the nonzero square-zero element (2,2).

- For char k≠2 the conductor of k+(t²−1)k[t] is (t²−1)k[t].

- For a proper field extension k⊂E, the conductor is zero even when E/k is finite separable.

*Needs:* `conductor`.

### 1.3 affine Ferrand existence

Prove the affine Ferrand pushout: when B→C is surjective and A′→C is finite, the native pullback ring `B×_C A′`
gives a geometric pushout Spec B←Spec C→Spec A′. Its universal property must hold against every scheme, and
later every algebraic space, rather than just affine targets.

The pullback ring supplies compatible morphisms and the affine section identities. Use
the localization complement and the surjective projection to identify the quotient topology. Given maps to an
arbitrary scheme T, cover the image by affine opens and glue the ring lifts, rather than claiming Spec sends
every ring limit to a scheme colimit.

([Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), §§1.1–1.3, pp555–556;
[Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), §1.3, p556;
[Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Theorem5.1, printed p568, complete
principal-localization paragraph, with Lemma1.3(b) and its converse, pp556–557;
[Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Proposition5.6(3), pp572–573;
[Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Theorem5.1 and proof, pp568–569.)

The construction needs the following maps and laws.

- For p:B→C surjective and q:A′→C, set `A=B×_C A′` using the baseline pullback. The
  projection A→A′ is surjective and its kernel maps isomorphically onto ker p as an ideal of B. Uses
  `CommRingCat.pullbackCone`, `CommRingCat.pullbackConeIsLimit`. Lift q(a′) along p to establish projection
  surjectivity. A pair in the projection kernel is exactly (b,0) with p(b)=0; check the ideal action
  componentwise.

- For the preceding A, with I=ker(A→A′)=ker p⊂B, the natural map `B⊗_A A′→C` is an
  isomorphism. Uses §1.3, SchemeAndStackFoundations SF.0, quotient/localization/flat-module contracts. Use
  A′≅A/I by the pullback projection. Use the tensor quotient `B⊗_A(A/I)≅B/IB`, with IB=ker p. Use B/ker
  p≅C.

- For t∈I in the previous square, A[1/t]→B[1/t] is an isomorphism. Uses §1.3,
  SchemeAndStackFoundations SF.0, quotient/localization/flat-module contracts, §1.21. Use
  the pullback projection to identify I with the common ideal image and establish ker(f)∩I=0, without assuming the
  map A→B is injective. Apply the common ideal away equivalence to the actual localization map. The checked inverse
  representative is a/t whenever f(a)=f(t)b. Use the supplier’s actual affine basic-open and section
  comparisons to identify the union with the complement of the conductor subscheme.

- If q:A′→C is finite and p:B→C surjective, then the projection `A=B×_C A′→B` is finite.
  Uses §1.3. Choose finitely many A′-module generators of C and lift them to B. Reduce any b modulo I using
  these lifts and lift each A′ coefficient to A via pullback projection. The residual term lies in
  I⊂A, so 1 and the chosen lifts generate B over A.

- For p:B→C surjective, any q:A′→C and `A=B×_C A′`, the functor sending an A-module L
  to the triple (`L⊗_A B`, `L⊗_A A′`, the canonical identification of their base changes to C) is an equivalence
  from flat A-modules onto triples of a flat B-module, a flat A′-module and an isomorphism over C; its inverse
  is the fiber product `N×_M M′`. It restricts to finite projective modules (Milnor patching) and, being
  compatible with tensor products, to flat and to étale A-algebras. No finiteness of q is needed, and for
  arbitrary modules the comparison L→(L⊗B)×(L⊗A′) is only surjective. Uses `CommRingCat.pullbackCone`,
  tensor products and `Module.Flat`. Compare kernels of the two coordinate projections as in
  the pullback projection, and use flatness to keep the fiber-product sequence exact (Ferrand, Théorème 2.2,
  pp. 559–560; [Stacks, Lemma 15.6.4, tag 07RU](https://stacks.math.columbia.edu/tag/07RU);
  [Lemma 15.6.5, tag 08IG](https://stacks.math.columbia.edu/tag/08IG);
  [Lemma 15.6.8, tag 0D2I](https://stacks.math.columbia.edu/tag/0D2I);
  [Lemma 15.6.9, tag 0D2J](https://stacks.math.columbia.edu/tag/0D2J)).

**Checks.**

- The cusp uses C=k[t]/t²; a reduced-only definition must fail this test.

- Ferrand flat patching on the cusp square k[t]→k[t]/t²←k: the free module A is sent to (k[t], k, the
  identity of k[t]/t²), and gluing that triple returns k+t²k[t].

- Ferrand flat patching remembers the gluing isomorphism: for char k≠2 and the node square
  k[t]→k×k←k (evaluation at t=±1), the triples (k[t], k, (1,1)) and (k[t], k, (1,−1)) glue to rank-one
  projective modules over A=k+(t²−1)k[t] whose classes in `Pic A≅(kˣ)²/kˣ` are 1 and −1, so the second is not
  free. A definition that forgets the isomorphism over C would identify them.

*Needs:* `CommRingCat.pullbackCone`; `CommRingCat.pullbackConeIsLimit`; SchemeAndStackFoundations SF.0,
quotient/localization/flat-module contracts; §1.21; §1.1; SchemeAndStackFoundations SF.1,
scheme/étale-space contracts.

### 1.4 compatible affine neighborhoods

For a closed immersion Z→Y and finite g:Z→Z′, assume each finite set g⁻¹(z′) has an affine neighborhood in Y.
Construct affine neighborhoods U⊂Y and V⊂Z′ around that fiber with U∩Z=g⁻¹V. Use finite closedness to shrink
V, then lift a principal-open separating section across the closed immersion. This proves compatible
neighborhoods, not merely separate affine charts.

i:Z→Y closed; g finite.

Shrink V using finite closedness of g to remove the image of Z∖U. Use the finite fiber algebra and a
principal-open separation argument to obtain a section invertible on the entire fiber. Lift the section
through the surjective restriction to Z∩U and refine U,V to matching principal opens.

([Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Theorem7.1B and proof, pp575–578.)

**Checks.**

- (AF) on Y implies the condition; curves and quasi-projective Y satisfy it.
- For Y=P¹, Z={0,∞} and g the collapse to Z′=Spec k, the fibre g⁻¹(Z′)={0,∞} has the affine neighbourhood
  U=P¹∖{1}, and with V=Z′ the condition U∩Z=g⁻¹V holds; the affine open U=P¹∖{0} is not compatible with any V,
  since U∩Z={∞} is not a full fibre of g.
- For Y the affine plane with doubled origin, Z its two origins and g their collapse to Spec k, the fibre has
  no affine neighbourhood (an open containing both origins is not separated), so the hypothesis fails and no
  compatible pair exists; the condition is not automatic for non-separated Y.
- For Z=∅ every pair of affine opens is compatible, and for g the identity of Z the condition reads U∩Z=V,
  satisfied by V=U∩Z because a closed subscheme of an affine scheme is affine.

*Needs:* SchemeAndStackFoundations SF.0, quotient/localization/flat-module contracts;
SchemeAndStackFoundations SF.1, scheme/étale-space contracts.

### 1.5 global Ferrand existence

Glue the compatible affine pinches to a scheme P. Prove that Y→P is finite, Z′→P is closed, the square is
cartesian and categorical, and Y∖Z→P∖Z′ is an isomorphism. The finite-fiber affine-neighborhood condition is
essential to scheme existence; the algebraic-space theorem below has a different scope.

Build affine pushouts on §1.4. Use the localization complement and uniqueness of
affine lifts to identify intersections. Glue the schemes and structure sheaves; cartesian, finite and closed
properties are local on P.

The categorical and cartesian existence statement, including
finiteness and closedness of the canonical maps, is `ferrand_scheme_pushout_exists` in
`Suggested.lean`.

([Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), §§4.1,5.1,5.4,7.1, pp565,568,570,575–578.)

**Checks.**

- The (AF) version of Ferrand5.4 is a corollary, not an unconditional global scheme theorem.

*Needs:* §1.4; §1.3; SchemeAndStackFoundations SF.1, scheme/étale-space contracts.

### 1.6 flat base change of geometric squares

For a Ferrand square and a flat T→P, prove that all four pullbacks form the same geometric square over T.
Affinely, tensor the exact difference sequence to identify `(B×_C A′)⊗F` with `(B⊗F)×_(C⊗F)(A′⊗F)`. The
direct-image comparison uses qcqs maps. No assertion of arbitrary nonflat preservation is made.

All four maps qcqs; finite pinching satisfies this.

Use flat exactness on 0→A→B⊕A′→C→0. Apply flat base change to qcqs direct images and sheafify the ring
identity. Finite/closed morphisms and the quotient topology survive the base change; use the common ideal to
identify the affine topologies.

([Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), §4.4, p567;
[Witaszek](https://par.nsf.gov/servlets/purl/10429755), Lemma2.23, p672.)

**Checks.**

- Nonflat tensoring may destroy the kernel; no unrestricted base-change API is exported.

*Needs:* §1.5; SchemeAndStackFoundations SF.0, quotient/localization/flat-module contracts;
JacobianChallenge Layers A–D, flat base change of quasi-coherent cohomology.

### 1.7 generalized conductor square

For a finite inclusion of reduced noetherian rings A⊂B and I=c(A,B), prove `A≃B×_(B/I)(A/I)`, and identify its
Spec square with the finite pinch. The ring reconstruction actually follows from the common-ideal criterion
without reducedness; retain the stated geometric specialization and do not add birationality.

Use the arbitrary-subring conductor reconstruction lemma for the affine ring identity; its common-ideal kernel
and compatible-pair lifting are explicit prerequisite nodes. If b mod I is represented by a∈A, then b−a∈I⊂A,
giving the inverse. The global Scheme comparison is supplied separately by §1.18 and
§1.19, using the native conductor subschemes; the affine ring identity alone does not
establish global gluing.

([Witaszek](https://par.nsf.gov/servlets/purl/10429755), Definition2.27, pp674–675.)

**Checks.**

- For a proper finite field extension the conductor is zero and the square is still valid.

*Needs:* §1.12; §1.2; §1.3; SchemeAndStackFoundations SF.0, quotient/localization/flat-module contracts.

### 1.8 line-bundle patching over a conductor square

Construct an equivalence between invertible sheaves on the conductor pushout and pairs of invertible sheaves
on Y and Z′ with a specified isomorphism on Z. Morphisms must also preserve that identification. Form the
module as a kernel of the signed difference and prove rank-one local freeness; the unit and counit are the
actual restriction/gluing maps.

Glue the underlying modules by the kernel of the difference map with the specified identification. Use the
finite projective case of the patching equivalence of §1.3 (Milnor patching) to establish local freeness of
rank1. Verify both compositions of restriction and gluing are
naturally isomorphic to identity, including morphisms.

([Witaszek](https://par.nsf.gov/servlets/purl/10429755), Lemma2.28 and proof, pp675–676.)

**Checks.**

- Gluing trivial bundles with different units on Z can give different global line bundles.
- For the nodal cubic, Y=P¹, Z={0,∞} and Z′=Spec k: the pairs of trivial bundles on Y and Z′ with the
  identification φ=(u₀,u₁)∈k*×k* at the two points of Z are its degree-zero line bundles, and (u₀,u₁),
  (λμ⁻¹u₀,λμ⁻¹u₁) are isomorphic through the automorphisms λ of the trivial bundle on Y and μ of that on Z′,
  so the classes are k*×k* modulo the diagonal, which is k* through u₀/u₁, matching Pic⁰ of the nodal cubic;
  a construction that forgot the identification on Z would give the trivial group.
- For Z=∅ the pushout is Y⊔Z′ and the equivalence is Pic(Y)×Pic(Z′) with no identification.
- The identification on Z must be an isomorphism: for the nodal cubic and the zero map in place of φ, the
  kernel of the signed difference is the direct sum of the ideal sheaf of Z in Y and the structure sheaf of
  Z′, whose fibre at the node has dimension at least two, so it is not invertible.

*Needs:* §1.7; §1.3, flat-module patching; AlgebraicModuliForArithmeticGeometry Layer 7 §7.3,
Picard-sheaf contracts.

### 1.9 finite pinching in algebraic spaces

Construct the categorical finite pinch in algebraic spaces over an arbitrary scheme base from any closed Z→Y
and finite Z→Z′. Prove that both maps to P are affine, Y→P is finite, Z′→P is closed, and that the square is
cartesian and geometric on the small étale site. No noetherianity, quasi-separatedness, radiciality or
open-affine-neighborhood assumption is imposed. Construct a compatible affine étale cover of the datum, its
schematic overlap and pinches, prove the overlap is an étale equivalence relation, and descend its quotient
and the three source maps.

Use the compatible étale cover of the pinching to form D0→D, and the fact that its overlap D1=D0×D D0 is a scheme. Form the schematic pushouts
P0,P1 on their compatible open affine covers. Their universality in algebraic spaces follows by gluing the two
affine-space Hom lemmas. Use the étale-relation statement to identify P1⇉P0 as an étale equivalence relation and
invoke the SchemeAndStackFoundations SF.1 algebraic-space quotient theorem to construct P. Compatible maps
out of D descend through P0 and P1, yielding the categorical universal property of P. Effectivity supplies
D0=D×P P0 and D1=D×P P1; descend affineness of the canonical maps from the affine local pinches. Finiteness,
the closed immersion, cartesianness and the geometric sheaf condition are separate nodes, rather than silently
bundled assumptions of this existence theorem.

([Temkin–Tyomkin, v3](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem5.3.1(ii), proof
pp15–16; Lemmas5.1.2,5.1.4 p14; Theorem5.2.5 p15; [Temkin–Tyomkin,
v3](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem4.2.1, injectivity argument pp10–11;
[Temkin–Tyomkin, v3](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem4.2.1, surjectivity
argument p11; [Temkin–Tyomkin, v3](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Lemma4.3.1
and proof pp12–13; Lemma4.1.2 pp9–10; Lemma2.1.6 p4; [Temkin–Tyomkin,
v3](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem6.2.1(i), overlap argument pp17–18;
Theorem4.4.1 p13; [Stacks, tag 02X4](https://stacks.math.columbia.edu/tag/02X4), Lemma65.13.1, displayed
proof; [Stacks, tag 05Z2](https://stacks.math.columbia.edu/tag/05Z2), Lemma67.9.8(4), displayed diagonal
proof; [Stacks, tag 0417](https://stacks.math.columbia.edu/tag/0417), Proposition67.50.2, displayed proof;
[Temkin–Tyomkin, v3](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem6.2.1(ii)(b),
pp17–18; Theorem4.4.1 p13; [Temkin–Tyomkin, v3](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf),
Theorem4.4.2(ii) and proof p13; [Temkin–Tyomkin,
v3](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem4.4.2(i) and proof p13;
Theorem4.4.1(ii) p13; §3.3.6 p7; [Temkin–Tyomkin,
v3](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem6.3.5, finiteness case and proof
p19; [Temkin–Tyomkin, v3](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem4.4.2(iii) and
proof p13.)

The construction needs the following maps and laws.

**Finite-map étale-cover cofinality.** Prove that étale covers of the source of a finite morphism are refined
by covers pulled back from the target: for a finite morphism g:Z→Z′ of algebraic spaces over S and any
surjective étale covering morphism U→Z, construct a surjective étale V→Z′ and a Z-map `V×_Z′ Z→U`. A covering family is represented by the disjoint union of its members;
the factorization is into that entire covering, with affine pieces chosen afterwards. No Noetherian
or quasi-separated hypothesis is imposed. Over a strict henselization of Z′ the finite source decomposes
into henselian local pieces; choose lifts on all pieces and descend their maps to an étale neighborhood
using finite presentation and limit descent. This precedes the compatible étale cover of the pinching.

([Temkin–Tyomkin, v3](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Lemma 5.1.2,
p. 14.) *Needs:* SchemeAndStackFoundations SF.1 algebraic spaces and étale descent; SF.0 §0.9
finite-presentation limit descent and §0.14 finite-algebra decomposition; ModularCurves Layer 4D
strict henselization, whose filtered-colimit construction from étale algebras with a chosen geometric
point is [Stacks, Lemma 10.155.2, tag 04GP](https://stacks.math.columbia.edu/tag/04GP).

**Checks.**

- For g the identity, the supplied covering itself is a refining pullback covering.
- For Spec(k×k)→Spec k and the covering by its two components, the pullback of the identity cover maps
  to their disjoint union. It need not factor through either component alone.
- For a finite map with a fiber containing two points, a chart meeting only one of them is not a cover;
  the construction must lift choices over both points before descending the neighborhood.

- For `Spec 𝔽_(q²)→Spec 𝔽_q`, ordinary henselization leaves `𝔽_q` unchanged and the degree-two source
  connected. Strict henselization has residue `𝔽̄_q` and splits that source into two points; both lifts
  are required.

- For algebraic spaces over a scheme S, with i:Z→Y closed and g:Z→Z′
  finite, there are indexed affine schemes Zα,Yα,Z′α, étale covers of Y and Z′, and specified cartesian
  identifications Zα=Z×Y Yα=Z×Z′ Z′α. Thus the datum has a componentwise cartesian affine étale covering.
  Neither Noetherian nor quasi-separated hypotheses are required. Uses §1.1, SchemeAndStackFoundations SF.1, scheme/étale-space contracts. Choose an affine étale presentation of Y; its restrictions to Z are affine
  because i is closed. Apply the étale-cover cofinality of this section to the finite map g
  to refine an affine étale cover of Z′ so that each pullback Zα maps to the disjoint union of the
  chosen affine Y-charts restricted to Z. Cofinality concerns an entire cover, not an arbitrary chart meeting
  only one point of a finite fiber. Split the affine pullback into its open-and-closed pieces mapping to
  individual charts; only finitely many pieces are nonempty. Lift each piece across the corresponding closed
  immersion using étale lifting along surjections in this section (Stacks tag 04D1), and take their finite
  disjoint union as the affine Yα, retaining the entire Zα over Z′α. Add charts (empty;U,empty) from an affine étale covering of Y∖Z so that the Y-components cover
  the complement as well as the pinching locus. Keep the overlap isomorphisms, not only the three separate
  covering families.

- Let p:B→C be surjective, q:A′→C finite, A=B×C A′, and P=Spec A.
  For any algebraic S-space T, restriction HomS(P,T)→HomS(Spec B,T)×HomS(Spec C,T)HomS(Spec A′,T) is
  injective. Uses §1.3, `CommRingCat.pullbackConeIsLimit`, SchemeAndStackFoundations SF.1,
  scheme/étale-space contracts. Take two maps with the same restrictions. Their pullbacks of an affine étale
  presentation of a quasi-compact open of T have the same cartesian datum. Use the flat-module patching equivalence of §1.3 (the Ferrand flat patching),
  applied to étale algebras, to identify those pullbacks over P; refine the resulting scheme by affine
  étale charts. On every such affine chart, ring pullback universality forces the two maps into the affine
  target chart to agree. Descend equality of morphisms along the surjective étale cover using
  SchemeAndStackFoundations SF.1. Work on quasi-compact open target neighborhoods to remove a global
  quasi-compactness assumption on T.

- For the affine datum and P of injectivity of morphisms out of the affine pinching and
  every algebraic S-space T, each compatible pair of maps Spec B→T and Spec A′→T extends to a map P→T. Uses
  §1.3, `CommRingCat.pullbackConeIsLimit`, SchemeAndStackFoundations SF.1, scheme/étale-space contracts.
  Pull back an affine étale presentation T0→T to the datum. It remains a finite pinching datum and therefore
  admits the compatible affine étale cover of the pinching. Use the flat-module patching equivalence of §1.3 (the Ferrand flat patching) over
  the original affine P to obtain the induced surjective étale scheme
  cover P0→P and its genuine cartesian overlap P1=P0×P P0. Maps from the affine charts to T0 factor through
  their ring pullback pushouts. On P1 the two induced maps to T agree by injectivity of morphisms out of the affine pinching, applied
  on an open affine cover. Effective étale descent of morphisms in SchemeAndStackFoundations SF.1 gives
  P→T. Pull back to the covering datum to verify that its restrictions are the specified maps.

- Suppose D1⇉D0 is an étale equivalence relation of finite pinching data,
  every componentwise square is cartesian, and D0,D1 admit compatible open affine coverings. Their schematic
  pushouts P1⇉P0 form an étale equivalence relation. Uses §1.5, §1.3, SchemeAndStackFoundations SF.1,
  scheme/étale-space contracts. Schematic pinching and the flat-module patching equivalence of §1.3 preserve
  flat fiber products, so identity, inverse and composition descend and satisfy the groupoid equations. The
  induced source and target maps are étale by the same patching equivalence applied to étale algebras.
  Prove the relation map P1→P0×S P0 is a monomorphism: it is locally of finite type, and its pullbacks to the
  four pairs of closed pinched pieces and open complements are monomorphisms. The mixed pairs have empty
  inverse image. Use the SchemeAndStackFoundations SF.1 locally-finite-type monomorphism test after a
  surjective base change (Temkin–Tyomkin 2.1.6). A groupoid alone is insufficient: the monomorphism is the decisive
  final step.

- Let D0 be the disjoint union of the compatible affine étale charts of a
  finite pinching datum D and put D1=D0×D D0 componentwise. Then D1 admits a compatible open affine covering,
  so its pinching pushout P1 is a scheme. These opens are cartesian in all three components. Uses §1.9, §1.3,
  SchemeAndStackFoundations SF.1, scheme/étale-space contracts. The components of D1 are ind-quasi-affine
  schemes. On pairs of
  affine chart components, their maps are base changes of the separated locally quasi-finite diagonals of Y
  and Z′ (SchemeAndStackFoundations §1.3, local quasi-finiteness of the diagonal, Stacks tag 02X4);
  the representability criterion for separated locally quasi-finite morphisms in this section supplies representability,
  and its proof supplies the local quasi-affineness comparison. Use affine lifting on ind-quasi-affine schemes
  (Temkin–Tyomkin 5.2.5) to obtain a secondary affine étale covering Q0→D1. The components of D1 are separated schemes, so
  Q1=Q0×D1 Q0 has open affine coverings: fiber products of affines over a separated scheme are affine. The
  schematic pinches of Q0,Q1 are universal against algebraic spaces by the two affine-space Hom lemmas. By
  the étale-relation statement their quotient exists as an algebraic space by the SchemeAndStackFoundations SF.1
  quotient theorem, and is the pushout of D1. Flat patching identifies D1 with the pullback of D0 along P1→P0
  and makes this map étale. The affine finite-projection calculation and the surjective projection show, by
  étale descent in SchemeAndStackFoundations SF.1, that Y1⊔Z′1→P1 is finite and surjective. Its components
  are separated over each affine base chart, so Stacks tag 05Z2 makes P1 separated over that chart. This argument
  uses local finiteness of the already constructed overlap, not the later existence theorem. The separated
  étale map P1→P0 is representable by schemes: use Stacks 67.50.2 (section0417) for locally quasi-finite maps;
  Stacks tag 082J is the stronger quasi-finite comparison cited by Temkin–Tyomkin 6.2.1. Pull back affine opens of the now
  schematic P1 to obtain the compatible open affine cover of D1.

- For the effective finite pinching pushout P, the canonical square Z→Y,
  Z→Z′, Y→P, Z′→P is cartesian in algebraic spaces, including nonreduced Z. Uses §1.9, §1.3,
  SchemeAndStackFoundations SF.1, scheme/étale-space contracts. Pull back along the effective étale
  presentation P0→P obtained in the existence statement of this section. On every affine chart apply the existing
  the cartesian affine tensor-quotient comparison. Descend the canonical comparison Z→Y×P Z′ as an isomorphism
  using SchemeAndStackFoundations SF.1. Topological equality of the overlap is not substituted for this
  comparison.

- The effective finite pinching square satisfies the general
  geometric pushout predicate: the underlying topological space is the quotient pushout and, on the small étale
  site of P, `O_P≅a_*O_Y×c_*O_Z b_*O_Z′`, where c=ai=bg. In particular every affine étale U→P gives the
  corresponding pullback of section rings on its three inverse images. Uses §1.1, §1.9, §1.3,
  SchemeAndStackFoundations SF.1, scheme/étale-space contracts. Use the effective presentation P0→P and the
  genuine cartesian charts of the existence statement of this section. On affine charts the structure sheaf is the
  sheafification of the existing ring pullback; compare on principal opens and transport to the small étale
  site. Descend the sheaf isomorphism through the étale presentation using SchemeAndStackFoundations SF.1;
  Zariski sections alone are not a definition of an arbitrary algebraic space. Use Temkin–Tyomkin 4.4.2(i) to descend the
  quotient topology from the same affine pinches. The scheme specialization is exactly the existing every-open
  section condition.

- For the effective finite pinching P of the existence statement of this section, the
  canonical map a:Y→P is finite. Uses §1.9, §1.3, SchemeAndStackFoundations SF.1, scheme/étale-space
  contracts. Pull back to the effective affine étale pinching charts on P. On each chart apply
  the finite projection to the finite ring homomorphism A′→C. Descend finiteness of a along the étale presentation
  in SchemeAndStackFoundations SF.1. It does not follow from affineness alone.

- For the effective finite pinching P, b:Z′→P is a closed immersion
  and the induced Y∖Z→P∖b(Z′) is an isomorphism of open algebraic spaces. Uses §1.9, §1.3,
  SchemeAndStackFoundations SF.1, scheme/étale-space contracts. On each effective affine étale chart, the
  ring pullback projection to A′ is surjective by the pullback projection, so the pinched locus is the actual
  closed subscheme defined by its kernel. The existing localization-complement comparison identifies its open
  complement with Y∖Z. Descend the closed immersion and this canonical complement isomorphism in
  SchemeAndStackFoundations SF.1. Both describe the one closed/open decomposition of the pushout.

- For a ring R, an ideal I⊂R and an étale R/I-algebra S̄ there is an étale
  R-algebra S with S/IS≅S̄ as R/I-algebras: lift a standard étale presentation and invert the lifted Jacobian
  determinant ([Stacks, Lemma 10.143.10, tag 04D1](https://stacks.math.columbia.edu/tag/04D1)). Used to lift
  affine étale charts of Z across the closed immersion into Y in the compatible étale cover of the pinching.

- Use SchemeAndStackFoundations §1.3’s local quasi-finiteness of the diagonal: the diagonal is
  representable by separated locally quasi-finite monomorphisms, hence is also locally of finite type
  ([Stacks, Lemma 65.13.1, tag 02X4](https://stacks.math.columbia.edu/tag/02X4)).

- A separated, locally quasi-finite morphism from an
  algebraic space to a scheme has a scheme as source ([Stacks, Proposition 67.50.2, Section 67.50, tag
  0417](https://stacks.math.columbia.edu/tag/0417)); reduce to an affine base and use the Zariski covering by
  quasi-affine pieces.

- For a surjective universally closed morphism X→Y of algebraic
  spaces over B, if X is quasi-separated (resp. separated) over B then so is Y ([Stacks, Lemma 67.9.8, tag
  05Z2](https://stacks.math.columbia.edu/tag/05Z2)); compare the two diagonals through the surjective
  universally closed map `X×_B X→Y×_B Y`.

**Checks.**

- A finite separable quadratic point pinch is included although it is not a universal-homeomorphism pinch.

- When the datum is affine this P is canonically the existing Spec of the ring pullback.

- This theorem does not assert P is a scheme.

*Needs:* §1.1; SchemeAndStackFoundations SF.1, scheme/étale-space contracts; §1.3;
`CommRingCat.pullbackConeIsLimit`; SchemeAndStackFoundations SF.1 §1.3 diagonal properties;
Stacks tags 04D1, 0417 and 05Z2 (targets of this section); §1.5.

### 1.10 flat compatibility of algebraic-space pinching

For the effective algebraic-space pinch P and any flat space F→P, prove the canonical comparison between F and
the pinch of the three pulled-back spaces is an isomorphism. Apply the flat-object patching equivalence on the
étale presentations and descend the comparison. Uniqueness of the compatible maps also proves identity and
tower coherence.

Finite and closed morphisms are stable under base change, so the pullback datum has its own effective pinching
by §1.9. On the source- and target-étale presentations apply the affine flat ring/space
flat-module patching equivalence of §1.3 and the base-change calculation of §1.6. Descend
the unique comparison isomorphism in SchemeAndStackFoundations SF.1. Equivalently apply Temkin–Tyomkin 6.3.2(i) to the
flat object F over P. The two iterated base-change comparisons agree because they induce the same maps on all
three components; the categorical universal property supplies uniqueness.

([Temkin–Tyomkin, v3](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem6.3.2(i), pp18–19,
forward equivalence proof.)

**Checks.**

- Étale base changes are included.

- A nonflat ring quotient can destroy the fiber-product exact sequence; a flatness-free version is not
  exported.

*Needs:* §1.9; §1.6; §1.3, flat-module patching; SchemeAndStackFoundations SF.1, scheme/étale-space
contracts.

### 1.11 when finite pinching is a scheme

When all three input spaces are schemes, prove P is a scheme precisely when every finite fiber of Z→Z′ lies in
one affine open of Y. The forward implication takes an affine open in P and its finite inverse image in Y; the
reverse implication uses compatible open affine charts. An affine étale cover always exists for finite data
and must not be substituted for this stronger open-cover condition.

If the fiber affine-neighborhood condition holds, §1.4 and §1.5
construct the schematic pinch. The two affine-space Hom lemmas upgrade its categorical universality to all
algebraic spaces; uniqueness identifies it with P. Conversely, if P is a scheme, take an affine open
neighborhood of b(z′) in P. Its inverse image under the finite map a is affine by space-finite and contains
every i(z) with g(z)=z′. The equivalent compatible-open-affine-cover criterion is Temkin–Tyomkin 4.2.4. Do not conflate a
compatible étale affine cover, which always exists for finite data, with the stronger open affine cover.

([Temkin–Tyomkin, v3](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem4.2.4 and
Example4.2.3, pp11–12; compare Ferrand7.1.)

**Checks.**

- If Y contains two distinct closed k-points with no common affine open, pinching their disjoint union to Spec
  k gives an algebraic space which is not a scheme.

- Affine Y and the original quadratic-point-on-P¹ examples satisfy the condition.

- The scheme recognition condition is necessary as well as sufficient.

*Needs:* §1.9; §1.5; §1.4; SchemeAndStackFoundations SF.1, scheme/étale-space contracts.

### 1.12 cartesian criterion for common-ideal squares

Prove the cartesian criterion for the common-ideal square under the literal image-ideal hypothesis.

For f:A→B and I⊂A, impose the literal equality f(I)=I.map f of underlying sets. Prove the quotient square is
cartesian exactly when ker(f)∩I=0. The comparison into the native pullback is always defined; its kernel is
this intersection, whereas surjectivity is exactly the literal image-ideal condition. These are independent
obstructions.

By compatible-pair lifting the canonical comparison is surjective. By its kernel identity and the native
injectivity criterion it is injective exactly when ker(f)∩I=0. Convert the resulting bijective ring map into
the native ring equivalence and categorical isomorphism; transfer the existing pullback universal property.
Conversely, a cartesian square identifies the comparison with the unique isomorphism between two limits; its
kernel is zero, giving the required intersection condition.

Construct the common-ideal comparison map κ(f,I) as the actual lift to `CommRingCat.pullbackCone`. Its
properties are the two projection equations, its kernel ker(f)∩I, and
its surjectivity criterion, the literal image condition. The proof constructs a preimage by
correcting a residue representative by an element of I. Checks: for Z→F₂ and I=0 it is bijective although f is
not; for the injective diagonal F₂→F₂×F₂ and I=A it is not surjective; for f=id and any I it reconstructs a
from both coordinates.

([Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Lemma 1.3, converse, printed pp556–557 (plus
ring/underlying-set criterion in §1.1); [Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Printed
pp554–557, introduction and §§1.1–1.4.)

The construction needs the following maps and laws.

- The B-projection of `c_f,I(a)` is f(a).

- The A/I-projection of `c_f,I(a)` is [a].

- Any ring map from A to this native pullback with projections f and the
  quotient map equals `c_f,I`.

- For arbitrary commutative rings A,B, a unital ring map f:A→B and an ideal I of A,
  let `J=map_f(I)` and q:A/I→B/J be the native induced quotient map. Define the canonical ring homomorphism
  `c_f,I:A→B×_(B/J)(A/I)` by a↦(f(a),[a]). No image-ideal, injectivity, finite, reduced or Noetherian assumption
  is needed to define it. Uses `CommRingCat.pullbackCone`, `CommRingCat.pullbackConeIsLimit`,
  `Ideal.quotientMap`, `Ideal.quotientMap_mk`, `Ideal.le_comap_map`. Use the native quotient map q and its
  representative equation to check that the two coordinates agree in B/J. Use the already constructed
  commutative-ring pullback and its universal property to form `c_f,I`; do not construct a second fiber-product
  carrier.

- With the preceding notation, `ker(c_f,I)=ker(f)∩I`, without any image-ideal
  assumption. Uses §1.12, `Ideal.mk_ker`. Use the two comparison projections: `c_f,I(a)=0` precisely when f(a)=0
  and [a]=0. Use the native quotient-kernel identity; the native pullback lies in B×A/I, so zero in both
  coordinates is zero in the pullback.

- If the set f(I) equals the underlying set of `J=map_f(I)`, then `c_f,I` is
  surjective. This condition says that the image is already an ideal, not merely that the ideal generated by
  it exists. Uses §1.12, `Ideal.Quotient.mk_surjective`, `Ideal.Quotient.eq`, `Ideal.quotientMap_mk`. Take a
  compatible pair (b,α) in the native pullback and choose a representative a of α. Compatibility says
  b−f(a)∈J. The image-ideal condition supplies i∈I with f(i)=b−f(a). Then a+i maps to (b,α); replacing a by
  a+i does not alter its class modulo I. No finiteness or injectivity of f is used.

- For an arbitrary subring A⊂B of a commutative ring B,
  let J=c(A,B) be the general conductor and I=J∩A. Then A→B, A→A/I, B→B/J, A/I→B/J is cartesian in commutative rings. Finiteness,
  birationality, reducedness and Noetherianity are unnecessary for this affine identity. Uses §1.2, §1.12,
  `Ideal.map_comap_le`, `Ideal.quotientMap`, §1.22. The conductor is an ideal of B contained in A. For the
  inclusion f:A→B every element of J is the image of its subtype in I; hence f(I)=J and `map_f(I)=J`. Use the
  native map/comap inclusion for the reverse ideal bound. The inclusion has zero kernel, so ker(f)∩I=0. Apply
  the common-ideal cartesian criterion and identify the quotient map with the native induced map to B/J. The
  geometric conductor square of §1.7 separately uses finite affine pinching and localization/gluing
  under its stated hypotheses. This affine identity alone does not supply global algebraic-space existence.

- For arbitrary commutative rings A,B, a unital f:A→B
  and I⊂A with `map_f(I)=f(I)` as sets, the actual comparison `c:A→B×_(B/map_f(I))(A/I)` is bijective exactly when
  ker(f)∩I=0. No finiteness, injectivity of f, reducedness or Noetherian hypothesis is imposed. Uses §1.12,
  `RingHom.injective_iff_ker_eq_bot`. Use the surjectivity of κ(f,I) for surjectivity. Use the native ring-hom
  injectivity criterion and the already computed comparison kernel for both directions.

- For arbitrary commutative rings A,B,C and an actual A-algebra
  equivalence e:B≃ₐ[A]C, the contractions to A of c(im(A→B),B) and c(im(A→C),C) are equal as full A-ideals.
  The structure maps need not be injective or finite. Uses §1.2, `AlgEquiv.commutes`. Membership means every
  product of the scalar image with an ambient element lies in the scalar image. Lift an arbitrary C-element
  through e and transport that equation using multiplicativity and coefficient compatibility. Apply the same
  argument to e⁻¹ for the reverse implication. No replacement by a radical, support or abstract ring
  equivalence is valid.

**Checks.**

- For `f=id_A` and any I, the canonical comparison is bijective.

- For arbitrary f and I=0, the canonical comparison is bijective.

- For f:Z→Z/2 and I=ker f, the comparison sends 2 and 0 to the same element, although 2≠0. Thus having an
  ideal image alone does not make it an isomorphism.

- For the diagonal map F₂→F₂×F₂ and I=F₂, the kernel intersection is zero but the comparison is not
  surjective. Its image is the diagonal two-element subring, while the ideal generated by it is all four
  elements. The image-ideal hypothesis is therefore necessary for the stated lifting criterion.

- The non-injective Z→Z/2 example with I=ker f fails the criterion; I=0 succeeds.

*Needs:* `CommRingCat.pullbackCone`; `CommRingCat.pullbackConeIsLimit`; `Ideal.quotientMap`;
`Ideal.quotientMap_mk`; `Ideal.le_comap_map`; `Ideal.mk_ker`; `Ideal.Quotient.mk_surjective`;
`Ideal.Quotient.eq`; `RingHom.injective_iff_ker_eq_bot`; `RingEquiv.ofBijective`;
`RingEquiv.toCommRingCatIso`; `CategoryTheory.Limits.Types.ext_of_isPullback`;
`CategoryTheory.IsPullback.map`; `CategoryTheory.IsPullback.of_iso'`.

### 1.13 conductor as the annihilator of the quotient

For any A-algebra B, identify the contracted conductor of im(A→B) with `Ann_A(B/(A·1))`. This is an equality of
full ideals for the actual coefficient map, including maps with kernel. Unpack scalar multiplication on
quotient classes; no domain or finite-module hypothesis is used in this identity.

The native submodule A·1 is exactly im f, since a·1=f(a). A scalar a annihilates M exactly when f(a)b belongs
to im f for every b∈B. Use the native quotient-zero criterion and native module annihilator; this is precisely
membership in the preimage of the subring conductor.

([Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Introduction, printed p554, conductor
described as the annihilator of A′/A.)

**Checks.**

- For ℤ→F₂ the quotient-module annihilator is the unit ideal even though the structure map has nonzero kernel.
  Injectivity is not a hidden hypothesis of the §1.13 identity.

- For the identity algebra of ℤ/4 the contracted conductor is the unit ideal, while2 is a nonzero element with
  square0; the identity retains the nonreduced case.

- The identity inclusion gives the unit ideal and a zero quotient module.

- A proper field extension has zero conductor, although it is finite and need not be birational.

*Needs:* §1.2; `Module.annihilator`; `Module.mem_annihilator`; `Submodule.Quotient.mk_eq_zero`;
`Submodule.mem_span_singleton`.

### 1.14 recomputing a conductor after flat scalar extension

For a finite injective A→B and flat A-algebra F, prove injectivity of `F→B⊗_A F` and equality between the
extended contracted conductor and the conductor recomputed from that map. Use the finite quotient module
B/(A·1), its actual tensor quotient comparison and the finite-module flat-annihilator theorem. Neither
F-reducedness nor noetherianity is needed.

Apply native flat tensor injectivity to A→B, identifying `A⊗_A F` with F; this gives the actual inclusion `f_F`.
Native flat exactness identifies `(B/(A·1))⊗_A F` with `B_F/(F·1)`. The quotient is a finite A-module because B is
finite. Invoke SchemeAndStackFoundations SF.0, flat-annihilator for the finite quotient module B/A. This
contract allows arbitrary commutative bases and independent scalar-extension universes and requires only
finiteness of the module and flatness of the scalar algebra. Transport both annihilators through
§1.13.

([Stacks, tag 07T8](https://stacks.math.columbia.edu/tag/07T8), Lemma10.40.4;
[Witaszek](https://par.nsf.gov/servlets/purl/10429755), Definition2.27, printed pp674–675; affine conductor
description and finite-surjective reduced-scheme hypotheses.)

**Checks.**

- A[ε]/(ε²) is free over A, so the recomputed conductor is I⊕εI; nilpotents in a flat target are allowed.

- For A=k[t²,t³]⊂B=k[t] and F=A/(t²), the class of t³ is nonzero in F and maps to zero in `B⊗_A F=k[t]/(t²)`.
  Thus the native inclusion premise fails for this nonflat quotient.

*Needs:* §1.13; `Module.Finite`; `Module.Flat.lTensor_exact`;
`Module.Flat.lTensor_preserves_injective_linearMap`; `Algebra.TensorProduct.includeRight`; §1.35;
SchemeAndStackFoundations SF.0, flat-annihilator; §1.37.

### 1.15 conductor localization with a common denominator

For a finite injection A→B and S⊂A, identify the localization of the contracted conductor with the conductor
of the actual map S⁻¹A→f(S)⁻¹B. Give the finite-generator common-denominator proof as well as the flat-tensor
proof. Denominators may be zero divisors or nilpotents, and the localization may be zero.

Localization is a flat scalar extension by the pinned IsLocalization.flat theorem. Alternatively combine
§1.14 with the canonical tensor/localization comparison. The direct proof below
uses the recomputed localization statement of §1.24 and its native representative equations, so it does not require a
independently assumed annihilator theorem. The finite-generation argument is essential: for generators
b₁,…,bₙ of B/A, clear the finitely many denominators annihilating the bᵢ and multiply them to obtain one
element of S. No domain cancellation or localization-injectivity assumption is used. The conductor-specific
finite-generator and common-denominator lemmas prove the quantifier swap and native membership in the extended
conductor. The recomputed localized-B conductor and native sheaf restriction comparison remain separate
required identifications. The global conductor IdealSheafData still needs identification of the actual affine
section restriction with this localized map, followed by native chart/restriction coherence. The present ring
equality is not a sheaf-restriction theorem.

([Stacks, tag 07T8](https://stacks.math.columbia.edu/tag/07T8), Lemma10.40.4;
[Witaszek](https://par.nsf.gov/servlets/purl/10429755), Definition2.27, printed pp674–675; affine conductor
description and finite-surjective reduced-scheme hypotheses.)

**Checks.**

- For F₂→F₂×F₂ diagonally, the single element 1 passes the coefficient-1 multiplication test, but coefficient1
  is not in the conductor. The omitted span=top hypothesis would therefore give a false criterion.

- For the diagonal Z/4-algebra Z/4×Z/4, coefficient2 is not in the conductor, but denominator2 lies in its
  powers monoid and sends coefficient2 to zero in the conductor. Clearing denominators may use nilpotents.

- For the actual ℤ-algebra Z/1 the empty Fin0 family spans the zero module and every integer belongs to the
  contracted conductor; injectivity of the original coefficient map is not assumed.

- For every field k and the actual cusp subalgebra A=k+X²k[X], every a∈A gives a native fraction a/1 in the
  extended conductor after inverting the actual element X²∈A. Use the existing spanning family {1,X} and
  denominatorX².

- For arbitrary actual localization carriers, the product `f_S(a/t)·b` lies in the localized coefficient image
  exactly when some s∈S satisfies f(sa)b∈im f. This checks the actual numerator and denominator transport.

- For the actual noninjective coefficient map ℤ→Z/1, localizing at powers of2 gives equality of the extended
  and recomputed contracted conductors using the empty spanning family.

- For the diagonal Z/4-algebra Z/4×Z/4, coefficient2 is not in the original conductor; after localizing at
  powers of2 the extended and recomputed conductors agree and the recomputed ideal is the unit ideal of the
  actual zero localization.

- For every field k and the actual cusp subalgebra A=k+X²k[X], invert its actual element X². The extended
  conductor agrees with the conductor recomputed along the actual localized inclusion, and the recomputed
  conductor is the unit ideal. It uses the normalization spanning family{1,X}.

- Localizing the cusp inclusion at t² kills its quotient B/A and gives the unit conductor.

- Localizing at a nilpotent may give the zero ring; the formula still holds.

- Keep the native localized map, rather than identifying two unrelated ring types.

*Needs:* §1.14; `IsLocalization.flat`; `IsLocalization.map`; `IsLocalization.map_mk'`;
`IsLocalization.map_injective_of_injective`; `Module.Finite.exists_fin`; §1.24; §1.25;
`IsLocalization.uniqueOfZeroMem`; `Ideal.eq_top_iff_one`; `IsLocalization.mk'_one`; `Submonoid.mem_powers`.

### 1.16 the global conductor ideal-sheaf datum

For finite schematically dominant f:Y→P, construct the conductor ideal sheaf I_f in the native ideal-sheaf carrier.
On an affine U its ideal is the contraction of `c(im f_U,Γ(Y,f⁻¹U))` along the actual section map `f_U`. Establish
basic-open compatibility before applying `ofIdeals`, and prove that construction preserves each prescribed
ideal. Its closed subscheme `C_f` is defined by this full ideal.

Use the pinned IsFinite and Scheme.Hom.app_injective statements to obtain the chartwise finite inclusions.
Apply §1.15 to the section of any principal affine open. The structure-sheaf
localization comparisons identify the resulting maps with restrictions. Build the native IdealSheafData with
these ideals and restriction identities. Equivalently use its native ofIdeals constructor and prove that its
chart ideals equal the displayed family; taking the largest compatible subfamily is not silently assumed to
preserve arbitrary input ideals. Use the native subscheme/subschemeι constructors for `C_f`. They already supply
closedness and the section-ring quotient comparisons.

([Witaszek](https://par.nsf.gov/servlets/purl/10429755), Definition2.27, printed pp674–675; affine conductor
description and finite-surjective reduced-scheme hypotheses; [Stacks, tag
07T8](https://stacks.math.columbia.edu/tag/07T8), Lemma 10.40.4, proof; [Stacks, tag
0DJB](https://stacks.math.columbia.edu/tag/0DJB), Lemma 53.10.5, conductor paragraph;
[Stacks, tag 0ET0](https://stacks.math.columbia.edu/tag/0ET0), Lemma 37.14.1.)

Standing hypotheses for the maps and laws below: All ring carriers are commutative rings, including zero rings
and rings with nilpotents. The actual maps and each finiteness or dominance assumption are exactly those
stated; no replacement by a radical or underlying support is permitted. Rings are arbitrary commutative rings,
including zero rings; no reducedness, Noetherianity or birationality is imposed. Finiteness, schematic
dominance, flatness and affineness are required exactly where stated. The actual full conductor ideals and
native closed-subscheme carriers are used. Generic quotient, section and pullback theories remain imported.

The construction needs the following maps and laws.

- For an affine U⊂P, `a∈I_f(U)` exactly when `f_U(a)b` lies in `im f_U` for every
  b∈Γ(Y,f⁻¹U).

- For an ideal-sheaf datum K on P, `K≤I_f` exactly when for every affine U and
  a∈K(U), `f_U(a)Γ(Y,f⁻¹U)⊂im f_U`.

- If P is affine, `I_f` is the native ofIdealTop of `f_top⁻¹(c(im f_top,Γ(Y,⊤)))`; the quotient subscheme is the existing ideal-sheaf subscheme.

- For every finite schematically dominant f:Y→P and affine U⊂P,
  the affine ideal of I_f equals the full conductor of im(f.app U) in
  Γ(Y,f⁻¹U), contracted along the actual f.app U. The ofIdeals construction loses none of the prescribed
  ideals. Uses §1.16, `AlgebraicGeometry.Scheme.IdealSheafData.ofIdeals_ideal`. Build an anonymous native
  IdealSheafData from the same family using the proved basic-open identity. Apply native ofIdeals_ideal to
  this compatible family and evaluate its U-component. This establishes the existing membership,
  greatest-ideal and affine ofIdealTop APIs without changing their statements.

- For finite schematically dominant f and affine opens U⊆V in
  P, the ideal map along the actual presheaf restriction Γ(P,V)→Γ(P,U) sends the contracted conductor on V to
  the recomputed contracted conductor on U. Uses §1.16, `AlgebraicGeometry.Scheme.IdealSheafData.map_ideal`.
  Apply native IdealSheafData.map_ideal to the existing conductor datum and rewrite both actual components
  with the affine-ideal formula above.

- For finite schematically dominant f, affine U⊆V and
  `a∈I_f(V)`, the actual restriction of a to U belongs to `I_f(U)`. Uses §1.16,
  `AlgebraicGeometry.Scheme.IdealSheafData.ideal_le_comap_ideal`. Apply the native ideal_le_comap_ideal law to
  the actual conductor sheaf datum. This is a statement about its actual section restriction.

- For finite schematically dominant f and affine U⊆V⊆W,
  extending the conductor on W successively along Γ(P,W)→Γ(P,V)→Γ(P,U) equals its extension along the direct
  Γ(P,W)→Γ(P,U) restriction. Uses §1.16. Use ideal-map composition, the actual CommRingCat hom composition and
  the native presheaf functor composition law. The opens and restriction maps are the same ones as in the
  component theorem.

- For every scheme P, including the empty scheme, the conductor
  ideal-sheaf datum of `id_P` is the unit ideal datum. Its native closed subscheme is therefore empty. Uses
  §1.16. Compare all affine components. The actual section map of `id_P` is an isomorphism, hence has full
  range. Its conductor and its contraction are the unit ideal. The empty-subscheme conclusion in the typed
  test uses the existing native top-ideal instance.

- For f:A→B between actual CommRingCat objects with finite
  schematically dominant Spec.map f, the top affine ideal of the conductor ideal sheaf of Spec.map f equals the comap
  under the actual ΓSpecIso A hom of the conductor of im(f) in B contracted along f. Uses §1.16,
  `AlgebraicGeometry.Scheme.ΓSpecIso_naturality`. Rewrite the actual top component. Transport the codomain
  along ΓSpecIso B, apply the native naturality equality for the section map, then transport the domain along
  ΓSpecIso A. This records the canonical ring comparison rather than an unspecified affine identification.

- For finite schematically dominant f and affine U,
  set A=Γ(P,U), B=Γ(Y,f⁻¹U) with its actual f.app U algebra structure. Then `I_f(U)=Ann_A(B/span_A{1})` as full
  A-ideals. This is the quotient of affine section modules; no sheaf-cokernel construction or structure-sheaf
  exact sequence is asserted. Uses §1.16, §1.13. Rewrite the component using the affine-ideal formula and
  apply the existing annihilator description of §1.13 to the actual section algebra. Keep its full ideal, including
  nilpotents, and its native quotient module.

- For every ring map f:A→B and ring equivalence e:B≃C between
  commutative rings, the conductor contracted to A along f equals that contracted along e∘f. No injectivity or
  finiteness assumption is needed. Uses §1.12. Equip B and C with the actual f and e∘f algebra structures. The
  ring equivalence becomes an A-algebra equivalence; apply the existing contracted-conductor
  algebra-equivalence theorem.

- For every finite ring map f:A→B and r∈A, and actual away
  localizations L=A[1/r], M=B[1/f(r)], extending the contracted conductor along A→L gives the conductor
  contracted along the actual native Away.map L M f r. No injectivity, reducedness or nonzero-localization
  assumption is made. Uses §1.25. Apply the finite-algebra recomputation theorem to powers(r). Identify the
  image submonoid with powers(f(r)) and identify the actual localized ring map with Away.map by localization
  extensionality.

- For any finite scheme morphism f:Y→P, affine open U⊂P and section
  r∈Γ(P,U), extending the contracted conductor of the actual f.app U along the actual restriction
  Γ(P,U)→Γ(P,D(r)) gives exactly the contracted conductor of f.app D(r). Scheme-theoretic dominance is not
  needed. Uses §1.16, `AlgebraicGeometry.IsAffineOpen.app_basicOpen_eq_away_map`,
  `AlgebraicGeometry.Scheme.Hom.finite_app`, `AlgebraicGeometry.IsAffineOpen.preimage`. Finiteness makes the
  source chart affine and its section map finite. Use the two actual basic-open localization structures. The
  pinned app_basicOpen_eq_away_map theorem compares the actual restriction map with Away.map followed by the
  source-open identification. Transport the contracted conductor across that codomain ring equivalence.

- For commutative rings A,B,C, a ring map f:B→C and a ring
  equivalence e:A≃B, the conductor contracted along f∘e equals the comap under e of the conductor contracted
  along f. No finiteness or injectivity assumption on f is used. Uses §1.2. Expand conductor membership and
  transport the witnesses in the source image using e and e⁻¹. Multiplication takes place in the actual ring
  C.

- For every commutative ring R in any universe, the actual
  morphism Spec(R×R)→Spec(R) induced by a↦(a,a) is finite. All schemes in a statement share an arbitrary
  universe. Uses `AlgebraicGeometry.IsFinite.SpecMap_iff`, `RingHom.Finite`, `Module.Finite.prod`. Use the
  native SpecMap criterion and the product finite-module instance. The algebra structure induced by the
  diagonal is the native coordinatewise R-module structure.

- For every commutative ring R, including the
  zero ring and nonreduced rings, the actual diagonal Spec(R×R)→Spec(R) is schematically dominant. All schemes
  in a statement share an arbitrary universe. Uses `AlgebraicGeometry.IsSchemeTheoreticallyDominant`,
  `AlgebraicGeometry.Scheme.ΓSpecIso_naturality`, `AlgebraicGeometry.Scheme.ΓSpecIso`,
  `AlgebraicGeometry.Scheme.ker_of_isAffine`, `AlgebraicGeometry.Scheme.IdealSheafData.ext`,
  `RingHom.injective_iff_ker_eq_bot`. The diagonal ring homomorphism is injective by its first coordinate.
  Native global-section naturality transports injectivity to the actual scheme map. Its affine ideal-sheaf
  kernel is zero by the native injective-kernel criterion.

- For every commutative ring R and diagonal d:R→R×R, the
  full conductor of im(d) contracted along d is the zero ideal of R. All schemes in a statement share an
  arbitrary universe. Uses §1.2. If a lies in the contracted conductor, d(a)(1,0) lies in im(d). Its
  coordinates force its diagonal preimage to be both a and zero. The reverse containment is automatic. This
  does not replace the zero ideal by its radical.

- For R a commutative ring, the global affine ideal of the
  actual conductor ideal sheaf of the diagonal Spec(R×R)→Spec(R) is zero, for its finite and schematically
  dominant instances. All schemes in a statement share an arbitrary universe. Uses §1.16,
  `AlgebraicGeometry.Scheme.ΓSpecIso`, `RingHom.injective_iff_ker_eq_bot`. The retained Spec comparison
  expresses this ideal as contraction of the ring conductor along the actual ΓSpecIso. Apply the diagonal
  computation and injectivity of that native section isomorphism.

- For every commutative ring R, the actual full
  conductor ideal-sheaf datum of Spec(R×R)→Spec(R) is the bottom ideal-sheaf datum. All schemes in a statement
  share an arbitrary universe. Uses §1.16, `AlgebraicGeometry.Scheme.IdealSheafData.ext_of_isAffine`. Apply
  native affine ideal-sheaf extensionality to the zero global affine ideal. Thus the conductor subscheme
  retains the full target scheme structure, including nilpotents.

- Let f:Y→P be finite and schematically dominant with P affine.
  If a in Γ(P,top) is outside the full conductor ideal and `a^n=0` for a natural number n, the actual conductor
  closed subscheme has a section z with z≠0 and `z^n=0`. All schemes in a statement share an arbitrary universe.
  Uses §1.16, `AlgebraicGeometry.Scheme.IdealSheafData.subschemeObjIso`, `Ideal.Quotient.eq_zero_iff_mem`. The
  quotient class of a is nonzero by the native quotient membership criterion and has vanishing nth power.
  Transport it along the inverse of the native subschemeObjIso at the top affine open. The native quotient and
  section isomorphism remain imported.

**Checks.**

- For `f=id_P` the conductor ideal-sheaf datum is the unit ideal, so its closed subscheme is empty.

- For Spec k[t]→Spec k[t²,t³], the target conductor is (t²,t³) and its extended ideal in k[t] is (t²); retain
  the double-point overlap.

- For a nontrivial finite field extension E/k the conductor ideal sheaf on Spec k is zero, so the conductor
  subschemes are the whole source and target; it is not the normalization-isomorphism case.

- On an affine scheme the construction agrees with the pinned IdealSheafData.ofIdealTop under its native
  global-section comparison.

- For every scheme P, the actual identity conductor equals top and its native closed subscheme is empty.

- For finite schematically dominant f, the actual conductor ideal on the empty affine open is the unit ideal
  of its zero section ring.

- For any finite scheme morphism and affine U, extending its actual contracted conductor to D(0) yields the
  unit ideal in the zero section ring; no dominance hypothesis is used.

- A section in the actual conductor on W stays in the conductor on U after the actual restrictions W→V→U.

- For a finite schematically dominant Spec.map f, the section corresponding to a∈A under the actual ΓSpecIso
  belongs to the conductor exactly when f(a) belongs to the ring conductor.

- For the actual diagonal Z/4→Z/4×Z/4, prove its Spec map finite and schematically dominant, and prove that
  the section corresponding to2 is not in its conductor. The proof retains the nonreduced rings and does not
  assume those morphism instances.

- Extension of an affine conductor along the actual section map to the empty open equals the whole ideal of
  the zero section ring.

- The full contracted diagonal conductor is zero for a commutative ring in an arbitrary universe, without a
  nontriviality assumption.

- For R=Z, derive the actual diagonal morphism hypotheses and prove its full conductor ideal-sheaf datum is
  zero.

- For R=Z/1, derive finiteness and schematic dominance of the actual diagonal and prove its full conductor
  ideal-sheaf datum is zero; no point-existence assumption is made.

*Needs:* §1.15; `AlgebraicGeometry.Scheme.IdealSheafData`; `AlgebraicGeometry.Scheme.IdealSheafData.ofIdeals`;
`AlgebraicGeometry.Scheme.IdealSheafData.ofIdeals_ideal`; `AlgebraicGeometry.Scheme.IdealSheafData.subscheme`;
`AlgebraicGeometry.Scheme.IdealSheafData.subschemeι`; `AlgebraicGeometry.Scheme.Hom.app_injective`;
`AlgebraicGeometry.IsSchemeTheoreticallyDominant`; `AlgebraicGeometry.IsFinite`.

### 1.17 the canonical map between conductor subschemes

Put I=I_f, J=I.comap f, `C_f=I.subscheme` and `D_f=J.subscheme`. Construct the conductor map
`g_f:D_f→C_f` by the native subscheme map. Its square with f and the two closed inclusions is cartesian; it is
finite, since it is a base change of f. On every affine chart compare this precise map with A/I(U)→B/c(im
`f_U,B`). Include the equality `J(f⁻¹U)=c(im f_U,B)`, not just an inclusion of ideals.

([Witaszek](https://par.nsf.gov/servlets/purl/10429755), Definition2.27, printed pp674–675; affine conductor
description and finite-surjective reduced-scheme hypotheses;
[Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Introduction, printed p554; Lemma1.3 pp556–557
and Theorem5.1/proof pp568–569; [Stacks, tag 0C6L](https://stacks.math.columbia.edu/tag/0C6L), Stacks
Lemma53.10.5 full proof and Example53.10.6; [Stacks, tag 0ET0](https://stacks.math.columbia.edu/tag/0ET0),
Stacks 0ET0; [Stacks, tag 0C6L](https://stacks.math.columbia.edu/tag/0C6L), Stacks 0C6L.)

Standing hypotheses for the maps and laws below: Exactly the finiteness, schematic dominance, affineness,
isomorphism or zero-conductor hypotheses stated above. All scheme and commutative-ring carriers, including
empty schemes, zero rings and nilpotents, are native. Exactly the finiteness, schematic dominance, affine-open
and coordinate-isomorphism hypotheses in the statement; retain zero rings, empty opens and nilpotents. Finite
and schematically dominant f; affine U only where expressly stated; preserve the full conductor ideals and
actual native section rings.

The construction needs the following maps and laws.

- Let f:Y→P be finite and schematically dominant, `I=I_f`, J=I.comap f,
  C=I.subscheme and D=J.subscheme. For every affine U⊂P set A=Γ(P,U), B=Γ(Y,f⁻¹U), `f_U:A→B` and `K=c(im f_U,B)`.
  Then `I(U)=f_U⁻¹K`, J(f⁻¹U)=K, and the native quotient-chart identifications give Γ(C,C→P⁻¹U)≅A/I(U) and
  Γ(D,D→Y⁻¹f⁻¹U)≅B/K, compatibly with the actual inclusion and quotient maps. Uses §1.16, §1.12,
  `AlgebraicGeometry.Scheme.IdealSheafData.comap`, `AlgebraicGeometry.Scheme.IdealSheafData.comapIso`,
  `AlgebraicGeometry.Scheme.IdealSheafData.subschemeObjIso`,
  `AlgebraicGeometry.Scheme.IdealSheafData.subschemeι_app`, §1.17. I(U) is the chart ideal of §1.16. The
  common ideal K is contained in `im f_U`; consequently its inverse image extends back to K, by elementwise
  lifting. Compute the source ideal on affine charts from the existing pullback ideal datum. The direct native
  adjunction/open-restriction argument below, using the exact supplier ideal-comap-top and ideal-restrict-top
  exports through the chart formula for the source ideal, identifies it with the full ambient conductor;
  no separate generic tensor-quotient theorem is required by this proof. Apply the native subschemeObjIso and
  subschemeι_app statements to both ideal-sheaf data. Transport their ring maps, not just their abstract
  quotient types.

- The actual induced map `g_f:D_f→C_f` satisfies `i_f∘f=g_f∘j_f` in categorical composition
  order `i_f≫f=g_f≫j_f`.

- The induced square is the native cartesian square supplied by
  IdealSheafData.comapIso; all maps agree with its projections.

- The induced map `D_f→C_f` is finite because it is the base change of the finite
  morphism f.

- For every finite schematically dominant scheme map f:Y→P, the
  existing g_f equals the native subschemeMap from the pulled-back conductor ideal `J=I_f.comap f` to
  `I_f`, with the actual adjunction inequality `I_f≤J.map f`. Uses §1.17,
  `AlgebraicGeometry.Scheme.IdealSheafData.subschemeMap`,
  `AlgebraicGeometry.Scheme.IdealSheafData.comapIso_hom_snd`,
  `AlgebraicGeometry.Scheme.IdealSheafData.le_map_comap`. Apply the exact pinned comapIso_hom_snd equation to
  `I_f` and f; its composite is the unchanged conductor map definition.

- For finite schematically dominant f and any actual
  `g:J.subscheme→I_f.subscheme` satisfying g followed by the target closed inclusion equals the source closed
  inclusion followed by f, g equals g_f. Uses §1.17. Cancel the native target closed immersion,
  which is a monomorphism, and use the cartesian square of §1.17. No extra universal-property
  field is assumed.

- For finite schematically dominant f and every open U⊂P, the inverse
  image under g_f of `j_f⁻¹U` equals `i_f⁻¹(f⁻¹U)`, as native opens of J.subscheme. Uses §1.17. Apply
  inverse image of the actual open U to the cartesian square of §1.17. The equality holds for every
  open, including the empty open.

- For any scheme isomorphism f:Y→P, the actual g_f is
  an isomorphism. Its finite and schematically dominant instances are the existing native ones. Uses §1.17,
  `CategoryTheory.IsPullback.isIso_snd_of_isIso`. Use the cartesian property of §1.17 and native
  stability of isomorphisms under pullback. This includes the identity and empty schemes.

- For finite schematically dominant f with `I_f=0` as a full
  native ideal-sheaf datum, g_f is an isomorphism if and only if f is. No reducedness, Noetherian,
  birationality or field assumption is needed. Uses §1.17,
  `AlgebraicGeometry.Scheme.isIso_subschemeι_iff_eq_bot`, `AlgebraicGeometry.Scheme.IdealSheafData.comap_bot`,
  `CategoryTheory.isIso_comp_left_iff`, `CategoryTheory.IsIso.of_isIso_comp_left`. The zero-ideal closed
  inclusion is an isomorphism on both sides, because comap sends zero to zero. Apply the cartesian square of §1.17
  equation and cancel these native isomorphisms; the generated dual of the pinned isIso_comp_left_iff supplies
  the other cancellation.

- For finite schematically dominant f and every open U⊂P, `j_f.app U`
  followed by the conductor chart map f U equals f.app U followed by `i_f.app(f⁻¹U)`. All four maps are the actual
  native section maps. Uses §1.17, `AlgebraicGeometry.Scheme.Hom.comp_appLE`. Rewrite the two composites
  through the native appLE composition law, then apply the cartesian square of §1.17. This
  commutation law does not assert exactness of a structure-sheaf sequence.

- For finite schematically dominant f and arbitrary opens U⊆V of
  P, restricting target-conductor sections from `j_f⁻¹V` to `j_f⁻¹U` then applying the conductor chart map at U equals
  applying it at V then restricting source-conductor sections from `i_f⁻¹f⁻¹V` to `i_f⁻¹f⁻¹U`. Both restrictions
  are the actual native presheaf maps. Uses §1.17, `AlgebraicGeometry.Scheme.Hom.map_appLE`,
  `AlgebraicGeometry.Scheme.Hom.appLE_map`. Apply the pinned map_appLE and appLE_map naturality laws to the
  actual maps and inverse-image inclusions. Both expressions become the same appLE with the same source and
  target opens.

- For finite schematically dominant f, affine U and any actual
  section x of `I_f.subscheme` over `j_f⁻¹U`, the native source-conductor chart coordinate of the conductor chart map f
  U(x) is conductor quotient map f U applied to the native target-conductor chart coordinate of x. Uses §1.17.
  Evaluate the equality of the actual CommRingCat composites in the chart map on quotients at x.

- For finite schematically dominant f and every open U⊂P, define the
  actual CommRingCat map `Γ(I_f.subscheme,j_f⁻¹U)→Γ(J.subscheme,i_f⁻¹f⁻¹U)` by g_f.appLE, using
  the preimage formula of §1.17 to identify the source open. Affineness is not required for this construction. Uses
  §1.17, `AlgebraicGeometry.Scheme.Hom.appLE`. Use the actual section map of g_f and the proved
  inverse-image equality. The result has the exact native section-ring carriers used by the quotient charts;
  it is not a map between unspecified isomorphic rings.

- For finite schematically dominant f, affine U⊂P and V=f⁻¹U, the
  actual section map `f_U:Γ(P,U)→Γ(Y,V)` sends `I_f(U)` into J(V), where `J=I_f.comap f` is the native pulled-back
  ideal datum. This does not yet identify J(V) with the ambient conductor of `im(f_U)`. Uses §1.16,
  `AlgebraicGeometry.Scheme.IdealSheafData.le_map_comap`,
  `AlgebraicGeometry.Scheme.IdealSheafData.ideal_map_of_isAffineHom`. Evaluate the native adjunction
  inequality `I_f≤J.map f` on U. Finiteness makes f affine; apply ideal_map_of_isAffineHom to identify the
  right-hand component with the actual contracted J(V).

- For finite schematically dominant f, affine U and a∈Γ(P,U),
  conductor quotient map f U sends the actual quotient class of a modulo `I_f(U)` to the actual quotient class of
  f.app U(a) modulo J(f⁻¹U). Uses §1.17, `Ideal.quotientMap_mk`. Use the native quotientMap_mk evaluation law
  with the exact ideals and actual section map.

- For finite schematically dominant f and affine U,
  conductor quotient map f U composed with the actual source quotient map equals the actual target quotient map
  composed with f.app U, as RingHom maps. Uses §1.17, `Ideal.quotientMap_comp_mk`. Apply the native
  quotientMap_comp_mk equation to the exact chart ideal containment witness.

- For finite schematically dominant f and affine U,
  the conductor chart map f U followed by the actual source-conductor subschemeObjIso hom equals the actual
  target-conductor subschemeObjIso hom followed by conductor quotient map f U, as CommRingCat maps. The two
  canonical identifications use the native closed subschemes of `I_f` and J. Uses §1.17,
  `AlgebraicGeometry.Scheme.IdealSheafData.subschemeObjIso`,
  `AlgebraicGeometry.Scheme.IdealSheafData.subschemeι_app`,
  `AlgebraicGeometry.Scheme.IdealSheafData.subschemeι_app_surjective`,
  `CategoryTheory.ConcreteCategory.epi_of_surjective`. Cancel the actual target inclusion section map, which
  is surjective on this affine open. Apply the chart-map commutation law, rewrite both inclusion maps using the exact
  subschemeι_app formulas, cancel the two actual chart isomorphisms, and evaluate the native quotient map on a
  representative.

- For finite schematically dominant f, affine U⊂P and V=f⁻¹U, define
  the native induced ring map `Γ(P,U)/I_f(U)→Γ(Y,V)/J(V)` using Ideal.quotientMap and the proved
  chart ideal containment inequality, with `J=I_f.comap f`. Retain the full ideals and nilpotents. Uses §1.17,
  `Ideal.quotientMap`. Apply the existing native quotientMap to the actual f.app U ring map. This construction
  keeps J(V) as the actual pullback ideal; the further equality `J(V)=c(im(f_U),Γ(Y,V))` remains a separate
  required comparison.

- For a finite schematically dominant f:Y→P and affine U⊂P, put
  V=f⁻¹U and K=c(im(f.app U),Γ(Y,V)). Then K is contained in the actual component (`I_f.comap` f)(V), with its
  full ideal structure. Uses §1.17, §1.16. Every element of K lies in the image of f.app U. Choose a preimage,
  identify its membership in `I_f(U)`, and apply chart ideal containment. This uses no radical or reducedness.

- For finite schematically dominant f:Y→P with P and Y affine,
  the top component of `I_f.comap f` equals the ambient conductor of f.appTop. The statement keeps the native
  section rings and actual pullback ideal datum. Uses §1.17, §1.16,
  `AlgebraicGeometry.Scheme.IdealSheafData.ofIdealTop`,
  `AlgebraicGeometry.Scheme.IdealSheafData.le_of_isAffine`,
  `AlgebraicGeometry.Scheme.IdealSheafData.le_map_iff_comap_le`,
  `AlgebraicGeometry.Scheme.IdealSheafData.ideal_map_of_isAffineHom`. Let K̃ be the native ideal datum induced
  by the ambient conductor K. On the affine target, the exact component formula gives `I_f≤K̃.map f`. The pinned
  comap/map adjunction gives `I_f.comap f≤K̃`; compare global components and combine with the opposite
  inclusion. No tensor-quotient theorem is assumed.

- For finite schematically dominant f:Y→P and any open U⊂P, the
  conductor ideal datum of the actual restricted morphism f|U equals `I_f.comap` U.ι on the open subscheme U.
  This holds for nonaffine and empty U. Uses §1.16,
  `AlgebraicGeometry.Scheme.IdealSheafData.ideal_comap_of_isOpenImmersion`,
  `AlgebraicGeometry.morphismRestrict_app`, `AlgebraicGeometry.IsSchemeTheoreticallyDominant.of_isPullback`,
  `AlgebraicGeometry.isPullback_morphismRestrict`. Native flat base change supplies schematic dominance of
  f|U. Evaluate both ideal data on every affine open V of U; the open-immersion component formula has the
  identity appIso. The restricted section map differs from f.app(U.ι(V)) only by the native equality-of-opens
  section isomorphism. Apply the previously proved conductor_postcomposition comparison.

- For finite schematically dominant f and every open U,
  restrict `I_f.comap f` along (f⁻¹U).ι. The resulting full ideal datum equals `I_(f|U).comap(f|U)`. Uses §1.17,
  `AlgebraicGeometry.Scheme.IdealSheafData.comap_comp`, `AlgebraicGeometry.morphismRestrict_ι`. Substitute
  the restriction formula for I_f, combine the two comaps using the native composition law, and apply the
  commuting square for the actual restricted scheme map.

- For arbitrary commutative rings, f:A→B, eA:C≃A and eB:D≃B, the
  ambient conductor of eB⁻¹∘f∘eA is exactly the inverse image under eB of the conductor of im f in B. Zero
  rings and nilpotents are retained. Uses §1.12. Use the native conductor membership condition ∀y,dy∈im(f). In
  one direction test eB⁻¹(b), choose the preimage under the conjugate map, and apply eB. In the other
  direction test eB(y), choose a preimage under f and pull it back by eA⁻¹. Both identities follow from
  multiplicativity and the two inverse laws.

- For finite schematically dominant f and affine U,
  with V=f⁻¹U and `J=I_f.comap f`, the top component of J.comap V.ι equals the contraction of J(V) along the
  actual native topIso hom Γ(V,top)→Γ(Y,V). Uses §1.16,
  `AlgebraicGeometry.Scheme.IdealSheafData.ideal_comap_of_isOpenImmersion`,
  `AlgebraicGeometry.Scheme.Opens.topIso`, `AlgebraicGeometry.Scheme.Opens.ι_appIso`,
  `AlgebraicGeometry.Scheme.Opens.ι_image_top`. Apply the native open-immersion component formula and its
  identity appIso. The remaining equality is transport of the actual ideal component along V.ι(top)=V; prove
  it by equality induction on affine opens. This records the precise section-ring coordinate map.

- For finite schematically dominant f:Y→P and every affine U⊂P,
  the exact full ideal `(I_f.comap f)(f⁻¹U)` equals c(im(f.app U),Γ(Y,f⁻¹U)). Neither P nor Y is assumed
  globally affine, Noetherian or reduced. Uses §1.17, `Ideal.comap_injective_of_surjective`,
  `AlgebraicGeometry.Scheme.Hom.resLE_app_top`, `AlgebraicGeometry.Scheme.Hom.resLE_eq_morphismRestrict`.
  Apply the affine theorem to f|U; finiteness makes f⁻¹U affine. Rewrite the restricted pullback datum and its
  top component. The actual restricted appTop equals U.topIso.hom followed by f.app U and (f⁻¹U).topIso.inv.
  Apply conjugation invariance of the conductor range and cancel contraction along the surjective native topIso hom.

- For finite schematically dominant f, affine U and b∈Γ(Y,f⁻¹U), b
  belongs to `(I_f.comap f)(f⁻¹U)` exactly when b·c lies in the image of f.app U for every c in that same
  section ring. Uses §1.17. Rewrite the exact ideal using the chart formula for the source ideal and unfold native
  conductor membership. The criterion quantifies over the whole section ring.

- For finite schematically dominant f and affine U, the
  actual source-conductor closed inclusion section map followed by the source-conductor section isomorphism.hom equals the native
  quotient map b↦[b] modulo the ambient conductor, as CommRingCat maps. Uses §1.17,
  `AlgebraicGeometry.Scheme.IdealSheafData.subschemeι_app`, `Ideal.quotEquivOfEq_mk`. Substitute the pinned
  subschemeι_app equation, cancel its native chart inverse with the chart hom, and evaluate quotient transport
  on each representative.

- For finite schematically dominant f, affine U and b in the actual
  source section ring, the coordinate under the source-conductor section isomorphism of the restriction of b to the source
  conductor is exactly its quotient class modulo the ambient conductor. Uses §1.17. Evaluate the equality of
  actual inclusion/coordinate maps at b.

- For finite schematically dominant f, affine U and a source
  section b, the source-conductor section isomorphism.inv sends its ambient-conductor quotient class to the actual restriction of
  b along the source-conductor inclusion. Uses §1.17. Rewrite the quotient representative using
  the source-conductor section isomorphism class and apply the native chart hom-inverse identity.

- For finite schematically dominant f and affine U, the
  actual conductor chart map followed by the source-conductor section isomorphism.hom equals the target subschemeObjIso.hom
  followed by the native quotient map `Γ(P,U)/I_f(U)→Γ(Y,f⁻¹U)/K` induced by f.app U, where K is its full
  ambient conductor. Equality holds for the actual maps. Uses §1.17, §1.16,
  `AlgebraicGeometry.Scheme.IdealSheafData.subschemeι_app_surjective`, `Ideal.quotientMap`. Cancel the
  surjective target closed-inclusion section map. Apply the existing actual section square, the source
  inclusion-coordinate formula and the target subschemeι_app formula. Both composites evaluate to [f.app U(a)]
  on every representative.

- For finite schematically dominant f and affine U, construct the
  actual CommRingCat isomorphism from sections of (`I_f.comap` f).subscheme over the inverse image of f⁻¹U to
  Γ(Y,f⁻¹U)/c(im(f.app U),Γ(Y,f⁻¹U)). Compose the native subschemeObjIso with quotient transport along the
  proved equality of full ideals. Uses §1.17, `AlgebraicGeometry.Scheme.IdealSheafData.subschemeObjIso`,
  `Ideal.quotEquivOfEq`. Use the actual closed-subscheme section isomorphism, then the native quotEquivOfEq
  for the chart formula for the source ideal. All maps are specified; there is no chosen abstract quotient or replacement
  by reduced support.

- Let f:Y→P be finite and schematically dominant, U an affine open,
  A=Γ(P,U), B=Γ(Y,f⁻¹U), `I=I_f` and J=I.comap f. The ideal extension of I(U) along f.app U is exactly the full
  conductor c(im(f.app U),B). Uses §1.16, §1.17, §1.2, `Ideal.map_comap_le`, `Ideal.mem_map_of_mem`. The
  conductor is contained in the image. Lift each conductor element to A; its lift belongs to the contraction
  defining I(U). Combine this inclusion with the native map-comap bound.

- Under the same hypotheses, the set underlying I(U).map(f.app U)
  equals the literal image of the set I(U) under f.app U. This is equality of the full ideal and image, not
  equality of radicals. Uses §1.17, §1.16, §1.2. Replace the extended ideal by the ambient conductor, lift its
  elements through the image inclusion, and use contraction membership in each direction.

**Checks.**

- For `f=id_P` both conductor subschemes are empty and the induced map is an isomorphism.

- For the cusp normalization the source conductor D is nonreduced and C is reduced; g:D→C retains the full
  nilpotent parameter.

- For a proper finite extension E/k both conductor inclusions are isomorphisms while the induced conductor map
  is not an isomorphism.

- Under the actual affine quotient-chart comparisons, g is the Spec map of the native induced quotient map
  A/I→B/K.

- On the empty target open, the actual conductor-section map commutes with both inclusion section maps and
  f.app, retaining the zero section rings.

- For every affine U and a in its actual section ring, start with the actual target-conductor section obtained
  by applying its subschemeObjIso inverse to the quotient class of a. After the actual conductor chart map and
  the source chart hom, the result is the quotient class of f.app U(a).

- For every target open U, restriction from the actual conductor open over U to the empty open commutes with
  the conductor chart map using the actual source-conductor presheaf restriction.

- For every affine U, the actual conductor quotient map sends the quotient class of zero to zero.

- For the empty affine target open, the actual conductor quotient map is bijective between the native quotient
  rings of the two zero section rings.

- For the actual diagonal Z/4→Z/4×Z/4, prove the Spec map finite and schematically dominant, its full
  conductor ideal datum zero, and its conductor map not an isomorphism. The quotient class of the actual
  section corresponding to2 is nonzero with square zero, and its image under the actual conductor quotient map
  is also nonzero with square zero.

- For every affine U and every source section b, the inverse canonical B/K chart sends [b] to its actual
  restriction along the source-conductor closed inclusion.

- On the empty affine target open, every actual source-conductor section has coordinate zero in the quotient
  of the native zero section ring.

- For the actual finite schematically dominant diagonal Z/4→Z/4×Z/4, its ambient section conductor is zero.
  The source section corresponding to(2,2) is nonzero with square zero, and its actual source-conductor
  restriction has nonzero square-zero coordinate under the source-conductor section isomorphism. Replacing the conductor by its
  radical fails this test.

*Needs:* §1.16; §1.12; `AlgebraicGeometry.Scheme.IdealSheafData.comap`;
`AlgebraicGeometry.Scheme.IdealSheafData.comapIso`; `AlgebraicGeometry.Scheme.IdealSheafData.subschemeObjIso`;
`AlgebraicGeometry.Scheme.IdealSheafData.subschemeι_app`;
`AlgebraicGeometry.Scheme.IdealSheafData.comapIso_hom_snd`;
`AlgebraicGeometry.Scheme.IdealSheafData.subschemeMap_subschemeι`; `AlgebraicGeometry.IsFinite`;
`AlgebraicGeometry.Scheme.IdealSheafData.comapIso_hom_fst`; `CategoryTheory.IsPullback.of_iso_pullback`.

### 1.18 global geometric conductor reconstruction

Show that the actual conductor subschemes of a finite surjective map of reduced noetherian schemes reconstruct
the target topology and structure sheaf as a geometric pushout. First identify affine sections by the
common-ideal ring equivalence; next prove restriction naturality and glue the comparisons. Finite surjectivity
supplies the quotient topology, and schematic dominance supplies the inclusion of section rings.

On an affine U⊂P, use the conductor affine quotients and the arbitrary-subring conductor reconstruction to
identify A with `B×_(B/K)(A/I)`. Apply §1.3 to the quotient map B→B/K and finite map A/I→B/K. The
latter is finite because it is a quotient of the finite A-module B. The resulting geometric square is the
restriction of the one canonical native conductor square, by §1.17. Thus the topological
quotient identifications agree on overlapping affine opens. The sheaf comparison agrees on a basis by
localization, hence is an isomorphism of the actual structure sheaves and gives the ring pullback on every
open. Glue this sheaf comparison and the local quotient topology; do not infer every-open section equality
from global sections alone. For Witaszek’s hypotheses, a finite surjective map is dominant and the reduced
target makes it scheme-theoretically dominant by the pinned theorem.

([Witaszek](https://par.nsf.gov/servlets/purl/10429755), Definition2.27, printed pp674–675; affine conductor
description and finite-surjective reduced-scheme hypotheses;
[Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Introduction, printed p554; Lemma1.3 pp556–557
and Theorem5.1/proof pp568–569.)

**Checks.**

- The cusp square has a nonreduced overlap and is still geometric.

- A finite field extension of degree greater than one gives the trivial whole-conductor square and is covered
  without birationality.

- All sheaf maps refer to the canonical constructed subschemes.

*Needs:* §1.17; §1.12; §1.3; `AlgebraicGeometry.IsSchemeTheoreticallyDominant.of_isDominant`;
`AlgebraicGeometry.Scheme.Cover.hom_ext`.

### 1.19 the conductor square as a Scheme pushout

Upgrade this geometric reconstruction to the categorical pushout in Scheme. Compatible maps from Y and `C_f`
descend to an actual scheme morphism from P, with a unique continuous map and a unique local ringed-space
morphism. Cover an arbitrary target by affine opens and glue the local ring lifts; the affine ring identity
alone does not prove this assertion.

Apply §1.18 and the existing geometric pushout.lift contract: the closed inclusion `D_f→Y`
and finite induced conductor map satisfy its finite Ferrand alternative. Express existence and uniqueness as
the colimit property of the actual square. Do not restrict T to affine schemes and do not assert an
algebraic-space target theorem from a Scheme signature.

([Witaszek](https://par.nsf.gov/servlets/purl/10429755), Definition2.27, printed pp674–675; affine conductor
description and finite-surjective reduced-scheme hypotheses;
[Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Introduction, printed p554; Lemma1.3 pp556–557
and Theorem5.1/proof pp568–569.)

**Checks.**

- The identity finite map gives the pushout of P←empty→empty.

- The universal property is checked on arbitrary scheme targets.

*Needs:* §1.18; §1.17; §1.1; `CategoryTheory.IsPushout`; §1.34;
`CategoryTheory.Limits.PushoutCocone.isColimitAux'`.

### 1.20 the recomputed conductor after flat scheme base change

For finite schematically dominant f and flat T→P, recompute both conductor ideal sheaves after base change and
prove equality with the pulled-back ideals. Construct actual isomorphisms of target and source conductor
subschemes, prove commutation with their inclusions and conductor maps, and prove two-step flat tower
coherence through the native pullback associator.

The pinned scheme-theoretic-dominance theorem and finite base-change stability supply the hypotheses of
the conductor ideal sheaf of `f_T`. On an affine T-chart mapping into an affine P-chart, compute the pulled-back rings
and use §1.14; flatness retains the inclusion and the finite quotient module.
Refine T by such charts rather than assuming q is affine. Native ideal-sheaf extensionality and restriction
compatibility give equality of ideal-sheaf data. Its existing comapIso supplies the canonical
quotient-subscheme comparison; use the projection equations to identify the induced conductor map. The
geometric-pushout base change of §1.6 transports the geometric square. The new content is that these
pulled-back closed loci are exactly the recomputed conductors, not just that an old geometric square stays
geometric.

The comparison needs the following law.

- For finite schematically dominant f:Y→P and flat q:T→P, the
  source conductor ideal of the base-changed map equals the pullback along pullback.fst f q of the original
  source ideal I_f.comap f. Schemes and section rings lie in a common universe. Zero rings
  and nonreduced rings are allowed. Uses the target equality of this section, `AlgebraicGeometry.Scheme.IdealSheafData.comap_comp`,
  `CategoryTheory.Limits.pullback.condition`. Rewrite the recomputed target conductor by the exact global flat
  comparison. Native ideal-pullback composition and the actual scheme pullback square identify the two source
  ideals.

([Stacks, tag 07T8](https://stacks.math.columbia.edu/tag/07T8), Lemma10.40.4;
[Witaszek](https://par.nsf.gov/servlets/purl/10429755), Definition2.27, printed pp674–675; affine conductor
description and finite-surjective reduced-scheme hypotheses.)

**Checks.**

- Flat dual-number thickening is allowed although its rings are nonreduced.

- The cusp quotient by t² loses injectivity, so the nonflat counterexample is excluded by an actual necessary
  hypothesis.

- For identity base change the recomputed source conductor equals the pullback of the original source
  conductor along the actual pullback.fst.

*Needs:* §1.14; §1.16; §1.17; §1.18; §1.6; `AlgebraicGeometry.IsSchemeTheoreticallyDominant.of_isPullback`;
`AlgebraicGeometry.Scheme.IdealSheafData.comapIso`; `AlgebraicGeometry.Scheme.IdealSheafData.map_ideal`;
§1.42; `AlgebraicGeometry.Scheme.IdealSheafData.ext_of_iSup_eq_top`;
`TopologicalSpace.Opens.IsBasis.isOpenCover_mem_and_le`; `TopologicalSpace.Opens.IsBasis.isOpenCover`;
`TopologicalSpace.IsOpenCover.comap`; `AlgebraicGeometry.Scheme.isBasis_affineOpens`.

### 1.21 common-ideal localization equivalence

Construct the common ideal away equivalence for t∈I under the image-ideal condition and ker(f)∩I=0. Its forward map is
the native localization map A[1/t]→B[1/f(t)]. A lift of f(t)b gives its inverse b↦a/t; the result is
independent of the chosen a after localization. Permit noninjective f and zero localizations.

A,B are arbitrary commutative rings with identity, including the zero ring; f:A→B is unital and I is an ideal
of A. No injectivity, finiteness, reducedness, Noetherianity or regularity of t is assumed.

([Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Theorem5.1, printed p568, complete
principal-localization paragraph, with Lemma1.3(b) and its converse, pp556–557.)

The construction needs the following maps and laws.

- If ker(f)∩I=0, t∈I and f(a)=0, then ta=0. This does not require
  f(I) to be an ideal. Uses `Ideal.mul_mem_right`. The element ta is in I because t∈I and in ker(f) because
  f(a)=0. The stated intersection equality makes it zero.

- Suppose f(I) is already an ideal, expressed by `map_f(I)=f(I)` as
  underlying sets, and ker(f)∩I=0. For t∈I and any native localizations `A_t,B_f(t)`, the canonical localization
  map `A_t→B_f(t)` is bijective. Zero divisors, nilpotent t and zero localizations are allowed. Uses §1.21,
  `IsLocalization.Away.map`, `IsLocalization.Away.map_injective_iff`,
  `IsLocalization.Away.map_surjective_iff`, `Ideal.mem_map_of_mem`, `Ideal.mul_mem_right`. Apply the existing
  Away.map_injective_iff. The preceding annihilation lemma supplies the single exponent1 for every kernel
  element; the library criterion handles all fractions and denominator torsion. For b∈B, f(t)b belongs to
  `map_f(I)`. The image-ideal equality lifts it to an actual a∈I with f(a)=f(t)b. Apply the existing
  Away.map_surjective_iff with exponent1.

- For every `x∈A_t`, E(x)=Away.map(f,t)(x), under the common-ideal
  hypotheses. Uses §1.21, `RingEquiv.ofBijective_apply`. Unfold only RingEquiv.ofBijective, whose forward
  function is the supplied map.

- For a∈A, E([a])=[f(a)] in `B_f(t)`.

- For a∈A, E⁻¹([f(a)])=[a] in `A_t`.

- Under the common-ideal hypotheses, if f(a)=f(t)b, then
  E⁻¹([b])=a/t in the actual localization `A_t`. The witness a need not be selected canonically, need not lie in
  I and is not required to be unique before localization. Uses §1.21, `IsLocalization.map_mk'`,
  `IsLocalization.eq_mk'_iff_mul_eq`, `RingEquiv.apply_symm_apply`. Apply injectivity of E and its inverse
  law. The forward-map equation and native `map_mk′` send a/t to f(a)/f(t). The native `eq_mk′_iff_mul_eq`
  identifies this fraction with [b] using the witness equality; no cancellation of t in A or B is used.

**Checks.**

- For `f=id_Z`, I=Z and any t,a, E sends the actual localized image of a to that same image.

- For `f=id_Z`, I=Z and t=2, E⁻¹([3]) is the actual fraction6/2 in Z[1/2].

- The first projection Z×Z→Z is not injective, but its localization away from (1,0) is bijective for I=Z×0.

- For `f=id_(Z/4)`, I=Z/4 and t=2, the actual localized map is bijective and its localization carrier is
  subsingleton because2²=0.

- The first projection Z×Z→Z localized at1 is not injective. With I=Z×Z its image is an ideal, but ker(f)∩I is
  nonzero.

- The diagonal Z→Z×Z localized at1 is not surjective. With I=Z its kernel is zero, but the image of I is the
  diagonal subring and is not an ideal.

- The equivalence retains the actual section-ring map, rather than an arbitrary chosen isomorphism between the
  two carriers.

*Needs:* `Ideal.mul_mem_right`; `IsLocalization.Away.map`; `IsLocalization.Away.map_injective_iff`;
`IsLocalization.Away.map_surjective_iff`; `Ideal.mem_map_of_mem`; `RingEquiv.ofBijective`;
`IsLocalization.map_eq`; `RingEquiv.ofBijective_apply`.

### 1.22 reconstruction ring equivalence

Construct the inverse of the common-ideal comparison using both coordinates of a compatible pair. The first
coordinate determines f(a) and the second determines a modulo I; their difference produces a lift in I. The
kernel-intersection condition proves uniqueness. In particular, an arbitrary representative of the second
coordinate is not the reconstructed element.

([Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Printed pp554–557, introduction and
§§1.1–1.4.)

The construction needs the following maps and laws.

- For every subring S of a commutative ring B, the extension to B of
  the contraction of its ambient conductor is the original conductor:
  `map_subtype(comap_subtype(c(S,B)))=c(S,B)`. This is equality of full ideals, with no radicals or reducedness
  assumption. Uses §1.2, `Ideal.map_comap_le`, `Ideal.mem_map_of_mem`. The native map-comap bound gives one
  inclusion. For b in the conductor, multiplication by1 places b in S; its subtype lies in the contraction and
  maps back to b.

- For every subring S⊂B, `subtype_S(comap_subtype(c(S,B)))` equals
  c(S,B) as sets. Thus this image already is an ambient ideal; the assertion is stronger than merely
  generating that ideal. Uses §1.2. An element of the contracted ideal maps into the conductor by definition.
  Lift every conductor element to its actual S-subtype using the containment of the conductor in A.

- Under the reconstruction hypotheses, E(a)=c(a) for every a∈A; both
  coordinates are the actual maps f and A→A/I. Uses §1.22, §1.12, `RingEquiv.ofBijective`. Unfold only the
  native RingEquiv.ofBijective forward map. Identify it with the specified common ideal comparison hom.

- Under the reconstruction hypotheses, f(E⁻¹(p)) equals the
  native B-projection of every compatible pair `p∈B×_(B/map_f(I))(A/I)`. Uses §1.22, §1.12,
  `RingEquiv.apply_symm_apply`. Rewrite the B-projection with common ideal comparison first projection and
  the evaluation formula of the common-ideal equivalence. Apply the native equivalence inverse law E(E⁻¹(p))=p.

- Under the reconstruction hypotheses, the class of E⁻¹(p) in
  A/I is the actual second projection of the compatible pair p. Equality is in the quotient, and makes no
  assertion that an arbitrary representative is the reconstructed element. Uses §1.22, §1.12,
  `RingEquiv.apply_symm_apply`. Rewrite the quotient projection with common ideal comparison second projection and
  the evaluation formula of the common-ideal equivalence. Apply E(E⁻¹(p))=p and project to A/I.

- Under the reconstruction hypotheses, if a∈A has f(a)=p₁
  and [a]=p₂ for a compatible pair p, then E⁻¹(p)=a. The equality uses both coordinates; the second coordinate
  alone does not choose a representative. Uses §1.22, `RingEquiv.apply_symm_apply`. Apply injectivity of E and
  its inverse law. Use equality of both coordinates in the existing subtype of B×A/I.

**Checks.**

- For ℤ→F₂ and I=0, the reconstruction inverse takes c(a) back to a for every integer a, although the original
  ring map is not injective.

- For `f=id_A` and every ideal I, the actual reconstruction inverse of c(a) is a.

- For `f=id_ℤ` and I=(2), the compatible pair (7,[3]) reconstructs7 and does not reconstruct3. This checks both
  coordinates rather than selecting an arbitrary residue representative.

*Needs:* §1.2; `Ideal.map_comap_le`; `Ideal.mem_map_of_mem`; §1.12; `RingEquiv.ofBijective`.

### 1.23 difference map of the common-ideal square

Define the difference map d(f,I) on B×(A/I) by (b,α)↦[b]−f̄(α). It is always surjective. Prove exactness at
B×(A/I) is equivalent to f(I)=I.map f, and injectivity of A→B×(A/I) is equivalent to ker(f)∩I=0. Thus middle
exactness and short exactness have distinct conditions.

([Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Printed pp554–557, introduction and
§§1.1–1.4.)

The construction needs the following maps and laws.

- For every b∈B and α∈A/I, d(b,α)=[b]−q(α) in `B/map_f(I)`, with
  the quotient map induced by f. Uses §1.23. Evaluate the two product projections. Evaluate subtraction in the
  additive-hom group; this gives the displayed minus sign.

- For every f and I, `d:B×A/I→B/map_f(I)` is surjective. It
  does not require `map_f(I)=f(I)`, nor does surjectivity by itself imply exactness at B×A/I. Uses §1.23,
  `Ideal.Quotient.mk_surjective`. Represent any quotient class by b∈B using the native quotient surjectivity.
  The pair (b,0) maps to that class because q(0)=0.

- For arbitrary commutative rings and f:A→B, I⊂A, assume `map_f(I)=f(I)` as
  sets. Then `A→B×A/I→B/map_f(I)`, with maps a↦(f(a),[a]) and d(b,α)=[b]−q(α), is Function.Exact. It is exact at
  the middle term even when f has a nonzero kernel. It becomes short exact precisely when the diagonal map is
  injective. Uses §1.23, §1.12, `Function.MulExact`. The equation d(b,α)=0 says exactly that (b,α) is a
  compatible pair in the native ring pullback. Lift that pair using the surjectivity of κ(f,I). Conversely an
  actual diagonal pair has equal images in the final quotient.

- For every f and I, the actual sequence a↦(f(a),[a]), d(b,α)=[b]−q(α)
  is Function.Exact if and only if `map_f(I)=f(I)` as sets. There is no kernel condition in this equivalence;
  that condition controls the separate initial injection. Uses §1.23, `Function.MulExact`. Exactness lifts
  every compatible pair, since compatibility is the equation d(p)=0. Apply the surjectivity criterion for κ(f,I).
  Conversely use the exactness criterion of the common-ideal sequence. The diagonal F₂→F₂×F₂ with I=⊤ distinguishes surjectivity of d from this
  exactness.

- For every f:A→B and I⊂A, the native diagonal ring hom
  a↦(f(a),[a]) into B×A/I is injective exactly when ker(f)∩I=0. This equivalence requires no image-ideal
  hypothesis. Uses `RingHom.injective_iff_ker_eq_bot`, `Ideal.Quotient.eq_zero_iff_mem`. Compute the kernel of
  the product hom from its two coordinates. Use the quotient-zero criterion and native ring-hom injectivity
  criterion. Combined with the exactness criterion and surjectivity of the difference map this states exactly when the
  affine sequence is short exact.

- For every f:A→B and I⊂A, the comparison
  `c:A→B×_(B/map_f(I))(A/I)` is surjective if and only if `map_f(I)=f(I)` as sets. In particular injectivity of f
  cannot replace the image-ideal condition. Uses §1.12, `Ideal.Quotient.eq_zero_iff_mem`,
  `Ideal.mem_map_of_mem`. For `b∈map_f(I)`, form the compatible pair (b,0). A lift a satisfies [a]=0, hence a∈I,
  and f(a)=b. The reverse set containment is the native ideal-map inclusion. The converse implication is the
  existing compatible-pair lifting result.

**Checks.**

- For `f=id_A` and every ideal I the specified diagonal and difference maps form an exact pair.

- For ℤ→F₂ and I=ker(f), the specified sequence is exact at its middle term while its initial diagonal map is
  not injective.

- For the injective diagonal F₂→F₂×F₂ with I=⊤, d is surjective but the specified sequence is not exact; (0,1)
  lies in the generated ideal and not in the diagonal image.

- For `f=id_ℤ` and I=0, d(0,[1])=−[1] in `ℤ/map_id(0)`, fixing the sign of the exact sequence.

*Needs:* `Ideal.quotientMap`; `Ideal.Quotient.mk`; `MonoidHom.fst`; `MonoidHom.snd`.

### 1.24 recomputed conductor for a finite spanning family

For a supplied finite spanning family g:Fin n→B, test contracted-conductor membership on each gᵢ. Turn one
denominator per generator into one common denominator by multiplication. Prove the corresponding
numerator/fraction criteria in the native localizations, including n=0 and noninjective coefficient maps. The
spanning hypothesis is necessary.

For r=a/t, native extended-ideal membership is equivalent to existence of s∈S with sa in the original
contracted conductor. Use conductor-localized-test-original-elements and
the localized product criterion. An original conductor multiplier supplies every original-element test.
Conversely, apply the product criterion to each of the finitely many `g_i`. The common-denominator lemma
lemma combines their witnesses, using the complementary products and the spanning-family criterion, to one s
with sa in the conductor. Thus both native ideals have the same members. No generic tensor/flat-annihilator
comparison, domain cancellation, or injectivity adapter is assumed.

([Stacks, tag 07T8](https://stacks.math.columbia.edu/tag/07T8), Lemma10.40.4 proof finite-generation step;
Ferrand introduction p554 conductor=annihilator context; explicit conductor-specific derivation; [Stacks, tag
07T8](https://stacks.math.columbia.edu/tag/07T8), Stacks Lemma10.40.4 full proof, finite-generation step;
Ferrand printed p554 conductor context and p557 conductor of a possibly noninjective map; explicit
conductor-specific localization derivation.)

Standing hypotheses for the maps and laws below: Let `f_S:L→M` be the native localized map, determined by
`f_S(a/t)=f(a)/f(t)`. No injectivity, reducedness, regularity of denominators or nonzero-localization hypothesis
is imposed.

The construction needs the following maps and laws.

- For every commutative A-algebra B, g:Fin n→B with
  `span_A(range g)=B`, and a∈A, a belongs to the contracted arbitrary-image conductor if and only if `f(a)g_i`
  belongs to im f for every i. The map f is the actual algebraMap; n=0, noninjective maps and zero rings are
  allowed. Uses §1.2, `Submodule.comap`, `Submodule.mem_comap`, `Submodule.mem_bot`, `LinearMap.smul_apply`,
  `Submodule.mkQ`, `Submodule.mkQ_apply`, `Submodule.Quotient.mk_smul`, `Submodule.Quotient.mk_eq_zero`,
  `Submodule.mem_span_singleton`, `Submodule.span_le`, `RingHom.mem_range`, `Ideal.mem_comap`. Let N=A·1⊂B and
  K be the native inverse image of zero under the A-linear map b↦a·[b] in B/N. Membership in K is exactly
  f(a)b∈im f. If every generator lies in K, span(range g)=top forces K=top. Hence the condition holds for
  every b, which is exactly the existing subring conductor. The converse evaluates its universal condition on
  each `g_i`.

- With the same actual algebra and finite spanning family, and
  any multiplicative subset S⊂A, (for every i there is `s_i∈S` with `f(s_i a)g_i∈im f`) is equivalent to (there is
  s∈S with sa in the contracted conductor). Neither cancellation nor injectivity is assumed; S may contain
  zero. Uses §1.24, `Finset.prod_erase_mul`, `Submonoid.prod_mem`, `RingHom.mem_range`. Choose the finitely
  many `s_i`, and let s be their product. It belongs to S, including the empty-product case. For each i factor
  `s=(product over j≠i)s_j·s_i`. Since im f is closed under multiplication by f(A), `f(sa)g_i` lies in im f. Apply
  the conductor generator criterion. Conversely use the same conductor denominator for every generator. No
  inference cancels a zero divisor or divides by a denominator in A.

- Let L be any actual S-localization of A, with its
  native A-algebra and IsLocalization instance. For every t∈S the native fraction a/t lies in the ideal
  extended from the contracted conductor if and only if for each generator `g_i` there exists `s_i∈S` with `f(s_i a)g_i∈im f`. The supplied denominator t imposes no regularity condition. Uses §1.24,
  `IsLocalization.mk'_mem_map_algebraMap_iff`. Use the pinned native fraction/extended-ideal criterion: a/t
  lies in cL exactly when some s∈S has sa∈c. Apply the conductor-specific common-denominator equivalence. Keep
  the supplied localization carrier and actual coefficient map; this does not yet identify cL with the
  recomputed conductor of the localized B-algebra.

- Let A and B be commutative rings, f:A→B their actual
  coefficient algebra map, S⊂A a submonoid, L an actual S-localization of A, and M an actual f(S)-localization
  of B. For b∈B, its actual image in M lies in `im f_S` if and only if some s∈S satisfies f(s)b∈im f. Uses
  `IsLocalization.map`, `IsLocalization.map_mk'`, `IsLocalization.exists_mk'_eq`,
  `IsLocalization.mk'_eq_iff_eq_mul`, `IsLocalization.eq_iff_exists`, `Submonoid.mem_map`,
  `Submonoid.le_comap_map`, `RingHom.mem_range`. For a localized preimage z of b, write z=a/t using native
  fraction surjectivity. Its image equality becomes equality of the images of f(a) and b f(t) in M. Use native
  localization equality to obtain a multiplier c∈f(S). Choose s∈S with f(s)=c. The relation is f(s)f(a)=f(s)b
  f(t), so denominator st and coefficient sa witness membership in im f. No element of B is cancelled.
  Conversely, a witness f(a)=f(s)b gives the localized preimage a/s, by the native fraction multiplication
  equation.

- Let A and B be commutative rings, f:A→B their actual
  coefficient algebra map, S⊂A a submonoid, L an actual S-localization of A, and M an actual f(S)-localization
  of B. For b∈B and t∈S, the fraction b/f(t) belongs to `im f_S` if and only if the actual image of b in M
  belongs to `im f_S`. Uses `IsLocalization.map`, `IsLocalization.map_mk'`, `IsLocalization.map_eq`,
  `IsLocalization.mk'_spec`, `IsLocalization.mul_mk'_eq_mk'_of_mul`, `Submonoid.mem_map_of_mem`,
  `Submonoid.le_comap_map`, `Subring.mul_mem`, `RingHom.mem_range`. Multiply a fraction in the image by
  `f_S(t/1)`. Closure of the image subring and the native fraction specification recover the image of b. If
  `f_S(z)` is the image of b, then `f_S(z·(1/t))` is b/f(t). The denominator inverse is itself an actual image; do
  not infer inverse closure for an arbitrary subring.

- Let A and B be commutative rings, f:A→B their actual
  coefficient algebra map, S⊂A a submonoid, L an actual S-localization of A, and M an actual f(S)-localization
  of B. For a∈A, t∈S and b∈B, `f_S(a/t)·b` belongs to `im f_S` if and only if some s∈S satisfies f(sa)b∈im f,
  where b on the left is its actual image in M. Uses §1.24, `IsLocalization.map_mk'`,
  `IsLocalization.mul_mk'_eq_mk'_of_mul`. The native map and multiplication laws identify this product with
  the fraction f(a)b/f(t). Remove the denominator by the localized fraction-image lemma, then
  use the localized image criterion on the actual numerator f(a)b. Reassociate
  f(s)f(a)b as f(sa)b.

- Let A and B be commutative rings, f:A→B their actual
  coefficient algebra map, S⊂A a submonoid, L an actual S-localization of A, and M an actual f(S)-localization
  of B. For r∈L, r belongs to `f_S⁻¹(conductor(im f_S,M))` if and only if `f_S(r)·b` lies in `im f_S` for every
  original b∈B. Uses §1.2, `IsLocalization.exists_mk'_eq`, `Submonoid.mem_map`, `Submonoid.mem_map_of_mem`,
  `Submonoid.le_comap_map`, `IsLocalization.mk'_eq_mul_mk'_one`, `IsLocalization.map_mk'`,
  `RingHom.mem_range`, `Subring.mul_mem`, `Ideal.mem_comap`. Conductor membership immediately gives the stated
  tests on the actual images of original elements. For an arbitrary element of M, choose a fraction b/u.
  Choose s∈S representing u∈f(S). Write b/u as `b·f_S(1/s)`. Multiply the test for b by this actual image
  inverse. This handles every element of M without injectivity.

**Checks.**

- The empty family is valid for the zero B-module; it does not impose injectivity on A→B.

*Needs:* §1.2; `Submodule.comap`; `Submodule.mem_comap`; `Submodule.mem_bot`; `LinearMap.smul_apply`;
`Submodule.mkQ`; `Submodule.mkQ_apply`; `Submodule.Quotient.mk_smul`; `Submodule.Quotient.mk_eq_zero`;
`Submodule.mem_span_singleton`; `Submodule.span_le`; `RingHom.mem_range`; `Ideal.mem_comap`;
`Finset.prod_erase_mul`; `Submonoid.prod_mem`; `IsLocalization.mk'_mem_map_algebraMap_iff`;
`IsLocalization.map`; `IsLocalization.map_mk'`; `IsLocalization.exists_mk'_eq`;
`IsLocalization.mk'_eq_iff_eq_mul`; `IsLocalization.eq_iff_exists`; `Submonoid.mem_map`;
`Submonoid.le_comap_map`; `IsLocalization.map_eq`; `IsLocalization.mk'_spec`;
`IsLocalization.mul_mk'_eq_mk'_of_mul`; `Submonoid.mem_map_of_mem`; `Subring.mul_mem`;
`IsLocalization.mk'_eq_mul_mk'_one`.

### 1.25 finite-algebra conductor agrees with its recomputation

Using that spanning family, prove equality of the extended conductor and the conductor recomputed along the
actual localized coefficient map, without assuming that the original map is injective. Check each original
generator after localization, then clear the finitely many denominators. Identify the exact localization
carriers and maps before transferring the ideal equality.

Obtain an actual finite spanning family using the pinned Module.Finite.exists_fin declaration. Apply
the finite-generator form of the localization statement. The localization statement of §1.15 is recovered as its
injective-map special case; no use of injectivity is needed for equality. Keep the conductor-specific
localization conclusion distinct from the imported finite-module flat-annihilator theorem and from the
geometric affine restriction and IdealSheafData assembly.

([Stacks, tag 07T8](https://stacks.math.columbia.edu/tag/07T8), Stacks Lemma10.40.4 full proof,
finite-generation step; Ferrand printed p554 conductor context and p557 conductor of a possibly noninjective
map; explicit conductor-specific localization derivation.)

**Checks.**

- Diagonal Z/4→Z/4×Z/4, its nilpotent denominator2 and its zero localization satisfy the same equality.

- For the actual cusp A=k+X²k[X], localization at the actual element X² gives a recomputed unit conductor.

*Needs:* §1.24; `Module.Finite.exists_fin`.

### 1.26 reconstruct target sections from the actual conductor rings

For affine U, construct the conductor sections isomorphism from Γ(P,U) to the native pullback of B=Γ(Y,f⁻¹U) and
`C=Γ(C_f,j⁻¹U)` over `D=Γ(D_f,i⁻¹f⁻¹U)`. Its projections are exactly f.app and j.app, and its inverse has both
specified quotient coordinates. Compare the two limit cones, preserving zero section rings and nilpotents.

Finite and schematically dominant f; affine U only where expressly stated; preserve the full conductor ideals
and actual native section rings.

([Stacks, tag 0ET0](https://stacks.math.columbia.edu/tag/0ET0), Stacks 0ET0; [Stacks, tag
0C6L](https://stacks.math.columbia.edu/tag/0C6L), Stacks 0C6L.)

The construction needs the following maps and laws.

- For finite schematically dominant f and affine U, put V=f⁻¹U,
  C=Γ(I.subscheme,I.ι⁻¹U), D=Γ(J.subscheme,J.ι⁻¹V). The square A→B, A→C, B→D, C→D, whose arrows are the actual
  f.app U, I.ι.app U, J.ι.app V and the conductor chart map f U, is a pullback in CommRingCat. Uses §1.12, §1.17,
  `AlgebraicGeometry.Scheme.Hom.app_injective`, `CategoryTheory.IsPullback.of_iso'`,
  `AlgebraicGeometry.Scheme.IdealSheafData.subschemeObjIso`,
  `AlgebraicGeometry.Scheme.IdealSheafData.subschemeι_app`,
  `AlgebraicGeometry.Scheme.IdealSheafData.subschemeι_app_surjective`, `Ideal.quotEquivOfEq`,
  `Ideal.quotEquivOfEq_mk`, `Ideal.quotientMap_mk`. Use the existing common-ideal ring pullback with the
  literal conductor image and zero kernel from schematic dominance. Transport all four arrows through the
  actual target and source closed-subscheme section isomorphisms. Lift target conductor sections to A to
  verify the fourth compatibility on every representative.

- For every such affine U, conductor sections isomorphism.hom followed by the
  native first projection equals f.app U, as actual CommRingCat morphisms. Uses §1.26,
  `CategoryTheory.Limits.IsLimit.conePointUniqueUpToIso_hom_comp`. Apply the forward comparison of limit cone
  components at the left object.

- For every such affine U, conductor sections isomorphism.hom followed by the
  native second projection equals I.ι.app U. Uses §1.26,
  `CategoryTheory.Limits.IsLimit.conePointUniqueUpToIso_hom_comp`. Apply the forward comparison at the right
  object.

- For every such affine U, conductor sections isomorphism.inv followed by
  f.app U equals the native first projection from `B×_D C`. Uses §1.26,
  `CategoryTheory.Limits.IsLimit.conePointUniqueUpToIso_inv_comp`. Apply the inverse comparison at the left
  object.

- For every such affine U, conductor sections isomorphism.inv followed by
  I.ι.app U equals the native second projection. Uses §1.26,
  `CategoryTheory.Limits.IsLimit.conePointUniqueUpToIso_inv_comp`. Apply the inverse comparison at the right
  object.

- For every such affine U, a native fiber-product element p
  and a∈Γ(P,U) with f.app U(a)=p.first, the specified inverse conductor sections isomorphism.inv(p) equals a. Its second
  coordinate is automatically fixed by fiber-product compatibility. Uses §1.26,
  `AlgebraicGeometry.Scheme.Hom.app_injective`. Compare the first coordinates and cancel the injective actual
  section map.

**Checks.**

- For the cusp normalization Spec k[t]→Spec k[t²,t³], on the whole affine target,
  the conductor sections isomorphism sends t² to (t²,0). Compute the contracted conductor (t²,t³), then transport
  sections by `ΓSpecIso` and `IdealSheafData.subschemeObjIso` to k[t], k and k[t]/(t²).
  The actual inclusion and quotient maps give these coordinates.

- For the split node Spec k[t]→Spec(k+(t²−1)k[t]) with char k≠2, on the whole target,
  the conductor sections isomorphism sends t²−1 to (t²−1,0). Compute the full conductor and transport the
  actual section maps through `ΓSpecIso` and `IdealSheafData.subschemeObjIso` to k[t], k and
  k[t]/(t²−1); evaluation at 1 and −1 identifies the last ring with k×k.

- For Spec(Z/4×Z/4)→Spec(Z/4) induced by the diagonal, the full conductor is zero.
  Through `ΓSpecIso` and the closed-subscheme quotient comparisons, the conductor sections isomorphism
  sends 2 to ((2,2),2) in `(Z/4×Z/4)×_(Z/4×Z/4)(Z/4)`. This is nonzero and square-zero.

- For finite schematically dominant f and affine U, construct the specified native CommRingCat isomorphism
  `Γ(P,U)≅B×_D C` using the actual source inclusion B→D and the conductor chart map C→D. Here the fiber-product object
  is the native CommRingCat.pullbackCone point, retaining zero rings and nilpotents.

- Do not infer global sheaf exactness, quotient topology or a geometric/categorical pushout solely from affine
  exactness.

*Needs:* §1.12; §1.17; `AlgebraicGeometry.Scheme.Hom.app_injective`; `CategoryTheory.IsPullback.of_iso'`;
`AlgebraicGeometry.Scheme.IdealSheafData.subschemeObjIso`;
`AlgebraicGeometry.Scheme.IdealSheafData.subschemeι_app`;
`AlgebraicGeometry.Scheme.IdealSheafData.subschemeι_app_surjective`; `Ideal.quotEquivOfEq`;
`Ideal.quotEquivOfEq_mk`; `Ideal.quotientMap_mk`; `CommRingCat.pullbackCone`;
`CommRingCat.pullbackConeIsLimit`; `CategoryTheory.Limits.IsLimit.conePointUniqueUpToIso`.

### 1.27 the signed conductor difference on every open

Define the conductor section difference on every open U by δ(b,c)=i.app(b)−g.app(c) in the source-conductor
sections. It is an additive map, not a ring homomorphism. Prove restriction naturality, zero composite with
target sections and affine surjectivity. Surjectivity on all arbitrary open section rings is not asserted.

Finite and schematically dominant f; affine U only where expressly stated; preserve the full conductor ideals
and actual native section rings.

([Stacks, tag 0ET0](https://stacks.math.columbia.edu/tag/0ET0), Stacks 0ET0; [Stacks, tag
0C6L](https://stacks.math.columbia.edu/tag/0C6L), Stacks 0C6L.)

The construction needs the following maps and laws.

- For every open U and actual sections b,c,
  `δ_U(b,c)=J.ι.app(f⁻¹U)(b)−g_U(c)`, with g_U the chart map of the conductor square. Uses §1.27. Unfold the additive homomorphism and
  evaluate the two product projections.

- For every open U and `a∈Γ(P,U)`, `δ_U(f.app U(a),I.ι.app U(a))=0`. Affineness is unnecessary for this statement. Uses §1.27, §1.17. Evaluate the actual commuting
  section square at a, and subtract the equal images.

- For every affine U, `δ_U` is surjective onto the
  actual source-conductor section ring `D_U`. No claim of surjectivity on arbitrary open section rings is made.
  Uses §1.27, `AlgebraicGeometry.Scheme.IdealSheafData.subschemeι_app_surjective`. Finiteness makes f⁻¹U
  affine. Lift each source-conductor section b through the native closed-inclusion section map and use the
  pair (b,0).

- For every open U the actual ring homomorphism a↦(f.app
  U(a),I.ι.app U(a)) is injective. Uses §1.16, `AlgebraicGeometry.Scheme.Hom.app_injective`. Take the first
  coordinate of an equality of pairs and use native section injectivity for the finite schematically dominant
  map.

- For every affine U the sequence `A→B_U×C_U→D_U`, with
  a↦(f.app U(a),I.ι.app U(a)) followed by `δ_U`, is Function.Exact: a pair has difference zero exactly when it
  comes from a target section. Together with the injectivity and surjectivity lemmas this gives the short
  exact sequence of underlying additive groups on affine opens. Uses §1.26, §1.27, §1.17,
  `CategoryTheory.Limits.Types.exists_of_isPullback`. Zero difference is equality of the two actual conductor
  images. Map the native ring pullback to Types, lift the compatible pair, and use the section square for the
  converse.

- For any U⊆V, restrict `δ_V(b,c)` along the actual
  source-conductor inclusion. The result equals `δ_U` applied to the restrictions of b along f⁻¹U⊆f⁻¹V and c
  along I.ι⁻¹U⊆I.ι⁻¹V. This holds for arbitrary, including empty, opens, with the actual native presheaf
  restriction maps. Uses §1.27, §1.17, `AlgebraicGeometry.Scheme.Hom.naturality`. Restriction preserves
  subtraction. Apply naturality of the actual source closed inclusion to the first term and the existing
  the chart-map restriction lawion equation to the second.

**Checks.**

- On every open, the pairs(1,0) and(0,1) map respectively to1 and−1, checking the subtraction sign and the
  actual unital section maps.

- On every affine open a pair with zero difference has exactly one target section giving both coordinates;
  this checks existence and uniqueness through the actual maps.

- On the empty open the difference of every actual section pair is zero, including the zero section rings of
  both conductor schemes.

- For finite schematically dominant f and every open U, with actual section rings `B_U,C_U,D_U` as above, define
  the additive homomorphism `δ_U:B_U×C_U→D_U` by `δ_U(b,c)=J.ι.app(f⁻¹U)(b)−g_U(c)`, with g_U the chart map of the conductor square. This is an
  additive homomorphism, with the specified subtraction sign.

- Do not infer global sheaf exactness, quotient topology or a geometric/categorical pushout solely from affine
  exactness.

*Needs:* §1.17.

### 1.28 the structure-sheaf comparison with the native pullback

Construct the conductor sheaf comparison in native ring-valued sheaves using f.c and the target-conductor
inclusion c. Prove their composites agree on every open, apply the native pullback lift and prove it is an
isomorphism by affine-local comparison. The chosen coordinates and restrictions, not just the objects, are
part of the theorem.

Finite and schematically dominant f:Y→P; all opens arbitrary except the explicitly affine agreement lemma.
Native conductor ideal data and actual structure maps throughout.

([Stacks, tag 0ET0](https://stacks.math.columbia.edu/tag/0ET0), Stacks 37.14.1.)

The construction needs the following maps and laws.

- On any open U⊂P, the component of conductor sheaf inclusion is
  the actual native map J.ι.app(f⁻¹U):Γ(Y,f⁻¹U)→Γ(J.subscheme,J.ι⁻¹(f⁻¹U)). Uses §1.28. Unfold the native
  pushforward and whiskering definitions.

- The native first projection after conductor sheaf comparison is
  f.c as a morphism `O_P→f_*O_Y`. Uses §1.28. Apply the native pullback lift first-projection equation.

- The square with upper-left `O_P`, the two actual structure maps
  f.c and I.ι.c, and lower maps conductor sheaf inclusion and conductor sheaf chart is a native IsPullback in the
  category of sheaves of commutative rings on P. Uses §1.28, `CategoryTheory.IsPullback.of_iso_pullback`.
  Transport the native chosen pullback through the established comparison isomorphism, retaining both
  specified projection equations.

- For finite schematically dominant f:Y→P, let `I=I_f` and J=I.comap
  f. Construct the actual CommRingCat-valued sheaf morphism `f_*O_Y→f_*J.ι_*O_J` by pushing forward the native
  closed-inclusion structure map. The target is an iterated pushforward on P, with its actual sheaf condition.
  Uses §1.16, `TopCat.Sheaf.pushforward`, `CategoryTheory.Functor.whiskerLeft`. Whisker the actual native
  J.ι.c by (Opens.map f.base).op, and regard the resulting natural transformation as a morphism of the native
  pushforward sheaves.

- On every open U⊂P, the component of conductor sheaf chart is exactly
  the conductor chart map f U, including its prescribed inverse-image identification. Uses §1.28. Evaluate the
  specified natural transformation.

- The native second projection after conductor sheaf comparison
  is I.ι.c as a morphism `O_P→I.ι_*O_I`. Uses §1.28. Apply the native pullback lift second-projection equation.

- Construct `I.ι_*O_I→f_*J.ι_*O_J` on P whose component on every open U is
  exactly the conductor chart map f U. Its naturality is the previously checked actual open-restriction equation;
  there is no affine-open restriction on this morphism. Uses §1.17, `TopCat.Sheaf.pushforward`. Use the
  existing chart maps as components and the chart-map restriction law to prove naturality; both presheaves
  already carry the native pushforward sheaf conditions.

- For every finite schematically dominant f:Y→P, the
  specified conductor sheaf comparison is an isomorphism of native sheaves of commutative rings. No reducedness,
  Noetherianity, birationality or global affineness is required. Uses §1.28, §1.26,
  `TopCat.Sheaf.isIso_iff_isIso_basis`, `AlgebraicGeometry.Scheme.isBasis_affineOpens`,
  `CategoryTheory.IsPullback.isoIsPullback`, `CategoryTheory.IsPullback.isoIsPullback_hom_fst`,
  `CategoryTheory.IsPullback.isoIsPullback_hom_snd`, `CategoryTheory.Functor.map_isPullback`,
  `CategoryTheory.sheafToPresheaf`, `CategoryTheory.evaluation`. Sheaf inclusion preserves limits, and
  evaluation preserves limits of presheaves. Evaluate the native sheaf pullback on an affine open. Both it and
  the preceding affine conductor cone are limiting cones over the same actual cospan. Uniqueness of limits and
  the two coordinate identities show that the comparison component is their canonical isomorphism. Apply the
  native isomorphism criterion on the affine-open basis.

- For every open U⊂P, including nonaffine and empty opens, the
  actual ring square with arrows f.app U, I.ι.app U, J.ι.app(f⁻¹U) and the conductor chart map f U is a pullback in
  CommRingCat. Uses §1.28, `CategoryTheory.Functor.map_isPullback`, `CategoryTheory.sheafToPresheaf`,
  `CategoryTheory.evaluation`. Apply the composite of the limit-preserving native sheaf inclusion and
  evaluation at U to the actual sheaf pullback. The four evaluated maps are definitionally the original ring
  section maps.

- On every open U⊂P, the actual additive sequence
  Γ(P,U)→Γ(Y,f⁻¹U)×Γ(I.subscheme,I.ι⁻¹U)→Γ(J.subscheme,J.ι⁻¹(f⁻¹U)), with section pair followed by the signed
  difference, is Function.Exact. Thus every compatible pair has a unique target section by the existing
  section-pair injectivity. This statement does not assert surjectivity of the last map on nonaffine opens.

**Checks.**

- On the empty target open the pushed-forward source inclusion sends every actual section to zero; the native
  zero section rings are retained.

- The actual source-inclusion sheaf morphism commutes with restriction for every U⊆V, with both iterated
  inverse-image restrictions visible.

- The two actual sheaf components give signed differences1 and−1 on the pairs(1,0) and(0,1), checking the
  subtraction sign.

- For every open and every target section the two actual sheaf morphisms give equal images in the source
  conductor sections.

- Any native sheaf F with compatible morphisms into the two conductor sheaves has a unique morphism `F→O_P` with
  those actual coordinates.

- A zero-difference section pair on U∪V has a unique target section on U∪V, with no affine hypothesis on U,V
  or their union.

- Construct `O_P→f_*O_Y ×_(f_*J.ι_*O_J) I.ι_*O_I` in the native category of CommRingCat-valued sheaves on P. Its
  coordinates are the actual f.c and I.ι.c, and its compatibility is the already proved conductor square on
  every open.

- The sheaf pullback does not alone settle quotient topology or the geometric/categorical Scheme pushout.
  Last-map section surjectivity is asserted only in the inherited affine theorem.

*Needs:* §1.16; `TopCat.Sheaf.pushforward`; `CategoryTheory.Functor.whiskerLeft`; §1.17;
`CategoryTheory.Sheaf.hom_ext`.

### 1.29 reconstruct sections on arbitrary opens

Evaluate the proved sheaf pullback on an arbitrary open U to construct the conductor open sections isomorphism. Prove
compatibility with restrictions and equality with the specified affine comparison when U is affine. The limit
identity holds on all opens even though the accompanying difference map is only locally surjective.

Finite and schematically dominant f:Y→P; all opens arbitrary except the explicitly affine agreement lemma.
Native conductor ideal data and actual structure maps throughout.

([Stacks, tag 0ET0](https://stacks.math.columbia.edu/tag/0ET0), Stacks 37.14.1.)

The construction needs the following maps and laws.

- On every open U⊂P, the actual additive sequence
  Γ(P,U)→Γ(Y,f⁻¹U)×Γ(I.subscheme,I.ι⁻¹U)→Γ(J.subscheme,J.ι⁻¹(f⁻¹U)), with section pair followed by the signed
  difference, is Function.Exact. Thus every compatible pair has a unique target section by the existing
  section-pair injectivity. This statement does not assert surjectivity of the last map on nonaffine opens.
  Uses §1.28, §1.27, §1.17, `CategoryTheory.Limits.Types.exists_of_isPullback`. Zero difference is equality of
  the two images. Forget the native ring pullback to Types and lift a compatible pair. Conversely, the actual
  conductor square makes the difference of a target section pair zero.

- For every open U, conductor open sections isomorphism.hom followed by
  the explicit native first projection equals f.app U. Uses §1.29,
  `CategoryTheory.Limits.IsLimit.conePointUniqueUpToIso_hom_comp`. Apply the forward limit comparison equation
  at WalkingCospan.left.

- For every open U, conductor open sections isomorphism.hom followed by
  the explicit native second projection equals I.ι.app U. Uses §1.29,
  `CategoryTheory.Limits.IsLimit.conePointUniqueUpToIso_hom_comp`. Apply the forward limit comparison equation
  at WalkingCospan.right.

- For every open U, conductor open sections isomorphism.inv followed
  by f.app U equals the native first projection from the explicit ring fiber product. Uses §1.29,
  `CategoryTheory.Limits.IsLimit.conePointUniqueUpToIso_inv_comp`. Apply the inverse limit comparison equation
  at WalkingCospan.left.

- For every open U, conductor open sections isomorphism.inv followed
  by I.ι.app U equals the native second projection from the explicit ring fiber product. Uses §1.29,
  `CategoryTheory.Limits.IsLimit.conePointUniqueUpToIso_inv_comp`. Apply the inverse limit comparison equation
  at WalkingCospan.right.

- For every affine U, the all-open conductor open sections isomorphism
  f U equals the preceding conductor sections isomorphism f U as the entire native CommRingCat isomorphism, with both
  forward and inverse maps thereby identified. Uses §1.29, §1.26,
  `CategoryTheory.Limits.PullbackCone.IsLimit.hom_ext`. Use isomorphism extensionality and uniqueness of maps
  into the explicit native pullback; both projection composites agree with the same actual structure maps.

- For every finite schematically dominant f:Y→P, apply the
  existing sheaf-composition functor for CommRingCat→RingCat→AddCommGrpCat to the actual conductor
  structure-sheaf square. The resulting square of native additive sheaves on P is a pullback, with the two
  specified structure maps and the actual conductor inclusion and chart maps. Finite and schematically
  dominant f:Y→P; I=I_f and J=I.comap f. Opens arbitrary except where explicitly affine.
  Actual native sheaves, maps and biproduct throughout. Uses §1.28, `CategoryTheory.sheafCompose`,
  `CategoryTheory.Functor.whiskeringRight`, `CategoryTheory.whiskeringRightPreservesLimits`,
  `CategoryTheory.Sheaf.createsLimits`, `CategoryTheory.sheafToPresheaf`,
  `CommRingCat.forget₂Ring_preservesLimits`, `RingCat.forget₂AddCommGroup_preservesLimits`,
  `CategoryTheory.IsPullback.of_map_of_faithful`, `CategoryTheory.Functor.map_isPullback`. Inclusion into
  presheaves preserves and reflects limits. Whiskering with the existing two-step forgetful functor preserves
  limits. Map the ring-sheaf pullback into additive presheaves and reflect it through the additive sheaf
  inclusion. No new generic sheaf or forgetful carrier is introduced.

**Checks.**

- For Spec k[t]→Spec k[t²,t³] and the whole cusp target, the conductor open sections isomorphism sends t²
  to (t²,0). Derive the conductor (t²,t³) and transport the actual source and conductor section
  maps by `ΓSpecIso` and `IdealSheafData.subschemeObjIso` to k[t], k and k[t]/(t²), as in §1.26.

- For Spec k[t]→Spec(k+(t²−1)k[t]), char k≠2, and the whole split-node target,
  the conductor open sections isomorphism sends t²−1 to (t²−1,0). Derive the conductor, then use `ΓSpecIso`
  and `IdealSheafData.subschemeObjIso` to identify the source and quotient maps with the inclusion,
  quotient to k, and quotient k[t]→k[t]/(t²−1), followed by evaluation at the two roots.

- For the diagonal Z/4→Z/4×Z/4 and the whole target, the conductor open sections isomorphism sends 2 to
  ((2,2),2). Compute the zero conductor and transport through `ΓSpecIso` and the actual
  closed-subscheme quotient comparisons; both projections retain the nonzero square-zero section.

- For each arbitrary open U⊂P, construct the native CommRingCat isomorphism `Γ(P,U)≅B_U×_(D_U)C_U`, where
  `B_U,C_U,D_U` and both lower arrows are the actual section rings and maps. The fiber product is the native
  CommRingCat.pullbackCone point, retaining nilpotents and zero rings.

- The sheaf pullback does not alone settle quotient topology or the geometric/categorical Scheme pushout.
  Last-map section surjectivity is asserted only in the inherited affine theorem.

*Needs:* §1.28; §1.27; §1.17; `CategoryTheory.Limits.Types.exists_of_isPullback`; `CommRingCat.pullbackCone`;
`CommRingCat.pullbackConeIsLimit`; `CategoryTheory.Limits.IsLimit.conePointUniqueUpToIso`.

### 1.30 the actual conductor additive sheaf short complex

Construct the conductor additive short complex with the additive underlying sheaves `O_P`, `f_*O_Y⊕j_*O_C` and
`(fi)_*O_D`. The first map has coordinates f.c and j.c; the second has coordinates i.c and −g.c. Prove their
composite is zero from the actual conductor square, then use the native short-complex carrier.

Finite and schematically dominant f:Y→P; I=I_f and J=I.comap f. Opens arbitrary except where
explicitly affine. Actual native sheaves, maps and biproduct throughout.

([Stacks, tag 0ET0](https://stacks.math.columbia.edu/tag/0ET0), Stacks 37.14.1.)

The construction needs the following maps and laws.

- The first map of conductor additive short complex
  followed by the first native biproduct projection is exactly f.c after forgetting multiplication. Finite and
  schematically dominant f:Y→P; I=I_f and J=I.comap f. Opens arbitrary except where
  explicitly affine. Actual native sheaves, maps and biproduct throughout. Uses §1.30. Use the native
  biproduct lift first-projection identity.

- The first map followed by the second native biproduct
  projection is exactly I.ι.c after forgetting multiplication. Finite and schematically dominant f:Y→P;
  I=I_f and J=I.comap f. Opens arbitrary except where explicitly affine. Actual native
  sheaves, maps and biproduct throughout. Uses §1.30. Use the native biproduct lift second-projection
  identity.

- The first native biproduct injection followed by the
  last map equals the actual conductor sheaf inclusion after forgetting multiplication. Finite and schematically
  dominant f:Y→P; I=I_f and J=I.comap f. Opens arbitrary except where explicitly affine.
  Actual native sheaves, maps and biproduct throughout. Uses §1.30. Use the native first-injection/desc
  identity.

- The second native biproduct injection followed by the
  last map equals the negative of the actual conductor sheaf chart after forgetting multiplication. Finite and
  schematically dominant f:Y→P; I=I_f and J=I.comap f. Opens arbitrary except where
  explicitly affine. Actual native sheaves, maps and biproduct throughout. Uses §1.30. Use the native
  second-injection/desc identity, retaining its negative chart map.

- On every open U⊂P and every b∈Γ(Y,f⁻¹U), applying
  the actual last sheaf map to the first injected section gives J.ι.app(f⁻¹U)(b). Finite and schematically
  dominant f:Y→P; I=I_f and J=I.comap f. Opens arbitrary except where explicitly affine.
  Actual native sheaves, maps and biproduct throughout. Uses §1.30, §1.28. Evaluate the sheaf-morphism
  identity at U and then at b.

- On every open U⊂P and every c∈Γ(I,I.ι⁻¹U),
  applying the actual last sheaf map to the second injected section gives −the conductor chart map(f,U)(c). Finite
  and schematically dominant f:Y→P; I=I_f and J=I.comap f. Opens arbitrary except where
  explicitly affine. Actual native sheaves, maps and biproduct throughout. Uses §1.30, §1.28. Evaluate the
  sheaf-morphism identity and the native additive negation at U and c.

- On every open U, the last sheaf map sends
  inl(b)+inr(c) to the preceding actual conductor section difference(f,U)(b,c). Both rings, restrictions and the
  subtraction sign are unchanged. Finite and schematically dominant f:Y→P; I=I_f and
  J=I.comap f. Opens arbitrary except where explicitly affine. Actual native sheaves, maps and biproduct
  throughout. Uses §1.30, §1.27. Add the two evaluated component identities, then use the existing signed
  section-difference formula.

- The first morphism of the actual
  conductor additive short complex is a monomorphism in native additive sheaves on P. Finite and schematically
  dominant f:Y→P; I=I_f and J=I.comap f. Opens arbitrary except where explicitly affine.
  Actual native sheaves, maps and biproduct throughout. Uses §1.30, §1.29,
  `CategoryTheory.IsPullback.mono_shortComplex'_f`. Apply the existing native pullback-kernel monomorphism
  theorem to the actual additive square.

- The actual conductor additive short complex is Exact in
  the native abelian category of additive sheaves on P. The actual structure map is the kernel of the
  specified signed difference. Finite and schematically dominant f:Y→P; I=I_f and J=I.comap
  f. Opens arbitrary except where explicitly affine. Actual native sheaves, maps and biproduct throughout.
  Uses §1.30, §1.29, `CategoryTheory.IsPullback.exact_shortComplex'`. Apply the existing native exactness
  theorem for the short complex of a pullback, through its genuine limiting kernel fork.

- For every affine open U⊂P, the component
  on U of the last actual sheaf map is surjective as an additive group homomorphism. A target section lifts
  along the actual closed inclusion J.ι on the affine inverse image f⁻¹U, and the first native biproduct
  injection supplies its middle-term lift. Finite and schematically dominant f:Y→P; I=I_f
  and J=I.comap f. Opens arbitrary except where explicitly affine. Actual native sheaves, maps and biproduct
  throughout. Uses §1.30, `AlgebraicGeometry.Scheme.IdealSheafData.subschemeι_app_surjective`,
  `AlgebraicGeometry.IsAffineOpen.preimage`. Finite f is affine, so f⁻¹U is affine. Use the existing
  closed-subscheme restriction surjectivity there and the proved actual inclusion-component equation. No
  last-map surjectivity on arbitrary opens is inferred.

- The actual last map is locally
  surjective: for every target section on any open U and each x∈U, choose an affine open V⊆U containing x; the
  restricted section has an actual middle-term lift on V. Finite and schematically dominant f:Y→P;
  I=I_f and J=I.comap f. Opens arbitrary except where explicitly affine. Actual native
  sheaves, maps and biproduct throughout. Uses §1.30, `AlgebraicGeometry.Scheme.isBasis_affineOpens`,
  `TopologicalSpace.IsTopologicalBasis.exists_subset_of_mem_open`, `TopCat.Presheaf.isLocallySurjective_iff`.
  Use the affine-open basis to choose V around x inside U, then apply actual affine component surjectivity to
  the restricted section. Apply the native local-surjectivity criterion with the prescribed restriction.

- The last morphism of conductor additive short complex is an
  epimorphism in additive sheaves on P. This is sheaf epimorphy obtained from local lifts, not surjectivity on
  sections of every nonaffine open. Finite and schematically dominant f:Y→P; I=I_f and
  J=I.comap f. Opens arbitrary except where explicitly affine. Actual native sheaves, maps and biproduct
  throughout. Uses §1.30, `TopCat.Sheaf.isLocallySurjective_iff_epi`. Use the existing equivalence between
  local surjectivity and epimorphy in the native additive sheaf category, with its existing sheafification and
  abelian structure.

- For every finite schematically dominant f:Y→P,
  the specified native conductor additive short complex is ShortExact:
  `0→O_P,+→f_*O_Y,+⊞I.ι_*O_I,+→f_*J.ι_*O_J,+→0`. No reducedness, Noetherianity, birationality or global
  affineness is required.

**Checks.**

- For the cusp normalization Spec k[t]→Spec k[t²,t³], on the whole affine target, the first map
  of the conductor additive short complex sends t² to (t²,0). Compute the conductor (t²,t³) and use
  `ΓSpecIso` and `IdealSheafData.subschemeObjIso` to transport the actual sheaf maps to
  k[t²,t³]→k[t]⊕k→k[t]/(t²), retaining the native biproduct coordinates.

- In that cusp complex, the last map sends (t,0) to ε in k[ε]/(ε²), and ε≠0.
  Construct the quotient isomorphism by t↦ε and identify the actual source-conductor restriction
  with this quotient map, rather than assuming its coordinate formula.

- For the cusp over Q, the last map sends (0,1) to −1 in Q[ε]/(ε²), which differs from 1.
  Under the same chart transports, the actual target-conductor map is the constant inclusion;
  the second biproduct component has its specified negative sign.

- For every affine open and actual target section, a section of the native sheaf biproduct maps to it under
  the actual last morphism.

- For any native additive sheaf F on P and any morphism F→the native middle sheaf killed by the actual last
  map, there is a unique morphism `F→O_P,+` whose composite with the actual first map is the given morphism.

- For the identity of Spec(Z/4), the global section corresponding to 2 is nonzero and square-zero, and its
  image under the actual first additive sheaf map remains nonzero. Reducing the structure ring loses this
  test.

- Construct the native ShortComplex in additive sheaves on P with objects `O_P,+`, `f_*O_Y,+` ⊞ `I.ι_*O_I,+`, and
  `f_*J.ι_*O_J,+`, where I is the actual conductor ideal datum and J=I.comap f. Its first map is the biproduct
  lift of the actual structure maps; its second map is the biproduct desc of the actual source inclusion and
  the negative of the actual chart map. The native zero-composite equation uses the actual conductor square.

- No generic sheaf or short-complex carrier is replanned. Last-map component surjectivity is only asserted on
  affine opens; all arbitrary opens have local lifts and the inherited middle exactness.

*Needs:* §1.29; `CategoryTheory.CommSq.shortComplex'`; `CategoryTheory.sheafIsAbelian`.

### 1.31 the conductor additive sheaf sequence is short exact

Prove this specified additive-sheaf complex is short exact for every finite schematically dominant f, without
global affineness, reduction, noetherianity or birationality. The first map is mono by conductor
reconstruction; the middle kernel is the sheaf pullback; the last map is epi because it is surjective on
affine-local sections. This does not make the last map surjective on sections of every open.

Finite and schematically dominant f:Y→P; I=I_f and J=I.comap f. Opens arbitrary except where
explicitly affine. Actual native sheaves, maps and biproduct throughout.

Package the independently established native mono, Exact and epi facts using ShortComplex.ShortExact.mk′. This
does not prove quotient topology, the Scheme pushout universal property, or coherent cohomology.

([Stacks, tag 0ET0](https://stacks.math.columbia.edu/tag/0ET0), Stacks 37.14.1.)

**Checks.**

- For every finite schematically dominant f:Y→P, the specified native conductor additive short complex is
  ShortExact: `0→O_P,+→f_*O_Y,+⊞I.ι_*O_I,+→f_*J.ι_*O_J,+→0`. No reducedness, Noetherianity, birationality or
  global affineness is required.

- No generic sheaf or short-complex carrier is replanned. Last-map component surjectivity is only asserted on
  affine opens; all arbitrary opens have local lifts and the inherited middle exactness.

*Needs:* §1.30; `CategoryTheory.ShortComplex.ShortExact.mk'`.

### 1.32 descend continuous maps through the conductor square

For an injective integral A→B, descend a compatible pair of continuous maps from Spec B and Spec(A/I) to any
topological space T. The integral spectral map is closed and surjective, hence a quotient map; conductor
compatibility makes the source map constant on its fibers. Construct the conductor Spec descent as a native
continuous map and prove both restrictions and uniqueness. T has no separation hypothesis and may have an
independent universe.

A and B are arbitrary commutative rings in a common universe; K is the existing range-subring conductor and
I=K.comap φ. The first three lemmas require only a ring map. Descent and the pushout require φ injective and
integral. No finiteness, Noetherianity, reducedness or nontriviality is imposed. Continuous targets have
independent universes and no separation assumptions. Use actual native spectra, quotient rings, continuous
maps and TopCat; global scheme gluing remains open.

([Stacks, tag 0B7J](https://stacks.math.columbia.edu/tag/0B7J), Lemma 15.6.2.)

The construction needs the following maps and laws.

- For any ring map φ:A→B and ideal q⊆B, the contracted conductor
  I=K.comap φ satisfies I≤q.comap φ if and only if K≤q, where K=φ.range.conductor. K is the existing
  range-subring conductor and I=K.comap φ. The first three lemmas require only a ring map. Descent and the
  pushout require φ injective and integral. Use actual native spectra, quotient rings, continuous maps and
  TopCat; global scheme gluing remains open. Uses §1.2. Every element of K lies in the range of φ. Choose a
  preimage to prove the reverse implication; the other implication is monotonicity of ideal contraction.

- For any φ and p,q∈Spec B with equal contractions, if K is
  not contained in p then p=q. No injectivity or integrality assumption is needed. K is the existing
  range-subring conductor and I=K.comap φ. The first three lemmas require only a ring map. Descent and the
  pushout require φ injective and integral. Use actual native spectra, quotient rings, continuous maps and
  TopCat; global scheme gluing remains open. Uses §1.2, `PrimeSpectrum`. Choose t∈K outside p; its lift to A
  is also outside the contracted q, so t∉q. Each product tb lifts to A. Membership agrees after multiplication
  by t and primality cancels t in both directions.

- For any φ and topological space T, let y:Spec B→T and
  z:Spec(A/I)→T be continuous and agree after the two maps out of Spec(B/K). Then y is constant on every fiber
  of Spec φ. K is the existing range-subring conductor and I=K.comap φ. The first three lemmas require only a
  ring map. Descent and the pushout require φ injective and integral. Use actual native spectra, quotient
  rings, continuous maps and TopCat; global scheme gluing remains open. Uses §1.32,
  `range_comap_of_surjective`, `PrimeSpectrum.comap_injective_of_surjective`,
  `PrimeSpectrum.comap_comp_apply`, `Ideal.quotientMap_comp_mk`. Split according to whether K lies in the
  prime. Outside K use singleton fibers. Inside K lift both primes through B/K; their contractions to A/I
  agree because the quotient spectrum embeds in Spec A. Compatibility then equates their y-values.

- For every p∈Spec B, conductor Spec descent evaluated at Spec φ(p)
  equals y(p). K is the existing range-subring conductor and I=K.comap φ. The first three lemmas require only
  a ring map. Descent and the pushout require φ injective and integral. Use actual native spectra, quotient
  rings, continuous maps and TopCat; global scheme gluing remains open. Uses §1.32,
  `Topology.IsQuotientMap.lift_comp`. Evaluate the native continuous quotient-lift composition identity at p.

- For every q∈Spec(A/I), the descent evaluated at the actual closed
  inclusion of q equals z(q). K is the existing range-subring conductor and I=K.comap φ. The first three
  lemmas require only a ring map. Descent and the pushout require φ injective and integral. Use actual native
  spectra, quotient rings, continuous maps and TopCat; global scheme gluing remains open. Uses §1.32,
  `RingHom.IsIntegral.comap_surjective`, `Ideal.ker_le_comap`, `Ideal.mk_ker`, `range_comap_of_surjective`,
  `PrimeSpectrum.comap_asIdeal`, `PrimeSpectrum.comap_injective_of_surjective`, `Ideal.quotientMap_comp_mk`.
  Lift the closed point q to p∈Spec B by lying over. The contraction criterion puts K in p, so p lifts through
  B/K. Compatibility and injectivity of Spec(A/I)→Spec A give the required triangle.

- Any continuous m:Spec A→T with m∘Spec φ=y equals the specified
  descent. The source triangle alone suffices; no separation axiom is imposed on T. K is the existing
  range-subring conductor and I=K.comap φ. The first three lemmas require only a ring map. Descent and the
  pushout require φ injective and integral. Use actual native spectra, quotient rings, continuous maps and
  TopCat; global scheme gluing remains open. Uses §1.32, `RingHom.IsIntegral.comap_surjective`. Use
  surjectivity of Spec φ and the pointwise source triangle to prove equality of native continuous maps.

- For any continuous m:T→T′, postcomposing the specified descent
  equals the specified descent of m∘y and m∘z with the transported compatibility proof. K is the existing
  range-subring conductor and I=K.comap φ. The first three lemmas require only a ring map. Descent and the
  pushout require φ injective and integral. Use actual native spectra, quotient rings, continuous maps and
  TopCat; global scheme gluing remains open. Uses §1.32. Apply the native uniqueness theorem to m composed
  with the descent, checking its source triangle pointwise.

- For every injective integral φ:A→B, the actual underlying TopCat
  square Spec(B/K)→Spec B, Spec(B/K)→Spec(A/I), Spec B→Spec A, Spec(A/I)→Spec A is IsPushout. All four arrows
  are Scheme.forgetToTop applied to the specified native Spec maps. K is the existing range-subring conductor
  and I=K.comap φ. The first three lemmas require only a ring map. Descent and the pushout require φ injective
  and integral. Use actual native spectra, quotient rings, continuous maps and TopCat; global scheme gluing
  remains open. Uses §1.32, `CategoryTheory.IsPushout`, `CategoryTheory.Limits.PushoutCocone.isColimitAux'`.
  Prove the actual square commutes, then supply its limiting cocone using the continuous descent, both
  triangle identities and pointwise uniqueness. This theorem is in TopCat; global Scheme and algebraic-space
  pushouts remain separate obligations.

**Checks.**

- The specified continuous descent for `id_A` equals the given map y for any compatible closed-side map.

- The actual descent satisfies the source and closed-side value identities simultaneously for every pair of
  spectrum points.

- Spec(ZMod 1) is empty and the actual identity conductor square still has its native TopCat pushout property.

- Two maps to any topological target that agree after the injective integral spectral map are equal; no
  separation assumption is added.

- Spec Q→Spec Z is not surjective: the prime over 2 has no preimage. Injectivity alone does not give the
  quotient-map descent used here.

- For ZMod 4, quotienting by the nilradical induces a bijection of spectra, while 2 is nonzero and
  square-zero. The topological result does not discard ring structure.

- For an injective integral ring map φ:A→B, every compatible pair of continuous maps y:Spec B→T and
  z:Spec(A/I)→T has a specified continuous descent map Spec A→T. The target T is arbitrary and may live in an
  independent universe.

- Keep nilpotents and the zero ring. Do not infer a global Scheme pushout or ringed-space equivalence from the
  topological universal property.

*Needs:* §1.2; `PrimeSpectrum`; `range_comap_of_surjective`; `PrimeSpectrum.comap_injective_of_surjective`;
`PrimeSpectrum.comap_comp_apply`; `Ideal.quotientMap_comp_mk`; `PrimeSpectrum.continuous_comap`;
`PrimeSpectrum.isClosedMap_comap_of_isIntegral`; `RingHom.IsIntegral.comap_surjective`;
`Topology.IsClosedMap.isQuotientMap`; `Topology.IsQuotientMap.lift`.

### 1.33 continuous descent through the global conductor

For finite schematically dominant Y→P, construct the conductor global descent from compatible continuous maps out of
Y and `C_f`. The finite map is closed and schematic dominance makes its image dense, hence surjective. Prove
fiber constancy using the actual source conductor and descend through this quotient map, including empty
schemes and arbitrary topological targets.

Y and P are arbitrary actual schemes in a common universe, f is finite and schematically dominant,
I=I_f and J=I.comap f. Only the first lemma additionally assumes affine Y and P. Continuous
targets may have independent universes, with no separation axioms. Retain nilpotents, empty schemes and the
zero ring; use the actual native closed subschemes, conductor map, ContinuousMap and TopCat.

([Stacks, tag 0ET0](https://stacks.math.columbia.edu/tag/0ET0), Lemma37.14.1.)

The construction needs the following maps and laws.

- For a finite schematically dominant morphism of affine schemes
  f:Y→P, if x,x′∈Y have f(x)=f(x′) and x lies outside the support of the actual pulled-back conductor ideal J,
  then x=x′. Only the first lemma additionally assumes affine Y and P. Uses §1.32, §1.17,
  `AlgebraicGeometry.Scheme.isoSpec_hom_naturality`, `AlgebraicGeometry.Scheme.toSpecΓ_preimage_zeroLocus`,
  `AlgebraicGeometry.Scheme.IdealSheafData.mem_support_iff_of_mem`,
  `CategoryTheory.ConcreteCategory.bijective_of_isIso`. Transport the actual points through the canonical
  affine scheme isomorphisms. The native ideal-support/zero-locus comparison and the proved source-conductor
  ideal computation give the off-conductor prime hypothesis. Apply the existing prime-fiber lemma and
  injectivity of the actual affine isomorphism.

- For any finite schematically dominant f:Y→P, points x,x′ with equal
  images are equal if x is outside the support of J=I_f.comap f. Neither scheme is
  required to be affine. Only the first lemma additionally assumes affine Y and P. Uses §1.33, §1.17,
  `AlgebraicGeometry.exists_isAffineOpen_mem_and_subset`,
  `AlgebraicGeometry.Scheme.IdealSheafData.support_comap`, `AlgebraicGeometry.morphismRestrict_base_coe`,
  `AlgebraicGeometry.IsSchemeTheoreticallyDominant.of_isPullback`,
  `AlgebraicGeometry.isPullback_morphismRestrict`. Choose an affine neighborhood of the common image.
  Finiteness makes its inverse image affine; native flat base change gives schematic dominance of the
  restriction. The actual conductor restriction identity and support_comap transport the off-conductor
  hypothesis. Apply the affine scheme-fiber lemma and take underlying points.

- For any topological target T and compatible continuous
  y:Y→T and `z:C_f→T`, y is constant on the fibers of f. Compatibility is with the actual inclusion `D_f→Y` and
  actual conductor map `f:D_f→C_f`. Only the first lemma additionally assumes affine Y and P. Uses §1.33, §1.17,
  `AlgebraicGeometry.Scheme.IdealSheafData.support_comap`,
  `AlgebraicGeometry.Scheme.IdealSheafData.range_subschemeι`. Outside J use the global singleton-fiber
  theorem. Inside J, support_comap puts both points in the same actual closed support; lift them through the
  native subscheme inclusions. The actual conductor square and the closed target inclusion identify their
  conductor map images. Evaluate compatibility on those lifts.

- For every p∈Y, conductor global descent f y z hc(f(p))=y(p). Only
  the first lemma additionally assumes affine Y and P. Uses §1.33, `Topology.IsQuotientMap.lift_comp`.
  Evaluate the native quotient-lift composition identity at p.

- For every `q∈C_f`, the global descent at the actual conductor
  closed inclusion of q equals z(q). Only the first lemma additionally assumes affine Y and P. Uses §1.33,
  §1.17, `AlgebraicGeometry.Scheme.IdealSheafData.support_comap`,
  `AlgebraicGeometry.Scheme.IdealSheafData.range_subschemeι`,
  `AlgebraicGeometry.surjective_of_isDominant_of_isClosed_range`. Lift the included point q through the finite
  surjective f. The native support pullback puts the lift in `D_f`. The actual conductor square and injectivity
  of `C_f→P` identify its conductor map image with q. Apply the source triangle and the original compatibility.

- Any continuous m:P→T satisfying m(f(p))=y(p) for every p∈Y
  equals the specified global descent. The source triangle alone suffices. Only the first lemma additionally
  assumes affine Y and P. Uses §1.33, `AlgebraicGeometry.surjective_of_isDominant_of_isClosed_range`. Use the
  actual surjective f to choose a preimage of each target point and compare the source-triangle values.

- For every continuous m:T→T′, m composed with the specified
  global descent equals the specified descent for m∘y and m∘z and their transported compatibility. T′ also has
  an independent universe. Only the first lemma additionally assumes affine Y and P. Uses §1.33. Apply
  uniqueness to the postcomposed continuous map after checking the actual source triangle.

- For every finite schematically dominant f:Y→P,
  Scheme.forgetToTop sends the actual conductor square `D_f→Y`, `D_f→C_f`, Y→P and `C_f→P` to an IsPushout square in
  TopCat. No affine, Noetherian, reduced, separated, birational or nonempty hypothesis is added. Only the
  first lemma additionally assumes affine Y and P. Uses §1.33, §1.17, `CategoryTheory.IsPushout`,
  `CategoryTheory.Limits.PushoutCocone.isColimitAux'`. Map the actual conductor commutativity identity to
  TopCat. For each compatible cocone use the specified continuous descent, both triangles and uniqueness to
  construct its colimit. Combine this separately with the already proved actual every-open sheaf pullback to
  obtain the existing geometric predicate; the categorical Scheme universal property is still a distinct
  obligation.

**Checks.**

- For any scheme P and any compatible closed-side map, descent through `id_P` is the original continuous map on
  P, including nonaffine schemes.

- For every compatible pair, composition of the actual descent with f and with the actual conductor closed
  inclusion recovers both continuous maps.

- The actual globally glued quadratic cusp normalization with a=b=0 over every field gives the existing
  geometric conductor predicate; its nonreduced conductor is retained.

- The actual global quadratic curve with q=t²−s over F₂(s) gives the geometric conductor predicate, without a
  separability or rational-branch hypothesis.

- The identity of Spec(ZMod1), an empty scheme, has the actual global conductor TopCat pushout.

- The identity of Spec(ZMod4) has the global topological conductor pushout while2 remains nonzero and
  square-zero in its ring.

- Two continuous maps to an arbitrary topological target that agree after f are equal; no target separation
  axiom is required.

- For every scheme P, the actual identity conductor subscheme is empty and its square satisfies the existing
  geometric predicate.

- Every compatible pair y:Y→T and `z:C_f→T` has a specified native ContinuousMap P→T for a finite schematically
  dominant f:Y→P. T may live in an independent universe and has no separation requirement.

- Do not infer the categorical Scheme universal property, flat recomputation of conductors or algebraic-space
  existence from the topological universal property.

*Needs:* §1.32; §1.17; `AlgebraicGeometry.Scheme.isoSpec_hom_naturality`;
`AlgebraicGeometry.Scheme.toSpecΓ_preimage_zeroLocus`;
`AlgebraicGeometry.Scheme.IdealSheafData.mem_support_iff_of_mem`;
`CategoryTheory.ConcreteCategory.bijective_of_isIso`; `AlgebraicGeometry.exists_isAffineOpen_mem_and_subset`;
`AlgebraicGeometry.Scheme.IdealSheafData.support_comap`; `AlgebraicGeometry.morphismRestrict_base_coe`;
`AlgebraicGeometry.IsSchemeTheoreticallyDominant.of_isPullback`;
`AlgebraicGeometry.isPullback_morphismRestrict`; `AlgebraicGeometry.Scheme.IdealSheafData.range_subschemeι`;
`AlgebraicGeometry.Scheme.Hom.isClosedMap`; `AlgebraicGeometry.surjective_of_isDominant_of_isClosed_range`;
`Topology.IsClosedMap.isQuotientMap`; `Topology.IsQuotientMap.lift`.

### 1.34 the actual descended scheme morphism

For compatible scheme maps y:Y→T and `z:C_f→T`, with i≫y=g≫z as scheme morphisms, construct
`conductorSchemeDesc:P→T`. Descend the continuous map, lift the section-ring maps into the actual sheaf
pullback and prove localness on stalks. Prove restriction, both factorization laws and uniqueness against
arbitrary T. No separatedness or affine-target assumption is imposed.

Y,P,T are actual schemes in a common universe; f:Y→P is finite and schematically dominant.
I=I_f, J=I.comap f, `C_f=I.subscheme`, `D_f=J.subscheme`, i=J.subschemeι and g=g_f.
The supplied y:Y→T and `z:C_f→T` satisfy i≫y=g≫z as scheme morphisms, not merely as point maps. Every open is
allowed. No affine, Noetherian, reduced, separated, birational, nonempty or separability assumption is added.

([Stacks, tag 0ET0](https://stacks.math.columbia.edu/tag/0ET0), Lemma37.14.1.)

The construction needs the following maps and laws.

- The composite of the underlying map of f with d equals the
  underlying map of y. Every open is allowed. Uses §1.34, §1.33. Use native TopCat extensionality and the
  existing pointwise source triangle.

- The composite of the actual inclusion `C_f→P` with d equals the
  underlying map of z. Every open is allowed. Uses §1.34, §1.33. Use native TopCat extensionality and the
  existing pointwise closed triangle.

- For every open U of T, f⁻¹(d⁻¹U)=y⁻¹U as actual opens of
  Y. Every open is allowed. Uses §1.34. Apply the inverse-image functor on opens to the actual source
  triangle.

- For every open U of T, the inverse image of d⁻¹U under
  `C_f→P` equals z⁻¹U as actual opens of `C_f`. Every open is allowed. Uses §1.34. Apply the inverse-image functor
  on opens to the actual closed triangle.

- Given compatible scheme morphisms y:Y→T and `z:C_f→T`, define the native
  TopCat morphism d:P→T by the existing continuous conductor descent applied to their actual underlying maps.
  Every open is allowed. Uses §1.33, `TopCat.ofHom`. Apply the actual continuous descent to the pointwise
  equality obtained by forgetting the supplied scheme square.

- For every target open U, restrict the actual y and z section
  maps using the two descent-preimage equalities. Their composites to `Γ(D_f,i⁻¹f⁻¹d⁻¹U)` agree through i.app
  and the existing the conductor chart map. Every open is allowed. Uses §1.34, §1.17,
  `AlgebraicGeometry.Scheme.Hom.appLE_comp_appLE`, `AlgebraicGeometry.Scheme.Hom.app_eq_appLE`. Express both
  composites as appLE of i≫y and g≫z. The supplied equality of scheme morphisms identifies them, with
  dependent open-domain inequalities retained.

- Composing the descended section map with f.app on d⁻¹U gives
  y.appLE on the exact source inverse image. Every open is allowed. Uses §1.34,
  `CategoryTheory.IsPullback.lift_fst`. Apply the native pullback-lift first projection identity.

- Composing the descended section map with the actual `C_f→P` section
  map gives z.appLE on the exact closed inverse image. Every open is allowed. Uses §1.34,
  `CategoryTheory.IsPullback.lift_snd`. Apply the native pullback-lift second projection identity.

- Any ring morphism Γ(T,U)→Γ(P,d⁻¹U) with both specified section
  projections equals the descended section map. Every open is allowed. Uses §1.34, §1.28,
  `CategoryTheory.IsPullback.hom_ext`. Use both projections of the actual ring pullback to compare the
  candidate morphisms.

- For every restriction U→V in the opposite opens of T,
  restriction followed by the V section map equals the U section map followed by restriction on the actual
  inverse-image opens of P. Every open is allowed. Uses §1.34, §1.28, `CategoryTheory.IsPullback.hom_ext`,
  `AlgebraicGeometry.Scheme.Hom.naturality`, `AlgebraicGeometry.Scheme.Hom.appLE_map`,
  `AlgebraicGeometry.Scheme.Hom.map_appLE`. Check the two pullback projections using the native naturality and
  appLE restriction identities. No basis-only or affine-open assertion substitutes for all-open naturality.

- For each open U of T, construct the native commutative-ring morphism
  Γ(T,U)→Γ(P,d⁻¹U) by the actual every-open conductor pullback and the two compatible restricted section maps.
  Every open is allowed. Uses §1.34, §1.28, `CategoryTheory.IsPullback.lift`. Use the native IsPullback lift;
  its carrier is the existing structure sheaf on P, not a replacement ring of pairs.

- Assemble the descended section maps into a native natural
  transformation `O_T→d_*O_P` on all opens of T. Its components are exactly conductor descent component and its naturality
  is the proved restriction identity. Every open is allowed. Uses §1.34. Use the native presheaf pushforward
  and natural-transformation constructor, retaining actual components and the naturality witness in the
  planning signature.

- Composing the underlying PresheafedSpace morphism of f
  with the descended ringed-space map equals the underlying morphism of y, including the entire sheaf map.
  Every open is allowed. Uses §1.34, `AlgebraicGeometry.PresheafedSpace.ext`, `TopCat.Presheaf.ext`,
  `AlgebraicGeometry.Scheme.Hom.appLE_map`, `AlgebraicGeometry.Scheme.Hom.appLE_eq_app`. Use native
  extensionality, the actual base triangle, and the section projection after the required equality transport
  on opens. The native appLE composition removes the inverse transport.

- Composing the underlying actual `C_f→P` morphism with the
  descended ringed-space map equals the underlying morphism of z, including the entire sheaf map. Every open
  is allowed. Uses §1.34, `AlgebraicGeometry.PresheafedSpace.ext`, `TopCat.Presheaf.ext`,
  `AlgebraicGeometry.Scheme.Hom.appLE_map`, `AlgebraicGeometry.Scheme.Hom.appLE_eq_app`. Use the same native
  extensionality argument with the actual closed inclusion and its dependent inverse-image transport.

- At every point p of P, the descended map
  `O_T,d(p)→O_P,p` is a local ring homomorphism. Every open is allowed. Uses §1.34,
  `AlgebraicGeometry.Scheme.Hom.isClosedMap`, `AlgebraicGeometry.surjective_of_isDominant_of_isClosed_range`,
  `AlgebraicGeometry.PresheafedSpace.stalkMap.comp`, `AlgebraicGeometry.PresheafedSpace.stalkMap.congr_hom`,
  `isLocalHom_of_comp`. Choose q∈Y above p using finite schematic dominance. The source ringed-space triangle
  identifies the composite stalk map with that of y, up to the native equality transport. This composite is
  local; the native isLocalHom_of_comp theorem gives locality of the first factor. No stalkwise surjectivity
  or separability hypothesis is used.

- Construct a native PresheafedSpace morphism from the underlying
  ringed space of P to that of T, with base d and presheaf map conductor descent presheaf. Both prescribed
  presheaves are the actual structure sheaves; locality is proved separately. Every open is allowed. Uses
  §1.34, `AlgebraicGeometry.PresheafedSpace.Hom`. Pair the actual continuous map and actual natural
  transformation using the native morphism constructor; no new ringed-space carrier is introduced.

- The composite f≫conductor scheme descent equals y as an actual
  scheme morphism. Every open is allowed. Uses §1.34, `AlgebraicGeometry.Scheme.Hom.ext'`,
  `AlgebraicGeometry.LocallyRingedSpace.Hom.ext'`. Apply native scheme and locally ringed-space extensionality
  to the proved ringed-space source triangle.

- The actual conductor inclusion `C_f→P` followed by
  conductor scheme descent equals z as a scheme morphism. Every open is allowed. Uses §1.34,
  `AlgebraicGeometry.Scheme.Hom.ext'`, `AlgebraicGeometry.LocallyRingedSpace.Hom.ext'`. Apply native
  extensionality to the proved closed ringed-space triangle.

- Any scheme morphism m:P→T with f≫m=y and `(C_f→P)≫m=z` equals
  conductor scheme descent. T is an arbitrary scheme, including nonaffine and nonseparated targets. Every open is
  allowed. Uses §1.34, `AlgebraicGeometry.Scheme.Hom.isClosedMap`,
  `AlgebraicGeometry.surjective_of_isDominant_of_isClosed_range`, `AlgebraicGeometry.Scheme.Hom.ext`,
  `AlgebraicGeometry.Scheme.Hom.appLE_comp_appLE`, `AlgebraicGeometry.Scheme.Hom.app_eq_appLE`. Surjectivity
  identifies the underlying maps. After transporting the actual inverse-image opens, both section triangles
  identify the section maps by the ring pullback uniqueness. Native scheme extensionality then proves
  equality.

- For every scheme morphism m:T→T′, conductor scheme descent followed
  by m equals the descent of y≫m and z≫m with their transported compatibility. Every open is allowed. Uses
  §1.34. Apply scheme-descent uniqueness and the two actual triangles, using associativity.

**Checks.**

- Both actual TopCat triangles hold simultaneously for a compatible pair of scheme morphisms.

- Both source and closed preimages of the intersection of two arbitrary target opens agree with the actual y
  and z inverse images.

- For `f=id_P` and any compatible maps into any scheme T, descent equals y, with no affine restriction on P or
  T.

- The actual descended section map on the empty target open sends every section to zero, using the zero ring
  on the empty inverse image.

- An arbitrary target-open inclusion commutes with the descended section map and the actual inverse-image
  restriction.

- The components of the actual descended natural transformation satisfy both section triangles on every target
  open.

- The actual natural-transformation component on the empty open has its value in the zero ring.

- Two successive arbitrary target-open restrictions agree with the single actual inverse-image restriction
  through the descended natural transformation.

- Both triangles hold as full native PresheafedSpace morphisms, including their sheaf components and dependent
  base transports.

- At every point of the actual target P the descended ringed-space stalk homomorphism is local.

- The actual globally glued quadratic cusp normalization with a=b=0 over every field has its categorical
  conductor pushout in Scheme.

- Descending the actual f and actual conductor inclusion into P reconstructs the identity scheme morphism of
  P.

- The identity on Spec(ZMod1), an empty scheme, gives the actual categorical conductor pushout in Scheme.

- The identity on Spec(ZMod4) gives the actual categorical conductor pushout while2 remains nonzero and
  square-zero in the ring.

- The actual global quadratic normalization for q=t²−s over F₂(s) has its categorical conductor pushout,
  without separability or rational-branch hypotheses.

- Construct the scheme morphism P→T whose underlying ringed-space morphism is conductor descent ringed space and
  whose locality witness is the proved local-stalk theorem.

- Use actual all-open structure-sheaf maps and native scheme morphisms; retain nilpotents and the empty
  scheme.

*Needs:* §1.33; `TopCat.ofHom`; §1.17; `AlgebraicGeometry.Scheme.Hom.appLE_comp_appLE`;
`AlgebraicGeometry.Scheme.Hom.app_eq_appLE`; §1.28; `CategoryTheory.IsPullback.lift`;
`CategoryTheory.IsPullback.lift_fst`; `CategoryTheory.IsPullback.lift_snd`;
`CategoryTheory.IsPullback.hom_ext`; `AlgebraicGeometry.Scheme.Hom.naturality`;
`AlgebraicGeometry.Scheme.Hom.appLE_map`; `AlgebraicGeometry.Scheme.Hom.map_appLE`;
`AlgebraicGeometry.PresheafedSpace.Hom`; `AlgebraicGeometry.PresheafedSpace.ext`; `TopCat.Presheaf.ext`;
`AlgebraicGeometry.Scheme.Hom.appLE_eq_app`; `AlgebraicGeometry.Scheme.Hom.isClosedMap`;
`AlgebraicGeometry.surjective_of_isDominant_of_isClosed_range`;
`AlgebraicGeometry.PresheafedSpace.stalkMap.comp`; `AlgebraicGeometry.PresheafedSpace.stalkMap.congr_hom`;
`isLocalHom_of_comp`; `AlgebraicGeometry.LocallyRingedSpace.Hom`; `AlgebraicGeometry.Scheme.Hom`.

### 1.35 scalar extension of the conductor cokernel

Construct the left comparison `E:F⊗_A(B/span_A{1})≃ₗ[F](F⊗_A B)/span_F{1}` using tensor right exactness
and the actual unit-span comparison. This is the left F-action. The construction needs neither flatness nor
finite generation and allows independent universes and noninjective coefficient maps.

A,B,F,D,E are commutative rings in independent universes, including zero and nonreduced rings. B,F,D,E carry
the indicated A-algebra structures; no finite, flat, faithful, injective, Noetherian or reduced hypothesis is
imposed unless stated.

([Stacks, tag 00DF](https://stacks.math.columbia.edu/tag/00DF), Complete Lemma10.12.10.)

Standing hypotheses for the maps and laws below: Tensor orientation is `F⊗_A B`, with its native left
F-algebra/module structure. This comparison does not identify the inherited right-oriented `B⊗_A F` conductor
map or global ideal-sheaf pullbacks.

The construction needs the following maps and laws.

- For any commutative A-algebra B and A-algebra F,
  `(span_A{1_B}).baseChange F` equals `span_F{1_(F⊗_A B)}` as actual F-submodules. No flatness, injectivity or
  finiteness is required. Uses `Submodule.baseChange_span`, `Algebra.TensorProduct.one_def`. Apply the native
  singleton-span base-change formula and identify 1⊗1 with the actual tensor-algebra unit.

- The conductor cokernel comparison sends s⊗[b] to [s⊗b]
  for all s∈F and b∈B. Uses §1.35. Reduce the two actual native equivalence components on representatives.

- The inverse comparison sends [s⊗b] to s⊗[b]. Uses
  §1.35. Apply injectivity of the actual comparison and its inverse law.

- The comparison sends s⊗[algebraMap A B(a)] to zero
  for every s∈F and a∈A. Uses §1.35, `Submodule.mem_span_singleton`. The class of algebraMap(a)=a•1 is zero in
  the native quotient before tensoring; use the actual equivalence map-zero law.

- `Ann_F(F⊗_A(B/span_A{1}))` equals the inverse image
  under algebraMap `F (F⊗_A B)` of the actual conductor of its image subring. This unconditional equality
  identifies the recomputed conductor; it does not assert equality with the extension of `Ann_A(B/span_A{1})`.
  Uses §1.35, `LinearEquiv.annihilator_eq`, §1.13. Transport the annihilator through the actual F-linear
  comparison. The existing §1.13 proof is repeated only inside this conductor specialization at independent
  universes because its inherited standalone header uses a common universe. Retain the full ideals and
  nilpotent elements.

- For every h:B→D and `x∈F⊗_A(B/span_A{1})`, compare then
  apply the cokernel map of the actual tensor algebra map `id_F⊗h` equals extend h̄ then
  compare. The equality is on all tensors, with F-linearity retained.

- The naturality equality is an equality of actual
  F-linear maps: `E_D` ∘ `(id_F⊗h̄) = (id_F⊗h)‾`, with h̄ the induced cokernel map ∘ `E_B`.

**Checks.**

- The comparison sends s⊗[b]+t⊗[c] to the class of s⊗b+t⊗c in the actual quotient.

- Its inverse sends the actual class of s⊗b to s⊗[b].

- The actual algebra image class s⊗[algebraMap(a)] maps to zero for all scalars.

- The class of (2,0) is nonzero in `(Z/4×Z/4)/span_(Z/4){(1,1)}`; nilpotent elements are retained.

- Under the actual quotient algebra Z/4→Z/2, the comparison sends 1⊗[(2,0)] to zero. Together with the
  preceding nonzero source class this records a class killed by nonflat scalar extension, while the quotient
  comparison itself still exists.

- For the actual algebra projection B×D→B, the F-linear comparison square commutes on every extended quotient
  element.

- Construct the actual F-linear equivalence `F⊗_A(B/span_A{1}) ≃ (F⊗_A B)/span_F{1}` by the existing
  tensorQuotientEquiv followed by quotient transport through conductor unit span base change. Both carriers are
  native module quotients.

- Use the actual unit-image submodules, tensor-algebra maps and native module quotients, retaining nilpotents.

*Needs:* `Submodule.baseChange_span`; `Algebra.TensorProduct.one_def`;
`TensorProduct.AlgebraTensorModule.tensorQuotientEquiv`; `Submodule.quotEquivOfEq`.

### 1.36 the conductor cokernel map of an algebra morphism

For an A-algebra homomorphism h:B→D, construct the conductor cokernel map on quotients by the unit spans. Its
formula sends [b] to [h(b)]. Prove identity, composition, linearity and tensor naturality; unit preservation
gives well-definedness without assuming injectivity or surjectivity.

A,B,F,D,E are commutative rings in independent universes, including zero and nonreduced rings. B,F,D,E carry
the indicated A-algebra structures; no finite, flat, faithful, injective, Noetherian or reduced hypothesis is
imposed unless stated.

([Stacks, tag 00DF](https://stacks.math.columbia.edu/tag/00DF), Complete Lemma10.12.10.)

Standing hypotheses for the maps and laws below: Tensor orientation is `F⊗_A B`, with its native left
F-algebra/module structure. This comparison does not identify the inherited right-oriented `B⊗_A F` conductor
map or global ideal-sheaf pullbacks.

The construction needs the following maps and laws.

- The actual cokernel map of h sends [b] to [h(b)]. Uses §1.36.
  Reduce the native mapQ component on a quotient representative.

- For the identity A-algebra morphism on B, the cokernel map
  equals the native identity linear map on `B/span_A{1}`. Uses §1.36. Use quotient-linear-map extensionality and
  the actual identity algebra map.

- For h:B→D and g:D→E, the conductor cokernel map of g∘h equals
  ḡ composed with h̄, as actual A-linear maps. Uses §1.36. Use
  native quotient-map extensionality and the actual composed algebra morphism on representatives.

- If an actual A-algebra morphism h:B→D is surjective, its
  conductor cokernel map is surjective. No claim is made for injective h. Uses §1.36,
  `Submodule.Quotient.mk_surjective`. Lift an actual target quotient class to D and then lift its
  representative along the supplied surjective algebra morphism.

- For every h:B→D and `x∈F⊗_A(B/span_A{1})`, compare then
  apply the cokernel map of the actual tensor algebra map `id_F⊗h` equals extend h̄ then
  compare. The equality is on all tensors, with F-linearity retained. Uses §1.35, §1.36,
  `TensorProduct.AlgebraTensorModule.map`, `Algebra.TensorProduct.map`, `Submodule.Quotient.mk_surjective`.
  Use native tensor induction; zero and addition use the actual linear maps. On pure tensors lift the quotient
  representative and reduce both actual paths to the same class [s⊗h(b)].

- The naturality equality is an equality of actual
  F-linear maps: `E_D` ∘ `(id_F⊗h̄) = (id_F⊗h)‾`, with h̄ the induced cokernel map ∘ `E_B`. Uses §1.36. Apply
  native linear-map extensionality to the all-tensor equality.

**Checks.**

- For an actual algebra morphism h, the cokernel map sends [b+c] to [h(b)+h(c)].

- For a field k of characteristic unequal to two, the swap on the diagonal k-algebra k×k sends
  [(1,0)] to −[(1,0)], and these are distinct nonzero quotient classes.

- Evaluation k[X]→k at zero sends the nonzero class [X] in `k[X]/span_k{1}` to zero.

- The inclusion k[X]→k[X,Y] sends [X] to a nonzero class and its cokernel map misses [Y].

- The cokernel map of the actual identity algebra morphism fixes every actual quotient class.

- The cokernel map of g∘h equals the composite of the two actual cokernel maps on every quotient class.

- For the actual algebra projection B×D→B, the F-linear comparison square commutes on every extended quotient
  element.

- For an actual A-algebra morphism h:B→D, construct the A-linear map `B/span_A{1}→D/span_A{1}` by native mapQ
  and the fact that h preserves the unit. No injectivity or surjectivity is assumed.

- Use the actual unit-image submodules, tensor-algebra maps and native module quotients, retaining nilpotents.

*Needs:* `Submodule.mapQ`.

### 1.37 the right-oriented conductor cokernel comparison

Compose the left-oriented comparison with the tensor-swap quotient equivalence to construct
the right comparison `E′:F⊗_A(B/span_A{1})≃ₗ[F](B⊗_A F)/span_F{1}`. The target uses the actual right
F-algebra structure. Identify the right include map and recomputed contracted conductor before applying flat
annihilator comparison.

A,B,F are commutative rings in a common universe; zero rings and nonreduced rings are allowed. B and F carry
the indicated A-algebra structures. The source `F⊗_A B` uses its native left F-action; `B⊗_A F` and its unit
quotient use native Algebra.TensorProduct.rightAlgebra. No Noetherian, reduced, faithful-flat or
finite-presentation condition is assumed. F-flatness and B-finiteness occur only where explicitly stated.

([Stacks, tag 07T8](https://stacks.math.columbia.edu/tag/07T8), Complete displayed Lemma10.40.4; [Stacks, tag
01JO](https://stacks.math.columbia.edu/tag/01JO), Section26.17, Lemmas26.17.2–4 and26.17.6(1); conductor
deduction also uses07T8.)

Standing hypotheses for the maps and laws below: every statement is about commutative rings and modules;
only the finite and flat hypotheses explicitly stated are assumed. No Noetherian, reduced, faithful-flat or
birational hypothesis is added, and no scheme or ideal-sheaf statement is used, so this section precedes
§1.14.

The construction needs the following maps and laws.

- The native F-algebra equivalence commRight from `F⊗_A B` to `B⊗_A F`
  maps the actual F-unit span onto the actual F-unit span; the target uses the native right F-action. B and F
  carry the indicated A-algebra structures. The source `F⊗_A B` uses its native left F-action; Uses
  `Submodule.map_span`, `Algebra.TensorProduct.commRight`. Apply native map_span and the actual algebra
  equivalence map-one law.

- The quotient swap sends [s⊗b] to [b⊗s] for s∈F and b∈B. B and
  F carry the indicated A-algebra structures. The source `F⊗_A B` uses its native left F-action; Uses §1.37,
  `Algebra.TensorProduct.commRight_tmul`, `Submodule.Quotient.equiv_apply`. Reduce native quotient transport
  and commRight on an actual representative.

- The inverse quotient swap sends [b⊗s] to [s⊗b]. B and F
  carry the indicated A-algebra structures. The source `F⊗_A B` uses its native left F-action; Uses §1.37. Use
  the actual equivalence injectivity and inverse law.

- The full F-annihilator of `(F⊗_A B)/span_F{1}` equals
  that of `(B⊗_A F)/span_F{1}`, with the latter carrying the native right F-action. B and F carry the indicated
  A-algebra structures. The source `F⊗_A B` uses its native left F-action; Uses §1.37,
  `LinearEquiv.annihilator_eq`. Apply native annihilator invariance to this actual F-linear equivalence.

- Construct the actual F-linear equivalence `(F⊗_A B)/span_F{1} ≃`
  `(B⊗_A F)/span_F{1}` induced by native commRight. Both carriers are the native module quotients. B and F carry
  the indicated A-algebra structures. The source `F⊗_A B` uses its native left F-action; Uses §1.37,
  `Submodule.Quotient.equiv`, `Algebra.TensorProduct.commRight`. Use native quotient equiv with the exact
  unit-span image equality; no generic tensor commutativity equivalence is replanned.

- The right-oriented conductor comparison sends s⊗[b]
  to [b⊗s]. B and F carry the indicated A-algebra structures. The source `F⊗_A B` uses its native left F-action;
  Uses §1.37, §1.35. Reduce the two actual equivalence components on tensor representatives.

- The inverse right-oriented comparison sends
  [b⊗s] to s⊗[b]. B and F carry the indicated A-algebra structures. The source `F⊗_A B` uses its native left
  F-action; Uses §1.37. Apply the actual comparison injectivity and inverse law.

- The right-oriented comparison sends
  s⊗[algebraMap A B(a)] to zero for every s∈F and a∈A. B and F carry the indicated A-algebra structures. The
  source `F⊗_A B` uses its native left F-action; Uses §1.37, §1.35. Use the left comparison scalar-zero formula
  and the quotient swap map-zero law.

- `Ann_F(F⊗_A(B/span_A{1}))` equals the inverse
  image under the actual includeRight ring map `F→B⊗_A F` of the conductor of that map’s image subring. This is
  an equality of full ideals. B and F carry the indicated A-algebra structures. The source `F⊗_A B` uses its
  native left F-action; Uses §1.37, `LinearEquiv.annihilator_eq`, §1.13. Transport annihilators through the
  actual right comparison and specialize the existing §1.13 equality to the native right F-algebra structure.
  The algebra map is definitionally includeRight.

- If A→B is injective and F is flat as an A-module, then the
  actual includeRight ring map `F→B⊗_A F` is injective. No finiteness hypothesis is needed. B and F carry the
  indicated A-algebra structures. The source `F⊗_A B` uses its native left F-action; Uses
  `Algebra.TensorProduct.includeRight_injective`. Specialize the pinned native flat tensor inclusion
  injectivity theorem; no generic flat tensor theorem is replanned.

- If B is finite as an A-module and F is flat as an A-module,
  then the extension to F of `Ann_A(B/span_A{1})` equals the actual recomputed conductor inverse image for
  `includeRight:F→B⊗_A F`. This full-ideal equality does not need A→B injective. B and F carry the indicated
  A-algebra structures. The source `F⊗_A B` uses its native left F-action; Uses SchemeAndStackFoundations SF.0,
  flat-annihilator, §1.37. The native finite quotient instance supplies finiteness of `B/span_A{1}`. Consume the
  exact SchemeAndStackFoundations SF.0 finite-module flat-annihilator export, then identify the actual right
  recomputed conductor by the new comparison.

- For an actual CommRingCat pushout A→B, A→F, B→D, F→D, if A→B is
  finite and A→F is flat, extending the full inverse-image conductor ideal of A→B to F gives the full
  inverse-image conductor ideal of F→D. Injectivity of A→B is not needed for this ideal equality. Four
  commutative rings in a common universe; the specified square is a categorical pushout, its original map is
  finite and its base-change map is flat. The original map need not be injective. Uses §1.37, §1.13, §1.2,
  `CommRingCat.isPushout_tensorProduct`, `CategoryTheory.IsPushout.isoIsPushout`,
  `CategoryTheory.IsPushout.inr_isoIsPushout_hom`. Use the native tensor-product pushout and its unique
  comparison with the given pushout. Its actual right inclusion commutes with F→D. Rewrite the finite flat
  annihilator result as the original conductor, then transport the recomputed conductor by the actual
  comparison ring equivalence, expanding §1.2 conductor membership along that equivalence. No sheaf-level
  statement is used.

**Checks.**

- The quotient swap sends [s⊗b+t⊗c] to [b⊗s+c⊗t].

- The inverse quotient swap sends [b⊗s+c⊗t] to [s⊗b+t⊗c].

- The quotient swap sends a•[s⊗b] to a•[b⊗s] using the actual right F-action on the target.

- The right comparison sends s⊗[b]+t⊗[c] to [b⊗s+c⊗t].

- The inverse right comparison sends [b⊗s] to s⊗[b].

- The right comparison sends s⊗[algebraMap(a)] to zero.

- The class of (2,0) is nonzero in `(Z/4×Z/4)/span_(Z/4){(1,1)}`.

- For the actual quotient algebra Z/4→Z/2 the right comparison sends 1⊗[(2,0)] to zero, despite the preceding
  nonzero original quotient class.

- For the finite injective diagonal Z/4→Z/4×Z/4 and the flat identity extension F=Z/4, the extended and
  recomputed conductors agree for the actual includeRight map, with full conductor ideals (both are zero).

- For that actual finite diagonal algebra and flat identity extension, includeRight sends the nonzero
  nilpotent 2∈Z/4 to a nonzero element of `(Z/4×Z/4)⊗_(Z/4)Z/4`.

- The actual right inclusion `Z/1→Z/1⊗_(Z/1)Z/1` is injective.

- Construct `F⊗_A(B/span_A{1}) ≃_F (B⊗_A F)/span_F{1}`, with the actual right F-module structure on the target,
  by composing the existing left-oriented comparison with conductor unit quotient swap. No flatness or
  finite-module hypothesis is needed.

- Keep the actual right-oriented ring map and full ideals, including nilpotents.

*Needs:* `Submodule.map_span`; `Algebra.TensorProduct.commRight`; `Submodule.Quotient.equiv`;
`Algebra.TensorProduct.commRight_tmul`; `Submodule.Quotient.equiv_apply`; `LinearEquiv.annihilator_eq`; §1.35;
§1.13; §1.2; SchemeAndStackFoundations SF.0, flat-annihilator; `CommRingCat.isPushout_tensorProduct`.

### 1.38 the actual target conductor subscheme base-change isomorphism

For flat q:T→P, construct the conductor target base change isomorphism from the recomputed target conductor of `f_q` to `T×_P`
`C_f`. Transport the full ideal-sheaf equality through the native closed-subscheme construction and `comapIso`.
Prove its two projection equations, its section-coordinate formula and compatibility with the recomputed
conductor square.

Schemes lie in a common universe. The original morphism f is finite and schematically dominant; q is an
arbitrary flat morphism. Native instances supply finiteness and schematic dominance of its actual base change.
No affine, Noetherian, reduced, separated, birational, faithful-flat or quasi-compactness hypothesis on T is
assumed. The full conductor ideals are retained; no radical replacement is used.

([Stacks, tag 01JO](https://stacks.math.columbia.edu/tag/01JO), Section26.17, Lemmas26.17.2–4 and26.17.6(1);
conductor deduction also uses07T8; [Stacks, tag 01JO](https://stacks.math.columbia.edu/tag/01JO), Stacks
Section26.17, Definition26.17.1 and Lemma26.17.6(1); [Stacks, tag
0ET0](https://stacks.math.columbia.edu/tag/0ET0), Lemma37.14.1, full.)

Standing hypotheses for the maps and laws below: Generic ideal-sheaf pullbacks, equality transport, scheme
pullbacks and isomorphism carriers are imported. These are conductor-specific comparisons; iterated
carrier/isomorphism coherence and generic Ferrand existence remain separate open obligations. Rings are
arbitrary commutative rings, including zero rings; no reducedness, Noetherianity or birationality is imposed.
Finiteness, schematic dominance, flatness and affineness are required exactly where stated. The actual full
conductor ideals and native closed-subscheme carriers are used. Generic quotient, section and pullback
theories remain imported.

The construction needs the following maps and laws.

- For finite schematically dominant f:Y→P and flat q:T→P and
  r:Z→T, the conductor of the iterated pullback map to Z equals the pullback of the original conductor along
  r≫q. Schemes and section rings lie in a common universe. Zero rings and nonreduced rings are allowed. Only
  the finite, schematically dominant and flat hypotheses explicitly stated are assumed. No Noetherian,
  reduced, separated, faithful-flat, birational or quasi-compactness hypothesis on the base-change target is
  added. Uses §1.20, `AlgebraicGeometry.Scheme.IdealSheafData.comap_comp`. Apply the exact global flat
  comparison twice and native comap_comp. Native instances supply finiteness and schematic dominance after the
  first flat base change. No identification of the two iterated pullback scheme carriers is silently assumed.

- The forward target conductor comparison followed by
  the native first pullback projection equals the recomputed conductor closed inclusion into T. Schemes lie in
  a common universe. Uses §1.38, `AlgebraicGeometry.Scheme.IdealSheafData.comapIso_hom_fst`. Compute the
  native comapIso first projection. Equality elimination on the full ideal data identifies its transported
  inclusion with the actual recomputed inclusion.

- The forward target comparison followed by
  the native second projection and the old conductor inclusion equals the recomputed conductor inclusion
  followed by q. Schemes lie in a common universe. Uses §1.38, `CategoryTheory.Limits.pullback.condition`. Use
  the actual native pullback square and the proved first-projection identity.

- The inverse target comparison followed by the
  recomputed conductor inclusion equals the native first projection of the old conductor pullback. Schemes lie
  in a common universe. Uses §1.38. Rewrite the recomputed inclusion by the forward projection equation and
  cancel the actual inverse/forward isomorphism pair.

- The recomputed target inclusion, the forward
  comparison followed by the second projection, q and the original target inclusion form a native IsPullback
  square with those exact morphisms. Schemes lie in a common universe. Uses §1.38,
  `CategoryTheory.IsPullback.of_iso_pullback`. Supply the actual comparison isomorphism and both projection
  equations to the native cartesian-square criterion.

- Let f:Y→P be finite and schematically dominant and
  q:T→P flat. Every nonzero global section z of the actual recomputed target conductor subscheme remains
  nonzero under the section map induced by the inverse of the actual conductor target base change isomorphism(f,q). All
  schemes in a statement share an arbitrary universe. Uses §1.38, `AlgebraicGeometry.Scheme.Γ`,
  `CategoryTheory.Functor.mapIso`. Apply the native global-section functor to the opposite of the symmetric
  actual scheme isomorphism. Cancel its inverse after an assumed zero image. A local proof fact about
  arbitrary scheme isomorphisms keeps the conductor construction opaque during kernel checking; it adds no
  generic public carrier.

- Let f:Y→P be finite and schematically
  dominant, q:T→P flat and T affine. If a in Γ(T,top) lies outside the top ideal of `I_f.comap q` and `a^n=0`,
  there is a nonzero section z of the actual recomputed conductor subscheme with `z^n=0` whose image under the
  inverse target-comparison section map is nonzero. All schemes in a statement share an arbitrary universe.
  Uses §1.16, §1.38, §1.20. Use the retained equality of the full recomputed and pulled-back conductor ideals.
  Apply the preceding quotient-section lemma and nonzero-comparison lemma. No nilpotence is inferred merely
  from a ring used as a surrogate for the actual subscheme.

- For every commutative ring R, n in the natural
  numbers and a≠0 in R with `a^n=0`, the diagonal Spec(R×R)→Spec(R), after identity base change, has an actual
  target conductor global section z≠0 with `z^n=0`, and the actual inverse target-comparison section map keeps z
  nonzero. Finiteness and schematic dominance are supplied by the preceding lemmas. All schemes in a statement
  share an arbitrary universe. Uses §1.38, §1.16, `AlgebraicGeometry.Scheme.IdealSheafData.comap_id`,
  `AlgebraicGeometry.Scheme.ΓSpecIso`. Transport a into actual global sections by ΓSpecIso inverse. The full
  diagonal conductor ideal is zero, so injectivity proves nonmembership. Ring-map laws preserve the vanishing
  nth power, and the flat section theorem supplies the actual recomputed conductor section.

**Checks.**

- For arbitrary finite schematically dominant f and flat q, the actual target isomorphism has its native
  inverse roundtrip, preserves the recomputed closed inclusion and supplies the exact native cartesian target
  square.

- The actual recomputed conductor map and the two actual comparison isomorphisms satisfy the square with native
  pullback.map on the original conductor morphism and the actual source/target projections.

- For any flat base change of an identity scheme morphism, both actual recomputed conductor closed subschemes
  are empty.

- For identity base change of arbitrary f, the actual target comparison preserves the original target
  inclusion after its second projection and the inverse source comparison preserves the actual source
  inclusion.

- For restriction to any open of P, both actual recomputed conductor inclusion squares are native pullbacks.
  No affineness of the open is assumed.

- Over Spec(Z/1), the actual target inverse inclusion equation and source comparison roundtrip hold without
  assuming any scheme point exists.

- For the actual finite schematically dominant diagonal Spec(Z/4 times Z/4) to Spec(Z/4), after identity base
  change the actual recomputed target conductor closed subscheme has a nonzero square-zero global section. Its
  actual section map induced by the inverse target comparison remains nonzero. A radical replacement fails
  this test.

- For every actual target conductor comparison along a flat map, its inverse section map preserves both
  nonzeroness and the vanishing nth power of a global conductor section.

- For the actual diagonal over Z/8, derive its morphism hypotheses and use the nonzero element2 with cube zero
  to obtain a nonzero actual recomputed conductor section with cube zero and nonzero inverse-comparison image.

- For finite schematically dominant f:Y to P and flat q:T to P, construct an actual scheme isomorphism from
  the recomputed target conductor closed subscheme of pullback.snd f q to the native pullback of q and the
  original target conductor inclusion.

- Use actual recomputed conductor closed subschemes and their actual inclusion/projection morphisms; preserve
  nilpotent sections and the empty zero-ring case.

*Needs:* §1.20; `AlgebraicGeometry.Scheme.IdealSheafData.comap_comp`; §1.16; `CategoryTheory.eqToIso`;
`AlgebraicGeometry.Scheme.IdealSheafData.comapIso`.

### 1.39 the actual source conductor subscheme base-change isomorphism

Construct the conductor source base change isomorphism from the recomputed source conductor of `f_q` to `Y_T×_Y D_f`, using the
full source-ideal equality along the native pullback first projection. Prove the actual source inclusion and
conductor map commute with the target comparison. Equality of ambient reduced closed sets would not supply this
isomorphism.

Schemes lie in a common universe. The original morphism f is finite and schematically dominant; q is an
arbitrary flat morphism. Native instances supply finiteness and schematic dominance of its actual base change.
No affine, Noetherian, reduced, separated, birational, faithful-flat or quasi-compactness hypothesis on T is
assumed. The full conductor ideals are retained; no radical replacement is used.

([Stacks, tag 01JO](https://stacks.math.columbia.edu/tag/01JO), Stacks Section26.17, Definition26.17.1 and
Lemma26.17.6(1); [Stacks, tag 01JO](https://stacks.math.columbia.edu/tag/01JO).)

Standing hypotheses for the maps and laws below: Generic ideal-sheaf pullbacks, equality transport, scheme
pullbacks and isomorphism carriers are imported. These are conductor-specific comparisons; iterated
carrier/isomorphism coherence and generic Ferrand existence remain separate open obligations.

The construction needs the following maps and laws.

- The forward source conductor comparison followed by
  the first native pullback projection equals the recomputed source conductor inclusion into the actual
  base-changed source scheme. Schemes lie in a common universe. Uses §1.39,
  `AlgebraicGeometry.Scheme.IdealSheafData.comapIso_hom_fst`. Compute the native first projection and
  eliminate the equality of the full source ideal data to compare the transported inclusions.

- The forward source comparison followed by
  the native second projection and the old source conductor inclusion equals the recomputed source inclusion
  followed by pullback.fst f q. Schemes lie in a common universe. Uses §1.39,
  `CategoryTheory.Limits.pullback.condition`. Use the native source pullback square and its actual
  first-projection identity.

- The inverse source comparison followed by the
  recomputed source conductor inclusion equals the native first projection of the pullback of the old source
  conductor. Schemes lie in a common universe. Uses §1.39. Use the actual forward projection identity and the
  native inverse/forward isomorphism cancellation.

- The recomputed source conductor inclusion, forward
  comparison followed by second projection, pullback.fst f q and original source conductor inclusion form a
  native IsPullback square with those exact morphisms. Schemes lie in a common universe. Uses §1.39,
  `CategoryTheory.IsPullback.of_iso_pullback`. Apply the native cartesian-square criterion to the actual
  source comparison isomorphism and projection identities.

- The recomputed g_followed by the target
  comparison equals the source comparison followed by the native pullback.map induced by the actual
  base-change source/target projections, original conductor map and original f. The two defining squares are
  the actual scheme pullback condition and original conductor map inclusion square. Schemes lie in a common
  universe. Uses §1.38, §1.39, §1.17, `CategoryTheory.Limits.pullback.map`,
  `CategoryTheory.Limits.pullback.condition`. Compose both sides with the inverse target comparison. The
  uniqueness of the conductor map reduces equality to the closed-inclusion square; the native
  first-projection formula and the source/target inclusion equations prove that square.

- The inverse source comparison followed by the
  recomputed conductor map equals the native base-changed original g_followed by the inverse target
  comparison, as actual scheme morphisms. Schemes lie in a common universe. Uses §1.39. Compose the proved
  forward square with the actual inverse source and target comparisons and use the native isomorphism
  identities.

- For finite schematically dominant f:Y to P, the actual g_f
  followed by the target conductor closed inclusion equals the source conductor closed inclusion followed by
  f. Schemes in a common universe; f is finite and schematically dominant. No base-change morphism or flatness
  hypothesis is needed. Uses §1.17, `AlgebraicGeometry.Scheme.IdealSheafData.comapIso_hom_fst`,
  `CategoryTheory.Limits.pullback.condition`. Promote the cartesian square of §1.17 without
  changing its declaration or hypotheses. Its retained native proof unfolds the conductor map and uses the native
  pullback condition and comapIso_hom_fst projection identity. The base-changed conductor map is built on this
  square.

**Checks.**

- For arbitrary f and flat q, the actual source isomorphism has its native inverse roundtrip, preserves the
  actual recomputed source inclusion and supplies the exact native cartesian source square.

- The actual recomputed conductor map and the two actual comparison isomorphisms satisfy the square with native
  pullback.map on the original conductor morphism and the actual source/target projections.

- For any flat base change of an identity scheme morphism, both actual recomputed conductor closed subschemes
  are empty.

- For identity base change of arbitrary f, the actual target comparison preserves the original target
  inclusion after its second projection and the inverse source comparison preserves the actual source
  inclusion.

- For restriction to any open of P, both actual recomputed conductor inclusion squares are native pullbacks.
  No affineness of the open is assumed.

- Over Spec(Z/1), the actual target inverse inclusion equation and source comparison roundtrip hold without
  assuming any scheme point exists.

- Construct an actual scheme isomorphism from the recomputed source conductor closed subscheme of pullback.snd
  f q to the native pullback of pullback.fst f q and the old source conductor inclusion into Y.

- Use actual recomputed conductor closed subschemes and their actual inclusion/projection morphisms; preserve
  nilpotent sections and the empty zero-ring case.

*Needs:* §1.20; §1.16; `CategoryTheory.eqToIso`; `AlgebraicGeometry.Scheme.IdealSheafData.comapIso`.

### 1.40 the target conductor carrier comparison for a flat tower

For a flat tower Z→T→P, construct the conductor target tower isomorphism between twice and directly recomputed target
conductor subschemes of Z. Both full ideals equal the pullback of the original conductor along the composite.
Prove the inclusion equation and agreement with the iterated base-change isomorphisms; then prove three-step
coherence by uniqueness over the closed inclusion.

Schemes in a common universe; f:Y→P finite and schematically dominant; q:T→P and r:Z→T flat. Native
base-change and composition instances supply the required hypotheses. `C_g` denotes the native closed subscheme
of the full conductor ideal sheaf I_g; `i_g` is its actual closed inclusion. `e_(g,a)` is the target
conductor base-change isomorphism for g and a. Composition is written in traversal order. No affine,
Noetherian, reduced, separated, birational, faithfully-flat or nonempty assumption is added. These are
target-conductor comparisons; source-carrier tower coherence and three-step coherence remain distinct
obligations.

([Stacks, tag 01JO](https://stacks.math.columbia.edu/tag/01JO), Section26.17 Definition26.17.1 and
Lemma26.17.6(1).)

The construction needs the following maps and laws.

- The forward carrier comparison t.hom followed by the
  direct recomputed target conductor inclusion into Z equals the twice-recomputed target conductor inclusion
  into Z. Uses §1.40. Eliminate the equality of full ideal data used by t; the transported closed inclusion
  becomes the original inclusion.

- The inverse carrier comparison t.inv followed by the
  twice-recomputed target conductor inclusion equals the direct recomputed target conductor inclusion. Uses
  §1.40. Rewrite the twice-recomputed inclusion using the forward formula and cancel the inverse-forward pair.

- Every actual morphism from the twice-recomputed target
  conductor subscheme to the direct recomputed one whose composite with the direct closed inclusion is the
  twice-recomputed inclusion equals t.hom. Uses §1.40, `AlgebraicGeometry.Scheme.IdealSheafData.subschemeι`.
  Cancel the native monomorphism given by the direct closed-subscheme inclusion; use the proved forward
  inclusion equation.

- As whole native scheme isomorphisms, `e_(f_q,r)` followed
  by h equals t followed by `e_(f,r∘q)`, where e is the existing conductor target base change isomorphism. All four corners
  are the actual recomputed conductor subschemes or native scheme pullbacks. Uses §1.40, §1.38,
  `CategoryTheory.Iso.ext`, `CategoryTheory.Limits.pullback.fst_of_mono`. Use native Iso.ext. Cancel the first
  projection of the direct pullback, which is monic because the old conductor inclusion is monic. Both
  composites with it equal the twice-recomputed closed inclusion by the three listed projection identities.

- The composite h.inv followed by `e_(f_q,r).inv`
  equals `e_(f,r∘q).inv` followed by t.inv, as actual scheme morphisms between the specified carriers. Uses
  §1.40. Apply congruence to the inverse field of the proved whole-isomorphism equality; the composite inverse
  has the indicated reversed order.

- The morphism from `C_((f_q)_r)` to `C_f` obtained by
  `e_(f_q,r)`, the intermediate second projection, `e_(f,q)` and its second projection equals the route through t,
  `e_(f,r∘q)` and the direct second projection. Uses §1.40. Postcompose the whole-isomorphism equality with the
  direct second projection, then substitute the actual flattening second-projection formula.

- The forward flattening h.hom followed by the
  direct pullback first projection to Z equals the iterated pullback first projection to Z. Uses §1.40,
  `CategoryTheory.Limits.pullbackRightPullbackFstIso_hom_fst`. Use the native pasting first-projection formula
  and the first-projection computation of pullback.map with its identity component on Z.

- The forward flattening h.hom followed by the
  direct second projection to `C_f` equals the successive composite: second projection to `C_(f_q)`, forward
  conductor target base change isomorphism(f,q), and second projection to `C_f`. Uses §1.40,
  `CategoryTheory.Limits.pullbackRightPullbackFstIso_hom_snd`. Compute the second projection using the native
  pasting formula and pullback.map second projection. Keep the actual intermediate target comparison in the
  composite.

- The inverse flattening h.inv followed by the
  iterated first projection to Z equals the direct first projection. Uses §1.40. Precompose the forward
  first-projection identity with h.inv and cancel the inverse-forward pair.

- The inverse flattening h.inv followed by the
  successive old-conductor projection through `C_(f_q)` and conductor target base change isomorphism(f,q) equals the direct
  second projection to `C_f`. Uses §1.40. Precompose the full forward second-projection identity with h.inv;
  reassociate and cancel.

- Construct the actual scheme isomorphism h from the native
  pullback of r and the recomputed conductor inclusion `i_(f_q)` to the native pullback of r∘q and `i_f`. First
  use native pullback.map induced by identities on Z,T and the actual conductor target base change isomorphism(f,q), then
  the native right pullback-pasting isomorphism. Uses §1.38, `CategoryTheory.Limits.pullback.map`,
  `CategoryTheory.Limits.pullback.map_isIso`, `CategoryTheory.asIso`,
  `CategoryTheory.Limits.pullbackRightPullbackFstIso`. The existing target comparison identifies `i_(f_q)` with
  the first projection of the pullback of q and `i_f`. Thus the native map has three isomorphism components and
  is an isomorphism. Compose its asIso with native pullbackRightPullbackFstIso; no generic pullback carrier is
  introduced.

**Checks.**

- The actual carrier comparison has its native roundtrip and the inverse preserves the full twice-recomputed
  closed inclusion.

- Every scheme isomorphism between the specified recomputed conductor carriers preserving the inclusion equals
  the constructed tower isomorphism as a whole isomorphism.

- The inverses of the successive and direct composite comparison isomorphisms are equal as whole native
  isomorphisms.

- After precomposition with the actual conductor map of the twice-base-changed finite morphism, the successive
  and direct maps to the old target conductor agree. This does not assert source-carrier tower coherence.

- Two identity base changes satisfy the whole tower comparison on the actual native pullback carriers; no
  definitional identification of these carriers with the original one is assumed.

- For any open U of P and any open V of U, without either being affine, the successive restriction comparison
  equals the direct comparison along V→U→P after the specified carrier isomorphisms.

- Over Spec(Z/1), both actual conductor carrier and native pullback flattening isomorphisms have the native
  forward-inverse roundtrip, without a point or nontriviality hypothesis.

- The inverse native pullback flattening preserves both the last-base projection and the full successive
  projection to the original conductor.

- For finite schematically dominant f:Y→P and flat q:T→P, r:Z→T, construct the actual scheme isomorphism t
  from the target conductor subscheme of `(f_q)_r` to the target conductor subscheme of `f_(r∘q)`, both closed in
  Z. Here `f_q` is the native second projection of the pullback of f and q.

- Use actual native recomputed conductor carriers and inclusions; do not replace a whole-isomorphism equality
  by an ideal equality alone.

*Needs:* §1.38; §1.20; `CategoryTheory.eqToIso`.

### 1.41 the actual source conductor carrier tower comparison

Construct the conductor source tower isomorphism over the actual associator between the twice and directly pulled-back
source schemes. Transport the source conductors through that associator and the source base-change
isomorphisms. Prove the inclusion and conductor-map squares, inverse equations and three-step coherence. Do
not identify the ambient source schemes by a definitional equality.

Schemes in one universe. f:Y→P is finite and schematically dominant; q:T→P and r:Z→T are flat. `f_q` means
native pullback.snd f q. Native composition and base-change instances supply the corresponding hypotheses. `I_g`
is the full target conductor ideal, `J_g=I_g.comap g` the full source ideal. a is native
pullbackLeftPullbackSndIso(f,q,r); t is the retained conductor target tower isomorphism. Traversal order is used for
composition. No reduced, affine, Noetherian, separated, birational, faithfully-flat or nonempty assumption is
added. Generic ideal/pullback carriers remain native or supplied by SchemeAndStackFoundations SF.0;
geometric pushout transport and three-step coherence are separate obligations.

([Stacks, tag 01JO](https://stacks.math.columbia.edu/tag/01JO), Section26.17 Definition26.17.1 and
Lemma26.17.6(1).)

The construction needs the following maps and laws.

- For finite schematically dominant f:Y→P and flat q:T→P, r:Z→T,
  the full source conductor ideal of `(f_q)_r` equals the inverse image of the full source conductor ideal of
  `f_(r∘q)` along the actual ambient isomorphism a: `(Y×_P T)×_T Z ≅ Y×_P Z` given by native
  pullbackLeftPullbackSndIso. Traversal order is used for composition. Uses §1.20,
  `AlgebraicGeometry.Scheme.IdealSheafData.comap_comp`,
  `CategoryTheory.Limits.pullbackLeftPullbackSndIso_hom_fst`. Apply the retained source flat comparison three
  times. Combine inverse-image ideals with native comap_comp. The exact first-projection formula for a
  identifies the two composites to Y. Compare full ideal data, including nilpotents.

- The forward flattening h.hom followed by the
  direct first projection equals the iterated first projection followed by a.hom. Traversal order is used for
  composition. Uses §1.41, `CategoryTheory.Limits.pullbackRightPullbackFstIso_hom_fst`. Compute the first
  projections of both actual pullback.map factors and the intervening native pasting isomorphism. Retain a.hom
  in the final formula.

- The forward flattening h.hom followed by the
  direct second projection to the original source conductor equals the iterated second projection followed by
  the intermediate source comparison and its second projection. Traversal order is used for composition. Uses
  §1.41, `CategoryTheory.Limits.pullbackRightPullbackFstIso_hom_snd`. Compute the native map and pasting
  second projections; the final ambient map has the identity conductor component.

- The inverse h.inv followed by the iterated first
  projection equals the direct first projection followed by a.inv. Traversal order is used for composition.
  Uses §1.41. Cancel the isomorphism a.hom after postcomposition. Substitute the forward first-projection
  formula and cancel h.inv followed by h.hom.

- The inverse h.inv followed by the iterated second
  projection, intermediate source comparison and old-source second projection equals the direct second
  projection. Traversal order is used for composition. Uses §1.41. Precompose the full forward
  second-projection formula with h.inv and cancel the inverse-forward pair.

- As whole native scheme isomorphisms, the source
  comparison for `(f_q,r)` followed by h equals s followed by the direct source comparison for (f,r∘q). All
  corners are actual recomputed conductor carriers and native pullbacks. Traversal order is used for
  composition. Uses §1.41, `CategoryTheory.Iso.ext`. Expand the actual construction of s and cancel the direct
  comparison inverse-forward pair; Iso.ext gives equality of the whole isomorphisms.

- The inverse h.inv followed by the inverse
  source comparison for `(f_q,r)` equals the inverse direct source comparison followed by s.inv. Traversal order
  is used for composition. Uses §1.41. Apply congruence to the inverse field of the proved whole-isomorphism
  equality; retain the reversed composite order.

- The route from the twice-recomputed source
  conductor through the successive source comparisons and second projections to the original source conductor
  equals the route through s, the direct source comparison and its second projection. Traversal order is used
  for composition. Uses §1.41. Postcompose the whole-isomorphism equality with the actual direct second
  projection and substitute the flattening second-projection formula.

- Construct the actual scheme isomorphism h from the
  pullback of the intermediate source conductor inclusion along the second source projection to the pullback
  of the original source conductor inclusion along the direct source projection. It uses the existing source
  comparison, right pullback pasting, and the actual ambient a via native pullback.map. Traversal order is
  used for composition. Uses §1.39, `CategoryTheory.Limits.pullback.map`,
  `CategoryTheory.Limits.pullback.map_isIso`, `CategoryTheory.asIso`,
  `CategoryTheory.Limits.pullbackRightPullbackFstIso`, `CategoryTheory.Limits.pullbackLeftPullbackSndIso`,
  `CategoryTheory.Limits.pullbackLeftPullbackSndIso_hom_fst`. First use pullback.map with the existing
  intermediate source comparison and identity ambient components. Flatten by the native right-pasting
  isomorphism. Use a.hom on the ambient source and identities on the original conductor and Y to change to the
  direct source projection. Each native map has three isomorphism components; convert it with asIso.

- The forward s.hom followed by the direct source
  conductor inclusion equals the twice-recomputed source inclusion followed by a.hom. Traversal order is used
  for composition. Uses §1.41, §1.39. Use the inverse direct comparison inclusion formula, the flattening
  first-projection formula and the iterated source comparison first-projection formula.

- The inverse s.inv followed by the twice-recomputed
  source inclusion equals the direct source inclusion followed by a.inv. Traversal order is used for
  composition. Uses §1.41. Cancel a.hom, substitute the forward inclusion equation and cancel s.inv followed
  by s.hom.

- Every actual morphism between the specified source
  conductor carriers whose composite with the direct inclusion is the twice-recomputed inclusion followed by
  a.hom equals s.hom. Traversal order is used for composition. Uses §1.41,
  `AlgebraicGeometry.Scheme.IdealSheafData.subschemeι`. Cancel the actual direct closed inclusion, a native
  monomorphism, and use the proved forward inclusion law.

- The source carrier comparison s.hom followed by the actual
  directly recomputed conductor map equals the actual twice-recomputed g_followed by the retained
  target carrier comparison t.hom. This is the full source-target conductor-map square. Traversal order is
  used for composition. Uses §1.41, §1.39, §1.40, `CategoryTheory.Limits.pullbackLeftPullbackSndIso_hom_snd`.
  Cancel the direct target closed inclusion. The cartesian square of §1.17 contracts both vertical
  composites to their actual ambient finite morphisms. The source inclusion law and native ambient
  second-projection formula make the two sides equal; the target inclusion law identifies the other route.

- The inverse s.inv followed by the actual
  twice-recomputed conductor map equals the actual directly recomputed g_followed by t.inv.
  Traversal order is used for composition. Uses §1.41. Precompose the forward square with s.inv and
  postcompose with t.inv, then cancel both inverse-forward pairs and reverse the resulting equality.

**Checks.**

- Both inverse flattening projections hold on actual source pullbacks; the first explicitly retains a.inv and
  the second retains the intermediate conductor comparison.

- The inverses of the whole successive and direct source-comparison composite isomorphisms agree.

- Two identity base changes satisfy the whole source tower comparison on the actual native carriers, retaining
  their ambient pasting maps.

- Over Spec(Z/1), both source carrier and source pullback flattening isomorphisms have their native
  forward-inverse roundtrips.

- The actual source carrier comparison has its native forward-inverse roundtrip and its inverse inclusion
  follows the actual inverse ambient pasting isomorphism.

- Every whole scheme isomorphism between the two specified source conductor carriers preserving the ambient
  inclusion equals the constructed s.

- The forward and inverse squares of the actual twice/direct conductor maps and actual source/target tower
  carrier comparisons both commute.

- For every open U of P and every open V of U, without affineness assumptions, the actual conductor maps
  commute with source and target carrier comparisons along V→U→P.

- For the actual diagonal Spec(Z/4×Z/4)→Spec(Z/4), prove finiteness and schematic dominance from the native
  maps, exhibit nonzero square-zero2 in the base ring, and prove the actual source-target conductor-map tower
  square for two identity base changes. Check the conductor section and tower-map comparisons independently.

- Construct the actual scheme isomorphism s from the twice-recomputed source conductor carrier to the directly
  recomputed source conductor carrier. Compose the existing source comparison for `(f_q,r)`, h, and the inverse
  of the existing direct source comparison for (f,r∘q). Its ambient morphism is the actual a, not an equality
  identification of the source schemes.

- Use the actual source ambient isomorphism and full conductor ideals; retain exact forward and inverse
  morphisms.

*Needs:* §1.20; `AlgebraicGeometry.Scheme.IdealSheafData.comap_comp`;
`CategoryTheory.Limits.pullbackLeftPullbackSndIso_hom_fst`; §1.39; `CategoryTheory.Limits.pullback.map`;
`CategoryTheory.Limits.pullback.map_isIso`; `CategoryTheory.asIso`;
`CategoryTheory.Limits.pullbackRightPullbackFstIso`; `CategoryTheory.Limits.pullbackLeftPullbackSndIso`;
`CategoryTheory.Limits.pullbackRightPullbackFstIso_hom_fst`;
`CategoryTheory.Limits.pullbackRightPullbackFstIso_hom_snd`.

### 1.42 conductor ideal sheaves after flat base change on affine charts

For finite schematically dominant f:Y→P, flat q:T→P, affine U⊂P and affine V⊂T with V⊂q⁻¹U, identify the
V-ideal of the recomputed conductor of the base change `f_q` with the extension of the U-conductor along the
actual q.appLE U V. The pullback of the conductor ideal sheaf along any q has the same chart description
without flatness; flatness is what identifies it with the recomputed conductor.

A,B,F are the section rings of the charts; zero and nonreduced rings are allowed. No affineness of q,
Noetherian, reduced, separated or quasi-compactness hypothesis is added. This section consumes the ring-level
comparisons of §1.37 and the ideal-sheaf datum of §1.16, and it precedes the global comparison of §1.20.

([Stacks, tag 07T8](https://stacks.math.columbia.edu/tag/07T8), Lemma10.40.4;
[Stacks, tag 01JO](https://stacks.math.columbia.edu/tag/01JO), Section26.17, Lemma26.17.6(1).)

The comparison needs the following laws.

- For finite schematically dominant f:Y→P, any q:T→P, affine
  U⊂P and affine V⊂T with V⊂q⁻¹U, the V-ideal of I_f.comap q equals the extension of the
  U-conductor ideal along the actual q.appLE U V. Neither q-affineness nor q-flatness is required. Schemes and
  section rings lie in a common universe. Zero rings and nonreduced rings are allowed. Uses
  SchemeAndStackFoundations SF.0, ideal-comap-top, SchemeAndStackFoundations SF.0, ideal-restrict-top, §1.16,
  `AlgebraicGeometry.Scheme.IdealSheafData.comap_comp`, `AlgebraicGeometry.Scheme.Hom.resLE_comp_ι`,
  `AlgebraicGeometry.Scheme.Hom.resLE_app_top`, `Ideal.comap_injective_of_surjective`,
  `Ideal.map_comap_of_surjective`, `Ideal.map_symm`. Restrict q to V→U and consume the
  SchemeAndStackFoundations SF.0 native affine ideal-pullback formula. Use native composition of ideal
  pullbacks and resLE_comp_ι. Transport along the two actual topIso section isomorphisms and cancel the
  surjective source topIso. This conductor specialization imports the generic ideal theory without replanning
  it.

- For finite schematically dominant f:Y→P and flat q:T→P, on every
  affine V⊂q⁻¹U with U affine, the recomputed conductor of pullback.snd f q on V equals the extension of the
  original U-conductor along q.appLE U V. All ideals are full ideals. Schemes and section rings lie in a
  common universe. Zero rings and nonreduced rings are allowed. Uses §1.37, §1.16,
  `AlgebraicGeometry.isIso_pushoutSection_of_isAffineOpen`, `AlgebraicGeometry.isIso_pushoutSection_iff`,
  `AlgebraicGeometry.Scheme.Hom.finite_app`, `AlgebraicGeometry.Scheme.Hom.flat_appLE`,
  `AlgebraicGeometry.Scheme.Hom.app_eq_appLE`, `CategoryTheory.Limits.pullback.condition`. The inverse image
  of V under pullback.snd is the intersection of its inverse image with the pullback of f⁻¹U. Native
  affine-section comparison makes the actual four section maps a ring pushout. Apply conductor comap pushout
  with native finite_app and flat_appLE, then identify both actual conductor ideal-sheaf affine ideals.

**Checks.**

- For the cusp C=k[t²,t³]⊂k[t] and the flat base change F=C[ε]/(ε²), the chart conductor of the base change
  is I+εI with I=(t²,t³), which is the extension of I along C→F; the element εt² lies in it and εt does not.

- For affine V⊂W⊂q⁻¹U, restricting the extended U-conductor from W to V equals extending it directly along
  q.appLE U V, using the actual presheaf restriction map.

- Following an arbitrary flat base change by restriction to any open V gives the conductor ideal obtained by
  restricting the first pulled-back ideal to V.

- Base change of any finite schematically dominant f along the identity has exactly the original conductor
  ideal sheaf, and after any flat base change of the identity morphism the conductor ideal sheaf is the whole
  ideal; identity base change of the identity of Spec(Z/1) has the whole conductor ideal sheaf.

- For the actual finite schematically dominant Spec(Z/4×Z/4)→Spec(Z/4) induced by the diagonal, after identity
  base change the global section corresponding to the nonzero square-zero element2 is not in the conductor
  ideal. Thus replacing this full ideal by its radical fails the test.

- For the nonflat closed immersion Spec C/(t²)→Spec C the pulled-back ideal is computed by the chart formula,
  but it is not the recomputed conductor: the class of t³ is nonzero in C/(t²) and maps to zero in k[t]/(t²),
  so the base-changed map is not injective and the flatness hypothesis cannot be dropped.

*Needs:* §1.16; §1.37; SchemeAndStackFoundations SF.0, ideal-comap-top; SchemeAndStackFoundations SF.0,
ideal-restrict-top; `AlgebraicGeometry.Scheme.IdealSheafData.comap_comp`;
`AlgebraicGeometry.isIso_pushoutSection_of_isAffineOpen`; `AlgebraicGeometry.Scheme.Hom.flat_appLE`;
`AlgebraicGeometry.Scheme.Hom.finite_app`.

### Examples

At the cusp A=k[t²,t³]⊂k[t], the ambient conductor is (t²) and the contracted conductor is (t²,t³). Thus
C=Spec k and D=Spec k[ε]/ε². Replacing (t²) by its radical would delete ε and destroy the reconstruction. For
the diagonal Z/4→Z/4×Z/4 the conductor is zero; the nonzero square-zero element 2 survives on both conductor
subschemes. For `f=id_Z` and I=0, δ(0,[1])=−[1], fixing the subtraction sign. A nonflat specialization can
enlarge a recomputed conductor; flatness is the exact preservation hypothesis.

### Dependencies

Mathlib ring, quotient, tensor, localization, scheme and ideal-sheaf APIs; SchemeAndStackFoundations SF.0–SF.1; StableReduction Layer 3 only for comparison with smooth-section clutching;
AlgebraicModuliForArithmeticGeometry Layer 7 for the invertible-sheaf groupoid.

The conductor comparisons are built in this order: the ring-level cokernel, annihilator and pushout
comparisons (§§1.35–1.37), the flat ring comparison (§1.14), localization (§1.15), the conductor ideal sheaf
(§1.16), its affine flat charts (§1.42), the global flat comparison with the source-ideal equality (§1.20), and
then the subscheme isomorphisms and towers (§§1.38–1.41). The section numbers group the targets by topic;
the build order of the whole layer, in which every `*Needs:*` reference points to an earlier target, is
§§1.1–1.2, §1.4, §§1.12–1.13, §1.21, §1.3, §§1.5–1.11, §§1.22–1.25, §1.32, §§1.35–1.37, §§1.14–1.18,
§§1.26–1.31, §§1.33–1.34, §1.19, §1.42, §1.20, §§1.38–1.41.

## Layer 2: genus-one fibers and binary elliptic curves

### 2.1 genus-one fibration

Define the genus one fibration with the full standing geometric hypotheses: dimensions two and one, smooth proper
geometrically integral total space and base, proper flat contraction, and regular geometrically integral
generic curve with H⁰=K and h¹=1. Define elliptic, quasielliptic and relative minimality from those geometric
conditions. Localizing at a closed point must produce the existing `TauCeti.Model` with its specified generic
fiber; a partial bundle of a flat map and an effective divisor is insufficient.

Extend the existing DVR model by a global curve base, and impose generic genus using genuine coherent
cohomology. Use the imported minimal-model criterion for the smooth generic case; do not infer smoothness from
regularity over the imperfect field k(B).

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, p. 9; §3, p. 9; §4, pp. 12–13; arXiv v3.)

The construction needs the following maps and laws.

- Localization at a closed base point is the existing TauCeti.Model, with the
  chosen generic-fiber identification.

- For a point b return the scheme-theoretic fiber over κ(b), not its reduction.

- Field extension gives the base-changed fibration; regularity/minimality must
  be re-established when not preserved.

- Elliptic iff the generic fiber is smooth over k(B).

**Checks.**

- For E/k elliptic, E×P¹→P¹ is elliptic with genus1 generic fiber.

- A regular non-smooth genus-one generic curve in characteristic2 is quasielliptic and must not satisfy the
  elliptic predicate.

- A localized fibration retains the schematic multiple fiber, even if its reduction is smooth.

*Needs:* `TauCeti.Model`; SchemeAndStackFoundations SF.3, Picard/Brauer and curve-cohomology contracts;
StableReduction Layer 2; StableReduction Layer 5.

### 2.2 divisors of fiber and canonical type

On a smooth proper surface define the fiber type divisor by a nonzero connected effective divisor D=ΣnᵢCᵢ,
positive coefficients and D·Cᵢ=0 for every component. A canonical-type divisor additionally requires `K_S·Cᵢ=0`.
Construct its multiplicity, primitive divisor and reduced divisor from the actual finite support. Prove the
weighted component pairing agrees with the existing numerical-type realization.

Use the existing effective divisor, intersection and finite component carriers. Take a positive gcd on the
nonempty support; form the quotient coefficients without truncating division.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, p. 9; arXiv v3.)

The construction needs the following maps and laws.

- A positive integral multiple is of fiber type, and of canonical type when the
  original is.

- The indecomposable divisor has coefficient gcd1 and `m·D_ind=D`.

- The reduced divisor has every coefficient1.

- For a localized regular model, use the existing numerical type with its
  residue-degree weights, rather than an unweighted replacement.

**Checks.**

- A smooth genus-one fiber has multiplicity1 and `D_ind=D_red`.

- For a double smooth fiber, m=2, `D_ind=D_red`, and D differs from both.

- For an I₀* fiber, gcd1 but the central component has coefficient2, so `D_ind≠D_red`.

- A connected negative-definite exceptional divisor cannot be of fiber type.

*Needs:* SchemeAndStackFoundations SF.5 intersection/adjunction; StableReduction Layer 4; StableReduction Layer 6.

### 2.3 geometric Kodaira realization

Define the geometric Kodaira fibre predicate, the geometric realization of a Kodaira symbol by the primitive divisor of a
possibly multiple fiber, including the regular nonsmooth generic case. Retain component schemes, normalization
genera, primitive null-root coefficients, intersection lengths and incidence points. For I₂ distinguish two
nodes from the length-two tangency of III; for I₃ distinguish three nodes from the common triple point of IV.
A graph or a coefficient list alone cannot define this predicate.

Import the symbol type from EllipticCurves Layer4 and attach its geometric realization, without creating a
second enum. Use scheme-theoretic intersection lengths over κ(b), and transport to geometric fibers.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, pp. 9–10; arXiv v3.)

The construction needs the following maps and laws.

- I₀ has one component; `I_n` has n components for n≥1;
  `I_n*` has n+5, IV* has 7, III* has 8 and II* has 9.

- A singular multiplicative underlying fiber has symbol `I_n` with
  n≥1.

- The geometric symbol is invariant after extending the algebraically
  closed residue field.

- For an elliptic generic fiber over a perfect-residue DVR, the realization
  agrees with the imported Tate algorithm on a minimal equation.

**Checks.**

- III and I₂ have different local incidence schemes even though both have two vertices.

- IV and I₃ both have triangular pairwise graphs, but IV has one triple intersection and I₃ three nodes.

- I₀ is smooth and is neither singular multiplicative nor additive.

- In E×P¹→P¹ every geometric fiber has type I₀ and exactly one irreducible component.

*Needs:* StableReduction Layer 4 component intersections; §2.1; §2.2; SchemeAndStackFoundations SF.5 intersection/adjunction; EllipticCurves Layer 4.

### 2.4 degenerate genus-one fiber

Define the degenerate fiber to hold for a multiple geometric fiber, for a singular primitive fiber in the
elliptic case, or for a reducible primitive fiber in the quasielliptic case. In particular the simple cuspidal
generic-shaped fiber of a quasielliptic fibration is not degenerate, whereas the same cuspidal scheme in an
elliptic fibration is.

Evaluate the multiplicity and the two generic-fiber cases separately.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, p. 10; arXiv v3.)

The construction needs the following maps and laws.

- Every multiple fiber is degenerate.

- For an elliptic fibration, degenerate iff multiple or singular
  indecomposable fiber.

- For a quasielliptic fibration, degenerate iff multiple or reducible
  indecomposable fiber.

**Checks.**

- A simple smooth elliptic fiber is not degenerate.

- A double smooth fiber is degenerate despite smooth reduction.

- A simple irreducible cusp of a quasielliptic fibration is not degenerate.

*Needs:* §2.1; §2.2; §2.3.

### 2.5 classification of canonical fibers

For a relatively minimal genus-one fibration on a smooth proper surface over an algebraically closed field,
prove its primitive geometric fiber realizes I₀, Iₙ (n≥1), II, III, IV, Iₙ* (n≥0), IV*, III* or II*. This
target extends the smooth-generic dictionary to multiple divisors and the regular nonsmooth case. Derive the
primitive coefficients from the weighted intersection radical, then identify the local singularities and
incidence schemes; do not equate the primitive divisor with its reduction.

Smooth proper surface over an algebraically closed field; regular relatively minimal genus-one fibration.

Use the negative semidefiniteness of StableReduction Layer 4 together with its linear-algebra refinement,
proved here: for a symmetric matrix with nonnegative off-diagonal entries, connected graph and a positive
vector m with Am=0, the form is negative semidefinite and vanishes exactly on the multiples of m, so every
proper principal submatrix is negative definite (Stacks, Lemma 55.2.3, tag 0C5X). With adjunction this gives
rational (−2)-components in the reducible case. Apply `canonicalFiber_affineMatrixClassification` below to the
intersection form. Classify integral genus1 curves by normalization and the length-one delta invariant; retain
the incidence distinction between I₂/III and I₃/IV.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, equation (1), pp. 9–10; arXiv v3.)

**Affine matrix classification.** Prove `canonicalFiber_affineMatrixClassification` before the Kodaira
identification: a nonempty finite connected symmetric integral matrix with diagonal −2, nonnegative
off-diagonal entries and a positive primitive integral null vector is, under simultaneous reindexing,
the negative Cartan matrix of a valid affine ADE diagram. The same reindexing sends the null vector to
its marks.

This statement is `canonicalFiber_affineMatrixClassification` in `Suggested.lean`.

Use the native `TauCeti.AffineDynkinType` carrier from ZigzagPreprojective Layer 0, supplied
by `TauCeti/LinearAlgebra/RootSystem/AffineDynkinType/Basic.lean`; this classification converse is local work.
Connectedness means that positive off-diagonal entries connect every pair of indices. Primitive means
the gcd of the positive entries is one. Prove the radical comparison, bound off-diagonal entries by two,
and enumerate cycles and branched trees; an entry two forces the two-vertex case. Match the primitive
fiber coefficients with the marks before analyzing incidence schemes separately.

(Kac, *Infinite dimensional Lie algebras*, 3rd edition, Chapter 4, Theorems 4.3 and 4.8,
Table Aff 1; [Stacks, tag 0C5X](https://stacks.math.columbia.edu/tag/0C5X), Lemma 55.2.3.)

**Checks for `canonicalFiber_affineMatrixClassification`.**

- The matrix [[−2,2],[2,−2]] with null vector (1,1) gives affine A₁, the common matrix of I₂ and III;
  their incidence schemes still differ.
- A triangle with diagonal −2 and other entries one has marks (1,1,1), giving affine A₂;
  it does not distinguish I₃ from IV.
- The four-leaf star has central mark two and leaf marks one, giving affine D₄ and the I₀* multiplicities.
- The one-vertex matrix [−2] has no positive null vector and is excluded; smooth I₀ is handled separately.

**Checks.**

- The affine graph is a constraint, not a substitute for local intersection geometry.

- The conclusion explicitly enumerates all symbols, includes smooth I₀, and uses the full geometric predicate
  rather than an opaque route identifier or just an affine graph.

*Needs:* §2.2; §2.3; SchemeAndStackFoundations SF.5 intersection/adjunction; StableReduction Layer 1; StableReduction Layer 4.

### 2.6 conductor classification with one or two rational components

Classify the conductor of a reduced proper canonical-type curve with h⁰=h¹=1 and one or two rational
normalization components. With one component, a length-two closed scheme on P¹ is pinched to Spec k. Its
algebra is k×k, k[ε]/ε², a separable quadratic field or a purely inseparable quadratic field. With two P¹
components the overlap is Spec(R×R)→Spec R with the specified diagonal incidence. Over perfect fields the
purely inseparable field alternatives disappear.

Use the normalization exact sequence and arithmetic genus1 to force a conductor algebra of length2. Apply the
Ferrand conductor square and classify length2 algebras: split, dual numbers, separable quadratic and purely
inseparable quadratic. For two components use two identical copies of the conductor algebra and its diagonal
map; over perfect fields eliminate the inseparable field case.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, p. 10; arXiv v3.)

**Checks.**

- Keep the imperfect-field forms visible; only the perfect-field nodal forms are used for F₂.

*Needs:* §1.7; §1.5; §2.5; SchemeAndStackFoundations SF.0, quotient/localization/flat-module contracts;
StableReduction Layer 1.

### 2.7 nonsplit I₁ pinching

Construct the nonsplit rational node by pinching a separable degree-two closed point `Spec E⊂P¹_k` to Spec k.
Prove normalization is the specified P¹, the singular point is rational, its two geometric branches are
conjugate, and h⁰=h¹=1. The explicit polynomial chart and the proper-curve comparison below supply the actual
realization.

Apply global Ferrand existence to the quadratic closed point on P¹. The normalization exact sequence gives
arithmetic genus1 and the conductor square gives one rational node with two conjugate branches. Use the
explicit quadratic-pinch chart, properness and the E/k cohomology quotient of §§2.26–2.30; compare its
actual conjugate branches after field extension.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, p. 10; arXiv v3.)

**Checks.**

- After quadratic extension it becomes split I₁; over `𝔽_q` its rational count is q+2.
- Over `𝔽_{q²}` the node splits and the count is q², not q²+2: for q=2 the counts are 4 over F₂ and 4 over F₄,
  the trace at the node changing from −1 to +1 (§§2.10–2.11).
- The normalization sequence `0→O_C→ν_*O_{P¹}→(E/k)_x→0` gives h⁰=1 and h¹=dim E/k=1; pinching a rational point
  (E=k) changes nothing and gives h¹=0, and pinching two rational points gives the split node with the same
  h¹=1 but count q, so the genus does not separate split from nonsplit and the count does.
- For a purely inseparable quadratic point (k=F₂(a), E=k(√a)) the same pinch is geometrically the cusp y²=x³,
  type II, because E⊗_k k̄=k̄[ε]/(ε²) (§2.3); separability of E/k is what makes the pinch a node.

*Needs:* §1.5; §2.6; StableReduction Layer 1; §2.28; §2.30.

### 2.8 nonsplit I₂ pinching

Construct the fixed-component nonsplit I₂ by pinching the two identified copies of Spec E⊂P¹⊔P¹ to one Spec E.
The two component vertices remain rational; their two geometric intersection points are exchanged. Preserve
both incidence identifications in the construction, since pinching two points on one component would give I₁
instead.

Pinch the two copies of Spec E in P¹⊔P¹ to Spec E by the identity on each copy. The two components are
individually rational; their two geometric intersection points are conjugate, so the node set has no k-point.
Use the specified two-component conductor identifications and cohomology map k²→E of §§2.29–2.30;
keep the component vertices fixed while the two geometric nodes are conjugate.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, p. 10; arXiv v3.)

**Checks.**

- Over `𝔽_q` the rational count is 2q+2; this form has fixed component vertices but conjugate edges.
- Each component contributes q+1 rational points and the two nodes are conjugate, giving 2(q+1); over
  `𝔽_{q²}` the nodes become rational and the count is 2(q²+1)−2=2q², so 6 over F₂ and 8 over F₄.
- The conductor quotient is E²/E≅E of dimension two and the global map k²→E, (a,b)↦a−b, has kernel the diagonal
  and cokernel of dimension one, so h⁰=h¹=1; pinching the two copies of Spec E to Spec k instead gives the
  quotient E²/k of dimension three, cokernel of dimension two and arithmetic genus two, not a genus-one fibre.
- Pinching the two geometric points of one copy of Spec E⊂P¹ to each other is the nonsplit I₁ of §2.7, with
  one component and one rational node; I₂ needs two components and the identification of the two copies of
  Spec E with each other.

*Needs:* §1.5; §2.6; StableReduction Layer 1; §2.29; §2.30.

### 2.9 descent of components under constant numerical Picard

For a relatively minimal genus-one fibration over `𝔽_q` with constant numerical-Picard local system, prove
the geometric and residue-field fiber graphs agree, including intersection-length labels. A reducible
geometric fiber must lie over a rational base point. At a rational point with singular primitive fiber,
every component has normalization P¹ over `𝔽_q`. Prove uniqueness of negative component classes before
descending the subschemes; fixed numerical classes alone do not automatically descend divisors.

For distinct vertical components the intersection is nonnegative, while each negative component has negative
self-intersection. Equality of their numerical classes would give a negative intersection, a contradiction.
Thus a fixed negative component class fixes its unique curve. Apply this to the Galois action and descend the
unique closed subschemes. In a geometrically reducible fiber over a nonrational point, disjoint conjugate
whole fibers conflict with the component-class uniqueness/connected graph comparison. The exceptional integral
fiber cases require the normalization/conductor analysis, not this negative-square argument alone (Schröer
Theorem 2.1, pp. 8–9). Relative minimality makes the fibers of canonical type, so §2.5 supplies the
geometrically rational component normalizations in the singular primitive cases. Their genus-zero forms
over the finite residue field split by §2.16.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 3.1, pp. 10–11; arXiv v3.)

**Checks.**

- For nonrational a use intersection label `(C_i·C_j)/[κ(a):k]`, not the absolute intersection number.

- Blow up E×P¹ over F₂ at a rational point of a fiber, with E an elliptic curve. The geometric numerical
  lattice remains constant, generated by fiber, section and exceptional classes, but the singular fiber
  contains the strict transform of E, whose normalization has genus one. Relative minimality fails.

- In the relatively minimal product E×P¹, the smooth primitive fibers are E, so the singularity hypothesis
  is necessary for the P¹-normalization assertion.

- A fixed-component nonsplit I₂ has two P¹ normalizations and two conjugate geometric nodes; agreement
  of component graphs does not make its individual nodes rational.

*Needs:* StableReduction Layer 4 component intersections; §2.1; §2.5; SchemeAndStackFoundations SF.5 intersection/adjunction; AlgebraicModuliForArithmeticGeometry Layer 3 §3.5, effective polarized descent contract; §2.16.

### 2.10 split multiplicative fiber count

For a rational singular fiber with split primitive `I_r` and descended rational normalization components, prove
`#C(𝔽_q)=rq`. Count r copies of q+1 and subtract the r rational nodes; for r=1 remove its two preimages and add
its single node. Multiplicity does not affect the field-valued count.

Each normalized P¹ contributes q+1. For n≥2 subtract the n distinct rational nodes; for n=1 identify two
rational preimages and add the single node.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 3.2, p. 11; arXiv v3.)

**Checks.**

- The count is of the whole schematic fiber; nilpotents do not change its rational-point set.

*Needs:* §2.9; §2.3; StableReduction Layer 1.

### 2.11 nonsplit I₁ point count

For the binary quadratic-node equation, prove the count formula over every finite extension
of degree r>0.

For a nonsplit I₁ over `𝔽_q` in the same descended-component setting, prove `#C(𝔽_q)=q+2`. The normalization has
q+1 rational points, none over the degree-two conductor; the pinched point adds one. This is the first
odd-degree specialization of the branch-parity formula below.

The degree2 point contributes no rational normalization preimage. The pinched node is rational, hence replace
zero points by one: q+1+1. Specialize the new odd/even extension formula to n=1; the complement comparison
removes no rational quadratic point and adds the rational node.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 3.2, p. 11; arXiv v3.)

**Checks.**

- The count is of the whole schematic fiber; nilpotents do not change its rational-point set.

*Needs:* §2.7; §2.31.

### 2.12 nonsplit I₂ point count

For the fixed-component nonsplit I₂, prove `#C(𝔽_q)=2q+2`. Each P¹ contributes q+1; neither the quadratic
overlap nor its image has a rational point. Do not use a model in which Frobenius exchanges the two component
vertices.

Each rational normalized component contributes q+1. The degree2 conductor and its image have no rational
points, so no correction is made. Specialize the new fixed-component I₂ extension formula to n=1; neither
conductor copy nor its image has an `𝔽_q`-point.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 3.2, p. 11; arXiv v3.)

**Checks.**

- The count is of the whole schematic fiber; nilpotents do not change its rational-point set.

*Needs:* §2.8; §2.31.

### 2.13 additive fiber point count

For an additive primitive fiber over a rational point, after the components and incidence scheme descend,
prove `#C(𝔽_q)=rq+1`. A tree of r rational components has r−1 incidence corrections. The cusp has q+1 points;
tangencies and the IV triple incidence need their separate scheme computations, not a nodal-cycle formula.

For a cuspidal integral fiber normalization is bijective on rational points. For III subtract one shared
point; for IV subtract two at the common triple point. For the star types use their rational tree of
components and subtract r−1 distinct rational intersections.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 3.2, p. 11; arXiv v3.)

**Checks.**

- The count is of the whole schematic fiber; nilpotents do not change its rational-point set.

*Needs:* §2.9; §2.5; §2.6.

### 2.14 exclusion of I₀* over F₂

For a relatively minimal genus-one fibration over F₂ with constant numerical Picard, exclude a primitive
I₀* fiber. The central rational normalization would have four distinct rational attachment points but
P¹(F₂) has only three. Count actual marked attachment points; numerical valency alone does not prove their
rationality.

The four distinct rational intersections on the central normalized P¹ would require four points. P¹(F₂) has
only three points.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 3.2, p. 11; arXiv v3.)

**Checks.**

- Over `𝔽_q` with q≥3 the argument excludes nothing: `P¹(𝔽_q)` has q+1≥4 points, so the exclusion is special to
  F₂ (and the source states it only there).

- Four attachment points that are only geometric points need not be rational; the argument uses the constant
  numerical Picard hypothesis to make all four rational.

*Needs:* §2.9; §2.5.

### 2.15 finite-field genus-one torsors have points

Apply the prose target *lang-theorem* of ReductiveGroupsPartII §RG2.3.7 to the smooth connected Jacobian
of a smooth proper geometrically connected genus-one curve over `𝔽_q`. Its torsor class vanishes, so the curve has an `𝔽_q`-point and becomes a
pointed elliptic curve. This consumer requires the scheme torsor/Picard comparison, not a new proof of Lang or
the assumption that a regular nonsmooth genus-one curve is elliptic. The statement
`genusOne_finiteField_hasPoint` in `Suggested.lean` uses genuine coherent genus and expresses
the rational point as a section over the field.

Use the genuine Jacobian torsor structure. Apply surjectivity of `x↦x⁻¹Frob_q(x)` and the Frobenius descent
argument of Lang Theorem 2 to obtain a fixed point. For an abelian variety the Lang map is `Frob_q − 1`;
its differential is `−1`, so its image is open, and properness makes the image closed. Geometric
connectedness gives surjectivity. This is the non-affine specialization of the supplied prose theorem.

(Lang (1956), American Journal of Mathematics 78, Theorem 1, its corollary and Theorem 2 with proofs,
pp. 556–558; the JSTOR record is given in the References.)

**Checks.**

- For a disconnected finite constant group the general torsor conclusion can fail.

*Needs:* ComplexComparisonPartII §§C3.2d.2–C3.2d.4, Picard representability and obstruction; EllipticCurves Layer 1;
ReductiveGroupsPartII §RG2.3.7, prose target *lang-theorem* (including its non-affine scope).

### 2.16 finite-field forms of the projective line

Apply Lang to PGL₂ to trivialize every finite-field form of P¹, and construct the actual scheme isomorphism.
Equivalently use its smooth proper genus-zero curve with a rational point. This application has its own group
and torsor; genus-one torsor triviality cannot be substituted for the PGL₂ statement.

Use Lang Theorem 1/2 for the smooth connected group PGL₂, through ReductiveGroupsPartII §RG2.3.7’s prose
target *lang-theorem*; the genus-one consumer alone does not supply this statement. For the degree1 version use Riemann–Roch to obtain two sections
and a degree1 morphism to P¹, then finite degree1 normality gives the isomorphism.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), proof of Proposition 3.1, p. 11; proof of Theorem
5.6(iii), p. 17; arXiv v3.)

**Checks.**

- Do not apply Tsen over `𝔽_q(t)` to prove this finite-field statement.

*Needs:* AlgebraicModuliForArithmeticGeometry Layer 3 §3.5, effective polarized descent contract; StableReduction
Layer 2; ReductiveGroupsPartII §RG2.3.7, prose target *lang-theorem* (applied to PGL₂).

### 2.17 elliptic curve E1 over F₂

Prove the E1 representative is smooth with discriminant one and has exactly one rational point, and compute its
native invariant and group law. Count both affine solutions and infinity. Its coefficient tuple is the first
entry of `F2Model`; the finite computation is then transported to the actual smooth projective pointed curve.

Identify this source equation with F2Model at index 0. Use the separate model discriminant, point-count, j and
cyclic point-group declarations, including the explicit native point cycles. Use the geometric
ordinary/supersingular comparison from EllipticCurves Layer3; j=0 alone is not defined to mean supersingular.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 3.3, p. 11; arXiv v3.)

**Checks.**

- The affine solution count alone is one less than the stated projective count.

*Needs:* §2.23; §2.25; EllipticCurves Layer 3.

### 2.18 elliptic curve E2 over F₂

Prove the E2 representative is smooth with discriminant one and has exactly 2 rational points, and compute its
native invariant and group law. Count both affine solutions and infinity. Its coefficient tuple is the second
entry of `F2Model`; the finite computation is then transported to the actual smooth projective pointed curve.

Identify this source equation with F2Model at index 1. Use the separate model discriminant, point-count, j and
cyclic point-group declarations, including the explicit native point cycles. Use the geometric
ordinary/supersingular comparison from EllipticCurves Layer3; j=0 alone is not defined to mean supersingular.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 3.3, p. 11; arXiv v3.)

**Checks.**

- The affine solution count alone is one less than the stated projective count.

*Needs:* §2.23; §2.25; EllipticCurves Layer 3.

### 2.19 elliptic curve E3 over F₂

Prove the E3 representative is smooth with discriminant one and has exactly 3 rational points, and compute its
native invariant and group law. Count both affine solutions and infinity. Its coefficient tuple is the third
entry of `F2Model`; the finite computation is then transported to the actual smooth projective pointed curve.

Identify this source equation with F2Model at index 2. Use the separate model discriminant, point-count, j and
cyclic point-group declarations, including the explicit native point cycles. Use the geometric
ordinary/supersingular comparison from EllipticCurves Layer3; j=0 alone is not defined to mean supersingular.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 3.3, p. 11; arXiv v3.)

**Checks.**

- The affine solution count alone is one less than the stated projective count.

*Needs:* §2.23; §2.25; EllipticCurves Layer 3.

### 2.20 elliptic curve E4 over F₂

Prove the E4 representative is smooth with discriminant one and has exactly 4 rational points, and compute its
native invariant and group law. Count both affine solutions and infinity. Its coefficient tuple is the 4th
entry of `F2Model`; the finite computation is then transported to the actual smooth projective pointed curve.

Identify this source equation with F2Model at index 3. Use the separate model discriminant, point-count, j and
cyclic point-group declarations, including the explicit native point cycles. Use the geometric
ordinary/supersingular comparison from EllipticCurves Layer3; j=0 alone is not defined to mean supersingular.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 3.3, p. 11; arXiv v3.)

**Checks.**

- The affine solution count alone is one less than the stated projective count.

*Needs:* §2.23; §2.25; EllipticCurves Layer 3.

### 2.21 elliptic curve E5 over F₂

Prove the E5 representative is smooth with discriminant one and has exactly 5 rational points, and compute its
native invariant and group law. Count both affine solutions and infinity. Its coefficient tuple is the 5th
entry of `F2Model`; the finite computation is then transported to the actual smooth projective pointed curve.

Identify this source equation with F2Model at index 4. Use the separate model discriminant, point-count, j and
cyclic point-group declarations, including the explicit native point cycles. Use the geometric
ordinary/supersingular comparison from EllipticCurves Layer3; j=0 alone is not defined to mean supersingular.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 3.3, p. 11; arXiv v3.)

**Checks.**

- The affine solution count alone is one less than the stated projective count.

*Needs:* §2.23; §2.25; EllipticCurves Layer 3.

### 2.22 five elliptic classes over F₂

Prove every smooth proper geometrically connected genus-one curve over F₂ is isomorphic to precisely one Eᵢ.
Lang provides an origin; construct its actual projective Weierstrass presentation and compare rational points
with the native count. Enumerate 32 binary coefficient tuples, retain the 16 smooth ones and the eight
admissible infinity-preserving changes, and give orbit witnesses with sizes 2,4,4,4,2. The count identifies
the unique orbit only after smoothness is checked. The geometric statement
`genusOne_F2_classification` in `Suggested.lean` quantifies over smooth proper curves and
asserts an isomorphism over F₂ with exactly one native projective model; it assumes no origin.

Obtain the Weierstrass presentation of a pointed smooth proper geometrically connected genus-one curve over
F₂, with its scheme model and rational-point comparison, from the Weierstrass normal forms of elliptic function
fields (AlgebraicCurves Layer 10, Stichtenoth Prop. 6.1.2) and the function-field/curve dictionary of
AlgebraicCurves Layer 12. Apply the complete native coefficient classifier and its sixteen explicit forward
changes. Use that dictionary and the supplied `WeierstrassCurve.projModelVariableChangeIso`,
with `projModelZero_projModelVariableChangeIso_hom`, to obtain curve isomorphisms preserving infinity. The five counts prove
unique class index. Group isomorphisms of rational points alone are not curve isomorphisms.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 3.3, p. 11; arXiv v3.)

**Checks.**

- Isogeny and isomorphism are generally different; the count criterion here is special to F₂.

*Needs:* §2.17; §2.18; §2.19; §2.20; §2.21; §2.24; AlgebraicCurves Layers 10 and 12; EllipticCurves Layer 1;
EllipticCurves Layer 3.

### 2.23 the five binary Weierstrass models

Define `F2Model : Fin 5→WeierstrassCurve F₂` by the coefficient tuples (0,1,1,0,1), (1,1,0,1,0), (0,0,1,0,0),
(1,0,0,1,0), (0,1,1,0,0). Prove their discriminants are one, their counts are respectively 1,2,3,4,5 and their
j-values are 0,1,0,1,0. Give all native variable-change orbit witnesses and transport them to pointed
projective curves through the presentation comparison.

The coefficient field in every finite computation is exactly F₂=ZMod2; it is not an arbitrary field of
characteristic two. Existing WeierstrassCurve and VariableChange carriers are used.

Read the five equations from the source table and translate them into the native a-coefficient order. Use the
native structure constructor and a finite five-entry vector. Keep the source count index instead of the
table’s supersingular-first row order.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), arXiv:2004.07025v3, p.11, Proposition3.3/table and
preceding paragraph.)

The construction needs the following maps and laws.

- Evaluation at each Fin5 index gives the displayed native coefficient tuple.

- Each displayed model is elliptic, from the separately planned discriminant
  calculation.

- F2Model i=F2Model j iff i=j, by their different point counts.

- For every i∈Fin5, the existing projective pointCount(F2Model i)=i+1. The affine
  solution sets for i=0,…,4 are respectively ∅, {(0,0)}, {(0,0),(0,1)}, {(0,0),(1,0),(1,1)},
  {(0,0),(0,1),(1,0),(1,1)}. Uses §2.23, `WeierstrassCurve.pointCount_def`. For each displayed equation
  substitute all four pairs (x,y)∈{0,1}² and retain exactly the listed affine solutions. Apply the actual
  pointCount_def and add the single infinity point. This calculation does not confuse affine solution count
  with projective count.

- For W over F₂, Δ(W)=a₃ if a₁=0, and Δ(W)=a₆+a₄+a₃(a₄+a₂) if a₁=1. Equivalently, use the
  if-expression on a₁=0. The identity uses a²=a for elements of F₂ and does not extend unchanged to F₄. Uses
  `WeierstrassCurve.Δ`. Unfold the pinned b₂,b₄,b₆,b₈ and Δ definitions and reduce integer coefficients
  modulo2. Use a₁²=a₁, a₃²=a₃ and a₄²=a₄; split a₁=0 or1. The two displayed polynomials remain.

- For a tuple W over F₂, Δ=1 iff either a₁=0 and a₃=1, or a₁=1 and a₆=1+a₄+a₃(a₄+a₂). In
  the first branch a₂,a₄,a₆ are free and in the second branch a₂,a₃,a₄ are free. These disjoint branches
  exhibit all16 smooth tuples among the32 equations. Uses §2.23, `WeierstrassCurve.IsElliptic`. Apply the
  binary discriminant formula. Over F₂, subtracting a scalar equals adding it. In each branch precisely three
  binary choices are free, giving eight tuples. The a₁ values distinguish the branches. The native ellipticity
  condition is that Δ is a unit; over F₂ this is exactly Δ=1. Do not test smoothness by having some rational
  solution.

- Every native VariableChange over F₂ has u=1 and one of eight triples (r,s,t). Its
  action preserves a₁ and sends (a₂,a₃,a₄,a₆) to (a₂+s a₁+r+s, a₃+r a₁, a₄+s a₃+(t+rs)a₁+r, a₆+r a₄+r a₂+r+t
  a₃+t+rt a₁). This is C•W; the point map from C•W to W is (x,y)↦(x+r,y+sx+t). Uses
  `WeierstrassCurve.VariableChange`, `WeierstrassCurve.variableChange_def`,
  `WeierstrassCurve.Affine.variableChange_equation`. The only unit of F₂ is1; the other three coefficients
  range independently over {0,1}. Specialize the native five action formulas, keeping its action order and
  reducing r²=r,s²=s,t²=t. The inverse triple is (r,s,t+rs), inherited from the native group. Equation
  compatibility comes from the existing affine variable-change theorem.

- For each i∈Fin5, Δ(F2Model i)=1, so the native IsElliptic instance is justified. No
  genus-one assertion is inferred from a count on a singular model. Uses §2.23, `WeierstrassCurve.IsElliptic`.
  Substitute the five literal coefficient tuples into the discriminant formula over F₂. Since1 is a unit, the existing native
  ellipticity class applies to each model.

- The native j values of F2Model0,…,F2Model4 are0,1,0,1,0. These values do not distinguish all
  five F₂-isomorphism classes; in particular model0 and model4 have the same j but different point counts.
  Uses §2.23, `WeierstrassCurve.j_eq_zero_iff_of_char_two`. Use the model discriminant1 instance and the
  existing `j_eq_zero_iff_of_char_two` to determine precisely which indices have j=0. The other two indices have
  nonzero j; the only nonzero element of F₂ is1. This establishes the whole displayed vector without a new
  geometric ordinary/supersingular definition.

- Binary orbit witnesses: For each W over F₂ with Δ(W)=1 there are i∈Fin5 and a native C∈VariableChange(F₂)
  such that C•W=F2Model i. The sixteen-row witness table records every smooth coefficient tuple, its
  1-based source class and the triple (r,s,t), with u=1. Uses §2.23. The smooth-split lemma reduces the32
  coefficient choices to the displayed16 rows. For each row substitute its (r,s,t) into the binary change
  formula and check all five coefficients against the indicated model. Equal native coefficients give equality
  of WeierstrassCurve objects. This is a complete finite witness table, not an appeal to an unavailable search
  log or to the size of an orbit alone.

- Disjoint binary orbits: For i,j∈Fin5, (∃C∈VariableChange(F₂), C•F2Model i=F2Model j) iff i=j. The index
  is unique; the witnessing change generally is not unique because a model can have automorphisms. Uses §2.23,
  `WeierstrassCurve.pointCount_eq_card_point`, `WeierstrassCurve.Affine.Point.equivVariableChange`. Use the
  native additive point equivalence under C and the elliptic pointCount/card-point comparison to identify the
  two projective counts. The model-count lemma gives i+1=j+1, hence i=j. Conversely the identity change
  witnesses equality. Finiteness of affine solutions holds over the finite coefficient field; ellipticity is
  supplied by model discriminants.

- For E₄=F2Model3 and its nonsingular affine points P=(1,0), Q=(0,0), native point addition
  gives P+P=Q. Since Q≠O and Q+Q=O, P has order4 and the four-point group is cyclic, not the Klein four group.
  Uses §2.23, `WeierstrassCurve.Affine.Point.add_some`, `WeierstrassCurve.Affine.Point.add_of_Y_eq`. The
  equation and partial derivatives verify both displayed points are nonsingular. At P the tangent denominator
  is1 and numerator3+1=0 in F₂. The native slope is0; native addX/addY give Q=(0,0). Q is its own negative, so
  the existing add_of_Y_eq gives Q+Q=O. Its affine constructor is different from infinity.

**Checks.**

- F2Model2 is (0,0,1,0,0), the equation y²+y=x³.

- F2Model0 has no affine F₂ solutions and has exactly its infinity point.

- F2Model0 and F2Model4 both have j=0 but their projective counts are 1 and 5, so they are not identified.

- The all-zero tuple has Δ=0 and projective pointCount3, the same count as F2Model2. A count alone cannot
  classify singular input.

- The index convention is 0-based in Fin5 and 1-based in the source `E_i`.

- Model0 and model4 are distinct despite sharing j=0.

*Needs:* `WeierstrassCurve`.

### 2.24 point counts classify smooth binary equations

The equation-level count classifier assigns every smooth native binary equation the point count
of a unique representative.

For a native binary equation with Δ=1, prove its rational point count lies in {1,2,3,4,5} and determines its
unique `F2Model` orbit under `VariableChange`. Establish invariance of the equation count under the projective
change. Exclude Δ=0 explicitly: the cuspidal tuple has count three as well.

The coefficient field in every finite computation is exactly F₂=ZMod2; it is not an arbitrary field of
characteristic two. Existing WeierstrassCurve and VariableChange carriers are used.

Send W and V to their model representatives with the explicit orbit witnesses. Changes preserve the projective
point count: specialize the existing affine equation equivalence and its inverse, or use the additive point
equivalence together with ellipticity. Equal counts force equal model indices by the five model counts.
Compose the native changes and an inverse to obtain the required C; the reverse implication follows from the
same point-count compatibility.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), arXiv:2004.07025v3, p.11, Proposition3.3/table and
preceding paragraph.)

**Checks.**

- Singular count collision: the singular equation y²=x³ over F₂ has Δ=0 and the same
  three-point count as E₃. Smoothness is necessary in the classifier.

- Translating x on E₃ by one gives another smooth equation with the same three-point count.

- This does not claim that isogeny and isomorphism coincide over arbitrary finite fields.

*Needs:* §2.23; `WeierstrassCurve.VariableChange`; `WeierstrassCurve.variableChange_Δ`;
`WeierstrassCurve.Affine.variableChange_equation`; `WeierstrassCurve.pointCount_def`.

### 2.25 cyclic point groups of the five binary models

Construct an additive isomorphism Eᵢ(F₂)≃Z/iZ for each i=1,…,5. Counts two, three and five give cyclic groups
directly; count one gives the trivial group. For count four compute a point of order four, rather than
concluding cyclicity from the order alone.

The coefficient field in every finite computation is exactly F₂=ZMod2; it is not an arbitrary field of
characteristic two. Existing WeierstrassCurve and VariableChange carriers are used.

Use the model-count lemma and pointCount_eq_card_point under model ellipticity to get the honest group
cardinalities1,…,5. The durable point-cycle table lists all multiples of the displayed generator until the
first return to infinity; all listed affine points are nonsingular. Verify each addition with add_some or
add_of_Y_eq. The order-four case uses the doubling formula on E₄. The affine solution lists plus infinity prove the
generator spans the whole native group. Apply the existing zmodAddEquivOfGenerator and invert its equivalence
to obtain the displayed orientation.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), arXiv:2004.07025v3, p.11, Proposition3.3/table and
preceding paragraph.)

**Checks.**

- The group of order1 is the trivial ZMod1 group. Orders2,3,5 and especially4 use actual point addition; no
  group law is replanned.
- On E₄, y²+xy=x³+x, doubling (1,0) has slope (3·1+1)/(1)=0 in F₂, so 2·(1,0)=(0,0); at (0,0) the tangent
  denominator 2y+a₁x+a₃ vanishes, so 2·(0,0)=∞ and (1,0) has order four; (0,0) is the only point of order two,
  so the group is Z/4 and not (Z/2)².
- On E₅, y²+y=x³+x², the multiples of P=(0,0) are 2P=(1,1) (slope 0, x₃=a₂=1, y₃=1), 3P=(1,0) (slope 1),
  4P=(0,1)=−P and 5P=∞, so P generates.
- On E₃, y²+y=x³, doubling (0,0) gives (0,1)=−(0,0), so (0,0) has order three; a wrong doubling returning
  (0,0) itself would make the group (Z/2)-generated, impossible for a group of order three.

*Needs:* §2.23; `WeierstrassCurve.pointCount_eq_card_point`; `WeierstrassCurve.Affine.Point.add_some`;
`WeierstrassCurve.Affine.Point.add_of_Y_eq`; `zmodAddEquivOfGenerator`.

### 2.26 affine polynomial pinching algebra

For every q∈k[t], define the pinched algebra A_q as the inverse image of the constants under
k[t]→AdjoinRoot(q). Prove it is k+qk[t]. For monic quadratic q=t²+at+b, construct the residue, coordinate and
full conductor comparisons; repeated roots and inseparability are included. At q=0 it is the constants, and at
a unit q it is all k[t].

Take the preimage of the bottom subalgebra under AdjoinRoot.mkₐ. Algebra.mem_bot supplies an actual scalar
witness; `AdjoinRoot.mk_eq_mk` identifies equality modulo q with divisibility by q. Rearranging the
multiplicative witness proves mem_algebra for every q, including zero and units. Use native Subalgebra,
AdjoinRoot and the existing Ferrand ring pullback rather than introducing a new ring carrier. The
pinch spanning API uses §2.32 on h in f=c+qh, replacing its first coordinate by
C(c)+tP. The added characteristic-two, inseparable and degree-one tests check these actual polynomial
functions.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, printed p10, separable-quadratic conductor
squares; Proposition3.2, printed p11; [Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, printed
pp10–11, the conductor squares and Proposition 3.2; derived affine polynomial adapter;
[Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), §4.1, printed p565, pinching along a closed
divisor; library-based coordinate adapter for the already defined polynomial preimage; [Schröer, arXiv
v3](https://arxiv.org/pdf/2004.07025v3), §3, printed p10, one-component conductor diagram and adjoining
normalization discussion; affine algebraic deductions at its already owned quadratic chart;
[Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Printed pp554–557, introduction and §§1.1–1.4.)

The construction needs the following maps and laws.

- For every field k, polynomial q and f∈k[X], `f∈A_q` if and only if f=C(c)+qh for
  some c∈k and h∈k[X]. This is the membership API of the native subalgebra `A_q`, including
  q=0 and unit q. Uses §2.26, `Subalgebra.comap`, `AdjoinRoot.mkₐ`, `AdjoinRoot.mk_eq_mk`, `Algebra.mem_bot`.
  Use the existing bottom-subalgebra scalar-witness criterion after the actual quotient map. Equality modulo q
  is equivalent to divisibility by q, then rearrange f−C(c)=qh.

- Every constant polynomial C(c) belongs to `A_q`.

- For q=t²+at+b over any field, `A_q=k[q,tq]`. As a k-vector space it has basis
  `1,qⁱ` (`i≥1`),`tqʲ` (`j≥1`). These have degrees0,2i,2j+1 respectively, so no degree1 vector occurs. Uses §2.26,
  §2.32, §2.33, `Polynomial.aeval_subalgebra_coe`, `Polynomial.comp_eq_aeval`, `Algebra.subset_adjoin`,
  `Algebra.adjoin_le`. Write f=c+qh by the native membership criterion and decompose h=P(q)+tQ(q) using
  §2.32. In S=k[q,tq], native aeval into the subalgebra, aeval_subalgebra_coe and
  comp_eq_aeval show every P(q) and Q(q) belongs. Thus f=c+qP(q)+(tq)Q(q) lies in S. Conversely q and tq are
  in `A_q`, so adjoin_le proves `S⊆A_q`. This adjoin equality now has a native proof. The native coordinates
  equivalence constructs the unique pair P,Q with f=P(q)+tqQ(q). Transport the product polynomial monomial
  bases through that equivalence; the resulting actual Basis has vectors `q^n` and `tq^(n+1)`, and its Finsupp
  representation coordinates are the coefficients of P,Q.

- For q=t²+at+b and `f∈A_q`, there exist P,Q∈k[t] with f=P(q)+tqQ(q). This is
  actual polynomial spanning, not an asserted Basis instance.

- Substitution U=q,V=tq sends `F_(a,b)` to zero.

- `F_(a,b)+U³=V²+aUV+bU²`.

- `F_(a,b)(0,0)=0`.

- For a,b∈k define `F_(a,b)∈k[U,V]` by V²+aUV+bU²−U³, using native
  MvPolynomial(Fin2,k). With q=t²+at+b, the substitution U=q,V=tq kills F. Its quadratic part is V²+aUV+bU².
  No discriminant test requiring 2 invertible is built into this definition. Uses `MvPolynomial.aeval`.
  Multiply t²+at+b=q by q² to derive the relation. Separate the quadratic part from the cubic term; retain the
  cross term in characteristic2.

- `ρ_q(c+qh)=c` for the native subtype element.

- `ρ_q` is surjective, split by constants.

- `ker ρ_q=(q).comap(A_q↪k[t])`.

- For monic q of degree2, the constant c in f=c+qh is unique. Define the k-algebra
  map `ρ_q:A_q→k` by that c, concretely the constant coefficient of the remainder modulo q. It is surjective and
  its kernel is the contraction of (q)⊂k[t]. The output is an actual AlgHom, not a freely chosen residue
  identification. Uses §2.26, §2.32, `Polynomial.add_modByMonic`, `Polynomial.mul_modByMonic`,
  `Polynomial.modByMonic_eq_zero_iff_dvd`. Apply quadratic-scalar-unique to the actual normal forms; the
  uniqueness follows from the built remainder and C-injectivity, without a presentation theorem. Define the
  actual AlgHom by the zeroth coefficient of the remainder. Use quadratic-remainder-scalar with add_modByMonic
  and mul_modByMonic to prove all ring and scalar-map laws. Verify the algebra-homomorphism fields using these
  formulas. Constants split the map by its commutation law. On the actual subtype, zero zeroth coefficient is
  equivalent to zero scalar remainder, and modByMonic_eq_zero_iff_dvd identifies its kernel with the
  contraction of (q).

- For q=t²+at+b, the substitution ψ:k[U,V]→k[t], U↦q,V↦tq, has image `A_q` and
  kernel `(F_(a,b))`. Consequently its induced map `k[U,V]/(F_(a,b))→A_q` is the canonical k-algebra isomorphism.
  This remains true for split, repeated-root and inseparable quadratics. Uses §2.34, §2.52, §2.53. Use the
  exact native substitution range and full relation-kernel lemmas. The V-coordinate transport, monic remainder
  formula and inherited pinch-normal-form injectivity prove the kernel by divisibility in both directions. The
  canonical quotient algebra equivalence uses the native first-isomorphism theorem and equal-ideal quotient
  transport. Its quotient-class, inverse and generator equations identify the actual substitution map. This
  supplies the affine bivariate presentation only. Finite normalization/localization/fraction-field and
  projective/node/cohomology comparisons remain separate owner obligations. For its specified polynomial
  parameter S=k[T], the actual coefficient multiplication and quadratic relation now give the
  coefficient-compatible mapping property `Hom_S(A_q,B)≃{y:y²+aTy+bT²−T³=0}`. This native algebraic comparison
  does not replace the geometric normalization universal property.

- For monic q of degree2, the conductor of `A_q⊂k[t]` is exactly the ambient ideal
  (q). Its contraction `m=ker ρ_q` satisfies `A_q/m≅k`, while k[t]/(q)=AdjoinRoot(q). The conductor square is the
  actual affine chart of the inherited Ferrand square. Uses §2.26, §1.2, §1.12, §1.3, §2.32. Every multiple of
  q remains a multiple after multiplication by any polynomial, giving (q)≤conductor. If f lies in the
  conductor, multiplication by 1 gives f=C(c)+qh and multiplication by t gives ft=C(d)+qj.
  quadratic-linear-remainder and quadratic-constant-remainder compare the two remainders of ft; their
  degree-one coefficients force c=0. This supplies a native proof of the exact ambient conductor equality for
  every monic quadratic, including repeated-root and inseparable cases. Combine the residue kernel with the
  inherited ring/cartesian/geometric pushout results.

- For monic quadratic q, k[t] is finite over `A_q`, with module
  generators1,t. The inclusion is an isomorphism after inverting q, since t=(tq)/q, and induces the same
  fraction field. As k[t] is normal, this is the finite normalization of `A_q`. The statement includes the cusp;
  normality of the normalization does not imply the target is nodal. Uses §2.26, StableReduction Layer 1,
  SchemeAndStackFoundations SF.0, quotient/localization/flat-module contracts, §2.36, §2.37, §2.38. The
  monic equation t²+at+b−q=0 makes t integral over `A_q`. Its recurrence reduces every power to an `A_q`-linear
  combination of1,t. Invert the nonzero q and recover t to identify the localization and fraction field.
  Import the normality of the polynomial ring over a field and the normalization comparison from the existing
  owner.

- At m=(U,V) on Spec(k[U,V]/F), m/m² has k-dimension2 and the tangent cone
  is k[U,V]/(V²+aUV+bU²). For separable q=t²+at+b this binary quadratic has two distinct geometric lines; if q
  is irreducible they are conjugate over its quadratic splitting field. The point is a node by the imported
  nodal-chart criterion. In characteristic2 a≠0 is the separability condition; a=0 is excluded from this nodal
  conclusion. Uses §2.26, StableReduction Layer 1, SchemeAndStackFoundations SF.0,
  quotient/localization/flat-module contracts. There is no linear term in F, so the images of U,V form the
  cotangent basis. The lowest-degree term of F is its nonzero homogeneous quadratic; the initial ideal of this
  principal hypersurface is generated by that term. Over a splitting field with distinct roots α,β, factor the
  quadratic as (V−αU)(V−βU). Compare the local completed normal form with SR.1, rather than rebuilding a
  general node predicate. A double tangent requires separate singularity analysis.

- For the actual subtype element `f∈A_q`, f mod q equals C((f mod
  q).coeff(0)). k is a field, q is monic with natural degree exactly two. No separability, irreducibility,
  perfectness or characteristic restriction is imposed. Uses §2.26, §2.32. Use mem_algebra to write f=C(c)+qh
  for actual polynomial witnesses. Apply constant remainder and the constant-coefficient formula. This does
  not choose an arbitrary identification of the quotient or assume q irreducible.

- If the same polynomial f is C(c)+qh and C(d)+qj, then c=d. k is a field, q
  is monic with natural degree exactly two. No separability, irreducibility, perfectness or characteristic
  restriction is imposed. Uses §2.32, `Polynomial.C_injective`. Apply the native remainder operation to the
  equality of the two forms. constant remainder identifies the two remainders; cancel C by the built
  `C_injective`. There is no polynomial root-uniqueness assumption.

- For monic quadratic q and every f∈k[X], f mod q=C((f mod
  q).coeff0)+C((f mod q).coeff1)X. k is any field. `A_q` is the existing scalar-preimage Subalgebra of k[X],
  with its native subtype inclusion and restricted multiplication action. No separability, irreducibility,
  perfectness or characteristic restriction is imposed. q is monic with native natural degree exactly two.
  Uses `Polynomial.natDegree_modByMonic_lt`, `Polynomial.eq_X_add_C_of_natDegree_le_one`. The native monic
  remainder has natural degree below two. Apply the existing degree-at-most-one polynomial coefficient formula
  and reorder the two summands.

- The first component of `M_q(f)`, included in k[X], is C((f mod
  q).coeff0)+q(f div q). k is any field. `A_q` is the existing scalar-preimage Subalgebra of k[X], with its
  native subtype inclusion and restricted multiplication action. No separability, irreducibility, perfectness
  or characteristic restriction is imposed. Uses §2.26. Unfold the specified pair and native subtype
  inclusion.

- The second component of `M_q(f)`, included in k[X], is C((f mod
  q).coeff1). k is any field. `A_q` is the existing scalar-preimage Subalgebra of k[X], with its native subtype
  inclusion and restricted multiplication action. No separability, irreducibility, perfectness or
  characteristic restriction is imposed. Uses §2.26. Unfold the specified pair and native subtype inclusion.

- For monic quadratic q, `M_q(f).1•1+M_q(f).2•X=f` with the
  native `A_q` action on k[X]. k is any field. `A_q` is the existing scalar-preimage Subalgebra of k[X], with its
  native subtype inclusion and restricted multiplication action. No separability, irreducibility, perfectness
  or characteristic restriction is imposed. q is monic with native natural degree exactly two. Uses §2.26,
  `Subalgebra.smul_def`, `Polynomial.modByMonic_add_div`. Rewrite the native subalgebra action as ambient
  multiplication. Replace the sum of constant and linear remainder coefficients by f mod q, then use the
  native division identity.

- For every q,f∈k[X], define the actual pair `M_q(f)∈A_q×A_q` with first
  ambient polynomial C((f mod q).coeff0)+q(f div q) and second C((f mod q).coeff1). The first membership
  witness is its displayed scalar-plus-q-multiple form; the second is a constant. The pair is a specified
  coefficient function, not an algebra equivalence or a unique coordinate system over `A_q`. k is any field. `A_q`
  is the existing scalar-preimage Subalgebra of k[X], with its native subtype inclusion and restricted
  multiplication action. No separability, irreducibility, perfectness or characteristic restriction is
  imposed. Uses §2.26. Construct the actual two subalgebra elements using the membership and constant APIs.
  Their definitions use native monic division and coefficient operations; no replacement module or guessed
  residue map is introduced.

- For monic quadratic q, the native `A_q`-submodule span of {1,X} in k[X]
  is the whole module. k is any field. `A_q` is the existing scalar-preimage Subalgebra of k[X], with its native
  subtype inclusion and restricted multiplication action. No separability, irreducibility, perfectness or
  characteristic restriction is imposed. q is monic with native natural degree exactly two. Uses §2.26,
  `Submodule.eq_top_iff'`. Rewrite an arbitrary polynomial using the specified coefficient reconstruction.
  Each of its two summands is a scalar multiple of a member of the generating set. Apply the native
  top-submodule membership criterion.

- For monic quadratic q, native `Module.Finite(A_q,k[X])` holds
  for the multiplication action restricted from k[X]. k is any field. `A_q` is the existing scalar-preimage
  Subalgebra of k[X], with its native subtype inclusion and restricted multiplication action. No separability,
  irreducibility, perfectness or characteristic restriction is imposed. q is monic with native natural degree
  exactly two. Uses §2.26, `Module.finite_def`, `Submodule.fg_span`. The two-element generating set is finite.
  Use the existing finitely-generated-span theorem and the native finite-module characterization together with
  normalization-span.

- For monic quadratic q, the actual Scheme morphism
  `Spec(k[X])→Spec(A_q)` induced by the native subtype inclusion is finite. k is any field. `A_q` is the existing
  scalar-preimage Subalgebra of k[X], with its native subtype inclusion and restricted multiplication action.
  No separability, irreducibility, perfectness or characteristic restriction is imposed. q is monic with
  native natural degree exactly two. Uses §2.26, `AlgebraicGeometry.IsFinite.SpecMap_iff`. Convert the
  separately proved finite ring inclusion through the existing IsFinite.SpecMap_iff. This certifies the actual
  affine Scheme map, not its comparison to a separately constructed scheme normalization.

- For every nonzero q, the native map `A_q×A_q→k[X]`,
  (a,b)↦a•1+b•X, is not injective: the nonzero coefficient pair (−qX,q) and (0,0) both map to zero. k is any
  field. `A_q` is the existing scalar-preimage Subalgebra of k[X], with its native subtype inclusion and
  restricted multiplication action. No separability, irreducibility, perfectness or characteristic restriction
  is imposed. q≠0. This general fraction-field or module-relation statement is not restricted to quadratics.
  Uses §2.26, `Subalgebra.smul_def`. Construct −qX and q as actual subalgebra elements. Their two summands
  cancel by the native restricted multiplication action. If the coefficient map were injective, equality of
  the second ambient components would imply q=0. This rules out the tempting basis claim; it does not alone
  assert nonflatness.

- For every field k, a,b∈k and every
  open U of the actual glued curve C, put A=Γ(C,U), B=Γ(N,ν⁻¹U) with the actual ν section-algebra structure.
  The contraction to A of `c(im ν_U,B)` equals `Ann_A(B/(A·1))`, using the native module quotient. This is an
  identity for section rings on each open; it does not identify a sheaf cokernel with those section quotients.
  Uses §1.13, §2.46. Use the exact actual section map `ν_U` to supply the A-algebra structure on B. Specialize
  §1.13, whose proof needs neither affine U nor a nonempty-open hypothesis.

- For every field k, a,b∈k and every open
  U⊂C, the ideals in Γ(C,U) obtained by contracting the conductor of the actual section map for ν:N→C and for
  η.fromNormalization:η.normalization→C are equal, where η is C’s generic-point morphism. This includes U=∅
  and preserves nilpotents. It compares actual section maps, without yet constructing their conductor ideal
  sheaf. Uses §1.12, §2.62, §2.49. Use the previously specified
  absoluteNormalizationComparisonSectionsAlgEquiv over the actual Γ(C,U)-algebra structures. Apply
  contracted-conductor invariance under algebra equivalences to that exact equivalence; no affine or nonempty hypothesis is added.

**Checks.**

- `A_(t²)=k[t²,t³]`.

- For char k≠2, `A_(t²−1)` is the equal-value subalgebra {f:f(1)=f(−1)}.

- Over F₂, `t∉A_(t²+t+1)` although q and tq belong. The pinch is not all of k[t].

- Over F₂, every h∈F₂[t] has h=P(t²+t+1)+tQ(t²+t+1), with no separability restriction on the general existence
  result.

- Over F₂, (P,Q)↦P(t²)+t³Q(t²) is injective, despite the inseparability of t².

- Over any field, (P,Q)↦P(t)+tQ(t) is not injective: (t,0) and (0,1) have the same image.

- `F_(0,0)=V²−U³`.

- Over F₂, `F_(1,1)=V²+UV+U²−U³`; the UV term survives.

- `F_(0,0)(1,0)=−1`. Dropping the cubic term changes the affine curve.

- `ρ_q(C(1))=1`.

- `ρ_q(q)=0`.

- `ρ_q(tq)=0`, although the residue of t in AdjoinRoot(q) is not a constant.

- For q=X² over F₂, the actual subtype ring inclusion `A_q→F₂[X]` is finite.

- For q=X²+X+1 over F₂, the actual subtype ring inclusion `A_q→F₂[X]` is finite.

- For q=X²+X+1 over F₃, which has a repeated root, the actual subtype ring inclusion `A_q→F₃[X]` is still
  finite.

- For q=0 over any field k, the actual subtype ring inclusion `A_0→k[X]` is not finite: `A_0` is the constants and
  the polynomial module over k is not finite.

- For every q, `M_q(0)=(0,0)` in the actual product `A_q×A_q`.

- For every monic quadratic q, `M_q(X)=(0,1)` in `A_q×A_q`.

- For k=F₂ and q=X², `M_q(X³)` has first ambient component X³ and second component zero; it does not select the
  equally valid pair (0,q).

- For every monic quadratic q, the actual coefficient map `A_q×A_q→k[X]`, (a,b)↦a•1+b•X, is not injective; the
  spanning pair is not a basis over `A_q`.

- For a=b=0, the actual cuspidal two-chart normalization and native absolute normalization have the same
  contracted section-ring conductor on every open U.

- For a=b=1 over F₂ and U=∅, the two actual normalization section maps still have equal contracted conductors.
  No nonempty-open condition is smuggled into the comparison.

- The F₂ polynomial t²+t+1 excludes t from the pinch.

*Needs:* `Subalgebra.comap`; `AdjoinRoot.mkₐ`; `AdjoinRoot.mk_eq_mk`; `Algebra.mem_bot`; §2.32.

### 2.27 proper pinching of one closed field point

For a finite field extension E/k and a closed k-immersion Spec E→Y with Y proper, construct the scheme pinch
along Spec E→Spec k. It is proper, with finite surjective normalization-side map and closed rational pinched
point. A single closed point has an affine neighborhood, so the scheme-existence criterion applies. Prove
separatedness by the diagonal comparison and universal closedness after base change; separability and P¹ are
not needed for this target.

Spec E has one underlying point, so an affine neighborhood of its image in Y supplies the inherited global
Ferrand neighborhood hypothesis. Use the inherited universal property to obtain C→Spec k. Since Spec E→Spec k
is onto, Y→C is onto. Descend separatedness through the finite surjection using Stacks tag 09MQ. The inherited
finite maps give universally closedness; properness of Y and surjectivity give universally closedness of
C→Spec k via the pinned theorem. Obtain local finite type over k on Ferrand affine charts from
Stacks Lemma 37.67.5 (tag 0E27), whose affine case is Lemma 15.5.1 (tag 00IT); both retain the
(locally) Noetherian base hypothesis, here a field. Combine the three native morphism
properties.

([Stacks, §37.67, tag 0ECH](https://stacks.math.columbia.edu/tag/0ECH), especially Lemmas 37.67.4–5;
[Lemma 37.67.5, tag 0E27](https://stacks.math.columbia.edu/tag/0E27), including proof;
[Lemma 15.5.1, tag 00IT](https://stacks.math.columbia.edu/tag/00IT), full; [Stacks, tag
09MQ](https://stacks.math.columbia.edu/tag/09MQ), 29.42.11(4), full.)

**Checks.**

- When E=k and i is a closed rational point, pinching is the identity and C≅Y is proper.

*Needs:* §1.5; §1.1; `AlgebraicGeometry.UniversallyClosed.of_comp_surjective`; `AlgebraicGeometry.IsProper`;
SchemeAndStackFoundations SF.0, quotient/localization/flat-module contracts; SchemeAndStackFoundations
SF.1, scheme/étale-space contracts.

### 2.28 cohomology of the one-component pinch

For separable quadratic E/k embedded as a closed point in P¹, prove the pinch is proper geometrically integral
with H⁰=k and H¹≃E/k. The normalization/conductor sequence has the map k⊕k→E given by subtraction of the two
scalar images. Its cokernel has dimension one. Identify the rational singular point and its two conjugate
geometric branches.

Apply the proper point pushout and identify the selected affine chart with `A_q`; the complement is unchanged. The
normalization exact sequence is `0→O_C→ν_*O_P¹→j_*(E/k)→0`. On global constants the quotient map is zero. Import
H⁰(P¹,O)=k and H¹(P¹,O)=0; the long exact sequence gives the stated natural vector-space comparison, not a
preferred basis of E/k. After a separable splitting extension the chart has one ordinary node and integral
normalization, giving geometric integrality and the branch assertion. Use the specified native affine k-linear
`B/A_q≃E/k` and its one-dimensional quadratic normalization defect. This identifies only the affine quotient:
the original projective normalization, actual conductor ideal-sheaf, structure-sheaf exact sequence and
finite-pushforward H0/H1 steps remain required. Use the specified infinity quotient chart, its
coefficient-compatible localization equivalence and homogeneous coordinates. Import generic relative Proj
charts/gluing from SchemeAndStackFoundations SF.0 to identify the actual projective cubic with the
two-chart pinch and construct the finite normalization morphism. Then identify its conductor ideal sheaf and
the actual `O_C→ν_*O_P¹→j_*(E/k)` sequence before deriving H0/H1; none of these global comparisons follows from
an equation on coordinate tuples alone. Use the specified finite/infinity overlap equivalence and homogeneous
coordinate compatibility as inputs to the actual SchemeAndStackFoundations SF.0 projective-chart/gluing
comparison; these affine facts do not themselves construct the global normalization morphism. Use the
specified native glued scheme C, glued source N and actual finite morphism ν with its two cartesian chart
restrictions. The native reciprocal infinity map has u=1/t and z=1/(tq), and the curve structure map preserves
coefficients. The identifications C with the specified Proj cubic and N with P¹, the normalization universal
property, projectivity, conductor ideal sheaf and finite-pushforward H0/H1 remain required; this global chart
morphism is not a substitute for those comparisons. Use the specified all-open section injection and native
relative integral factorization of ν. Its section comparison and the affine nonsurjectivity regression keep
the source and pinched curve distinct. These facts do not discharge the absolute generic-point normalization,
projective-line/Proj, conductor ideal-sheaf exact sequence, finite-pushforward cohomology or independent I₂
obligations. Use the actual generic-point stalk isomorphism and its Spec triangle to form the integral
comparison δ from normalization in `K_C` to N, with both universal-property triangles and uniqueness. Establish
that δ is an isomorphism by genuine affine integral-closure comparisons before identifying N as absolute
normalization; then still construct P¹/Proj, projectivity, conductor/sheaf and coherent-cohomology inputs. The
relative-normalization comparison alone supplies none of those remaining conclusions. Use the actual affine section
equivalences in `K_C` and both restriction laws. Still compare this family with the native normalizationDiagram
and normalizationObjIso, including the empty-open branch, and identify the resulting scheme comparison with δ
before claiming absolute normalization or its cohomology sequence. Use the actual native-normalization section
equivalence `θ_U` and its comparison `Ψ_U` with the existing chart source on every nonempty affine U. Identify
these section maps with the existing δ map, prove their restriction compatibility and the empty-open branch,
and assemble the global scheme identification before the conductor-sheaf and cohomology steps; none of those
global conclusions is supplied by section-ring bijectivity alone. Use the actual absolute normalization scheme
isomorphism and its inverse over C, together with the actual all-open section algebra equivalences and their
inverse restriction law. Continue with the native P¹ and Proj identifications, properness/projectivity,
conductor ideal sheaf and structure-sheaf exact sequence, and finite-pushforward H0/H1; the separate I₂
construction and other inherited obligations are unchanged. Use the actual affine common-ideal exact pair and
its separate left-injectivity criterion, together with the all-open normalization section
conductor/annihilator identities. These section-ring calculations do not identify a sheaf cokernel with
sectionwise quotients. Still prove basic-open compatibility, construct the full conductor IdealSheafData and
its quotient subschemes, then the sheaf exact sequence and finite-pushforward cohomology comparisons.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, printed p10, separable-quadratic conductor
squares; Proposition3.2, printed p11.)

**Checks.**

- Over F₂ the proper I₁ pinch has one rational node, genus1 and four rational points.

*Needs:* §2.27; §2.26; StableReduction Layer 1; StableReduction Layer 2; SchemeAndStackFoundations SF.3,
Picard/Brauer and curve-cohomology contracts; §2.39; §2.40; §2.42; §2.41; §2.43; §2.46; §2.47; §2.48; §2.49;
§2.50; §2.51; §2.54; §2.55; §2.57; §2.58; §2.60; §2.61; §2.62; §1.23.

### 2.29 cohomology of the two-component pinch

For the two-component pinch with specified E-identifications, compute the normalization sequence using k²→E as
(a,b)↦a−b. The kernel is diagonal k and the cokernel is E/k. Prove properness, geometric connectedness,
reduction, two rational components and two conjugate geometric nodes. These statements concern a reducible
curve, so geometric integrality is not a conclusion.

Use the inherited global Ferrand existence: the two closed points lie in a disjoint union of affine
neighborhoods, which is affine. Properness follows by the same finite-surjection argument. The normalization
quotient sheaf is `j_*E`, using (x,y)↦x−y from E⊕E modulo the specified diagonal E. The global map k⊕k→E is
(c₁,c₂)↦c₁−c₂; its kernel is the diagonal k and its cokernel is E/k. H¹ of each P¹ vanishes. After splitting
E, glue corresponding branches in the two components. Each geometric node has branches in different
components; Frobenius exchanges the two edges and fixes the component vertices.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, printed p10, separable-quadratic conductor
squares; Proposition3.2, printed p11.)

**Checks.**

- Over F₂ the specified I₂ pinch has genus1 and six rational points; its two nodes are defined over F₄.

*Needs:* §1.5; §2.27; StableReduction Layer 1; StableReduction Layer 2; SchemeAndStackFoundations SF.3,
Picard/Brauer and curve-cohomology contracts.

### 2.30 field extension and branch action

After a field extension K/k, identify the pulled-back conductor algebra with `E⊗_k K` and the pinch with the
corresponding base-changed construction. This étale quadratic algebra is either K×K or a quadratic field. In
the split case the one-component pinch becomes I₁ and the fixed-component two-component pinch becomes I₂. Only
the branch points split in the latter.

Field extension is flat, so apply the existing four-arrow base-change comparison. Use the imported separable
quadratic tensor/Chinese-remainder comparison and track its two projections. For I₁ the two normalization
points are identified with one K-rational point. For I₂ each of the two conductor points glues one branch from
each specified component. Compare actual normalization and branch schemes with the imported graph carrier;
record edge/half-edge actions without assuming trivial Galois action on all incidence data.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, printed p10, separable-quadratic conductor
squares; Proposition3.2, printed p11.)

**Checks.**

- Base change to F₄ splits both F₂ branch schemes while keeping the I₂ vertices fixed.

*Needs:* §2.28; §2.29; §1.6; StableReduction Layer 1; SchemeAndStackFoundations SF.0,
quotient/localization/flat-module contracts.

### 2.31 point counts over every finite extension

For n≥1 put Q=qⁿ. Prove the nonsplit I₁ count is Q+2 for odd n and Q for even n, equivalently Q+1−(−1)ⁿ. Prove
the fixed-component nonsplit I₂ count is 2Q+2 for odd n and 2Q for even n. Frobenius has period two on the
quadratic conductor; apply the complement isomorphism and count its image. Include equality with counts of any
nilpotent fiber thickening having this reduction.

`E=𝔽_(q²)` has no `𝔽_(q^n)`-points as an `𝔽_q`-scheme for odd n, and two for even n. Import the standard
finite-field embedding criterion. For I₁ use the complement isomorphism: `#(P¹ ∖ Spec E)+#Spec 𝔽_q`. This is
Q+1−0+1 or Q+1−2+1. For I₂ remove the two copies of Spec E from P¹⊔P¹ and add one Spec E: 2(Q+1)−2e+e where e
is0 or2. A field-valued morphism kills nilpotents; import the reduction comparison. At n=1 recover the two
inherited Schröer3.2 counts. Prove point count extension power, the odd/even
formula for the one-component equation over every actual finite receiving-field algebra;
use the even-degree criterion for quadratic roots and quadratic root count extension parity for the native conductor-polynomial
criterion. Identify the actual projective pinch and its conductor field with this chart before transporting
the count. These facts do not prove I₂ or schematic reduction; the numerical trace defect is only an auxiliary
check.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, printed p10, separable-quadratic conductor
squares; Proposition3.2, printed p11; [Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3 conductor
square, complete Proposition3.1–3.2 proofs and adjacent point-count table in HTML; [Schröer, arXiv
v3](https://arxiv.org/pdf/2004.07025v3), §3 one/two-component conductor diagrams; complete Proposition3.1–3.2
proofs and point-count table, parsed HTML; [Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3,
printed p10 conductor diagrams; Proposition3.1–3.2, printed pp10–11 and adjacent count table.)

The construction needs the following maps and laws.

- For a finite field k of size Q, Nat.card of the native affine
  equation-solution subtype plus Nat.card{t∈k:q(t)=0} equals Q+1. k is a field; a,b∈k; W is the actual native
  WeierstrassCurve with coefficient tuple (a,−b,0,0,0); q(t) abbreviates t²+at+b. No separability, perfectness
  or characteristic restriction. k is finite. Uses §2.35, `Nat.card_congr`, `Nat.card_eq_fintype_card`,
  `Fintype.card_option`, `Fintype.card_subtype_compl`, `Fintype.card_subtype_le`. Choose a Fintype from the
  actual finiteness instance. Transport the solution cardinality along affine param equivalence. Option adds one
  origin; complement cardinality is Q minus the distinct-root subtype cardinality. Use subtype-cardinality≤Q
  before natural subtraction cancellation. This counts distinct roots, not scheme length.

- For a finite field k and W=(a,−b,0,0,0),
  W.pointCount+Nat.card{t∈k:q(t)=0}=Nat.card k+2. k is a field; a,b∈k; W is the actual native WeierstrassCurve
  with coefficient tuple (a,−b,0,0,0); q(t) abbreviates t²+at+b. No separability, perfectness or
  characteristic restriction. k is finite. Uses §2.31, `WeierstrassCurve.pointCount`,
  `WeierstrassCurve.pointCount_def`. Expand only the native pointCount_def: it is every affine equation
  solution plus one infinity point, even on a singular model. Add this extra one to affine card balance.
  Neither the nonsingular group carrier nor pointCount_eq_card_point is used.

- For a finite field k and W=(a,−b,0,0,0),
  W.frobeniusTrace=(Nat.card{t∈k:q(t)=0}:ℤ)−1. k is a field; a,b∈k; W is the actual native WeierstrassCurve
  with coefficient tuple (a,−b,0,0,0); q(t) abbreviates t²+at+b. No separability, perfectness or
  characteristic restriction. k is finite. Uses §2.31, `WeierstrassCurve.frobeniusTrace`,
  `WeierstrassCurve.frobeniusTrace_def`. Use the native frobeniusTrace_def Q+1−pointCount and the preceding
  balance. Integer arithmetic gives r−1. On these singular equations this is the numerical invariant; no étale
  cohomological trace theorem is asserted.

- Nat.card{t∈k:q(t)=0} is2 if q has a k-root and0 otherwise.
  Counts are of distinct elements of the native equation subtype, not multiset multiplicity. k is a finite
  field, a,b∈k, q(t)=t²+at+b, W=(a,−b,0,0,0) in the actual native WeierstrassCurve carrier. Require the native
  quadratic discriminant discrim(1,a,b)=a²−4b to be nonzero. There is no assumption that 2 is invertible. In
  characteristic two this condition is a≠0; the repeated-root case is deliberately excluded. This is not the
  Weierstrass discriminant, which is zero for these singular equations. Uses `discrim`,
  `vieta_formula_quadratic`, `discrim_eq_sq_of_quadratic_eq_zero`, `Fintype.card_of_subtype`,
  `Finset.card_pair_eq_two_iff`. Use the existing Vieta theorem to obtain s with r+s=−a and rs=b from a root
  r. The existing root-discriminant identity shows r=s would force discrim(1,a,b)=0, even in characteristic
  two. Factor q(z)=(z−r)(z−s); the native root subtype is exactly the two-element finset subtype. Transfer
  cardinality with the existing Fintype.card_of_subtype and pair-card criterion. With no root the subtype
  corresponds to the empty finset. No quadratic formula dividing by2 is used.

- W.pointCount=Nat.card(k) when q has a k-root, and Nat.card(k)+2 when it
  has none, with the singular origin and the infinity point both included. k is a finite field, a,b∈k,
  q(t)=t²+at+b, W=(a,−b,0,0,0) in the actual native WeierstrassCurve carrier. Require the native quadratic
  discriminant discrim(1,a,b)=a²−4b to be nonzero. There is no assumption that 2 is invertible. In
  characteristic two this condition is a≠0; the repeated-root case is deliberately excluded. This is not the
  Weierstrass discriminant, which is zero for these singular equations. Uses §2.31. Insert the root-count
  dichotomy in the existing native pointCount balance and cancel in natural-number arithmetic. Count the
  affine equation subtype, not the nonsingular group; pointCount_def already includes the one infinity point.

- W.frobeniusTrace=1 when q has a k-root and−1 when it has none. This
  is the existing integer count defect on a singular model, not an elliptic/cohomological trace claim. k is a
  finite field, a,b∈k, q(t)=t²+at+b, W=(a,−b,0,0,0) in the actual native WeierstrassCurve carrier. Require the
  native quadratic discriminant discrim(1,a,b)=a²−4b to be nonzero. There is no assumption that 2 is
  invertible. In characteristic two this condition is a≠0; the repeated-root case is deliberately excluded.
  This is not the Weierstrass discriminant, which is zero for these singular equations. Uses §2.31. Insert the
  distinct-root count into the existing Frobenius trace roots formula r−1. The nonzero quadratic discriminant
  excludes the repeated-root value0; retain that boundary rather than asserting every singular model has
  sign±1.

- For any unital field homomorphism f:k→L with L finite,
  `W_f=(f(a),−f(b),0,0,0)` has pointCount=Nat.card(L) if t²+f(a)t+f(b) has a root in L, and Nat.card(L)+2
  otherwise. No separate source-finiteness assumption is required in the signature; injectivity and
  receiving-field finiteness imply source finiteness. k is any field, L is a finite field, f:k→L is any unital
  ring homomorphism, a,b∈k, and discrim(1,a,b)≠0. Use the actual native `W_f` with coefficient tuple
  (f(a),−f(b),0,0,0). No characteristic restriction, odd/even degree criterion or geometric identification is
  assumed. Uses §2.31, `discrim`, `RingHom.injective`. Transport the quadratic discriminant by the actual ring
  homomorphism: D′=f(D). Native field-map injectivity keeps D′ nonzero; apply the receiving-field pointCount
  branch formula. This packages the actual coefficient tuple and receiving root predicate, not the
  still-required odd/even finite-extension splitting criterion.

- For irreducible q=X²+C(a)X+C(b) over k and finite field L with a
  k-algebra structure, there exists t∈L with t²+algebraMap(a)t+algebraMap(b)=0 if and only if 2 divides
  Module.finrank(k,L). k and L are fields, L is finite, with the actual native Algebra k L. No separate Finite
  k assumption is needed: injectivity into L forces it. a,b∈k and q=X²+C(a)X+C(b) is irreducible over k. Use
  actual Module.finrank k L, native algebraMap, polynomial quotient and WeierstrassCurve; no assumed parity
  oracle or count data. Uses `FiniteField.nonempty_algHom_iff_finrank_dvd`, `AdjoinRoot.instField`,
  `AdjoinRoot.liftAlgHom`, `AdjoinRoot.aeval_algHom_eq_zero`, `finrank_quotient_span_eq_natDegree`,
  `Polynomial.natDegree_quadratic`. Take the actual field AdjoinRoot(q). Monicity and the nonzero leading
  coefficient give natDegree(q)=2, hence the native quotient has k-finrank2. A receiving root gives the
  existing liftAlgHom; conversely the image of the quotient root satisfies the actual receiving polynomial by
  aeval_algHom_eq_zero. Apply the finite-field algebra-homomorphism criterion and rewrite the source finrank
  to2. No new generic field-embedding theorem is planned.

- Under irreducibility of q and nonzero quadratic
  discriminant, the native subtype {t∈L:t²+algebraMap(a)t+algebraMap(b)=0} has Nat.card2 when 2 divides
  Module.finrank(k,L), and0 otherwise. k and L are fields, L is finite, with the actual native Algebra k L. No
  separate Finite k assumption is needed: injectivity into L forces it. a,b∈k and q=X²+C(a)X+C(b) is
  irreducible over k. Use actual Module.finrank k L, native algebraMap, polynomial quotient and
  WeierstrassCurve; no assumed parity oracle or count data. For the distinct-root/count/trace formulas require
  discrim(1,a,b)=a²−4b≠0 explicitly. No inversion of2 or characteristic restriction; this is the quadratic
  discriminant, not the vanishing Weierstrass discriminant. Uses §2.31, `RingHom.injective`, `discrim`.
  Transport the nonzero quadratic discriminant through the actual algebraMap; field injectivity preserves
  nonvanishing. Apply the existing native distinct-root branch formula in L, then replace root existence by
  the separately proved degree criterion.

- For `W_L=(algebraMap(a),−algebraMap(b),0,0,0)`, under
  irreducibility and nonzero quadratic discriminant, the point count of W_L is Nat.card(L) for even
  Module.finrank(k,L), and Nat.card(L)+2 for odd degree, including singular origin and infinity. k and L are
  fields, L is finite, with the actual native Algebra k L. No separate Finite k assumption is needed:
  injectivity into L forces it. a,b∈k and q=X²+C(a)X+C(b) is irreducible over k. Use actual Module.finrank k
  L, native algebraMap, polynomial quotient and WeierstrassCurve; no assumed parity oracle or count data. For
  the distinct-root/count/trace formulas require discrim(1,a,b)=a²−4b≠0 explicitly. No inversion of2 or
  characteristic restriction; this is the quadratic discriminant, not the vanishing Weierstrass discriminant.
  Uses §2.31. Use the receiving-field coefficient-map count formula with the actual algebraMap k L. Replace
  its root predicate by divisibility of extension degree. Reconcile proof-irrelevant decidability instances by
  splitting the condition; neither outcome is assumed.

- For the same actual `W_L` and hypotheses, the point count of W_L equals
  `Nat.card(k)^Module.finrank(k,L)` when the degree is even, and this power plus2 when it is odd. k and L are
  fields, L is finite, with the actual native Algebra k L. No separate Finite k assumption is needed:
  injectivity into L forces it. a,b∈k and q=X²+C(a)X+C(b) is irreducible over k. Use actual Module.finrank k
  L, native algebraMap, polynomial quotient and WeierstrassCurve; no assumed parity oracle or count data. For
  the distinct-root/count/trace formulas require discrim(1,a,b)=a²−4b≠0 explicitly. No inversion of2 or
  characteristic restriction; this is the quadratic discriminant, not the vanishing Weierstrass discriminant.
  Uses §2.31, `Module.natCard_eq_pow_finrank`. The finite receiving field supplies the finite k-module
  instance. Rewrite Nat.card(L) in the degree-branch theorem using the existing module cardinality theorem.
  This computes the actual equation-level projective count, without asserting a geometric pinching
  identification.

- For the same actual `W_L` and hypotheses, the Frobenius trace of W_L
  is1 for even Module.finrank(k,L) and−1 for odd degree. This is the existing integer count defect on a
  singular equation, without a cohomological or elliptic trace assertion. k and L are fields, L is finite,
  with the actual native Algebra k L. No separate Finite k assumption is needed: injectivity into L forces it.
  a,b∈k and q=X²+C(a)X+C(b) is irreducible over k. Use actual Module.finrank k L, native algebraMap,
  polynomial quotient and WeierstrassCurve; no assumed parity oracle or count data. For the
  distinct-root/count/trace formulas require discrim(1,a,b)=a²−4b≠0 explicitly. No inversion of2 or
  characteristic restriction; this is the quadratic discriminant, not the vanishing Weierstrass discriminant.
  Uses §2.31, `WeierstrassCurve.frobeniusTrace_def`. Unfold the existing native finite-field count defect and
  substitute the degree-branch point count. Split on even degree and simplify integer arithmetic. The sign
  switches when the two conductor roots become rational.

**Checks.**

- Over F₂ the subtype t²=0 has cardinality one, although the conductor algebra k[t]/t² has length two.

- Over F₂, the native models with tuples (1,0,0,0,0),(1,1,0,0,0),(0,0,0,0,0) have pointCount2,4,3
  respectively, including the origin and infinity.

- The same three native F₂ models have frobeniusTrace1,−1,0 respectively.

- Over F₂, q=t²+t has exactly2 distinct roots; the checked branch proof works without inverting2.

- Over F₂, q=t²+t+1 has0 roots, despite the same nonzero quadratic discriminant.

- Over F₃, W=(0,1,0,0,0), so q=t²−1, has native pointCount3; two roots yield the split value, not the
  nonsingular-locus count.

- Over F₃, W=(0,−1,0,0,0) has q=t²+1 with no root and native frobeniusTrace−1.

- Over F₃, q=t²+t+1 has quadratic discriminant0 and one distinct repeated root; W=(1,−1,0,0,0) has
  frobeniusTrace0, so the nonzero-discriminant hypothesis is necessary.

- For the identity field homomorphism, the receiving-field count formula is exactly the native source formula,
  with a and b unchanged.

- For the actual native degree-three extension of ZMod2, t²+t+1 has no root.

- In the actual native degree-two extension of ZMod2, the distinct-root subtype for t²+t+1 has cardinality2.

- For the actual native degree1 extension of ZMod2, the model (1,−1,0,0,0) has pointCount4.

- For the actual native degree2 extension of ZMod2, the model (1,−1,0,0,0) has pointCount4.

- For the actual native degree3 extension of ZMod2, the model (1,−1,0,0,0) has pointCount10.

- In the actual native degree-two extension of ZMod3, the model (0,−1,0,0,0) has pointCount9.

- In the actual native degree-two extension of ZMod2, the model (1,−1,0,0,0) has native numerical trace
  defect1.

- For q=2,n=1 the counts are4 and6; for n=2 they are4 and8.

*Needs:* §2.30; §1.3; SchemeAndStackFoundations SF.0, quotient/localization/flat-module contracts;
SchemeAndStackFoundations SF.3, Picard/Brauer and curve-cohomology contracts.

### 2.32 polynomial normal forms over a quadratic

For q=t²+at+b, prove every polynomial has a unique representation P(q)+tQ(q). Existence follows by induction
using t²=q−at−b; uniqueness compares the even leading degree of P(q) with the odd leading degree of tQ(q).
This argument works in every characteristic and does not require q to be separable.

Use the native Polynomial.induction_on: constants have the pair (C(c),0), and addition adds the two pairs. For
multiplication by t, send (P,Q) to ((t−b)Q,P−aQ). Substitution and t²=q−at−b verify the identity in k[t]. This
is a specialized coordinate decomposition of existing Polynomial, not a replacement polynomial, quotient or
power-basis carrier.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, printed pp10–11, the conductor squares and
Proposition 3.2; derived affine polynomial adapter; [Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3),
§3, printed pp9–11, conductor squares and Proposition3.2.)

Standing hypotheses for the maps and laws below: No separability, irreducibility, perfectness or
characteristic restriction is imposed.

The construction needs the following maps and laws.

- For c∈k and h∈k[t], the native monic remainder of C(c)+qh modulo q is
  C(c). k is a field, q is monic with natural degree exactly two. Uses `Polynomial.add_modByMonic`,
  `Polynomial.self_mul_modByMonic`, `Polynomial.modByMonic_eq_self_iff`, `Polynomial.degree_C_le`,
  `Polynomial.degree_eq_natDegree`. Use the built add_modByMonic and self_mul_modByMonic to remove qh. The
  degree of C(c) is at most zero, while q has degree two since it is monic and nonzero. Apply the built
  modByMonic_eq_self_iff. The zero constant is included.

- For every c∈k, the native remainder of C(c)*t modulo q is C(c)*t. k is a
  field, q is monic with natural degree exactly two. Uses `Polynomial.degree_C_mul_X`,
  `Polynomial.degree_eq_natDegree`, `Polynomial.modByMonic_eq_self_iff`. Separate c=0, whose remainder is
  zero. For c≠0 the polynomial C(c)*t has degree one by degree_C_mul_X; q has degree two. Apply
  modByMonic_eq_self_iff. No inversion of two or discriminant computation occurs.

- For a field k and q,P,Q∈k[t] with natDegree(q)=2 and Q≠0,
  natDegree(P(q))=2 natDegree(P) and natDegree(tQ(q))=2 natDegree(Q)+1. The first equality includes P=0, where
  native natDegree(0)=0. Uses `Polynomial.comp_eq_zero_iff`, `Polynomial.natDegree_comp`,
  `Polynomial.natDegree_X_mul`. Polynomial.comp_eq_zero_iff and natDegree(q)=2 imply Q(q)≠0: the exceptional
  constant-composition case contradicts natDegree(C(c))=0. Apply Polynomial.natDegree_comp and
  Polynomial.natDegree_X_mul; rewrite natDegree(q)=2. Keep Q≠0, since natDegree(t·0)=0 is not1.

- For a field k and q∈k[t] with natDegree(q)=2, the actual function
  (P,Q)↦P(q)+tQ(q) from k[t]×k[t] to k[t] is injective. Uses §2.32, `Polynomial.comp_eq_zero_iff`,
  `Polynomial.natDegree_neg`. First prove the zero-form criterion. If P(q)+tQ(q)=0 with Q≠0, P(q)=−tQ(q). Its
  two native natural degrees have opposite parity by quadratic-normal-form-degrees and natDegree_neg, a
  contradiction. Hence Q=0. Polynomial.comp_eq_zero_iff gives P=0, because q cannot be constant. Apply the
  zero criterion to the componentwise difference of two polynomial pairs, using the native
  composition/subtraction identities. Recover equality of both components and Prod.ext.

**Checks.**

- The pair update remains valid for q=t² and for q=t²+t+1 over F₂.

*Needs:* `Polynomial.add_modByMonic`; `Polynomial.self_mul_modByMonic`; `Polynomial.modByMonic_eq_self_iff`;
`Polynomial.degree_C_le`; `Polynomial.degree_eq_natDegree`; `Polynomial.degree_C_mul_X`;
`Polynomial.induction_on`.

### 2.33 canonical linear equivalence for a quadratic pinch

Construct the coordinates as the actual k-linear equivalence (P,Q)↦P(q)+tqQ(q) from k[T]×k[T] to
`A_q`. Prove injectivity, surjectivity, inverse coordinate and degree laws. Promote it to the parameter
k[T]-linear comparison with T acting as q. Componentwise multiplication on the product is incorrect; the
multiplication law uses (tq)²=q³−bq²−aq(tq).

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, printed pp9–11, conductor squares and
Proposition3.2; [Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, printed p10 conductor squares and
Proposition3.2, p11; v3 HTML corresponding conductor paragraphs and full displayed Prop3.1–3.2 proofs.)

The construction needs the following maps and laws.

- For a field k and q∈k[t] with natDegree(q)=2, the actual
  function (P,Q)↦P(q)+tqQ(q) from k[t]×k[t] to k[t] is injective. Uses §2.32. Rewrite the pinch form as
  P(q)+t(tQ)(q). Apply quadratic-normal-form-injective to the pairs (P,tQ). Equality of their first components
  gives equality of P. Cancel the native nonzero polynomial t from the second components to obtain equality of
  Q. This is the zero-remainder certificate for the existing presentation argument, not yet a proof that every
  bivariate polynomial admits the required remainder modulo the relation.

- natDegree(t²+at+b)=2 over every field, including a=b=0 and
  characteristic2.

- The ambient polynomial of `M_(a,b)(P,Q)` is P(q)+tqQ(q).

- For every field k and a,b∈k, the actual k-linear map
  `M_(a,b):(k[t]×k[t])→A_(t²+at+b)` is bijective. There is no separability or characteristic hypothesis. Uses
  §2.33, §2.26. Coerce equality of two outputs into the ambient polynomial ring. coordinate map coe turns it
  into equality of P(q)+tqQ(q); quadratic-pinch-normal-form-injective with quadratic nat degree gives equality
  of both inputs. For a native element f of `A_q`, use the existing pinch spanning API to obtain P,Q with
  f=P(q)+tqQ(q). The ambient formula and Subtype.ext give M(P,Q)=f. This combines the specialized existence
  and uniqueness here; generic bijective-map-to-equivalence machinery is imported from the library.

- For any field k and a,b∈k, put q=t²+at+b and `A_q={f∈k[t]:f` mod q is scalar},
  the existing native Subalgebra. Define the actual k-linear map `M_(a,b):k[t]×k[t]→A_q` by (P,Q)↦P(q)+tqQ(q).
  The product has its ordinary componentwise k-module structure. This is a linear map, not an algebra
  homomorphism. Uses §2.26, `Polynomial.aeval`, `Polynomial.aeval_subalgebra_coe`, `Polynomial.comp_eq_aeval`.
  The elements u=q and v=tq belong to `A_q` by its membership criterion, with witnesses (0,1) and (0,t). Use
  native aeval at u into `A_q` to define `M(P,Q)=aeval_u(P)+v·aeval_u(Q)`. This construction proves membership
  without assuming the generation theorem or constructing a new carrier. The two aeval maps are k-linear, and
  multiplication by fixed v is k-linear. Their sum on the product proves addition and scalar laws.
  aeval_subalgebra_coe and comp_eq_aeval give the exact ambient polynomial formula. The monic displayed
  quadratic has native natural degree2 in every characteristic. The generic degree machinery is already in
  Mathlib; quadratic nat degree is just this coefficient-specific helper.

- For q=t²+at+b, the ambient value of e(P,Q) is P(q)+tqQ(q).

- If (P,Q)=e⁻¹(f), the actual ambient polynomial f is
  P(q)+tqQ(q). The inverse is the unique normal-form coordinate assignment.

- For any native `f∈A_q` and pair (P,Q), f=P(q)+tqQ(q) iff e⁻¹(f)=(P,Q).

- For all n≥0, the ambient image of `b(inl n)` is `q^n`; n=0 gives1.

- For all n≥0, the ambient image of `b(inr n)` is `tq^(n+1)`; n=0 gives tq.

- For any field k, a,b∈k, `f∈A_(t²+at+b)` and n≥0, put `(P,Q)=e_(a,b)⁻¹(f)`. The
  actual native basis representation satisfies b.repr(f)(inl n)=P.coeff(n) and b.repr(f)(inr n)=Q.coeff(n).
  This is an equality of the existing finitely supported representation coordinates, not a freely chosen
  coefficient map. Uses §2.33, `Module.Basis.prod_repr_inl`, `Module.Basis.prod_repr_inr`. Unfold Basis.map:
  its repr first applies e⁻¹ and then the product basis repr. prod_repr_inl and prod_repr_inr select the two
  polynomial coordinates. The native polynomial monomial basis uses the polynomial coefficient linear
  equivalence; its repr at n is coeff_n by definition.

- Finsupp.linearCombination k b (b.repr f)=f in the actual subalgebra,
  for every f.

- The natural degrees of the ambient basis vectors are2n and2(n+1)+1. All n,
  including0, are allowed; q is nonzero.

- For every field k and q=t²+at+b, construct an actual native Module.Basis `(ℕ⊕ℕ) k A_q`
  by mapping the product of the two native polynomial monomial bases through `e_(a,b)`. The vectors are `b(inl n)=q^n` and `b(inr n)=tq^(n+1)`. Thus the left index0 is1, the positive left indices have degrees2,4,…, and the
  right indices have degrees3,5,… . This is a basis of the existing subalgebra as a k-vector space, not a
  k[q]-module instance or a mere spanning-family assertion. Uses §2.33, `Polynomial.basisMonomials`,
  `Polynomial.coe_basisMonomials`, `Module.Basis.prod`, `Module.Basis.prod_apply`, `Module.Basis.map`,
  `Module.Basis.linearCombination_repr`, `Polynomial.natDegree_pow`, `Polynomial.natDegree_X_mul`. Use
  Polynomial.basisMonomials twice, the existing Module.Basis.prod to obtain a basis of k[t]×k[t] indexed by
  ℕ⊕ℕ, and Module.Basis.map along e to obtain a basis of `A_q`. prod_apply, coe_basisMonomials and
  coordinates coe evaluate the two summand vectors. The first is `q^n`; the second is `tq·q^n=tq^(n+1)`. This
  treats left index0 explicitly. The generic linearCombination_repr gives reconstruction by the native
  finitely supported coordinates. Infinite index sets require Finsupp.linearCombination, not a sum over a
  nonexistent finite enumeration. natDegree_pow and natDegree_X_mul, using q≠0 and natDegree(q)=2, give
  degrees2n and2(n+1)+1. Every basis vector avoids natural degree1, but a basis vector can have nonzero
  coefficient of t, as q=t²+t+1 over F₂ demonstrates.

**Checks.**

- `M_(a,b)(0,0)=0` for arbitrary a,b over any field.

- For k=F₂ and q=t²+t+1, M(t,0)=q and M(0,1)=tq as actual polynomials.

- For q=t² over any field, M(t,0)=t²≠t. The first coordinate evaluates at q, not at t.

- Over F₂ at q=t², e⁻¹(e(P,Q))=(P,Q) for every pair of actual polynomials.

- For q=t² over any field, the left index0 basis vector is1 and e⁻¹(0)=(0,0).

- For q=t² over any field, e((0,1)·(0,1))=t³ differs from e(0,1)·e(0,1)=t⁶. The equivalence is linear and not
  multiplicative for the native componentwise product.

- For q=t² over any field, `b(inl n)=t^(2n)` and `b(inr n)=t^(2n+3)` for every n.

- For k=F₂ and q=t²+t+1, the actual ambient b(inl1) has coefficient1 at t. Absence of a degree1 basis vector
  does not mean all degree1 coefficients vanish.

- For every a,b over any field and every i∈ℕ⊕ℕ, the actual ambient b(i) has natural degree unequal to1.

- Apply both inverse composites to arbitrary P,Q over F₂ at q=t²; multiplication of the second unit
  violates the product algebra formula.

*Needs:* §2.32; §2.26; `Polynomial.aeval`; `Polynomial.aeval_subalgebra_coe`; `Polynomial.comp_eq_aeval`;
`LinearEquiv.ofBijective`; `LinearEquiv.ofBijective_apply`.

### 2.34 canonical hypersurface algebra isomorphism

Construct the presentation `k[U,V]/(V²+aUV+bU²−U³)≃ₐ[k]A_q` with U↦q and V↦tq. Reduce each
polynomial modulo the monic V² relation to P(U)+VQ(U), then use coordinate uniqueness. Prove the actual
inclusion and both generator/inverse equations. No characteristic, irreducibility or distinct-root restriction
is added.

k is any field; a,b∈k; q=t²+at+b and `A_q` is the already owned scalar-preimage Subalgebra of k[t]. No
perfectness, separability, irreducibility or characteristic assumption is imposed. Use native
MvPolynomial(Fin2,k), Polynomial(k[U]), native ideals/quotients and algebra maps. Coordinate0 is
U=q,coordinate1 is V=tq. The transport places V in the outer polynomial variable and U in its coefficient
ring. No projective completion or node/cohomology property is asserted.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3 conductor squares preceding Propositions3.1–3.2;
complete displayed proofs of3.1–3.2 in v3 HTML.)

The construction needs the following maps and laws.

- The V-coordinate chart sends U to C(U), not to the outer variable V. k is any field;
  a,b∈k; q=t²+at+b and `A_q` is the already owned scalar-preimage Subalgebra of k[t]. Use native
  MvPolynomial(Fin2,k), Polynomial(k[U]), native ideals/quotients and algebra maps. Coordinate0 is
  U=q,coordinate1 is V=tq. Uses §2.34, `MvPolynomial.rename_X`, `MvPolynomial.finSuccEquiv_X_succ`,
  `MvPolynomial.uniqueAlgEquiv`. Apply native rename to the swapped index, the successor-variable formula and
  the single-variable coefficient equivalence.

- The V-coordinate chart sends V to the outer polynomial variable V. k is any field;
  a,b∈k; q=t²+at+b and `A_q` is the already owned scalar-preimage Subalgebra of k[t]. Use native
  MvPolynomial(Fin2,k), Polynomial(k[U]), native ideals/quotients and algebra maps. Coordinate0 is
  U=q,coordinate1 is V=tq. Uses §2.34, `MvPolynomial.rename_X`, `MvPolynomial.finSuccEquiv_X_zero`. The
  swapped index is0; native finSuccEquiv maps it to the outer variable and coefficient transport preserves
  that variable.

- For all a,b, `e(F_(a,b))=V²+C(aU)V+C(bU²−U³)` in the actual polynomial ring
  k[U][V]. k is any field; a,b∈k; q=t²+at+b and `A_q` is the already owned scalar-preimage Subalgebra of k[t].
  Use native MvPolynomial(Fin2,k), Polynomial(k[U]), native ideals/quotients and algebra maps. Coordinate0 is
  U=q,coordinate1 is V=tq. Uses §2.34, §2.26. Apply the algebra-homomorphism sum/product/power and scalar
  laws, use the two coordinate formulas, and collect the coefficient polynomial. Retain the cubic term and the
  UV coefficient.

- Use the existing native algebra equivalences to construct e:k[U,V]≅k[U][V] with
  e(U)=C(U) and e(V)=V. Swap the two Fin2 indices before finSuccEquiv, then map the native one-variable
  coefficient equivalence. This is a coordinate-convention adapter on existing carriers, not a new general
  polynomial construction. k is any field; a,b∈k; q=t²+at+b and `A_q` is the already owned scalar-preimage
  Subalgebra of k[t]. Use native MvPolynomial(Fin2,k), Polynomial(k[U]), native ideals/quotients and algebra
  maps. Coordinate0 is U=q,coordinate1 is V=tq. Uses `MvPolynomial.renameEquiv`, `MvPolynomial.finSuccEquiv`,
  `MvPolynomial.uniqueAlgEquiv`, `Polynomial.mapAlgEquiv`. Compose the native rename, successor-variable and
  coefficient-map equivalences. Their existing inverse laws give the algebra equivalence. The explicit swap is
  essential because finSuccEquiv chooses index0 as the outer variable, while this chart requires index1
  outside.

- For all a,b, `ψ_(a,b)(F_(a,b))=0`. k is any field; a,b∈k; q=t²+at+b
  and `A_q` is the already owned scalar-preimage Subalgebra of k[t]. Use native MvPolynomial(Fin2,k),
  Polynomial(k[U]), native ideals/quotients and algebra maps. Coordinate0 is U=q,coordinate1 is V=tq. Uses
  §2.34, §2.26. Evaluate the complete relation at q,tq and use q=t²+at+b. Commutative polynomial ring
  arithmetic proves the equality. This alone does not identify the full kernel.

- For every f∈k[U,V], `ψ(f)=eval₂(aeval_q,tq)(e(f))` in k[t]. The coefficient
  homomorphism evaluates U at q and the outer variable at tq. k is any field; a,b∈k; q=t²+at+b and `A_q` is the
  already owned scalar-preimage Subalgebra of k[t]. Use native MvPolynomial(Fin2,k), Polynomial(k[U]), native
  ideals/quotients and algebra maps. Coordinate0 is U=q,coordinate1 is V=tq. Uses §2.34,
  `Polynomial.eval₂AlgHom`, `MvPolynomial.algHom_ext`, `Polynomial.eval₂_C`, `Polynomial.eval₂_X`. Build the
  native iterated-polynomial evaluation algebra homomorphism; all elements commute in k[t]. Compare the two
  algebra homomorphisms on U and V using their chart formulas, then use native multivariable algebra
  extensionality.

- For all a,b, the actual range Subalgebra of `ψ_(a,b)` is `A_q`. k is any
  field; a,b∈k; q=t²+at+b and `A_q` is the already owned scalar-preimage Subalgebra of k[t]. Use native
  MvPolynomial(Fin2,k), Polynomial(k[U]), native ideals/quotients and algebra maps. Coordinate0 is
  U=q,coordinate1 is V=tq. Uses §2.34, §2.26, `MvPolynomial.aeval_range`, `Matrix.range_cons_cons_empty`.
  Native multivariable evaluation has range the algebra generated by its value tuple. The native two-element
  tuple has range {q,tq}; use the inherited exact generation theorem to identify this with `A_q`.

- For all a,b, `ker(ψ_(a,b))=Ideal.span{F_(a,b)}` in k[U,V]. k is any field;
  a,b∈k; q=t²+at+b and `A_q` is the already owned scalar-preimage Subalgebra of k[t]. Use native
  MvPolynomial(Fin2,k), Polynomial(k[U]), native ideals/quotients and algebra maps. Coordinate0 is
  U=q,coordinate1 is V=tq. Uses §2.34, `RingHom.mem_ker`, `Ideal.mem_span_singleton`. Use native ideal
  extensionality, kernel membership and membership in a principal ideal. The exact zero/divisibility
  equivalence supplies both directions; checking only F∈ker would not suffice.

- Define `ψ_(a,b):k[U,V]→k[t]` as the native algebra evaluation at U=q and V=tq,
  where q=t²+at+b. This uses the existing multivariable evaluation homomorphism. k is any field; a,b∈k;
  q=t²+at+b and `A_q` is the already owned scalar-preimage Subalgebra of k[t]. Use native MvPolynomial(Fin2,k),
  Polynomial(k[U]), native ideals/quotients and algebra maps. Coordinate0 is U=q,coordinate1 is V=tq. Uses
  `MvPolynomial.aeval`. Instantiate the native algebra evaluation at the actual two-element polynomial tuple;
  its generic algebra laws are imported.

- For every a,b, the native polynomial `e(F_(a,b))` is monic as a
  polynomial in V over k[U]. k is any field; a,b∈k; q=t²+at+b and `A_q` is the already owned scalar-preimage
  Subalgebra of k[t]. Use native MvPolynomial(Fin2,k), Polynomial(k[U]), native ideals/quotients and algebra
  maps. Coordinate0 is U=q,coordinate1 is V=tq. Uses §2.34. The displayed leading term is V²; both other terms
  have lower outer degree. Native polynomial monicity automation verifies its leading coefficient1 without
  inverting any scalar.

- For every a,b, `e(F_(a,b))` has native natural V-degree2, including
  characteristic2 and a=b=0. k is any field; a,b∈k; q=t²+at+b and `A_q` is the already owned scalar-preimage
  Subalgebra of k[t]. Use native MvPolynomial(Fin2,k), Polynomial(k[U]), native ideals/quotients and algebra
  maps. Coordinate0 is U=q,coordinate1 is V=tq. Uses §2.34. Native degree automation compares the monic V²
  leading term with the degree-at-most1 remainder.

- For every H∈k[U][V], division by e(F) leaves a remainder C(P)+V
  C(Q) for some actual P,Q∈k[U]. This includes the zero remainder. k is any field; a,b∈k; q=t²+at+b and `A_q` is
  the already owned scalar-preimage Subalgebra of k[t]. Use native MvPolynomial(Fin2,k), Polynomial(k[U]),
  native ideals/quotients and algebra maps. Coordinate0 is U=q,coordinate1 is V=tq. Uses §2.34,
  `Polynomial.natDegree_modByMonic_lt`, `Polynomial.eq_X_add_C_of_natDegree_le_one`. The monic relation has
  degree2 and is not1. Native monic division gives natural remainder degree<2 even for a zero remainder.
  Choose the native zeroth and first remainder coefficients. The existing degree-at-most1 formula reconstructs
  the exact remainder as C(P)+VC(Q).

- For every field k and a,b∈k, t²+at+b has native natural degree2. This
  supplies the coordinate-map API used by the full-kernel proof. k is any field; a,b∈k; q=t²+at+b and `A_q` is
  the already owned scalar-preimage Subalgebra of k[t]. Use native MvPolynomial(Fin2,k), Polynomial(k[U]),
  native ideals/quotients and algebra maps. Coordinate0 is U=q,coordinate1 is V=tq. Uses §2.33. Unfold the
  explicit polynomial and use native degree automation; its leading coefficient is1. The coordinate-map
  construction does not depend on this lemma, so there is no cycle.

- For every f∈k[U,V], ψ(f)=0 iff `F_(a,b)` divides f in the
  actual multivariable polynomial ring. No separability or characteristic restriction is used. k is any field;
  a,b∈k; q=t²+at+b and `A_q` is the already owned scalar-preimage Subalgebra of k[t]. Use native
  MvPolynomial(Fin2,k), Polynomial(k[U]), native ideals/quotients and algebra maps. Coordinate0 is
  U=q,coordinate1 is V=tq. Uses §2.34, §2.33, `Polynomial.modByMonic_add_div`,
  `Polynomial.modByMonic_eq_zero_iff_dvd`, `Polynomial.eval₂_add`, `Polynomial.eval₂_mul`,
  `Polynomial.eval₂_C`, `Polynomial.eval₂_X`, `Polynomial.comp_eq_aeval`. Apply the native monic division
  decomposition to e(f). Since ψ(f)=0 and ψ(F)=0, the iterated evaluation of its remainder is0. Write that
  exact remainder C(P)+VC(Q). The chart comparison makes its image P(q)+tqQ(q). The inherited
  pinch-normal-form injectivity at the exact degree2 quadratic forces P=Q=0. Native remainder-zero iff
  divisibility yields e(F)∣e(f). Pull the divisor witness back through the native algebra-equivalence inverse
  to get F∣f. Conversely a multiple of F evaluates to0 by the native algebra multiplication law.

- For every f, the inclusion of `ψ_A(f)` in k[t] is ψ(f). k is any
  field; a,b∈k; q=t²+at+b and `A_q` is the already owned scalar-preimage Subalgebra of k[t]. Use native
  MvPolynomial(Fin2,k), Polynomial(k[U]), native ideals/quotients and algebra maps. Coordinate0 is
  U=q,coordinate1 is V=tq. Uses §2.34, `AlgHom.coe_codRestrict`. This is the defining native
  codomain-restriction coercion, stated for quotient-map evaluation.

- For all a,b the actual `ψ_A:k[U,V]→A_q` is surjective. k is
  any field; a,b∈k; q=t²+at+b and `A_q` is the already owned scalar-preimage Subalgebra of k[t]. Use native
  MvPolynomial(Fin2,k), Polynomial(k[U]), native ideals/quotients and algebra maps. Coordinate0 is
  U=q,coordinate1 is V=tq. Uses §2.34. Each actual `f∈A_q` belongs to the proven range, so take its
  multivariable preimage. Equality in the subalgebra follows by native subtype extensionality.

- The native kernel of `ψ_A` is the principal ideal generated by
  `F_(a,b)`. k is any field; a,b∈k; q=t²+at+b and `A_q` is the already owned scalar-preimage Subalgebra of k[t].
  Use native MvPolynomial(Fin2,k), Polynomial(k[U]), native ideals/quotients and algebra maps. Coordinate0 is
  U=q,coordinate1 is V=tq. Uses §2.34, `RingHom.mem_ker`. Equality to0 in the actual Subalgebra is equivalent
  to equality to0 after its native inclusion in k[t]. Apply the full ambient kernel theorem by native ideal
  extensionality.

- Restrict `ψ_(a,b)` to a native k-algebra homomorphism `ψ_A:k[U,V]→A_q`
  using the proven exact range. The target is the existing Subalgebra, not an abstract replacement. k is any
  field; a,b∈k; q=t²+at+b and `A_q` is the already owned scalar-preimage Subalgebra of k[t]. Use native
  MvPolynomial(Fin2,k), Polynomial(k[U]), native ideals/quotients and algebra maps. Coordinate0 is
  U=q,coordinate1 is V=tq. Uses §2.34, `AlgHom.codRestrict`. Every substitution value belongs to its native
  `range=A_q`; use native algebra codomain restriction.

- For every representative f, the ambient polynomial of the quotient
  equivalence on[f] is ψ(f).

- The inverse sends `ψ_A(f)` to the exact native quotient
  class[f].

- The native classes[U] and[V] map to q and tq, respectively.

**Checks.**

- At a=b=0 the transported equation is V²−C(U³).

- Over F₂ at a=b=1, the coefficient of U in the V coefficient is1; the UV term survives.

- The transported U and V are distinct: their outer V coefficients are0 and1. This rejects reversing the
  chosen variable order.

- The actual substitution sends the zero polynomial to0 for all parameters.

- Over F₂ at a=b=1, U maps to t²+t+1 and V to t(t²+t+1).

- At a=b=0 the image of V² is nonzero t⁶. Killing V² alone or dropping U³ changes the kernel.

- The restricted substitution sends0 to0 for any parameters.

- Over F₂ at q=t², its actual image of V is t³, including the inseparable/repeated-root case.

- Every scalar C(c) maps to that same constant in the existing subalgebra.

- The actual quotient algebra equivalence sends0 to0.

- At q=t², the actual image of[V]² is t⁶. This checks multiplicative compatibility in the quotient.

- At q=t² the class[U] is nonzero. The kernel is not the maximal ideal (U,V).

- Over F₂ at q=t², the inverse of `ψ_A(V²)` is exactly the native class[U³], using the source principal relation
  ideal.

- For every field k and a,b∈k, construct the actual k-algebra equivalence `k[U,V]/Ideal.span{F_(a,b)}≅A_q`
  induced by U↦q,V↦tq. It preserves the given inclusion into k[t] and remains valid for split, repeated-root
  and inseparable quadratics.

*Needs:* `MvPolynomial.renameEquiv`; `MvPolynomial.finSuccEquiv`; `MvPolynomial.uniqueAlgEquiv`;
`Polynomial.mapAlgEquiv`; `MvPolynomial.rename_X`; `MvPolynomial.finSuccEquiv_X_succ`;
`MvPolynomial.finSuccEquiv_X_zero`; §2.26; `MvPolynomial.aeval`; `Polynomial.eval₂AlgHom`;
`MvPolynomial.algHom_ext`; `Polynomial.eval₂_C`; `Polynomial.eval₂_X`; `Polynomial.natDegree_modByMonic_lt`;
`Polynomial.eq_X_add_C_of_natDegree_le_one`; §2.33; `Polynomial.modByMonic_add_div`;
`Polynomial.modByMonic_eq_zero_iff_dvd`; `Polynomial.eval₂_add`; `Polynomial.eval₂_mul`;
`Polynomial.comp_eq_aeval`; `MvPolynomial.aeval_range`; `Matrix.range_cons_cons_empty`; `RingHom.mem_ker`;
`Ideal.mem_span_singleton`; `AlgHom.codRestrict`; `AlgHom.coe_codRestrict`; `Ideal.quotientEquivAlgOfEq`;
`Ideal.quotientEquivAlgOfEq_mk`; `Ideal.quotientKerAlgEquivOfSurjective`;
`Ideal.quotientKerAlgEquivOfSurjective_mk`.

### 2.35 native affine solutions as a nonroot parameter or the origin

Construct the affine param equivalence between all affine solutions of the native equation and `Option
{t∈k | q(t)≠0}`. The origin corresponds to none. If x≠0 the parameter is y/x; conversely t maps to
(q(t),tq(t)). Prove x=0 forces y=0 before dividing, and prove q(y/x)=x. This counts equation solutions rather
than the smooth elliptic point group.

k is a field; a,b∈k; W is the actual native WeierstrassCurve with coefficient tuple (a,−b,0,0,0); q(t)
abbreviates t²+at+b. No separability, perfectness or characteristic restriction.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3 conductor square, complete Proposition3.1–3.2
proofs and adjacent point-count table in HTML.)

The construction needs the following maps and laws.

- For any field k and a,b,t∈k, put q(t)=t²+at+b and W=(a,−b,0,0,0). Then
  W.toAffine.Equation(q(t),tq(t)). k is a field; a,b∈k; No separability, perfectness or characteristic
  restriction. Uses `WeierstrassCurve.Affine.equation_iff`. Rewrite the native affine equation; substitute
  x=q(t),y=tq(t). Ring normalization proves y²+axy=x³−bx² without dividing or assuming q(t)≠0.

- For any field k and a,b,y∈k, W.toAffine.Equation(0,y) implies y=0. k is a
  field; a,b∈k; No separability, perfectness or characteristic restriction. Uses
  `WeierstrassCurve.Affine.equation_iff`. The equation at x=0 reduces to y²=0. A field is reduced, so y=0. The
  origin is retained as an equation solution even though the model is singular.

- For any field k and a,b,x,y∈k with W.toAffine.Equation(x,y) and x≠0,
  q(y/x)=x. k is a field; a,b∈k; No separability, perfectness or characteristic restriction. Uses
  `WeierstrassCurve.Affine.equation_iff`. Rewrite the equation and divide through x², justified by x≠0. Clear
  denominators explicitly; the remainder is exactly the given equation.

- The origin maps to none.

- The underlying pair of the inverse at none is (0,0).

- The underlying pair of the inverse at some(t) is exactly
  (q(t),tq(t)).

- For a solution with x≠0, mapping Subtype.val over the Option
  output gives some(y/x).

**Checks.**

- For arbitrary rational a,b, the native origin maps to none.

- Over F₂ for q=t²+t+1, inverse some(0) is the actual pair (1,0).

- Over F₂ for q=t², inverse some(1) is (1,1); the repeated-root origin remains a separate none output.

- For every field k and a,b∈k, construct an equivalence between the native subtype of pairs (x,y) satisfying
  W.toAffine.Equation(x,y) and Option of the subtype of t∈k with q(t)≠0. The origin maps to none; a solution
  with x≠0 maps to some(y/x); inverse some(t) is (q(t),tq(t)).

*Needs:* `WeierstrassCurve.Affine.equation_iff`.

### 2.36 polynomial pinch away from its divisor

For any q, including zero and units, prove the actual inclusion `A_q→k[t]` becomes bijective after inverting q.
Both q and qt belong to `A_q`, so the missing coordinate t is recovered as qt/q. The q=0 localization is zero;
do not assume its localization maps injective.

The membership criterion gives `q∈A_q` and `qh∈A_q` for every h∈k[X]. Thus q is in the general ambient
conductor, without needing to identify the whole conductor with(q). Apply the conductor away bijective to the
actual underlying subring and its subtype inclusion.

([Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Theorem5.1, printed p568, complete
principal-localization paragraph, with Lemma1.3(b) and its converse, pp556–557.)

**Checks.**

- For q=X²−1 over Q, the actual pinch inclusion induces a bijection on any native localizations at q.

- For q=X²+X+1 over F₂, the same actual localization map is bijective; no rational conductor root is assumed.

- For q=X² over F₂, the actual localization map is bijective despite the inseparability and cusp.

- For q=0 over F₂, the actual localization map is still bijective on any native localization carriers. This
  does not assert a nonempty open complement.

- The split quadratic over Q, irreducible quadratic over F₂, inseparable cusp polynomial over F₂ and q=0 all
  satisfy the same native localization statement.

*Needs:* §2.26; §1.2.

### 2.37 recover the polynomial coordinate

Name the inverse localization equivalence and prove its value on the ambient coordinate t is the fraction qt/q
of actual elements of `A_q`. Include the canonical coefficient and localization-map squares. This expression is
an identity in the localization, not division by a nonzero field element.

Construct the native equivalence directly from the specified localized inclusion and its proved bijectivity.
The membership criterion supplies the numerator qX and denominator q as actual subtype elements.
Apply the equivalence’s injectivity and inverse law. Native `map_mk′` and `eq_mk′_iff_mul_eq` reduce the asserted
inverse formula to Xq=qX in the ambient ring.

([Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Theorem5.1, printed p568, complete
principal-localization paragraph, with Lemma1.3(b) and its converse, pp556–557.)

**Checks.**

- This recovers the affine coordinate on the complement, including the cusp, without asserting that the
  original inclusion is surjective.
- For q=t²+t+1 over F₂ the element t is not in `A_q=k+qk[t]`, while qt=t³+t²+t and q are; the inverse
  equivalence sends t to the fraction (qt)/q of these two elements, and the identity (qt/q)·q=qt holds in the
  localization.
- For the cusp q=t² over F₂, `A_q` contains t² and t³ but not t; the formula gives t=t³/t², and the shorter
  fraction t²/t would use the denominator t∉`A_q`.
- For a unit q=1, `A_q=k[t]` and the formula t=(1·t)/1 is the identity; for q=0 both localizations are the zero
  ring and the formula reads 0=0/0 in the zero ring, where no division is performed.

*Needs:* §2.36; §2.26; `RingEquiv.ofBijective`; `RingEquiv.ofBijective_apply`; `RingEquiv.apply_symm_apply`;
`IsLocalization.map_mk'`; `IsLocalization.eq_mk'_iff_mul_eq`.

### 2.38 integral closure in the shared fraction field

For monic quadratic q and a specified fraction field K of k[t], prove k[t] is the integral closure of `A_q` in K
with the actual coefficient inclusion. The polynomial coordinate is integral by its monic quadratic relation,
and localization identifies the fraction fields. Use normality of k[t] to obtain both inclusion directions for
integral closure.

k is any field. `A_q` is the existing scalar-preimage Subalgebra of k[X], with its native subtype inclusion and
restricted multiplication action. No separability, irreducibility, perfectness or characteristic restriction
is imposed. q is monic with native natural degree exactly two. K is a field with the actual polynomial algebra
map and IsFractionRing k[X] K; all `A_q` actions are canonical restrictions.

The finite normalization module makes k[X] integral over `A_q` through the existing finite-algebra instance. The
polynomial ring over a field is integrally closed by the pinned polynomial normality instance. Apply the
existing `IsIntegralClosure.of_isIntegrallyClosed` for the actual tower. The shared-fraction-field lemma
identifies K as the fraction field of the smaller ring as well. This is an affine ring normalization
comparison; the projective normalization comparison remains required.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, printed p10, one-component conductor diagram and
adjoining normalization discussion; affine algebraic deductions at its already owned quadratic chart.)

The construction needs the following maps and laws.

- For every nonzero polynomial q and every native fraction field K of k[X], K
  with the canonical restricted `A_q` algebra structure is also an actual native fraction field of `A_q`. k is any
  field. `A_q` is the existing scalar-preimage Subalgebra of k[X], with its native subtype inclusion and
  restricted multiplication action. No separability, irreducibility, perfectness or characteristic restriction
  is imposed. q≠0. This general fraction-field or module-relation statement is not restricted to quadratics. K
  is a field with the given Algebra k[X] K and IsFractionRing k[X] K; the `A_q` structure is the native
  restricted one, not an independent Algebra instance. Uses §2.26, `IsFractionRing.of_field`,
  `IsFractionRing.div_surjective`, `Subalgebra.algebraMap_eq`. The restricted structure map is injective as
  the composite of the polynomial fraction-field map and the subtype inclusion. For z=a/b in K, both qa and qb
  lie in `A_q`. Multiplying numerator and denominator by the nonzero image of q gives z=(qa)/(qb). Apply the
  existing `IsFractionRing.of_field`, which handles zero numerators and denominator conditions.

- For monic quadratic q and z in any native polynomial fraction
  field K, z is integral over `A_q` if and only if z is the image of an actual polynomial in k[X]. k is any
  field. `A_q` is the existing scalar-preimage Subalgebra of k[X], with its native subtype inclusion and
  restricted multiplication action. No separability, irreducibility, perfectness or characteristic restriction
  is imposed. q is monic with native natural degree exactly two. K is a field with the given Algebra k[X] K
  and IsFractionRing k[X] K. Uses §2.38, `IsIntegralClosure`. Use the defining iff of the actual
  integral-closure instance from the preceding comparison. Preserve the given polynomial structure map in the
  existence assertion.

- For `a∈A_q`, `E_q` maps its image in `Frac(A_q)` to the image of its
  actual ambient polynomial in Frac(k[X]). k is any field. `A_q` is the existing scalar-preimage Subalgebra of
  k[X], with its native subtype inclusion and restricted multiplication action. No separability,
  irreducibility, perfectness or characteristic restriction is imposed. q≠0. This general fraction-field or
  module-relation statement is not restricted to quadratics. Uses §2.38, `Subalgebra.algebraMap_def`. Use the
  native algebra-equivalence commutation law and the existing restricted subalgebra structure map.

- For `a∈A_q`, `E_q⁻¹` maps the image of its actual ambient
  polynomial back to its image in `Frac(A_q)`. k is any field. `A_q` is the existing scalar-preimage Subalgebra of
  k[X], with its native subtype inclusion and restricted multiplication action. No separability,
  irreducibility, perfectness or characteristic restriction is imposed. q≠0. This general fraction-field or
  module-relation statement is not restricted to quadratics. Uses §2.38. Apply injectivity of `E_q` and its
  two-sided inverse law to the proved forward coefficient comparison.

- `E_q⁻¹` sends the image of X to the fraction with numerator `qX∈A_q` and
  denominator `q∈A_q`, using their actual scalar-plus-q-multiple membership witnesses. k is any field. `A_q` is
  the existing scalar-preimage Subalgebra of k[X], with its native subtype inclusion and restricted
  multiplication action. No separability, irreducibility, perfectness or characteristic restriction is
  imposed. q≠0. This general fraction-field or module-relation statement is not restricted to quadratics. Uses
  §2.38. Apply `E_q` to both sides. Its division preservation and coefficient comparison identify the right side
  with (qX)/q in Frac(k[X]); the image of q is nonzero, so the existing field cancellation law gives X.

- For every nonzero q∈k[X], construct the canonical native `A_q`-algebra
  equivalence `E_q:Frac(A_q)≃Frac(k[X])` using FractionRing.algEquiv and the proved shared-fraction-field
  instance. The receiving action is the native restriction of the polynomial action, and the maps commute with
  the actual inclusion. k is any field. `A_q` is the existing scalar-preimage Subalgebra of k[X], with its
  native subtype inclusion and restricted multiplication action. No separability, irreducibility, perfectness
  or characteristic restriction is imposed. q≠0. This general fraction-field or module-relation statement is
  not restricted to quadratics. Uses §2.38, `FractionRing.algEquiv`. Use the shared-fraction-field instance on
  the existing FractionRing(k[X]), then use native FractionRing.algEquiv. No quotient field, lift theory or
  abstract fraction-field carrier is replanned.

**Checks.**

- For monic quadratic q, the image of X in the native fraction field of k[X] is integral over the actual `A_q`.

- For q=X² over F₂ and arbitrary `a∈A_q`, `E_q` sends the native image of a to the fraction-field image of its
  actual ambient polynomial.

- For q=1 and arbitrary `a∈A_1`, `E_1⁻¹` sends the image of its ambient polynomial back to the native image of a.

- For every nonzero q and arbitrary `a,b∈A_q`, `E_q` sends the native quotient a/b to the quotient of their actual
  polynomial images; zero b is allowed by the field division convention.

- For monic quadratic q and a native polynomial fraction field K, k[X] is the actual native IsIntegralClosure
  of `A_q` in K, with its given inclusion into K.

*Needs:* §2.26; `IsFractionRing.of_field`; `IsFractionRing.div_surjective`; `Subalgebra.algebraMap_eq`;
`Algebra.IsIntegral.of_finite`; `IsIntegralClosure.of_isIntegrallyClosed`.

### 2.39 the comparison `B/A_q` with E/k

Construct the residue comparison `k[t]/A_q≃ₗ[k]AdjoinRoot(q)/k` for every q, where the
quotients are by the actual underlying k-submodules. Restrict the surjective residue map and identify its
inverse-image constants with `A_q`. Prove the induced formula and its naturality without selecting residue
representatives canonically.

k is any field; B=k[X], E is the native polynomial quotient AdjoinRoot(q), and `A_q` is the existing
scalar-preimage subalgebra of B. The B-action on E is induced by the actual quotient ring homomorphism; `A_q`
acts by restriction. Both quotient modules use the actual native submodule quotient structures. No
separability, irreducibility, perfectness or characteristic assumption is imposed.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, printed p10, one-component conductor diagram;
complete Proposition3.1–3.2 and adjoining proofs/table, pp10–11.)

Standing hypotheses for the maps and laws below: No separability, irreducibility, perfectness or
characteristic assumption is imposed. q is monic and its native natural degree is exactly two.

The construction needs the following maps and laws.

- For every q and f, f lies in the `A_q`-submodule of B generated by
  1 if and only if `f∈A_q`. k is any field; `A_q` acts by restriction. Uses §2.26, `Submodule.mem_span_singleton`,
  `Subalgebra.smul_def`. Use the singleton-span witness a•1=f and the actual restricted multiplication action;
  conversely take the subtype element f.

- For every q and z∈E, z lies in the `A_q`-submodule of E generated by 1
  if and only if z belongs to the bottom k-subalgebra of E. k is any field; `A_q` acts by restriction. Uses
  §2.26, `Submodule.mem_span_singleton`, `Algebra.mem_bot`, `AdjoinRoot.mk_C`, `AdjoinRoot.algebraMap_eq`,
  `RingHom.toAlgebra`, `IsScalarTower.of_algebraMap_eq`. A singleton-span witness has scalar quotient image by
  the definition of `A_q`. Conversely lift a scalar c through the actual polynomial `C(c)∈A_q`.

- For every q and f∈B, `η_q(f)` is the class of the actual polynomial
  quotient image of f in `E/(A_q·1)`. k is any field; `A_q` acts by restriction. Uses §2.39. Unfold the specified
  tower algebra map and quotient projection.

- For every q, the native `A_q`-linear kernel of `η_q` is exactly
  `A_q·1⊂B`. k is any field; `A_q` acts by restriction. Uses §2.39, `Submodule.Quotient.mk_eq_zero`. Kernel
  membership is vanishing of the quotient class. The residue-image span criterion and the definition of `A_q`
  identify it with the normalization-image span criterion.

- For every q, `η_q:B→E/(A_q·1)` is surjective. k is any field;
  `A_q` acts by restriction. Uses §2.39, `Submodule.mkQ_surjective`, `AdjoinRoot.mk_surjective`. Lift a quotient
  class to its actual E representative using the native quotient projection, then lift that representative
  through the surjective polynomial quotient map.

- For every q, define the specified `A_q`-linear map `η_q:B→E/(A_q·1)` as the
  actual polynomial quotient map followed by the native submodule quotient projection. Its `A_q` action is
  restriction of polynomial multiplication through the actual quotient ring homomorphism. k is any field; `A_q`
  acts by restriction. Uses §2.26, `AdjoinRoot.mk`, `RingHom.toAlgebra`, `IsScalarTower.of_algebraMap_eq`,
  `IsScalarTower.toAlgHom`, `Submodule.mkQ`. Equip E with the actual polynomial quotient action and its
  compatible k-polynomial scalar tower; restrict to `A_q` and compose the tower algebra map with the native
  quotient projection.

- For every q and f∈B, `ε_q([f])=[mk_q(f)]` in `E/(A_q·1)`. k is any
  field; `A_q` acts by restriction. Uses §2.39, `Submodule.quotEquivOfEq_mk`,
  `LinearMap.quotKerEquivOfSurjective_apply_mk`. Use the actual quotient transport and quotient-kernel
  construction on representatives.

- For every q and f∈B, `ε_q⁻¹([mk_q(f)])=[f]` in `B/(A_q·1)`. k
  is any field; `A_q` acts by restriction. Uses §2.39. Rewrite the forward representative equation and apply the
  native inverse law.

- For monic quadratic q, `Ann_Aq(E/(A_q·1))` equals the
  contraction of(q) along the actual inclusion `A_q⊂B`. k is any field; `A_q` acts by restriction. Uses §2.39,
  `LinearEquiv.annihilator_eq`. The native equivalence `ε_q` preserves annihilators. Apply the
  normalization-side annihilator equality; do not introduce another module action.

- For monic quadratic q, `a∈A_q` and z∈E, `a•[z]=ρ_q(a)•[z]`
  in `E/(A_q·1)`. k is any field; `A_q` acts by restriction. Uses §2.39, `AdjoinRoot.mk_surjective`,
  `LinearMapClass.map_smul_of_tower`. Lift z through the actual polynomial quotient map. Transport the
  normalization-side action through `ε_q`, using its `A_q` linearity and native k-scalar-tower compatibility.

- For every q, construct the specified `A_q`-linear equivalence
  `ε_q:B/(A_q·1)≃E/(A_q·1)` from `η_q` by the native first isomorphism theorem and its proved kernel equality. k
  is any field; `A_q` acts by restriction. Uses §2.39, `Submodule.quotEquivOfEq`,
  `LinearMap.quotKerEquivOfSurjective`. Transport the source quotient along the proved kernel equality, then
  compose with the native quotient-kernel equivalence of a surjective linear map.

- For every q, restriction to k of the `A_q-submodule A_q·1⊂E`
  equals the actual underlying k-submodule of the bottom k-subalgebra of E. k is any field; `A_q` acts by
  restriction. Uses §2.39, `Submodule.restrictScalars`, `Subalgebra.toSubmodule`. Apply extensionality to the
  residue-image span criterion; restriction of scalars does not change membership.

- For monic quadratic q and every f∈B,
  `[f]=M_q(f).2•[X]` in the native `A_q-module B/(A_q·1)`, where `M_q` is the existing specified normalization
  coefficient pair. k is any field; `A_q` acts by restriction. Uses §2.26, `Submodule.Quotient.mk_add`,
  `Submodule.Quotient.mk_smul`, `Submodule.Quotient.mk_eq_zero`. Apply the existing reconstruction of f by 1
  and X. The native quotient kills 1 and respects sums and scalar multiplication.

- For monic quadratic q, `a∈A_q` and f∈B,
  `a•[f]=ρ_q(a)•[f]` in `B/(A_q·1)`, where `ρ_q` is the existing native scalar-remainder k-algebra homomorphism. k
  is any field; `A_q` acts by restriction. Uses §2.26, §2.39, `Submodule.Quotient.eq`,
  `Submodule.Quotient.mk_smul`, `Subalgebra.smul_def`. Write the actual ambient a=C(c)+qh using membership.
  The existing residue normal-form API gives `ρ_q(a)=c`. The two polynomial products differ by `qhf∈A_q`, so
  native quotient equality proves the result.

- For monic quadratic q, [X]≠0 in `B/(A_q·1)`. k is
  any field; `A_q` acts by restriction. Uses §2.39, §2.26, §2.32, `Submodule.Quotient.mk_eq_zero`. Vanishing
  would place X in `A_q`. The existing scalar-remainder lemma and linear remainder computation then equate X
  with a constant; coefficient 1 gives a contradiction.

- For monic quadratic q and `a∈A_q`, a annihilates
  `B/(A_q·1)` if and only if `ρ_q(a)=0`. k is any field; `A_q` acts by restriction. Uses §2.39,
  `Module.mem_annihilator`, `Submodule.Quotient.induction_on`. An annihilator element kills the nonzero root
  class. The actual residue scalar action and field scalar cancellation force residue zero. Conversely
  quotient induction and the scalar action show residue zero kills every class.

- For monic quadratic q, `Ann_Aq(B/(A_q·1))` equals the
  contraction of the actual polynomial ideal(q) along `A_q⊂B`. k is any field; `A_q` acts by restriction. Uses
  §2.39, §2.26, `Module.annihilator`. Combine annihilator membership with the existing residue-kernel API
  identifying `ker(ρ_q)` with the actual contraction of(q), then apply ideal extensionality.

- For monic quadratic q, the native k-dimension of `B/(A_q·1)`
  is exactly one. k is any field; `A_q` acts by restriction. Uses §2.39, `Submodule.Quotient.induction_on`,
  `finrank_eq_one_iff_of_nonzero'`. The class of X is nonzero. Quotient induction, the specified normalization
  coefficient reconstruction and actual residue scalar action express every class as a k-multiple of [X].
  Apply the pinned dimension-one characterization, which requires no assumed finite-dimensional instance.

- For every q, restriction to k of `A_q·1⊂B` equals the
  actual underlying k-submodule of the existing subalgebra `A_q⊂B`. k is any field; `A_q` acts by restriction.
  Uses §2.39, `Submodule.restrictScalars`, `Subalgebra.toSubmodule`. Apply extensionality to the
  normalization-image span criterion; restriction of scalars does not change membership.

- For every q and f∈B, the specified k-linear `B/A_q≃E/k`
  sends [f] to `[mk_q(f)]`. k is any field; `A_q` acts by restriction. Uses §2.39, `Submodule.quotEquivOfEq_mk`,
  `Submodule.Quotient.restrictScalarsEquiv_mk`, `Submodule.Quotient.restrictScalarsEquiv_symm_mk`. Apply
  native quotient transports and restriction-of-scalars maps on representatives; the middle comparison is the
  specified `ε_q`.

- For every q and f∈B, the inverse of the specified
  k-linear `B/A_q≃E/k` sends `[mk_q(f)]` to [f]. k is any field; `A_q` acts by restriction. Uses §2.39. Rewrite the
  forward representative formula and apply the native inverse law.

**Checks.**

- For every q and c∈k, `η_q(C(c))=0` in the actual residue quotient.

- For every q,h∈B, `η_q(qh)=0` in the actual residue quotient.

- For k=F₂ and q=X², `η_q(X)` is nonzero; the cokernel map is not the zero map.

- For every q and f∈B, `ε_q([f])=[mk_q(f)]` using the actual quotient representatives.

- For q=1 and every f∈B, `ε_q([f])=0`; the actual source quotient vanishes.

- For q=0 and every f∈B, `ε_q⁻¹([mk_q(f)])=[f]`; the comparison still holds without monicity or a quadratic
  degree.

- For k=F₃ and q=X²+X+1=(X−1)², the actual annihilator of `E/(A_q·1)` equals the contraction of(q); the double
  root does not invalidate this affine comparison.

- For every monic quadratic q, `a∈A_q` and z∈E, the actual `A_q` action on [z] equals multiplication by its scalar
  residue `ρ_q(a)`.

- For every monic quadratic q and f∈B, the actual subtype element `q∈A_q` kills [f] in `B/(A_q·1)`.

- For every monic quadratic q, the unit of `A_q` does not annihilate `B/(A_q·1)`.

- For k=F₂ and q=X², the actual k-dimension of `B/(A_q·1)` is one, without a separability hypothesis.

- For k=F₂ and q=X²+X+1, the actual k-dimension of `B/(A_q·1)` is one, without a rational conductor root.

- For k=F₂, q=X² and every f∈B, the specified k-linear `B/A_q≃E/k` sends [f] to `[mk_q(f)]` in the quotient by the
  actual constant k-submodule.

- For q=1 and every f∈B, the specified k-linear `B/A_q≃E/k` sends [f] to zero.

- For q=0 and every f∈B, the inverse of the specified k-linear `B/A_q≃E/k` sends `[mk_q(f)]` to [f].

- For every q, construct the specified k-linear equivalence `B/A_q≃E/k`, with quotients by the actual underlying
  k-submodules of `A_q` and the bottom k-subalgebra of E, by restricting `ε_q` and the two proved denominator
  equalities.

*Needs:* §2.26; `Submodule.mem_span_singleton`; `Subalgebra.smul_def`; `Algebra.mem_bot`; `AdjoinRoot.mk_C`;
`AdjoinRoot.algebraMap_eq`; `RingHom.toAlgebra`; `IsScalarTower.of_algebraMap_eq`; `AdjoinRoot.mk`;
`IsScalarTower.toAlgHom`; `Submodule.mkQ`; `Submodule.Quotient.mk_eq_zero`; `Submodule.mkQ_surjective`;
`AdjoinRoot.mk_surjective`; `Submodule.quotEquivOfEq`; `LinearMap.quotKerEquivOfSurjective`;
`Submodule.quotEquivOfEq_mk`; `LinearMap.quotKerEquivOfSurjective_apply_mk`; `Submodule.restrictScalars`;
`Subalgebra.toSubmodule`; `Submodule.Quotient.mk_add`; `Submodule.Quotient.mk_smul`; `Submodule.Quotient.eq`;
§2.32; `Module.mem_annihilator`; `Submodule.Quotient.induction_on`; `Module.annihilator`;
`finrank_eq_one_iff_of_nonzero'`; `LinearEquiv.annihilator_eq`; `LinearMapClass.map_smul_of_tower`;
`Submodule.Quotient.restrictScalarsEquiv`; `LinearEquiv.restrictScalars`.

### 2.40 quadratic pinching cubic

Define the curve as the native equation with coefficients (a,−b,0,0,0). Its
homogeneous cubic is Y²Z+aXYZ+bX²Z−X³=0. On Y≠0, with u=X/Y and z=Z/Y, its ring is k[u,z]/((1+au+bu²)z−u³).
Prove this is k[u,1/(1+au+bu²)] using the relation and the constant term one. The polynomial identities and
reciprocal-chart maps are also valid over an arbitrary commutative coefficient ring.

R is an arbitrary commutative ring, with its actual polynomial, quotient and localization algebra structures;
a,b∈R. No domain, reducedness, nontriviality, separability, perfectness or characteristic assumption is
imposed.

Use the existing native WeierstrassCurve carrier and its projective Equation; no new projective scheme or
smoothness predicate is defined.

Define the Weierstrass curve W(a,b) by the five-coefficient
formula specified for the curve. It records equation data before any scheme
comparison. It also has the parametrization sending t to (q(t),tq(t)) and the affine point count of the
origin separately from parameters with q(t)≠0. Checks: q=t² gives a cusp; q=t²−1 in characteristic unequal to
two gives a split node; q=t²+t+1 over F₂ gives a nonsplit node and count four. All have Δ=0, so none may be
packaged as a smooth elliptic curve.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, printed pp9–11, especially the one-component
conductor diagram p10.)

Standing hypotheses for the maps and laws below: The nonzero-coordinate theorem additionally assumes T≠0 or
U≠0. Native Nonsingular is only used over a field, where its derivative criterion has its intended geometric
interpretation.

The construction needs the following maps and laws.

- For every u,z∈R, the actual native projective Equation of
  `W_(a,b)` at [u:1:z] holds if and only if z(1+au+bu²)=u³. Uses §2.40,
  `WeierstrassCurve.Projective.equation_iff`. Expand the native projective equation and normalize the
  commutative-ring identity. This identifies the equation on the Y≠0 chart; comparison with the actual scheme
  Proj remains required.

- For all T,U∈R, the actual native Weierstrass
  projective Equation of `W_(a,b)` holds at `n_(a,b)(T,U)`. Uses §2.40,
  `WeierstrassCurve.Projective.equation_iff`. Expand the native equation at the specified homogeneous
  coordinate tuple and normalize the polynomial identity.

- For every field k and a,b∈k, the native Weierstrass
  projective Nonsingular condition holds at [0:1:0], because the Z partial derivative equals one. This
  includes characteristic two and the singular finite cusp. k is an arbitrary field and a,b∈k; no
  separability, perfectness or characteristic assumption. Uses §2.40,
  `WeierstrassCurve.Projective.nonsingular_iff`. Use the actual native projective Equation and
  partial-derivative criterion. Its geometric smoothness comparison belongs to the existing scheme suppliers.

- Q∞(u)(1−au+(a²−b)u²)=1+u³((a³−2ab)+b(a²−b)u). Uses §2.40. Expand the
  two polynomials over an arbitrary commutative ring. The integer 2 is a ring numeral, never an invertible
  element.

- The actual R[u]-coefficient image of Q∞ in Chart(a,b) is
  a unit; no further localization of the chart is required. Uses §2.40. Supply the explicit inverse D∞ to the
  native unit constructor.

- For its actual coefficient R[u]-algebra structure, Chart(a,b)
  satisfies the native IsLocalization.Away(Q∞) property. Uses §2.40,
  `IsLocalization.isLocalization_of_algEquiv`. Transport the existing native localization instance along the
  specified coefficient-algebra equivalence.

- Q∞(u)=1+au+bu² is an actual polynomial over R, the reciprocal
  u²q(1/u) of the existing monic q(t)=t²+at+b. Give the polynomial with its constant coefficient equal to one,
  without choosing roots or dividing by two.

- Chart(a,b) abbreviates the actual native AdjoinRoot of the specified
  polynomial relation with its native R[u]-algebra structure.

- In Chart(a,b), the coefficient image of Q∞ times the native
  quotient root Z equals the coefficient image of u³. Uses §2.40, `AdjoinRoot.eval₂_root`. Specialize
  AdjoinRoot.eval₂_root to the displayed linear polynomial, then use sub_eq_zero.

- The coordinate relation `L_(a,b)(Z)=Q∞(u)Z−u³` lies in R[u][Z].
  Chart(a,b) is the native AdjoinRoot of this polynomial, an actual quotient of R[u][Z] by `(L_(a,b))`. Its
  R[u]-algebra structure is the native quotient coefficient map. Uses §2.40, `AdjoinRoot`. Reuse native
  AdjoinRoot; the type abbreviation Chart is an API alias, not an arbitrary ring with an assumed relation.

- In the actual quotient Chart(a,b), Q∞·D∞=1. Uses §2.40.
  Substitute Q∞Z=u³ and transport the Bézout identity through the coefficient map.

- The specified inverse algebra homomorphism sends the
  native localization element Q∞⁻¹ to D∞. Uses §2.40. Transport Q∞·Q∞⁻¹=1 through the inverse map. Multiply
  the two inverse identities in the commutative quotient ring to identify their inverse elements, without a
  domain assumption.

- The inverse of the specified chart equivalence sends the
  native localization inverse of Q∞ to D∞. Uses §2.40. Its underlying inverse homomorphism is the previously
  specified native localization lift.

- In Chart(a,b), define D∞ as the coefficient image of
  1−au+(a²−b)u² minus Z times the coefficient image of (a³−2ab)+b(a²−b)u. Uses §2.40. Specify the actual
  quotient element using native algebra maps and the native root.

- The specified forward map sends the actual native
  quotient root Z to the coefficient image of u³ times the native localization inverse of Q∞. Uses §2.40.
  Apply the native root computation for AdjoinRoot.liftAlgHom.

- The specified forward map composed with the specified inverse map is
  the identity R[u]-algebra homomorphism on Localization.Away(Q∞). Uses §2.40, `IsLocalization.algHom_ext`.
  Use native localization algebra homomorphism extensionality on the coefficient map.

- For every f∈R[u], the specified chart equivalence sends its
  actual quotient coefficient image to f/1 in Localization.Away(Q∞). Uses §2.40. Use the coefficient
  commutation law of the native algebra equivalence.

- Construct the specified R[u]-algebra map
  Chart(a,b)→Localization.Away(Q∞), sending Z to u³/Q∞ and every coefficient polynomial f to f/1. Uses §2.40,
  `AdjoinRoot.liftAlgHom`, `IsLocalization.Away.mul_invSelf`. Use native AdjoinRoot.liftAlgHom. Verify the
  actual linear quotient relation with the native localization inverse identity.

- The specified inverse map composed with the specified forward map is
  the identity R[u]-algebra homomorphism on Chart(a,b). Uses §2.40, `AdjoinRoot.algHom_ext`. Use native
  AdjoinRoot algebra extensionality. The image of Q∞⁻¹ multiplies Q∞ to one; combine this with Q∞Z=u³ to
  recover Z.

- For every f∈R[u], the inverse of the specified chart
  equivalence sends f/1 to the actual quotient coefficient image of f. Uses §2.40. Use the native inverse
  algebra equivalence coefficient commutation law.

- Construct the specified R[u]-algebra map
  Localization.Away(Q∞)→Chart(a,b) using the native coefficient map and the proved unit Q∞. Uses §2.40,
  `IsLocalization.Away.liftAlgHom`. Apply the native localization algebra universal property to the actual
  quotient coefficient homomorphism.

- The specified chart equivalence sends the actual root Z to u³/Q∞.
  Uses §2.40. The forward algebra homomorphism is definitionally the previously specified quotient lift.

- The actual Spec morphism induced by R[u]→Chart(a,b) is an
  open immersion into Spec R[u]. It identifies this quotient chart with the principal open D(Q∞) through its
  specified localization equivalence. Uses §2.40, `AlgebraicGeometry.IsOpenImmersion.of_isLocalization`. Apply
  the existing native open-immersion theorem for any algebra which is a localization away from the specified
  element. This is a statement about the affine chart and does not glue the projective curve.

- The specified inverse homomorphisms give the actual R[u]-algebra
  equivalence Chart(a,b)≃Localization.Away(Q∞). This equivalence is over the coefficient algebra R[u], not
  merely an abstract ring equivalence. Uses §2.40, `AlgEquiv.ofAlgHom`. Package the two actual maps and both
  composite identities using native AlgEquiv.ofAlgHom.

- For every r∈R, `n_(a,b)(rT,rU)=r³·n_(a,b)(T,U)`,
  using the native scalar action on the coordinate tuple. Uses §2.40. Compare all three coordinates and
  normalize the commutative-ring identities.

- Over any field k, if T≠0 or U≠0 then `n_(a,b)(T,U)` is
  not the zero tuple. No separability, perfectness or characteristic restriction is used. k is an arbitrary
  field and a,b∈k; no separability, perfectness or characteristic assumption. Uses §2.40. If the tuple
  vanished, its last coordinate U³ would give U=0. The middle coordinate then gives T³=0, hence T=0,
  contradicting the input.

- For `q_h(T,U)=T²+aTU+bU²`, construct the actual
  coordinate triple `n_(a,b)(T,U)=[Uq_h:Tq_h:U³]`. It is a homogeneous cubic triple, with finite-chart
  coordinates [q(t):tq(t):1] and infinity [0:1:0]. Uses §2.40. Give the actual Fin 3→R tuple. Scheme-morphism
  construction is a separate consumer comparison.

**Checks.**

- For all a,b over R, the actual projective equation holds at [0:0:1].

- For all a,b,t over R, the actual projective equation holds at [t²+at+b:t(t²+at+b):1].

- Over Z/2, the native projective Nonsingular condition holds at [0:1:0] for every a,b.

- For all a,b over R, the coefficient of u⁰ in Q∞ is one.

- Over every R, Q∞ for a=b=0 is the constant polynomial one.

- For every ring homomorphism f:R→S, map(f,Q∞(a,b))=Q∞(f(a),f(b)).

- Over F₂, Q∞(1,0)=1+u.

- Over F₂, Q∞(0,1)=(1+u)² and is not one.

- Over Z/4, Q∞(2,1)=1+2u+u², with nonzero nilpotent linear coefficient two.

- For all a,b over R, the coefficient of Z¹ in `L_(a,b)` is Q∞.

- For all a,b over R, the coefficient of Z⁰ in `L_(a,b)` is −u³.

- For a=b=0 over every R, the actual relation is Z−u³.

- For a=b=0 over every R, D∞ in the actual quotient is one.

- Over Z/4 with a=2,b=0, the actual chart identity (1+2u)D∞=1 holds.

- Over Z/2 with a=0,b=1, the actual chart identity (1+u²)D∞=1 holds.

- For every f∈R[u], the actual forward homomorphism sends its quotient coefficient image to f/1.

- For every a,b over R, the actual forward homomorphism sends the native root to u³/Q∞.

- For a=b=0 over every R, the actual forward homomorphism sends the native root to the coefficient image of
  u³.

- For every f∈R[u], the actual inverse homomorphism sends f/1 to its quotient coefficient image.

- For every a,b over R, the actual inverse homomorphism sends the native Q∞⁻¹ to D∞.

- For a=b=0 over every R, the actual inverse homomorphism sends the native Q∞⁻¹ to one.

- The native forward algebra homomorphism of the specified equivalence equals the specified toLocalization
  map.

- The native inverse algebra homomorphism of the specified equivalence equals the specified from localization
  map.

- Applying the specified equivalence and its inverse to an actual coefficient image recovers that same
  coefficient image.

- `n_(a,b)(t,1)=[t²+at+b:t(t²+at+b):1]`.

- `n_(a,b)(1,0)=[0:1:0]`.

- Over Z/2, `n_(0,1)(1,0)` is not the zero tuple.

- The native WeierstrassCurve `W_(a,b)` has coefficients (a,−b,0,0,0), hence homogeneous equation
  Y²Z+aXYZ+bX²Z−X³=0. It is the homogeneous cubic attached to the existing affine quadratic pinching
  presentation.

*Needs:* `WeierstrassCurve`; §2.26.

### 2.41 reciprocal polynomial overlap

Construct the equivalence between R[t,1/(t(ct²+at+b))] and R[u,1/(u(bu²+au+c))]. Send t to u⁻¹
and u to t⁻¹ and verify the two defining denominator units. Allow arbitrary R,c,a,b and zero overlap rings;
use universal properties of localization rather than domain cancellation. The geometric quadratic construction
specializes c=1.

R is an arbitrary commutative ring. All localizations, quotient charts and algebra maps are the specified
native carriers. No domain, reducedness, nontriviality, monicity or characteristic hypothesis; the
normalization tuple specializes c=1.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, one-component conductor square and
Proposition3.2.)

The construction needs the following maps and laws.

- Specializing c=1 gives the existing monic expression X²+aX+b, with
  no hypothesis on a or b. R is an arbitrary commutative ring. Uses §2.41.

- Specializing the reversed polynomial Q(b,a,1) gives exactly the
  existing infinity denominator 1+aX+bX². R is an arbitrary commutative ring. Uses §2.41, §2.40.

- Evaluation of the coefficient polynomial at x is exactly cx²+ax+b.

- The coefficient polynomial Q(c,a,b)=cX²+aX+b over an arbitrary
  commutative ring. R is an arbitrary commutative ring.

- The polynomial coordinate t is a unit in the overlap ring, with
  the specified inverse v. R is an arbitrary commutative ring. Uses §2.41.

- The specified inverse coordinate v is a unit, with inverse t. R is
  an arbitrary commutative ring. Uses §2.41.

- The image of Q(c,a,b) is a unit in R[X,1/(XQ)]. R is an arbitrary
  commutative ring. Uses §2.41, `IsLocalization.Away.isUnit_of_dvd`.

- The actual native localization R[X,1/(XQ(c,a,b))], with its specified
  polynomial algebra map. R is an arbitrary commutative ring. Uses §2.41.

- The overlap coordinate is exactly the native polynomial
  algebra-map image of X.

- The product t·v equals one in the specified overlap ring,
  without cancellation or a domain hypothesis. R is an arbitrary commutative ring. Uses §2.41,
  `IsLocalization.Away.mul_invSelf`.

- The image t of X under the specified polynomial algebra map into
  R[X,1/(XQ)]. R is an arbitrary commutative ring. Uses §2.41.

- The inverse coordinate is exactly the polynomial image of
  Q multiplied by the native localization inverse of XQ.

- The specified inverse v=Q/(XQ) of t in the actual overlap
  localization. R is an arbitrary commutative ring. Uses §2.41.

- Evaluation of Q(c,a,b) at the inverse coordinate in the
  coefficient-reversed overlap equals v² times the polynomial image of Q(b,a,c). R is an arbitrary commutative
  ring. Uses §2.41.

- Evaluation of XQ(c,a,b) at the inverse coordinate in
  the coefficient-reversed overlap is a unit. R is an arbitrary commutative ring. Uses §2.41.

- The reciprocal map sends the image of every polynomial f to
  its evaluation at the target inverse coordinate. R is an arbitrary commutative ring. Uses §2.41,
  `IsLocalization.Away.lift_eq`.

- The reciprocal map sends the source polynomial coordinate to
  the target inverse coordinate. R is an arbitrary commutative ring. Uses §2.41.

- The reciprocal map sends the source inverse coordinate to the
  target polynomial coordinate. R is an arbitrary commutative ring. Uses §2.41.

- Composing the reciprocal map with its coefficient-reversed
  reciprocal gives the identity R-algebra homomorphism. R is an arbitrary commutative ring. Uses §2.41,
  `IsLocalization.algHom_ext`. Use native localization algebra-hom extensionality, then polynomial generator
  extensionality and the two coordinate image formulas.

- The specified R-algebra map from R[X,1/(XQ(c,a,b))] to
  R[X,1/(XQ(b,a,c))] induced by polynomial evaluation at the inverse coordinate. R is an arbitrary commutative
  ring. Uses §2.41, `IsLocalization.Away.liftAlgHom`.

- The reciprocal equivalence sends the source polynomial coordinate
  to the target inverse coordinate. R is an arbitrary commutative ring. Uses §2.41.

- The reciprocal equivalence sends the source inverse coordinate to
  the target polynomial coordinate. R is an arbitrary commutative ring. Uses §2.41.

- The reciprocal equivalence sends every polynomial image to
  evaluation at the target inverse coordinate. R is an arbitrary commutative ring. Uses §2.41.

- The inverse of the reciprocal equivalence is exactly the same
  construction with leading and constant coefficients exchanged. R is an arbitrary commutative ring. Uses
  §2.41.

- In R[t,1/(t(t²+at+b))], the actual homogeneous normalization
  tuple at (1,v) equals v³ times its tuple at (t,1), with coefficients transported by the actual R-algebra
  map. All three coordinates agree after this unit scaling. R is an arbitrary commutative ring. Uses §2.41,
  §2.40.

- The forward morphism of the affine overlap scheme isomorphism is
  exactly Spec of the specified reciprocal ring homomorphism. R is an arbitrary commutative ring. Uses §2.41.

- The inverse morphism of the affine overlap scheme isomorphism is
  exactly Spec of the coefficient-reversed reciprocal ring homomorphism. R is an arbitrary commutative ring.
  Uses §2.41.

- The composite of the specified forward and inverse affine scheme
  morphisms is the actual identity morphism. R is an arbitrary commutative ring. Uses §2.41.

- Applying the native contravariant Spec functor to the reciprocal ring
  equivalence gives an actual scheme isomorphism between the two affine overlap spectra. R is an arbitrary
  commutative ring. Uses §2.41, `AlgebraicGeometry.Scheme.Spec`, `RingEquiv.toCommRingCatIso`.

**Checks.**

- With all coefficients zero, the specified polynomial is zero.

- Over Z/4, evaluating Q(2,1,1) at 2 gives 3.

- Over the integers, Q(1,0,2) and Q(2,0,1) differ; the reversal is not a coefficientwise identity.

- When Q=0, the actual overlap localization has zero equal to one.

- The polynomial coordinate is a unit for coefficients (2,2,1) over Z/4.

- The actual image of X²+X+1 is a unit in its F₂ overlap localization.

- For the characteristic-two cusp q=X², the specified coordinate and reciprocal multiply to one.

- For coefficients (2,2,1) over Z/4, the specified coordinate and reciprocal multiply to one.

- Evaluation of X at the specified overlap coordinate agrees with the actual polynomial algebra map.

- The specified reciprocal is also a left inverse of the coordinate over every commutative ring.

- The inverse coordinate is a unit for the split polynomial X²−1 over the rationals.

- In the overlap localization over Z/1, the specified inverse coordinate equals one.

- The specified reciprocal homomorphism fixes every actual coefficient-ring image.

- The image of Q under the reciprocal map is precisely v²Q with reversed coefficients.

- Applying the reciprocal map twice, with coefficients reversed for the second map, recovers every element.

- For the characteristic-two cusp, the reciprocal equivalence sends the coordinate to the specified inverse in
  the reversed overlap.

- For X²+X+1 over F₂, the reciprocal equivalence sends the inverse coordinate to the coordinate.

- The reciprocal equivalence and its coefficient-reversed map recover each element for (2,2,1) over Z/4.

- For a=b=2 over Z/4, all three homogeneous normalization coordinates agree on the overlap after
  multiplication by the specified inverse coordinate cubed.

- The actual forward/inverse Spec morphisms compose to the identity for the characteristic-two cusp.

- The actual inverse/forward Spec morphisms compose to the identity for coefficients (2,2,1) over Z/4.

- The forward scheme morphism is exactly native Spec.map of the specified reciprocal homomorphism.

- The specified reciprocal maps give an R-algebra equivalence between the two coefficient-reversed polynomial
  overlap localizations.

*Needs:* `IsLocalization.Away.mul_invSelf`; `IsLocalization.Away.isUnit_of_dvd`;
`IsLocalization.Away.liftAlgHom`; `IsLocalization.Away.lift_eq`; `IsLocalization.algHom_ext`;
`AlgEquiv.ofAlgHom`.

### 2.42 finite-to-infinity chart comparison

For c=1 over a field, compose the pinch-away equivalence, reciprocal overlap equivalence and infinity-chart
localization comparison to construct the chart equivalence. Identify `A_q[1/(tq)]` with the
infinity chart localized at u. Prove D(u)=D(z) from (1+au+bu²)z=u³, with the actual principal-open maps.

k is a field; c,a,b∈k. The chart transition specializes c=1. No separability, perfectness, distinct-root or
characteristic restriction; the finite localization comparison allows the zero polynomial.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, one-component conductor square and
Proposition3.2.)

Standing hypotheses for the maps and laws below: All localizations, quotient charts and algebra maps are the
specified native carriers. No domain, reducedness, nontriviality, monicity or characteristic hypothesis; the
normalization tuple specializes c=1.

The construction needs the following maps and laws.

- The underlying polynomial of the finite overlap denominator
  is exactly XQ(c,a,b). k is a field; c,a,b∈k. The chart transition specializes c=1. Uses §2.41, §2.42.

- The specified finite overlap denominator belongs to
  the existing arbitrary-subring conductor of `A_Q` in k[X]. k is a field; c,a,b∈k. The chart transition
  specializes c=1. Uses §2.41, §2.42, §1.2, §2.26.

- The actual normalized polynomial overlap ring has the native
  Away-localization property at the image of the specified finite denominator under the pinch inclusion. k is
  a field; c,a,b∈k. The chart transition specializes c=1. Uses §2.41, §2.42.

- The specified element XQ(c,a,b) of the existing pinch subring
  `A_Q=k+Qk[X]`, with its actual membership witness. k is a field; c,a,b∈k. The chart transition specializes
  c=1. Uses §2.41, §2.26.

- The native localization map induced by `A_Q⊂k[X]`, after
  inverting the specified XQ in both rings, is bijective. k is a field; c,a,b∈k. The chart transition
  specializes c=1. Uses §2.41, §2.42, §1.2, §2.26. Apply the conductor away bijective
  (§1.2) to the actual arbitrary pinch subring and its subtype inclusion. The membership formula
  gives `XQ·h=Q·(Xh)∈A_Q` for every h∈k[X], hence XQ lies in the ambient conductor.
  No finite-module hypothesis or original inclusion surjectivity is required, including when Q=0.

- The finite overlap equivalence has exactly the native Away.map
  induced by the existing pinch inclusion as its underlying map. k is a field; c,a,b∈k. The chart transition
  specializes c=1. Uses §2.41, §2.42.

- The finite overlap equivalence sends the canonical image of
  every actual pinch element f to the canonical image of its underlying polynomial. k is a field; c,a,b∈k. The
  chart transition specializes c=1. Uses §2.41, §2.42, `IsLocalization.map_eq`.

- The inverse finite overlap equivalence recovers the
  canonical image of each pinch element from the corresponding polynomial image. k is a field; c,a,b∈k. The
  chart transition specializes c=1. Uses §2.41, §2.42.

- The specified localized pinch inclusion gives a ring equivalence
  `A_Q[1/(XQ)]≃k[X,1/(XQ)]`, for arbitrary coefficients, including Q=0. k is a field; c,a,b∈k. The chart
  transition specializes c=1. Uses §2.41, §2.42.

- The iterated infinity-chart localization is a native
  R[u]-localization away from uQ(b,a,1), using the existing chart localization away from Q∞ and the pinned
  iterated-localization theorem. R is an arbitrary commutative ring. Uses §2.41, §2.42, §2.40,
  `IsLocalization.Away.mul`.

- The principal open D(z) equals D(u) in the actual prime
  spectrum of the existing infinity quotient chart, including nonreduced coefficient rings. R is an arbitrary
  commutative ring. Uses §2.40, `PrimeSpectrum.basicOpen_mul`, `PrimeSpectrum.basicOpen_pow`,
  `PrimeSpectrum.basicOpen_one`. The explicit inverse of Q∞ gives D(Q∞)=top. Apply basicOpen to Q∞z=u³, then
  native basicOpen multiplication and positive-power identities.

- The image of the infinity chart polynomial
  coordinate is a unit in its actual coordinate localization. R is an arbitrary commutative ring. Uses §2.42.

- The actual native localization of the existing infinity quotient
  chart at its polynomial coordinate u. R is an arbitrary commutative ring. Uses §2.40.

- The infinity overlap equivalence preserves the canonical
  image of every coefficient polynomial in R[u]. R is an arbitrary commutative ring. Uses §2.41, §2.42.

- The inverse infinity overlap equivalence preserves
  the canonical image of every coefficient polynomial in R[u]. R is an arbitrary commutative ring. Uses §2.41,
  §2.42.

- The inverse infinity overlap equivalence recovers every
  element after application of the forward equivalence. R is an arbitrary commutative ring. Uses §2.42.

- The native uniqueness equivalence identifies the infinity-chart
  coordinate localization with R[u,1/(uQ∞)] as R[u]-algebras. R is an arbitrary commutative ring. Uses §2.41,
  §2.42, `IsLocalization.algEquiv`.

- For every ring homomorphism from the actual infinity
  quotient chart into any commutative ring S, the image of its root z is a unit if and only if the image of
  its polynomial coordinate u is a unit. R is an arbitrary commutative ring. Uses §2.40, `isUnit_pow_iff`.

- On any finite pinch element f, the actual chart transition
  is inverse infinity-localization comparison applied to f evaluated at the reciprocal coordinate. k is a
  field; c,a,b∈k. The chart transition specializes c=1. Uses §2.41, §2.42.

- The inverse of the specified chart transition recovers every
  element of the finite pinch overlap. k is a field; c,a,b∈k. The chart transition specializes c=1. Uses
  §2.42.

- The specified chart transition recovers every element
  of the infinity overlap after its inverse. k is a field; c,a,b∈k. The chart transition specializes c=1. Uses
  §2.42.

- Evaluation of the coefficient polynomial at x is exactly cx²+ax+b.
  R is an arbitrary commutative ring. Uses §2.41, `Polynomial.aeval_X`, `Polynomial.aeval_C`.

- The overlap coordinate is exactly the native polynomial
  algebra-map image of X. R is an arbitrary commutative ring. Uses §2.41.

- The inverse coordinate is exactly the polynomial image of
  Q multiplied by the native localization inverse of XQ. R is an arbitrary commutative ring. Uses §2.41.

**Checks.**

- For q=X² over F₂, the underlying finite overlap denominator is X³.

- For q=X²−1 over the rationals, the underlying finite overlap denominator is X³−X.

- For q=0 over the rationals, the underlying finite overlap denominator is zero.

- At c=a=b=0 over ℚ, `A_Q=ℚ` and ℚ[t] is not finite as an `A_Q`-module. Inverting the zero denominator gives
  zero rings on both sides, and the specified localization map is their unique ring isomorphism.

- For the characteristic-two cusp, the finite overlap equivalence sends its denominator image to the
  polynomial image of X³.

- For X²+X+1 over F₂, the inverse finite overlap equivalence recovers the actual image of every pinch element.

- The forward/inverse finite overlap maps recover every element even for the zero polynomial over the
  rationals.

- For the characteristic-two cusp infinity chart, D(z)=D(u) in its actual prime spectrum.

- For the infinity chart with a=2,b=1 over Z/4 and every receiving commutative ring, z maps to a unit exactly
  when u does.

- For the infinity chart a=b=1 over F₂, the coordinate becomes a unit in the specified open ring.

- The infinity overlap equivalence preserves the actual polynomial image of X²+a.

- The inverse infinity overlap equivalence sends the normalized polynomial coordinate to its actual
  iterated-localization image.

- The forward/inverse infinity overlap maps recover every element for a=2,b=1 over Z/4.

- The chart transition and its inverse recover every finite overlap element for the characteristic-two cusp.

- The chart transition recovers every infinity overlap element after its inverse for q=X²+X+1 over F₂.

- For q=X²−1 over the rationals, the actual chart transition on each pinch element agrees with reciprocal
  polynomial evaluation and the inverse infinity comparison.

- For q=t²+at+b over a field, the finite pinch localization `A_q[1/(tq)]` is identified by the specified
  composite ring equivalence with the actual infinity-chart localization at u. The latter principal open
  equals D(z).

*Needs:* §2.41; §2.26; §1.2; `IsLocalization.map_eq`; §2.40; `IsLocalization.Away.mul`;
`IsLocalization.algEquiv`; `isUnit_pow_iff`; `PrimeSpectrum.basicOpen_mul`; `PrimeSpectrum.basicOpen_pow`;
`PrimeSpectrum.basicOpen_one`.

### 2.43 quadratic two-chart scheme

Glue `F=Spec A_q` and I=Spec k[u,z]/((1+au+bu²)z−u³) along the specified overlap Spec k[t,1/(tq)] to construct
the curve. Use native open-immersion scheme gluing and preserve both chart inclusions.
Compare the result with the native projective model of W(a,b) through its two
covering charts, proving projectivity and properness separately from affine algebra.

k is a field and a,b∈k; q=t²+at+b. There is no separability, perfectness, characteristic or distinct-root
assumption. All charts, overlaps, opens and maps use the specified native carriers.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, the one-component conductor square before
Proposition3.1.)

Standing hypotheses for the maps and laws below: Composition in displayed chart equalities is read from left
to right. C is the glued two-chart scheme and N its glued source; their Proj, projective-line and
normalization-universal-property comparisons remain separate obligations.

The construction needs the following maps and laws.

- The specified `j_F` equals the native Spec isomorphism induced by
  `A_q[1/(tq)]≃L` followed by the canonical principal-open immersion `Spec A_q[1/(tq)]→F`. k is a field and a,b∈k;
  q=t²+at+b. Uses §2.43, §2.42, §2.26, §2.41.

- The specified map `j_F:Spec L→Spec A_q` is an actual open
  immersion. k is a field and a,b∈k; q=t²+at+b. Uses §2.43,
  `AlgebraicGeometry.IsOpenImmersion.of_isLocalization`.

- The open image of `j_F` is exactly `D_A_q(tq)`. The element tq is
  viewed in `A_q`; no assertion that this is the whole finite chart is made. k is a field and a,b∈k; q=t²+at+b.
  Uses §2.43, §2.42, §2.26, §2.41, `AlgebraicGeometry.Scheme.Hom.opensRange_comp_of_isIso`,
  `AlgebraicGeometry.Scheme.Hom.opensRange_localizationAway`.

- The composite of `j_F` with the coefficient structure map F→Spec k
  is the canonical structure morphism Spec L→Spec k.

- Let q=t²+at+b over a field k, `A_q=k+qk[t]`, L=k[t,1/(tq)] and `F=Spec A_q`.
  Define `j_F:Spec L→F` by the native inclusion `A_q→k[t]→L`. This is the specified finite-chart overlap map, not
  an unspecified open with the same image. k is a field and a,b∈k; q=t²+at+b. Uses §2.41, §2.26.

- The specified `j_I:Spec L→I` is an actual open
  immersion. k is a field and a,b∈k; q=t²+at+b. Uses §2.43,
  `AlgebraicGeometry.IsOpenImmersion.of_isLocalization`.

- The open image of `j_I` is exactly `D_I(u)`, and therefore equals
  `D_I(z)` by the inherited principal-open comparison. k is a field and a,b∈k; q=t²+at+b. Uses §2.43, §2.40,
  `AlgebraicGeometry.Scheme.Hom.opensRange_comp_of_isIso`,
  `AlgebraicGeometry.Scheme.Hom.opensRange_localizationAway`.

- The actual infinity overlap map `j_I` is exactly Spec(θ).

- The composite of `j_I` with the coefficient structure map I→Spec
  k is the same canonical structure morphism Spec L→Spec k.

- Let I=Spec Chart(a,b), where Chart(a,b)=k[u][z]/((1+au+bu²)z−u³).
  Define `j_I:Spec L→I` by the Spec maps of the specified coefficient-reversal equivalence L≃k[u,1/(uQ∞)], the
  inverse infinity-localization comparison, and the canonical localization at u. Thus it uses the specified
  reciprocal transition. k is a field and a,b∈k; q=t²+at+b. Uses §2.41, §2.40, §2.42.

- The specified canonical finite-chart inclusion F→C.

- The specified canonical infinity-chart inclusion I→C.

- The canonical map `i_F:F→C(a,b)` is an actual open immersion.
  k is a field and a,b∈k; q=t²+at+b. Uses §2.43, `AlgebraicGeometry.Scheme.IsLocallyDirected.openCover`.

- The canonical map `i_I:I→C(a,b)` is an actual open
  immersion. k is a field and a,b∈k; q=t²+at+b. Uses §2.43,
  `AlgebraicGeometry.Scheme.IsLocallyDirected.openCover`.

- The equality `j_F∘i_F=j_I∘i_I` holds as native Scheme morphisms from
  Spec L to C, with composition read from left to right. k is a field and a,b∈k; q=t²+at+b. Uses §2.43,
  `CategoryTheory.Limits.pushout.condition`.

- For every scheme Y and morphisms f,g:C→Y, equality after
  precomposition with `i_F` and with `i_I` implies f=g. k is a field and a,b∈k; q=t²+at+b. Uses §2.43,
  `CategoryTheory.Limits.pushout.hom_ext`.

- Every point of the actual scheme C lies in the image of `i_F` or of `i_I`.
  The statement concerns all scheme points, including non-rational points. k is a field and a,b∈k; q=t²+at+b.
  Uses §2.43, §2.26, §2.41, §2.40, `AlgebraicGeometry.Scheme.IsLocallyDirected.ι_jointly_surjective`. Use the
  existing jointly-surjective colimit theorem on the three-object span. A point from the overlap also comes
  from the finite chart; the other two objects are precisely the two charts.

- For x∈F and y∈I, `i_F(x)=i_I(y)` if and only if there is z∈Spec L
  with `j_F(z)=x` and `j_I(z)=y`. No extra chart points are identified. k is a field and a,b∈k; q=t²+at+b. Uses
  §2.26, §2.41, §2.40, §2.43, `AlgebraicGeometry.Scheme.IsLocallyDirected.ι_eq_ι_iff`. Use the existing
  common-chart criterion for the locally directed span. The only object admitting maps to both distinct chart
  objects is the overlap object; exhaust the three span objects and their actual hom types.

- The native Scheme square with `top j_I:Spec L→I`, left `j_F:Spec L→F`,
  right `i_I:I→C` and bottom `i_F:F→C` is a pullback. k is a field and a,b∈k; q=t²+at+b. Uses §2.43,
  `AlgebraicGeometry.IsOpenImmersion.isPullback`.

- As actual scheme opens, `i_F⁻¹(im i_I)=im j_F`. k is a field and
  a,b∈k; q=t²+at+b. Uses §2.43, §2.41.

- Precomposing desc(f,g) with `i_F` gives the specified map f. k is a
  field and a,b∈k; q=t²+at+b. Uses §2.26, §2.41, §2.40, §2.43, `CategoryTheory.Limits.pushout.inl_desc`.

- Precomposing desc(f,g) with `i_I` gives the specified map g. k is a
  field and a,b∈k; q=t²+at+b. Uses §2.26, §2.41, §2.40, §2.43, `CategoryTheory.Limits.pushout.inr_desc`.

- For any scheme Y, finite-chart map f:F→Y and infinity-chart map g:I→Y
  satisfying `j_F∘f=j_I∘g`, construct the unique morphism desc(f,g):C→Y with these specified restrictions. k is
  a field and a,b∈k; q=t²+at+b. Uses §2.26, §2.41, §2.40, §2.43, `CategoryTheory.Limits.pushout.desc`.

**Checks.**

- The overlap inclusion `j_F:Spec L→Spec A_q` for the cusp quadratic has exactly the principal-open image D(tq), not the whole
  finite chart.

- The overlap inclusion `j_F:Spec L→Spec A_q` for the nonsplit quadratic has exactly the principal-open image D(tq), not the
  whole finite chart.

- The overlap inclusion `j_F:Spec L→Spec A_q` for the split quadratic has exactly the principal-open image D(tq), not the whole
  finite chart.

- For the characteristic-two cusp, the infinity overlap is D(u).

- For the nonsplit F₂ quadratic, the infinity overlap is also D(z), using the actual root of its quotient
  relation.

- For the split rational quadratic, the infinity immersion is induced by the specified reciprocal ring
  homomorphism.

- The cusp chart morphisms agree on their actual overlap.

- Every point of the nonsplit F₂ two-chart scheme belongs to one of the two charts.

- On the split rational model, equality of a finite-chart point and an infinity-chart point is characterized
  by a point of the specified overlap.

- A descended morphism restricts to the specified finite-chart map.

- A descended morphism restricts to the specified infinity-chart map.

- Descending the two chart inclusions gives the identity of the glued scheme.

- Construct the actual native Scheme `C(a,b)=F ⨿_{Spec L} I` using the existing scheme pushout of `j_F` and `j_I`,
  both open immersions. Its canonical maps `i_F` and `i_I` are part of the output. This is the quadratic two-chart
  scheme; identification with the specified projective cubic is a separate comparison.

*Needs:* §2.41; §2.26; §2.42; `AlgebraicGeometry.IsOpenImmersion.of_isLocalization`;
`AlgebraicGeometry.Scheme.Hom.opensRange_comp_of_isIso`;
`AlgebraicGeometry.Scheme.Hom.opensRange_localizationAway`; §2.40; `CategoryTheory.Limits.pushout`;
`AlgebraicGeometry.Scheme.IsLocallyDirected.openCover`.

### 2.44 specified affine normalization chart

Define the normalization chart as the Spec map of the actual inclusion `A_q→k[t]`. Prove the
pullback on coefficients under ΓSpecIso, finiteness from the rank-two spanning family and the branch
evaluation equations. Its inverse on the complement recovers t=qt/q.

k is a field and a,b∈k; q=t²+at+b. There is no separability, perfectness, characteristic or distinct-root
assumption. All charts, overlaps, opens and maps use the specified native carriers.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, the one-component conductor square before
Proposition3.1.)

Standing hypotheses for the maps and laws below: Composition in displayed chart equalities is read from left
to right. C is the glued two-chart scheme and N its glued source; their Proj, projective-line and
normalization-universal-property comparisons remain separate obligations.

The construction needs the following maps and laws.

- The specified affine map `n_F` is finite for q=t²+at+b
  over every field. This follows from the inherited monic degree-two finite inclusion. k is a field and a,b∈k;
  q=t²+at+b. Uses §2.44, §2.26, §2.41, `Polynomial.leadingCoeff_quadratic`, `Polynomial.natDegree_quadratic`.

- The inverse image `n_F⁻¹(im j_F)` equals `im j_N` as actual
  opens of Spec k[t].

- The native Scheme composite `j_N∘n_F` equals `j_F`.

- The specified map `j_N` is an actual open
  immersion.

- The image of `j_N` is exactly `D_k[t](tq)`.

- Define `j_N:Spec L→Spec` k[t] as the actual Spec map of the
  canonical localization k[t]→L at tq. k is a field and a,b∈k; q=t²+at+b. Uses §2.41.

- The native equality `s_F∘ν=n_F∘i_F` holds. k is a field
  and a,b∈k; q=t²+at+b. Uses §2.45, §2.46, §2.44, §2.43, `CategoryTheory.Limits.pushout.inl_desc`.

- The native equality `s_I∘ν=i_I` holds; the chart map is
  the identity on I. k is a field and a,b∈k; q=t²+at+b. Uses §2.45, §2.46, §2.43,
  `CategoryTheory.Limits.pushout.inr_desc`.

**Checks.**

- For q=t² over any field, the actual normalization chart.appTop, transported through the native ΓSpecIso maps,
  sends the `A_q` elements q and tq to t² and t³ in k[t].

- For q=t²+t+1 over F₂, that same actual Spec pullback sends q and tq to t²+t+1 and t(t²+t+1); this fixes both
  generators rather than testing finiteness.

- For q=t(t−1) over Q, the distinct native evaluation points t=0 and t=1 have equal composites with
  normalization chart. Together with the nonsplit coordinate test and the retained overlap comparison tests
  this fixes the branch identification.

- For q=t², let U=D(q) in `Spec A_q` and V=normalization chart⁻¹U. Restrict the native q and tq sections to U,
  then pull them back to V. The pulled-back q is a unit and its inverse times the pulled-back tq equals the
  restricted native polynomial section t. No hypothesis supplies this coordinate equality.

- The actual affine normalization map is finite for the cusp quadratic.

- The actual affine normalization map is finite for the nonsplit quadratic.

- The actual affine normalization map is finite for the split quadratic.

- For q=t² over F₂ the normalization overlap is D(t³).

- For the nonsplit F₂ model the inverse image of the finite overlap under affine normalization is exactly the
  normalization overlap.

- The split normalization overlap map followed by affine normalization agrees with the finite overlap map.

- Name `n_F:Spec k[t]→F` as the actual Spec map of the inclusion `A_q⊂k[t]`. This specializes the inherited affine
  normalization carrier to q=t²+at+b and introduces no new normalization construction.

*Needs:* §2.26; §2.41; `AlgebraicGeometry.Scheme.ΓSpecIso_naturality`.

### 2.45 glued quadratic normalization charts

Glue Spec k[t] and the same infinity chart through the reciprocal overlap to construct
the normalization source. Prove it is the actual native P¹ by comparing the finite chart
Spec k[t] and the reciprocal chart Spec k[u,1/(1+au+bu²)]. Their intersection is D(tq) in the finite chart;
their union is P¹, and all zeros of q are covered by Spec k[t].

k is a field and a,b∈k; q=t²+at+b. There is no separability, perfectness, characteristic or distinct-root
assumption. All charts, overlaps, opens and maps use the specified native carriers.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, the one-component conductor square before
Proposition3.1.)

Standing hypotheses for the maps and laws below: Composition in displayed chart equalities is read from left
to right. C is the glued two-chart scheme and N its glued source; their Proj, projective-line and
normalization-universal-property comparisons remain separate obligations.

The construction needs the following maps and laws.

- The specified map `j_N` is an actual open
  immersion. k is a field and a,b∈k; q=t²+at+b. Uses §2.44, §2.41,
  `AlgebraicGeometry.IsOpenImmersion.of_isLocalization`.

- The image of `j_N` is exactly `D_k[t](tq)`. k is a field and
  a,b∈k; q=t²+at+b. Uses §2.44, §2.41, `PrimeSpectrum.localization_away_comap_range`.

- The inverse image `n_F⁻¹(im j_F)` equals `im j_N` as actual
  opens of Spec k[t]. k is a field and a,b∈k; q=t²+at+b. Uses §2.44, §2.43, §2.45,
  `AlgebraicGeometry.SpecMap_preimage_basicOpen`.

- The native Scheme composite `j_N∘n_F` equals `j_F`. k is
  a field and a,b∈k; q=t²+at+b. Uses §2.44, §2.43.

- The specified canonical affine-line inclusion Spec k[t]→N.

- The specified canonical infinity-chart inclusion I→N.

- The canonical map `s_F:Spec k[t]→N` is an actual open
  immersion. k is a field and a,b∈k; q=t²+at+b. Uses §2.45, §2.44, §2.43,
  `AlgebraicGeometry.Scheme.IsLocallyDirected.openCover`.

- The canonical map `s_I:I→N` is an actual open
  immersion. k is a field and a,b∈k; q=t²+at+b. Uses §2.45, §2.44, §2.43,
  `AlgebraicGeometry.Scheme.IsLocallyDirected.openCover`.

- The equality `j_N∘s_F=j_I∘s_I` holds as native Scheme
  morphisms. k is a field and a,b∈k; q=t²+at+b. Uses §2.44, §2.45, §2.43,
  `CategoryTheory.Limits.pushout.condition`.

- For any scheme Y, two morphisms N→Y are equal if their
  precompositions with `s_F` and `s_I` are equal. k is a field and a,b∈k; q=t²+at+b. Uses §2.45,
  `CategoryTheory.Limits.pushout.hom_ext`.

- Every scheme point of N lies in the image of `s_F` or of `s_I`. k
  is a field and a,b∈k; q=t²+at+b. Uses §2.45, §2.40, §2.44, §2.43,
  `AlgebraicGeometry.Scheme.IsLocallyDirected.ι_jointly_surjective`.

**Checks.**

- Every point of the glued cusp normalization source belongs to its finite or infinity chart.

- For q=t², the cusp preimage t=0 belongs to Spec k[t] and lies outside the overlap D(t³).

- The nonsplit normalization chart inclusions agree after the specified overlap maps.

- The affine-line chart embeds as an actual open of the split normalization source.

- Construct `N(a,b)=Spec k[t] ⨿_{Spec L} I` from `j_N` and `j_I` by the existing open-immersion scheme pushout, with
  its canonical inclusions `s_F` and `s_I`. N is an actual scheme. Its identification with the native projective
  line and its normalization universal property are separate required comparisons.

*Needs:* §2.44; §2.41; `AlgebraicGeometry.IsOpenImmersion.of_isLocalization`;
`PrimeSpectrum.localization_away_comap_range`; §2.43; `AlgebraicGeometry.SpecMap_preimage_basicOpen`;
`CategoryTheory.Limits.pushout`; `AlgebraicGeometry.Scheme.IsLocallyDirected.openCover`.

### 2.46 global quadratic normalization-chart morphism

Glue the affine normalization map and the identity infinity chart to construct
the normalization map `ν:N→C`. Prove its actual chart equations, finiteness, birationality and
compatibility with the coefficient structure maps. This constructs a morphism before proving the
absolute-normalization universal comparison.

k is a field and a,b∈k; q=t²+at+b. There is no separability, perfectness, characteristic or distinct-root
assumption. All charts, overlaps, opens and maps use the specified native carriers.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, the one-component conductor square before
Proposition3.1; [Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3 conductor diagrams and
Proposition3.2.)

Standing hypotheses for the maps and laws below: Composition in displayed chart equalities is read from left
to right. C is the glued two-chart scheme and N its glued source; their Proj, projective-line and
normalization-universal-property comparisons remain separate obligations. C,N and ν are the previously
specified quadratic pinched scheme, glued source and finite morphism. No perfectness, separability,
characteristic or discriminant restriction is added. Affine-open, flatness and integral-factorization
hypotheses are retained exactly where stated.

The construction needs the following maps and laws.

- The native equality `s_F∘ν=n_F∘i_F` holds.

- The native equality `s_I∘ν=i_I` holds; the chart map is
  the identity on I.

- A morphism f:N→C with restrictions `n_F∘i_F` and `i_I` is equal to
  the specified ν. k is a field and a,b∈k; q=t²+at+b. Uses §2.45, §2.43, §2.44, §2.46.

- The actual scheme-open equality `ν⁻¹(im i_F)=im s_F`
  holds. k is a field and a,b∈k; q=t²+at+b. Uses §2.46, §2.43, §2.45, §2.44. Cover the source by its two
  actual charts. Points in its finite chart map into the target finite chart. A source infinity-chart point
  whose image is also in the finite chart comes from the specified overlap by the target intersection
  criterion; source compatibility places it in the source finite chart.

- The actual scheme-open equality `ν⁻¹(im i_I)=im s_I`
  holds. k is a field and a,b∈k; q=t²+at+b. Uses §2.46, §2.43, §2.45, §2.44. Cover the source by its two
  charts. For a finite-chart point mapping into the infinity chart, the target inverse-image equality places
  its affine image in the finite overlap. The affine normalization principal-open preimage identity then
  places the source point in the normalization overlap; source compatibility identifies it with an
  infinity-chart point.

- The native Scheme square with `top n_F`, left `s_F`,
  right `i_F` and bottom ν is a pullback. k is a field and a,b∈k; q=t²+at+b. Uses §2.44, §2.45, §2.43, §2.46,
  `AlgebraicGeometry.IsOpenImmersion.isPullback`.

- The native Scheme square with `top id_I`, left `s_I`,
  right `i_I` and bottom ν is a pullback. k is a field and a,b∈k; q=t²+at+b. Uses §2.40, §2.45, §2.43, §2.46,
  §2.44, `AlgebraicGeometry.IsOpenImmersion.isPullback`.

- The actual global morphism ν:N(a,b)→C(a,b) is finite over
  every field, including split, inseparable and characteristic-two quadratic cases. Its pullback to F is the
  finite affine inclusion `n_F`; its pullback to I is `id_I`. No projectivity or identification N≃P¹ is assumed.

- The composite `s_F∘ν∘(C→Spec k)` is the canonical
  coefficient structure morphism Spec k[t]→Spec k.

- The composite `s_I∘ν∘(C→Spec k)` is the canonical
  coefficient structure morphism I→Spec k.

- For every field k and a,b∈k, the
  specified glued finite morphism ν:N→C is scheme-theoretically dominant. k is an arbitrary field; a,b∈k. Uses
  §2.46, §2.49, `AlgebraicGeometry.IsSchemeTheoreticallyDominant.of_isDominant`. Use the established
  surjectivity to obtain dominance. The target C is integral, hence reduced. Apply the existing reduced-target
  dominance criterion.

- The kernel ideal sheaf of the specified morphism ν is zero. k
  is an arbitrary field; a,b∈k. Uses §2.46, `AlgebraicGeometry.Scheme.Hom.ker_eq_bot`. Apply the native kernel
  characterization of scheme-theoretical dominance.

- For every open U of C, the actual map
  Γ(C,U)→Γ(N,ν⁻¹U) induced by ν is injective. k is an arbitrary field; a,b∈k. Uses §2.46, §2.47,
  `AlgebraicGeometry.Scheme.Hom.app_injective`. Finiteness supplies quasi-compactness. Apply the existing
  all-open section injectivity theorem, rather than only checking affine rings.

- For any scheme T and flat
  morphism g:T→C, the specified pullback projection `N×_C T→T` is scheme-theoretically dominant. k is an
  arbitrary field; a,b∈k. Uses §2.46, §2.47, `AlgebraicGeometry.IsSchemeTheoreticallyDominant.pullbackSnd`.
  Use the native flat-pullback instance with the finite, hence quasi-compact, specified ν. Retain the flatness
  hypothesis.

- For any flat g:T→C, the kernel ideal sheaf of
  `N×_C T→T` is zero. k is an arbitrary field; a,b∈k. Uses §2.46, `AlgebraicGeometry.Scheme.Hom.ker_eq_bot`.
  Apply the native kernel projection to the previous pullback dominance result.

**Checks.**

- The global map of the two-chart characteristic-two cusp is finite.

- The global map of the nonsplit F₂ two-chart model is finite.

- Over the split rational quadratic, the identity on the infinity chart is the actual pullback of the global
  map.

- The map on all-open structure-sheaf sections of the cusp is injective, not just the finite chart ring
  inclusion.

- For an arbitrary flat g:T→C, the actual pullback projection has zero kernel ideal sheaf.

- Construct ν:N(a,b)→C(a,b) by gluing `n_F∘i_F` on the affine-line chart and `i_I` on the infinity chart. The
  overlap compatibility is the specified `j_N∘n_F=j_F`. This gives an actual global Scheme morphism before the
  Proj and projective-line identifications.

*Needs:* §2.45; §2.43; §2.44; `CategoryTheory.Limits.pushout.desc`.

### 2.47 quadratic two-chart structure morphism

Construct the structure map `C→Spec k` by descending the two actual coefficient maps. Prove
the reciprocal transition respects constants and the two chart structure maps are its restrictions. Identify
it with the projective cubic's structure map under the chart comparison.

k is a field and a,b∈k; q=t²+at+b. There is no separability, perfectness, characteristic or distinct-root
assumption. All charts, overlaps, opens and maps use the specified native carriers.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, the one-component conductor square before
Proposition3.1.)

Standing hypotheses for the maps and laws below: Composition in displayed chart equalities is read from left
to right. C is the glued two-chart scheme and N its glued source; their Proj, projective-line and
normalization-universal-property comparisons remain separate obligations.

The construction needs the following maps and laws.

- The native index type of the specified two-member open cover is
  Bool. k is a field and a,b∈k; q=t²+at+b. Uses §2.47.

- The false-index cover morphism is exactly `i_F`. k is a field and
  a,b∈k; q=t²+at+b. Uses §2.47, §2.43.

- The true-index cover morphism is exactly `i_I`. k is a field and
  a,b∈k; q=t²+at+b. Uses §2.47, §2.43.

- Construct the native two-member OpenCover of C, indexed by Bool, with
  false the finite chart and true the infinity chart, and maps `i_F` and `i_I`. Both objects are the actual affine
  schemes F and I. k is a field and a,b∈k; q=t²+at+b. Uses §2.43, §2.26, §2.41, §2.40,
  `AlgebraicGeometry.Scheme.Cover.mkOfCovers`.

- The actual global morphism ν:N(a,b)→C(a,b) is finite over
  every field, including split, inseparable and characteristic-two quadratic cases. Its pullback to F is the
  finite affine inclusion `n_F`; its pullback to I is `id_I`. No projectivity or identification N≃P¹ is assumed. k
  is a field and a,b∈k; q=t²+at+b. Uses §2.46, §2.47, §2.43, §2.44, `AlgebraicGeometry.IsFinite`,
  `AlgebraicGeometry.IsZariskiLocalAtTarget.of_openCover`, `CategoryTheory.IsPullback.isoPullback_inv_snd`,
  `AlgebraicGeometry.HasAffineProperty.affineAnd_iff`, `RingHom.finite_respectsIso`,
  `RingHom.finite_localizationPreserves`, `RingHom.finite_ofLocalizationSpan`. Use the actual two-member
  target open cover. Identify the pullback to its finite chart with `n_F` via the proved cartesian square and
  transport the inherited affine finiteness along its canonical pullback isomorphism.

- The composite of `j_F` with the coefficient structure map F→Spec k
  is the canonical structure morphism Spec L→Spec k. k is a field and a,b∈k; q=t²+at+b. Uses §2.43, §2.26,
  §2.41.

- The composite of `j_I` with the coefficient structure map I→Spec
  k is the same canonical structure morphism Spec L→Spec k. k is a field and a,b∈k; q=t²+at+b. Uses §2.43,
  §2.40, §2.41, §2.42.

- The structure morphism C→Spec k precomposed with `i_F` is the
  actual coefficient structure morphism F→Spec k. k is a field and a,b∈k; q=t²+at+b. Uses §2.43, §2.47, §2.26,
  §2.41.

- The structure morphism C→Spec k precomposed with `i_I` is the
  actual coefficient structure morphism I→Spec k. k is a field and a,b∈k; q=t²+at+b. Uses §2.43, §2.47, §2.40.

- For every scheme Y and morphisms f,g:C→Y, equality after
  precomposition with `i_F` and with `i_I` implies f=g.

- The composite `s_F∘ν∘(C→Spec k)` is the canonical
  coefficient structure morphism Spec k[t]→Spec k. k is a field and a,b∈k; q=t²+at+b. Uses §2.45, §2.46,
  §2.47, §2.44.

- The composite `s_I∘ν∘(C→Spec k)` is the canonical
  coefficient structure morphism I→Spec k. k is a field and a,b∈k; q=t²+at+b. Uses §2.45, §2.46, §2.47, §2.40,
  §2.44.

**Checks.**

- On the overlap D(t)⊂F and D(u)⊂I the two chart structure maps agree because the reciprocal transition
  u=1/t, z=1/(tq) is a k-algebra map; for k=F₄ a transition twisted by the Frobenius a↦a² of the coefficients
  is not k-linear, the two composites to Spec k differ on the overlap, and no structure map descends.

- For q=t² (a=b=0, the cusp) the glued structure map agrees with that of the projective cuspidal cubic
  Y²Z=X³ under the chart comparison, and for q=t²+t+1 over F₂ it is the unique morphism to Spec F₂; the
  agreement of the two restrictions is a condition on the overlap and not on the charts separately.

- The actual two-member cover is jointly surjective on the nonsplit F₂ model.

- The glued structure map restricts to the actual coefficient structure morphism on the finite chart.

- The glued structure map restricts to the actual coefficient structure morphism on the infinity chart.

- The finite chart of the cusp normalization preserves the specified F₂ coefficient structure map.

- Construct C(a,b)→Spec k by descending the actual coefficient structure morphisms on F and I. Their overlap
  equality is proved for the specified transition.

*Needs:* §2.43; §2.26; §2.41; §2.40; `AlgebraicGeometry.Scheme.Cover.mkOfCovers`; §2.46; §2.44;
`AlgebraicGeometry.IsFinite`; `AlgebraicGeometry.IsZariskiLocalAtTarget.of_openCover`;
`CategoryTheory.IsPullback.isoPullback_inv_snd`; `AlgebraicGeometry.HasAffineProperty.affineAnd_iff`;
`RingHom.finite_respectsIso`; `RingHom.finite_localizationPreserves`; `RingHom.finite_ofLocalizationSpan`;
§2.42.

### 2.48 specified reciprocal infinity ring map

Define the infinity transition by localizing the infinity chart at u and applying the
reciprocal comparison. Its coordinate formulas are u↦t⁻¹ and z↦(tq)⁻¹. Verify the ring relation, preservation
of constants, denominator units and commutation with both overlap embeddings.

k is a field and a,b∈k; q=t²+at+b. There is no separability, perfectness, characteristic or distinct-root
assumption. All charts, overlaps, opens and maps use the specified native carriers.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, the one-component conductor square before
Proposition3.1.)

Standing hypotheses for the maps and laws below: Composition in displayed chart equalities is read from left
to right. C is the glued two-chart scheme and N its glued source; their Proj, projective-line and
normalization-universal-property comparisons remain separate obligations.

The construction needs the following maps and laws.

- The specified ring map θ sends the actual polynomial
  coordinate u of Chart(a,b) to the specified inverse variable t⁻¹ in L. k is a field and a,b∈k; q=t²+at+b.
  Uses §2.48, §2.40, §2.41, §2.42.

- For every r∈k the specified ring map θ sends the
  coefficient image of r in Chart(a,b) to its coefficient image in L. k is a field and a,b∈k; q=t²+at+b. Uses
  §2.48, §2.40, §2.41, §2.42.

- The specified ring map θ sends the native quotient root z
  to the specified localization inverse of tq in L. Thus z=1/(tq) is proved for the actual gluing map, not
  merely for projective coordinate tuples. k is a field and a,b∈k; q=t²+at+b. Uses §2.48, §2.40, §2.41, §2.42.
  Apply the specified ring map to Q∞z=u³. Reciprocal evaluation sends Q∞ to t⁻²q and u to t⁻¹. Multiplying the
  resulting relation by t³ proves (tq)θ(z)=1. Use t·t⁻¹=1 and the actual inverse of tq in the native
  localization to identify θ(z) with that specified inverse; do not infer the value from mere unit existence.

- The actual infinity overlap map `j_I` is exactly Spec(θ). k is a
  field and a,b∈k; q=t²+at+b. Uses §2.43, §2.48, §2.41, §2.42, §2.40.

**Checks.**

- For the cusp, the infinity coordinate maps to the inverse of t, not to t.

- For q=t²+t+1 over F₂ the infinity root maps to the specified inverse of tq.

- The split rational transition preserves each rational coefficient.

- Define θ:Chart(a,b)→L as the canonical localization at u followed by the specified infinity equivalence and
  reciprocal coefficient-reversal equivalence. It is a native ring homomorphism preserving k; θ(u)=t⁻¹ and
  θ(z)=(tq)⁻¹.

*Needs:* §2.40; §2.41; §2.42.

### 2.49 integrality of the glued curve

Prove the glued C is integral for every field k and a,b. Both chart rings are domains, the common nonempty
open is dense, and the chart cover gives reducedness and irreducibility. This includes the repeated-root cusp;
a nonzero discriminant is not needed for integrality of this pinched curve.

k is any field and a,b∈k; q=t²+at+b. `A_q=k+qk[t]`, I=k[u,z]/((bu²+au+1)z−u³), L=k[t,(tq)⁻¹], C and N are the
specified native charts and glued schemes. No separability, perfectness, nonzero discriminant or
characteristic restriction is assumed. Composition ≫ is read from left to right. This is a specialization to
the actual quadratic charts; general normalization and birational carriers remain imports.

The closure of the continuous image of the irreducible infinity chart is all C, proving irreducibility. Both
affine chart rings are domains, hence their schemes are reduced. Apply the existing open-cover reducedness
theorem and the native reduced-plus-irreducible criterion.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, one-component conductor square before
Proposition3.1.)

The construction needs the following maps and laws.

- The actual polynomial Q∞=bu²+au+1 is nonzero for every
  a,b∈k, including b=0 and characteristic two. k is any field and a,b∈k; q=t²+at+b. Composition ≫ is read from
  left to right. Uses §2.40. Evaluate its constant coefficient: it is 1, contradicting zero. This keeps the
  localization nontrivial even when the reciprocal polynomial drops degree.

- The actual native infinity quotient I=k[u,z]/((bu²+au+1)z−u³) is
  an integral domain. k is any field and a,b∈k; q=t²+at+b. Composition ≫ is read from left to right. Uses
  §2.40, §2.49, `IsLocalization.isDomain_of_le_nonZeroDivisors`. Use the existing coefficient-compatible
  localization I≃k[u,Q∞⁻¹] and the nonzero denominator. Apply the native domain localization theorem; no
  smoothness or root-splitting hypothesis is needed.

- The actual overlap L=k[t,(tq)⁻¹] is an integral domain and its
  affine spectrum is nonempty. k is any field and a,b∈k; q=t²+at+b. Composition ≫ is read from left to right.
  Uses §2.41, `IsLocalization.isDomain_of_le_nonZeroDivisors`. The quadratic q is monic of degree two; hence
  t·q is nonzero. Localize the polynomial domain at powers of this nonzero element.

- The specified map `n_F:Spec k[t]→Spec A_q` induced by
  the actual inclusion `A_q⊂k[t]` is surjective on scheme points. k is any field and a,b∈k; q=t²+at+b.
  Composition ≫ is read from left to right. Uses §2.44, `RingHom.IsIntegral.comap_surjective`,
  `AlgebraicGeometry.IsIntegralHom.SpecMap_iff`. Use finite implies integral for the specified Spec map, then
  apply integral lying-over to its injective subalgebra inclusion. This is surjectivity on all prime ideals,
  not only on rational points.

- The actual global morphism ν:N(a,b)→C(a,b) is surjective
  on scheme points. k is any field and a,b∈k; q=t²+at+b. Composition ≫ is read from left to right. Uses §2.49,
  §2.43, §2.44. Use the two target charts. Lift finite-chart points through `n_F` by lying-over and then through
  `s_F`; lift infinity-chart points through `s_I`, where ν is the identity chart map.

- The specified open immersion finite open:Spec `L→Spec A_q` has dense
  range. k is any field and a,b∈k; q=t²+at+b. Composition ≫ is read from left to right. Uses §2.43, §2.49,
  §2.26, `IsOpenMap.denseRange_of_isPreirreducibleSpace`. The subalgebra `A_q` of the polynomial domain is a
  domain. Its affine spectrum is irreducible; the overlap spectrum is nonempty. Apply the native density
  theorem for a nonempty open image.

- The actual inclusion `i_I:I→C` of the infinity affine chart has dense
  range. k is any field and a,b∈k; q=t²+at+b. Composition ≫ is read from left to right. Uses §2.49, §2.43,
  `Continuous.range_subset_closure_image_dense`. The overlap is dense in the finite chart. Continuity puts the
  whole finite-chart image in the closure of the image of the overlap. The gluing equation puts that image in
  `i_I(I)`; the two-chart cover then gives density in all of C.

**Checks.**

- For q=t²+t+1 over F₂, the actual global map is surjective on scheme points, including nonrational primes.

- For the characteristic-two repeated-root cusp q=t², both actual glued schemes C and N are integral.

- The specified two-chart native scheme C(a,b) satisfies AlgebraicGeometry.IsIntegral over every field k.

*Needs:* §2.40; `IsLocalization.isDomain_of_le_nonZeroDivisors`; §2.41; §2.44;
`RingHom.IsIntegral.comap_surjective`; `AlgebraicGeometry.IsIntegralHom.SpecMap_iff`; §2.43; §2.26;
`IsOpenMap.denseRange_of_isPreirreducibleSpace`; `Continuous.range_subset_closure_image_dense`;
`IrreducibleSpace.isIrreducible_univ`; `IsIrreducible.image`; `AlgebraicGeometry.IsReduced.of_openCover`;
`AlgebraicGeometry.IsIntegral`; `AlgebraicGeometry.isIntegral_of_irreducibleSpace_of_isReduced`.

### 2.50 integrality of the glued source

Prove the glued normalization source N is integral using its polynomial finite chart and localized reciprocal
chart. Verify their actual common open is nonempty and dense before applying the native open-cover criterion.

k is any field and a,b∈k; q=t²+at+b. `A_q=k+qk[t]`, I=k[u,z]/((bu²+au+1)z−u³), L=k[t,(tq)⁻¹], C and N are the
specified native charts and glued schemes. No separability, perfectness, nonzero discriminant or
characteristic restriction is assumed. Composition ≫ is read from left to right. This is a specialization to
the actual quadratic charts; general normalization and birational carriers remain imports.

The dense irreducible infinity image proves irreducibility. The polynomial chart and infinity chart are
reduced; glue reducedness using the literal two-chart open cover and invoke the native integral-scheme
criterion.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, one-component conductor square before
Proposition3.1.)

The construction needs the following maps and laws.

- The specified open immersion normalization open:Spec L→Spec
  k[t] has dense range. k is any field and a,b∈k; q=t²+at+b. Composition ≫ is read from left to right. Uses
  §2.44, §2.45, §2.49, `IsOpenMap.denseRange_of_isPreirreducibleSpace`. Use irreducibility of Spec k[t],
  nonemptiness of Spec L and the native density theorem for open immersions into an irreducible space.

- The actual inclusion `s_I:I→N` of the source infinity chart has
  dense range. k is any field and a,b∈k; q=t²+at+b. Composition ≫ is read from left to right. Uses §2.50,
  §2.45, `Continuous.range_subset_closure_image_dense`. Repeat the closure argument with the normalized finite
  chart Spec k[t] and its dense overlap. Use the actual source gluing equation and source chart cover.

- The actual infinity chart ring I(a,b) satisfies the
  native IsIntegrallyClosed predicate. k is any field and a,b∈k; q=t²+at+b. Composition ≫ is read from left to
  right. Uses §2.40, §2.49, `isIntegrallyClosed_of_isLocalization`. The polynomial ring k[u] is integrally
  closed. Its localization at powers of nonzero Q∞ is integrally closed by the pinned localization theorem;
  use the actual infinity chart localization instance.

- For every point x of the actual scheme N(a,b), its
  native structure-sheaf stalk `O_(N,x)` satisfies IsIntegrallyClosed. Together with source is integral this
  gives normal local domains without inventing a scheme-normality carrier. k is any field and a,b∈k;
  q=t²+at+b. Composition ≫ is read from left to right. Uses §2.49, §2.50, §2.45,
  `isIntegrallyClosed_of_isLocalization`, `IsIntegrallyClosed.of_equiv`, `AlgebraicGeometry.Spec.stalkIso`.
  Both chart rings are integrally closed domains. At each prime, apply localization preservation and the
  actual Spec.stalkIso. Cover the source point by one of the two charts and transport integral closedness
  through that open immersion’s stalk-map isomorphism.

**Checks.**

- For k=F₂(s) and q=t²−s, every actual source stalk is integrally closed; no separability hypothesis is used.
  The test instantiates this polynomial and does not assert a new proof of its irreducibility.

- The specified source N(a,b), obtained by gluing Spec k[t] and I along the actual overlap, satisfies
  AlgebraicGeometry.IsIntegral.

*Needs:* §2.44; §2.45; §2.49; `IsOpenMap.denseRange_of_isPreirreducibleSpace`;
`Continuous.range_subset_closure_image_dense`; `IrreducibleSpace.isIrreducible_univ`; `IsIrreducible.image`;
`AlgebraicGeometry.IsReduced.of_openCover`; `AlgebraicGeometry.IsIntegral`;
`AlgebraicGeometry.isIntegral_of_irreducibleSpace_of_isReduced`.

### 2.51 dense-open comparison of the specified map

Construct the normalization partial isomorphism from the two dense infinity-chart open ranges. The
isomorphism is the inverse source open-immersion comparison followed by the target comparison. Prove agreement
with normalization on this open; an arbitrary birational isomorphism would not fix the desired function-field
map.

k is any field and a,b∈k; q=t²+at+b. `A_q=k+qk[t]`, I=k[u,z]/((bu²+au+1)z−u³), L=k[t,(tq)⁻¹], C and N are the
specified native charts and glued schemes. No separability, perfectness, nonzero discriminant or
characteristic restriction is assumed. Composition ≫ is read from left to right. This is a specialization to
the actual quadratic charts; general normalization and birational carriers remain imports.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, one-component conductor square before
Proposition3.1.)

The construction needs the following maps and laws.

- The source open of normalization partial isomorphism(a,b) is
  exactly `im(s_I)`, as an equality of native opens of N. k is any field and a,b∈k; q=t²+at+b. Composition ≫ is
  read from left to right. Uses §2.51. Unfold only the specified construction and read its source projection.

- The target open of normalization partial isomorphism(a,b) is
  exactly `im(i_I)`, as an equality of native opens of C. k is any field and a,b∈k; q=t²+at+b. Composition ≫ is
  read from left to right. Uses §2.51. Unfold only the specified construction and read its target projection.

- For P=normalization partial isomorphism(a,b), the actual morphism
  equality P.iso.hom ≫ P.target.ι = P.source.ι ≫ ν holds. This identifies the dense-open isomorphism with the
  restriction of the specified global map. k is any field and a,b∈k; q=t²+at+b. Composition ≫ is read from
  left to right. Uses §2.51, §2.44, `AlgebraicGeometry.Scheme.Hom.isoOpensRange_hom_ι`,
  `AlgebraicGeometry.Scheme.Hom.isoOpensRange_inv_comp`. Use the two isoOpensRange factorization equations,
  then the source infinity restriction `s_I≫ν=i_I`. Reassociate to compare morphisms from the native source open
  into C.

- For P=normalization partial isomorphism(a,b), P.iso.inv ≫
  P.source.ι ≫ ν = P.target.ι. Thus the chosen inverse lands in the specified source open and is an inverse to
  the restricted global map. k is any field and a,b∈k; q=t²+at+b. Composition ≫ is read from left to right.
  Uses §2.51. Rewrite the forward comparison and cancel the actual inverse/hom pair of the native open-scheme
  isomorphism.

- The specified partial isomorphism is over Spec k for
  structure maps ν≫structureMap(a,b) on N and structureMap(a,b) on C, using native PartialIso.IsOver. k is any
  field and a,b∈k; q=t²+at+b. Composition ≫ is read from left to right. Uses §2.51, §2.47,
  `AlgebraicGeometry.Scheme.PartialIso.IsOver`. Postcompose the proved agreement with ν by the actual
  coefficient structure morphism and reassociate. No arbitrary algebraic-closed-field choice or replacement
  base is made.

- The native predicate Scheme.BirationalOver
  (ν≫structureMap(a,b)) (structureMap(a,b)) holds, witnessed by the specified normalization partial isomorphism. k is
  any field and a,b∈k; q=t²+at+b. Composition ≫ is read from left to right. Uses §2.51,
  `AlgebraicGeometry.Scheme.BirationalOver`. Package the actual partial isomorphism and its coefficient
  compatibility into the pinned BirationalOver predicate; do not add a generic birational-map type.

**Checks.**

- For q=t² over F₂ the specified partial isomorphism has source exactly `im(s_I)`, retaining the repeated-root
  case.

- For q=t²−1 over ℚ the specified partial isomorphism has target exactly `im(i_I)`.

- For q=t²+t+1 over F₂, P.iso.inv≫P.source.ι≫ν=P.target.ι on the actual target open; an unrelated partial
  isomorphism fails this map comparison.

- For every a,b over every field, the chosen partial isomorphism is over the actual maps N→C→Spec k and C→Spec
  k.

- Construct the actual Scheme.PartialIso from N(a,b) to C(a,b) with source `im(s_I)`, target `im(i_I)`, and
  isomorphism given by the inverse of the open-range isomorphism of s_I followed by the open-range isomorphism of i_I. The opens are proved dense and the maps
  are the specified infinity-chart embeddings.

*Needs:* §2.50; §2.49; §2.45; §2.43; `AlgebraicGeometry.Scheme.PartialIso`;
`AlgebraicGeometry.Scheme.Hom.isoOpensRange`.

### 2.52 rank two basis of a quadratic pinch

Construct the native basis of `A_q` over S=k[T], T↦q, by transporting the basis
of S×S through polynomial coordinates. Its ordered vectors are 1 and tq. Prove coefficient evaluation, basis
expansion and the quadratic multiplication relation, keeping the S-linear and k-linear structures distinct.

k is an arbitrary field; a,b∈k; q=t²+at+b; `A_q` is the existing scalar-remainder subalgebra k+qk[t]. S=k[T]
acts by T↦q. No separability, discriminant or characteristic restriction is imposed.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3 conductor diagrams and Proposition3.2.)

Standing hypotheses for the maps and laws below: S=k[T] acts through the existing parameter homomorphism
θ(P)=P(q), and `e:S×S≃ₗ[S]A_q` is the existing polynomial coordinates equivalence. No characteristic,
separability or discriminant restriction is imposed.

The construction needs the following maps and laws.

- For every P∈k[T], the ambient value of θ(P) equals P(q) in k[t]. k is an
  arbitrary field; a,b∈k; q=t²+at+b; `A_q` is the existing scalar-remainder subalgebra k+qk[t]. S=k[T] acts by
  T↦q. Uses §2.52, `Polynomial.aeval_subalgebra_coe`, `Polynomial.comp_eq_aeval`. Use aeval_subalgebra_coe and
  comp_eq_aeval for the actual q element.

- For every P∈S, θ(P) is exactly the image of (P,0) under the
  S-linear coordinates. k is an arbitrary field; a,b∈k; q=t²+at+b; `A_q` is the existing scalar-remainder
  subalgebra k+qk[t]. S=k[T] acts by T↦q. Uses §2.52. Compare ambient polynomial coercions using the two
  established formulas and subtype extensionality.

- The actual evaluation `θ:S→A_q` is injective, so S identifies with
  k[q] inside the existing pinched algebra. k is an arbitrary field; a,b∈k; q=t²+at+b; `A_q` is the existing
  scalar-remainder subalgebra k+qk[t]. S=k[T] acts by T↦q. Uses §2.52. Write both parameter images as
  coordinate images of (P,0); apply injectivity of the established equivalence, then project the first
  coordinate.

- Construct the actual k-algebra homomorphism `θ:k[T]→A_q` by θ(P)=P(q), using
  native polynomial evaluation at `q∈A_q`. The coefficient variable T and ambient normalization coordinate t
  have different images. k is an arbitrary field; a,b∈k; q=t²+at+b; `A_q` is the existing scalar-remainder
  subalgebra k+qk[t]. S=k[T] acts by T↦q. Uses §2.26, `Polynomial.aeval`. Evaluate at the existing element
  `q∈A_q`; its membership witnesses are scalar0 and multiplier1. Reuse native aeval and the actual subalgebra
  carrier.

- For P∈k[T] and `f∈A_q`, the ambient value of P·f is P(q)f. k is an arbitrary
  field; a,b∈k; q=t²+at+b; `A_q` is the existing scalar-remainder subalgebra k+qk[t]. S=k[T] acts by T↦q. Uses
  §2.52. Unfold the RingHom-induced action and use the parameter coercion formula.

- The actual θ-module `A_q` is native Module.Free `S A_q`. k is an
  arbitrary field; a,b∈k; q=t²+at+b; `A_q` is the existing scalar-remainder subalgebra k+qk[t]. S=k[T] acts by
  T↦q. Uses §2.52, `Module.Free.of_basis`. Apply `Module.Free.of_basis` to the constructed finite basis.

- The actual θ-module `A_q` is native Module.Finite `S A_q`, generated
  by1 and tq. k is an arbitrary field; a,b∈k; q=t²+at+b; `A_q` is the existing scalar-remainder subalgebra
  k+qk[t]. S=k[T] acts by T↦q. Uses §2.52, `Module.Finite.of_basis`. The Fin2-indexed basis is finite; apply
  `Module.Finite.of_basis`. This concerns the parameter algebra, not the normalization map.

- The actual θ-module `A_q` is native Module.Flat `S A_q`. This concerns
  `k[T]→A_q`, and gives no flatness statement for the distinct inclusion `A_q→k[t]`. k is an arbitrary field;
  a,b∈k; q=t²+at+b; `A_q` is the existing scalar-remainder subalgebra k+qk[t]. S=k[T] acts by T↦q. Uses §2.52,
  `Module.Flat.of_free`. Install the established free-module fact locally and reuse the native
  free-implies-flat instance.

- Give the existing commutative ring `A_q` the native Algebra k[T] structure
  induced by θ; its algebra map is θ and P·f=P(q)f. This introduces no new ring or module carrier. k is an
  arbitrary field; a,b∈k; q=t²+at+b; `A_q` is the existing scalar-remainder subalgebra k+qk[t]. S=k[T] acts by
  T↦q. Uses §2.52, `RingHom.toAlgebra`. Apply RingHom.toAlgebra to the specified θ. There is no preexisting
  k[T]-action on this carrier; the existing k-action is distinct.

- For every pair (P,Q), the ambient polynomial of the S-linear
  equivalence is P(q)+tqQ(q). k is an arbitrary field; a,b∈k; q=t²+at+b; `A_q` is the existing scalar-remainder
  subalgebra k+qk[t]. S=k[T] acts by T↦q. Uses §2.52, §2.33. The forward function is exactly the coordinates
  function. Reuse its coercion equation.

- For each actual `f∈A_q`, the inverse polynomial-module
  coordinates equal the existing k-linear inverse coordinates as a pair of polynomials. k is an arbitrary
  field; a,b∈k; q=t²+at+b; `A_q` is the existing scalar-remainder subalgebra k+qk[t]. S=k[T] acts by T↦q. Uses
  §2.52, §2.33. The S-linear upgrade preserves both underlying functions; the equality is definitional.

- For H,P,Q∈S, e(HP,HQ)=H·e(P,Q) in the actual pinched algebra. k
  is an arbitrary field; a,b∈k; q=t²+at+b; `A_q` is the existing scalar-remainder subalgebra k+qk[t]. S=k[T]
  acts by T↦q. Uses §2.52. Use the native S-linear equivalence scalar law.

- For every `f∈A_q` with inverse coordinates (P,Q),
  P·b0+Q·b1=f for the actual θ-action and the actual finite basis. k is an arbitrary field; a,b∈k; q=t²+at+b;
  `A_q` is the existing scalar-remainder subalgebra k+qk[t]. S=k[T] acts by T↦q. Uses §2.52, §2.33. Use the
  ambient scalar formula and the two basis vectors. The coordinates inverse law yields P(q)+tqQ(q)=f;
  commutativity identifies the two-term expression.

- Upgrade the existing k-linear equivalence `e:(k[T]×k[T])≃A_q` to a
  native S-linear equivalence, with ordinary componentwise S-action on its domain and the specified θ-action
  on its codomain. The forward function is (P,Q)↦P(q)+tqQ(q). k is an arbitrary field; a,b∈k; q=t²+at+b; `A_q`
  is the existing scalar-remainder subalgebra k+qk[t]. S=k[T] acts by T↦q. Uses §2.52, §2.33. Keep the
  existing bijection and additive law. Polynomial composition preserves multiplication; distributivity proves
  compatibility with the specified scalar action. No new normal-form theorem is assumed.

- The ambient polynomial of the index0 polynomial-module basis vector
  is1. k is an arbitrary field; a,b∈k; q=t²+at+b; `A_q` is the existing scalar-remainder subalgebra k+qk[t].
  S=k[T] acts by T↦q. Uses §2.52, `Module.Basis.finTwoProd_zero`. Evaluate the transported standard vector
  (1,0) by the coordinates formula.

- The ambient polynomial of the index1 polynomial-module basis vector is
  tq. k is an arbitrary field; a,b∈k; q=t²+at+b; `A_q` is the existing scalar-remainder subalgebra k+qk[t].
  S=k[T] acts by T↦q. Uses §2.52, `Module.Basis.finTwoProd_one`. Evaluate the transported standard vector
  (0,1).

- For `f∈A_q` with existing inverse coordinates (P,Q), the native finite
  basis representation has index0 coefficient P and index1 coefficient Q in S. k is an arbitrary field; a,b∈k;
  q=t²+at+b; `A_q` is the existing scalar-remainder subalgebra k+qk[t]. S=k[T] acts by T↦q. Uses §2.52,
  `Module.Basis.coe_finTwoProd_repr`. The transported basis representation is the inverse coordinates followed
  by the standard pair representation; evaluate its two indices.

- The native Module.finrank `S A_q` for the specified θ-action is2. k
  is an arbitrary field; a,b∈k; q=t²+at+b; `A_q` is the existing scalar-remainder subalgebra k+qk[t]. S=k[T]
  acts by T↦q. Uses §2.52, `Module.finrank_eq_card_basis`. Apply finrank_eq_card_basis and the cardinality of
  Fin2. The polynomial ring over a field satisfies strong rank condition.

- For all z,w∈S×S, e(z⋆w)=e(z)e(w) in the actual pinched algebra
  `A_q`. k is an arbitrary field; a,b∈k; q=t²+at+b; `A_q` is the actual subalgebra k+qk[t]. Uses §2.52. Compare
  both sides after the actual subalgebra inclusion. Composition respects polynomial addition, subtraction and
  multiplication; expansion of q=t²+at+b gives the equality.

- For all `f,g∈A_q`, e⁻¹(fg)=e⁻¹(f)⋆e⁻¹(g). k is an
  arbitrary field; a,b∈k; q=t²+at+b; `A_q` is the actual subalgebra k+qk[t]. Uses §2.52. Apply injectivity of e
  to the established multiplicative comparison and its two inverse laws.

- For every a,b and z∈S×S, (1,0)⋆z=z.

- Define the coefficient product z⋆w=(z₀w₀+(T³−bT²)z₁w₁, z₀w₁+z₁w₀−aTz₁w₁)
  on S×S. This is an explicit function furnishing the coordinates of multiplication in the existing ring `A_q`,
  not componentwise pair multiplication or a second ring carrier. k is an arbitrary field; a,b∈k; q=t²+at+b;
  `A_q` is the actual subalgebra k+qk[t]. Uses §2.52. Use the existing two-term reconstruction and the relation
  q=t²+at+b. The displayed function specifies the coefficient pair; its multiplicative comparison is a
  separate lemma.

- The actual first polynomial-module basis vector b0 equals 1 in
  `A_q`, not only after ambient coercion. k is an arbitrary field; a,b∈k; q=t²+at+b; `A_q` is the actual
  subalgebra k+qk[t]. Uses §2.52. Use subtype extensionality and the ambient equation for b0.

- In the actual S-algebra `A_q`, v²=θ(T³−bT²)−θ(aT)v, with v=b1=tq.
  Equivalently v²+aT·v+bT²−T³=0. The coefficients are evaluated at q, not at t. k is an arbitrary field;
  a,b∈k; q=t²+at+b; `A_q` is the actual subalgebra k+qk[t]. Uses §2.52. Compare ambient coercions, use θ(P)=P(q)
  and v=tq, and expand q=t²+at+b.

**Checks.**

- For all a,b, the actual θ(T) has ambient value t²+at+b.

- For q=t² over any field, the actual θ(T) is t².

- For q=t²+t+1 over F₂, the actual θ(T) is t²+t+1.

- For every P and actual `f∈A_q`, the ambient scalar action is P(q)f.

- For every P, the actual scalar P·1 equals θ(P) in `A_q`.

- For q=t² over any field, the ambient θ(T) differs from t; the scalar action cannot be evaluation at t.

- For every a,b and polynomial pair z, the actual S-linear coordinates inverse of e(z) is z.

- For q=t²+t+1 over F₂ and arbitrary P,Q, e(TP,TQ)=θ(T)e(P,Q), the specified scalar action.

- For q=t² over any field, e((0,1)²)=t³ differs from e(0,1)²=t⁶ with native componentwise pair multiplication.

- For all a,b, the ambient ordered polynomial-module basis vectors are1 and tq.

- For q=t² over any field, the second polynomial-module basis vector is t³ and the native module finrank over
  k[T] is2.

- For the actual finite basis, repr(b0)(0)=1, repr(b1)(0)=0 and repr(b1)(1)=1.

- For a=b=0 over any field, the actual coefficient product (0,1)⋆(0,1) is (T³,0); componentwise pair
  multiplication would instead give (0,1).

- For a=b=1 over F₂, the actual coefficient product (0,1)⋆(0,1) is (T³−T²,−T). Both quadratic coefficients
  survive in characteristic two.

- For every a,b and z∈S×S, (1,0)⋆z=z.

- Retain the specified scalar action and the actual carrier; the cusp and characteristic-two specializations
  obey the same statement.

*Needs:* §2.26; `Polynomial.aeval`; `RingHom.toAlgebra`; `Polynomial.aeval_subalgebra_coe`;
`Polynomial.comp_eq_aeval`; §2.33; `Module.Basis.finTwoProd`; `Module.Basis.map`.

### 2.53 algebra homomorphisms as quadratic roots

For an arbitrary commutative S-algebra B, construct the equivalence between S-algebra
homomorphisms `A_q→B` and roots y of y²=ι(T³−bT²)−ι(aT)y. Evaluation on the second basis vector is the forward
map; the inverse sends P(q)+tqQ(q) to ι(P)+yι(Q). Prove multiplication by the relation and prove both inverse
laws. B may be nonreduced or zero.

k is an arbitrary field; a,b∈k; q=t²+at+b; `A_q` is the actual subalgebra k+qk[t]. S=k[T] acts through the
existing parameter homomorphism θ(P)=P(q), and `e:S×S≃ₗ[S]A_q` is the existing polynomial coordinates
equivalence. No characteristic, separability or discriminant restriction is imposed. B is an arbitrary
commutative S-algebra, in an independent universe; B need not be a field, reduced or nonzero. Write ι:S→B for
its actual algebra map, R=T³−bT² and L=aT. Write v=b1=tq in `A_q`.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3 conductor diagrams and Proposition3.2.)

The construction needs the following maps and laws.

- For every y∈B and z∈S×S, `E_y(e(z))=ι(z₀)+ι(z₁)y`. k is an
  arbitrary field; a,b∈k; q=t²+at+b; `A_q` is the actual subalgebra k+qk[t]. B need not be a field, reduced or
  nonzero. Write ι:S→B for its actual algebra map, R=T³−bT² and L=aT. Write v=b1=tq in `A_q`. Uses §2.53. Use
  the inverse law of the existing coordinate equivalence.

- If y∈B satisfies y²=ι(T³−bT²)−ι(aT)y, then `E_y(fg)=E_y(f)E_y(g)`
  for all `f,g∈A_q`. k is an arbitrary field; a,b∈k; q=t²+at+b; `A_q` is the actual subalgebra k+qk[t]. B need not
  be a field, reduced or nonzero. Write ι:S→B for its actual algebra map, R=T³−bT² and L=aT. Write v=b1=tq in
  `A_q`. Uses §2.53, §2.52. Apply the inverse multiplication formula; the coefficient algebra map preserves ring
  operations. Subtract the product of the two evaluations and use the displayed root equation multiplied by
  the two second coefficients.

- For every y∈B and P∈S, `E_y(θ(P))=ι(P)`, without assuming
  that y satisfies the quadratic relation. k is an arbitrary field; a,b∈k; q=t²+at+b; `A_q` is the actual
  subalgebra k+qk[t]. B need not be a field, reduced or nonzero. Write ι:S→B for its actual algebra map,
  R=T³−bT² and L=aT. Write v=b1=tq in `A_q`. Uses §2.53, §2.52. Write θ(P)=e(P,0) by the parameter comparison
  and use the coordinate evaluation equation.

- For an arbitrary y∈B, construct the actual S-linear map `E_y:A_q→B`
  given by `E_y(f)=ι(e⁻¹(f)₀)+ι(e⁻¹(f)₁)y`. No root equation on y is required to construct this linear map, and
  multiplicativity is not assumed. k is an arbitrary field; a,b∈k; q=t²+at+b; `A_q` is the actual subalgebra
  k+qk[t]. B need not be a field, reduced or nonzero. Write ι:S→B for its actual algebra map, R=T³−bT² and
  L=aT. Write v=b1=tq in `A_q`. Uses §2.52. The inverse coordinate equivalence is S-linear. Addition and the
  specified S-action, together with the actual coefficient algebra map into B, prove the native linear-map
  laws.

- For every relation root y and z∈S×S, `F_y(e(z))=ι(z₀)+ι(z₁)y`. k is an
  arbitrary field; a,b∈k; q=t²+at+b; `A_q` is the actual subalgebra k+qk[t]. B need not be a field, reduced or
  nonzero. Write ι:S→B for its actual algebra map, R=T³−bT² and L=aT. Write v=b1=tq in `A_q`. Uses §2.53. The
  underlying function of `F_y` is `E_y`, so use the established evaluation formula.

- For every relation root y, `F_y(v)=y` for the actual v=b1=tq. k is an
  arbitrary field; a,b∈k; q=t²+at+b; `A_q` is the actual subalgebra k+qk[t]. B need not be a field, reduced or
  nonzero. Write ι:S→B for its actual algebra map, R=T³−bT² and L=aT. Write v=b1=tq in `A_q`. Uses §2.53, §2.52.
  The second basis vector is the coordinate image of (0,1); evaluate that pair.

- For every relation root y and actual S-algebra homomorphism `F:A_q→B`
  with F(v)=y, `F=F_y`. k is an arbitrary field; a,b∈k; q=t²+at+b; `A_q` is the actual subalgebra k+qk[t]. B need
  not be a field, reduced or nonzero. Write ι:S→B for its actual algebra map, R=T³−bT² and L=aT. Write v=b1=tq
  in `A_q`. Uses §2.53, §2.52, `AlgHom.commutes`. Reconstruct each f as P·b0+Q·v. Both homomorphisms preserve
  the specified S-coefficients, addition and multiplication, and have identical values on 1 and v.

- For every y∈B satisfying y²=ι(T³−bT²)−ι(aT)y, construct the actual
  S-algebra homomorphism `F_y:A_q→B` whose underlying function is `E_y`. Its unit and coefficient images are the
  actual ring unit and the specified map ι. k is an arbitrary field; a,b∈k; q=t²+at+b; `A_q` is the actual
  subalgebra k+qk[t]. B need not be a field, reduced or nonzero. Write ι:S→B for its actual algebra map,
  R=T³−bT² and L=aT. Write v=b1=tq in `A_q`. Uses §2.53, §2.52. Reuse the native linear map and the established
  multiplicative law. Identify the ring unit and θ(P) with e(1,0) and e(P,0); the evaluation formula proves
  the unit and coefficient-map conditions.

- For every actual S-algebra homomorphism `F:A_q→B`, its value F(v)
  satisfies F(v)²=ι(T³−bT²)−ι(aT)F(v). k is an arbitrary field; a,b∈k; q=t²+at+b; `A_q` is the actual subalgebra
  k+qk[t]. B need not be a field, reduced or nonzero. Write ι:S→B for its actual algebra map, R=T³−bT² and
  L=aT. Write v=b1=tq in `A_q`. Uses §2.52, `AlgHom.commutes`. Apply F to the proved native relation and use
  preservation of ring operations and the coefficient map.

- For every actual S-algebra homomorphism F, the underlying
  element of its image under the homomorphism/root equivalence is F(v). k is an arbitrary field; a,b∈k;
  q=t²+at+b; `A_q` is the actual subalgebra k+qk[t]. B need not be a field, reduced or nonzero. Write ι:S→B for
  its actual algebra map, R=T³−bT² and L=aT. Write v=b1=tq in `A_q`. Uses §2.53. Read the specified forward
  function of the constructed equivalence.

- For every element y of the actual root subtype, the
  inverse homomorphism/root equivalence is exactly `F_y`, constructed with y’s displayed relation proof. k is an
  arbitrary field; a,b∈k; q=t²+at+b; `A_q` is the actual subalgebra k+qk[t]. B need not be a field, reduced or
  nonzero. Write ι:S→B for its actual algebra map, R=T³−bT² and L=aT. Write v=b1=tq in `A_q`. Uses §2.53. Read
  the specified inverse function; no alternative choice of coefficient action is introduced.

- For every actual root-subtype element y and every P∈S,
  the inverse homomorphism/root correspondence sends θ(P) to ι(P). k is an arbitrary field; a,b∈k; q=t²+at+b;
  `A_q` is the actual subalgebra k+qk[t]. B need not be a field, reduced or nonzero. Write ι:S→B for its actual
  algebra map, R=T³−bT² and L=aT. Write v=b1=tq in `A_q`. Uses §2.53, `AlgHom.commutes`. The inverse
  correspondence is an actual S-algebra homomorphism; apply its native coefficient-map compatibility.

- For every a,b and z∈S×S, (1,0)⋆z=z. k is an arbitrary field; a,b∈k;
  q=t²+at+b; `A_q` is the actual subalgebra k+qk[t]. Uses §2.52. Substitute (1,0) in the explicit coefficient
  formula and simplify polynomial ring operations.

**Checks.**

- For every y∈B and P∈S, the actual `E_y(θ(P))` equals ι(P); no root equation is required.

- For every a,b and y∈B, `E_y(0)=0` in the actual target ring.

- For every a,b and y∈B, `E_y(e(0,1))=y`, not the first coefficient or its scalar evaluation.

- For `B=A_q` with its specified S-algebra structure and y=v with its proved quadratic relation, the actual `F_v`
  is the identity S-algebra homomorphism of `A_q`.

- For every relation root y in every commutative S-algebra B, the actual lift sends the actual second basis
  vector v to y.

- Every actual S-algebra homomorphism sending v to a specified relation root y is equal to the constructed
  `F_y`.

- For every actual root-subtype element y, mapping y to its inverse homomorphism and then taking its forward
  root recovers y, including its relation subtype.

- For every actual S-algebra homomorphism F, constructing the lift of its forward root recovers exactly F.

- For every root-subtype element y and P∈S, the actual inverse correspondence sends θ(P) to ι(P), with no
  change of the parameter action.

- The cusp, split and repeated-root quadratics, arbitrary characteristic and independent-universe coefficient
  algebras retain the same specified algebra and scalar action.

*Needs:* §2.52; `AlgHom.commutes`.

### 2.54 relative integral factorization of the glued map

Instantiate native relative normalization of C in N for the specified finite ν, and name it
the relative normalization. Its affine rings are integral closures inside Γ(N,ν⁻¹U), not
inside an unspecified function field. Prove the unit, counit and structure-map comparisons for this
specialization.

k is an arbitrary field; a,b∈k. C,N and ν are the previously specified quadratic pinched scheme, glued source
and finite morphism. No perfectness, separability, characteristic or discriminant restriction is added.
Affine-open, flatness and integral-factorization hypotheses are retained exactly where stated.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3 conductor diagrams and Proposition3.2.)

The construction needs the following maps and laws.

- The specified canonical morphisms satisfy i
  followed by r equals the previously glued ν. k is an arbitrary field; a,b∈k. Uses §2.54,
  `AlgebraicGeometry.Scheme.Hom.toNormalization_fromNormalization`. Specialize the native factorization
  equality to ν.

- The comparison i:N→Rν is an isomorphism, because the
  already constructed ν is finite and therefore integral. This does not assert that ν:N→C is an isomorphism. k
  is an arbitrary field; a,b∈k. Uses §2.54, §2.47, `AlgebraicGeometry.Scheme.Hom.toNormalization`,
  `AlgebraicGeometry.IsFinite.iff_isIntegralHom_and_locallyOfFiniteType`. Finiteness of ν supplies
  IsIntegralHom ν by the cited finite/integral/locally-finite-type equivalence. Apply the existing anonymous
  instance in Mathlib/AlgebraicGeometry/Normalization.lean, line 282 at the pinned commit: [IsIntegralHom f]
  implies IsIso f.toNormalization. This instance belongs to the same imported normalization module as the
  cited toNormalization definition. No normality or projective-line argument is required for this relative
  statement.

- For each affine open U⊆C, define an isomorphism of
  commutative-ring objects Γ(Rν,r⁻¹U)≅integralClosure(Γ(C,U),Γ(N,ν⁻¹U)). The coefficient algebra structure is
  exactly the one induced by ν on U.

- For every specified integral factorization ν=f
  followed by g, i followed by d equals f.

- Define the specified comparison i:N→Rν by Mathlib’s
  canonical map to relative normalization of ν. k is an arbitrary field; a,b∈k. Uses §2.54,
  `AlgebraicGeometry.Scheme.Hom.toNormalization`. Use the canonical map of the existing qcqs factorization of
  ν.

- For every specified integral factorization ν=f
  followed by g, d followed by g equals r.

- The inverse of e followed by ν equals the
  specified r:Rν→C. k is an arbitrary field; a,b∈k. Uses §2.54. Rewrite ν as i followed by r and cancel the
  inverse followed by the forward isomorphism.

- Define r:Rν→C to be Mathlib’s canonical integral morphism
  from the relative normalization of ν. k is an arbitrary field; a,b∈k. Uses §2.54,
  `AlgebraicGeometry.Scheme.Hom.fromNormalization`. Use the existing integral factorization map with ν and its
  actual target.

- The forward map of e:N≅Rν is the specified i:N→Rν. k
  is an arbitrary field; a,b∈k. Uses §2.54. Read the native asIso forward projection.

- For every integral factorization ν=f followed by g, d
  equals the inverse of e followed by f.

- Define e:N≅Rν using the isomorphism instance for the
  canonical i; its forward map is exactly i. k is an arbitrary field; a,b∈k. Uses §2.54. Use the native
  categorical asIso of the specified canonical comparison, preserving its forward morphism.

- For every field k and a,b∈k, the actual
  inclusion `A_q=k+qk[t]→k[t]`, q=t²+at+b, is not surjective. In particular the relative comparison N≅Rν cannot
  be used to identify the pinched affine chart with its source. k is an arbitrary field; a,b∈k. Uses §2.39,
  §2.34. If t were in `A_q`, its class in the existing cokernel would vanish. The previous nonzero-generator
  theorem for a monic degree-two q contradicts this. This is a ring-map counterexample, not a newly
  established global scheme isomorphism criterion.

- For any affine U⊆C and endomorphisms f,g of
  Γ(Rν,r⁻¹U), postcomposition with the specified section-comparison map gives equal maps if and only if f=g. k
  is an arbitrary field; a,b∈k. Uses §2.55. The forward map of the actual section isomorphism is monomorphic.
  Apply native categorical cancellation.

**Checks.**

- For the cusp a=b=0 over an arbitrary field, the specified two canonical maps compose to the original ν.

- For a=b=1 over F₂, the specified two canonical maps compose to the original ν, with the same coefficient
  field and target.

- For arbitrary a,b, the actual relative normalization is isomorphic to the already glued source through the
  specified i.

- For any specified integral factorization ν=f followed by g, the actual source triangle commutes.

- For arbitrary a,b, the specified inverse comparison followed by ν is exactly the canonical map from Rν to C.

- The specified isomorphism has the actual canonical comparison as its forward map.

- For the cusp, the specified isomorphism followed by its inverse is the identity of the glued source.

- For a=b=1 over F₂, the specified inverse followed by the forward map is the identity of the actual relative
  normalization.

- The actual inclusion `A_q→k[t]` is not surjective for q=t² over an arbitrary field (the cusp).

- The actual inclusion `A_q→k[t]` is not surjective for q=t²+t+1 over F₂; the nonsplit quadratic case also
  retains the missing generator t.

- Use the actual ν and preimage section rings. Preserve the flatness and integrality hypotheses. The affine
  inclusion is not surjective, including the cusp and characteristic-two cases. All absolute normalization,
  Proj/P¹ and cohomology obligations remain separate.

*Needs:* §2.46; §2.47; `AlgebraicGeometry.Scheme.Hom.normalization`.

### 2.55 affine integral-closure section comparison

Construct the relative normalization sections isomorphism from affine sections of the relative
normalization to the integral closure of Γ(C,U) in Γ(N,ν⁻¹U), with the coefficient algebra induced by ν.app.
Prove the actual quotient/section formula and compatibility with restrictions; the empty affine open is
allowed where the native comparison permits it.

k is an arbitrary field; a,b∈k. C,N and ν are the previously specified quadratic pinched scheme, glued source
and finite morphism. No perfectness, separability, characteristic or discriminant restriction is added.
Affine-open, flatness and integral-factorization hypotheses are retained exactly where stated.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3 conductor diagrams and Proposition3.2.)

The construction needs the following maps and laws.

- For every affine open U⊆C, the specified
  affine section comparison followed by its inverse is the identity of Γ(Rν,r⁻¹U).

- For every affine open U⊆C, the inverse
  section comparison followed by the comparison is the identity of the specified integral closure inside
  Γ(N,ν⁻¹U).

- For any affine U⊆C and endomorphisms f,g of
  Γ(Rν,r⁻¹U), postcomposition with the specified section-comparison map gives equal maps if and only if f=g.

**Checks.**

- For every affine open U of the cusp and section s on the actual relative normalization above U, the
  underlying value of relative normalization sections isomorphism(s) is to relative normalization.appLE(s), with the
  source-open inclusion given by the actual factorization triangle.

- For a=b=1 over F₂, every affine U and coefficient section r on C, inclusion after the comparison applied to
  from relative normalization.app(U)(r) equals normalization.app(U)(r). Both algebra structures are the actual
  coefficient pullbacks.

- For any a,b, affine U, r∈Γ(C,U), V=D(r) with V≠U and section s on the relative normalization above U,
  restrict s above V and compare, then include in Γ(N,ν⁻¹V). This equals restricting the included comparison
  of s above U. The only extra hypothesis asserts that the principal open is proper; it does not assert the
  comparison law.

- For any affine U, the actual comparison followed by its inverse is the identity on Γ(Rν,r⁻¹U).

- For any affine open of the cusp, the inverse comparison followed by the comparison is the identity on the
  specified integral closure.

- For any affine open when a=b=1 over F₂, the same inverse identity holds in the actual integral-closure ring.

- Use the actual ν and preimage section rings. Preserve the flatness and integrality hypotheses. The affine
  inclusion is not surjective, including the cusp and characteristic-two cases. All absolute normalization,
  Proj/P¹ and cohomology obligations remain separate.

*Needs:* §2.54; §2.47; `AlgebraicGeometry.Scheme.Hom.normalizationObjIso`;
`AlgebraicGeometry.Scheme.Hom.normalizationObjIso_hom_val`;
`AlgebraicGeometry.Scheme.Hom.fromNormalization_app`; `AlgebraicGeometry.Scheme.Hom.appLE_map`;
`AlgebraicGeometry.Scheme.Hom.map_appLE`.

### 2.56 descent through an integral factorization

Given an actual factorization ν through an integral T→C, construct
the relative normalization descent by native normalization descent. Prove the two factorization
equations, identity and uniqueness with the native hypotheses. The input is an integral factorization, not a
field that assumes the normalization theorem.

k is an arbitrary field; a,b∈k. C,N and ν are the previously specified quadratic pinched scheme, glued source
and finite morphism. No perfectness, separability, characteristic or discriminant restriction is added.
Affine-open, flatness and integral-factorization hypotheses are retained exactly where stated.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3 conductor diagrams and Proposition3.2.)

The construction needs the following maps and laws.

- For every specified integral factorization ν=f
  followed by g, i followed by d equals f. k is an arbitrary field; a,b∈k. Uses §2.56, §2.54,
  `AlgebraicGeometry.Scheme.Hom.toNormalization_normalizationDesc`. Use the native source triangle for
  normalizationDesc.

- For every specified integral factorization ν=f
  followed by g, d followed by g equals r. k is an arbitrary field; a,b∈k. Uses §2.56, §2.54,
  `AlgebraicGeometry.Scheme.Hom.normalizationDesc_comp`. Use the native target triangle for normalizationDesc.

- For every integral factorization ν=f followed by g, d
  equals the inverse of e followed by f. k is an arbitrary field; a,b∈k. Uses §2.56, §2.54. Cancel the
  epimorphic forward isomorphism i and apply its inverse law and the source triangle.

- For every specified integral factorization ν=f
  followed by g, any j:Rν→T with i followed by j equal to f equals d. Here the source triangle alone suffices
  because this particular i is an isomorphism. k is an arbitrary field; a,b∈k. Uses §2.56, §2.54. Cancel the
  epimorphic forward comparison. Do not attribute this one-triangle strengthening to arbitrary qcqs maps.

- For every affine open U⊆C, the specified
  affine section comparison followed by its inverse is the identity of Γ(Rν,r⁻¹U). k is an arbitrary field;
  a,b∈k. Uses §2.55. Use the native categorical isomorphism inverse law on the actual section comparison.

- For every affine open U⊆C, the inverse
  section comparison followed by the comparison is the identity of the specified integral closure inside
  Γ(N,ν⁻¹U). k is an arbitrary field; a,b∈k. Uses §2.55. Use the other native categorical isomorphism inverse
  law, retaining the induced scalar algebra.

**Checks.**

- For the cusp a=b=0, factor ν as ν:N→C followed by `id_C`. The resulting
  the relative normalization descent is exactly r:Rν→C. Prove the evaluation by
  precomposing with i and cancelling the source isomorphism e:N≅Rν of §2.54.

- For the cusp, factor ν as `id_N` followed by ν. The resulting
  the relative normalization descent is exactly e⁻¹:Rν→N, with the actual
  inverse comparison, as follows by the same cancellation.

- For the cusp over Q, construct α:N≅N by t↦−t on the finite chart and u↦−u on the reciprocal
  chart; these maps agree on the overlap and α²=id. With f=α and g=α⁻¹≫ν, the integral
  factorization has descent e⁻¹≫α. Precompose with i to prove this equality. It sends the point
  of Rν corresponding under e to t=1 to the normalization point t=−1.

- Use the actual ν and preimage section rings. Preserve the flatness and integrality hypotheses. The affine
  inclusion is not surjective, including the cusp and characteristic-two cases. All absolute normalization,
  Proj/P¹ and cohomology obligations remain separate.

*Needs:* §2.54; §2.47; `AlgebraicGeometry.Scheme.Hom.normalizationDesc`.

### 2.57 function-field map of the pinching

Construct the function-field map `K_C→K_N` from the generic-point stalk
comparison and ν.stalkMap. Prove the generic point maps to the generic point and the dense-open comparison
makes this map an isomorphism. Identify the images of finite-chart sections q and tq under the actual
generic-germ maps.

k is any field; a,b∈k; q=t²+at+b. C is the existing glued pinched curve, N its existing two-chart source,
ν:N→C the actual finite morphism and H their common infinity chart. No perfectness, separability,
characteristic or discriminant assumption is imposed. Nonempty-open and triangle hypotheses are required
exactly where stated.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3 conductor squares and Propositions3.1–3.3.)

The construction needs the following maps and laws.

- The actual morphism ν maps `η_N`, the native generic point
  of N, to `η_C`, the native generic point of C. k is any field; a,b∈k; q=t²+at+b. Uses §2.49, §2.50, §2.45,
  §2.43, §2.44, `AlgebraicGeometry.genericPoint_eq_of_isOpenImmersion`. The common infinity chart H is
  integral by the already established infinity-domain proof. Both H→N and H→C are open immersions into
  integral schemes. Evaluate the existing equality (H→N) followed by ν equals H→C at `η_H`, and apply the pinned
  generic-point image theorem to each open immersion.

- For any nonempty open U⊆C, its actual preimage ν⁻¹U
  is nonempty. k is any field; a,b∈k; q=t²+at+b. Uses §2.49. Choose a point of U and a preimage under the
  previously proved surjective ν; its membership supplies the required native Nonempty instance.

- The map σ is exactly the inverse stalkCongr for
  `ν(η_N)=η_C` followed by `ν.stalkMap(η_N)`; no arbitrary isomorphism of abstract fields is substituted. k is any
  field; a,b∈k; q=t²+at+b. Uses §2.57. Unfold the specified composition; equality transport uses
  `Inseparable.of_eq`.

- For any nonempty U⊆C, `germ_C,U` followed by σ
  equals ν.app(U) followed by `germ_N,ν⁻¹U`, as maps `Γ(C,U)→K_N`, with the actual nonempty-preimage instance. k
  is any field; a,b∈k; q=t²+at+b. Uses §2.57, `AlgebraicGeometry.Scheme.germToFunctionField`,
  `TopCat.Presheaf.germ_stalkSpecializes`, `AlgebraicGeometry.Scheme.Hom.germ_stalkMap`. Expand the native
  germ map and specified equality transport. Apply the pinned germ-specialization equality to remove the
  transport. Apply the actual scheme-morphism germ/stalkMap square; the separate ν-preimage lemma supplies the
  missing nonempty instance.

- The specified native map `σ:K_C→K_N` is an
  isomorphism in CommRingCat. k is any field; a,b∈k; q=t²+at+b. Uses §2.57, §2.49, §2.45, §2.43, §2.44,
  `AlgebraicGeometry.genericPoint_eq_of_isOpenImmersion`, `AlgebraicGeometry.Scheme.Hom.stalkMap_comp`,
  `AlgebraicGeometry.IsOpenImmersion.iff_isIso_stalkMap`, `CategoryTheory.IsIso.of_isIso_comp_left`. Take
  stalk maps of the common-infinity-chart triangle at `η_H`. Both chart stalk maps are isomorphisms by their
  open-immersion hypotheses. Use the pinned contravariant stalkMap composition law and cancel the source-chart
  stalk isomorphism. Identify its image point with `η_N`. The remaining equality-transport factor is already an
  isomorphism.

- The forward map E.hom equals the actual σ. k is
  any field; a,b∈k; q=t²+at+b. Uses §2.57. Use the defining forward map of native asIso.

- E.inv followed by σ equals the identity of
  `K_N`. k is any field; a,b∈k; q=t²+at+b. Uses §2.57. Use the native inverse/forward identity with the
  specified forward-map equation.

- σ followed by E.inv equals the identity of
  `K_C`. k is any field; a,b∈k; q=t²+at+b. Uses §2.57. Use the native forward/inverse identity with the
  specified forward-map equation.

- Let η:Spec `K_C→C` and `η_N:Spec K_N→N` be
  the native fromSpecStalk morphisms. Then Spec.map(E.inv) followed by `η_N` followed by ν equals η. k is any
  field; a,b∈k; q=t²+at+b. Uses §2.57, `AlgebraicGeometry.Scheme.fromSpecStalk`,
  `AlgebraicGeometry.Scheme.SpecMap_stalkMap_fromSpecStalk`,
  `AlgebraicGeometry.Scheme.SpecMap_stalkSpecializes_fromSpecStalk`. Apply native Spec/stalk-map naturality to
  the actual ν at `η_N`. The pinned Spec-specialization naturality removes the equality transport, giving
  Spec.map(σ) followed by η equals `η_N` followed by ν. Precompose with Spec.map(E.inv) and use contravariance
  of Spec and the proved σ/inverse identity.

- Define `E:K_C≅K_N` as the native categorical asIso of
  the specified σ and its proved IsIso instance; its forward map is the genuine transported ν stalk map. k is
  any field; a,b∈k; q=t²+at+b. Uses §2.57, `CategoryTheory.asIso`. Apply existing asIso to σ with the
  preceding IsIso theorem. No new field carrier or normalization predicate is introduced.

- The actual `η=C.fromSpecStalk(η_C):Spec K_C→C` is an
  affine morphism; its existing affine and separated instances therefore supply quasi-compactness and
  quasi-separatedness for native relative normalization. k is any field; a,b∈k; q=t²+at+b. Uses §2.49,
  `AlgebraicGeometry.IsAffineHom`, `AlgebraicGeometry.IsSeparated.of_isAffineHom`,
  `AlgebraicGeometry.isAffineOpen_bot`, `AlgebraicGeometry.isAffineOpen_top`,
  `TauCeti.AlgebraicGeometry.Scheme.fromSpecFunctionField`,
  `TauCeti.AlgebraicGeometry.Scheme.fromSpecFunctionField_preimage`,
  `TauCeti.AlgebraicGeometry.Scheme.instUniqueSpecFunctionField`. Import Tau Ceti’s existing generic-point
  morphism and nonempty-open-preimage theorem: η⁻¹U is the full source for nonempty U. A field spectrum is
  affine, so this preimage is affine. For an empty U its preimage is empty, which is affine by the pinned
  empty-open theorem. Apply native IsAffineHom. Import, rather than reconstruct, the existing
  affine-to-quasi-compact and affine-to-separated-to-quasi-separated instances.

**Checks.**

- For a=b=0 over any field, take generic germs of q and tq on the actual finite curve chart, using ΓSpecIso
  and the inverse open-immersion section isomorphism. normalizationFunctionFieldMap sends them to the generic
  germs of t² and t³ on the actual normalization chart.

- For a=b=1 over F₂, the same native chart-germ constructions send q=t²+t+1 and tq to the germs of q and tq in
  `K_N`. Nonempty chart-image instances are obligations inside the example, not coordinate-correctness
  hypotheses.

- For a=−1,b=0 over Q, use the common actual infinity chart and its native section u. The function-field map
  sends the curve germ of u, transported by the inverse infinity-immersion section isomorphism, to the source
  germ of the same u. No abstract field automorphism is chosen as a test certificate.

- For the cusp a=b=0 over any field, the actual σ sends zero to zero.

- For a=b=1 over F₂, the actual σ sends one to one; the nonsplit polynomial t²+t+1 imposes no separability
  workaround.

- For any a,b and any nonzero `x∈K_C`, the actual σ(x) is nonzero.

- For the cusp over any field and every `x∈K_C`, E.inv(σ(x))=x.

- For a=b=1 over F₂ and every `x∈K_N`, σ(E.inv(x))=x.

- For every a,b, σ is an isomorphism while the actual affine inclusion `A_q→k[t]` is not surjective. A
  function-field isomorphism does not identify the pinched affine scheme with its source.

- Use the actual generic-point stalk fields and the actual ν stalk map. Retain full quadratic/nilpotent and
  characteristic-two generality. No opaque carrier, proposition certificate, ν-isomorphism or unproved
  absolute-normalization-isomorphism assumption may replace the construction.

*Needs:* §2.49; §2.50; §2.45; §2.43; §2.44; `AlgebraicGeometry.genericPoint_eq_of_isOpenImmersion`;
`AlgebraicGeometry.Scheme.functionField`; `TopCat.Presheaf.stalkCongr`.

### 2.58 integral comparison from absolute normalization

Normalize C in its native generic-point function field and construct
the absolute normalization comparison to N using the inverse function-field isomorphism and
the finite integral ν. The map is specified by the native normalization descent. Its being an isomorphism is
proved by the section comparisons below, rather than built into this definition.

k is any field; a,b∈k; q=t²+at+b. C is the existing glued pinched curve, N its existing two-chart source,
ν:N→C the actual finite morphism and H their common infinity chart. No perfectness, separability,
characteristic or discriminant assumption is imposed. Nonempty-open and triangle hypotheses are required
exactly where stated.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3 conductor squares and Propositions3.1–3.3;
[Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, one-component conductor square immediately before
Proposition3.1.)

Standing hypotheses for the maps and laws below: C(a,b), N(a,b) and ν are the actual two-chart schemes and
finite surjective morphism. No characteristic, perfectness, separability or nonzero-discriminant restriction
is imposed. Every open carrying a generic-germ algebra is nonempty; affineness is additionally required for
the integral-closure equivalences. `A_U` and `B_U` use their actual section rings and ν.app(U) coefficient map.

The construction needs the following maps and laws.

- The native η.toNormalization
  followed by δ equals the actual ζ=Spec.map(E.inv) followed by `η_N`. k is any field; a,b∈k; q=t²+at+b. Uses
  §2.58, `AlgebraicGeometry.Scheme.Hom.toNormalization_normalizationDesc`. Apply the existing
  toNormalization/normalizationDesc triangle to the specified integral factorization.

- The actual δ followed by ν equals the
  native η.fromNormalization:η.normalization→C. k is any field; a,b∈k; q=t²+at+b. Uses §2.58,
  `AlgebraicGeometry.Scheme.Hom.normalizationDesc_comp`. Apply the existing
  normalizationDesc/fromNormalization triangle to the specified integral factorization.

- The specified actual δ:η.normalization→N
  is an integral morphism. k is any field; a,b∈k; q=t²+at+b. Uses §2.58,
  `AlgebraicGeometry.Scheme.Hom.normalizationDesc`. Use the existing native integral-normalizationDesc
  instance: δ followed by the integral ν is the canonical integral η.fromNormalization, so integral
  cancellation applies.

- For any actual d:η.normalization→N, if
  η.toNormalization followed by d equals ζ and d followed by ν equals η.fromNormalization, then d=δ. Both
  triangles are hypotheses; neither one alone is discarded. k is any field; a,b∈k; q=t²+at+b. Uses §2.58,
  §2.47, `AlgebraicGeometry.Scheme.Hom.normalization.hom_ext`. The finite ν is affine. Compare d and δ by the
  pinned native normalization.hom_ext, using the point triangle and both base triangles.

- For every nonempty affine open V of the
  actual source N(a,b), its section ring Γ(N,V) is integrally closed. k is any field, a,b∈k and q=t²+at+b. `K_C`
  and `K_N` are the native generic-point stalk fields. Uses §2.50, `IsIntegrallyClosed.of_localization_maximal`,
  `AlgebraicGeometry.IsAffineOpen.fromSpec`, `AlgebraicGeometry.Spec.stalkIso`, `IsIntegrallyClosed.of_equiv`.
  Use integrality of N to make Γ(N,V) a domain. For each maximal ideal P take its actual point of Spec Γ(N,V).
  The fromSpec open immersion identifies its stalk with the corresponding normal source stalk. Spec.stalkIso
  identifies that stalk with the localization at P. Apply the native maximal-localization criterion.

- For every nonempty affine U⊂C, the
  actual section ring `B_U=Γ(N,ν⁻¹U)` is integrally closed. k is any field, a,b∈k and q=t²+at+b. `K_C` and `K_N` are
  the native generic-point stalk fields. Uses §2.58, §2.57, §2.47, `AlgebraicGeometry.IsAffineOpen.preimage`.
  Surjectivity supplies nonempty ν⁻¹U. Finiteness supplies its affineness. Apply normality of source affine
  sections.

**Checks.**

- For the cusp over any field, δ followed by ν equals the native η.fromNormalization.

- For a=b=1 over F₂, η.toNormalization followed by δ equals Spec.map(E.inv) followed by the actual `η_N`.

- For all a,b over any field, the actual δ is integral, without asserting it is an isomorphism.

- Use the actual generic-point stalk fields and the actual ν stalk map. Retain full quadratic/nilpotent and
  characteristic-two generality. No opaque carrier, proposition certificate, ν-isomorphism or unproved
  absolute-normalization-isomorphism assumption may replace the construction.

*Needs:* §2.57; §2.47; `AlgebraicGeometry.Scheme.Hom.normalization`;
`AlgebraicGeometry.Scheme.Hom.normalizationDesc`;
`AlgebraicGeometry.IsFinite.iff_isIntegralHom_and_locallyOfFiniteType`.

### 2.59 affine closure equivalence in the source field

For each nonempty affine U⊂C, construct the normalization sections closure equivalence from
`B_U=Γ(N,ν⁻¹U)` to the integral closure of `A_U=Γ(C,U)` in `K_N`. Show `B_U` is integrally closed and integral over
`A_U` and prove the coefficient/generic-germ square. Field-valued closure comparison is restricted to nonempty
opens.

k is any field, a,b∈k and q=t²+at+b. C(a,b), N(a,b) and ν are the actual two-chart schemes and finite
surjective morphism. No characteristic, perfectness, separability or nonzero-discriminant restriction is
imposed. `K_C` and `K_N` are the native generic-point stalk fields. Every open carrying a generic-germ algebra is
nonempty; affineness is additionally required for the integral-closure equivalences. `A_U` and `B_U` use their
actual section rings and ν.app(U) coefficient map.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, one-component conductor square immediately
before Proposition3.1.)

The construction needs the following maps and laws.

- For every nonempty U, `c_U` equals the generic germ
  `A_U→K_C` followed by the specified native function-field isomorphism `σ:K_C→K_N`. k is any field, a,b∈k and
  q=t²+at+b. `K_C` and `K_N` are the native generic-point stalk fields. Uses §2.59, §2.57. Use the germ
  compatibility for the actual stalk map σ.

- For every nonempty U⊂C, the actual
  coefficient map `c_U` is injective. k is any field, a,b∈k and q=t²+at+b. `K_C` and `K_N` are the native
  generic-point stalk fields. Uses §2.59, §2.49, `AlgebraicGeometry.Scheme.germToFunctionField_injective`. The
  curve generic germ is injective; the field homomorphism σ is injective. Compose these maps.

- For nonempty V⊂U⊂C, restriction `A_U→A_V`
  followed by `c_V` equals `c_U` as ring homomorphisms. k is any field, a,b∈k and q=t²+at+b. `K_C` and `K_N` are the
  native generic-point stalk fields. Uses §2.59, `TopCat.Presheaf.germ_res`. Replace both coefficient maps by
  generic germ followed by σ and apply germ restriction naturality.

- For any nonempty open U⊂C, define `c_U:A_U=Γ(C,U)→K_N`
  by the actual map ν.app(U) followed by the generic germ on ν⁻¹U. The preimage is nonempty by the existing
  surjectivity theorem. k is any field, a,b∈k and q=t²+at+b. `K_C` and `K_N` are the native generic-point stalk
  fields. Uses §2.57, §2.46, `AlgebraicGeometry.Scheme.germToFunctionField`. Compose the two existing section
  and generic-germ maps, with the actual preimage open and its nonemptiness witness.

- For every nonempty affine U⊂C, `B_U` is an
  IsIntegralClosure of `A_U` in the actual `K_N`. Its `A_U`-algebra is ν.app(U), its map into `K_N` is the generic
  germ, and the coefficient map is `c_U`. k is any field, a,b∈k and q=t²+at+b. `K_C` and `K_N` are the native
  generic-point stalk fields. Uses §2.58, §2.59, §2.47, `AlgebraicGeometry.Scheme.Hom.isIntegral_app`,
  `algebraMap_isIntegral_iff`, `IsScalarTower.of_algebraMap_eq'`,
  `AlgebraicGeometry.functionField_isFractionRing_of_isAffineOpen`, `IsIntegralClosure.of_isIntegrallyClosed`.
  The defining equality for `c_U` supplies the scalar tower `A_U→B_U→K_N`. The finite map makes `B_U` integral over
  `A_U`. The actual affine-open generic-stalk theorem makes `K_N a` fraction field of `B_U`. Combine this with
  normality of `B_U` using the existing integral-closure instance.

- The ambient `K_N`-value of `e_U(s)` is the actual
  generic germ of `s∈B_U`. k is any field, a,b∈k and q=t²+at+b. `K_C` and `K_N` are the native generic-point stalk
  fields. Uses §2.59, `IsIntegralClosure.algebraMap_equiv`. Use the native ambient-value law for the
  integral-closure equivalence.

- For `r∈A_U`, `e_U(ν.app(U)(r))` is the
  native coefficient image in `integralClosure(A_U,K_N)`.

- For `z∈integralClosure(A_U,K_N)`, the
  actual source generic germ of `e_U⁻¹(z)` is z itself.

- The value of the coefficient-algebra
  equivalence on `x∈K_C` is exactly σ(x), the already constructed stalk map. k is any field, a,b∈k and
  q=t²+at+b. `K_C` and `K_N` are the native generic-point stalk fields. Uses §2.59, §2.57. Unfold only the new
  algebra-equivalence structure; the underlying field map was retained.

- For `r∈A_U`, the field algebra
  equivalence sends the actual curve generic germ of r to `c_U(r)`.

- The inverse of the coefficient-algebra
  equivalence is exactly the σ⁻¹ on every `x∈K_N`.

- For every nonempty open U⊂C, upgrade the actual
  `σ:K_C≅K_N` to an `A_U`-algebra equivalence: `K_C` has its native generic-germ action and `K_N` has `c_U`. No
  affineness is required for this upgrade. k is any field, a,b∈k and q=t²+at+b. `K_C` and `K_N` are the native
  generic-point stalk fields. Uses §2.59, §2.57. Keep the exact underlying native field isomorphism. Its
  coefficient equation is the established germ compatibility.

**Checks.**

- For a=b=0 over any field, `c_U(r)` equals σ of the actual curve generic germ of r on every nonempty U.

- For k=F₂ and a=b=1, every nonzero section on a nonempty open has nonzero image under `c_U`.

- For every inclusion of nonempty opens V⊂U, the two evaluated coefficient maps agree after actual presheaf
  restriction.

- For a=b=0, the ambient value of every `e_U(s)` equals the native source generic germ of s.

- For k=F₂ and a=b=1, every coefficient section maps to the exact native coefficient element of the closure in
  `K_N`.

- Every actual integral element z in `K_N` is the generic germ of the inverse image `e_U⁻¹(z)`.

- For a=b=0, the upgraded field isomorphism sends each native curve coefficient germ to `c_U` of that
  coefficient.

- For k=F₂ and a=b=1, the inverse on every source field element is exactly the specified native σ⁻¹.

- The actual coefficient-algebra field map is bijective while the actual affine pinch inclusion `A_q→k[t]` is
  not surjective, for every a,b and every nonempty U.

- For every nonempty affine U⊂C, construct the specified `A_U`-algebra equivalence
  `e_U:B_U≃integralClosure(A_U,K_N)`, with the actual coefficient action `c_U` and generic-germ embedding of `B_U`.

*Needs:* §2.57; §2.46; `AlgebraicGeometry.Scheme.germToFunctionField`; §2.49;
`AlgebraicGeometry.Scheme.germToFunctionField_injective`; `TopCat.Presheaf.germ_res`; §2.58; §2.47;
`AlgebraicGeometry.Scheme.Hom.isIntegral_app`; `algebraMap_isIntegral_iff`; `IsScalarTower.of_algebraMap_eq'`;
`AlgebraicGeometry.functionField_isFractionRing_of_isAffineOpen`; `IsIntegralClosure.of_isIntegrallyClosed`;
`IsIntegralClosure.equiv`.

### 2.60 affine closure equivalence in the curve field

Transport this closure along the actual `K_C≃K_N` to construct
`E_U:B_U≃ₐ[A_U]integralClosure(A_U,K_C)`. The `A_U`-action is the
curve's actual generic germ. Prove generator and inverse formulas and independence of the chosen affine chart.

k is any field, a,b∈k and q=t²+at+b. C(a,b), N(a,b) and ν are the actual two-chart schemes and finite
surjective morphism. No characteristic, perfectness, separability or nonzero-discriminant restriction is
imposed. `K_C` and `K_N` are the native generic-point stalk fields. Every open carrying a generic-germ algebra is
nonempty; affineness is additionally required for the integral-closure equivalences. `A_U` and `B_U` use their
actual section rings and ν.app(U) coefficient map.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, one-component conductor square immediately
before Proposition3.1.)

Standing hypotheses for the maps and laws below: C(a,b), N(a,b) and ν:N→C are the actual glued schemes and
finite surjective map. No characteristic, perfectness, separability or discriminant hypothesis is added. η=
`C.fromSpecStalk(η_C):Spec K_C→C`, where `K_C` is the actual generic-point stalk field. Write `A_U=Γ(C,U)`,
`S_U=Γ(Spec K_C,η⁻¹U)`, `D_U=Γ(η.normalization,η.fromNormalization⁻¹U)` and `B_U=Γ(N,ν⁻¹U)`. The `A_U`-actions on
`S_U,D_U,B_U` are exactly η.app(U), η.fromNormalization.app(U), ν.app(U); the action on `K_C` is its native
generic germ. Every U used with `K_C` is nonempty; the closure and source comparisons additionally require
IsAffineOpen U. Empty opens have no nonempty witness and are not covered by these equivalences.

The construction needs the following maps and laws.

- For `s∈B_U`, the ambient `K_C`-value of `E_U(s)` is
  `σ⁻¹(germ_N(s))`. k is any field, a,b∈k and q=t²+at+b. `K_C` and `K_N` are the native generic-point stalk fields.
  Uses §2.60, §2.59. The native mapIntegralClosure retains the underlying field map; use the established `e_U`
  value.

- For `r∈A_U`, `E_U(ν.app(U)(r))` equals the
  image of r under the native algebra map `A_U→integralClosure(A_U,K_C)`. k is any field, a,b∈k and q=t²+at+b.
  `K_C` and `K_N` are the native generic-point stalk fields. Uses §2.60. Apply the coefficient law of the actual
  `A_U`-algebra equivalence.

- For nonempty affine V⊂U and `s∈B_U`, the
  ambient values in `K_C` of `E_V(res(s))` and `E_U(s)` agree, where res is the actual structure-presheaf
  restriction Γ(N,ν⁻¹U)→Γ(N,ν⁻¹V). k is any field, a,b∈k and q=t²+at+b. `K_C` and `K_N` are the native
  generic-point stalk fields. Uses §2.60, `TopCat.Presheaf.germ_res`. Both ambient values are σ⁻¹ of the
  corresponding source generic germs; apply generic-germ restriction naturality.

- For `z∈integralClosure(A_U,K_C)`, the
  generic germ of `E_U⁻¹(z)` equals σ(z). k is any field, a,b∈k and q=t²+at+b. `K_C` and `K_N` are the native
  generic-point stalk fields. Uses §2.60, §2.57. Apply the ambient-value identity to `E_U⁻¹(z)`, simplify the
  inverse identity and cancel the injective map σ⁻¹.

- Let nonempty affine V⊂U and let `z_U`
  and `z_V` lie in the two native closures inside `K_C` with equal ambient values. Then the actual restriction of
  `E_U⁻¹(z_U)` equals `E_V⁻¹(z_V)`. k is any field, a,b∈k and q=t²+at+b. `K_C` and `K_N` are the native generic-point
  stalk fields. Uses §2.60. Apply injectivity of `E_V`, then subtype extensionality. Forward restriction
  compatibility and the two inverse identities reduce the claim to the equality of ambient field values.

- For `r∈A_U`, `e_U(ν.app(U)(r))` is the
  native coefficient image in `integralClosure(A_U,K_N)`. k is any field, a,b∈k and q=t²+at+b. `K_C` and `K_N` are
  the native generic-point stalk fields. Uses §2.59. Use the coefficient law of `e_U`.

- For `z∈integralClosure(A_U,K_N)`, the
  actual source generic germ of `e_U⁻¹(z)` is z itself. k is any field, a,b∈k and q=t²+at+b. `K_C` and `K_N` are the
  native generic-point stalk fields. Uses §2.59. Apply the ambient-value law to the inverse image and use the
  inverse identity.

- For `r∈A_U`, the field algebra
  equivalence sends the actual curve generic germ of r to `c_U(r)`. k is any field, a,b∈k and q=t²+at+b. `K_C` and
  `K_N` are the native generic-point stalk fields. Uses §2.59. Apply the native algebra-equivalence coefficient
  law.

- The inverse of the coefficient-algebra
  equivalence is exactly the σ⁻¹ on every `x∈K_N`. k is any field, a,b∈k and q=t²+at+b. `K_C` and `K_N` are the
  native generic-point stalk fields. Uses §2.59, §2.57. The new structure retains both maps of the native
  field isomorphism.

- For `r∈A_U`,
  `κ_U(η.app(U)(r))=germ_C,U(r)` in the actual stalk field `K_C`. k is an arbitrary field; a,b∈k and q=t²+at+b.
  Uses §2.60. Apply the base-algebra commutation law of `κ_U`.

- For nonempty V⊂U and `s∈S_U`,
  `κ_V(res_S(s))=κ_U(s)`, where res_S is the actual structure-presheaf restriction on `Spec K_C` along η⁻¹V⊂η⁻¹U.
  Affineness is not required. k is an arbitrary field; a,b∈k and q=t²+at+b. Uses §2.60,
  `TauCeti.AlgebraicGeometry.Scheme.rationalFunctionsRingEquiv_map`. Apply the existing public
  rational-function restriction theorem to the actual open inclusion.

- For `r∈A_U`,
  `κ_U⁻¹(germ_C,U(r))=η.app(U)(r)` in `S_U`. k is an arbitrary field; a,b∈k and q=t²+at+b. Uses §2.60. Apply
  injectivity of `κ_U` to its coefficient equation.

- For every nonempty open U⊂C, upgrade the
  pinned rational-function ring equivalence to `κ_U:S_U≃ₐ[A_U]K_C`, with the exact η.app(U) action. Its
  underlying ring equivalence is the existing Tau Ceti rationalFunctionsRingEquiv; no new rational-function
  sheaf or generic-preimage theory is defined. k is an arbitrary field; a,b∈k and q=t²+at+b. Uses §2.57,
  `TauCeti.AlgebraicGeometry.Scheme.rationalFunctionsRingEquiv`,
  `TauCeti.AlgebraicGeometry.Scheme.rationalFunctionsEquiv`,
  `TauCeti.AlgebraicGeometry.Scheme.rationalFunctionsSectionsEquiv`. Use the existing public ring and linear
  equivalences. Evaluate linearity on r and the unit section, identified through the existing additive
  sections equivalence, to prove the actual coefficient equation. Keep all private Tau Ceti helpers outside
  the public dependency contract.

**Checks.**

Write U=q and V=tq for the generators of the finite chart ring `A_q=k[q,tq]`.

- For the cusp a=b=0 on the finite chart, the coefficients U and V go to t² and t³ in the closure k[t]
  inside `K_C`, and the closure element t is the image of the fraction V/U; t itself is not a coefficient,
  since t∉k[t²,t³].

- For k=F₂ and a=b=1, the nonsplit quadratic case, U goes to t²+t+1 and V to t(t²+t+1). The automorphism
  t↦t+1 of k[t] fixes U, since (t+1)²+(t+1)+1=t²+t+1, but sends V to V+U; so the value on V distinguishes
  the actual equivalence from this wrong one.

- On the infinity chart with u=1/t and z=1/(tq), the closure equivalence sends u to 1/t and z to 1/(tq) in
  `K_C`; for a=b=0 the second value is t⁻³.

- On any nonempty affine inclusion V⊂U, integral elements in `K_C` with equal ambient values have inverse images
  agreeing under the actual source restriction; for the cusp the value t on the finite chart restricts to the
  same t on the basic open where U is inverted.

- The empty open of C has zero section ring, which cannot be identified with the nonzero generic field; it has
  no Nonempty witness, so neither the section comparison nor the closure equivalence is instantiated there.

*Needs:* §2.59; `AlgEquiv.mapIntegralClosure`.

### 2.61 affine sections of native and chart normalizations

Combine the native absolute-normalization section comparison with the preceding closure equivalence to
construct the source comparison `D_U≃ₐ[A_U]B_U`. This comparison
initially concerns nonempty affine sections. Prove restriction naturality and then identify it with the actual
comparison map's section pullback; an abstract equivalence does not yet prove the global morphism is an
isomorphism.

k is an arbitrary field; a,b∈k and q=t²+at+b. C(a,b), N(a,b) and ν:N→C are the actual glued schemes and finite
surjective map. No characteristic, perfectness, separability or discriminant hypothesis is added. η=
`C.fromSpecStalk(η_C):Spec K_C→C`, where `K_C` is the actual generic-point stalk field. Write `A_U=Γ(C,U)`,
`S_U=Γ(Spec K_C,η⁻¹U)`, `D_U=Γ(η.normalization,η.fromNormalization⁻¹U)` and `B_U=Γ(N,ν⁻¹U)`. The `A_U`-actions on
`S_U,D_U,B_U` are exactly η.app(U), η.fromNormalization.app(U), ν.app(U); the action on `K_C` is its native
generic germ. Every U used with `K_C` is nonempty; the closure and source comparisons additionally require
IsAffineOpen U. Empty opens have no nonempty witness and are not covered by these equivalences.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, one-component conductor square immediately
before Proposition3.1; [Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, terminology and both
conductor squares immediately before Proposition 3.1.)

Standing hypotheses for the maps and laws below: C=curve(a,b), N=normalization source(a,b) and ν:N→C are the
actual glued schemes and finite surjective map. No characteristic, perfectness, separability or discriminant
hypothesis is added. `η=C.fromSpecStalk(η_C):Spec K_C→C`, `σ:K_C≅K_N` is the native stalk-field isomorphism,
`ζ=Spec.map(σ.inv)≫N.fromSpecStalk(η_N)`, and δ:η.normalization→N is the existing actual normalizationDesc
comparison satisfying both triangles. `A_U=Γ(C,U)`, `B_U=Γ(N,ν⁻¹U)`, `S_U=Γ(Spec K_C,η⁻¹U)`,
`D_U=Γ(η.normalization,η.fromNormalization⁻¹U)`. All `A_U`-actions are the actual η.app(U), ν.app(U),
η.fromNormalization.app(U) and native generic germ. `E_U`, `θ_U`, `κ_U` and `Ψ_U` refer to the existing actual algebra
equivalences, with nonemptiness and affinity exactly where the statement says so. Δ and Λ allow every open; a
generic-field value is used only on nonempty opens.

The construction needs the following maps and laws.

- For `r∈A_U`,
  `θ_U(η.fromNormalization.app(U)(r))` is the native algebra-map image of r in `integralClosure(A_U,K_C)`. k is an
  arbitrary field; a,b∈k and q=t²+at+b. Uses §2.61. Apply the `A_U`-algebra commutation law of `θ_U`.

- For `s∈D_U`, the ambient `K_C`-value of
  `θ_U(s)` equals `κ_U` applied to the ambient `S_U`-value of η.normalizationObjIso(U)(s). Both section maps are the
  actual native maps. k is an arbitrary field; a,b∈k and q=t²+at+b. Uses §2.61. Unfold the two composed
  algebra equivalences; native integral-closure transport has this exact ambient value.

- For
  `z∈integralClosure(A_U,K_C)`, applying η.normalizationObjIso(U), its ambient `S_U` inclusion and `κ_U` to `θ_U⁻¹(z)`
  gives exactly the ambient `K_C`-value of z. k is an arbitrary field; a,b∈k and q=t²+at+b. Uses §2.61. Apply
  the ambient-value formula and the apply/symm identity for `θ_U`.

- For every nonempty affine U⊂C, construct
  `θ_U:D_U≃ₐ[A_U]integralClosure(A_U,K_C)`. Use the actual native η.normalization and η.normalizationObjIso,
  rather than a replacement section carrier or an assumed isomorphism of schemes. k is an arbitrary field;
  a,b∈k and q=t²+at+b. Uses §2.60, `AlgebraicGeometry.Scheme.Hom.normalizationObjIso`,
  `AlgebraicGeometry.Scheme.Hom.fromNormalization_app`, `AlgEquiv.mapIntegralClosure`. Upgrade the native
  normalizationObjIso to an `A_U`-algebra equivalence using fromNormalization_app and its inverse/hom identity.
  Compose with the existing integral-closure equivalence induced by `κ_U`.

- For `r∈A_U`,
  `Ψ_U(η.fromNormalization.app(U)(r))=ν.app(U)(r)` in `B_U`. k is an arbitrary field; a,b∈k and q=t²+at+b. Uses
  §2.61. Use the `A_U`-algebra commutation law of `Ψ_U`.

- For `s∈D_U`, `E_U(Ψ_U(s))=θ_U(s)` as
  elements of the actual `integralClosure(A_U,K_C)`. k is an arbitrary field; a,b∈k and q=t²+at+b. Uses §2.61.
  Cancel `E_U` with its inverse in the defining composition.

- For `s∈B_U`,
  `θ_U(Ψ_U⁻¹(s))=E_U(s)` in the actual `integralClosure(A_U,K_C)`. k is an arbitrary field; a,b∈k and q=t²+at+b.
  Uses §2.61. Cancel `θ_U` with its inverse in the inverse composition.

- For each nonempty affine U
  and `s∈D_U`, the ambient value of `θ_U(s)` is `κ_U(η.toNormalization.appLE(s))`. k is an arbitrary field; a,b∈k
  and q=t²+at+b. Uses §2.61, `AlgebraicGeometry.Scheme.Hom.normalizationObjIso_hom_val`. Use the existing θ
  value formula and native normalizationObjIso_hom_val; both maps have the same actual ambient generic
  section.

- For nonempty affine V⊆U and
  `s∈D_U`, `θ_V(res_D(s)).val=θ_U(s).val` in `K_C`. k is an arbitrary field; a,b∈k and q=t²+at+b. Uses §2.61, §2.60,
  `AlgebraicGeometry.Scheme.Hom.map_appLE`, `AlgebraicGeometry.Scheme.Hom.appLE_map`. Express θ through the
  actual toNormalization section map, commute restriction using map_appLE and appLE_map, and apply the κ
  restriction formula.

- For nonempty affine V⊆U and
  `s∈D_U`, `Ψ_V(res_D(s))=res_N(Ψ_U(s))`. k is an arbitrary field; a,b∈k and q=t²+at+b. Uses §2.61, §2.60. Apply
  the inverse E restriction law to the θ restriction equality; the shared ambient `K_C` value determines the
  integral-closure element.

**Checks.**

- For a=b=0, `θ_U` sends each η.fromNormalization.app(U)(r) to the native coefficient image in
  `integralClosure(A_U,K_C)`.

- For k=F₂ and a=b=1, `κ_U` applied to the ambient value of `η.normalizationObjIso(U)(θ_U⁻¹(z))` is the actual
  ambient `K_C`-value of every integral element z.

- For every a,b and nonempty affine U, `θ_U` is bijective while the original quadratic affine inclusion `A_q→k[t]`
  is not surjective. The section equivalence does not imply that original inclusion is an isomorphism.

- For a=b=0, `Ψ_U` sends the actual native-normalization pullback of each `r∈A_U` to the actual ν pullback of r.

- For k=F₂ and a=b=1, `θ_U(Ψ_U⁻¹(s))=E_U(s)` for every actual source section s over a nonempty affine U.

- For every a,b and nonempty affine U, `Ψ_U` is bijective although the actual original affine pinch inclusion
  `A_q→k[t]` is not surjective.

- For every nonempty affine U⊂C, construct `Ψ_U:D_U≃ₐ[A_U]B_U` as `θ_U` followed by the inverse of the
  `E_U:B_U≃ₐ[A_U]integralClosure(A_U,K_C)`. This is a section equivalence; it does not yet identify `Ψ_U` with
  δ.app or assert δ is an isomorphism.

*Needs:* §2.60; `AlgebraicGeometry.Scheme.Hom.normalizationObjIso`;
`AlgebraicGeometry.Scheme.Hom.fromNormalization_app`; `AlgEquiv.mapIntegralClosure`.

### 2.62 the actual comparison on all section algebras

Construct the section comparison `B_U≃ₐ[A_U]D_U` from the
actual comparison morphism on every open U. Prove bijectivity locally, glue and include the empty open. Its
forward map is precisely the actual section map. Use these comparisons to prove the global
absolute-normalization comparison is an isomorphism, with its structure-map and chart equations.

k is an arbitrary field; a,b∈k and q=t²+at+b. C=curve(a,b), N=normalization source(a,b) and ν:N→C are the
actual glued schemes and finite surjective map. No characteristic, perfectness, separability or discriminant
hypothesis is added. `η=C.fromSpecStalk(η_C):Spec K_C→C`, `σ:K_C≅K_N` is the native stalk-field isomorphism,
`ζ=Spec.map(σ.inv)≫N.fromSpecStalk(η_N)`, and δ:η.normalization→N is the existing actual normalizationDesc
comparison satisfying both triangles. `A_U=Γ(C,U)`, `B_U=Γ(N,ν⁻¹U)`, `S_U=Γ(Spec K_C,η⁻¹U)`,
`D_U=Γ(η.normalization,η.fromNormalization⁻¹U)`. All `A_U`-actions are the actual η.app(U), ν.app(U),
η.fromNormalization.app(U) and native generic germ. `E_U`, `θ_U`, `κ_U` and `Ψ_U` refer to the existing actual algebra
equivalences, with nonemptiness and affinity exactly where the statement says so. Δ and Λ allow every open; a
generic-field value is used only on nonempty opens.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §3, terminology and both conductor squares
immediately before Proposition 3.1.)

The construction needs the following maps and laws.

- For every open U, `Δ_U` followed
  by the actual η.toNormalization section map equals the actual ζ section map `B_U→S_U`. k is an arbitrary
  field; a,b∈k and q=t²+at+b. Uses §2.62, §2.58, `AlgebraicGeometry.Scheme.Hom.appLE_comp_appLE`. Compose
  native appLE maps and substitute the already established η.toNormalization≫δ=ζ triangle, with the actual
  source and target opens fixed.

- For nonempty affine U and `s∈B_U`,
  `θ_U(Δ_U(s))=E_U(s)` in `integralClosure(A_U,K_C)`. k is an arbitrary field; a,b∈k and q=t²+at+b. Uses §2.62,
  §2.60. Compare the ambient `K_C` values using the preceding lifted generic-value formula and the E value
  formula; subtype extensionality identifies the actual closure elements.

- For nonempty affine U and `s∈B_U`,
  `Δ_U(s)=Ψ_U⁻¹(s)` in `D_U`. k is an arbitrary field; a,b∈k and q=t²+at+b. Uses §2.62, §2.61. Apply injectivity
  of `θ_U` and its common-closure equality with `E_U`; use the Ψ inverse-closure law.

- For every open U and `r∈A_U`,
  `Δ_U(ν.app(U)(r))=η.fromNormalization.app(U)(r)`. k is an arbitrary field; a,b∈k and q=t²+at+b. Uses §2.62,
  §2.58, `AlgebraicGeometry.Scheme.Hom.comp_appLE`. Compose actual appLE maps and use δ≫ν=η.fromNormalization.
  Evaluate the equality of native section morphisms on r.

- For every inclusion V⊆U, res_N
  followed by `Δ_V` equals `Δ_U` followed by res_D, as actual ring morphisms `B_U→D_V`. k is an arbitrary field;
  a,b∈k and q=t²+at+b. Uses §2.62, `AlgebraicGeometry.Scheme.Hom.map_appLE`,
  `AlgebraicGeometry.Scheme.Hom.appLE_map`. Use native map_appLE and appLE_map; this naturality statement uses
  the actual δ and requires neither affinity nor nonemptiness.

- For every affine U, including
  U=∅, the actual map `Δ_U` is bijective. k is an arbitrary field; a,b∈k and q=t²+at+b. Uses §2.62. Split on
  nonemptiness. Apply the nonempty affine result or identify U with the empty open and apply the native
  empty-open result.

- For every open U⊂C, the
  actual map `Δ_U` is bijective, with no affinity or nonemptiness assumption. k is an arbitrary field; a,b∈k and
  q=t²+at+b. Uses §2.62, `CategoryTheory.ConcreteCategory.isIso_iff_bijective`. Use the proved scheme
  isomorphism δ. Its actual section maps are isomorphisms; the explicit preimage transport is also an
  isomorphism, so `Δ_U` is an isomorphism and hence bijective.

- For every open U⊂C, construct `Δ_U:B_U→D_U`
  as the actual δ.appLE on ν⁻¹U and η.fromNormalization⁻¹U, using δ≫ν=η.fromNormalization to transport the
  target open. k is an arbitrary field; a,b∈k and q=t²+at+b. Uses §2.58. Use the existing actual δ morphism
  and its from triangle; the construction retains the native ring homomorphism and actual open restriction.

- For nonempty affine U and
  `s∈B_U`, `θ_U(Δ_U(s)).val=κ_U(ζ.appLE(s))`. k is an arbitrary field; a,b∈k and q=t²+at+b. Uses §2.61, §2.62.
  Apply the θ generic-value formula to `Δ_U(s)`, then the actual generic-point section triangle.

- For every nonempty open U and `s∈B_U`,
  `κ_U(ζ.appLE(s))=σ.inv(germ_N(s))`. Affinity is not required. k is an arbitrary field; a,b∈k and q=t²+at+b.
  Uses §2.60, §2.57, `TauCeti.AlgebraicGeometry.Scheme.genericPoint_mem`,
  `TauCeti.AlgebraicGeometry.Scheme.fromSpecFunctionField_preimage`,
  `AlgebraicGeometry.Scheme.fromSpecStalk_app`, `AlgebraicGeometry.Scheme.ΓSpecIso_naturality`. Use the native
  generic-point preimage theorem and generic-point membership for ν⁻¹U. Expand the actual fromSpecStalk
  section map; native ΓSpecIso naturality for Spec.map(σ.inv) gives the specified σ.inv value.

- For every nonempty
  affine U, the actual map `Δ_U` is bijective. k is an arbitrary field; a,b∈k and q=t²+at+b. Uses §2.62, §2.61.
  Identify `Δ_U` with `Ψ_U⁻¹` pointwise and use bijectivity of the existing algebra equivalence.

- The actual map `Δ_∅` is
  bijective between the two native empty-open section rings. k is an arbitrary field; a,b∈k and q=t²+at+b.
  Uses §2.62. Each preimage of the empty open is empty. Native scheme sections on the empty open are
  subsingleton; injectivity and surjectivity follow without any generic-point or nonempty witness.

- For every affine U⊂C, the actual
  δ.app(ν⁻¹U) is an isomorphism in CommRingCat. k is an arbitrary field; a,b∈k and q=t²+at+b. Uses §2.62,
  `CategoryTheory.ConcreteCategory.isIso_iff_bijective`. The `Δ_U` bijection is a native ring-category
  isomorphism. Its factorization as δ.app followed by transport along the equality of preimages cancels the
  right-hand transport isomorphism.

- For every field k and a,b∈k, the actual
  comparison δ:η.normalization→N is an isomorphism of schemes. k is an arbitrary field; a,b∈k and q=t²+at+b.
  Uses §2.62, §2.58, §2.47, `AlgebraicGeometry.IsZariskiLocalAtTarget.iff_of_iSup_eq_top`,
  `AlgebraicGeometry.iSup_affineOpens_eq_top`, `TopologicalSpace.IsOpenCover.comap`,
  `AlgebraicGeometry.isIso_morphismRestrict_iff_isIso_app`. The finite map ν is affine, so the opens ν⁻¹U for
  affine U⊂C form an affine cover of N. The integral comparison δ is affine. The preceding actual section
  isomorphisms, including the empty open, give isomorphisms on the restrictions; target locality assembles δ
  as a scheme isomorphism.

- I.hom=δ as actual scheme morphisms. k is an arbitrary
  field; a,b∈k and q=t²+at+b. Uses §2.62. Read the forward map of the native asIso construction.

- I.hom≫I.inv is the identity on η.normalization. k
  is an arbitrary field; a,b∈k and q=t²+at+b. Uses §2.62. Use the native scheme isomorphism hom/inverse
  identity.

- I.inv≫I.hom is the identity on N. k is an
  arbitrary field; a,b∈k and q=t²+at+b. Uses §2.62. Use the native scheme isomorphism inverse/hom identity.

- I.inv≫η.fromNormalization=ν as actual scheme
  morphisms N→C. k is an arbitrary field; a,b∈k and q=t²+at+b. Uses §2.62, §2.58. Replace η.fromNormalization
  by δ≫ν, identify δ with I.hom, and cancel I.inv≫I.hom.

- ζ≫I.inv=η.toNormalization as actual scheme
  morphisms `Spec K_C→η.normalization`. k is an arbitrary field; a,b∈k and q=t²+at+b. Uses §2.62, §2.58. Replace
  ζ by η.toNormalization≫δ, identify δ with I.hom, and cancel I.hom≫I.inv.

- Construct I:η.normalization≅N whose hom is exactly the
  existing actual comparison δ. k is an arbitrary field; a,b∈k and q=t²+at+b. Uses §2.62,
  `CategoryTheory.asIso`. Use the proved native IsIso instance for δ and the existing categorical asIso
  construction; its inverse is the categorical inverse of δ.

- For every open U and `s∈B_U`,
  `Λ_U(s)=Δ_U(s)`. k is an arbitrary field; a,b∈k and q=t²+at+b. Uses §2.62. The native ring equivalence of the
  actual bijective morphism has its specified underlying function.

- For every open U and
  `s∈B_U`, `Λ_U⁻¹(Δ_U(s))=s`. k is an arbitrary field; a,b∈k and q=t²+at+b. Uses §2.62. Use the inverse/forward
  identity of the native algebra equivalence.

- For every open U and
  `s∈D_U`, `Δ_U(Λ_U⁻¹(s))=s`. k is an arbitrary field; a,b∈k and q=t²+at+b. Uses §2.62. Use the forward/inverse
  identity of the native algebra equivalence.

- For every open
  U and `r∈A_U`, `Λ_U⁻¹(η.fromNormalization.app(U)(r))=ν.app(U)(r)`. k is an arbitrary field; a,b∈k and q=t²+at+b.
  Uses §2.62. Use the native `A_U`-algebra commutation law of the inverse equivalence, with the actual section
  actions.

- For every V⊆U and `s∈B_U`,
  `Λ_V(res_N(s))=res_D(Λ_U(s))`. k is an arbitrary field; a,b∈k and q=t²+at+b. Uses §2.62. Evaluate the
  previously proved actual ring-morphism restriction equality; the new equivalence has Δ as its forward
  function.

- For every V⊆U and
  `s∈D_U`, `Λ_V⁻¹(res_D(s))=res_N(Λ_U⁻¹(s))`. k is an arbitrary field; a,b∈k and q=t²+at+b. Uses §2.62. Apply
  injectivity of `Λ_V`, use its restriction identity and both native inverse identities. The result holds even
  for empty or nonaffine opens.

- For every nonempty
  affine U, `Λ_U=Ψ_U⁻¹` as `A_U`-algebra equivalences. k is an arbitrary field; a,b∈k and q=t²+at+b. Uses §2.62.
  Use extensionality of the native algebra equivalences and the pointwise identification of `Δ_U` with `Ψ_U⁻¹`.

**Checks.**

- For a=b=0 and every open U, `Δ_U` sends the actual ν pullback of `r∈A_U` to the actual η.fromNormalization
  pullback of r.

- For k=F₂ and a=b=1 and nonempty affine U, the actual `Δ_U(s)` equals `Ψ_U⁻¹(s)` for every `s∈B_U`.

- For every a,b, the actual `Δ_∅` is bijective between the native empty-open section rings.

- For a=b=0, I.hom≫ν=η.fromNormalization as actual scheme morphisms.

- For k=F₂ and a=b=1, ζ≫I.inv=η.toNormalization as actual scheme morphisms.

- For every a,b, the actual δ is a scheme isomorphism while the original affine pinch inclusion `A_q→k[t]` is
  not surjective; these are distinct morphisms.

- For a=b=0 and every open U, `Λ_U⁻¹` sends the actual η.fromNormalization pullback of `r∈A_U` to the actual ν
  pullback of r.

- For k=F₂ and a=b=1 and every V⊆U, the actual Λ maps commute with native section restriction, without
  affinity or nonemptiness assumptions.

- For every a,b, `Λ_∅` is bijective even though the empty open has no Nonempty witness; it cannot be represented
  by a generic-field equivalence requiring such a witness.

- For every open U⊂C, construct `Λ_U:B_U≃ₐ[A_U]D_U` from the actual bijective `Δ_U` and its actual coefficient
  compatibility. No affinity or nonemptiness assumption is imposed.

*Needs:* §2.58; `AlgebraicGeometry.Scheme.Hom.appLE_comp_appLE`; §2.61; §2.60; §2.57;
`TauCeti.AlgebraicGeometry.Scheme.genericPoint_mem`;
`TauCeti.AlgebraicGeometry.Scheme.fromSpecFunctionField_preimage`;
`AlgebraicGeometry.Scheme.fromSpecStalk_app`; `AlgebraicGeometry.Scheme.ΓSpecIso_naturality`;
`AlgebraicGeometry.Scheme.Hom.comp_appLE`; `AlgebraicGeometry.Scheme.Hom.map_appLE`;
`AlgebraicGeometry.Scheme.Hom.appLE_map`; `CategoryTheory.ConcreteCategory.isIso_iff_bijective`; §2.47;
`AlgebraicGeometry.IsZariskiLocalAtTarget.iff_of_iSup_eq_top`; `AlgebraicGeometry.iSup_affineOpens_eq_top`;
`TopologicalSpace.IsOpenCover.comap`; `AlgebraicGeometry.isIso_morphismRestrict_iff_isIso_app`;
`CategoryTheory.asIso`; `RingEquiv.ofBijective`.

### Examples

For q=t², x=t² and y=t³ give the cusp y²=x³. The infinity ring is k[u,z]/(z−u³), so the chart transition has
u=1/t and z=1/t³. For q=t²+t+1 over F₂, x=q and y=tq give the nonsplit node; q has no binary root and the four
projective equation points agree with Q+2 at Q=2. Over F₄ the conductor splits and the count is four again,
now Q rather than Q+2. The two-component pinch has six points over F₂ and eight over F₄. Its two vertices are
already defined over F₂ while its two edges are exchanged. For F2Model 3, the point (1,0) has order four and
doubles to (0,0), witnessing cyclicity.

### Dependencies

Layer 1; StableReduction Layers 1–2 and 4–6; AlgebraicCurves Layers 10 and 12; JacobianChallenge Layers A–F;
ReductiveGroupsPartII §RG2.3.7; EllipticCurves Layers 1, 3 and 4; ComplexComparisonPartII
§§C3.2d.2–C3.2d.4; foundational intersection and polarized descent.

The section numbers group the targets by topic: the fibre geometry (§§2.1–2.16), the five binary curves
(§§2.17–2.25) and the pinching charts (§§2.26–2.62). The build order, in which every `*Needs:*` reference
points to an earlier target, is §§2.1–2.6, §§2.15–2.16, §§2.9–2.10, §§2.13–2.14, §§2.23–2.25, §§2.17–2.22,
§2.27, §2.29, §2.32, §2.26, §§2.33–2.62, §2.28, §2.30, §§2.7–2.8, §2.31, §§2.11–2.12: the one-component
cohomology §2.28 and the two nonsplit pinches §§2.7–2.8 are stated with the fibre theory that uses them, and
are built once the chart comparison chain ending in §2.62 is available.

## Layer 3: multiple fibers and local isogenies

### 3.1 transverse horizontal DVR divisor

For the proper regular genus-one model of the multiple-fiber argument over an excellent henselian DVR, and a
rational point of its smooth reduced elliptic fiber, construct a horizontal Cartier divisor D=Spec R′ through
that point. R′ is a finite DVR over R with the same residue field. In local parameters `π=u v^m` and a
transverse parameter w, quotient by w to see that `D∩X_red=Spec k` but `D⊗_R k` has length m. EGA's henselian
finite-component theorem globalizes this local divisor.

EGA IV₄ Theorem 18.5.11(c), pp. 130–132, applies to the separated locally finite-type horizontal curve at its
quasi-finite closed point. Its finite local component is obtained through Zariski’s Main Theorem and the
henselian product decomposition. The regular local quotient is a DVR; properness closes the chosen horizontal
divisor globally. The base parameter has valuation m, so the schematic fiber cannot be reduced when m>1.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 8.1 proof, pp. 21–22, using EGA IV₄
18.5.11(c); arXiv v3.)

**Checks.**

- For m>1 the special fiber is nonreduced of length m, even though the residue extension has degree1.

*Needs:* `TauCeti.Model`; §2.2; SchemeAndStackFoundations SF.0, quotient/localization/flat-module
contracts; StableReduction Layer 4.

### 3.2 normal model after transverse base change

After this DVR base change, normalize the closure of the generic isomorphism's graph between X and the
good-reduction elliptic scheme. Prove the resulting Y is normal, proper and flat, dominates both models, has
the given geometrically integral generic curve and satisfies `f_*O_Y=O_R′`. Extend the generic origin to a
section by properness. Excellence is used for finite normalization, not as a substitute for normality or the
Stein comparison.

R excellent henselian; D=Spec R′ as in §3.1.

Excellence gives finiteness of normalization, so the normalized model remains proper. Take the normalized
closure of the graph of the generic isomorphism; use properness to extend the generic section along Spec R′.
Use integrality and torsion-freeness over a DVR for flatness; prove generic geometric integrality and
`f_*O_Y=O_R′` by normality and Stein factorization.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 8.1 proof, pp. 21–22; Raynaud 6.1.4 and
8.2.1; arXiv v3.)

**Checks.**

- The base-changed model may be nonnormal; a claimed section cannot remove normalization.

*Needs:* §3.1; `TauCeti.Model`; SchemeAndStackFoundations SF.0, quotient/localization/flat-module
contracts; SchemeAndStackFoundations SF.3, Picard/Brauer and curve-cohomology contracts; StableReduction
Layer 4.

### 3.3 cohomological flatness and genus of the dominating fiber

Verify Raynaud (N)* on Y using normality, the absence of embedded points and the preceding Stein equality. Its
section supplies the degree-one hypothesis of the cohomological-flatness criterion. Hence its special curve C
has h⁰=1; proper-flat constancy of χ=0 and vanishing above degree one give h¹=1, including nonreduced C.

Check local Noetherian normality and the generic-fiber condition of Raynaud6.1.4 (N)* on Y; use the preceding
node for the Stein condition. Apply the owner’s Raynaud8.2.1 criterion with the lifted section. Use proper
flat Euler-characteristic constancy, finite-dimensionality and degree≥2 vanishing; solve h⁰−h¹=0.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 8.1 proof, pp. 21–22; Raynaud 6.1.4 and
8.2.1; arXiv v3.)

**Checks.**

- A section alone is not a proof of every hypothesis of Raynaud’s criterion.

- Over an algebraically closed field of characteristic two, let E be ordinary and 0≠τ∈E[2], and let the
  involution (P,s)↦(P+τ,s/(1+s)) act freely on E×Spec k[[s]]. The quotient is regular, proper and flat over
  k[[t]] with t=s²/(1+s), has genus-one generic fibre and f_*O=O, and its closed fibre is 2F. Since
  s/(1+s)≡s modulo s², the conormal of F is trivial, so h⁰(O_2F)=2 and χ=0 gives h¹(O_2F)=2. Euler
  characteristics agree, 2−2=1−1=0, while h¹ jumps from 1 to 2: χ-constancy holds, `R¹f_*O` is not locally
  free, and the conclusion h⁰=1 genuinely needs the Raynaud input.

- In the tame example (E×Spec ℂ[[s]])/((P,s)↦(P+τ,−s)) the conormal of F is the nontrivial 2-torsion line
  bundle, h⁰(O_2F)=1 and h¹(O_2F)=1; this is the cohomologically flat case.

*Needs:* §3.2; AlgebraicModuliForArithmeticGeometry Layer 7 §7.3, Raynaud cohomological flatness;
SchemeAndStackFoundations SF.3, Picard/Brauer and curve-cohomology contracts; StableReduction Layer 2.

### 3.4 genus under domination of an elliptic curve

If an integral proper k-curve C dominates an elliptic curve E, prove `h¹(O_C)≥1` over any field k. The morphism
is finite and nonconstant; the pullback/norm composition on Pic⁰(E) is multiplication by its positive degree.
If h¹ vanished the connected Picard object of C would be trivial, contradicting this composition. The argument
includes inseparable maps.

A nonconstant proper map of integral curves is finite of positive degree d. Pullback and the divisor norm
compose as multiplication by d on Pic⁰(E). If `h¹(O_C)=0` the connected Picard object is trivial, whereas E has
geometric points outside E[d]; derive the contradiction.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Lemma 8.4, pp. 23–24; arXiv v3.)

**Checks.**

- The norm argument covers inseparable maps; do not invoke a separable Hurwitz formula without its hypothesis.

*Needs:* StableReduction Layer 4 component intersections; SchemeAndStackFoundations SF.3, Picard/Brauer and curve-cohomology contracts;
SchemeAndStackFoundations SF.5 intersection/adjunction;
ComplexComparisonPartII §§C3.2d.2–C3.2d.3, Picard representability; EllipticCurves Layer 1.

### 3.5 regularity in the genus-one equality case

In this dominance setting `h¹(O_C)=1` forces C regular. Normalize C and compare H⁰ and H¹ over its constant
field: the normalization still has genus at least one, so the one-dimensional k-cohomology forces that
constant field to be k and the delta quotient to vanish. A noetherian normal curve is regular; smoothness over
an imperfect field is a separate assertion.

Normalize C; its normalization still dominates E and has h¹≥1 by §3.4. Use the
normalization exact sequence and compare H¹, including its vector-space structure over the normalization
constant field. The equality h¹=1 forces that field to equal k and the delta quotient to vanish, so C is
normal and hence regular.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Lemma 8.4, pp. 23–24; arXiv v3.)

**Checks.**

- Track both constant fields; equality of arithmetic genera without that argument is insufficient.

*Needs:* §3.4; SchemeAndStackFoundations SF.3, Picard/Brauer and curve-cohomology contracts;
StableReduction Layer 1.

### 3.6 unique component dominating the reduced fiber

In the special fiber of Y, prove exactly one reduced component dominates the reduced special fiber of X. Every
such component contributes at least one to h¹, whereas the whole fiber has h¹=1. The strict transform of the
smooth elliptic fiber of the good-reduction model supplies the same component; its genus-one equality and
birational comparison make it isomorphic to `E_k`.

Use the special-fiber map to the reduced curve and the normal birational model to obtain at least one
dominating component. Restriction from C onto the union of those reduced components has zero-dimensional
cokernel, so its H¹ map onto their direct sum is surjective. Each contributes h¹≥1, while h¹(C)=1. Thus only
one exists. Repeat with the strict transform of `E_k`; the positive-genus component is the same, and
birationality to the smooth `E_k` gives the isomorphism.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 8.1, pp. 21–22; arXiv v3.)

**Checks.**

- Contracted rational exceptional components are allowed; only dominating components are counted.

*Needs:* §3.2; §3.3; §3.4; §3.5; SchemeAndStackFoundations SF.3, Picard/Brauer and curve-cohomology
contracts.

### 3.7 multiple-fiber isogeny

Let R be excellent, E/R an elliptic scheme and X/R the relatively minimal regular model of an `E_F`-torsor with
elliptic reduced special fiber. Construct a k-isogeny `E_k→(X_k)_red`. First pass to henselization, proving
regularity, relative minimality and the fiber multiplicities are preserved; its residue field is unchanged.
Use the common positive-genus component to obtain a finite dominant map, then translate its image of the
origin to obtain a pointed isogeny over that original k.

Use the inverse of the unique-component isomorphism `E_k→C₁` and its finite dominant map to `X_k,red`. Translate
the image of the origin to the origin; the resulting pointed map between elliptic curves is an isogeny.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 8.1, pp. 21–22; arXiv v3.)

**Checks.**

- No equality of the multiple schematic fiber with `E_k` is asserted.
- For the trivial torsor X=E_R (multiplicity one) the reduced special fibre is `E_k` and the constructed
  isogeny is the identity.
- In the diagonal-quotient example of §3.10 with A elliptic and G of order n, the constructed map is the
  quotient isogeny A→A/G of degree n, equal to the fibre multiplicity; the dual isogeny A/G→A is not the
  constructed map.
- If the reduced special fibre is a nodal rational curve (a torsor with multiplicative reduction), no isogeny
  from `E_k` exists: the elliptic reduced fibre is a hypothesis of the statement, not a conclusion.

*Needs:* §3.6; EllipticCurves Layer 1.

### 3.8 counts over every finite residue extension

In this setting with `k=𝔽_q`, prove `#E_k(𝔽_(q^r))=#X_k(𝔽_(q^r))` for every r≥1. Apply finite-field isogeny
invariance to the reduced elliptic curve, then identify its field-valued points with the nonreduced schematic
fiber's. This requires only the forward isogeny/count implication.

Derive isogeny invariance of all extension counts: an isogeny φ:E→E′ over `𝔽_q` commutes with the q-power
Frobenius, so `φ∘(1−π_E^r)=(1−π_{E′}^r)∘φ`, and multiplicativity of degrees with `#E(𝔽_{q^r})=deg(1−π_E^r)`
(EllipticCurves Layers 1 and 3) gives equal counts. This is the easy direction of Tate's isogeny theorem, which
Schröer cites. The schematic fiber and its reduction have the same field-valued points.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Corollary 8.2, p. 23; arXiv v3.)

**Checks.**

- The F₂ isomorphism conclusion is not asserted over every finite field.

*Needs:* §3.7; EllipticCurves Layers 1 and 3.

### 3.9 multiple-fiber isomorphism over F₂

For k=F₂, strengthen the residue isogeny to an isomorphism by the five-class count criterion. This uses the
scheme-level presentation/classification comparison; equality of point sets or point groups by itself would
not prove the isomorphism.

Combine equal F₂ point counts with the five-class count criterion.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Corollary 8.3, p. 23; arXiv v3.)

**Checks.**

- The F₂ isomorphism conclusion is not asserted over every finite field.

*Needs:* §3.7; §2.22.

### 3.10 diagonal quotient multiple-fiber example

Let R be an excellent DVR containing k, A/k an abelian variety and G⊂A(k) a finite subgroup. Assume a G-Galois
fraction-field extension has a finite integral closure R′ that is one DVR, totally ramified and with residue
field k. Form the free diagonal quotient of A×Spec R′ using translations on A and the Galois action on R′.
Construct the invariant polarization and projective quotient. Its generic fiber is the descended A-form and
its reduced special fiber is A/G. These ramification hypotheses are additional to excellence.

Use the finite constant group G and the given G-Galois action on R′ together with translations on A. The
single-DVR, same-residue-field and total-ramification hypotheses are explicit; excellence alone does not imply
them. Effective projective quotient and descent are imported from AlgebraicModuliForArithmeticGeometry Layer
3, with an invariant affine covering and the requisite descended polarization.

Translation by a nonzero element of G has no fixed geometric point on A, giving a free diagonal action. Apply
effective quotient/descent to A×Spec R′; the reduced special fiber is A/G. Compute the generic descent cocycle
and the schematic special-fiber multiplicity from the totally ramified extension.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §8, p. 23; arXiv v3.)

**Checks.**

- Take an elliptic A and a nontrivial totally ramified extension to obtain a genuine multiple fiber.
- Over k=F₂ no cyclic extension of k((s)) of odd degree is totally ramified with residue field k, since F₂ has
  no nontrivial roots of unity; the Artin–Schreier extension u²+u=1/s with G=Z/2⊂E₂(F₂) gives a wild double
  fibre whose reduced fibre E₂/G has two rational points and is therefore E₂ again (§2.22).
- Freeness uses the translations: the action of G on A×Spec R′ through the Galois action on R′ alone fixes
  every point of A over the closed point of R′, so it is not free, and its quotient is A×Spec R with reduced
  special fibre A of multiplicity one.
- The multiplicity equals |G|: total ramification writes the uniformizer s of R as u^n times a unit of R′, so
  the special fibre of the quotient is the image of A×Spec R′/(uⁿ), of multiplicity n; for G trivial the
  construction returns A×Spec R.

*Needs:* AlgebraicModuliForArithmeticGeometry Layer 3 §3.5, effective polarized descent contract;
NeronModelsAndSemistableAbelianVarieties Layers 1–2, Néron models and component groups; local LLR extension in
Layer 3 here; SchemeAndStackFoundations SF.1, scheme/étale-space contracts.

### 3.11 geometric torsor Kodaira comparison

Let R be henselian with algebraically closed residue field, C/K a smooth proper geometrically connected
genus-one curve, E its Jacobian and m its local period in H¹(K,E). For their proper regular relatively minimal
models, prove that Jacobian geometric type T corresponds to full torsor fiber mT. Prove the required
discriminant/Lie-lattice, abelian/toric-rank, component-count and component-group comparisons before
distinguishing types. The period is the one over this strictly henselian fraction field; the period over a
preceding nonhenselian field may differ. This theorem is not an F₂-residue-field shortcut.

R is henselian; together with the algebraically closed residue field this makes R strictly henselian. For a
nonhenselian DVR the multiplicity comparison instead uses the period after passing to its strict
henselization, which may differ from the original K-period.

Develop the local comparison chain before the type argument. The canonical cohomology map is LLR Theorem 3.8,
pp. 481–482; the model discriminant is their §5, formula (21), p. 488, and Theorem 5.9, p. 493. The
component-group, cohomological-rank and component-count inputs are Facts 6.1, Lemma 6.3, Corollary 6.5 and
Proposition 7.1, pp. 494–500. Their exact residue-field scopes are specified below. The 2018 correction
concerns the global Artin–Tate/BSD comparison, not these local statements: a global application must retain
the obstruction index squared in corrected Theorem 4.3, pp. 593–595. Use henselianity and algebraically closed
residue at the last period/multiplicity specialization (2004, Theorem 6.6 and Remark 6.8, pp. 496–497).

Use the following named inputs, all developed in this local extension rather than imported as consequences of
semistable reduction. For a DVR R with fraction field K, a smooth projective geometrically connected genus-one
C/K and its Jacobian E, and proper regular models X and Eₘ, the local LLR cohomology map constructs
`τ_X:H¹(X,O)→H¹(Eₘ,O)`, compatible with the canonical generic-fiber Picard identification. Its kernel and
cokernel have finite R-length a,b; over perfect residue fields prove a=b. The construction passes through the
separated smooth Picard quotient `Q_X` and its map to the Néron model, keeping the obstruction between actual
line bundles and Picard-functor points. The local LLR discriminant comparison defines disc(X) using the valuation
of the Mumford determinant isomorphism on the two determinant lattices in LLR (21), and, for relatively
minimal regular models, proves disc(X)=disc(Eₘ)+12(b−a). This definition uses coherent determinant lines, not
an arbitrarily chosen Weierstrass discriminant of a torsor. Functoriality after an extension with a point
identifies the generic determinant maps; the determinant of `τ_X` moves the lattice by `π^(b−a)`, giving the sign
and factor twelve. Over perfect residue fields this proves equality.

For a proper flat regular curve X/R with `f_*O=O_R` and smooth geometrically connected generic fiber, let Γᵢ
be the irreducible components over k and let `eᵢ=length(k(Γᵢ)⊗_k kbar)` be their geometric multiplicities.
These eᵢ are not the coefficients of Γᵢ in the full fiber divisor. Set Mᵢⱼ=(Γᵢ·Γⱼ)/eᵢ and define `Φ_X`
as the torsion subgroup of coker(M:Zⁿ→Zⁿ).
the local LLR component group gives `Φ_X↠Φ_Q` over a strictly henselian DVR, an isomorphism under degree-zero
cohomological flatness, and `Φ_X≅Φ_J` over algebraically closed residue. For projective geometrically connected
curves over k, the curve Picard ranks Euler proves `rank T_ℓ(Pic⁰)=2𝔞+𝔱` and `χ_et=n+1−2𝔞−𝔱` for ℓ invertible in k,
with geometric component count n and abelian/toric ranks 𝔞,𝔱. The local LLR rank comparison identifies those ranks
with the Néron ranks over separably closed residue; its component-group conclusion is only on the prime-to-p
parts. Prove it by the prime-to-p multiplication and torsion comparisons in LLR Lemmas 7.2–3, pp. 498–499,
then compare growth of torsion cardinalities as in Proposition 7.1, pp. 499–500.

the local LLR component count gives `n_X=n_E` over perfect residue for minimal regular genus-one models. Its proof
uses the just established ranks, the equality of the generic H¹ representations, and the
conductor-discriminant identity in the proof of LLR Corollary 6.5, p. 496: with their positive conductor
convention, `disc(X)=χ_et(X_kbar)−χ_et(C_Kbar)+Swan(H¹(C_Kbar))`. This genus-one identity is a named proof input
the genus one conductor discriminant, with proper regular relatively minimal models and perfect residue as
hypotheses; the source here is LLR's explicit use of Saito, not a claim to have proved it from semistable
comparison. Finally the local LLR period multiplicity identifies the degree-cokernel period, the order of the
C-torsor, and the gcd of full fiber multiplicities when R is henselian with algebraically closed residue. Use
the boundary of `0→E→Pic_C→Z→0`, the local index/multiplicity comparison and Br(K)=0; the Brauer term cannot be
dropped over an arbitrary residue field.

Checks: a section gives period one and a=b=0; multiplicative `I_n` has n components and component-group order n;
III and IV have different component-group orders two and three; I₂* and IV* both have seven components but
orders four and three; replacing perfect residue by an imperfect field invalidates a=b and component-count
equality; replacing algebraically closed residue by F₂ invalidates period=multiplicity without the local
Brauer argument. In characteristic zero the prime-to-p qualification means the whole finite component group,
whereas in characteristic two it does not give the two-primary part. These are checks on each input's stated
scope, not a classification of arbitrary numerical diagrams.

([Liu–Lorenzini–Raynaud (2004)](https://www.math.u-bordeaux.fr/~qliu/articles/LLR.pdf), Theorem 6.6, pp.
496–497; Remark 6.8, p. 497; notation at p. 457; [Liu–Lorenzini–Raynaud
(2018)](https://www.math.u-bordeaux.fr/~qliu/articles/CorrigendumToNeronModelsLieAlg.pdf), Introduction and
corrected Thm4.3, pp593–595.)

**Checks.**

- Finite-field nonsplit I₁/I₂ require their own geometric descent nodes.

- Reject an unqualified global-period conclusion over `C[t]_(t−1)`: the translation twist of a constant elliptic
  curve by s²=t has period two but a smooth multiplicity-one special fiber.

*Needs:* NeronModelsAndSemistableAbelianVarieties Layers 1–2, Néron models, component groups and the
minimal-model smooth locus; local LLR extension in Layer 3 here; NeronModelsAndSemistableAbelianVarieties
Layer 3 §§3.8–3.9 and Layer 4, semistable Picard comparison; additive LLR extension
in Layer 3 here; EllipticCurves Layer 4; StableReduction Layer 5.

### Examples

Locally `π=u v^m` and D=(w) give R′/(π) of length m, while D∩(v=0) is one reduced rational point. For m=2 the
first length is two, so the reduced intersection cannot be used as the schematic special fiber. Henselization
preserves k, hence the constructed residue isogeny needs no residue-extension descent. Over F₂ its count
selects one Eᵢ; over a larger finite field equal count still implies isogeny invariance here but need not
identify an isomorphism class. LLR’s algebraically closed residue hypothesis prevents its local-period theorem
from being applied directly with k=F₂.

### Dependencies

Layers 1–2; StableReduction Layers 2, 4 and 5; AlgebraicModuliForArithmeticGeometry Layers 3 and 7;
ComplexComparisonPartII §§C3.2d.2–C3.2d.3; EllipticCurves Layers 1 and 3; the existing
Néron/semistable Picard interfaces, extended locally by the LLR targets here.

## Layer 4: canonical bundles, Picard lattices and global equations

### 4.0 rational-surface blowup prerequisites

Construct these three inputs for smooth projective surfaces before §§4.1–4.4. They do not require a
genus-one fibration or K²=0. Use the native blowups and geometric divisor/intersection carriers.

**Common resolution.** Prove that a birational map `S₁⇢S₂` between smooth projective
integral surfaces over an algebraically closed field admits a smooth projective common resolution,
with each projection a finite sequence of blowups at closed points. A geometrically rational surface
therefore has such a comparison with P² after extending constants to an algebraic closure. Resolve
the rational map and factor both proper birational projections into point blowups.

([Stacks, tag 0C5H](https://stacks.math.columbia.edu/tag/0C5H), Lemma 54.4.3;
[Stacks, tag 0C5R](https://stacks.math.columbia.edu/tag/0C5R), Lemma 54.17.1;
[Stacks, tag 0C5S](https://stacks.math.columbia.edu/tag/0C5S), Lemma 54.17.2.)

**Checks for the common resolution.**

- The identity map of P² admits the common resolution P² with both blowup sequences empty.
- The blowup of P² at a point admits itself as common resolution, with projections the blowup and identity.
- P¹×P¹ has a common point-blowup resolution with P², despite admitting no isomorphism to P².

**Picard and intersection comparison.** Prove that for the blowup π:S′→S of
a smooth projective integral surface at a point over algebraically closed k,
Pic(S′)=π*Pic(S)⊕Z[E], with E²=−1, π*D·E=0, pullback preserving intersections and
`K_S′=π*K_S+E`. Identify the kernel of restriction away from E, and compute its normal bundle `O_E(−1)`.

(Hartshorne, *Algebraic Geometry*, Chapter V, Proposition 3.2 and Proposition 3.3.)

**Checks for the Picard and intersection comparison.**

- Blowing up P² gives the matrix diag(1,−1) and K²=8.
- Blowing up again at a point of the first exceptional curve gives its strict transform square −2;
  the orthogonal basis uses its total pullback instead.
- Blowing up two distinct points gives disjoint exceptional curves with pairing zero and squares −1.

**Coherent vanishing.** Prove that for a smooth projective geometrically
rational surface over a field k, H⁰(O)=k, H¹(O)=H²(O)=0 and χ(O)=1. For a point blowup over algebraically closed
constants prove `π_*O=O` and `Rⁱπ_*O=0` for `i>0` using the affine charts and exceptional P¹ cohomology.
Leray transports coherent cohomology through the common resolution with P²; flat base change descends
the result to k.

(Hartshorne, *Algebraic Geometry*, Chapter V, Theorem 3.4 and Corollary 3.5;
[Schröer, v3](https://arxiv.org/pdf/2004.07025v3), proof of Proposition 6.1, p. 18.)

**Checks for the coherent vanishing.**

- P² has H⁰=k and H¹=H²=0, hence χ=1.
- P¹×P¹ has the same coherent cohomology, so the result does not require a morphism to P².
- Blowing up P² at a point leaves all these groups unchanged while changing K² from nine to eight.

*Needs:* SchemeAndStackFoundations SF.5 §§5.9–5.10, intersections and adjunction; StableReduction
Layer 4 blowups; JacobianChallenge Layers A–D and SchemeAndStackFoundations SF.2, coherent cohomology,
Leray and flat base change. The three inputs are constructed in the displayed order.

### 4.1 canonical bundle formula

Over an algebraically closed field, let f:S→B be relatively minimal genus one and write `R¹f_*O=L⊕T`, with L
invertible and T torsion. Construct `ω_S≃f*(ω_B⊗L⁻¹)⊗O(ΣaᵢFᵢ)`, where the multiple fibers are mᵢFᵢ, 0≤aᵢ<mᵢ and
aᵢ=mᵢ−1 for tame fibers. Establish `deg L⁻¹=χ(O_S)+length(T)`. The splitting need not be canonical; the
torsion-free quotient and the resulting formula are intrinsic.

Apply relative duality to split `R¹f_*O` into its rank-one quotient L and torsion T and construct the evaluation
`f*L⁻¹→ω_relative`. Use the vertical intersection radical to write its effective zero divisor as `Σa_iF_i`.
Bound `0≤a_i<m_i` by the pushforward equality; determine the tame coefficient by normal-bundle adjunction.

([Bombieri–Mumford](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1976d--EnrClass-II-NC.pdf), §1
Theorem2 and proof, pp27–30.)

**Checks.**

- The relative formula becomes absolute after tensoring by `f*ω_B`.

- For E×P¹→P¹: χ(O_S)=0, T=0 and L=O, so ω_S≃f*O(−2), of base degree −2.

- For a rational Jacobian elliptic surface over P¹: χ(O_S)=1, T=0 and L≅O(−1), so ω_S≃f*O(−1)=O(−F), of
  base degree −1.

- For a Jacobian elliptic K3 surface over P¹: χ(O_S)=2, T=0 and L≅O(−2), so ω_S≃O, of base degree 0; inverting
  L or omitting ω_B changes one of these three values.

- In the wild characteristic-two double fibre of §3.3 the torsion T has nonzero stalk, so `R¹f_*O` is not
  invertible and the tame value a=m−1 is not asserted there.

*Needs:* §2.1; §2.2; SchemeAndStackFoundations SF.3, Picard/Brauer and curve-cohomology contracts;
StableReduction Layer 2 relative duality; SchemeAndStackFoundations SF.5 intersection/adjunction;
StableReduction Layer 4.

### 4.2 degree of the genus-one Hodge line

Prove the Hodge-line degree by Leray and curve Riemann–Roch: `χ(O_S)=χ(O_B)−χ(L)−length(T)=−deg L−length(T)`.
Rearrangement gives `deg L⁻¹=χ(O_S)+length(T)`, with the sign and torsion contribution both retained.

Use Leray to write `χ(O_S)=χ(O_B)−χ(L)−length(T)`. Apply Riemann–Roch on B, `χ(L)=deg L+χ(O_B)`, and cancel the
base contribution.

([Bombieri–Mumford](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1976d--EnrClass-II-NC.pdf),
Theorem 2(iv), printed p. 27; proof of (iv), printed p. 29.)

**Checks.**

- For a rational surface with T=0, `L≅O_P¹(−1)`.

*Needs:* §4.1; SchemeAndStackFoundations SF.3, Picard/Brauer and curve-cohomology contracts;
StableReduction Layer 2.

### 4.3 tame and wild multiplicity comparison

For mF let ν be the finite order of `O_F(F)`. Prove ν divides m and a+1, tame is equivalent to ν=m and to the
base point lying outside supp T, and m/ν is a power of the characteristic exponent (equal to one in
characteristic zero). If `H¹(O_S)=0`, Leray forces T=0. Relate Raynaud's étale-local multiplicity and
specialization index to ν before using his characteristic-power theorem; it does not directly state this
normal-bundle formula.

Specialize Raynaud 6.1.4 and 6.3.5, pp. 48–49 and 54–55: after strict henselization verify (N)*, identify his
étale-local divisor index and specialization index with the normal-bundle order via the thickening/Picard
sequence, and only then transport the prime-to-characteristic comparison to m/ν. Bombieri–Mumford Proposition
4 gives the H⁰ jumps and the divisibilities ν|m and ν|(a+1).

([Bombieri–Mumford](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1976d--EnrClass-II-NC.pdf), §1
Proposition4 and following discussion, pp29–30.)

**Checks.**

- No claim that every fiber with reduced support is tame; multiplicity and torsion must be retained.

*Needs:* §4.1; §4.2; AlgebraicModuliForArithmeticGeometry Layer 7 §7.3, Raynaud and Picard-sheaf contracts;
SchemeAndStackFoundations SF.3, Picard/Brauer and curve-cohomology contracts.

### 4.4 canonical sheaf and section on a rational Jacobian

For a smooth geometrically rational relatively minimal Jacobian genus-one surface J→P¹ with section O, prove
`ω_J=f*O(−1)`, O²=−1 and `ω_(J/P¹)=f*O(1)`. Rationality gives χ=1 and H¹=0; a section rules out multiple fibers.
Apply the canonical formula and adjunction to the actual section P¹.

Rationality gives `χ(O_J)=1` and `H¹(O_J)=0`, so T=0. The section gives fiber multiplicity1, hence no correction
divisor; §4.2 gives L=O(−1). Tensor relative/absolute dualizing sheaves and apply adjunction to
the section P¹ to get E²=−1.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 6.1 proof, p. 18; arXiv v3.)

**Checks.**

- The formula remains geometric under descent over the original field; retain the chosen fibration.

*Needs:* §4.0; §4.1; §4.2; §4.3; SchemeAndStackFoundations SF.5 intersection/adjunction;
StableReduction Layer 2.

### 4.5 geometric Picard lattice of a rational elliptic surface

Construct the actual geometric intersection lattice of a smooth projective geometrically rational relatively
minimal Jacobian genus-one surface. Prove rank ten, odd unimodularity and signature (1,9). Resolve a
birational map to P², use the blowup Picard decomposition and K²=0, and transport the form to the existing
integral-lattice carrier. An assumed rank-ten free module is not a replacement.

J is a smooth projective geometrically rational surface over k with a relatively minimal Jacobian genus-one
fibration `f:J→P¹_k` and its zero-section O; geometric lattice assertions are after extension to an algebraic
closure.

Use the common resolution, the Picard and intersection comparison and
the coherent vanishing from §4.0. P² has rank one and K²=9; each point blowup preserves
rank(Pic)+K²=10. Thus §4.4's K²=0 implies rank ten. Each blowup adds an orthogonal generator of square −1,
so unimodularity and the signature transport through the common resolution. The section witnesses oddness.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), proof of Proposition 6.1, p. 18; proof of Corollary
7.3, p. 21; proof of Proposition 9.5, p. 27; arXiv v3.)

**Checks.**

- For the nine-blowup model the diagonal Gram matrix is(1,−1,…,−1).
- Oddness is witnessed by O²=−1, from adjunction 2g(O)−2=−2=O²+K·O=O²−1 with K=−F (§4.4); it is not witnessed
  by rank and signature, since the even lattice U⊕E₈(−1) has the same rank ten and signature (1,9).
- The fibre–section plane (F,O) has Gram matrix [[0,1],[1,−1]] of determinant −1, and its orthogonal
  complement W (§4.9) is negative definite of rank eight and determinant one; in the basis (F,O,W) the Gram
  matrix is block diagonal but not diagonal.
- The rank formula rank(Pic)+K²=10 needs K²=0 from §4.4: P² blown up in eight points has K²=1 and rank nine,
  so it is not the lattice of a surface in this family.

*Needs:* §4.0; §4.4; SchemeAndStackFoundations SF.5 intersection/adjunction;
`TauCeti.IntegralLattice`; StableReduction Layer 4.

### 4.6 unimodular fiber–section plane

Prove F²=0, F·O=1 and O²=−1. The resulting determinant −1 and integral inverse matrix give an integral
orthogonal splitting, not just a rational splitting. For a class D, its plane projection is (D·O+D·F)F+(D·F)O.
This formula fixes the order and signs.

J is a smooth projective geometrically rational surface over k with a relatively minimal Jacobian genus-one
fibration `f:J→P¹_k` and its zero-section O; geometric lattice assertions are after extension to an algebraic
closure.

Compute the three intersections using the section and §4.4. The determinant is−1, so the
inverse matrix is integral; use it to project every divisor class onto span(F,O).

In the ordered basis (F,O), compute the integral Gram matrix [[0,1],[1,−1]], its determinant −1
and its integral inverse [[1,1],[1,0]]. Use the established geometric comparison to compute
the projection of any class.

**Checks.**

- For the fiber–section Gram matrix, F has square zero.
- For the fiber–section Gram matrix, O has square −1 and pairs with F as +1.
- For the fiber–section Gram matrix, F+O has square +1; changing the sign of O² fails this test.
- This plane is odd; it is not the even hyperbolic plane in the basis(F,O).

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 9.5 proof, p. 27; arXiv v3.)

*Needs:* §4.5; §4.4; `TauCeti.IntegralLattice.IsUnimodular`; SchemeAndStackFoundations SF.5
intersection/adjunction; rational-surface realization in Layer 4 here.

### 4.7 generic Picard restriction with vertical kernel

For proper flat f:S→B with S regular integral noetherian of dimension two, B regular integral of dimension one
and `f_*O=O`, prove `Pic(S)→Pic(S_K)` is surjective. Its kernel is generated by pullbacks from Pic(B) and vertical
component classes. Close a generic divisor in S and use regularity to obtain a Cartier divisor; after
subtracting the divisor of a generic rational function the remaining divisor is vertical.

Represent a generic line bundle by a divisor and take its closure in the regular total surface; codimension1
regularity makes it Cartier. If the restriction is principal, extend its rational function and subtract its
divisor; the remainder is vertical. Record pullbacks from Pic(B) inside the vertical kernel, including their
torsion.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), proof of Proposition 9.3(v), p. 25; proofs of
Propositions 12.2 and 12.3, pp. 42–43; arXiv v3.)

**Checks.**

- For a general base B the kernel cannot be generated by one chosen fiber; Pic(B) may have nontrivial
  degree-zero classes.

*Needs:* SchemeAndStackFoundations SF.3, Picard/Brauer and curve-cohomology contracts;
SchemeAndStackFoundations SF.5 intersection/adjunction; rational-surface realization in Layer 4 here;
StableReduction Layer 4.

### 4.8 geometric Shioda–Tate generation

Let f:S→B be a relatively minimal genus-one fibration as in §2.1 over algebraically closed constants, with B
an arbitrary smooth proper curve and a section O. Prove that Pic(S) is generated by f*Pic(B), the class of O,
the fibre components disjoint from O and the section classes. Split generic degree by O, identify generic
degree-zero line bundles with Jacobian points using the chosen origin, and extend the points to sections. The
quotient is the genuine generic Pic⁰/section group; no Brauer vanishing over finite-field function fields is
assumed. For B=P¹ one has f*Pic(B)=ℤF for a fibre F, which gives generation by O, F, the components disjoint
from O and the sections used for rational elliptic surfaces in §§4.9 and 5.3–5.8.

Apply the generic restriction of §4.7, whose kernel is generated by f*Pic(B) and vertical components, and split
the degree by O of degree1. A generic degree-zero line bundle corresponds to a Jacobian rational point because
the chosen origin kills the Brauer obstruction. Extend that point to a section by properness/minimal-model
theory; use vertical relations to eliminate the component meeting O. Only the specialization B=P¹ replaces
f*Pic(B) by ℤF.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), proof of Proposition 9.3(v), p. 25; after Theorem
9.4, p. 26, for B=P¹; Tetsuji Shioda, *On the Mordell–Weil lattices*, Commentarii Mathematici Universitatis
Sancti Pauli 39 (1990), §1, for the Néron–Severi form over an arbitrary base; the Picard form over a general
base is derived here from §4.7.)

**Checks.**

- The genus-one torsor version uses a horizontal divisor of index d and only actual Pic⁰ classes; it does not
  identify all Picard-functor rational points without obstruction control.

- Over ℂ take E:y²=x³+1 and B:y²=x³−x, which are not isogenous since their CM fields ℚ(√−3) and ℚ(i) differ,
  and S=E×B with O={0}×B. Let L=O_B((0,0)−∞), of order two. The sections are the constant sections {P}×B,
  whose classes restrict to 0 on O≅B in degree zero, and a fibre restricts with degree one; so O, F, the
  components and the sections generate no class restricting to L. The class f*L restricts to L on O, and it is
  among the generators of the general statement.

- For E×P¹→P¹ the group f*Pic(P¹) is ℤF, and the generators reduce to O, F and the constant sections,
  matching the rational-base specialization.

*Needs:* §4.7; §2.1; AlgebraicModuliForArithmeticGeometry Layer 7 §7.3, section/Picard-sheaf contracts;
ComplexComparisonPartII §C3.2d.4, Picard obstruction;
StableReduction Layer 5.

### 4.9 even rank-eight complement

For the geometric lattice above, prove `W=(F,O)^⊥` is negative definite, even unimodular and rank eight. Its
generators are the vertical components away from O and `v_P=(P−O)−(1+P·O)F`; their squares are −2 and −2−2P·O.
Mixed terms in a norm are doubled. Identify W with the sign-reversed E₈ lattice only after this construction.

J is a smooth projective geometrically rational surface over k with a relatively minimal Jacobian genus-one
fibration `f:J→P¹_k` and its zero-section O; geometric lattice assertions are after extension to an algebraic
closure.

Use the fiber–section splitting and rank10 to get rank8 and unimodularity. Use geometric Shioda–Tate to
generate W by vertical classes away from O and (P−O)−(1+P·O)F. Compute their norms as−2 or−2−2(P·O); mixed
terms are doubled, hence all norms are even. Hodge index on the complement of a positive vector in the
fiber–section plane gives negative definiteness.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 9.5 proof, p. 27; arXiv v3.)

**Checks.**

- The restriction W→a fiber root-lattice dual is not an isometry.

*Needs:* §4.6; §4.8; `TauCeti.IntegralLattice`; `TauCeti.IntegralLattice.IsUnimodular`;
`TauCeti.IntegralLattice.IsEven`; SchemeAndStackFoundations SF.5 intersection/adjunction; rational-surface
realization in Layer 4 here.

### 4.10 degree-bounded Weierstrass equations

Define `BoundedWeierstrass k` by a native curve over k[t] with natDegree bounds 1,2,3,4,6. Define
`rev_i(p)=Σ_(n=0)^i coeff(p,n)s^(i−n)` and the inverse chart by reversing each coefficient at its
weight. Prove the bounded chart, involution and discriminant weight-twelve identities. These definitions admit
singular and nonminimal equations and assert no rational-surface realization.

Refine the existing coefficient structure by five concrete degree bounds. Define the inverse-chart polynomial
by coefficient reversal in its specified weight.

For the light operations rev_i and the inverse chart, include the weight bound of rev_i for every
polynomial, involutivity of rev_i under natDegree≤i, inverse-chart boundedness at the five stated
weights, involutivity for bounded tuples, and the discriminant of the inverse chart under those bounds. The raw reciprocal constructor is defined even on an unbounded equation; global gluing and involutivity require boundedness.

**Checks.**

- Weight-six reversal sends 1 to t⁶, including over Z/4.
- Weight-six reversal sends t⁶ to 1.
- Weight-six reversal sends t⁷ to zero, so the degree bound in involutivity is necessary.
- The reciprocal chart of the zero tuple remains zero.
- The tuple (t,0,0,0,t⁶) has reciprocal sixth coefficient 1.
- Reversing (0,0,0,0,t⁷) twice does not recover the original tuple.
- The coefficient a₁=1 becomes s, not1, on the second chart.
- The coefficient a₆=t⁶ becomes1 on the second chart.
- All five zero coefficients satisfy the bounds but have Δ=0, so this carrier does not certify an elliptic
  curve.
- Every coefficient of weight i is recovered by a second reversal.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 6.1, p. 18).

The construction needs the following maps and laws.

- The underlying equation is the existing WeierstrassCurve k[t].

- The chart has coefficients `sⁱa_i(1/s)`, as the finite reversal sum.

- For a bounded tuple, applying the same weight reversal twice gives the original
  coefficient tuple (from involutivity of rev_i).

- Equality of the five coefficients implies equality of bounded equations.

- For a bounded tuple, the chart discriminant equals the weight12 reversal of the
  original discriminant.

- Under natDegree p≤i, rev_i(p) is Mathlib's `Polynomial.reflect i p`.

*Needs:* Mathlib `WeierstrassCurve` and `Polynomial.reflect`.

### 4.11 positive section twist cohomology

For n>0 on a rational Jacobian surface, prove `R¹f_*O(nO)=0` and `f_*O(nO)` is locally free of rank n, with
`f_*O(O)=O`. Start with evaluation at the smooth section point on each genus-one fiber, then use duality and
section exact sequences. At n=0 the rank formula fails and `R¹f_*O` is the Hodge line.

J is a smooth projective geometrically rational surface over k with a relatively minimal Jacobian genus-one
fibration `f:J→P¹_k` and its zero-section O; geometric lattice assertions are after extension to an algebraic
closure.

On a fiber, Serre duality reduces H¹(O(nO)) to H⁰(O(−nO)). For n=1 the evaluation at the smooth section point
is nonzero on the one-dimensional H⁰(O); for higher n use the section exact sequence. Use cohomology and base
change and Riemann–Roch to get rank n; exclude n=0 from that rank formula.

([Cossec–Dolgachev–Liedtke, 2024 author
edition](https://sites.lsa.umich.edu/idolga/wp-content/uploads/sites/1334/2024/08/EnriquesOne.pdf), Lemma4.4.1
and proof, pp394–396.)

**Checks.**

- At n=0, `f_*O=O` has rank1, not0.

*Needs:* §4.4; SchemeAndStackFoundations SF.3, Picard/Brauer and curve-cohomology contracts;
StableReduction Layer 2.

### 4.12 weierstrass rank-three splitting

Construct `f_*O(3O)≃O⊕O(−2)⊕O(−3)`. The section filtration first has O, then quotients O(−2) and O(−3); compute
the relevant Ext¹ through H¹ of positive twists on P¹ and choose splittings. Carry the chosen generators into
the cubic relation.

The section exact sequences give successive quotients O(−2),O(−3), after the initial O. Compute the relevant
Ext¹ by H¹ of positive-degree line bundles on P¹, hence both extensions split.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), proof of Proposition 6.1, p. 18; arXiv v3.)

**Checks.**

- For a general higher-genus base those Ext¹ groups need not vanish.
- On P¹ the two extension groups are Ext¹(O(−2),O)=H¹(O(2))=0 and Ext¹(O(−3),O⊕O(−2))=H¹(O(3))⊕H¹(O(1))=0, so
  the bundle is O⊕O(−2)⊕O(−3) of degree −5; the wrong sign O²=+1 would give quotients O(2), O(3) and degree +5.
- The successive quotients are the normal-bundle restrictions `O(nO)|_O ≅ O_P¹(n·O²) = O(−n)` for n=2,3, and the
  surjection f_*O(nO)→O(−n) uses R¹f_*O((n−1)O)=0 for n−1≥1 (§4.11); at n=1 the map f_*O(O)→O(−1) is zero,
  because f_*O(O)=O and O(−1) maps isomorphically onto R¹f_*O.

*Needs:* §4.11; §4.4; SchemeAndStackFoundations SF.3, Picard/Brauer and curve-cohomology contracts;
StableReduction Layer 2.

### 4.13 relative cubic contraction

Use the relative evaluation of `O_J(3O)` to obtain a normal cubic Z inside the quotient-convention
P(O⊕O(−2)⊕O(−3)). Prove precisely the vertical components disjoint from O are contracted. The induced
degree-three series on Z is relatively very ample; the original line bundle on J is not relatively very ample
when an exceptional vertical component has degree zero.

J is a smooth projective geometrically rational surface over k with a relatively minimal Jacobian genus-one
fibration `f:J→P¹_k` and its zero-section O; geometric lattice assertions are after extension to an algebraic
closure.

Use §4.11 to construct the rank3 evaluation map and the relative morphism. Compute its
restriction to each fiber: components of degree0 are contracted; degree3 on the genus-one contraction gives a
cubic embedding. Prove normality and the contraction here using the fiberwise evaluation and the blowup/intersection
operations; identify the image with the minimal cubic.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 6.1, p. 18).

**Checks.**

- A component disjoint from O has degree0 under `O_J(3O)`, obstructing very ampleness on J.

*Needs:* §4.12; §4.11; AlgebraicModuliForArithmeticGeometry Layer 1 §1.1, relative Proj contract;
StableReduction Layer 4.

### 4.14 global equation and inverse chart

Prove the cubic's two charts are a bounded global Weierstrass equation and its weight reversal. With x=s⁻²x′
and y=s⁻³y′, multiply by s⁶ to obtain aᵢ′=sⁱaᵢ(1/s). Construct the overlap isomorphism and identify each aᵢ
with a section of O(i); merely writing two equations does not establish the gluing.

J is a smooth projective geometrically rational surface over k with a relatively minimal Jacobian genus-one
fibration `f:J→P¹_k` and its zero-section O; geometric lattice assertions are after extension to an algebraic
closure.

Choose split generators with pole weights2,3 at O and compare their degree6 relation. Identify each
coefficient as a section of O(i); polynomial degree is at most i. Substitute x=s⁻²x′,y=s⁻³y′ and multiply the
equation by s⁶ to obtain all five weights.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 6.1, p. 18).

**Checks.**

- The transition uses s=1/t; no division of a polynomial in the same coordinate is called the second-chart
  polynomial.
- Model 1 of §6.1, (t,t,t²,t⁴,t⁵+t⁶), reverses to (1,s,s,1,1+s), again within the weights 1,2,3,4,6, with
  Δ′=s¹²·s⁻⁸=s⁴ and the split I₄ fibre at s=0; a coefficient a₆ of degree seven would reverse to s⁻¹, so the
  weight bounds are exactly what makes the second chart polynomial.
- The twists x=s⁻²x′, y=s⁻³y′ come from deg L=1 (§4.2): for E×P¹, with trivial Hodge line, the same five
  coefficients are constants on both charts and the transition carries no twist.
- The opposite twist x=s²x′, y=s³y′ gives aᵢ′=s⁻ⁱaᵢ(1/s), a polynomial in s only for aᵢ=0, so it cannot glue
  a nonconstant equation; the sign of the weights is fixed by the bounds deg aᵢ≤i.

*Needs:* §4.13; §4.12; §4.10; StableReduction Layer 2 relative duality.

### 4.15 coefficient nondegeneracy on two charts

For these globally minimal rational Jacobian equations, prove some coefficient is nonconstant and some aᵢ is
not divisible by tⁱ. All-constant coefficients give nonminimality at infinity, while all tⁱ-divisible
coefficients give nonminimality at zero. Preserve these assertions under global weight-preserving admissible
changes, not under arbitrary rational changes.

If all coefficients are constant, positive-degree reversal makes every second-chart coefficient divisible by
its weight power, contradicting global minimality. If each `a_i` is divisible by tⁱ, the t-chart is nonminimal
at0. Admissible transformations preserving the global line-bundle weights preserve the obstruction.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), remark after Proposition 6.1, pp. 18–19; arXiv v3.)

**Checks.**

- These necessary conditions alone do not establish minimality at every closed point.

*Needs:* §4.14; §4.10; EllipticCurves Layer 4.

### 4.16 quasielliptic characteristic and characteristic-two types

Prove a regular nonsmooth geometric genus-one generic curve can occur only in characteristic two or three. In
characteristic two, the fibers are II, III, `I*_(2n)`, III* or II*, with component counts 1,2,2n+5,8,9, and the
Jacobian section group is killed by two. With geometric Shioda–Tate, deduce `ρ=2+Σ(r_b−1)`; for ρ=10 the sum is
eight. This includes the nonsmooth compactification and genus-change arguments absent from the smooth-model
theorem.

The characteristic restriction is `regularGenusOne_char_two_or_three` in `Suggested.lean`,
using the actual scheme, coherent genus and regularity of every stalk over an arbitrary field.

Supply the regular genus one geometric genus change from the genus-change formula after purely inseparable
extension; the quasielliptic Picard additive compactification identifies the smooth connected Pic⁰ as a twisted
additive group and its regular completion; and the quasielliptic char two fiber realization analyzes the primitive
geometric fiber schemes. With a chosen origin, the resulting generic smooth group is killed by two, so its
Mordell–Weil rank is zero. The restriction and vertical-kernel proof then gives the displayed rank formula.
These are extensions of the imported curve and model theory; the allowed-type assertion must be proved on
actual schemes, not inferred from abstract affine diagrams (Schröer §11, Proposition 11.1 proof, p. 33;
Cossec–Dolgachev–Liedtke (2024), Theorem 4.1.3 and its following genus-one specialization, Proposition 4.3.1, Theorem 4.3.3 and
Corollary 4.3.22, pp. 361–362, 381–383, 393).

The precise genus-change reference is [Cossec–Dolgachev–Liedtke, 2024 author
edition](https://sites.lsa.umich.edu/idolga/wp-content/uploads/sites/1334/2024/08/EnriquesOne.pdf), Theorem
4.1.3 and the following genus-one specialization, pp. 361–362: for p≥3 each positive delta invariant is
divisible by (p−1)/2, and their sum is at most the arithmetic genus. For genus one, this forces p=3;
characteristic two is the remaining positive-characteristic case. For the actual quasielliptic Jacobian and
its regular completion use Proposition 4.3.1, pp. 381–382, and its local Picard/Néron comparison;
multiplication by p is zero after extension to the additive group and descends. The section-rank proof is
Theorem 4.3.3, pp. 382–383. The geometric fiber-type restriction is Corollary 4.3.22 and proof, p. 393, using
the genus-one type comparison, additive special groups and the already imported Kodaira dictionary. Checks: in
characteristic five a positive delta of genus one violates the divisor two; a simple cuspidal fiber is
nondegenerate in the quasielliptic case; the smooth elliptic product has nonzero abelian generic group and
cannot enter the additive argument.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), proof of Proposition 11.1, p. 33; arXiv v3.)

**Checks.**

- The generic cusp is not a smooth supersingular elliptic curve.

*Needs:* §2.1; §2.5; §4.8.

### 4.17 global regular minimal Jacobian fibration

Let K be the function field of an excellent DVR or an excellent regular curve over k, and let C/K be
regular proper geometrically integral with `H⁰(O_C)=K` and arithmetic genus one. Construct its unique
relatively minimal regular proper model X. Separately set E=Pic⁰(C/K). For smooth C this is an elliptic
curve; for nonsmooth C use the regular compactification of its smooth connected twisted additive group.
Construct the relatively minimal regular proper Jacobian model J of E, or of that compactification,
and extend E's identity to the distinguished section of J. A section of X requires a chosen K-point of C.
Regularity of either model does not assert geometric smoothness.

For smooth generic curves glue the imported unique local positive-genus minimal models along their
specified generic curve. Extend this model construction to regular nonsmooth C, independently of
the compactification of its Pic⁰. Apply it again to E or its regular compactification, using §4.16
for the nonsmooth Jacobian. Properness extends E's identity only on this second model. A chosen
point of C identifies C with its Jacobian compactification and yields the corresponding section of X.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §6, p. 19; §8, pp. 21–22; arXiv v3.)

**Checks.**

- Uniqueness here concerns positive arithmetic genus, not arbitrary genus0 minimal models.

- The §3.10 quotient over C[[t]] by a nonzero two-torsion translation and t=s² has a double fiber
  and no section of X; its Jacobian J has the identity section.

- A chosen point on a smooth C identifies X with the minimal model of its Jacobian, preserving that point.

*Needs:* §2.1; §4.16; ComplexComparisonPartII §§C3.2d.2–C3.2d.3, Picard representability;
StableReduction Layer 5.

### 4.18 tsen and Picard obstruction over algebraically closed constants

Over algebraically closed k, apply Tsen's Br(k(t))=0 and the Picard obstruction sequence to show every
k(t)-point of the proper curve's Picard functor is represented by a line bundle, assuming H⁰= k(t). This is
the consumer consequence only. Over F₂(t) no such Brauer-vanishing assertion is made; the Jacobian origin
kills the relevant obstruction in the generation argument.

Use the C₁ theorem for the one-variable function field over an algebraically closed constant field. Deduce
Brauer-group vanishing and apply the Picard-functor-to-line-bundle obstruction sequence. Restrict all uses to
those constants, or use a section to kill the obstruction in the Jacobian application.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), proof of Proposition 9.3(v), p. 25; arXiv v3.)

**Checks.**

- Br(F₂(t)) is not zero; the original finite-field invocation does not supply Mordell–Weil descent.

*Needs:* ComplexComparisonPartII §C3.2d.4, Picard obstruction;
SchemeAndStackFoundations SF.3, Picard/Brauer and curve-cohomology contracts; SchemeAndStackFoundations
SF.2, Tsen at tag 0A2M.

### Examples

The plane matrix has inverse [[1,1],[1,0]]. For D=O its projection is O; for D=F it is F. For P=O the
projected section vector is zero and −2−2(O·O)=0, which checks the norm sign. Reversing the constant
polynomial 1 at weight six gives s⁶, while reversing t⁶ gives 1. Reversal twice of t⁷ at weight six loses that
term, so its degree hypothesis is essential. At n=0, `f_*O=O` and `R¹f_*O=O(−1)`, whereas positive n gives rank
n and vanishing R¹. On an exceptional vertical component disjoint from O, `O_J(3O)` has degree zero and cannot
embed that component.

### Dependencies

Layers 2–3; StableReduction Layers 2, 4 and 5; JacobianChallenge; SchemeAndStackFoundations SF.2, SF.3 and SF.5;
AlgebraicModuliForArithmeticGeometry Layers 1 and 7; ComplexComparisonPartII §§C3.2d.2–C3.2d.4;
native IntegralLattices. The nonsmooth model, rational blowup and geometric lattice extensions are owned
in this layer.

## Layer 5: Frobenius, marked graphs and Picard constancy

### 5.0 projective-plane and point-blowup cohomology comparisons

Specialize EtaleCohomologyFoundations §§F.0.3, F.2.1–F.2.7, F.3–F.7 and F.10.1–F.10.5
(including F.10.2b) before the rational surface cycle class and §5.2. These sections supply
finite-coefficient operations, adic realization with derived completion, finiteness, duality,
purity/Gysin and cycle classes, projective bundles, blowups, geometric Frobenius and perfect-complex
traces. Use EtaleCohomologyFoundations §§0.9–0.11 for the compatible algebraic class and trace
normalizations, and
InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 for the curve, finite-coefficient
and rational trace formulas and the constant-sheaf point-count trace.
Coefficients are `ℚ_ℓ` for a prime ℓ invertible in the ground field; geometric cohomology is taken
after algebraic closure. Geometric Frobenius acts by q⁻¹ on `ℚ_ℓ(1)`, and finite extension uses
its corresponding power. The two comparisons below retain the supplied pullback, hyperplane,
exceptional Gysin and Tate-twist maps.

**Projective-plane cohomology.** Specialize the supplied projective-bundle formula as
the ℓ-adic cohomology of the projective plane: `Hⁱ(P²_𝔽̄q,ℚ_ℓ)` is
`ℚ_ℓ(−j)` for i=2j, j=0,1,2, and zero in other degrees. The hyperplane class generates H²(1),
its square generates H⁴(2), and its cube vanishes. Identify these generators with the actual
line cycle classes, preserving the supplied Frobenius and cycle-class compatibility.

([Milne, v2.21](https://www.jmilne.org/math/CourseNotes/LEC.pdf), §16 and Theorem 23.2.)

**Checks for the ℓ-adic cohomology of the projective plane.**

- The untwisted eigenvalues are 1,q,q², giving `#P²(𝔽_q)=1+q+q²`.
- Two different rational lines have the same H²(1) class and intersection one.
- H¹=H³=0 but H² has dimension one; replacing all positive cohomology by zero fails.

**Equivariant point-blowup cohomology.** Specialize the supplied blowup decomposition as
the ℓ-adic cohomology of a point blowup: for a smooth
projective surface S over `k=𝔽_q` or `𝔽̄_q`, ℓ≠char k, and a finite reduced closed subscheme Z,
construct `Hⁱ(Bl_Z S̄,ℚ_ℓ)≃Hⁱ(S̄,ℚ_ℓ)⊕H^(i−2)(Z̄,ℚ_ℓ)(−1)`, omitting negative-degree terms.
Use pullback and the exceptional divisor Gysin maps. Prove Galois equivariance, compatibility with
cycle classes and point permutations, preservation of H¹,H³, and agreement with the Picard
decomposition of §4.0. Each geometric point adds its exceptional class in H²(1); the finite
reduced center is smooth because the ground field is perfect.

([Milne, v2.21](https://www.jmilne.org/math/CourseNotes/LEC.pdf), §§16–17, Theorem 23.2 and
the blowup argument in the proof of Lemma 33.2; [Schröer, v3](https://arxiv.org/pdf/2004.07025v3),
proof of Corollary 7.3, p. 21. The twist is fixed by the geometric-Frobenius convention above.)

**Checks for the ℓ-adic cohomology of a point blowup.**

- Blowing up a rational point of P² adds one H² class of eigenvalue q and increases its count by q.
- Blowing up a degree-two point adds two conjugate geometric classes; their Frobenius trace is zero
  over `𝔽_q` and becomes 2q² over `𝔽_(q²)`.
- With Z empty the comparison is the identity and adds no cohomology or Picard generator.

*Needs:* §4.0; EtaleCohomologyFoundations §§F.0.3, F.2.1–F.2.7, F.3–F.7, F.10.1–F.10.5
(including F.10.2b) and §§0.9–0.11; InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4;
StableReduction Layer 4 blowups.

### 5.1 fiber-count data at rational base points

For a relatively minimal rational Jacobian elliptic surface over `P¹_F₂`, at each of its three rational
base points define `n_a` to be i for smooth Eᵢ,
`2r_a` for split multiplicative, `2r_a+2` for the fixed-component nonsplit multiplicative alternatives and `2r_a+1`
for additive. This is provisional count data until descent and splitting establish equality with the actual
fiber count. Constant Picard then gives `Σn_a=25`.

Use the verified `E_i` counts for smooth fibers and the split/nonsplit/additive count nodes after descent and
splitting have been proved. Enumerate the three F₂ rational base points and sum the actual fiber counts.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §9, after Proposition 9.3, pp. 25–26; arXiv v3.)

**Checks.**

- The formula2r+2 is used only after establishing nonsplit incidence.

*Needs:* §2.10; §2.11; §2.12; §2.13; §2.14; §2.22; §2.9.

### 5.2 picard constancy from resolved-surface point count

For a smooth projective geometrically rational surface over `𝔽_q` of geometric Picard rank ten, prove Picard
constancy is equivalent to `#J(𝔽_q)=1+10q+q²`. Construct the Galois-equivariant cycle-class isomorphism
`Pic(J̄)⊗ℚ_ℓ≃H²(J̄,ℚ_ℓ(1))`, with H¹=H³=0, from rational blowup comparisons. Frobenius acts on the lattice
through a finite group. Trace ten forces all its roots-of-unity eigenvalues to be one, and finite-order
semisimplicity forces identity. Compare the torsion-free étale Picard functor with that lattice. The count is
for J, not its singular cubic.

The specialized cycle-class target is the rational surface cycle class: identify the P² cohomology, then track
each blowup’s new Picard generator and H²(1) generator. A common blowup transports the result to J and proves
it Galois-equivariant. Proper duality supplies H⁰,H⁴ and H¹=H³=0. The trace is `1+q·tr(Frob|Pic_Qℓ)+q²`. The
discrete finitely generated lattice action is continuous and hence finite; choose a complex embedding to apply
Re(ζ)≤1, with equality only at ζ=1. Faithfulness of tensoring the torsion-free lattice with Qℓ gives identity
on the integral lattice. Compare the étale torsion-free Picard group scheme with this Galois module; the
criterion does not identify Picard-functor points with actual line bundles without the obstruction sequence.

Use the numerical expression `1+10q+q²` in the trace specialization for the resolved surface
under the cycle-class hypotheses. The numerical inequality `10+7+7<25` supplies the count
contradiction of §5.9.

**Checks.**

- Constant Picard scheme gives trace ten and count `1+10q+q²`, which is 25 at q=2 and 40 at q=3; the
  direction from the count to constancy is the one that needs the finite-order argument.
- P² blown up at three closed points of degree three (nine geometric points in three Frobenius 3-cycles) is
  geometrically rational of geometric Picard rank ten with Frobenius trace 1 on the lattice and exactly
  #P²(F₂)=7 rational points, since the nine exceptional curves carry no rational point; 7≠25 and its Picard
  scheme is not constant.
- A Frobenius of order two on the rank-ten lattice with eigenvalues (1⁸,(−1)²) has trace 6 and count
  1+6·2+4=17; with one eigenvalue −1 the count is 21; only trace ten gives 25, and trace ten forces every
  eigenvalue, a root of unity with real part at most one, to be one.
- A smooth rational ruled surface has rank two, so its q=2 count nine cannot be substituted into the rank-ten criterion.
- A singular Weierstrass cubic can have fewer rational points than its smooth resolution.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), §7 Proposition7.1 and proof, pp20–21.)

*Needs:* §4.0; §4.5; §5.0; SchemeAndStackFoundations SF.5 intersection/adjunction;
ComplexComparisonPartII §§C3.2d.2–C3.2d.4, Picard representability and obstruction.

### 5.3 geometric fiber root-basis comparison

Identify the components away from O with negative root lattices A₂, E₆ and `D_(m+4)` for IV, IV* and `I_m*`.
Transport the actual intersection matrix and marked basis to the existing ADE models. Compute discriminant
three in the first two cases and squared norm −1 for the nonspinor terminal dual weight in the D case.
Restriction to a dual root lattice is not assumed to preserve every ambient norm.

J/F₂ is a smooth projective geometrically rational relatively minimal Jacobian elliptic surface over P¹; the
fiber lies over a rational base point, and all geometric Mordell–Weil sections descend to F₂.

Use the geometric Kodaira intersection matrix to identify the integral root basis with the baseline ADE
coordinate model. For A₂ compute determinant3 directly from its2×2 Gram matrix; for E₆ use the baseline
discriminant theorem. For the nonspinor D terminal transport the baseline vector representative and its norm1
under the sign reversal.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 9.5, pp. 26–27).

**Checks.**

- Fix the selected terminal root before using a dual-basis weight; not all D fundamental weights have norm1.

*Needs:* §2.3; §4.9; `TauCeti.IntegralLattice.checkerboardLattice_form_checkerboardVector_self`;
`TauCeti.IntegralLattice.discriminant_typeE₆RootLattice`; `TauCeti.IntegralLattice`.

### 5.4 IV and IV* graph rigidity

For IV or IV* over a rational base point, assume every geometric section descends. If all sections met the
O-component, Shioda–Tate would make the A₂ or E₆ root sublattice an orthogonal direct summand of unimodular W,
contradicting its discriminant three. A descending second section fixes another vertex; the marked triangle or
affine E₆ graph then has trivial Galois action.

J/F₂ is a smooth projective geometrically rational relatively minimal Jacobian elliptic surface over P¹; the
fiber lies over a rational base point, and all geometric Mordell–Weil sections descend to F₂.

If every section meets the O component, geometric Shioda–Tate makes the corresponding A₂ or E₆ root sublattice
an orthogonal direct summand of the even unimodular W. That would make it unimodular, contradicting
determinant3. The descending second section fixes a second vertex. For IV this fixes all three vertices of the
triangle; for IV* use its marked weighted affine E₆ graph.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 9.5, pp. 26–27).

**Checks.**

- IV is a triangle with no terminal vertices, so a tree argument cannot be used.

*Needs:* §5.3; §4.9; §4.8; `TauCeti.IntegralLattice.IsUnimodular`.

### 5.5 `I_m*` graph rigidity by dual parity

For 1≤m≤4 and descending geometric sections, prove the paired terminal vertices of `I_m*` are fixed. If every
section met only the two already fixed terminals, the restriction image W→R* would be R+Zω for the nonspinor
weight ω. That weight pairs integrally with this image, including ω²=−1, so its embedding in `W_Q` pairs
integrally with all W. Unimodularity puts ω in W, contradicting evenness. Thus a descending section meets and
fixes a remaining terminal. This dual-membership argument replaces an invalid assumption that restriction is
isometric.

J/F₂ is a smooth projective geometrically rational relatively minimal Jacobian elliptic surface over P¹; the
fiber lies over a rational base point, and all geometric Mordell–Weil sections descend to F₂.

The component met by O and the nonspinor terminal are fixed by distances in the weighted graph. Suppose every
section meets one of those two components. Shioda–Tate shows that the restriction image W→R* is R+Zω, where ω
is the nonspinor terminal dual weight. ω pairs integrally with that image because it pairs integrally with R
and ω²=−1. Since W is unimodular, ω belongs to W. This contradicts the evenness of W; a descending section
therefore fixes one of the remaining terminals, and hence both.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 9.5, pp. 26–27).

**Checks.**

- Restriction to R* is not an isometry; its image’s norm cannot be transferred from the source vector.

*Needs:* §5.3; §4.9; §4.8; `TauCeti.IntegralLattice.IsUnimodular`; `TauCeti.IntegralLattice.IsEven`.

### 5.6 III*, II* and marked multiplicities

Enumerate the marked weighted affine E₇ and E₈ graphs. Their terminal multiplicities are (1,1,2) and (1,2,3);
once the O-component is fixed, the remaining weights and distances distinguish every branch. Prove their
automorphism group fixing that marking is trivial.

J/F₂ is a smooth projective geometrically rational relatively minimal Jacobian elliptic surface over P¹; the
fiber lies over a rational base point, and all geometric Mordell–Weil sections descend to F₂.

Enumerate the finite affine graphs with their source multiplicity vectors. The marked vertex and the remaining
terminal multiplicities/distances identify every branch and vertex.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 9.5, pp. 26–27).

**Checks.**

- Both graphs have three terminal vertices; there are two further terminals after marking O.

*Needs:* §2.3; §2.5.

### 5.7 additive graph rigidity

For the smooth rational Jacobian satisfying absence of I₀*, semistable graph descent and geometric-section
descent, prove every singular rational fiber graph descends. Handle I₁, II and III directly, use the
semistable condition for cycles, the marked exceptional graphs for III*/II*, and the preceding discriminant
and dual-parity arguments for `IV/IV*/I_m*`. The rank-eight root bound gives m≤4.

Treat I₁,II and III directly; use condition(iii) for every multiplicative cycle. Use the marked affine graph
lemma for III*,II* and the corrected `IV/IV*/I_m*` arguments. Exclude I₀* by condition(ii); rank8 bounds the
remaining star index by4.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 9.5, pp. 26–27).

**Checks.**

- The conclusion is about component and incidence descent; retain the singularity hypothesis.

*Needs:* §5.4; §5.5; §5.6; §2.5; §4.9.

### 5.8 picard constancy criterion

For a smooth geometrically rational relatively minimal Jacobian elliptic surface J/F₂, assume: every
nonrational geometric fiber is irreducible; I₀* never occurs; semistable graphs descend; at most one rational
base point has a singular semistable or smooth supersingular fiber; every geometric section descends; and the
specified `n_a` sum is 25. Prove Picard constancy by fixing the Shioda–Tate generators. Retain the count
assumption in this criterion, even though the graph/section argument uses a smaller subset of its hypotheses.

Use geometric Shioda–Tate generation by F,vertical components and sections. Condition(v) fixes every section
and condition(i) places reducible fibers over rational points. Use condition(iii) and corrected additive graph
rigidity to fix the component generators; the torsion-free étale Picard group then has trivial Galois action.
The stated point-sum assumption is retained; its relation to actual counts is §5.1.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Theorem 9.4, p. 26; arXiv v3.)

**Checks.**

- Do not omit condition(v); the equation list of §6.1 alone does not establish descent of every section.

*Needs:* §4.8; §5.7; §5.1; §5.2.

### 5.9 large rational fiber

For a constant-Picard binary rational Jacobian with at most one rational singular-semistable or
smooth-supersingular fiber, prove some rational fiber has at least six components. Otherwise I₀* exclusion
makes every additive fiber have at most three components and seven points. One possible multiplicative fiber
contributes at most ten and the other two at most seven: 25≤10+7+7=24 is impossible.

If all component counts are≤5, absence of I₀* bounds every additive fiber by3 components and hence7points.
There is at most one multiplicative or supersingular smooth fiber; a split cycle of at most5 components
contributes≤10, and a nonsplit small form contributes≤6. The other two fibers contribute≤7 each,
contradicting25≤10+7+7=24.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 10.1, p. 28; arXiv v3.)

**Checks.**

- The nonsplit point-count exception does not invalidate the upper bound10.

*Needs:* §5.1; §5.2; §2.14.

### 5.10 lang configuration inputs as used

Throughout, J→P¹_F₂ is a smooth projective geometrically rational relatively minimal Jacobian elliptic
surface over `P¹_F₂` with constant Picard scheme and at most one rational singular-semistable or
smooth-supersingular fibre (the classification family of §6.1), with geometric configuration of singular fibres
written over the rational points t=0, 1, ∞; r_a is the number of geometric components of the additive fibre,
E_n is a smooth fibre with n rational points and Ĩ_m a nonsplit I_m fibre. Prove the following configuration
exclusions. They are statements about which configurations occur; the coefficient normal forms are the
separate targets of §7.3.

- (C1) II+E₄+I₉ does not occur.
- (C2) If the configuration is III+I_m with 6≤m≤9 over rational points, then m=6 or m=8.
- (C3) With a nonzero functional j, an additive fibre at t=0 with r_a≥6 and smooth ordinary fibres at both
  other rational points, the configurations II*+E₂+E₄ and I₃*+E₄+E₄ do not occur: each forces a unique
  further geometric I₁ fibre, which is Galois invariant and so lies over a rational point.
- (C4) With a nonzero functional j, r_a≥6, a smooth ordinary fibre E_2i at t=1 and a split semistable fibre
  I_(r_c) at ∞ (so r_a+i+r_c=12), the only configurations are I₁*+E₄+I₄, III*+E₄+I₂ and II*+E₄+I₁; in
  particular IV*+E₄+I₃ is excluded because it forces a further geometric I₁ fibre over a rational point.
- (C5) With the same data but a nonsplit fibre Ĩ_(r_c) at ∞ (so r_c≤2 and r_a+i+r_c=11), the only
  configurations are III*+E₂+Ĩ₂, II*+E₂+Ĩ₁, I₂*+E₄+Ĩ₂, I₃*+E₄+Ĩ₁ and IV*+E₄+Ĩ₂; the remaining arithmetic
  solutions I₃*+E₂+Ĩ₂, III*+E₄+Ĩ₁ and I₄*+E₂+Ĩ₁ do not occur.
- (C6) With zero functional j there are at most three singular geometric fibres, all over rational points; a
  nonreduced fibre at t=0 forces a smooth fibre at t=1, and the configurations are I₁*+E₅+IV, IV*+E₅+III and
  IV*+E₃+IV.

Each exclusion is a separate statement with its own proof from fibre geometry, the Euler-number and
discriminant-valuation identities, Galois invariance of the singular geometric fibres and the
characteristic-two coefficient relations. The arithmetic of (C4)–(C5) is the 25-point count with n_c=2r_c for a
split and n_c=2r_c+2 for a nonsplit semistable fibre. (C5) is a new proof: the source treats the twisted case
as analogous and records only two of its five configurations.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Propositions 10.2–10.3, pp. 28–29; proof of
Theorem 10.4, pp. 30–31; proof of Theorem 10.5, pp. 31–32; Lang's configuration paper as cited there.)

**Checks.**

- Do not silently use Lang1994 on extremal surfaces for this more general claim.
- The count alone does not exclude II+E₄+I₉: it has 3+4+18=25 rational points, so its exclusion needs the
  independent configuration statement.
- The exclusion is about rational fibres over F₂; it says nothing about configurations over F₄.
- In the nonsplit case the count r_a+i+r_c=11 with r_c≤2 and i≤2 forces r_a≥7, and its eight arithmetic
  solutions are exactly the five configurations of (C5) together with the three excluded ones; the count does
  not separate them.
- IV*+E₄+I₃ has 15+4+6=25 rational points, so (C4) needs the extra-fibre argument and not the count.

*Needs:* §4.14; §5.1; EllipticCurves Layer 4.

### 5.11 reducible additive fiber

With the hypotheses of §5.9, prove a rational reducible additive fiber exists. If all
reducible fibers were multiplicative, the large `I_r` has 6≤r≤9. Parity and the 25-point sum force the other
fibers to be E₄ and II and r=9. Exclude that configuration by the independent configuration target §5.10.
The count argument alone does not exclude II+I₉.

If every reducible fiber is multiplicative, §5.9 gives `I_r` with `6≤r≤9`. The other rational
fibers must be ordinary smooth or II; parity and25points force II+E₄+I₉.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 10.2, pp. 28–29; arXiv v3.)

**Checks.**

- Without the configuration exclusion the parity count alone does not prove the theorem.

*Needs:* §5.9; §5.1; §4.5; §5.10.

### 5.12 unique additive fiber for nonzero j

In the same family, for nonzero functional j prove exactly one additive fiber. Its existence comes from
§5.11. The global a₁ is a nonzero section of O(1), so has a unique geometric zero; in
characteristic two c₄=a₁⁴. At a bad minimal fiber the additive criterion is Δ=0 and c₄=0. A smooth
supersingular fiber with Δ≠0 is not additive.

Nonzero functional j gives a₁ not identically zero; its global section of O(1) has exactly one geometric zero.
At a bad fiber the imported minimal-equation criterion says additive iff Δ=0 and c₄=0; c₄=a₁⁴ in
characteristic2. Use §5.11 for existence; the zero-divisor argument gives uniqueness.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 10.3, p. 29; arXiv v3.)

**Checks.**

- A smooth supersingular fiber has c₄=0 and Δ≠0 and is not additive.

*Needs:* §5.11; §4.14; `WeierstrassCurve.j_eq_zero_iff_of_char_two`; EllipticCurves Layer 4.

### 5.13 small additive configuration

If that unique additive fiber has at most five components, prove the rational configuration is III+E₄+I₈ up to
base automorphism. I₀* exclusion reduces its component bound to three. The large split `I_m` satisfies 6≤m≤9;
the independent configuration restriction of §5.10 gives III+I₆ or III+I₈. The count equation 25=5+2m+2n,
1≤n≤2, selects m=8 and n=2.

If the unique additive fiber has≤5 components, I₀* exclusion forces≤3. Large-fiber and rank bounds give a
split `I_m` with `6≤m≤9`; Lang restricts the combination to III+I₆ or III+I₈. The remaining ordinary `E_2n` fiber
contributes2n, and25=5+2m+2n forces m=8,n=2.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Proposition 10.3, p. 29; arXiv v3.)

**Checks.**

- The count equation is used only after the geometric fiber configuration is proved.

*Needs:* §5.12; §5.9; §5.1; §5.10.

### Examples

For q=2 the resolved-surface threshold is 1+20+4=25. If a finite-order rank-ten action has one eigenvalue −1
and nine +1, its trace is eight and the expression becomes 21, demonstrating why one maximal count detects
triviality. The D vector dual weight has square −1 after sign reversal; the argument puts that weight in the
dual of the whole W before invoking unimodularity, never equates its norm to the norm of an arbitrary preimage
under restriction. With all component counts ≤5, the sum bound is 24, which fails the threshold by one. A
smooth supersingular E₃ has c₄=0 but Δ=1 and is a negative control for “c₄=0 implies additive.”

### Dependencies

Layers 2 and 4; EtaleCohomologyFoundations §§F.0.3, F.2.1–F.2.7, F.3–F.7, F.10.1–F.10.5
(including F.10.2b) and §§0.9–0.11; InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4;
the projective-plane and point-blowup specializations of §5.0;
native integral-lattice duals and ADE comparisons; the rational cycle-class realization constructed in this layer.

## Layer 6: the fourteen-model classification list

### 6.1 fourteen-model classification list

Give the fourteen equations over F₂(t) representing the classification family: smooth projective
geometrically rational relatively minimal Jacobian elliptic surfaces over `P¹_F₂` with constant Picard scheme
and at most one rational singular-semistable or smooth-supersingular fibre. Establish their discriminants,
functional j-invariants, resolved fibres, local minimality on both charts and resolved F₂-counts. The equations
and their individual invariants below are Checks of this single list target; completeness is §7.4, pairwise
inequivalence of the models §§7.5–7.6 and the classification §7.7.

The equation list uses the native carrier `Fin 14→WeierstrassCurve F₂[t]`, with model i at
index i−1. Establish the five coefficient bounds, distinctness of the coefficient tuples and
each displayed discriminant together with `c₄ = a₁⁴`. The per-model invariants are Checks of
this list. Geometric equivalence is the relation of §7.2.

Models 1–8 are the nonzero-j equations in Schröer's Theorem 10.4 (p. 29), and models 9–11 are the zero-j
equations in Theorem 10.5 (p. 31). Models 12–14 complete the twisted semistable case in the proof of Theorem
10.4 (pp. 30–31). With a nonsplit semistable fibre at infinity and E₄ at t=1, the additional configurations
are I₂*+E₄+Ĩ₂, I₃*+E₄+Ĩ₁ and IV*+E₄+Ĩ₂; the last also has a geometric I₁ fibre at each conjugate point over
t²+t+1. The equations (t,1,t³,0,0), (t,t,t³,0,0) and (t,t²,t²,0,0) have those local types and rational-fibre
counts 15+4+6, 17+4+4 and 15+4+6. The printed table and the configuration list in Proposition 11.1 (p. 33)
omit these three configurations. The classification list therefore has eleven nonzero-j models and three
zero-j models.

For each equation use the weighted chart at s=1/t, with aᵢ′(s)=sⁱaᵢ(1/s) and
Δ′(s)=s¹²Δ(1/s). Local minimality means minimality at every closed point of each chart, including the
nonrational discriminant places. Compare the local Kodaira types with the actual resolved fibre schemes by
§2.3 and EllipticCurves Layer 4. The regular resolutions are smooth projective relatively minimal Jacobian
surfaces with Hodge line of degree one. Geometric rationality follows from the supporting theorem
the rationality of Hodge-degree-one Jacobians: over an algebraically closed field, a smooth projective relatively minimal
Jacobian elliptic surface over P¹ with Hodge degree one is rational. The section rules out multiple fibres
and gives cohomological flatness; `R¹f_*O=O(−1)` and Leray yield H¹(O)=0. The canonical formula gives ω=O(−F),
hence H⁰(ω²)=0. Prove and apply the surface rationality criterion, the characteristic-independent
Castelnuovo–Zariski equivalence between rationality and H¹(O)=H⁰(ω²)=0 for smooth projective surfaces over
an algebraically closed field. Its proof uses a moving rational curve and a ruled surface with genus-zero
base. The resolved counts and §5.2 give Picard constancy; the displayed fibre types give the rational-fibre
restriction.

([Liedtke, arXiv v4](https://arxiv.org/pdf/0912.4291v4), §4.5, Theorem 4.6, printed p. 21;
Schröer, [arXiv v3](https://arxiv.org/pdf/2004.07025v3), §6, pp. 18–19, for the Jacobian specialization.)

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Theorem 10.4 and proof, pp. 29–31; Theorem 10.5
and proof, pp. 31–32; Proposition 11.1, pp. 32–33; models 12–14 are the twisted semistable completion above.)

**Checks.**

Each row uses y²+a₁xy+a₃y=x³+a₂x²+a₄x+a₆ with coefficients in the order (a₁,a₂,a₃,a₄,a₆).
In the local-minimality column the two entries refer to the t-chart and s-chart respectively, at all their
closed points. The count column is the sum of the three resolved rational-fibre counts.

| Model | (a₁,a₂,a₃,a₄,a₆) | Δ | Functional j | Fibres at 0, 1, ∞ | Local minimality (t, s) | Resolved F₂-count |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | (t,t,t²,t⁴,t⁵+t⁶) | t⁸ | t⁴ | I₁*, E₄, split I₄ | minimal, minimal | 13+4+8=25 |
| 2 | (t,0,0,t³,t⁵+t⁶) | t¹⁰(t²+t+1) | t²/(t²+t+1) | III*, E₄, E₄ | minimal, minimal | 17+4+4=25 |
| 3 | (t,0,0,t³,0) | t¹⁰ | t² | III*, E₄, split I₂ | minimal, minimal | 17+4+4=25 |
| 4 | (t,t²,0,t³,0) | t¹⁰ | t² | III*, E₂, nonsplit I₂ | minimal, minimal | 17+2+6=25 |
| 5 | (t,0,0,0,t⁵) | t¹¹ | t | II*, E₄, split I₁ | minimal, minimal | 19+4+2=25 |
| 6 | (t,t²,0,0,t⁵) | t¹¹ | t | II*, E₂, nonsplit I₁ | minimal, minimal | 19+2+4=25 |
| 7 | (t,t,0,t⁴,0) | t¹² | 1 | I₄*, E₂, E₄ | minimal, minimal | 19+2+4=25 |
| 8 | (t,t,t,t,0) | t⁴ | t⁸ | III, E₄, split I₈ | minimal, minimal | 5+4+16=25 |
| 9 | (0,t,t²,0,0) | t⁸ | 0 | I₁*, E₅, IV | minimal, minimal | 13+5+7=25 |
| 10 | (0,0,t²,t³,0) | t⁸ | 0 | IV*, E₅, III | minimal, minimal | 15+5+5=25 |
| 11 | (0,0,t²,0,0) | t⁸ | 0 | IV*, E₃, IV | minimal, minimal | 15+3+7=25 |
| 12 | (t,1,t³,0,0) | t¹⁰ | t² | I₂*, E₄, nonsplit I₂ | minimal, minimal | 15+4+6=25 |
| 13 | (t,t,t³,0,0) | t¹¹ | t | I₃*, E₄, nonsplit I₁ | minimal, minimal | 17+4+4=25 |
| 14 | (t,t²,t²,0,0) | t⁸(t²+t+1) | t⁴/(t²+t+1) | IV*, E₄, nonsplit I₂ | minimal, minimal | 15+4+6=25 |

- In the discriminant column, model 1 has Δ=t⁸ and c₄=t⁴, giving j=c₄³/Δ=t⁴.
- In the discriminant column, model 2 has Δ=t¹⁰(t²+t+1), with a nonrational discriminant place.
- In the discriminant column, model 14 has Δ=t⁸(t²+t+1), distinct from model 12’s t¹⁰ despite equal resolved counts.
- Models 9–11 have c₄=0 and Δ=t⁸≠0, so their generic curves are smooth with j=0.
- The weight bounds are 1,2,3,4,6 for every row, including model 12's constant a₂=1.
- The nonsplit I₂ and I₁ counts are six and four, respectively, as in §§2.11–2.12.
- A product E×P¹ has Hodge degree zero and H¹(O)=1; an elliptic K3 surface has Hodge degree two and
  nonzero H⁰(ω²). Neither satisfies the Hodge-degree-one rationality hypotheses.

*Needs:* §§4.1–4.4 and §§4.10–4.14; §2.3; §§2.10–2.13; §§5.1–5.2; EllipticCurves Layer 4;
StableReduction Layers 2, 4 and 5; AlgebraicModuliForArithmeticGeometry Layer 7 §7.3 cohomological flatness;
the rational-surface and intersection constructions of Layer 4 here.

### 6.16 nonrational bad fibres in the eleven nonzero-j models

For the eleven nonzero-j models, prove all nonrational bad fibres are absent except in models 2 and 14.
Their closed point t²+t+1 has residue degree two and geometric type I₁. Factor the discriminant on both
charts, use local minimality and compare the local type with the resolved fibre scheme. At this point Δ has
valuation one and c₄ is a unit. A degree-two closed point represents two geometric fibres.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Theorem 10.4, p. 29, and twisted semistable case,
pp. 30–31, as completed in §6.1.)

**Checks.**

- Models 2 and 14 have precisely the finite nonrational factor t²+t+1 in their discriminants.
- This factor is irreducible over F₂ and has simple valuation; c₄=t⁴ is a unit there, giving geometric I₁.
- The closed point contributes no F₂-rational base point and splits into two geometric points over F₄.
- The other nine nonzero-j models have no nonrational bad place on either chart.

*Needs:* §6.1; §2.3; EllipticCurves Layer 4.

### 6.17 smooth nonrational fibres of zero-j models

For models 9–11, prove every nonrational fibre is smooth. On the finite chart Δ=t⁸, so every finite
nonrational point has nonzero discriminant. On the infinity chart Δ′=s⁴, whose only zero is the rational
point s=0. Use the locally minimal equations and the resolved-fibre comparison on both charts.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Theorem 10.5, p. 31.)

**Checks.**

- All three generic curves are elliptic because t⁸ is nonzero in F₂(t).
- The finite discriminant vanishes only at the rational point t=0.
- The reverse discriminant s⁴ vanishes only at the rational point at infinity.
- The smooth fibre at t=1 is E₅ for models 9 and 10 and E₃ for model 11.

*Needs:* §6.1; §2.3; EllipticCurves Layer 4.

### Examples

Models 12, 13 and 14 have resolved rational-fibre sums 15+4+6=25, 17+4+4=25 and 15+4+6=25.
The factor t²+t+1 in models 2 and 14 gives two conjugate geometric I₁ fibres. At infinity,
Δ′=s¹²Δ(1/s); a degree-ten discriminant has an infinity zero of order two.

### Dependencies

Layers 2–5 for global equations, resolved fibres and Picard constancy; the Hodge-degree-one rationality
argument of §6.1; EllipticCurves Layer 4 and the geometric-resolution comparison of §2.3;
StableReduction Layers 2, 4 and 5; AlgebraicModuliForArithmeticGeometry Layer 7 §7.3 cohomological flatness.

## Layer 7: admissible equivalence and classification

### 7.1 characteristic-two a₂ normalization

In characteristic two expand x↦x+a₂ to obtain a₂′=0, a₃′=a₃+a₁a₂, a₄′=a₄+a₂² and a₆′=a₆+a₂a₄; the equal
cubic terms cancel. Prove all five weight bounds remain valid and identify this normalization with the native
variable change. The bounded normalized coefficients give finitely many normal forms under §7.2.

Define `coefficientPolynomial n c=Σ_(j:Fin(n+1))cⱼtʲ` over any commutative ring as the inverse of Mathlib’s
`Polynomial.degreeLTEquiv k (n+1)` followed by the inclusion `degreeLT k (n+1) → k[t]`. Define
the coefficient space `(Fin 2→F₂)×(Fin 4→F₂)×(Fin 5→F₂)×(Fin 7→F₂)`, and the normalized equation with a₂=0.
Define the a₂-normalization by the expanded x-translation. Their properties are coefficient evaluation,
injectivity and the bounded-polynomial range of the coefficient polynomials,
injectivity and range of the normalized equation for the bounded a₂=0 slice, the weight bounds,
its expression as a variable change, its boundedness, vanishing a₂, idempotence and discriminant invariance
of the a₂-normalization. The two coefficient-polynomial laws use `Polynomial.degreeLTEquiv`’s
bijectivity and `Polynomial.mem_degreeLT`, with `Polynomial.degreeLT_succ_eq_degreeLE` translating the
degree bound. The geometric interpretation uses nonzero Δ and local minimality.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Theorems 10.4–10.5 and proofs, pp. 29–32.)

**Checks.**

- The coefficient polynomial of the zero vector is zero.
- The coefficient vector (0,1,0) gives t at weight two.
- The weight-zero coefficient vector (2) over Z/4 gives the nonzero nilpotent constant 2.
- The dimensions 2+4+5+7=18 give 4·16·32·128=2¹⁸ coefficient tuples.
- An a₆=t⁷ coefficient is outside the weight-six bound.
- The normalized equation of the zero vector has Δ=0, while the top a₆ coordinate gives t⁶.
- The slope vector (0,1) gives a₁=t with the other coordinates zero.
- An equation with a₂=0 is fixed by x-translation by a₂.
- Translating x by a₂ sends (t,t,0,0,0) to (t,0,t²,t²,0).
- Translating x by a₂ sends (0,1,0,0,0) to (0,0,0,1,0).

*Needs:* §4.10; §4.14; Mathlib `Polynomial.degreeLTEquiv`, `Polynomial.mem_degreeLT` and
`Polynomial.degreeLT_succ_eq_degreeLE`.

### 7.2 admissible fibration equivalence

Define the fibration equivalence between the smooth resolved Jacobian surfaces by an F₂-automorphism of P¹ and
an isomorphism over it preserving the zero-sections. Prove that it is exactly the equivalence induced by the
native Weierstrass changes with u=1, deg s≤1, deg r≤2 and deg q≤3, together with PGL₂(F₂). The base changes
act on the weight bundles; inversion uses the infinity chart and its denominator transport.

The global weights bound the coordinate changes, and the Weierstrass isomorphism theorem identifies every
pointed fibration isomorphism with such changes. A change can leave the a₂=0 slice; §7.1 gives a normalized
representative of its equivalent equation. The relation has reflexivity, symmetry and transitivity, and
transports fibre schemes and functional j, with j composed with the base automorphism.

Define the parameter space `(Fin 2→F₂)×(Fin 3→F₂)×(Fin 4→F₂)`, ordered (s,r,q), and the admissible change with
u=1, r=coefficientPolynomial 2 r, s=coefficientPolynomial 1 s and t=coefficientPolynomial 3 q. The final native
field is the y-translation q. Its basic laws give coefficient bounds, injectivity into native changes,
identity, composition, inverse and preservation of the global weights; injectivity and boundedness of the
admissible change state the coefficient-level injectivity and weight preservation. The geometric statements are
reflexivity, symmetry, transitivity, the equation criterion, preservation of j and transport of fibres, with the
smooth relatively minimal Jacobian hypotheses on both surfaces for the equation comparison.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Theorems 10.4–10.5 and proofs, pp. 29–32.)

**Checks.**

- There are 2²·2³·2⁴=512 translation triples; PGL₂(F₂) has six elements.
- The translation r=t² obeys the bound and r=t³ does not.
- Zero translation parameters give the identity.
- The middle translation vector (0,1,0) gives r=t and s=0.
- The first translation vector (0,1) gives s=t and r=0.
- Base inversion uses the weight-reversed chart and transports the zero-section; applying it twice gives the
  identity base map.
- A surface isomorphism moving the chosen zero-section to a different section does not satisfy the relation.

*Needs:* §7.1; §4.14; StableReduction Layer 5 uniqueness of relatively minimal models;
AlgebraicModuliForArithmeticGeometry Layer 1 §1.1 relative Proj; the native projective variable-change comparison.

### 7.3 characteristic-two normal forms at the additive fibre

Let J be in the classification family of §6.1 with global equation y²+a₁xy+a₃y=x³+a₂x²+a₄x+a₆ of §4.14, deg aᵢ≤i, minimal on
both charts, the additive fibre (or the nonreduced fibre if j=0) at t=0 and the configuration over t=0, 1, ∞
as named. Below cᵢ, dᵢ, eᵢ, fᵢ denote polynomials in t of degree at most i, and the allowed changes are the
admissible changes of §7.2: x↦x+r, y↦y+sx+w with r,s,w of weights 2,1,3, and base automorphisms of P¹ with
the matching weight rescaling. Prove the following six normal-form statements.

- (N1, configuration III+E₄+I₈, Lang case 2A) The equation can be brought to y²+txy+tc₂y=x³+tc₁x²+tc₃x+t²c₄
  with t∤c₂, t∤c₃ and Δ=t⁴. Changes with t|r and t|w give c₂=c₃=1; then Δ=t⁴(1+t³+t³c₁+t⁴c₄)=t⁴ forces
  c₁=1+αt, c₄=α, and α=1 gives E₂ at t=1. The result is model 8.
- (N2, configuration I₁*+E₄+I₄, Lang case 5A) The equation can be brought to
  y²+txy+t²c₁y=x³+td₁x²+t³e₁x+t⁴c₂ with t∤c₁ and t∤d₁; a change of coordinates gives c₁=1 and e₁=t. Then
  Δ=t⁸(1+t+td₁+t²c₂+t³+t⁴) and the unit factor equals one, so (c₂,d₁)=(t+t²,1) or (1+t+t²,1+t). The second
  has a nonsplit fibre at ∞, contrary to the configuration; the first is model 1.
- (N3, configuration I₄*+E₂+E₄, Lang case 5D) The equation can be brought to y²+txy=x³+td₁x²+t⁴x with
  deg d₁≤1 and t∤d₁, so d₁=1 or d₁=1+t. The base automorphism t↦t/(1+t) followed by x=u²x′, y=u³y′ with
  u=1/(1+t) exchanges the two, and d₁=1 is model 7.
- (N4, configuration III*+E₄+E₄, Lang case 7) The equation can be brought to
  y²+txy+t³c₀y=x³+t²d₀x²+t³e₁x+t⁵f₁ with t∤e₁; changes give c₀=0 and e₁=1, and then Δ=t¹⁰(1+tf₁).
  Singularity of the fibre over the closed point of degree two forces f₁=1+t, and d₀=1 gives E₂ at t=1, so
  d₀=0. The result is model 2.
- (N5, j=0, configuration I₁*+E₅+IV, Lang case 13A) The equation can be brought to
  y²+t²c₁y=x³+td₁x²+t³e₁x+t⁴d₂ with t∤d₁ and t∤c₁. Then Δ=t⁸c₁⁴ forces c₁=1, a change y↦y+sx gives d₁=1,
  and further changes remove the linear term of e₁ and the constant and quadratic terms of d₂, giving
  y²+t²y=x³+tx²+t³e₀x+t⁵d₀. Only e₀=d₀=0 gives E₅ at t=1; this is model 9.
- (N6, j=0, configurations IV*+E₅+III and IV*+E₃+IV, Lang case 14) The equation can be brought to
  y²+t²c₁y=x³+t²d₀x²+t³e₁x+t⁴d₂ with t∤c₁. Then Δ=t⁸c₁⁴ forces c₁=1, a change y↦y+sx gives d₀=0, and the
  equation becomes y²+t²y=x³+t³e₀x+t⁵d₀′. At t=1 the four values of (e₀,d₀′) give the fibres E₃, E₅, E₃, E₁
  for (0,0), (1,0), (0,1), (1,1). Only (e₀,d₀′)=(1,0) gives E₅ at t=1 (model 10). Two values give E₃ at t=1,
  and the fibre at ∞ separates them: the reversed coefficients are a₃′=s, a₄′=e₀s, a₆′=d₀′s, so (0,0) has
  type IV at ∞ (a₆′=0, b₈′=0, b₆′=s²) and realizes IV*+E₃+IV (model 11), whereas (0,1) has a₆′=s with s²∤a₆′
  and so the wild type II at ∞, giving the configuration IV*+E₃+II, which is not in (C6). The source's step
  that only (0,0) gives E₃ at t=1 omits (0,1); the exclusion of (0,1) is by its fibre at ∞.

The remaining configurations of (C4)–(C5) have the analogous normal forms obtained from Tate's algorithm at t=0:
II*+E₄+I₁ and II*+E₂+Ĩ₁ reduce to models 5 and 6, III*+E₄+I₂ and III*+E₂+Ĩ₂ to models 3 and 4, and
I₂*+E₄+Ĩ₂, I₃*+E₄+Ĩ₁ and IV*+E₄+Ĩ₂ to models 12, 13 and 14. These seven reductions are new proofs; the source
leaves the cases other than N1–N6 to the reader and omits the last three configurations.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), proof of Theorem 10.4, pp. 30–31, for N1–N4, and
proof of Theorem 10.5, p. 32, for N5–N6; the case labels are those of Lang's configuration paper as cited
there; EllipticCurves Layer 4 for Tate's algorithm.)

**Checks.**

- For N3, d₁=1 and d₁=1+t both give Δ=t¹². The excluded value d₁=0 also gives Δ=t¹², but violates t∤d₁:
  substituting x=t²X, y=t³Y turns y²+txy=x³+t⁴x into Y²+XY=X³+X, of discriminant 1, so that equation is
  not minimal at t=0. Discriminant and nondegeneracy alone do not identify the case.
- For N1, α=1 gives the tuple (t,t+t²,t,t,t²), still with Δ=t⁴, but its fibre at t=1 is E₂; the configuration
  III+E₄+I₈ needs α=0, and the Δ test alone does not exclude α=1.
- For N2, both solutions have unit factor one, so Δ=t⁸ for each; only the split fibre at ∞ selects model 1, and
  the other solution is not a second untwisted representative.
- For N4, f₁=0 gives Δ=t¹⁰ with no singular fibre over the degree-two point, which is the configuration of
  model 3 rather than III*+E₄+E₄; f₁=1+t gives Δ=t¹⁰(t²+t+1), as in model 2.
- For N5 and N6, c₁=1+t gives Δ=t⁸(1+t)⁴ and a singular fibre at t=1, contradicting the smooth fibre there;
  so the discriminant forces c₁=1 in both.
- For N6, the values (e₀,d₀′)=(1,0) and (0,0) give the different smooth fibres E₅ and E₃ at t=1 (models 10
  and 11), so one normal form carries two configurations.
- For N6, the value (e₀,d₀′)=(0,1), the equation y²+t²y=x³+t⁵, has Δ=t⁸, c₄=0 and E₃ at t=1 (its affine
  points at t=1 are (1,0) and (1,1)), so the fibre at t=1 does not exclude it; at ∞ it is y²+sy=x³+s, singular
  at the origin with s²∤a₆′, type II with Δ′=s⁴, and its resolved rational-fibre count is 15+3+3=21<25, so it
  fails Picard constancy and lies outside the family. A test by the fibre at t=1 alone would admit it.
- For N5, the four values (e₀,d₀)∈{0,1}² give counts 5, 3, 1, 3 at t=1 for (0,0), (1,0), (0,1), (1,1), so
  the fibre at t=1 alone does select model 9 there.

*Needs:* §4.14; §5.10; §7.1; §7.2; EllipticCurves Layer 4.

### 7.4 completeness of the fourteen-model list

Prove that every smooth projective geometrically rational relatively minimal Jacobian elliptic surface over
`P¹_F₂` with constant Picard scheme and at most one rational singular-semistable or smooth-supersingular fibre
(the classification family of §6.1) is equivalent under §7.2 to at least one of the fourteen models of §6.1.
This is the completeness half of the classification: that the fourteen models are pairwise inequivalent is
§§7.5–7.6, and §7.7 combines the two halves into "exactly one".

Use §4.14 to obtain a global equation of weights 1,2,3,4,6 and §7.1 to normalize a₂. The weight bounds and
admissible changes reduce the equations to finitely many normal forms. Follow Schröer's case analysis:
for nonzero j put the unique additive fibre at t=0, then distinguish two ordinary rational fibres, a split
semistable fibre at infinity, a nonsplit semistable fibre at infinity, and the small-additive configuration.
Use the configuration exclusions of §5.10 and the normal forms of §7.3, with the count and additive-fibre
results of §§5.9–5.13. Include the twisted semistable completion of §6.1 in the nonsplit case. For j=0 use
the nonreduced-fibre and bad-place restrictions (C6) of §5.10, then the normal forms N5–N6 of §7.3.

For each normal form prove either that it fails Δ≠0, local minimality, geometric rationality, the Picard
condition or the rational-fibre condition for a stated mathematical reason, or that it is equivalent to a
model in §6.1. Discriminant identities and valuations settle smoothness and minimality; the Hodge/coherent
cohomology argument of §6.1 settles rationality; the resolved count criterion of §5.2 settles the Picard condition for rational
surfaces; the resolved fibres settle the rational-fibre condition. The admissible changes identify the
remaining normal forms with the listed equations. Membership of the listed models in the family is the
content of §6.1's Checks and is not used here; no uniqueness is asserted.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Theorems 10.4–10.5 and proofs, pp. 29–32;
twisted semistable completion in §6.1.)

**Checks.**

- The zero normalized equation has Δ=0 and cannot represent a surface in this family.
- Models 12–14 satisfy the hypotheses with nonsplit infinity fibres and resolved count 25.
- The normal form y²+t²y=x³+t⁵ (N6 of §7.3 with (e₀,d₀′)=(0,1)) has Δ=t⁸≠0 and is minimal on both charts,
  so it is excluded by the Picard condition (resolved count 21) and not by the discriminant tests.
- Smooth supersingular fibres count towards the fibre restriction; smooth ordinary fibres do not.

*Needs:* §4.14; §§7.1–7.3; §6.1; §§5.9–5.13.

### 7.5 pairwise inequivalence of the eleven nonzero-j models

Prove that the eleven nonzero-j models of §6.1, models 1–8 and 12–14, are pairwise inequivalent under §7.2,
directly from functional j up to base automorphism, resolved Kodaira types, multiplicative splitting and the
point counts of the smooth rational fibres. This separation uses only the invariants of the listed equations
and their transport under §7.2; it is independent of the completeness argument of §7.4, and the class count
eleven is drawn in §7.7.

The different nonzero-j functions are separated by their degrees, poles and constancy under base
automorphisms. For the common j=t² group (models 3, 4 and 12), distinguish III* from I₂*, then E₄/split I₂
from E₂/nonsplit I₂. For the common j=t group (models 5, 6 and 13), distinguish II* from I₃*, then
E₄/split I₁ from E₂/nonsplit I₁. These invariants also separate the two degree-four j-functions by their
pole divisors.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Theorem 10.4 and proof, pp. 29–31;
the three twisted semistable models in §6.1 complete its nonzero-j list.)

**Checks.**

- Models 1–8 and 12–14 give eleven models with a₁=t and nonzero functional j.
- Models 3, 4 and 12 all have j=t²; their resolved fibres distinguish all three: III* at t=0 for models 3
  and 4 against I₂* for model 12, then E₄ with split I₂ for model 3 against E₂ with nonsplit I₂ for model 4.
- Models 5, 6 and 13 all have j=t; their resolved fibres distinguish all three: II* for models 5 and 6
  against I₃* for model 13, then E₄ with split I₁ against E₂ with nonsplit I₁.
- Model 1 has one order-four pole of j=t⁴, whereas model 14 has two geometric poles of order one and an
  infinity pole of order two, so their degree-four j-functions are inequivalent under a base automorphism.

*Needs:* §6.1; §7.2.

### 7.6 pairwise inequivalence of the three zero-j models

Prove that the three zero-j models of §6.1, models 9, 10 and 11, are pairwise inequivalent under §7.2, from
the resolved fibre types and smooth-fibre counts. The zero-j identity is §6.1's Check. This separation is
independent of the completeness argument of §7.4; the class count three is drawn in §7.7.

Model 9 has I₁* and IV as its additive fibres. Models 10 and 11 both have IV*, but their other additive
fibres are III and IV respectively, and their smooth rational fibres have counts five and three. These
unordered fibre invariants are preserved by §7.2 and separate all three classes.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Theorem 10.5 and proof, pp. 31–32.)

**Checks.**

- Models 9–11 have c₄=0 and Δ=t⁸≠0, giving zero j for smooth generic curves.
- Model 9's I₁* fibre separates it from the IV* fibres of models 10 and 11.
- Models 10 and 11 have smooth rational fibres E₅ and E₃ and other additive fibres III and IV respectively.
- Each model has exactly one smooth supersingular rational fibre and no singular semistable rational fibre.

*Needs:* §6.1; §7.2.

### 7.7 classification of the family

Prove that every surface in the classification family of §6.1 is equivalent under §7.2 to exactly one of the
fourteen models, and that each model belongs to the family. Existence of a model is §7.4; uniqueness is
§§7.5–7.6 together with the transport of functional j under §7.2 (j is composed with the base automorphism,
so j=0 is preserved and a zero-j surface is never equivalent to a nonzero-j one); membership of the models is
§6.1's Checks. Conclude that the nonzero-j surfaces of the family form exactly eleven equivalence classes,
represented by models 1–8 and 12–14, and the zero-j surfaces exactly three, represented by models 9–11.

([Schröer, arXiv v3](https://arxiv.org/pdf/2004.07025v3), Theorems 10.4–10.5, pp. 29 and 31; the printed
lists have eight and three models, and models 12–14 are the twisted semistable completion of §6.1.)

**Checks.**

- Among the eleven nonzero-j classes there are seven functional j-invariants up to base automorphism
  (t⁴; t²/(t²+t+1); t² shared by models 3, 4 and 12; t shared by models 5, 6 and 13; 1; t⁸; t⁴/(t²+t+1)),
  so a classification by j alone would count seven, not eleven.
- Models 3 and 4 have the same j=t² but different split fibre types and ordinary counts, so functional j alone
  does not give uniqueness, and the fibre invariants of §7.5 are needed.
- The equation y²+t²y=x³+t⁵ has j=0 and is in none of the fourteen classes, because it is outside the family
  (§7.3, N6); the "exactly one" statement is about the family and not about all equations of the weights.
- The two counts eleven and three add to fourteen; the source's printed lists add to eleven and omit models
  12–14.

*Needs:* §7.4; §7.5; §7.6; §6.1; §7.2.

### Examples

The normalized coefficient space has size 4·16·32·128=2¹⁸, including the singular zero equation.
The translation parameters have size 4·8·16=512. Normalizing (t,t,0,0,0) gives (t,0,t²,t²,0).
The equality j=t² for models 3, 4 and 12 illustrates the additional information supplied by the resolved
fibre types and splitting.

### Dependencies

Layer 4 global equations and canonical bundles; Layer 5 resolved counts and the configuration exclusions of
§5.10; Layer 6 classification-list Checks; native Weierstrass variable changes;
StableReduction Layers 2 and 5; AlgebraicModuliForArithmeticGeometry Layer 1 relative Proj and Layer 7
cohomological flatness; the rationality criterion in §6.1.

## Downstream consumers

Enriques-surface applications consume the actual multiple-fiber isogeny, primitive Kodaira comparison and
rational-Jacobian point counts. They must prove their own hypotheses yielding the five geometric conditions
and the rational-fiber count sum. No general assertion that every genus-one fibration has constant Picard
scheme is supplied. The fourteen-model classification concerns smooth rational Jacobian elliptic surfaces
satisfying precisely the two stated arithmetic conditions; quasielliptic surfaces use the separate regular
nonsmooth targets. An application that, like the configuration table in the proof of Schröer's Proposition
11.1 (p. 33), treats only the eleven printed configurations must also treat models 12–14.

Applications use the single classification list of §6.1 and the classification theorem of §7.7 (completeness
§7.4, pairwise inequivalence §§7.5–7.6), with its exact geometric and arithmetic hypotheses. The equations' resolved fibre types, local minimality and
25-point counts are the list's Checks. The fibration equivalence is the pointed geometric relation of §7.2;
its equation comparison and invariant transport give the form of equivalence and uniqueness used by consumers.
The eleven nonzero-j and three zero-j class counts are §7.7. The nonrational-fibre conclusions remain
§§6.16–6.17.

## References

The geometric arguments and tables use Schröer's arXiv v3, with its own printed pagination, rather than
silently transferring locators to the Annals version. The polynomial, localization, chart and
section-coordinate targets are derived refinements of the cited pinching construction; their exact formulas
are proved here and are not attributed as named lemmas printed in Schröer. Likewise the maximal-count converse
and the twisted semistable completion are mathematical targets and refinements of the cited arguments.

- Stefan Schröer, *There is no Enriques surface over the integers*, arXiv:2004.07025v3, 9 August 2022.
  Sections 2–3, 6–10 and the quasielliptic discussion in §11. Its Theorem 10.4 lists eight nonzero-j
  equations; models 12–14 here complete its twisted case (§6.1). [Versioned
  paper](https://arxiv.org/pdf/2004.07025v3).
- Daniel Ferrand, *Conducteur, descente et pincement*, Bulletin de la SMF 131 (2003), 553–585. §§1, 4, 5 and
  Theorem 7.1. [Published paper](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf).
- Jakub Witaszek, *Keel’s base point free theorem and quotients in mixed characteristic*, Annals of
  Mathematics 195 (2022), 655–705. Definition 2.17; Lemmas 2.23–2.28. [Public
  copy](https://par.nsf.gov/servlets/purl/10429755).
- Michael Temkin and Ilya Tyomkin, *Ferrand pushouts for algebraic spaces*, arXiv:1305.6014v3, 27 May 2016.
  §§3–6, especially Theorems 5.3.1, 6.2.1 and 6.3.2; v3 pages, not journal pagination. [Author
  copy](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf).
- Qing Liu, Dino Lorenzini and Michel Raynaud, *Néron models, Lie algebras, and reduction of curves of genus
  one*, Inventiones Mathematicae 157 (2004), 455–518. Theorem 5.9, §6 and Proposition 7.1. [Author
  copy](https://www.math.u-bordeaux.fr/~qliu/articles/LLR.pdf). Read with their [2018
  corrigendum](https://www.math.u-bordeaux.fr/~qliu/articles/CorrigendumToNeronModelsLieAlg.pdf), Inventiones
  Mathematicae 214, 593–604, particularly the corrected Theorem 4.3 and obstruction factors.
- Michel Raynaud, *Spécialisation du foncteur de Picard*, Publications Mathématiques de l’IHÉS 38 (1970),
  27–76. 6.1.4, 6.3.5 and 8.2.1, printed pp. 48–49, 54–55 and 66–67. [Published
  paper](https://www.numdam.org/article/PMIHES_1970__38__27_0.pdf).
- Alexander Grothendieck and Jean Dieudonné, *Éléments de géométrie algébrique IV₄*, Publications
  Mathématiques de l’IHÉS 32 (1967), Theorem 18.5.11(c), pp. 130–132. [Published
  edition](https://www.numdam.org/item/PMIHES_1967__32__5_0/).
- Enrico Bombieri and David Mumford, *Enriques’ classification of surfaces in char. p, II*, in Complex
  Analysis and Algebraic Geometry (1977), 23–42. §1, Theorem 2 and Proposition 4, pp. 27–30; §2, pp. 31–33; §3
  quotient construction, pp. 34–37. [Author
  scan](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1976d--EnrClass-II-NC.pdf).
- Serge Lang, *Algebraic groups over finite fields*, American Journal of Mathematics 78 (1956), 555–563,
  Theorems 1–2, pp. 556–558. Used through ReductiveGroupsPartII's general theorem.
  [JSTOR](https://www.jstor.org/stable/2372673).
- Christian Liedtke, *Algebraic Surfaces in Positive Characteristic*, arXiv:0912.4291v4, §4.5, Theorem 4.6,
  printed p. 21. [Versioned author survey](https://arxiv.org/pdf/0912.4291v4).
- François Cossec, Igor Dolgachev and Christian Liedtke, *Enriques Surfaces I*, author manuscript dated 19
  April 2024, Theorem 4.1.3 and the following genus-one specialization, pp. 361–362; Proposition 4.3.1 and
  Theorem 4.3.3, pp. 381–383; Corollary 4.3.22, p. 393; Lemma 4.4.1 and proof, pp. 394–396. These locators are
  for that edition. [Author
  manuscript](https://sites.lsa.umich.edu/idolga/wp-content/uploads/sites/1334/2024/08/EnriquesOne.pdf).
- Michael Szydlo, *Elliptic fibers over non-perfect residue fields*, author version dated 28 September 2003.
  The binary calculations here use perfect residue fields; no general imperfect-residue algorithm is assumed.
  [Author version](https://szydlo.com/imperfect92803.pdf).
- William E. Lang, *Configurations of singular fibers on rational elliptic surfaces in characteristic two*,
  Communications in Algebra 28 (2000), 5813–5836, DOI 10.1080/00927870008827190. Schröer §10 identifies the
  configuration assertions needed in §5.10, whose independent proofs supply the normal-form completeness
  argument of §7.4. [Bibliographic
  record](https://doi.org/10.1080/00927870008827190).
- Tetsuji Shioda, *On the Mordell–Weil lattices*, Commentarii Mathematici Universitatis Sancti Pauli 39
  (1990), 211–240, §1. Used for the Néron–Severi form of Shioda–Tate over an arbitrary base curve (§4.8).
- The Stacks Project: tags linked at the individual targets are the stable locators; displayed theorem numbers
  accompany them where available. [Project](https://stacks.math.columbia.edu/).
