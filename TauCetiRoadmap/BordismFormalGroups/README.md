# Bordism, formal groups and chromatic operations

Develop the coefficient and operation theory that connects complex bordism to
one-dimensional commutative formal groups. Include Lazard and Quillen
universality, p-typical coordinates, Brown–Peterson and Johnson–Wilson theories,
their cooperations and spectral sequences, and Landweber exactness. A chosen
complex orientation is data; its formal group does not by itself prove a
coefficient-ring universality theorem or supply an E∞ orientation.
Include torus Euler cancellation on finite MU pieces and its module-extension
nullhomotopy application in F6.6–F6.7.

## Carriers, conventions and owners

HomotopySpheres section references use the [§3C/§9 specification at
34167306e5a1726e2574b039dc1a27f913985f0f](https://github.com/TauCetiProject/TauCetiRoadmap/blob/34167306e5a1726e2574b039dc1a27f913985f0f/TauCetiRoadmap/HomotopySpheres/README.md)
in PR284.

Use Mathlib's `FormalGroup R`, `FormalGroup.IsComm` and
`MvPowerSeries (Fin 2) R`, with the existing substitution and coefficient APIs.
Follow the proposed `FormalGroupHom`, `FormalGroupIso` and `addInvX` designs in
Mathlib [#38213](https://github.com/leanprover-community/mathlib4/pull/38213)
and [#36167](https://github.com/leanprover-community/mathlib4/pull/36167),
including [#41710](https://github.com/leanprover-community/mathlib4/pull/41710)'s
topologically nilpotent point carrier. Construct the missing APIs in Tau Ceti
with these shapes; adopt Mathlib's resulting APIs when they arrive.

GeneralizedCohomology G2–G5 supplies spectral models, derived smash/function
objects, represented theories, projective/Thom orientations, MU and its
multiplicative model, connective K spectra and generic spectral Postnikov
covers. TangentialBordism supplies geometric cycles and the Pontryagin–Thom
comparison, and owns the integral unoriented/oriented/Spin coefficient
calculations. This roadmap owns MU's coefficient universality and generic
MU/BP operations and Adams–Novikov machinery. StringOrientation owns the
Hovey specialization to MString and its geometric Cayley-plane kernel.
EllipticCohomology owns elliptic realization, descent and tmf; it consumes
formal-group exactness and deformation theory here.

Use homological grading: |v_i|=2(p^i−1), |b_i|=2i and a complex
orientation in cohomological degree 2. A formal-group coefficient a_ij has
homological degree 2(i+j−1). For graded coefficients, retain the direct-sum
graded ring and the homogeneous-degree equations; do not replace a
completed projective-space cohomology ring by a direct sum. Formal-group
coordinates, p-typical generators and strict coordinate changes are specified
choices, with explicit comparison maps between choices.

## F1. Formal-group algebra and universality

Use the native multiplication series `FormalGroup.nsmulSeries` from
[`TauCeti.RingTheory.FormalGroup.NSMul`](https://github.com/TauCetiProject/TauCeti/blob/1844920e9c82791e848e12fd5313fa212e542731/TauCeti/RingTheory/FormalGroup/NSMul.lean),
including `nsmulSeries_add`, `nsmulSeries_mul`,
`constantCoeff_nsmulSeries` and `coeff_one_nsmulSeries`; these give
[n]_F, its addition/composition equations and linear coefficient n on the
native `PowerSeries R` carrier. Consume its invariant-differential,
derivative/divisibility and prime-series decomposition results, including
`natCast_dvd_coeff_nsmulSeries` only in degrees k with `k.Coprime n`,
under their stated commutativity and prime hypotheses. Build the inverse series,
base change, morphisms, isomorphisms and strict isomorphisms on the native
carriers, extending the same n-series with its base-change,
coordinate-change and integer-indexed inverse comparisons. Prove substitution
exists under its actual zero/nilpotent-constant hypotheses, coefficient
recurrences, uniqueness, composition, identities and inverse laws. Extend
the same native `FormalGroup.Point F Unit` carrier
`{f : MvPowerSeries Unit R // PowerSeries.HasSubst f}` to complete
Hausdorff linearly topologized algebras with topologically nilpotent
elements;
prove convergence and continuous functoriality rather than assuming every
power series can be evaluated everywhere.

Construct the Lazard ring L as the quotient of the polynomial ring over ℤ
on a_ij, i,j≥1, by all coefficient relations for commutativity and
associativity of X+Y+Σa_ij X^iY^j. Construct its universal native commutative
formal group and prove the natural bijection
Hom_ring(L,R) ≃ {F : FormalGroup R // F.IsComm}. Prove the graded version
and Lazard's polynomial theorem L≅ℤ[x₁,x₂,…], |x_n|=2n, with an explicit
generator construction and integral independence argument. Build the
homogeneous symmetric additive 2-cocycle comparison first: for n≥2 let
C_n(X,Y)=((X+Y)^n−X^n−Y^n)/d_n, an integral polynomial,
where d_n=p if n is a power of a prime p and d_n=1 otherwise.
For every commutative ring R prove that the normalized degree-n symmetric
cocycles are uniquely R-multiples of C_n, with coefficient/base-change
comparison. Prove the integral coefficient and gcd equations, including
torsion coefficient rings; a characteristic-zero logarithm does not prove
this assertion. Use this single cocycle lemma in Lazard's polynomial
construction and in the exponent-two specialization below. Build strict
coordinate-change representability by L[b₁,b₂,…], including source, target,
counit, composition and inverse maps and all Hopf-algebroid equations.

Use `FormalGroup.invariantDifferential` and, over a ℚ-algebra,
`FormalGroup.log` and `FormalGroup.exp` from native
[`TauCeti.RingTheory.FormalGroup.Logarithm`](https://github.com/TauCetiProject/TauCeti/blob/1844920e9c82791e848e12fd5313fa212e542731/TauCeti/RingTheory/FormalGroup/Logarithm.lean).
Consume `constantCoeff_log`, `coeff_one_log`, `derivative_log`,
`subst_toPowerSeries_log`, `subst_toPowerSeries_eq_add_iff`,
`subst_exp_log` and `subst_log_exp`:
the logarithm has constant coefficient zero and linear coefficient one,
and every additive series along F is a scalar multiple of it. Extend these
APIs with base-change and coordinate-change comparisons and the bundled
strict isomorphism to the additive formal group. Prove the additive and
multiplicative examples and their logarithms. The exponent-two
characteristic-two construction below is a separate integral argument;
the ℚ-algebra logarithm does not apply there.

For every commutative coefficient ring R with 2=0 and commutative native
formal group F with [2]_F=0, construct its normalized strict logarithm
g_F(X)=X+Σ_(i≥1) a_i X^(i+1), with
g_F(F(X,Y))=g_F(X)+g_F(Y) and a_(2^k−1)=0 for every k≥1.
Prove existence, uniqueness, base-change naturality and the inverse strict
exponential. Pin the direction: g_F maps F to the additive group; its
inverse f_F satisfies F(f_F(X),f_F(Y))=f_F(X+Y).
Bundle g_F and f_F as the forward/inverse `FormalGroupHom` maps in
the cited `FormalGroupIso` shape, prove both substitution inverses and
`FormalGroupIso.IsStrict`, and compare the normalized coefficient
existence/uniqueness prototype with that bundled isomorphism. The raw
power series and the formal-group isomorphism are linked by this target.
Prove the polynomial obstruction lemma used in the degree-by-degree
construction. A normalized homogeneous symmetric additive 2-cocycle of
degree n≥2 with zero diagonal is an R-multiple of
(X+Y)^n−X^n−Y^n for n not a power of two, and is zero when n is a
power of two. In the latter degree include the divided-binomial integral
cocycle reduced mod 2 and prove its nonzero diagonal excludes it here.
Derive this from the preceding any-ring cocycle lemma and binary binomial
identities: d_n is odd except at powers of two, and C_(2^k)(X,X)
has odd integral coefficient. Thus it applies to every R with 2=0; no coefficient field or
division by two is assumed. Apply the lemma to the first nonvanishing
homogeneous error g(F)−g(X)−g(Y), prove all compatible truncations and
pass to actual formal power series by coefficient completeness.
For arbitrary h∈R[[X]] prove h(X+Y)=h(X)+h(Y) precisely when
h=Σ_(j≥0) b_j X^(2^j), including zero constant term; strict additive
automorphisms have b₀=1. Use this to prove the logarithm normalization
and its uniqueness, and describe all other strict coordinates by composing
with those additive automorphisms. For the degree-one real-orientation
coordinate give the graded version with a_i in homological degree i,
and its coefficient-wise base-change laws. This algebraic lane
precedes F2's universal characteristic-two ring comparison.

Use `nsmulSeries p` as the p-series and define height over
characteristic-p fields, including height
∞ for the additive group. Prove base extension invariance, the p-power form
of its first nonzero term and coordinate independence of height. Prove the
classification over separably closed characteristic-p fields: two
one-dimensional commutative formal groups are isomorphic precisely when
heights agree, including the infinite-height additive class. This supplies
ModularCurves' height-classification application. EllipticCurves Layer1 owns
the elliptic logarithm/exponential instances; it consumes this generic API.

## F2. Complex orientations and Quillen's theorem

Consume G4's chosen complex orientation and finite projective-bundle theorem.
Own the two-variable comparison: iterated finite CP^m×CP^n projective-bundle
isomorphisms, the surjective truncation restriction system, vanishing lim¹
and the skeletal Milnor comparison give E*(CP∞×CP∞)=E*[[x,y]], with
its degreewise completion and products. Use the even commutative coefficient
ring π_(2*)E for the native formal group; odd coefficients remain modules
over it. This comparison precedes the tensor-product definition. Prove that tensoring the two universal lines defines a
commutative native formal group F_E, with the orientation normalization,
inverse dual-line formula and base-change laws. Compare two orientations by
their strict coordinate change. Include K-theory's multiplicative law with its Bott grading: for TopK's
u=β=[O(−1)]−1 and the normalized coordinate on L=O(1), set
x_K(L)=u⁻¹([L⁻¹]−1), so its restriction is +1 and
F_K(x,y)=x+y+u xy. Compare u x with native 𝔾ₘ. Pin the Thom/orientation
adapter if another K orientation is used. Ordinary cohomology has the
additive law. For the right-complex restriction of a quaternionic line,
prove roots t and [−1]_F(t), the dual/inverse, tensor and Whitney Euler
laws with both of G4's specified quaternionic orientations:
e^c(γ_H)|CP∞=t[−1]_F(t), the restriction of x_H^E, and
e^std(γ_H)|CP∞=−t[−1]_F(t). The standard class differs from the
complex-induced class by (−1)^r in quaternionic rank r. State the
higher-rank splitting, Whitney and naturality laws separately for these
orientations and use the standard normalization for e_Sp.
Do not impose this normalization on an arbitrary independent E orientation.

Construct the map L→MU_* from MU's orientation and prove it is an
isomorphism. Supply the complete coefficient proof. Consume TB B4.2's
mod-2 Adams tower and, only at odd primes, B4.8's tower and exterior
change-of-rings machinery. Own their MU instances at every prime:
construct H_*(MU;F_p) with its Thom product and Steenrod-dual coaction,
prove the Milnor-primitive annihilation and freeness/change-of-rings
decomposition, including E(Q₀,Q₁,…) at2 with |Q_i|=2^(i+1)−1.
At2 construct the Milnor primitives Q₀=Sq¹ and
Q_(i+1)=[Sq^(2^(i+1)),Q_i], identify their pairing with ξ_(i+1),
prove their exterior sub-Hopf algebra and A's freeness over it, and
construct the mod-2 exterior change-of-rings comparison here. TB's
odd-prime exterior comparison is not a supplier for this mod-2 construction.
At odd p use |Q_i|=2p^i−1 and prove the corresponding MU decomposition,
rather than substituting TB's MSO computation. Prove the MU Adams
spectral-sequence differentials/extensions and integral arithmetic reconstruction to
prove evenness and torsion-freeness, characteristic-number detection, integral
generators with Newton-number divisibility, and the comparison between their
formal-group coefficients and Lazard's generators. Use TangentialBordism's
geometric MU comparison; no abstract claim that an arbitrary formal group
is MU's coefficient ring substitutes for this proof. Prove MU_* is polynomial
in degrees 2n and identify the coproduct/strict-coordinate interpretation of
MU_*MU≅MU_*[b₁,b₂,…], including grading and left/right units.

For a chosen real orientation use G4's RP∞ projective comparisons to
construct the real-line tensor Euler law F(x,y) in degree1. Own the
two-variable real projective comparison: on RP^m×RP^n identify
E^* with E^*[x,y]/(x^(m+1),y^(n+1)), compatibly with restriction
and both Euler classes. Pass to RP∞×RP∞ through the two finite-stage
towers, proving surjective transition maps, the required lim¹ vanishing
and the completed graded E^*[[x,y]] comparison before defining F. Prove 2·1=0
and F(x,x)=0 from the square-triviality of the universal real line.
Use F1's normalized exponent-two logarithm to construct the universal
graded characteristic2 formal-group ring with
[2]_F=0 and identify it with MO_*, using the geometric/Thom/Adams
coefficient theory owned by TB and Quillen's unoriented operation proof.
Prove the polynomial generators in degrees other than 2^k−1 and the
orientation/change-of-coordinate universal property. This owns the real
formal laws assigned here by TangentialBordism, without duplicating its
geometric coefficient-ring construction.

Specify the category of real-oriented multiplicative cohomology theories:
an object includes its unital homotopy-commutative ring-spectrum model and
chosen multiplicative real Thom orientation, and morphisms are stable
multiplicative natural transformations preserving that orientation. Define
the coefficient functor to graded characteristic-2 rings with normalized
degree-one exponent-two formal laws, with coordinate-preserving graded
ring homomorphisms. Construct the Thom transformation MO→h and prove its
universal property for these chosen multiplicative orientations, retaining
the specified Thom data and its homotopies rather than inferring an E∞
orientation from a homotopy-ring orientation. On the algebraic side prove
the equivalence between commutative graded MO_*-algebras and these normalized
exponent-two formal laws: a law over R determines the unique graded
classifying map MO_*→R, and morphisms commute with that map. Prove the
coefficient functor and Thom transformation induce this algebraic
classification, naturally under orientation-preserving transformations.
For every commutative graded MO_*-algebra R, first define the graded
functor on CW pairs `h_*(X,A)=MO_*(X,A)⊗_(MO_*)R`; the Conner–Floyd
comparison below proves it a multiplicative real-oriented homology theory.
Retain the appropriate cohomological regrading of its coefficient law.
Construct the graded Eilenberg–MacLane ring-spectrum model HR
in G2.4's symmetric spectral model, using G2.7's HF₂ and ordinary-module
spectra. Own the graded Eilenberg–MacLane functor from graded 𝔽₂
modules, viewed as complexes with zero differential, its shifts and
multiplicative lax-monoidal comparison; construct HR's strict ring model
and product from the specified associative graded multiplication on R.
Prove this product is homotopy commutative: maps from HR∧HR into
this graded EM model are detected by mod-2 homology, and μ and μ∘τ
agree there by commutativity of R and the dual Steenrod algebra.
Construct the ring comparison `H_*(HR;𝔽₂)≃A_*⊗_(𝔽₂)R`
and the Künneth comparison for HR∧HR, identifying H_*(μ) with
multiplication on both factors. Consume TB B4.2's commutative dual
Steenrod algebra `A_*=𝔽₂[ξ₁,ξ₂,…]`; the sphere-twist signs
(−1)^(ab) are trivial mod2.
No strict commutative DGA or E∞ structure is inferred. Prove the chosen
HR model semistable and compare its model homotopy groups with G2.6's
true π_* before applying the stable weak-equivalence criterion.
Identify its underlying module with the wedge, and the weakly equivalent
product, of Σ^dH(R_d), for d∈ℤ, and prove its represented homology is
H_*(−;𝔽₂)⊗_(𝔽₂)R. Construct the ordinary real Thom orientation and
its coordinate x_H; for the prescribed law use F1's normalized
exponential to define x_F=f_F(x_H). Build its multiplicative Thom
classes and MO→HR map, identify the coefficient map and law through
HR^*(RP∞)=R[[x_H]]. Construct the natural map h_*(X,A)→HR_*(X,A)
induced by MO→HR; prove it an isomorphism after the Conner–Floyd
comparison below. Prove the 𝔽₂-coefficient universal comparison
and vanishing of phantom maps into this graded EM model, using field
cochains and its product comparison. Prove functoriality under commutative graded
MO_*-algebra maps, with the specified orientation/coordinate retained. The algebraic
category equivalence does not assert that arbitrary ring-spectrum
theories or their stable operations are determined by their coefficient
formal law.


Own a chosen natural Conner–Floyd
MO_*-module comparison
`MO_*(X,A)≃MO_*⊗_(𝔽₂)H_*(X,A;𝔽₂)`, compatible with the actual
relative boundary, suspension, wedge and external-product maps.
Using the preceding graded EM ring/orientation, for R=MO_* and
its own real law, its Thom map MO→H(MO_*) induces the identity on
coefficients by the algebraic classification. Prove it an isomorphism on G2.6 true π_* and hence a stable weak
equivalence and derive the stated natural module/product/boundary
comparison, using TB B4's computed MO coefficients. An additive
splitting alone is not this multiplicative comparison.
Deduce freeness and identify h_* naturally with
`H_*(X,A;𝔽₂)⊗_(𝔽₂)R`. Exactness follows by tensoring over the field,
including the boundary maps; termwise freeness alone is not an exactness
argument. This works for every commutative graded MO_*-algebra R.

Construct the Landweber–Novikov operations from these cooperations, their
composition, Cartan, naturality and Thom/Gysin formulas, and their agreement
with coordinate changes. Supply duality/completion hypotheses for infinite
families; a graded dual is not an unqualified algebraic dual.

## F3. p-typical and Brown–Peterson theories

For each prime p, construct the p-typicalization idempotent on MU_(p),
prove its multiplicative comparison, and split it to obtain BP. Pin
BP_*≅ℤ_(p)[v₁,v₂,…] using specified Hazewinkel generators and prove the
logarithm recursion and conversion to other p-typical coordinates.
Construct BP_*BP≅BP_*[t₁,t₂,…] and the full Hopf-algebroid structure;
identify its strict p-typical coordinate-change functor.

Build BP⟨n⟩ and E(n) for n≥0, with the specified ordered spectral cofibres by v_(n+1),v_(n+2),… and localization at v_n for n≥1. Define E(0)=Hℚ.
Prove the homotopy groups, canonical maps, connective-cover comparisons
and the homotopy-associative products needed for the Hopf rings. Construct
and compare the products on the iterated cofibres, with their actual
p=2 noncommutativity/choice qualifications; no coherent BP-module
category is presumed before an A∞ model is constructed. Do not
assert an E∞ structure on BP or every BP⟨n⟩. Include BP⟨0⟩≃Hℤ_(p), and ku_(2)≃BP⟨1⟩. Construct Morava
K(n) for n≥1 from the specified p,v_i (i≠n) cofibres and v_n
localization, with coefficients F_p[v_n,v_n⁻¹], exact sequence and
homology/detection APIs; its homotopy product is not asserted E∞.
For odd p, construct the Adams summand BP⟨1⟩ comparison with connective
complex K-theory and the p−1 summands
ku_(p)≃∏_(i=0)^(p−2) Σ^(2i)BP⟨1⟩. Prove Bott's cyclic action between
the factors, including v₁ on the last return. Include the i=0 summand.
Construct ko_(p)≃⋁_(i=0)^((p−3)/2)Σ^(4i)BP⟨1⟩ for odd p by
real/complex K comparison and conjugation, preserving its Bott action
and actual connective-cover maps. String supplies the resulting BO⟨4k⟩
space splitting.

Construct the designated Ω-spectrum spaces BP⟨n⟩_k, their multiplication,
additive infinite-loop structure, suspension, coefficient elements and
homology orientations. Prove Wilson's torsion-free polynomial-space results
in their exact degree/range hypotheses. For BP⟨1⟩ and odd p, develop the
BP-homology Hopf ring with its star/circle products, units, coproducts,
distributivity and the b_(i), [v₁^j] elements. For positive even m<2p+2 prove
H_*(BP⟨1⟩_m;ℤ_(p)) is torsion-free and polynomial in even degrees;
for positive even m<2p prove the BP-homology polynomial generators occur
in positive even degrees congruent to m modulo 2p−2. Give the polynomial
presentations below space degree 2p and the generators/relations in degree
2p+2, including the [v₁] map and augmentation-ideal filtrations needed by
StringOrientation. Prove the AHSS collapse and extension identifications;
cellular ranks alone do not determine the ring. Within F4 construct the
BP-homology AHSS first from G's filtration, using only the F3 spectrum/
orientation construction; its collapse/presentation then completes this
F3 space-homology sublane before the F4 Adams–Novikov application.

## F4. Comodules and Adams–Novikov comparisons

Consume HomotopySpheres Stage3C's three-fold Toda brackets on pointed
spaces, with chosen adjacent-composite nullhomotopies and their two
composition-subgroup indeterminacy. Construct their passage through
suspension and G's sphere-spectrum comparison to stable spectral Toda
brackets, preserving composition, signs and indeterminacy. Construct
three-fold Toda brackets for composable maps of spectra and of right
modules over a supplied G2.4 strict associative ring spectrum R,
including its chosen strict commutative models. Consume G2.4's transferred
module model structure and construct its triangulated stable homotopy
category here, with suspension, cofiber triangles, hom groups [ΣX,V]_R,
exactness and the comparison to the underlying stable spectral category.
Build the brackets from their chosen cofiber triangles and nullhomotopies. The module version
requires this coherent structure; a homotopy-ring multiplication alone does
not supply it. Pin degrees, suspension signs, naturality under exact
functors, and module indeterminacy
`f∘[ΣX,V]_R+[ΣY,W]_R∘Σh` for a composable triple X→Y→V→W
(with f the final and h the first map). For the right regular R-module
identify left-multiplication maps with π_*R and state
`⟨a,b,c⟩⊆π_(|a|+|b|+|c|+1)R`, with indeterminacy
`a·π_(|b|+|c|+1)R+π_(|a|+|b|+1)R·c`, retaining the chosen
graded suspension/composition convention. The sphere case R=S gives
ordinary stable brackets.

Construct higher Toda operations for every finite arity r≥3 in these
same enriched stable spectral and right-module models, and in supplied
stable symmetric monoidal models with the corresponding derived mapping
spaces. Construct the operations before passage to the triangulated
homotopy category. For X_r→⋯→X_0 use coherent
iterated-cofiber defining systems with value in [Σ^(r−2)X_r,X_0],
comparing with Carrick–Davies–van Nigtevecht Definitions3.3/3.7 on Picard
objects. Extend their Picard-object construction to the general objects
specified here and determine the suspension signs from the chosen model;
the reference leaves these only up to units. Compare the r=3 normalization
with the convention above. The displayed ring
entries a₁,…,a_r run from the final map to the first map, matching
left-to-right multiplication. Construct the cubical comparison and
specify all maps, adjacent
nullhomotopies and their higher compatibility homotopies on proper
subintervals, with the final obstruction map as the value. Define the
bracket as the set of values of such systems; adjacent products vanishing
alone is not a defining system. Construct restriction, extension and
change-of-system maps, their obstruction criteria, equivalence invariance
and comparison of the cofiber and cubical definitions. For homogeneous
ring classes pin the value degree Σ_i|a_i|+r−2, and recover exactly the
preceding triple convention at r=3. Describe the full change-of-system
indeterminacy; higher brackets need not be cosets of the triple's two
composition subgroups. Prove suspension, naturality under derived exact
functors and extension of scalars, and the composition/shuffling inclusions
with their compatible defining-system hypotheses. On dualizable objects
construct reversal through duality and its suspension/sign comparisons;
specialize to Picard-graded E₂-ring classes. Construct nested-system
substitution and the resulting bracket-of-brackets juggling inclusions,
tracking the inner choices, proper-subinterval vanishing hypotheses and
full outer indeterminacy. Include the forms in Bauer Lemma8.6 and
Corollary8.7 as applications in EllipticCohomology, not additional generic
definitions. A ring map carries a
chosen system and its value to the image system and value; lifting a
bracket requires lifting its coherent system, not just its entries.

Consume DGAInfinity Layer8’s matric/higher Massey defining systems over
the coefficient rings in use. Its field-dependent transferred-operation
comparison is not used for integral or p-local MU/BP cobars. Own the
specialization of its Massey definitions to the normalized
multiplicative MU/BP cobar complexes, with the cohomological/internal-degree
and Koszul-sign dictionary and full variation under changes of
representatives. This is the cobar/filtration comparison, with a single
generic Massey-product owner. Construct the following distinct comparisons.

1. For every arity, start with a chosen coherent defining system in the
   filtered model: the actual lifts of its entries, a filtered form of
   C(a₂,…,a_(r−1)), and the extension and coextension maps. Exact realization
   carries its total value into the corresponding classical Toda bracket.
   For a central τ with E₂ quotient maps, reduction to R/τ^k carries this
   same system to its reduced Toda system. Construct the normalized-cobar
   associated-graded comparison on the proper faces and total obstruction;
   when these faces define a Massey system on a specified spectral-sequence
   page, its value is the image of this chosen system. Prove filtration,
   sign, indeterminacy and tower-map naturality. This assertion begins with
   a filtered defining system; it does not reconstruct one from arbitrary
   higher Massey membership.
2. Prove the threefold synthetic Moss theorem with explicit hypotheses:
   R is an E₂-ring, a₁,a₂,a₃ are actual bigraded classes, and r≥s≥0 are
   minimal with τ^r a₁a₂=τ^s a₂a₃=0. For r,s>0 construct H₀,H₁ with
   total differentials d_(r+1)H₀=a₁a₂ and d_(s+1)H₁=a₂a₃, and a value
   of ⟨a₁,τ^r a₂,a₃⟩ lifting τ^(r−s)a₁H₁±H₀a₃ modulo τ^s. For
   r>0=s construct H₀ modulo τ^r and a bracket value lifting H₀a₃.
   Pin the sign by the preceding cone convention and compare reduction
   modulo τ with the corresponding threefold page-Massey product.
   Include r=s=0 as the ordinary defined triple case. For classes initially
   given only after τ-inversion, obtaining lifts with these annihilation
   identities is an additional construction, not a consequence of page
   membership. Compare this theorem with the Adams–Novikov tower through
   its actual filtered realization.
3. EllipticCohomology E4/E5 constructs the proper faces, extension maps and
   total obstruction cell by cell for each of its higher applications,
   and computes the corresponding detection and full indeterminacy.
[Carrick–Davies–van Nigtevecht §3](https://arxiv.org/abs/2412.01640v2)
supplies the chosen higher-cone/naturality/shuffling convention; its
displayed Moss theorem3.16 is threefold. Lemma3.9 and Propositions3.14–15
give the forward exact-functor and truncation comparisons; they do not
assert a Massey-to-Toda converse for arbitrary arity.

Develop graded comodules over the flat MU and BP Hopf algebroids, cofree
comodules, the normalized cobar complex, Ext, change of rings and base
change. Construct their graded tensor category and internal Hom, and prove
that dualizable comodules are exactly those with finitely generated
projective underlying graded module. Build their evaluation/coevaluation,
dual coaction and tensor-Hom comparisons. Prove the Adams generation
hypotheses used in ELL's separately constructed Hovey stable model; this
comodule API does not itself identify that model with an ordinary derived
category. Construct the actual MU/BP resolution of a spectrum by iterated
unit/cofiber maps, its exact couple and Adams–Novikov spectral sequence.
For the BP version, prove E₂^(s,t)=Ext_(BP_*BP)^(s,t)(BP_*,BP_*X)
using BP_*BP's proved flatness and the comodule cobar comparison,
with the completion/convergence hypotheses below; do not add an
unnecessary flatness hypothesis on BP_*X.

Construct the filtration on the appropriate completion of π_(t−s)X,
edge/Hurewicz maps, multiplicative and naturality laws, lim¹ obstruction,
and conditional/strong-convergence criteria. Prove convergence to X_(p) for bounded-below X in the BP-based
p-local Adams tower: the augmentation fibre of S_(p)→BP is
positive-connective, so its iterated smash powers with X have connectivity
tending to infinity. Prove the resulting tower limit and strong
convergence criteria rather than merely labelling it a completion.
Construct the BP/p-based nilpotent tower separately and identify its
limit with derived p-completion for bounded-below finite-type X,
using G3's derived completion and Milnor exact sequence. For spectra
outside those hypotheses retain the actual nilpotent tower limit and
its conditional-convergence statement. Ordinary p-localization and
p-completion are distinct. Build the AHSS for
BP-homology from G's cellular filtration and prove its corresponding
convergence and extension criteria. Supply the free/even/comodule comparisons
used in the String Hovey calculation. TangentialBordism's mod-p Adams tower
remains its own construction and is not duplicated here.

## F5. Exact functors, deformations and elliptic inputs

For each prime p use F3's graded flat Hopf algebroid
(A,Γ)=(BP_*,BP_*BP). Define invariance of a homogeneous ideal through
its coaction, equivalently the equal extension of the two unit maps to Γ,
and prove the equivalence of these formulations. Classify its homogeneous
invariant prime ideals as I₀=(0), I_n=(p,v₁,…,v_(n−1)) for finite n≥1,
and I_∞=(p,v₁,v₂,…). Prove primality, invariance, distinctness,
their strict inclusion order and the quotient presentations, including
A/I_∞=𝔽_p. The homogeneity hypothesis is essential: the ungraded
invariant prime (p,v₁−1), using η_R(v₁)=v₁+p t₁, is not in this list.
Compare these ideals under the chosen p-typical coordinate changes.

Construct the primitive and invariant calculations needed for the proof:
η_R(v_n)≡v_n mod I_n and
Ext⁰_Γ(A,A/I_n)=𝔽_p[v_n] for finite n≥1, with
Ext⁰_Γ(A,A)=ℤ_(p) and invariants 𝔽_p at height∞. For a nonzero
graded comodule with finitely presented underlying A-module, construct a
nonzero primitive and the invariant-annihilator comparison. Use the
bounded-below grading and finite coaction of its generators; prove the
finite-polynomial-stage descent of a module presentation and coaction.
Prove Landweber filtration for these comodules: construct a finite
filtration by graded subcomodules with subquotients Σ^d A/I_n, d∈ℤ
and n finite, including n=0. Prove termination over the descended finite
Noetherian polynomial stage and its extension back to A. Prove the
required coherence and finite-presentation/base-change lemmas for A;
A itself is not assumed Noetherian. The prime I_∞ belongs to the
prime classification, but A/I_∞ is not finitely presented and is not
an additional filtration factor. Using F4's Adams dualizable generators
and the coherence just proved, construct
`gradedComoduleFilteredPresentation`: every graded comodule is a
filtered colimit of comodules with finitely presented underlying
A-module, with its actual coaction and universal property. Use finite
cokernels between finite sums of dualizable generators, with kernel
comparisons supplied by flatness of Γ. Do not assert a union of
finitely presented subcomodules: A/I_∞ itself is a counterexample.
Prove tensor/homology filtered-colimit comparisons. For spectra also
construct the direct filtered finite-cell/retract presentation and
BP_*X≃colim_αBP_*X_α, with each finite-stage homology finitely
presented. Use these colimit comparisons in the later class identities;
vanishing of a colimit does not assert that some finite stage is acyclic.

Transport the exactness theorem to MU through the actual p-typical
Hopf-algebroid comparison. Construct the weak equivalence between the
MU_(p) cooperation groupoid and (A,Γ) using F3's strict p-typicalization,
its extension/descent comodule functors, unit/counit and finite-presentation
comparisons. Define the height ideals I_(p,n) in MU_(p)* from the
[p]-series of its chosen formal group and compare them with the
p-typical ideals. Prove independence of lifts of v_i modulo preceding
height ideals and of the specified coordinate changes. This identifies
the criterion on an MU_*-module without pretending the quotient
MU_(p)*→BP_* is a flat map of coefficient rings.

Prove Landweber's exact functor theorem for a graded MU_*-module M:
for every prime p, p and successive v_i act injectively on its successive
height quotients. Zero quotients satisfy the criterion. Prove the
necessary Tor vanishing for the filtration factors from their finite
regular sequences; induct through the Landweber filtration to obtain
tensor exactness on finitely presented graded comodules. Prove MU_*X
is finitely presented for finite spectra X, using the coherent polynomial
coefficient ring and finite-cell/retract induction. Then pass through
filtered homotopy colimits over finite subcomplexes to construct the
homology theory MU_*(−)⊗_(MU_*)M on all CW pairs, with suspension,
wedges and the actual relative boundary maps. Construct its representing
spectrum by stable homology representability: on finite spectra use
Spanier–Whitehead duality to form the corresponding flat homology
functor, construct its wedge/cofiber realization by the Adams
representability argument for the countable finite stable category,
and prove its identification on finite sources and all filtered cell
unions. Construct the countability, flat-functor and realization
prerequisites here; G's cohomological Brown theorem alone is not this
homology representability argument. Construct comparison maps and products when M is a graded
algebra, retaining their coherence hypotheses. Distinguish a
multiplicative represented theory from a specified commutative
spectral-ring realization. Prove the coordinate-independent criterion
and height-stratum flatness formulation used for elliptic curves.

Develop finite-height formal-group deformations over complete local rings:
the universal Lubin–Tate deformation ring W(k)[[u₁,…,u_(h−1)]] for a
specified height-h formal group over a perfect field k, its universal
property, coordinate changes and automorphism action. Construct the
complete-local deformation prerequisites, using Mathlib's `WittVector`
carrier and its existing ring/Frobenius/Verschiebung APIs, including representability, inverse-limit and base-change proofs.
These algebraic targets supply EllipticCohomology's spectral realization
and Serre–Tate comparison; the Goerss–Hopkins–Miller E∞ realization is owned
there. Include height1 multiplicative and height2 elliptic examples.

## F6. Chromatic localization and fracture

### F6.1. Spectral Bousfield localization

Use G2's stable symmetric spectral model and F3's actual spectra. For a
supplied spectrum E define E-equivalences by derived E-smash and E-acyclic
objects by E∧X≃0; define E-locality by the contractibility of the derived
function spectrum F(A,Y) for every E-acyclic A. Construct Bousfield
localization L_E, its unit, derived mapping-space universal property,
functoriality, exactness and idempotence. Construct the localized model and
homotopy categories, their derived smash/localized smash and function
comparisons. Prove the smallness/cardinal bound and existence by
transfinite homotopy pushouts along a bounded family of E-equivalences,
consuming G2's model and small-object constructions. Prove the required
local presentability/accessibility, left properness, cellular generating
cofibrations and cardinal bounds for these symmetric spectra from
simplicial sets and their sequence/module presentation. Prove the
localization-existence hypotheses for the chosen stable model and its
cofibrant replacements, not just its homotopy category; do
not assume that G2's stable-model existence already proves arbitrary
homological localization. Include all integer shifts in any mapping-space locality criterion. Compare G3's
integer localization and derived p-completion under their actual
hypotheses; these do not supply chromatic localization or its smashing
theorems.

Define the Bousfield class ⟨E⟩ by its acyclic objects, with
`⟨E⟩≤⟨F⟩` meaning every F-acyclic spectrum is E-acyclic.
Construct smash product, wedge/join and equivalence invariance. Construct natural
comparison transformations when the acyclic classes are included, prove
transitivity and unit compatibility, and identify the class of a supplied
smashing localization through its localized sphere. Do not assume every
L_E is smashing.

### F6.2. Nilpotence and its proof constructions

Build the three distinct Devinatz–Hopkins–Smith conclusions on G's
actual derived smash, finite duality and ring spectra:

- `muSmashNilpotence`: for a finite spectrum F, an arbitrary spectrum X
  and a stable map f:F→X, if the actual map MU∧f is null, then
  f^(∧r) is null for some positive r. No bounded-below or finite-type
  hypothesis is imposed on X.
- `muSelfMapNilpotence`: for a finite spectrum F, an integer d and
  f:Σ^dF→F, if the graded endomorphism MU_*f is nilpotent under
  composition, then f^r:Σ^(rd)F→F is null for some positive r.
  Keep the suspension identifications in the iteration.
- `muHurewiczNilpotence`: for a unital homotopy-associative ring spectrum
  R, an integer d and x∈π_dR, x is nilpotent if and only if its
  MU-Hurewicz image in MU_*R is nilpotent. Construct the product on
  MU_*R and its compatibility with Hurewicz. No commutative or E∞
  structure, connectivity or finite-type hypothesis on R is required.

Here finite includes retracts of finite cell spectra. In the core proof,
connective finite type means a connective CW model with finitely many
cells in each degree; construct its homology/filtration finiteness
comparisons. Prove the core theorem for a connective associative ring
with this underlying finite-type model first, then the following
reductions in this order. For a positive-connective finite spectrum P,
its tensor algebra `JP=⋁_(j≥0)P^(∧j)` is a connective finite-type
associative ring. Its word-length splitting turns the core ring theorem
into smash nilpotence for a sphere-source map into P. For a general
finite-source map, finite duality replaces f by S→X∧DF. Factor both
this class and its MU-nullhomotopy through one finite stage of a filtered
finite-cell presentation of X∧DF; suspend into the positive-connective
range and use the tensor-algebra result. Prove compactness, the
suspension/twist comparisons and the finite-retract extension. This
constructs `muSmashNilpotence` for an arbitrary target, rather than
assuming that target is connective or of finite type.

Next, for arbitrary R and d, the free MU-module adjunction identifies
its MU-Hurewicz class with the MU-module map
`Σ^dMU→MU∧R` induced by MU∧x. A zero class therefore gives an
actual null MU-smashed map. Apply `muSmashNilpotence` to x:S^d→R
and compose its smash power with the iterated multiplication of R.
For a nilpotent Hurewicz image first apply this argument to a power of x.
Prove the adjunction, multiplication and suspension comparisons; this
is the unrestricted ring theorem, not a connective-cover assertion.
For the self-map theorem, construct the finite MU-cell ghost bound in
F4's triangulated derived right-MU-module category over G5.4's strict MU,
including finite-cell retracts and suspension shifts. The inductive
cofiber factorization is an arbitrary MU-module map; it need not itself
be the MU-smash of a map of spectra. A fixed power of
MU∧f is zero on π_* by the hypothesis; a sufficiently long composite
of these ghosts out of the finite-cell MU-module MU∧F is actually null.
Compare MU∧F(F,F) with its MU-module endomorphisms by finite duality
and apply the ring-element theorem to f in the endomorphism ring.

Include the Moore-boundary test: in S→^p S→M(p)→^δΣS,
MU_*δ=0, but H₁(δ;𝔽_p) is an isomorphism and field Künneth
shows every smash power of δ is nonzero.

Construct the core nilpotence proof following
[Devinatz–Hopkins–Smith, §§1–3](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/dhs-ocr.pdf).
Use G5.4's complex space-level Bott equivalence and G2.9's
loop/bar comparison, with the stable determinant fibration SU→U→S¹,
to construct the actual additive Bott map ΩSU→BU. Own this
SU-loop/clutching adapter, its rank inclusions and multiplicative
coherence; the bundle Bott theorem alone is not this map. Construct the native SU(r) stabilization and the sphere fibration
SU(r)→SU(r+1)→S^(2r+1), including local trivializations and the
loop homotopy-fibre comparison. Consume the native
`TauCeti.TopCat.serreFibrations` and locally trivial bundle instances;
DGFloer1.2 owns their homotopy LES and all-CW ordinary Serre spectral
sequences, not a second Serre predicate.
Apply G5.3's numerable bundle/Thom diagrams to the finite-rank pullbacks
along ΩSU(r)→ΩSU→BU. Own their stabilized Thom-spectrum
comparison and the E₁/E₂ multiplicative refinement for these loop
maps, including module actions and associativity/coherence. G5's
symmetric commutative Thom diagrams do not themselves provide this
loop-map refinement. Construct X(r), its units, products and rank maps,
H_*X(r)=ℤ[b₁,…,b_(r−1)] with |b_i|=2i and the flat graded
cooperation Hopf algebroids used by the relative Adams comparison. Prove X(1)≃S, the (2r−1)-connectivity of
X(r)→MU and hocolim_r X(r)≃MU, with the Thom homology/product
comparisons. The proof has the following constructions and estimates.

1. Pull the fibration ΩSU(r)→ΩSU(r+1)→ΩS^(2r+1) back over
   HomotopySpheres 3B's actual James stages J_jS^(2r). Construct their
   Thom spectra F_j, the X(r)-module filtration of X(r+1), F₀=X(r),
   quotients Σ^(2rj)X(r), and the homology/comodule basis
   1,b_r,…,b_r^j over X(r+1)_*X(r). Build its relative Thom
   comparisons and the X(r+1)-Adams exact couples here, comparing with
   F4's tower conventions rather than identifying different ring bases.
   Construct their convergent spectral sequence for G_k∧R with
   E₂=Ext_(X(r+1)_*X(r+1))(X(r+1)_*,X(r+1)_*(G_k∧R)),
   its grading, product/action of α, and finite-type/Künneth comparisons.
2. For each prime p set G_k=(F_(p^k−1))_(p). Prove the relative Ext
   change of rings, p-adic/May
   filtration and normalized-cobar estimates reducing to the polynomial
   Hopf algebra generated by b_r^(p^k), |b_r|=2r. Prove vanishing
   lines with slope tending to zero as k grows, uniformly in the
   connective input comodule after its connectivity shift. In the
   normalized cobar model prove vanishing for
   t−s<(2r p^k−1)s−c; in a minimal resolution prove the bound
   t−s<(r p^(k+1)−1)s−c′, with intercepts c,c′ and the input
   connectivity shifts explicitly quantified. These have slopes
   1/(2r p^k−1) and 1/(r p^(k+1)−1), equal at p=2.
   Quantify the intercepts and
   connectivity/finite-type hypotheses and prove the tensor-comodule
   shift of the vanishing bound. Apply them
   to each connective finite-type associative R, positive-degree class
   α∈π_dR, d>0, whose
   X(r+1)-Hurewicz image is nilpotent. After taking a power, α has
   X(r+1)-Adams filtration at least one. Define Tel(α;R) as the
   telescope of the suspended left-multiplication maps and prove, for
   every supplied unital homotopy-associative R and integer-degree α,
   Tel(α;R)≃0 if and only if α is nilpotent; prove its E-smashed
   version detects nilpotence of the E-Hurewicz image when E is a
   supplied ring spectrum. Prove that sufficiently large
   James stages smashed with the multiplication telescope Tel(α;R)
   are contractible, by annihilating each homotopy class. A convergent
   Adams spectral sequence without this stage-dependent estimate is
   insufficient.
3. Construct the combinatorial James–Hopf maps
   H_j:J(Y)→J(Y^(∧j)) for every j≥1, using the ordered j-element
   subwords, their basepoint identifications and filtration/naturality
   homotopies. HomotopySpheres3B's length-two map is only a special case.
   For Y=S^(2r), define h₀=id and h_(k+1)=H_p∘h_k, with H_p
   taken on ΩS^(2r p^k+1), and prove p-local mod-p homology
   surjectivity of every h_k:ΩS^(2r+1)→ΩS^(2r p^k+1).
   Define F′_(p^k−1) as the actual homotopy fibre of h_k composed
   with ΩSU(r+1). Use this iterated composition in the cartesian
   squares, not an unproved literal equality H_p∘H_(p^k)=H_(p^(k+1)).
   Compare them with the pulled-back James stages and construct the cartesian
   squares and p-local fibre sequence
   F′_(p^k−1)→F′_(p^(k+1)−1)→J_(p−1)S^(2r p^k).
   Apply the Thom construction to these squares to identify the
   consecutive G_k. Construct DHS Proposition3.27's actual extension:
   E′=ΩSU(r+1) with its projection followed by h_k to
   ΩS^(2m+1), m=rp^k. Its pullback over J_(p−1)S^(2m)
   is E=F′_(p^(k+1)−1) p-locally. Use the stabilized classifying
   map E′→BU extending the Thom bundle on E. Derive the Ω²S^(2m+1) fibre action from
   this extension; it is not an extra assumed action. Own DHS
   Lemma3.35/Proposition3.33 here p-locally; no integral fibre-sequence
   assertion is inferred from a mod-p calculation.
   Construct the coherent Thom diagonal and maps θ_j on these James
   stages, their binomial composition laws, filtration-quotient
   equivalences and naturality under smashing. In the length-(p−1)
   comparison, (p−1)! is invertible p-locally. Construct
   b:Σ^(2r p^(k+1)−2)G_k→G_k and its cofiber/Bousfield
   decomposition, and prove consecutive
   p-power James stages have the same Bousfield class by proving
   Tel(b)≃0. Use the Ω²S^(2m+1) action derived above, with
   m=r p^k, and prove its compatibility with b.
   Own the little-2-cubes configuration operad, its extended powers
   D_(2,j)(Y)=C₂(j)_+∧_(Σ_j)Y^(∧j). Construct May's approximation
   theorem for the connected based CW sphere input, comparing the
   free little-2-cubes algebra with Ω²Σ²Y, before the specialized stable
   splitting of Ω²S^(2m+1)_+ into D_(2,j)(S^(2m−1)). Construct
   its filtration, products, naturality and mod-p homology operations
   needed for the factorization of powers of b. Prove the mod-p
   vanishing of b and the increasing-connectivity comparison which
   makes each homotopy class in its telescope zero. Supply both the
   odd-prime and prime-2 homology/operation proofs. The source's
   odd-prime calculation leaves prime-2 modifications to the reader;
   those modifications are targets here, not an assumed consequence
   of TB's cohomological Steenrod operations or G's E∞ transfer.
4. Combine the stage-dependent vanishing and the Bousfield comparisons
   to descend nilpotence from X(r+1)_*R to X(r)_*R. The G_k are
   p-local: prove the descent for every prime and the rational branch,
   then assemble the contractibility of X(r)∧Tel(α;R) from rational
   and all p-local homotopy groups. Compactness detects
   a zero MU-Hurewicz class at one finite X(r) stage. Descend to X(1)
   to prove the core connective finite-type ring theorem. Negative
   degrees vanish by connectivity; degree0 uses the isomorphism
   π₀R→π₀(MU∧R) before the positive-degree argument. Then apply
   the preceding reductions. Keep the multiplication telescope distinct
   from an inverse limit or an arbitrary BP completion.

### F6.3. Finite height, periodicity and telescopes

Fix a prime p. Before finite-type classification, construct P(n) and B(n)
from F3's BP and F5's height ideals by actual ordered cofibers and
localization, with P(0)=BP, P(n)=BP/(p,v₁,…,v_(n−1)),
B(n)=v_n⁻¹P(n) for n≥1, and P(∞)=hocolim_nP(n).
Use F3's ordered-cofiber homotopy products and construct their
homotopy BP-actions and compatible P(j)/B(j)-actions on K(j).
These are unital/associative homotopy actions, not an assumed A∞
BP-module category. Construct the K(j) field Künneth and graded
module-basis splitting at this point: every nonzero homotopy K(j)-module
is a wedge of suspensions of K(j), by choosing a graded coefficient
basis and using its unit/action maps. Deduce the Bousfield minimality
`⟨Z⟩∧⟨K(j)⟩∈{0,⟨K(j)⟩}` for every spectrum Z.
Prove `P(∞)≃H𝔽_p` by the homotopy-cofiber coefficient computation
and connectivity. Construct the Johnson–Wilson–Würgler stable natural homology
comparison
`Λ_X:B(n)_*X≃K(n)_*X⊗_(𝔽_p)𝔽_p[v_(n+1),v_(n+2),…]`.
Use F3's BP operations and ordered regular quotients to construct
quotient-operation lifts and Bocksteins. Prove their completed module
presentation indexed by BP-operation multi-indices and binary Bockstein
words, with Cartan, coefficient and suspension comparisons; prove the
prime-2 product relations separately. The comparison consumes the following explicit part of that API.
For each finite-support multi-index E in v_(n+1),v_(n+2),…,
write |E|=b_E d_n+a_E, d_n=2p^n−2 and 0≤a_E<d_n.
Construct the quotient-operation components
`s_E:P(n)→Σ^(a_E)k(n)`, with k(n) the connective quotient
killing v_i for i≠n, and its localization k(n)→K(n).
For E=(0,…,0,e_(n+1),…) pin
`σ^nE=(p^n e_(n+1),p^n e_(n+2),…)` and
`c_E=b_E−Σ_(i>n)e_i≥0`. Thus
`|σ^nE|=c_Ed_n+a_E`. Define the component by actual stable maps
`s_E:=λ_n∘v_n^(c_E)∘(r_(σ^nE))_n`, with the displayed
suspensions, and λ_n:P(n)→k(n). Construct this quotient-operation
lift for every height using the BP version of the completed-operation
module presentation. Compare its lifting/commutator obstructions through
successive regular cofibers with the completed Koszul–Bockstein
presentation, and construct the nullhomotopies expressing its Cartan
and v_n-linearity identities. The right-unit congruence alone is not
its descent proof, and uniqueness of arbitrary chosen lifts is not
presumed. Define
`Â_X(y)=Σ_E v_n^(−b_E)s_E(y)⊗v^E`, where |v^E|=|E|.
For finite X choose b with P(n)_qX=0 for q<b. On input degree t,
the first operation is zero when |σ^nE|>t−b. There are only
finitely many E with bounded shifted degree, so the sum is finite;
multiplication by v_n^(c_E) occurs after this vanishing test.
Construct the coefficient dual basis. Pin the triangular range,
including ties: `r_F(v^E)≡0 mod I_n` if
`|F|≥|σ^nE|` and `F≠σ^nE`, while
`r_(σ^nE)(v^E)≡v_n^(Σe_i) mod I_n`. In each fixed
connective degree this is a finite triangular matrix with the displayed
powers of v_n on its diagonal. After inverting v_n the normalization
v_n^(c_E−b_E) makes that diagonal1. Construct its lower-finite
triangular inverse on the localized module and compare the fixed-degree
connective blocks; do not invert these diagonal entries before localization.
This proves the coefficient isomorphism.
The all-height operation lift gives `Â(v_n y)=v_n Â(y)`, hence
Λ after inverting v_n. Prove the comparison on finite spectra by
exactness and cells, then extend by filtered finite-subcomplex
homotopy colimits to all CW spectra and pairs, with suspension,
boundary and filtered-colimit naturality. This is an additive theory
comparison, with no imposed multiplicative or BP-linear splitting.


Construct the coefficient-localization and ordered-cofiber diagrams on
actual scalar-action maps. The maps on quotients are the supplied BP
coefficient actions, not arbitrary fillers with the same π_* action.
Construct action comparisons for quotient inclusions and boundaries,
their commuting-map homotopies, and the rectified ladders used by each
telescope. For infinitely many higher-generator cofibers, prove their
filtered-colimit comparison and its compatibility with localization.
Keep the usual meaning of unital homotopy ring, with actual unit and
associativity identities in the stable homotopy category. For an acyclic-
class argument needing less, construct explicitly a spectrum pairing
`m:C∧C→C`, a unit candidate `η:S→C`, and prove
`ℓ_C=m∘(η∧id_C)` is a true π_*-isomorphism. This is a weaker
pairing certificate, not a redefinition of a unital homotopy ring.
Spectral Whitehead and ℓ_C⁻¹ give the actual retraction used below;
no phantom difference is silently set to zero. For telescope pairings
use the diagonal cofinal sequence in the product of the two telescope
indices, finite-stage products and their scalar-action homotopies.
Prove the unit comparison on true π_* and transport it through the
actual quotient/localization maps. Retain full homotopy-ring or module
identities wherever those structures are used.

For any suspended self-map f:Σ^dZ→Z prove
`⟨Z⟩=⟨cofib(f)⟩∨⟨Tel(f)⟩` by smashing with an arbitrary
spectrum. A zero smashed cofiber makes f invertible and identifies
the initial object with its telescope. This needs no centrality or ring
hypothesis; central coefficient localization is a specialization.
Use this to prove
`⟨P(n)⟩=⟨K(n)⟩∨⟨P(n+1)⟩` and `⟨B(n)⟩=⟨K(n)⟩`.
The second equality follows on all CW spectra directly from the
stable natural homology comparison just constructed, with its
filtered-colimit extension. The rational branch B(0)=p⁻¹BP is a
nonzero Hℚ-module and has class K(0)=Hℚ. This proof does not
require a vanishing colimit to have an acyclic finite stage.

Prove the following pairing/field test before the remaining comparisons.
For nonzero C with the preceding pairing certificate and
⟨C⟩≤⟨K(j)⟩, K(j)∧C cannot vanish: otherwise C∧C=0,
contradicting the equivalence ℓ_C. Field Künneth gives
`⟨K(j)⟩=⟨K(j)∧C⟩≤⟨C⟩`, hence equality.
Also prove the locality criterion: if ⟨C⟩≤⟨E⟩, then C∧Y is
E-local for every Y. Factor each map A→C∧Y, for E-acyclic A,
through C∧A using η and m, and apply the inverse of ℓ_C∧id_Y;
include every integer shift. These statements include genuine unital
homotopy rings, but only consume the explicit weaker certificate.
For fixed n≥1 apply the finite lower-generator cofiber/telescope
decomposition to v_n⁻¹P(j), j=0,…,n+1. For j≤n, the object
v_n⁻¹B(j) is built from B(j) by the actual scalar localization.
Its pairing certificate and nonzero coefficient ring give class K(j)
by the preceding test.
The coefficient v_n acts by zero on π_*P(n+1). Thus π_* of
its telescope is the colimit of zero transition maps and vanishes;
spectral Whitehead gives v_n⁻¹P(n+1)≃0. No nullhomotopy of
the individual coefficient-action map is inferred from this fact.
Deduce
`⟨v_n⁻¹BP⟩=⟨K(0)∨⋯∨K(n)⟩`.
Apply the same finite decomposition to E(n)/I_j, j=0,…,n+1.
Construct its localized term v_j⁻¹(E(n)/I_j) as the compatible
higher-generator quotient/localization of B(j), so its class lies
below K(j). Its explicit nonzero coefficient ring and pairing certificate
give equality by the same test. The terminal quotient is zero since
v_n is a unit. This proves
`⟨E(n)⟩=⟨K(0)∨⋯∨K(n)⟩=⟨v_n⁻¹BP⟩`.
All coefficient maps, centrality homotopies and products used in
these finite diagrams are construction targets here, compatible with
F3's ordered quotient models. In particular compute
BP_*E(n)=BP_*BP⊗_(BP_*,η_R)E(n)_* by the right-flatness
of the cooperation algebra and the actual ordered regular cofibers;
construct the flipped E(n)_*BP comparison with the antipode.
Prove E(n)_*BP is flat over its right BP_* action: extend an
arbitrary short exact sequence of graded BP_*-modules to comodules
by BP_*BP⊗_(η_R)−, use cooperation flatness, and apply F5's
Landweber-exact E(n)_*⊗_(η_L)− functor. Identify the resulting
module functor with E(n)_*BP⊗_(BP_*)−. Deduce the regular-power
cofiber and quotient comparisons used in the Moore localization
maps, with the indicated right action.
These are arbitrary-spectrum acyclic class proofs, preceding type examples, periodicity and Moore systems.
K(n) is not assumed Landweber exact over BP_*.
Construct `muPtypicalRingComparison`: the homotopy-ring map
BP→MU_(p), its unit/product homotopies and the MU_(p) homotopy
BP-algebra action from F3's p-typicalization. It transports a null
BP-smashed map to a null MU_(p)-smashed map. It does not assert
an A∞ structure on BP.

Construct Smith's idempotent toolkit before its finite-spectrum
applications. Consume SchurWeyl Layers0,2,5's native Young-diagram,
row/column, rational symmetrizer and hook-length APIs. Form the same
row-symmetrizer times column-antisymmetrizer finite sum over ℤ, prove
its quasi-idempotent equation by the injective rational comparison,
and use the staircase partition λ_i=(a+1−i)(p−1), 1≤i≤a.
Prove its hook product μ_λ is prime to p, so
 e_a=μ_λ⁻¹c_λ∈ℤ_(p)[Σ_((p−1)binom(a+1,2))]
is an actual idempotent. Own the p-local transport and its actions on
graded tensor powers with Koszul signs. For V=V⁺⊕V⁻ put
 a_V=dimV⁺+floor(dimV⁻/(p−1)),
 k_V=(p−1)binom(a_V+1,2) and e_V=e_(a_V).
Prove its nonzero-image and subspace-annihilation tests, and the
free-summand criterion for the local finite Hopf algebras used in
Ravenel AppendixC.2.2. Construct their image/splitting and homology
base-change comparisons on finite p-local smash powers, using G's
idempotent splitting. These p-local/graded constructions do not
follow from complex semisimplicity.

Construct the linear-connectivity MU/BP telescope theorem: for a sequence X_j with connectivity
c_j≥aj+b for fixed real a,b and maps zero on MU homology, its
homotopy direct limit is zero. Use the Smith summand of smash powers
of finite CP spaces to produce a nonzero torsion-free finite W with
arbitrarily small-slope Ext vanishing over
`P_* = 𝔽_p ⊗_(BP_*) BP_*BP ⊗_(BP_*) 𝔽_p = 𝔽_p[t₁,t₂,…]`.
Construct its map to the dual Steenrod algebra with t₀=ξ₀=1 and
these pinned coproducts:
`Δt_n=Σ_(i=0)^n t_i⊗t_(n−i)^(p^i)` in P_*, and
`Δξ_n=Σ_(i=0)^n ξ_(n−i)^(p^i)⊗ξ_i` in the polynomial
part of A_*. Derive the first from composition of F3's strict
p-typical coordinates modulo (p,v₁,v₂,…), where the law is
additive. With ζ_i=χ(ξ_i), antipode anti-comultiplicativity gives
`Δζ_n=Σ_i ζ_i⊗ζ_(n−i)^(p^i)`. Prove the coalgebra identity
for t_i↦ζ_i at odd p and t_i↦ζ_i² at 2 by Frobenius.
This pins the side of the cooperation map rather than allowing an
uncompared opposite coproduct. Construct the P_*-comodule H_*W from the BP_*BP coaction
on 𝔽_p⊗_(BP_*)BP_*W and compare with ordinary homology; prove
the corresponding A_*-coaction factors through this P_* model.
At p=2 this is a proper sub-Hopf algebra, not the full polynomial
A_* with its h₀-towers. Prove the Anderson–Davis/Miller–Wilkerson
Margolis vanishing criterion needed here, the BP cobar/May comparison
and connectivity shifts, and the increasing-Adams-filtration bound
on composites. Choose the slope against a so each fixed homotopy
class dies at a finite stage. Prove W has the sphere Bousfield class
by its torsion-free bottom homology summand and the MU/BP-smash
nilpotence theorem. This is a homotopy direct-limit theorem, not
an inverse-limit vanishing statement.

Put K(0)=Hℚ, K(∞)=H𝔽_p, and use F3's K(n)
for 1≤n<∞. Prove the Morava-height forms of nilpotence: for a
finite-source map f:F→X with arbitrary p-local target, vanishing of
K(m)_*f for every 0≤m≤∞ detects smash nilpotence; for a self-map
of a finite p-local spectrum, nilpotence of each K(m)-homology
endomorphism detects composition nilpotence. Prove their comparison
with the MU-smash and MU-Hurewicz versions using the preceding class
identities. For a ring R and a class x whose every height-Hurewicz
image is nilpotent, form the left-multiplication telescope R′.
K(m)∧R′ is zero for all heights, including ∞. The null unit in
P(∞)∧R′ is already null at some finite P(N)∧R′ by sphere
compactness. Use the preceding ordered-cofiber homotopy products
and module actions to compare P(j)∧R′ with the left-multiplication telescope
of the P(j)-Hurewicz class: the vanishing of its unit class forces
a power of that class to vanish, hence this telescope is contractible.
Descend through the P(j) class identities to BP∧R′≃0. Apply the
MU/BP nilpotence comparison to x. For finite-source general maps,
use finite duality and the free tensor algebra on the target of the
resulting sphere-source map; its word-length summands recover actual
smash powers. For finite self-maps use the endomorphism ring.
This argument uses the class identities, not a linear-connectivity
hypothesis on the arbitrary target. Include height∞ for arbitrary targets;
the unit S→H𝔽_p is not detected by finite-height K-theories.
Use the preceding field Künneth and construct its finite-duality
comparisons. Prove finite support monotonicity
K(n)_*F=0⇒K(n−1)_*F=0, n≥1, and eventual nonvanishing
K(n)_*F≠0 for all sufficiently large n when F is nonzero finite
p-local. Define its type by its least nonzero finite height, and type∞
for the zero spectrum. Prove the support characterization before using
type in a construction. Prove monotonicity from the finite BP-comodule
height filtration and its derived K(n) comparisons, and eventual
nonvanishing from the finite-cell K(n)-AHSS when the period is larger
than the cell range, followed by finite-p-local ordinary-homology
detection. Do not replace either comparison by a false inclusion
between the Bousfield classes of distinct Morava fields.

Define a positive-degree v_n self-map by K(n)-homology invertibility and nilpotence at
every other height. Its positive degree makes mod-p homology nilpotent
on a finite spectrum. Prove some positive power of any such map has degree
2a(p^n−1), a>0, inducing scalar multiplication by v_n^a on
K(n)-homology. This is a normalization of an existing map; arbitrary
v_n self-maps can have other degrees. For chosen maps v:Σ^dF→F
and w:Σ^eF→F, prove there exist positive a,b with ad=be and
v^a=w^b. For h:F→G between type-n spectra prove suitable
equal-degree powers intertwine h with its actual suspension.
Carry these choices/comparisons through composition.

Construct nonzero finite type-n spectra for every n≥1 by the following
Smith/Margolis construction, separate from the torsion-free type0 CP
summands used above. Own the finite Steenrod sub-Hopf algebras,
Margolis homology, free-module criteria and associated Adams estimates;
consume TB's mod-p Steenrod/Adams carriers and construct these spectral
instances. Construct E(Q_i) and, for t>0, the Hopf algebra T_t generated
by P_t^s, 0≤s<t, dual to 𝔽_p[ξ_t]/(ξ_t^(p^t)), with
their dual Hopf-ideal comparisons, including the prime-2 proof. For a p-nilpotent operator P use the
Margolis
criterion ker(P)=im(P^(p−1)); for square-zero Q use ker(Q)=im(Q).
Prove their equivalence to freeness over the corresponding truncated
polynomial/exterior subalgebras, rather than treating an odd-primary
P as square-zero.

For finite p-local X define strong type n by these exact conditions
on H=H^*(X;𝔽_p). At p=2 require vanishing P_t^s-Margolis
homology for s+t≤n+1, excluding (s,t)=(0,n+1), with
Q_n=P_(n+1)^0. At odd p require this vanishing for s+t≤n and
Q_i-Margolis vanishing for i<n. In both cases require Q_nH=0
and dim_(𝔽_p)H=rank_(K(n)^*)K(n)^*X. Define partial type n
by the latter two conditions and nontrivial action of each Q_i and
P_t^0 occurring in the strong-type conditions, without the freeness
or s>0 conditions. Build the actual partial-type seed
`B_2^(2p^n) = (BC_p)^(2p^n)/(BC_p)^1`, using AT8.8's bar/CW
model and its skeletal/stunted quotient. Compare its standard lens/RP
cells and mod-p operations with that model. At odd p use the basis
x^k (1≤k≤p^n), yx^k (1≤k<p^n), |x|=2, |y|=1,
with Q_i(yx^k)=x^(k+p^i) and P_t^0(x^k)=k x^(k+p^t−1),
and their y-multiples. Verify nontriviality using classes actually
present in the quotient, such as yx, and prove the analogous prime-2
calculation. Q_n-triviality and the rank equality follow from the
actual finite K(n)-AHSS, including its edge and extension comparison.

Apply the already constructed graded p-local Smith idempotents to
smash powers of this seed. For the finite family of sub-Hopf algebras
in the strong-type conditions, construct free summands in suitable
tensor powers from each specified nontrivial action. Choose a common
power and the staircase idempotent using the nonzero-image and
Margolis-image dimension inequalities: for the relevant subspaces
U⊆V require dim U⁺≤dim V⁺−1 or
 dim U⁻≤dim V⁻−(p−1). An exterior-Q free summand supplies a
nonzero even part, and a rank-one free T_t summand supplies at
least p^t to one parity part at odd p. At2 the dual basis x^j,
0≤j<2^t, has |x|=2^t−1 odd, so there are 2^(t−1) vectors
in each parity for t≥1. Thus it also supplies the required ≥1
codimension, since p−1=1. Prove that tensoring a free
summand with a nonzero module preserves a free summand, and that
Koszul permutation actions commute with the Steenrod action by
cocommutativity of its coproduct. Use these facts to choose the
common power, using the Hopf regular-tensor isomorphism from the
coproduct and antipode with its graded signs; prove the resulting retract
has nonzero mod-p homology, is free over every required subalgebra,
retains Q_n-triviality and satisfies the K(n)-rank equality. This
constructs an actual nonzero strong-type X. For i≥1 identify Q_i with the
first K(i)-AHSS differential of length 2p^i−1, with its specified
v_i coefficient and homology dual. Treat Q_0 by the integral
Bockstein comparison and finite p-local rational-homology detection,
not a mod-p AHSS for K(0)=Hℚ. Prove the later-differential
and survival comparisons establishing that this X has type n.

Construct its first v_n map in the multiplicative mod-p Adams spectral
sequence for R=DX∧X. Prove the Margolis bound
`Ext_A^(s,t)(H^*R,𝔽_p)=0` for s>c+(t−s)/(2p^n−2).
For A_N generated by Sq^1,…,Sq^(2^N) at 2 and by
β,P^1,P^p,…,P^(p^(N−1)) at odd p, construct the change-of-rings
map to Ext_(A_N) and prove it an isomorphism when
`s>(t−s)/(2p^n−2)−k_N`, N>n, with k_N→∞.
Construct the restriction λ to the Q_n-Ext polynomial algebra and,
for sufficiently large N, an Ext_(A_N) class mapping to a positive
v_n power. Lift it through the indicated isomorphism. Construct the needed
finite-sub-Hopf Frobenius-power lift from unit cohomology by its
May/change-of-rings spectral sequence and the strong-type Margolis
conditions, so its image in Ext_(A_N)(H^*R,𝔽_p) is central.
For a possible u=d_r(y), put both yu and uy in the indicated
isomorphism region and prove φ(yu−uy)=0, hence yu=uy.
The derivation identity then makes the next p-power a cycle;
the vanishing line eventually excludes every further differential.
Prove strong convergence and resolve the multiplicative extensions;
identify the image in K(n)_*R=End(K(n)_*X) as scalar multiplication
by a v_n power. Since X is finite of positive type, its relevant
positive-degree endomorphism homotopy is finite p-primary: compare
its p-completion with the actual p-local stable map. Verify K(n)-invertibility. For every m>n construct the connective
Morava model k(m) from F3 and prove H^*k(m)=A//E(Q_m), using
the following mod-p computation and lower-generator Bocksteins.
Own `H^*BP⟨j⟩=A//E(Q₀,…,Q_j)` for j≥0 at both primes:
start with BP⟨0⟩=Hℤ_(p). For j≥1 use the actual cofiber
`Σ^(2p^j−2)BP⟨j⟩ --v_j→ BP⟨j⟩ → BP⟨j−1⟩`.
Prove v_j acts by zero on mod-p cohomology, from its BP-action
and zero mod-p Hurewicz image. The cohomology LES therefore gives
`0→Σ^(2p^j−1)H^*BP⟨j⟩→H^*BP⟨j−1⟩→H^*BP⟨j⟩→0`.
Identify the connecting primitive of degree2p^j−1 with Q_j.
Prove connectivity and finite type before the Poincaré-series count,
and use this sequence to prove the cyclic-module identification
inductively. Compare the regular-quotient models with these maps,
not just their vector-space dimensions. Change of
rings gives the mod-p Adams spectral sequence for k(m)∧R over
E(Q_m). Its cochain degrees lie in a strip
`t−s≥(2p^m−2)s−C`, with C determined by the finite cell range
of R, uniformly in m. Prove strong convergence and naturality of
the Hurewicz map from R. A high p-power of the candidate has
stem (2p^n−2)s, below that strip for every m>n; its image is
zero in k(m)_*R and hence K(m)_*R after inversion. The lower
heights already vanish on X. This proves other-height nilpotence
before transporting periodicity to other finite spectra.
Then prove Hopkins–Smith thick-subcategory classification: the full
thick subcategories of finite p-local spectra are C₀, the C_n of
K(n−1)-acyclic finite spectra for n≥1, and C_∞={0}. Prove their
strict order and type/support characterization. Use the Morava
nilpotence theorem on the finite evaluation/coevaluation fibre and
its iterated-smash cofiber filtration for the classification.
Prove the nilpotence and ideal-extension argument that transports a
self-map across finite cofiber/retract constructions in a thick
subcategory, yielding Hopkins–Smith periodicity for every type-n
finite spectrum, n≥1.

Include Adams' v₁ maps on the mod-p Moore spectrum, of degree2p−2 for odd p and
degree8 at p=2, constructing their K-theory/Adams-operation detection
and α₁/e-invariant comparison rather than deducing their minimal
degrees from the general existence theorem.

Construct the compatible generalized Moore systems by successive
cofibers of these self-maps. Prove the BP-homology normalization
BP_*v=v_k^a on the preceding quotient and its unit/sign comparisons,
not merely invertibility on K(k). For the completion specialization, work in F4's actual derived
right-module category over strict MU_(p). After a further compatible
p-power construct the stronger identity
`MU_(p)∧v = multiplication by v_k^a` on the chosen ordered
MU-quotient. Centrality here comes from the commutative strict
MU_(p)-action; even degree removes the Koszul sign. Prove it as follows: the difference from the central scalar map is a ghost; F6.2's finite-MU-cell ghost bound
makes it nilpotent. A power of p annihilates the quotient's homotopy,
so the same ghost bound makes a further p-power annihilate its actual
identity map. Choose p^s with all relevant intermediate binomial
coefficients divisible by this power; the binomial expansion then
kills the ghost difference. Absorb this additional power and the
unit normalization (including a factor (p−1)p^N where needed)
into N(prefix), and prove independence of the chosen lift modulo
the preceding height ideal. An equality only on homotopy groups
does not itself supply the module-map identity. For each prefix
(p^(i₀),v₁^(i₁),…,v_(k−1)^(i_(k−1))) construct a positive integer
N(prefix) such that the next construction works whenever i_k is a
positive multiple of N(prefix). Construct cofinal choices and their
actual transition maps/homotopies. Before any use in F6.4, transport
the scalar-map identities to the whole BP-smash system, at every
prefix length h, including h=n+1. Use ε:MU_(p)→BP and
ι:BP→MU_(p), their homotopy-ring comparisons ε∘ι≃id,
and lifted generators ṽ_i with ε(ṽ_i)=v_i. At the map level write
`BP∧v=(ε∧id)∘(MU_(p)∧v)∘(ι∧id)` and use ε's
multiplicative homotopy to identify its scalar action with v_i^a,
not just its action on BP-homology. Tensor the fixed comparison
homotopies with the entire prefix/transition diagrams and rectify
the resulting compatible cofiber ladders. Construct, for the cofinal
system M_a of every such length, actual unit/transition compatible
equivalences
`BP∧M_a≃BP/(p^(a₀),…,v_(h−1)^(a_(h−1)))`,
where every right-side self-map is its specified scalar BP-action.
Prove compatibility under deleting a prefix, enlarging exponents,
cofiber boundary maps and duality. The MU and BP scalar identities
and these rectified systems precede both chromatic colimit models
and completion. This does not use an unconstructed coherent
BP-module category. Construct the finite homotopy-unital
multiplications and central-power/module diagrams needed for each
specified finite stage, and their pro-level compatibility after
passing to cofinal powers. Construct the n=1 tower directly from
p-power Moore spectra. Do not assert that every stage, or even a
cofinal family, carries a commutative associative or A∞ ring
structure. Coherent products on a derived limit require separately
supplied algebra models and comparison maps. This does not assert
existence of all small-exponent Smith–Toda complexes.

Construct telescopes T(n) of chosen v_n maps, with T(0)=S_(p)[1/p],
their independence in Bousfield class, the inequality
⟨K(n)⟩≤⟨T(n)⟩ and the resulting localization-unit comparisons.
Construct finite localization L_n^f away from the finite type-(n+1)
spectra, its smashing universal property, its class
⟨T(0)∨⋯∨T(n)⟩. Using the earlier Johnson–Wilson class identity,
prove `⟨E(n)⟩≤⟨T(0)∨⋯∨T(n)⟩` and construct L_n^f→L_n
with localization-unit/naturality comparisons. Construct it by localizing
G2's spectral model at the small set Σ^dF→0, d∈ℤ, for one
chosen finite type-(n+1) F; thick classification identifies this with
all such finite spectra. Prove the kernel is their localizing tensor
ideal by the localization cell filtration. Compactness of these
finite generators makes local spectra closed under coproducts and
all stable homotopy colimits. Consequently L_n^fS∧X is local
for every X, and the fiber of X→L_n^fS∧X belongs to that
ideal. This proves the smashing universal property. Prove its stated
class by the finite height cofiber/telescope tower: its top finite
term is annihilated by L_n^f, each T(i), i≤n, is finite-local,
and the successive telescope/cofiber class inequalities detect zero
after smashing. This construction and its derived mapping-space
localization property precede the following comparisons.
Before F6.4, prove the finite-source telescope comparison
`L_k^fM≃v⁻¹M` for each finite type-k M, k≥1, and chosen
v_k map v, with its actual unit. Its cofiber has type≥k+1.
For every finite type>k F, the map induced by v on D(F)∧M
has nilpotent action at every height, including ∞; finite self-map
nilpotence makes a power null. Compactness identifies maps out of F
into the telescope with their colimit, so that telescope is finite-local.
Its unit is a finite-local equivalence, proving the comparison.
Use p-inversion and rationalization for k=0. Construct the naturality
of these comparisons under the equal-power intertwining maps above.

Also prove generalized-Moore pro-recovery here, before any use of
L_n or smashing. For each length k≥1 choose the coherent cofinal
inverse tower M_a and its unit-compatible maps from the preceding
construction. For every finite spectrum Z of type≥k prove
`Z→{Z∧M_a}_a` is an isomorphism in Pro(Ho(Sp_(p))).
Construct this pro-category as the opposite of Ind of the opposite
homotopy category, with its lim-colim mapping formula, and compare
the actual coherent towers with their images. For each lower-generator
self-map on a prefix smashed with Z, its action is nilpotent at every
height: at its own height Z is acyclic, at other heights the map is
nilpotent, including ordinary mod-p homology. Finite self-map
nilpotence makes a high power null. In the resulting cofiber tower
the unit summand is constant Z and the shifted summand has eventually
zero transition maps. Induct on the prefixes to obtain the pro-isomorphism,
with naturality in finite Z and cofinal refinements. Treat k=1 directly
with p-power Moore spectra. No splitting of an entire coherent tower
or ring structure on its stages is required. Prove independence of
the chosen pro-class and retain the specified coherent spectrum-level
unit/transition maps for homotopy limits.

Define Γ_0^fS=S_(p), L_(-1)^f=0, and
`Γ_k^fS=fib(S_(p)→L_(k−1)^fS)` for k≥1.
Construct its counit and the natural equivalence
`hocolim_a D(M_a) ≃ Γ_k^fS`, using duals of the inverse
Moore unit/transition maps, with no self-duality convention imposed
on M_a. Each D(M_a) is finite type k and thus finite-acyclic.
For every finite type≥k Z, the pro-recovery comparison for D(Z),
finite duality and compactness show
`Z∧hocolim_a D(M_a)→Z` is an equivalence. Hence the cofiber
of the counit to S is L_(k−1)^f-local, while its source is
L_(k−1)^f-acyclic. The localization universal property identifies
this counit with Γ_k^fS→S. Construct this identification naturally
under cofinal changes and compare its BP-smash with the ordered
regular dual quotients:
`BP∧D(M_a)≃Σ^(−k−Σ_(i<k)a_i|v_i|)BP/(v_i^(a_i):i<k)`.
Here v₀=p and |v₀|=0; the transition maps are the actual duals
of quotient maps, not forward quotient-unit maps. Use the earlier
system-level scalar transport and G2's finite-duality/cofiber API
for this comparison and all boundary signs.

Keep these functors and classes distinct from E(n)-localization;
no telescope comparison is inferred from periodicity or thick
classification. The Thom spectra X(r) above and these telescopes have
separate definitions and notation.

### F6.4. Johnson–Wilson classes, smashing and fracture

For each prime p construct `muPtypicalPolynomialCoefficientIso`, using F3's
single Cartier-idempotent splitting and F6.3's `muPtypicalRingComparison`
i:BP→MU_(p). It is the graded BP_*-algebra isomorphism

`BP_*[z_n : n≥1, n≠p^j−1 for every j≥1] ≃ MU_(p)*`,

whose BP_* structure is i_* and whose z_n are the chosen MU polynomial
generators in the omitted degrees. Use F2/F3's polynomial coefficient
presentations and p_*i_*=id: on indecomposables of degree 2(p^j−1),
the inclusion/projection scalars a_j,b_j satisfy a_j b_j=1. Thus
`i_*(v_j)=a_j x_(p^j−1)+f_j(x_1,…,x_(p^j−2))` with a_j a unit.
Construct the inverse by the degreewise triangular recursion, including
its grading, coefficient embedding and finite-support monomial basis.
This generic coefficient construction precedes the localization applications
below; those applications and F6.6 use this same i_* and basis.

Use F6.3's already constructed Johnson–Wilson and P(n)/B(n)
class comparisons, followed by its actual cofinal MU/BP Moore systems
and their map-level quotient/transition equivalences. The class comparisons
precede finite-height nilpotence and periodicity; the Moore systems are
constructed after periodicity and before this item.
Prove K(i)∧K(j)≃0 for distinct finite heights, including rational
height0, on the actual spectra. No identity of a finite localization
with L_n is inferred.

Set L_n=L_(E(n)) and C_nX=fib(X→L_nX) for the acyclic fiber,
distinct from F6.3's thick subcategories C_n. Prove the Hopkins–Ravenel smashing theorem as the
natural unit-compatible equivalence `L_n X≃L_nS∧X` for every
p-local spectrum X and finite n≥0. Construct its proof through
[Ravenel, Chapter8 §§1–5](https://www.sas.rochester.edu/mth/sites/doug-ravenel/mybooks/nilpb2020.pdf),
with the following intermediate APIs before invoking smashing.

1. Construct the spectral chromatic resolution using F6.3's finite
   acyclizations Γ_k^fS and their Moore-dual colimit models. First
   construct the natural triangles
   `Γ_(k+1)^fS→Γ_k^fS→L_k^fΓ_k^fS→ΣΓ_(k+1)^fS`, k≥0.
   They are the fiber triangles of the nested finite localizations:
   prove both L_(k−1)^f L_k^f≃L_(k−1)^f and
   L_k^f L_(k−1)^f≃L_(k−1)^f, compatibly with their units,
   by the universal properties. Exactness and finite-local smashing
   identify L_k^fΓ_k^fS with fib(L_k^fS→L_(k−1)^fS);
   use this identification in the finite-limit/cofiber comparison. These
   constructions use finite localization's earlier smashing theorem,
   not the Hopkins–Ravenel theorem being proved here.

   Construct the unit-compatible equivalence
   `BP∧L_k^fΓ_k^fS≃v_k⁻¹BP∧Γ_k^fS`.
   For each finite D(M_a), the earlier finite-telescope theorem and
   the scalar-map identity, transported through finite duality, give
   `BP∧L_k^fD(M_a)≃BP∧v_k⁻¹D(M_a)≃v_k⁻¹BP∧D(M_a)`.
   The target is E(k)-local by the pairing certificate and hence
   L_k^f-local by the class inequality. Obtain this comparison as
   the extension of its specified unit. Prove the space of such
   extensions is contractible by the derived mapping-space localization
   property, and use it to assemble the coherent comparison on the
   entire tower. This proves naturality and all transition coherences,
   rather than choosing unrelated telescope equivalences. Pass to the
   Moore-dual homotopy colimit; both finite
   localization and smash preserve it. For k=0 use p-inversion.

   Set spectral N^k=Σ^k(BP∧Γ_k^fS) and
   M^k=Σ^k(BP∧L_k^fΓ_k^fS). Construct their homotopy BP-actions,
   comodule and connecting-map comparisons and identify M^k≃v_k⁻¹N^k.
   The preceding triangles give N^k→M^k→N^(k+1).
   Compute π_* from the actual regular Moore dual quotients and
   their transitions. Prove these groups are even, that localization
   N^k_*→v_k⁻¹N^k_* is injective, and that the cofiber groups
   are its cokernel. This gives the source chromatic BP-comodule
   resolution `0→N^k_*→M^k_*→N^(k+1)_*→0`, N⁰_*=BP_*.
   Prove the comodule structures and degree shifts agree with its
   algebraic construction, not only abstract isomorphisms of groups.

   Identify `L_n^fBP≃BP∧L_n^fS≃cofib(BP∧Γ_(n+1)^fS→BP)`.
   Construct its finite filtration, with layers BP∧L_k^fΓ_k^fS
   for 0≤k≤n, from these exact triangles and their octahedral
   comparisons. Each layer is E(n)-local: the displayed comparison
   presents it as v_k⁻¹BP∧Γ_k^fS, which is E(k)-local by its
   pairing certificate, hence E(n)-local. Its Bousfield class lies
   below E(k), hence below E(n). Finite extensions give both locality
   and the class inequality for L_n^fBP. The fiber is the stated
   Moore-dual colimit of BP∧D(M_a), all E(n)-acyclic. Thus
   BP→L_n^fBP is an E(n)-equivalence, giving L_n^fBP≃L_nBP
   and C_nBP≃BP∧Γ_(n+1)^fS. Its source-normalized cofiber is
   `Σ^(−n−1)N^(n+1)→BP→L_nBP`.
   Finally E(n)∧BP has class E(n), by its unit/action retraction
   and BP∧K(k)≠0 for k≤n. Apply E(n) to this unit to deduce
   `⟨L_nBP⟩=⟨v_n⁻¹BP⟩=⟨E(n)⟩`.
   Construct the genuine unital homotopy product on L_nBP by
   locality: BP∧BP→L_nBP∧L_nBP is an E(n)-equivalence,
   so the map BP∧BP→BP→L_nBP extends uniquely in the stable
   homotopy category. Prove unit/associativity by the same uniqueness
   on the corresponding two-/three-fold smashed comparison maps.

   Prove the strong localization theorem
   `L_n(BP∧Y)≃BP∧L_nY≃L_nBP∧Y`.
   First finite duality gives D(M_a)∧L_nY≃L_n(D(M_a)∧Y)=0,
   since each D(M_a) has type≥n+1. Thus the Moore-dual colimit
   gives BP∧Γ_(n+1)^fS∧L_nY=0, and the cofiber gives
   BP∧L_nY≃L_nBP∧L_nY. The E(n)-equivalence
   Y→L_nY and the proved class of L_nBP identify the latter
   with L_nBP∧Y. Finally, if A is E(n)-acyclic then
   L_nBP∧A=0; the unit/action factorization of every map
   A→L_nBP∧Y through L_nBP∧A proves locality in every
   shift. This identifies the composite with L_n(BP∧Y), without
   the global smashing theorem for L_n. Construct the MU_(p)
   counterpart by the actual p-typical wedge comparison
   `MU_(p)≃⋁_b Σ^|b|BP`. Construct its BP_* monomial basis from
   the polynomial coefficient/idempotent comparison, realize the maps
   by the supplied homotopy BP-action and prove true π_* isomorphism.
   After localizing use the unit/action on the wedge of L_nBP-modules
   to prove its locality; do not assume arbitrary wedges of local
   spectra are local. Smash this comparison with Y and L_nY to
   obtain the same unit-compatible strong-localization equivalences
   for MU_(p), before global smashing.
   Also prove
   `BP∧L_n^fY≃BP∧L_nY` by the type-(n+1) argument, and its
   MU_(p) counterpart using the p-typical homotopy-module comparison.
   These do not presume that L_n itself is smashing. For a supplied
   homotopy MU_(p)-module N, apply the unit/action retraction
   N→MU_(p)∧N→N and the strong localization theorem to deduce
   `L_n^fN≃L_nN` as a retract of the corresponding comparison on
   MU_(p)∧N, with units/naturality. Together with F6.3’s earlier
   finite-source telescope comparison these supply the completion
   specialization without equating L_n^f and L_n globally.
2. For a supplied unital homotopy ring E define E-nilpotent spectra
   as the thick subcategory generated by E∧Z for arbitrary spectra Z,
   using finite cofiber extensions, shifts and retracts. Prove that this
   equals the thick closure of underlying unital homotopy E-modules
   by their unit/action retractions; no coherent BP-module category
   is implicit. Define E-prenilpotence through an E-equivalence to an
   E-nilpotent spectrum. Construct the E-Adams tower by iterating
   the actual fiber of S→E, with its exact couples and supplied-ring
   comparisons to F4's MU/BP resolutions.
   Prove the countable-π_*E prenilpotence criteria: a uniform horizontal
   vanishing line at a fixed page of the E-Adams spectral sequences
   for Y∧Z, for every finite Z, implies the required prenilpotence.
   More generally construct the criterion with an E_∞ horizontal
   bound and a page function φ(s) with E_r^(s,*)=E_∞^(s,*) for
   r>φ(s). State all bounds independently of Z and prove the
   passage to arbitrary spectra. For E=L_nBP reduce
   smashing to a nonzero finite p-local torsion-free E-prenilpotent Y,
   and prove the sphere-prenilpotence/localized-sphere criteria used in
   this reduction.
3. Construct the algebraic Morava stabilizer input at each 1≤m≤n,
   independently of Morava E∞ realization. Use F3's height-m Honda
   law over 𝔽_(p^m), F5's formal-group automorphism/deformation
   carriers and Witt vectors to build its profinite automorphism group
   full stabilizer `𝕊_m=O_D^×`, its strict subgroup
   `S_m=1+S O_D`, and their exact sequence with quotient 𝔽_(p^m)^×.
   Construct the division algebra/maximal order with S^m=p and
   `Sa=φ(a)S`, where φ is the native Witt-vector Frobenius;
   `φ(a)=a^p` is used only for Teichmüller representatives.
   Include the semidirect Galois action when extending the coefficient
   field, and compare full, strict and extended change-of-rings
   conventions. The prime-to-p scalar quotient is handled by exact
   invariants. For the finite-field Galois quotient, prove exact
   semilinear descent using the normal-basis theorem, including when
   p divides m; do not use averaging by the Galois-group order. Construct
   the scalar-extended Morava theory FK(m), its finite-dimensional
   graded coefficient representations and the continuous
   stabilizer/comodule change-of-rings isomorphism for the Ext groups
   v_m⁻¹BP_*Y/I_m. Consume the native continuous-cohomology carrier
   and the closed-subgroup/cohomological-dimension tools of
   [ProfiniteCohomology](../ProfiniteCohomology/README.md); own the
   stabilizer-specific finiteness and vanishing proofs. Construct a
   sufficiently deep torsion-free open normal congruence subgroup U,
   its uniform p-adic analytic structure, ordered coordinates and
   complete group algebra filtration; prove its associated graded/
   Koszul-May resolution has cohomological dimension d=m², including
   a deeper congruence level at p=2. Export
   `moravaStabilizer_cohomology_vanishing`: for a finite-dimensional
   continuous coefficient representation V free on every order-p
   subgroup, H_c^s(S_m;V)=0 for s>d. Construct the following
   projectivity and complete-resolution proof, with the continuous
   compact/discrete coefficient comparisons.

   Prove every finite abelian subgroup of D^× is cyclic: its commuting
   elements generate a finite-dimensional commutative subfield of D,
   and a field's finite root-of-unity subgroup is cyclic. Thus finite
   elementary abelian p-subgroups have rank≤1. Construct the finite-
   group Chouinard criterion, so V's order-p freeness implies
   projectivity on restriction to every finite subgroup. Construct
   Symonds's tensor-induced signed weak permutation resolution from
   a length-d projective U-resolution. Include its completed tensor
   products, coset permutations and Koszul signs; its length N is
   finite (at most [S_m:U]d), not asserted to equal d. Its terms
   are summands of signed permutation modules on profinite sets with
   finite stabilizers. Prove the stabilizer-Ext vanishing criterion by
   continuous Shapiro, finite quotients and the compactness argument,
   and deduce that tensoring with V gives a length-N projective
   resolution. No finiteness of conjugacy classes is needed here.

   Construct a Brown–Farrell complete resolution with its ordinary
   comparison in degrees s>d, separately from the length-N bound.
   The d-th syzygy of the trivial module is projective over the
   completed group algebra of U. In the exact category of modules
   projective over that algebra, with U-split exact sequences, prove
   finite-index induction=coinduction and the Frobenius property:
   S_m-projectives give enough projective-injectives. No averaging
   by [S_m:U] is used. Extend this syzygy in both directions to a
   complete S_m-projective resolution agreeing with the ordinary
   resolution in its high-degree tail; prove Hom into every projective
   is acyclic. Dimension-shifting along V's finite projective resolution
   makes its complete cohomology zero. The tail comparison then gives
   ordinary continuous H_c^s(S_m;V)=0 for s>d, uniformly in V.
   Construct its comparison with native continuous cochains and with
   the finite module regarded in either compact or discrete category.
   These specialized constructions are owned here; they are not
   assigned to ProfiniteCohomology.
   Handle the full/extended groups by their indicated quotient actions
   and treat height0 rationally. ProfiniteCohomology supplies the
   carrier and generic resolutions, not these analytic-group theorems.
4. Apply F6.3's Smith idempotents to tensor/smash powers of a finite
   torsion-free W: nontrivial actions
   of the relevant order-p subgroups on FK(m)_*W produce a nonzero
   finite torsion-free idempotent summand Y with free subgroup
   actions, simultaneously for the finite set of heights m≤n.
   For a fixed m, pass first to the (p−1)-st tensor power.
   For H≃C_p write 𝔽_(p^m)[H]=𝔽_(p^m)[u]/(u^p).
   From a nontrivial action construct α,β with uα=β, uβ=0;
   the Vandermonde comparison for (α+iβ)^(⊗(p−1)), i∈𝔽_p,
   gives a nonzero free submodule. Prove the finite group algebra is
   self-injective so this submodule splits. Apply the same e_V to obtain
   freeness for every order-p H at this height. Specify the
   degreewise/finite-periodic-regrading model of FK(m)_*W used
   as a finite-dimensional 𝔽_(p^m)-representation, and compare
   it with the actual graded homology and scalar action.
   Supply W by sufficiently large reduced Σ∞CP^j. Prove the
   stabilizer coaction on its b_i basis and its restriction to each
   order-p subgroup: for m divisible by p−1 the first nontrivial
   coefficient has index m/(p−1), and large enough j makes that
   action nontrivial. Give a common j for all m≤n and include p=2.
   Prove the scalar-extended Künneth map is a stabilizer-comodule
   isomorphism on these finite torsion-free CP smash summands,
   including its permutation/Koszul comparison at p=2; do not assume
   that a general characteristic-two K(m) ring is homotopy commutative.
   Construct the simultaneous-height spectrum from the finite family
   of fixed-height summands by their smash product. Prove each summand
   has nonzero torsion-free homology and hence type0, so its FK(i)
   homology is nonzero at every finite height. Prove the diagonal
   tensor of a free 𝔽_(p^m)[H]-module with any representation is
   free, using the regular-module tensor comparison; then prove the
   product is nonzero, torsion-free and free for every required H.
5. Apply Landweber filtration and the stabilizer change of rings to
   the constructed Y, obtain the finite uniform Ext/Adams vanishing
   bound, and prove Y is L_nBP-prenilpotent. Apply the preceding
   prenilpotence criteria to construct the natural smashing
   equivalence. The algebraic stabilizer/FK(m) lane precedes this
   theorem; Elliptic E2's E∞ Morava realization, completed
   cooperations and θ-algebras are not suppliers for it.

Deduce ⟨L_nS⟩=⟨E(n)⟩ and, for every n≥1, the natural equivalence
`L_(K(n)) L_(n−1) X≃0` for arbitrary p-local X. Prove this by smashing
with K(n) and using the class identity and smashing theorem. The
reverse composite L_(n−1)L_(K(n)) is a separate functor.

Construct the chromatic fracture square, with the actual localization
units as edges and their commuting homotopy:

```
L_n X ─────────────→ L_(K(n)) X
  │                         │
  ↓                         ↓
L_(n−1) X ────────→ L_(n−1)L_(K(n)) X.
```

For every p-local spectrum X and n≥1 prove this square homotopy
cartesian. First prove the homotopy pullback of the lower and right
corners is E(n)-local. Then prove X→that pullback is an E(n)-equivalence
by applying L_(n−1) and L_(K(n)), using the correctly ordered vanishing
above and the class identity. Include n=1 with rational L₀; retain the
lower-right corner. Prove functoriality in X, comparisons with the
chromatic tower L_n→L_(n−1), the fibre/Mayer–Vietoris sequences on
true π_*, and product/module comparisons with the actual derived
localized structures.

### F6.5. Local group actions and completion comparisons

For Borel finite-group actions on G's spectra, construct the projective
model category of BG-diagrams and its derived/coherent action comparison,
homotopy orbits, homotopy fixed points, transfer/norm and Tate cofiber, with
restriction, induction and lax monoidal/module naturality. Prove the
Greenlees–Sadofsky/Kuhn theorem: for n≥1, finite G and an object
of Fun(BG,L_(K(n))Sp), its underlying ordinary Tate spectrum E^{tG}
is K(n)-acyclic. The localized norm is an equivalence; ordinary
integral Tate vanishing is not asserted.
Construct the proof in this ordinary Borel norm-cofiber model, using
the following prerequisites and finite-height descent.

1. Construct the coherent Borel Tate product by the induced-object
   tensor-ideal construction. Use G2's simplicial model of spectra and
   projective BG-diagrams. The following simplicial-set and operadic
   foundations are construction targets of this item, before their
   spectral applications. Work in explicit nested universes and prove
   change-of-universe comparisons for the small and accessible models.

   **Categorical model and functor spaces.** Reuse native
   `EnrichedCat SSet`, `EnrichedFunctor`, `ForgetEnrichment`,
   `CategoryTheory.SimplicialCategory`, `SimplicialThickening`,
   `SimplicialNerve`, `SSet.Quasicategory`, inner fibrations,
   inner-anodyne maps and internal hom. Extend native horn-filling
   and nerve/quasicategory APIs to the required universes, preserving
   their predicates and constructors. Construct the ordinary category
   of the native enriched bundles with strict enriched functors;
   native `ForgetEnrichment.enrichedOrdinaryCategory` supplies their
   compatible ordinary enrichment for the nerve. Prove its comparison
   with that ordinary-enriched presentation; the native bicategory
   alone is not the category carrying the model structure. Construct
   the rigidification/coherent-nerve adjunction and prove the locally-Kan
   coherent nerve is a quasicategory.

   Construct the Bergner model on this category: weak equivalences
   are weak equivalences on mapping simplicial sets and essentially
   surjective on π₀-categories. Use free composition on enriched graphs
   to prove local presentability. Generate cofibrations by adjoining
   objects and free mapping-simplex boundary cells; define fibrations
   by lifting against generated trivial cofibrations and construct
   functorial factorizations by model recognition. Prove left properness
   by the enriched word filtration of pushouts of free cells and
   filtered unions. Establish the following invertibility property
   before characterizing these fibrations locally.
   For the fixed Cartesian Kan–Quillen base prove the properties
   of HTTA.3.2's excellent-base criterion: combinatoriality, product
   stability of monomorphism cofibrations, filtered-colimit stability
   of weak equivalences and the monoidal model axiom. Prove also
   the Dwyer–Kan invertibility property: if i:[1]→C is a
   free-enriched-cell cofibration classifying an edge invertible in
   Ho(C), then C→C∐_[1]J is a Dwyer–Kan equivalence, with
   J the walking isomorphism. Also construct the homotopy-invariant
   version using a cofibrant interval replacement for [1]→J.
   Construct the cofibrant interval/homotopy-inverse resolution and
   its mapping-space comparison by the enriched word/bar filtration.
   These fixed-base proofs precede their use in enriched model
   recognition and internal-hom theorems; no arbitrary excellent
   enrichment base is assumed. Now prove the local-fibration
   characterization: mapping-space Kan fibrations with lifting of
   homotopy equivalences of objects, and locally Kan fibrant objects.
   Include Bergner's characterization for the fixed Kan base without
   assuming the target is fibrant, by the enriched interval lifting
   argument and free-cell tests.

   **Enriched diagram foundations before straightening.** For every
   combinatorial simplicial model category M and small simplicial
   category C, construct its enriched projective and injective diagram
   models, with free/evaluation and enriched Kan-extension adjunctions,
   generating factorizations, simplicial mapping ends and replacements.
   For ordinary indices reuse native
   `Enriched.FunctorCategory.enrichedHom`, `enrichedHomπ` and
   `homEquiv`, with their native end construction. Extend it to
   simplicial enriched indices and prove agreement on the ordinary
   specialization. Use the preceding fixed Kan-base properties in HTTA.3.3. Construct
   projective generators by free/evaluation adjunctions. For injective
   structures prove the objectwise cofibrations have a small weakly
   saturated generating set by the accessible enriched-functor-category
   argument, then apply model recognition to objectwise weak equivalences.
   Prove the pointwise tensor/cotensor mapping axiom for both models.
   Construct simplicially enriched functorial factorizations for M
   and these diagram models by the enriched small-object argument.
   At a generating cofibration i, parameterize all lifting squares
   by their simplicial mapping pullback and attach i tensored with
   that square complex. The simplicial model axiom makes these
   attachments cofibrations, and trivial cofibrations for a trivial
   generator. Choose a regular cardinal for all generator sources
   and targets tensored with Δ[n]; transfinite composition then has the required
   vertex lifting property. Prove that both factorizations and their
   natural maps are enriched functors, including the induced enriched
   cofibrant/fibrant replacements. This supplies the enriched diagonal
   factorizations for path objects, not only ordinary functorial choices.
   The projective structure supplies the internal-hom and rectification
   comparisons; injective existence is asserted here only for this
   Kan enrichment and these verified hypotheses. Prove invariance
   under a Dwyer–Kan equivalence of indexing categories
   by the free-cell filtration and enriched bar resolution, using
   cofibrant replacements of the indices where required. Construct
   small full model chunks closed under these enriched replacements
   and finite product/coproduct-map factorization operations for the
   relevant small diagram categories;
   prove existence by accessible closure and prove independence and
   filtered enlargement comparisons. This controls the size of the
   simplicial categories of fibrant-cofibrant objects. Construct
   the enriched Yoneda embedding into the projective Kan-presheaf
   model on C^op, with its enriched evaluation identity. After locally
   Kan replacement, representables are fibrant-cofibrant by the
   free/evaluation adjunction. Enlarge their image to a small chunk
   with the same essential image in the model homotopy category.
   This embeds any small enriched category, up to Dwyer–Kan
   equivalence, in such a bifibrant chunk, as required by the
   internal-hom and localization tests. This is enriched Yoneda;
   the later space-valued infinity-categorical Yoneda comparison
   is derived from it after coherent rectification.

   Prove the Joyal-free internal-hom comparison of HTTA.3.4 in
   the Bergner homotopy category. Construct the actual enriched
   evaluation map from (U^C)^cf×C to U^cf and prove the natural
   bijections
   `Hom_Ho(sCat)(D,(U^C)^cf)≃Hom_Ho(sCat)(D×C,U^cf)`
   on every small compatible chunk. Projective replacement and
   path objects built from the enriched diagonal factorizations
   identify both sides with weak-equivalence classes
   of (D×C)-diagrams; enriched Yoneda and chunk enlargement give
   the full-faithful essential-image comparison for arbitrary targets.
   This stage is a Hom_Ho-set/weak-exponential theorem. Its mapping-
   Kan-space upgrade is constructed after the product/homotopy-colimit
   theorem and frames below; it is not used to prove that earlier theorem.

   Construct the enriched localization C[W⁻¹] by pushing out a
   coproduct of [1]→E, with [1]→E→J the preceding cofibrant
   interval factorization. Prove replacement invariance by left
   properness and the Hom_Ho universal property: the map
   `Hom_Ho(sCat)(C[W⁻¹],D)→Hom_Ho(sCat)(C,D)` is injective,
   with image exactly the classes sending W to equivalences.
   Prove injectivity using the doubled-interval localization cylinder.
   The derived mapping-space version is proved after the frames below.
   Construct ordinary projective/injective diagram models on the
   combinatorial Bergner category by accessible model recognition,
   with functorial replacements and their model homotopy limits and
   colimits, before the following Grothendieck and product comparisons.
   For a small poset A and diagram a↦C_a, construct its enriched
   Grothendieck category: objects (a,x) and mapping simplicial set
   C_b(p_ab x,y) when a≤b, empty otherwise, with composition induced
   by p. Compare its forgotten ordinary category, functorially in
   the diagram, with native `CategoryTheory.Grothendieck` on the
   underlying Cat-valued diagram, including object/base/fiber,
   transport and restriction maps. Invert the arrows
   (a,x)→(b,p_ab x). Prove this localized
   total category models hocolim_A C_a (HTTA.3.5): build an A-filtered
   free-cell cofibrant replacement, and compare each initial-segment
   localization with its terminal C_a by the categorical mapping
   cylinder. Prove that localization commutes with product by a fixed
   enriched D when W is extended as (w,id_d), using the internal-hom
   comparison and the Hom_Ho localization property: test maps
   into arbitrary targets using enriched Yoneda/chunk embedding and
   the full-faithful essential-image criterion. All tests here are
   Hom_Ho sets. Deduce product by D
   preserves these poset-indexed homotopy colimits. This is a derived
   comparison, not a monoidal model assertion about the Bergner product.

   Use native `HomotopicalAlgebra.ReedyStructure` and its
   `HomotopicalAlgebra.ReedyStructure.op` construction for opposite structures.
   Construct the simplex Reedy structure from native simplex epi/mono
   factorization, following the design of
   [`SimplexCategory.reedyStructure`](https://github.com/leanprover-community/mathlib4/blob/1e75e9dd53d483fa01eff9ac7d4ea0472ce9d1fa/Mathlib/AlgebraicTopology/Reedy/SimplexCategory.lean).
   Construct their Reedy model structures, latching/matching objects
   and functorial frames on the Bergner model and its ordinary
   projective diagram models, with objectwise latching/matching
   comparisons. The resulting derived
   mapping Kan spaces take model homotopy colimits in the source
   to homotopy limits, and model homotopy limits in the target to
   homotopy limits. Prove this by Reedy
   replacement and the end/bar mapping formula, including the action
   of Kan spaces through frames. No simplicial enrichment of the
   Bergner model is presumed. The Reedy lifting property makes
   a cofibrant cosimplicial frame's tensor and mapping functor a
   Quillen adjunction from Kan–Quillen simplicial sets to this model.
   Use the prior product/homotopy-colimit theorem to prove
   `(W⊗^L K)×^L Y≃(W×^L Y)⊗^L K` by skeletal induction
   on K: coproducts, boundary-cell homotopy pushouts and sequential
   skeletal unions are poset-indexed. This needs no arbitrary-index
   reduction and does not use the homotopy-limit theorem being proved.
   Now upgrade the weak-exponential Hom_Ho bijection to derived
   mapping Kan spaces. For a cosimplicial frame D^• define the raw
   mapping simplicial set H(D^•,V)_n=Hom(D^n,V). It is Kan for
   fibrant V and sends trivial fibrations in V to trivial Kan
   fibrations without a fibrancy assumption on their targets.
   For X,Z fibrant and an evaluation span Z×Y←P→X with
   P→Z×Y a trivial fibration, impose no fibrancy assumption on Y.
   Choose a frame C^• and a compatible Reedy-cofibrant frame
   W^•→C^•×Y for C×^L Y. Form the actual pullback
   `H(C^•,Z)×_(H(W^•,Z×Y))H(W^•,P)`.
   Its projection to H(C^•,Z) is a trivial Kan fibration; evaluation
   gives its map to H(W^•,X). Thus both ends and the pullback are
   Kan, even though the two raw complexes involving Z×Y and P
   need not be. This represents the actual natural derived evaluation
   map from Map(C,Z) to Map(C×^L Y,X). Test it against every
   Kan K, using the preceding tensor/product comparison and the
   Hom_Ho exponential bijection, to prove it is an equivalence.
   Use functorial compatible frame replacements on parameter diagrams
   for these actual mapping transformations. Prove likewise the
   derived mapping-space localization property: the map from
   Map(C[W⁻¹],D) identifies it with the components of Map(C,D)
   carrying W to equivalences, by the Hom_Ho property tested on
   Kan parameters and the prior product/localization comparison.
   Thus the space-level versions are retained after their prerequisites.

   Prove M^cf→M_f[W⁻¹] is a Dwyer–Kan equivalence using
   the earlier enriched cofibrant replacement on fibrant objects,
   its enriched natural comparison to the identity and the interval
   product/localization homotopies. The same proof applies on the
   compatible chunks and their projective diagram models, before
   using these comparisons in the following evaluation spans.

   Prove the enriched diagram homotopy-limit theorem of HTTA.3.6.
   Let A=A₀∪{∞} be a small poset with largest element ∞ and
   let a↦C_a be a cofibrantly replaced diagram whose value C_∞
   presents hocolim_(A₀)C_a. Choose a common small chunk U of M
   such that U^(C_a) is a chunk of the projective model M^(C_a)
   for every a∈A, using the earlier simultaneous enriched closure.
   Set F_a=(U^(C_a))_f, with objectwise
   weak equivalences W_a, and Z_a=F_a[W_a⁻¹]. Restriction makes
   Z a strict A^op-diagram. Set X=U_f[W⁻¹] and Y_a=C_a.
   Construct the strict two-variable evaluation spans before deriving
   any mapping comparison: for b≤a define
   `P(a,b)=(F_a×C_b)[{(w,id_c):w∈W_a}⁻¹]`.
   Their maps into Z_a×Y_b come from product/localization, and
   their maps into X evaluate after C_b→C_a; evaluation inverts
   the indicated arrows. These maps are functorial on
   B={(a,b):b≤a}⊂A^op×A. The product comparison makes the
   left map a weak equivalence. On the diagonal the actual evaluation
   identifies Z_a as a weak exponential of X by Y_a, using the
   earlier chunk/internal-hom and replacement/localization comparisons.

   Replace X and the A^op-diagram Z objectwise fibrantly, retaining
   their evaluation spans. Simultaneously factor the strict B-map
   P→(Z×Y)×X as a trivial cofibration followed by a projective
   fibration in the ordinary B-diagram model. Write its middle
   diagram again as P. Then P(a,b)→Z_a×Y_b is a pointwise
   trivial fibration: it is a fibration by fibrancy of X and a weak
   equivalence by two-out-of-three. Its map to X is still an actual
   natural evaluation. No Y_a fibrancy is required.

   For each cofibrant test object D choose a frame D^• and a
   projective-Reedy cofibrant replacement, natural in c,
   `W_c^•→D^•×Y_c`. These are frames for D×^L Y_c.
   Use three independent indices
   `T={(a,b,c):c≤b≤a}⊂A^op×A×A^op`.
   Its arrows to (a₁,b₁,c₁) satisfy a₁≤a, b≤b₁ and c₁≤c.
   Construct the actual T-diagram
   `E(a,b,c)=H(D^•,Z_a)×_(H(W_c^•,Z_a×Y_b))H(W_c^•,P(a,b))`.
   The map into the base uses W_c^•→D^•×Y_c→D^•×Y_b.
   Its projection α to G(a)=H(D^•,Z_a) is pointwise a trivial
   Kan fibration, so E is Kan. Evaluation gives a natural map β
   to G′(c)=H(W_c^•,X). Raw H complexes in the pullback need
   not be Kan; G, G′ and E are. All variances are now covariant
   on T; no diagonal of the two-variable P is called a diagram.

   Prove both comparisons by derived right Kan extension in the
   ordinary Kan-space diagram models, using injective replacements,
   along π_a:T→A^op. At a₀ its comma index is T_(a≤a₀).
   The inclusion of Q={a=a₀} has right adjoint
   r(a,b,c)=(a₀,b,c), hence is homotopy initial for these limits.
   Q is contractible by (b,c)→(a₀,c)←(a₀,a₀).
   The projection q:Q→(A_(≤a₀))^op, q(b,c)=c, has right
   adjoint c↦(a₀,c), hence is homotopy initial; its target has
   initial object a₀. Prove these homotopy-initiality statements by
   the adjunction comma contractions and the model right-Kan formula.
   The unit G→Ran_(π_a)π_a^*G and α give
   Ran_(π_a)E≃G. The cone G′(a)→G′(c) for c≤a gives
   the natural comparison G′→Ran_(π_a)π_c^*G′, also an equivalence.
   Evaluation of the first limit at (a₀,a₀,a₀) is an equivalence
   by α and contractibility of Q; evaluation of the second is an
   equivalence by q and its initial object. At that diagonal β
   is the framed weak-exponential equivalence already proved. The
   evaluation square therefore makes Ran_(π_a)β an equivalence.
   The adjunction units, that cone and the restriction maps give
   naturality in a₀, yielding a natural zigzag of objectwise weak
   equivalences between G and G′ in the ordinary diagram model,
   rather than just separately equivalent values. Now apply the model
   mapping-space/hocolimit formula to D×^L hocolim Y_a and the
   prior product/hocolimit comparison. Mapping out of every D proves
   that Z_∞ presents the homotopy limit of Z|_(A₀)^op.
   Then pass through sufficiently filtered enlargements of chunks,
   proving closure of model homotopy-limit diagrams at the chosen
   cardinal by accessibility. Prove the enriched mapping-space
   recognition criterion
   for a model homotopy limit when an essentially-surjective comparison
   from a known homotopy-limit model is supplied. These are the
   localization, homotopy-limit and index-invariance inputs to the
   straightening proofs; none uses Joyal, marked models, Cat∞ colimits
   or the later coherent-diagram rectification.

   Define a simplicial-set map to be a categorical equivalence
   exactly when its rigidification is a Dwyer–Kan equivalence.

   **Unmarked straightening and the categorical model.** Build
   unmarked left/right fibration models over a simplicial set.
   Use monomorphism cofibrations and weak equivalences defined by
   Dwyer–Kan equivalences of the rigidified left-cone pushouts over
   the base in the covariant case, and right-cone pushouts dually.
   Prove these models left proper and combinatorial by Bergner model
   recognition. Prove SM7 with tensor X×K: monomorphisms give the
   cofibration pushout-product axiom, and the appropriate endpoint
   section X→X×Δ[n] is left/right anodyne, so X×Δ[n]→X
   is a weak equivalence. Use left properness and the simplicial
   cell filtration for the trivial pushout-product cases (HTT2.1.4).
   With Kan-valued projective diagrams construct St⊣Un and prove
   it a Quillen adjunction before testing Quillen equivalence:
   the free cone-cell construction sends monomorphisms to projective
   cofibrations, and its mapping-hom description sends rigidified-cone
   equivalences to projective weak equivalences (HTT2.2.1.2, first clause).
   Construct unmarked unstraightening's actual simplicial enrichment.
   Set J^n=(Δ[n]⋆{y})∐_(Δ[n]){x} and
   Q^n=C[J^n](x,y). Construct Q^•→Δ^• using the largest-element
   map on the nerve of nonempty subsets, with its quotient comparison.
   Its precomposition K→Sing_Q K preserves products and units.
   Prove the external-product formula
   `Un(F⊠K)≅Un(F)×Sing_Q K` from the simplex definition.
   Thus K×Un(F)→Un(F⊠K) is an actual tensor strength.
   A K-parametrized F⊠K→G induces Un(F)×K→Un(G);
   prove these maps preserve identities and composition by the
   product/unit laws, giving actual maps of enriched hom objects.
   This is the construction of HTT2.2's simfun, not a claim that
   straightening is strictly simplicial. The source slice model has
   every object cofibrant; no such condition is imposed on the
   projective diagram target.
   Prove the enriched Quillen-equivalence criterion for Kan–Quillen
   simplicial model categories C,D and a Quillen adjunction F⊣G,
   with an explicitly enriched right functor G and every object of
   C cofibrant. Construct the mate
   `β_(K,V):F(K⊗V)→K⊗F(V)` of
   `K⊗V→K⊗GF(V)→G(K⊗F(V))`, using the unit and
   G's enriched tensor strength. On cofibrant V both K-functors
   are left Quillen; β is the identity at Δ[0], so coproduct,
   homotopy-pushout and skeletal induction prove it is a weak
   equivalence for every Kan–Quillen-cofibrant K. Construct
   `Hom_D(F(V),Y)→Hom_C(V,G(Y))` by applying enriched G and
   precomposing with η_V. For cofibrant V and fibrant Y, testing
   on K identifies this map with precomposition by β under the
   ordinary adjunction, giving the derived mapping equivalence.
   Prove that F⊣G is then a Quillen equivalence exactly when G on bifibrant enriched
   categories is a Dwyer–Kan equivalence, by the actual derived
   mapping comparison, unit/counit and essential image. Verify this
   enriched right-functor/strength structure on unstraightening and
   use the criterion (HTT's weakcompatequiv), with this typed mate.
   Prove it is a Quillen equivalence (HTT2.2.1.2), first over simplices
   by the explicit rigidification contraction and index invariance,
   then over all bases by pushout and filtered-union induction using
   the preceding enriched Grothendieck/localization and homotopy-limit
   theorems. Prove the right-fibration model's equivalences are detected
   fiberwise by the mapping Kan-space and horn-lifting tests. Prove
   the adjunction's derived unit/counit and base-change comparisons.
   Prove its mapping-space comparison by straightening the right
   fibration X_/y→X: its simplicial presheaf is weakly equivalent
   both to C[X](−,y) and, objectwise, to the right mapping Kan
   spaces Hom^R_X(−,y). These constructions use the existing
   Kan–Quillen model, horn filtrations and the preceding enriched
   diagram/localization theory, not the Joyal or marked models being
   constructed. This is the route of HTT2.2.1–2.2.4.
   Right mapping spaces of products are products; use this comparison
   and inner-anodyne replacement to prove
   `C[S×T]→C[S]×C[T]` is a Dwyer–Kan equivalence for all S,T.
   The extension to arbitrary S,T uses the native inner-anodyne
   pushout-product/horn filtration, not diagram rectification.

   From the preceding mapping-space comparison prove that a map
   between quasicategories is a categorical equivalence exactly
   when it is fully faithful and essentially surjective. Prove
   fully faithful functors reflect equivalence edges. Use these
   criteria before the following slice-invariance and fibrancy proofs.

   Construct joins and slice quasicategories by their simplicial
   universal property. Prove the relative slice projection for an inner
   fibration is a left/right fibration by the join horn filtration
   (HTT2.1.2), and prove the equivalence-edge outer-horn theorem
   HTT1.2.4.3: an edge is an equivalence exactly when every Λ^n_0
   horn whose first edge is that edge fills, with the dual criterion.
   Define Cartesian/coCartesian edges by the slice trivial-fibration
   test over an inner fibration, before any marked model is used.
   Define a Cartesian fibration as an inner fibration admitting
   Cartesian lifts of every base edge with specified target endpoint;
   define coCartesian fibrations dually with specified source endpoint.
   For quasicategories prove the mapping-space homotopy-pullback
   criterion by the slice Kan fibers. In particular Cartesian edges
   over Δ[0] are exactly equivalences. Prove mapping-space fiber
   comparisons for Cartesian lifts and their fiberwise equivalence
   criterion. Prove equivalences of quasicategories induce equivalences
   on slices under any fixed diagram (HTT1.2.9.3/2.4.5): attach the
   diagram's simplices, identify the fibers over each object with
   mapping Kan spaces, and pass through towers of Kan fibrations.
   Use these horn/slice results before applying HTT2.4.6 to Joyal
   fibrancy. These results concern native quasicategories directly;
   they do not presuppose the Joyal or marked model structures.

   For these categorical equivalences apply model
   recognition (HTTA.2.6.13) with monomorphism cofibrations: prove
   accessibility of this class through the accessible rigidification
   and Bergner weak-equivalence tests; prove the lifting/factorization
   hypotheses using boundary/horn cell filtrations and the preceding
   mapping-space comparison. This constructs the Joyal model and
   the rigidification/nerve Quillen equivalence. Prove its fibrant
   objects are exactly the quasicategories by the preceding special
   outer-horn and slice-invariance theorems, applied as in HTT2.4.6:
   adjoin an inverse edge, use inner-horn filtrations and the
   mapping-space equivalence
   test to prove lifting against categorical trivial cofibrations.
   Prove the Cartesian Joyal pushout-product property by the
   boundary/horn filtration and the product comparison above.
   Prove categorical fibrations between quasicategories are inner
   fibrations lifting equivalence edges, with functorial replacements.
   Construct the maximal Kan core and core functor spaces.
   Define Cat∞ as the native coherent nerve of
   the simplicial category of small quasicategories with these core
   functor spaces. Its colimits are constructed below through the
   marked categorical simplicial model and general diagram comparison.

   **Marked fibrations and Kan extensions.** Construct marked
   simplicial sets on native SSet as a simplicial set with a set of
   marked 1-simplices containing the degenerate ones, with mark-preserving
   maps, limits, colimits, products and simplicial mapping objects.
   Use the preceding slice-category Cartesian-edge definition and
   mapping-space characterization, with coCartesian edges dually.
   Use the preceding Cartesian/coCartesian fibration predicates.
   Prove composition, base change, contractibility of lift
   choices and the fiberwise equivalence criterion. For each simplicial
   set S construct the Cartesian and coCartesian marked models over S.
   Specify weak equivalences by marked mapping Kan-space tests into
   all such Cartesian/coCartesian fibrations over S and cofibrations
   by underlying monomorphisms. Construct the marked anodyne generators,
   weakly saturated closure and functorial lifting/factorization APIs,
   proving these descriptions agree. Fibrant objects mark exactly
   the corresponding Cartesian or coCartesian edges.

   Specialize the Cartesian model to S=Δ[0] and identify marked
   objects over Δ[0] with marked simplicial sets. The preceding
   Cartesian-edge/equivalence theorem constructs the marked
   categorical model,
   with fibrant objects C marked precisely at their equivalences,
   monomorphism cofibrations and the indicated marked mapping-space
   weak-equivalence test. Construct its marking/forgetting Quillen
   comparison with the Joyal model. Equip the marked categorical
   and marked fibration models with Kan–Quillen simplicial tensors
   K^♯×(−), the adjoint cotensors and marked mapping Kan complexes;
   prove the simplicial model pushout-product axiom by marked-anodyne
   product closure. Prove local presentability and accessible model
   recognition in each case, then instantiate the earlier enriched
   projective-diagram construction for these marked models. Construct
   the straightening/unstraightening adjunction, using rigidification and
   the relative coherent nerve, between the coCartesian model over S
   and projective simplicial diagrams C[S]→marked simplicial sets;
   use C[S]^op in the Cartesian case. Define straightening on each
   simplex by its cone/relative mapping simplicial sets, then glue by
   the simplex category. Construct its tensor comparison
   `St⁺(X×K^♯)→St⁺(X)⊠K^♯` by the cone's two product
   projections followed by the point comparison T_Q(K^♯)→K^♯.
   Verify markings and the unit/associativity laws on the actual
   mapping simplices, and prove the comparison is a weak equivalence
   by the marked product-cell filtration and the images of basic
   marked anodyne cells (HTT spek3–spek5). Adjunction gives the
   strength K^♯×Un⁺(F)→Un⁺(F⊠K^♯): explicitly use the
   tensor comparison, the counit St⁺Un⁺F→F and a K-parametrized
   map F⊠K^♯→G to obtain Un⁺F×K^♯→Un⁺G. Verify the
   unit/composition laws, producing an actual Kan-enriched Un⁺
   for the stated sharp tensors, as in HTT's marked straightening
   proof; St⁺ need not be simplicial. Prove the adjunction Quillen
   using the cofibration/anodyne images and this tensor comparison,
   then prove it a Quillen equivalence:
   check unit/counit on simplices by the mapping-simplex filtration,
   extend across marked anodyne cells and homotopy colimits using
   the earlier enriched localization/homotopy-limit theorem, and prove
   derived unit/counit equivalences on all fibrant diagrams. Verify
   the marked straightening tensor comparison and use the preceding
   enriched Quillen-equivalence criterion. This
   identifies the fibration model with the strict enriched diagram
   model, naturally under base change. Construct the remaining model
   diagram comparison before identifying its coherent functor category.

   **Coherent model diagrams and stable enhancements.** Prove
   `C[S×Δ[n]]→C[S]×C[Δ[n]]` is a Dwyer–Kan equivalence,
   using the already constructed mapping-space/Joyal product comparison.
   Together with the Bergner/Joyal Quillen equivalence this gives,
   for every Dwyer–Kan equivalence C[S]→C, the actual categorical
   equivalence
   `N((M^C)^cf)≃Fun(S,N(M^cf))` of HTT4.2.4.4.
   Construct its evaluation map, derived unit/counit and all
   higher-simplex comparisons. Prove naturality in commuting squares
   of base and enriched index maps, including diagrams of groups,
   and compatibility with derived restriction and left/right
   Kan-extension adjunctions, using the respective projective/injective
   replacements and units/counits; compare with their coherent
   universal properties after constructing coherent Kan extensions below.
   State base-change equivalences
   only under their required cofinality or exact-square conditions;
   use the product comparison for S×Δ[n] to identify transformations
   and mapping spaces. This is a general model-diagram theorem,
   instantiated for Kan complexes, marked categorical and fibration
   models, G2 spectra and the transferred algebra/module models below.
   Verify the hypotheses in each instance. For G2 spectra prove local
   presentability from the sphere-module/presheaf presentation and
   accessibility of the stable equivalence localization; combine its
   generating cofibrations with the simplicial tensor/cotensor
   adjunction to prove the model mapping axiom: first check the level
   structure, then use closure of Ω-spectrum local objects under
   Kan cotensors to pass through stable localization. This gives
   the required combinatorial simplicial model. For the marked models
   use their preceding anodyne recognition and simplicial axiom; for
   algebra/module models use the word-cell transfer below.

   Define a cone on p:K→C using Δ[0]⋆K and a cocone
   using K⋆Δ[0], with categories C_/p and C_p/ respectively.
   Define infinity categorical limits as terminal cone objects and
   colimits as initial cocone objects
   and prove the mapping-space criterion (HTT4.2.4.3), including
   naturality in the cone diagram. Define a pointed infinity category
   by a zero object, both initial and terminal. Define it to be stable
   when it has finite limits and colimits and a square is a pushout
   exactly when it is a pullback.

   Prove the homotopy (co)limit comparison of HTT4.2.4.1: use the
   enriched derived mapping-end/bar formula to identify maps from a
   homotopy colimit with maps of its coherent diagram into a constant
   diagram; dually treat homotopy limits. The preceding rectification
   theorem identifies these with the infinity categorical cone universal
   properties, including diagrams on arbitrary small simplicial sets.
   Apply it to the marked categorical model, with its Kan simplicial
   enrichment, to construct Cat∞ colimits. Prove its comparison with
   the quasicategory/core-functor presentation and with the derived
   Joyal model through the marking/forgetting Quillen equivalence;
   do not assume the Joyal internal hom is a Kan simplicial enrichment.
   Construct relative localization (C,W) by the categorical homotopy
   pushout replacing the marked edges by walking equivalences. Prove
   its functor-space universal property and preservation of colimits
   of relative diagrams. Prove Δ[0]/Δ[1] generate Cat∞ under small
   colimits by spines, finite cell attachment and filtered unions;
   construct the slice colimits and their model comparisons.

   Construct the enriched Dwyer–Kan localization by hammock mapping
   spaces and composition, with simplicial-category fibrant replacement.
   Prove its coherent nerve has the localization universal property
   and compare cofibrant-object localization with N(M^cf). For G2's
   model define Sp∞=N(Sp_model^cf). The general diagram theorem
   and derived (co)limit comparison identify its zero and finite
   limits/colimits with G2/G3's model homotopy (co)limits, naturally
   in coherent diagrams. Identify its suspension/loop adjunction with
   G2's stable-model Quillen equivalence; prove the derived unit/counit
   equivalences and the pushout/pullback-square comparison. Thus Sp∞
   is stable. Prove Fun(BG,Sp∞) is stable with pointwise finite
   limits/colimits and compare it exactly with G2's projective
   BG-diagrams by this same general rectification theorem. The monoidal
   part of this comparison is constructed below after the monoidal
   enhancement. Derived smash is exact separately by the stable model
   comparison.
   These are the stable enhancements used below, not consequences
   inferred solely from the triangulated homotopy category.

   Apply general model-diagram rectification to the earlier marked
   straightening Quillen equivalence, obtaining its identification
   with Fun(S,Cat∞), natural under pullback and on every higher
   base simplex. Apply it also to unmarked Kan-valued straightening,
   identifying right fibrations with Fun(S^op,Spaces); prove a right
   fibration with contractible fibers is an equivalence. These supply
   the mapping-simplex and Grothendieck comparisons of HTT §§2.1,
   2.4,3.2–3.3 before the descent and Kan-extension constructions.

   Prove strict pullback along a coCartesian fibration preserves
   categorical equivalences, by the marked straightening comparison
   and the simplex-wise mapping-space test. It already preserves
   monomorphisms and colimits, hence is left Quillen on Joyal slices.
   Deduce its derived pullback preserves Cat∞ colimits. Prove descent
   of coCartesian fibrations across a colimit of bases by gluing their
   straightened functors; identify the total-space colimit and every
   pullback. Together with Δ[0]/Δ[1] generation and localization's
   colimit property this supplies the actual base-descent theorem
   used in the monoidal localization below.

   Using the preceding slice/join cone and (co)limit definitions,
   define left/right Kan extensions by their functor-space universal
   properties. Prove the pointwise comma-category
   formulas, the existence theorem when those pointwise (co)limits
   exist, composition, base change under the stated cofinality conditions,
   and the criterion for an extension to be absolute. Define adjunctions
   by the corresponding representable mapping-space pairing and build
   their unit/counit, triangle comparisons and contractible space of
   choices. Prove a fully faithful right adjoint exhibits localization:
   precomposition identifies functors out of the target with functors
   inverting the unit maps, including higher natural transformations
   (the localization criterion of HTT5.2.7.4). Construct accessible
   presheaf localizations by cell inversion of a small set of maps,
   with the objectwise local mapping-space criterion; establish the
   cardinal bounds and accessible adjoints needed below.

   Construct the following monoidal/fibration sub-lane before using
   the quotient product. Work on native simplicial sets and nerves;
   Fin_* is the finite-object full subcategory of native `Pointed`,
   with its small skeleton (Fin(n+1),0). Define active/inert maps and
   construct their factorization and the inert projections. Use the
   Cartesian/coCartesian edge, lift and fiberwise-equivalence APIs
   constructed above.
   Use the preceding marked straightening equivalence and its
   naturality in the base for these relative coherent nerves and
   simplicial Grothendieck constructions. Include mapping simplices
   over all Δ[n] and their descent, not just chosen edge lifts.
   Define monoidal enhancements as coCartesian fibrations over
   N(Fin_*) with Segal fibers C^n; define monoidal functors by
   preserving all coCartesian edges and lax functors by preserving
   inert ones. Construct their functor/natural-transformation spaces
   over this base, and prove equivalences are detected on underlying
   objects. Define an infinity operad by the inner-fibration,
   inert-lift and Segal conditions, including the product decomposition
   of mapping spaces over a specified Fin_* map. Construct its
   colors, multi-operation spaces, units and substitution. Construct
   the operadic nerve of a locally Kan colored simplicial operad and
   prove these axioms by the colored mapping-space/horn comparison.
   Define operadic functors by inert preservation. This gives the
   general definitions needed for LM below without requiring every
   infinity operad to be a coCartesian monoidal category.

   For G2's monoidal model, use the full subcategory of cofibrant
   objects together with the tensor unit and its isomorphic copies.
   Prove tensor closure and preservation of weak equivalences in
   each variable, including maps to/from the possibly noncofibrant
   unit: compare with Q1→1 and use the model's unit axiom.
   Construct the ordinary operator category with objects tuples
   (X₁,…,X_n) and arrows over f in Fin_* given by maps from the
   ordered tensor over f⁻¹(j) into the j-th target. Extend native
   monoidal coherence to symmetric coherence: normalize tensor words
   by a bracketing and a permutation, prove independence using the
   hexagon, symmetry and braid/Coxeter relations, and prove that two
   structural maps agree when their permutations agree; prove the
   converse in the free symmetric monoidal category on labeled words.
   Use this theorem to define composition and reordering in the operator
   category and prove all category laws. Take its ordinary
   nerve over N(Fin_*) and localize at the fiberwise weak-equivalence
   tuples.
   Prove the resulting map to N(Fin_*) is coCartesian with fibers
   the corresponding products of DK localizations. For comparison
   with the full model, use absolute right Kan extensions presenting
   the left-derived multi-Quillen tensor functors; construct them by
   functorial cofibrant replacement and verify the unit comparison.
   Check composition of these extensions on Δ[2], then use mapping-
   simplex gluing/descent for general bases. Prove the unit-adjoined
   cofibrant and full-model localizations agree over N(Fin_*), with
   the full-model functor lax and the unit-adjoined restriction
   monoidal. This constructs
   the monoidal enhancement of G2's derived smash without requiring
   a strictly monoidal fibrant replacement.

   Apply the same unit-adjoined localization to G2's projective
   BG-diagram model with diagonal smash. Prove its pushout-product
   axiom on free G-cell generators: the diagonal G-action on G×G
   is free, so the pushout product is a coproduct of free cells with
   the underlying spectral pushout product. The trivial-action unit
   need not be projectively cofibrant. Construct its projectively
   cofibrant replacement EG₊∧S→S from G2.9's free contractible
   bar carrier and its free G-CW realization;
   prove the unit axiom on cofibrant diagrams by its underlying weak
   equivalence and the spectral unit axiom. Use this replacement in
   the unit-adjoined/full-model comparison, not an assumed cofibrant
   trivial-action unit. Prove the induced monoidal enhancement agrees
   with pointwise smash on Fun(BG,Sp∞), through the general diagram
   comparison on all tensor tuples, units and higher operator simplices.
   Thus the earlier exact projective/coherent comparison is monoidal,
   naturally in group restriction, before it is used by the Tate lane.

   For a small stable enhancement C and full stable D, construct the
   quotient C/D at maps whose cofibers belong to D. Prove exactness,
   replacement invariance, the exact-functor universal property, and
   the filtered mapping-space formula
   `Map_(C/D)(X,Y)≃colim_(Z∈D_/Y) Map_C(X,cofib(Z→Y))`.
   Construct the infinity category of presheaves Fun(C^op,Spaces)
   with values in Kan spaces, using the general model-diagram
   theorem for the Kan–Quillen projective diagram model. Prove the space-valued Yoneda theorem,
   mapping-space formulas and objectwise limits/colimits. Define
   Ind_κ(C) as its full subcategory of κ-filtered colimits of
   representables; construct its universal property for κ-filtered
   colimit-preserving functors, the compact-representable comparison,
   and the case κ=ω. Prove Ind_κ(C) is stable for small stable C:
   use the lim-colim mapping formula and exactness of filtered
   colimits of spaces. Compute finite limits objectwise and construct
   finite colimits by common filtered presentations of finite coherent
   diagrams in C. Verify their universal properties by that formula.
   The represented zero is initial and terminal within Ind_κ(C);
   it is not the empty initial presheaf. Identify fibers, cofibers and
   suspension by these constructions, rather than asserting closure
   under objectwise presheaf colimits.
   This uses space-valued presheaves, rather than set-valued ordinary
   Ind or a purported strict spectral composition on arbitrary
   mapping Kan complexes. Compare with G2's concrete mapping spectra
   on fibrant-cofibrant diagrams through their derived mapping spaces.
   For a tensor ideal D, construct the monoidal DK quotient by
   localizing the total monoidal nerve at tuples of cofiber-in-D maps.
   Tensor stability of that class, the family localization just proved
   and Segal fibers identify its underlying quotient with C/D.
   The functor-category universal property over N(Fin_*), restricted
   to functors preserving inert edges, proves the lax monoidal
   universal property, including natural transformations.

   Construct the coCartesian symmetric monoidal enhancement
   Ind(C)^⊗→N(Fin_*) by operadic left Kan extension of the
   Yoneda embedding, first for ordinary filtered Ind(C). Construct Day
   convolution on
   space-valued presheaves: its n-input value is the left Kan extension
   of the external product along the n-fold tensor C^n→C.
   Construct the relative operadic left Kan extension by the active
   overcategories and their colimit cones, prove compatibility with
   composition of active maps, and use the marked straightening
   theorem to assemble its coCartesian fibration over N(Fin_*).
   Prove its inert fibers are products, the Segal equivalences, unit
   and symmetry, and the universal property for functors preserving
   the indicated colimits separately. Restrict to Ind using the
   tensor closure of representables and the formula
   `(colim_i yX_i)⊗(colim_j yY_j)=colim_(i,j)y(X_i⊗Y_j)`.
   Prove Yoneda is monoidal and exact into Ind(C); construct the
   finite colimit comparisons through common filtered presentations.
   Deduce tensor preserves finite colimits and, by filtered unions
   of finite sums, all small colimits separately. Prove this enhancement
   is characterized by that universal property (HA4.8.1.10/13).
   This proves all higher
   coherence as a coCartesian construction, not an objectwise formula.

   Construct relative adjunctions over a simplicial base from the
   marked comma fibrations representing the fiberwise mapping-space
   pairings. If the left functor preserves coCartesian transport and
   has fiberwise right adjoints, construct its relative right adjoint
   by representing these pairings over every base simplex. Define its
   transport maps as adjoint mates; these maps need not be invertible
   for active arrows. Use the straightening equivalence to assemble
   the functor and its unit/counit over the whole base.
   Apply this to a monoidal L^⊗ whose underlying L has a right
   adjoint R. Its multi-fiber adjoints are products of R. Prove the
   relative right adjoint R^⊗ over N(Fin_*) preserves inert edges,
   by the product/projection comparison and the relative unit/counit
   (HA7.3.2.6/7). Its active maps recover the mates of tensors of
   counits. Construct the naturality of this relative adjunction in
   functor spaces, so these mates include all higher simplices.
   Apply it to fixed points and to the fully faithful right adjoint
   `Ind(C/D)→Ind(C)` of monoidal localization. Construct the
   latter adjoint using the local presheaf model and the filtered
   cofiber mapping formula, and prove its unit/counit/full faithfulness.
   Prove Ind extends lax functors by its operadic left Kan
   extension, and that colim:Ind(E)→E is monoidal whenever E
   has the indicated filtered colimits and tensor preserves them
   separately. Deduce the universal exact lax-monoidal approximation
   killing D as `C/D→Ind(C)→Ind(E)→E`. Prove its universal
   property in the actual exact/lax functor spaces and that the space
   of compatible lax structures is contractible. These are the
   infinity categorical adjoint and monoidal Ind constructions;
   ordinary monoidal localization does not supply them.

   Construct the simplicial category whose objects are these small
   coCartesian Segal fibrations over N(Fin_*) and whose mapping
   Kan complexes are the cores of their inert-preserving relative
   functor quasicategories. Prove Kan-ness, composition and units;
   take its native coherent nerve to obtain the infinity category
   of symmetric monoidal infinity categories and lax functors. This
   is not the category with all maps over N(Fin_*) or the functor
   category whose natural transformations encode only strong monoidal
   maps. Construct A with
   objects (C,D,F₁,F₂,α), where C,D are symmetric monoidal,
   F₁:C→D is lax monoidal, F₂:C→D is an underlying functor,
   and α:F₁→F₂ is an underlying natural transformation. Construct B
   with the same objects carrying also a lax structure on F₂ and a
   lax monoidal α. Define their morphisms and all higher simplices
   by the universal evaluation/relative-functor fibrations and their
   arrow categories. In both A and B a morphism has strong symmetric
   monoidal ambient maps u:C→C′, v:D→D′, equivalences of squares
   vF_i≃F_i′u, and the compatibility with α. In A the F₁
   square is lax monoidal and the F₂ square is underlying; in B
   both square equivalences and compatibility are lax monoidal. Use their relative
   functor-space pullbacks and the Cartesian/coCartesian Grothendieck
   construction to assemble varying source/target categories. Prove
   this definition's functor-space universal property, including every
   higher compatibility, and construct B→A forgetting the refinements.
   Prove small limits in this B are computed objectwise: strong ambient
   transport preserves every operadic coCartesian edge, so the limit
   fibration has coCartesian lifts computed componentwise, with product
   Segal fibers. The square equivalences induce the limiting functors
   and α; prove B→A preserves these limits. In particular apply
   this theorem to Kan-indexed diagrams
   of equivalences. No such limit-creation assertion is made for
   arbitrary lax ambient maps. Replace B→A by a
   categorical fibration, naturally in base change. For a Kan
   parameter space S→A whose objects satisfy the preceding universal
   approximation, its pullback has the contractible fibers proved by
   that universal property. Prove a categorical fibration over a Kan
   complex is Cartesian, using equivalence-edge lifting; with these
   groupoidal fibers it is a right fibration, and with contractible
   fibers it is a trivial Kan fibration. Its space of sections is
   therefore contractible (HTT3.3.1.8,2.4.2.4,2.1.3.4). This
   constructs the actual parameterized refinement and its total space,
   including higher transformations and base change.

   Apply this to C=Sp^(BG) and the stable tensor ideal D generated
   by all induced objects Ind_1^G X, using finite cones and shifts.
   Prove the projection formula identifies the tensor of an induced
   object with any action as induced, and that the norm on induced
   objects is the identity under orbit/fixed-point identifications.
   Thus Tate kills D. Prove D_/X is filtered and
   `colim_(Y∈D_/X)Y≃X` by induced-sphere generators and their
   kernel-killing cofibers. The resulting formula
   `colim_(Y∈D_/X) cofib(Y→X)^(hG)≃X^(tG)`
   follows from the norm cofiber triangles and the vanishing of the
   colimit of the orbit terms. Apply the preceding universal
   approximation to homotopy fixed points, which are lax symmetric
   monoidal as a right adjoint. This constructs the lax symmetric
   monoidal Tate functor and the compatible `can:hG→tG`.
   D is not closed under arbitrary filtered colimits.
   Handle size by choosing an uncountable regular κ for which fixed
   points and Tate are κ-accessible, the relevant κ-compact objects
   are tensor-closed, and BG-diagrams agree with coherent actions on
   those objects. Prove these bounds and pass from that small model
   by Ind_κ; prove independence of κ and the chosen small model.
   These coherent quotient/Ind constructions precede their use here.

   Construct the unital Tate action for every coherent equivariant
   left module over a coherent equivariant associative ring by applying
   the lax functor to the two-colored associative algebra/module
   operad. Construct its ordered input profiles explicitly: an A-output
   has an ordered word of A-inputs; an M-output has an ordered
   word of A-inputs followed by its sole M-input. Permutations
   relabel the input slots. Construct slot substitution, permutations,
   units and the colored operator nerve LM^⊗. Prove its infinity
   operad axioms; it is not required to be a coCartesian monoidal
   category. Define its algebras as inert-preserving functors
   LM^⊗→C^⊗ over N(Fin_*). Construct restriction along
   Assoc^⊗→LM^⊗, recording the associative algebra A, and
   evaluation at the module color, recording its underlying M.
   Construct the fiber over A and compare it with the derived strict
   left-module category through the rectification below; compare the
   total category with strict algebra/module pairs. These are the
   specified comparison targets, including maps and higher
   transformations. Prove unit, composition, base-change
   and group-restriction comparisons in these operadic functor spaces.

   Construct the separate operadic rectification comparison with
   G2's strict associative rings and left modules. Use its simplicial
   stable-projective spectral model and its pushout-product and monoid
   axioms. Prove its sphere is cofibrant: identify it with the free
   spectrum F₀(S⁰), use the level-projective free/evaluation Quillen
   adjunction and cofibrancy of S⁰, then note stable left Bousfield
   localization keeps these cofibrations. This precedes rectification;
   no cofibrant unit is asserted for the positive-flat model. For the
   two-colored associative/module operad, prove its operation sets
   are Σ-free by their ordered-word permutation torsors. Use this
   Σ-cofibrant operad directly. Construct its free algebra/module
   word filtrations, including nullary unit cells, and its transferred
   combinatorial simplicial model of strict pairs. Prove the model
   hypotheses by the pushout-product/free-cell filtration. Construct
   cofibrant algebra/module bar resolutions and the coherent operadic
   nerve comparison; their word-cell and mapping-end computations
   prove the derived unit/counit and identify the localization of
   strict pairs with Alg_LM(Sp∞), as in HA4.1.8/4.3.3. For a
   supplied algebra A use a cofibrant strict representative and prove
   the module-fiber comparison is independent of that choice. Compare
   G2's positive-flat and this cofibrant-unit model through the same derived
   ring/module comparisons, with their actual Quillen hypotheses.
   For BG, apply the general model-diagram theorem to these
   transferred algebra/module simplicial models, verifying its
   combinatorial hypotheses by the preceding free-cell construction,
   and compare with
   Fun(BG,Alg_LM(Sp∞))≃Alg_LM(Fun(BG,Sp∞)); prove this
   equivalence from the operadic functor definition and pointwise
   operations. The earlier bar comparison of spectra alone is not
   used to rectify rings/modules. This theorem applies to supplied
   strict/coherent associative data, not to an arbitrary homotopy ring.
   This is the reusable coherent-module API consumed by
   Elliptic E2's finite-action towers. Also construct its homotopy-ring/
   homotopy-action version: multiplication and module identities are
   transported through the natural lax product without asserting an
   associative strictification of K(n). Prove exactness and
   `E^(tG)∧F≃(E∧F)^(tG)` for finite spectra F by dualizability.
   Construct restriction, transfer, their double-coset and Frobenius
   reciprocity identities on fixed points and Tate, by the finite
   indexed sum/product adjunctions and the same norm comparisons.
   In particular transfer after restriction acts by tr(1). Construct
   normal-extension norm transitivity and residual quotient actions;
   for a normal subgroup H◁G, straighten BG→B(G/H) to the
   functor assigning its Kan homotopy fiber, equivalent to BH, with
   conjugation transport and every higher simplex. Construct the
   pullback functor S↦Sp^S, with its pointwise monoidal
   enhancement. On equivalences of Kan spaces use inverse pullback
   to regard it covariantly; construct this inversion adapter through
   the Kan groupoid/core and prove all higher inverse/composition
   comparisons. Compose that covariant functor with the parameterized
   fiber functor. Fixed points and the induced-ideal quotient define a
   diagram in A over B(G/H). Apply the preceding right-fibration
   refinement theorem, using objectwise limits in B, to lift it
   coherently to the lax fixed-to-Tate transformation. Prove the
   forgetful map is an equivalence and respects multiplication and
   the normal-extension norm. Take the limit of the lifted diagram
   in B. Prove BG≃colim_(s∈B(G/H))F_s for its Kan fiber family,
   by the groupoid straightening/Grothendieck comparison. Then
   `lim_s Sp^(F_s)≃Sp^(BG)` because Fun(−,Sp∞) sends this
   colimit to a limit, and the constant target has limit
   `lim_(B(G/H))Sp∞≃Fun(B(G/H),Sp∞)`. Identify the resulting
   limit functors with `hH,tH:Sp^(BG)→Sp^(B(G/H))` and the
   fixed-to-Tate transformation. This explicitly constructs its total
   parameter space; objectwise contractibility alone does not define it.
   This supplies equivariant, multiplicative comparisons, not just
   choices separately at the objects of B(G/H). Prove the unit criterion in
   R⁰(BG) by finite-skeleton nilpotence and the Milnor sequence,
   including the square-zero phantom-kernel comparison. For the
   Sylow restriction/transfer composite its basepoint value is the
   prime-to-p index, hence a unit. These constructions use the Borel
   model for every finite G, not only the representation-sphere model
   used for C_p in the next item.
2. For the faithful complex character χ of C_p use the free spheres
   S(kχ) as a model of EC_p. Construct their finite-stage duality,
   Thom and transfer diagrams and identify the ordinary norm cofiber
   with the Euler-inversion homotopy colimit of the χ-Thom twists
   of E^(hC_p). After trivializing these twists by an orientation,
   identify the structure maps with multiplication by x=e_χ.
   Compute K(n)^*(BC_p)=K(n)^*[[x]]/([p](x)) using the circle
   bundle over CP∞, its Gysin sequence and the actual skeletal/Milnor
   comparison. Here [p](x)=v_n x^(p^n); its unit coefficient makes
   x nilpotent, so Euler inversion gives K(n)^(tC_p)≃0.
   Extend this to Borel C_p-actions with an equivariant unital
   homotopy K(n)-action by Tate-module naturality. For H normal in G,
   construct the G/H-equivariant unital K(n)-action on K(n)^(hH)
   (K(n) has trivial original action) and compare iterated fixed
   points and the normal-extension norm. Use these actions and
   norm transitivity for p-groups and the Sylow unit comparison for
   arbitrary finite groups to prove K(n)^(tG)≃0. Prime-to-p groups
   also have the direct averaging norm inverse. This input concerns
   K(n)-modules; it does not presume the theorem for all K(n)-local
   spectra.
3. Use F6.3's stable natural B(n)-homology comparison.

   Realize this particular transformation as an actual spectrum map.
   Let C be the countable polynomial-monomial basis and set
   S_n=⋁_(c∈C)Σ^|c|K(n). Construct countable-cell models for K(n)
   and S_n from their countable homotopy groups: attach countably many
   cells in all integer degrees to realize generators and kill kernels.
   Compactness of the attaching spheres gives finite closures and a
   sequential finite-subspectrum exhaustion S_n≃hocolim_iS_i.
   This construction includes the unbounded negative degrees of K(n).
   Extend Λ and its inverse to stable finite spectra with all suspension
   comparisons. Apply finite duality to the inverse comparison
   `S_n*(-)→B(n)*(-)` to obtain compatible maps S_i→B(n). Use the surjection
   `[S_n,B(n)]→lim_i[S_i,B(n)]`
   in the mapping-telescope Milnor sequence to lift them. Its lim¹
   kernel permits nonunique phantom choices. Compactness verifies
   the prescribed transformation on every finite source, and sphere
   tests prove the resulting S_n→B(n) is an equivalence.
   Transport the unital homotopy K(n)-action along this equivalence.
   Keep the direct-sum monomial basis throughout; no product/wedge
   exchange or unrestricted finite-source Yoneda assertion is used.
4. From F6.3's large-exponent Moore system choose a finite type-n M
   with BP_*M=BP_*/(p^a₀,v₁^a₁,…,v_(n−1)^a_(n−1)).
   Consume F6.3's system-level MU/BP scalar-map transport and its
   rectified regular-power cofiber ladders. Localizing that finite
   ladder at the specified v_n action retains its finite filtration,
   with subquotients shifts of B(n). Prove
   `L_nBP∧M≃v_n⁻¹BP∧M` through the localization unit.
   Use F6.3's right-flat E(n)_*BP comparison to compute the actual
   E(n)-smash cofiber quotients by the right-unit images of p^a₀,
   …,v_(n−1)^a_(n−1). Right-unit triangularity makes the left
   ideal (p,…,v_(n−1)) nilpotent in that quotient. Thus η_R(v_n)
   is a unit plus a nilpotent term and acts invertibly. Spectral
   Whitehead proves the required E(n)-equivalence on maps, not
   merely a coefficient substitution. The target is local because
   v_n⁻¹BP has
   class E(n) and its pairing certificate. Construct also the finite-
   duality comparison `v_n⁻¹BP∧M≃F(DM,v_n⁻¹BP)`.
   Include the right/left
   v_n cooperation comparison modulo lower-generator powers.
   The filtration is still used for K(n)-nilpotence; locality alone
   does not provide that filtration.

   Use F6.4's finite type0 L_nBP-prenilpotent Y. Its localized
   model L_nY is built in finitely many stages from L_nBP-modules.
   For each such module N, use the unit/action retraction
   N∧M→L_nBP∧N∧M→N∧M and smash the preceding finite
   filtration with N. Thus L_n(Y∧M) is K(n)-nilpotent.
   This argument requires no multiplication on M.
   The Tate functor kills these finite constructions, using item2
   and the unital module action, even when the generating modules
   are infinite spectra. Thus for F=Y∧M, a finite type-n spectrum,
   `(L_nF)^(tG)≃0`. Thick classification and finite dualizability
   give the same vanishing for every finite spectrum of type≥n.
5. Put R_G=(L_nS)^(tG), with its unital ring and L_nS-module
   structure. Use the finite type tower F₀=S_(p),
   F_(i+1)=cofib(v_i), and F6.3's telescopes T(i), with v₀=p
   and the rational comparison T(0)=S_(p)[1/p]≃Hℚ. Its top term
   R_G∧F_n vanishes by item4 and finite-smash/Tate comparison.
   The remaining Bousfield terms R_G∧T(i), i<n, lie below K(i):
   use ⟨L_nS⟩=⟨E(n)⟩ and
   `⟨E(n)∧T(i)⟩=⟨K(i)⟩`, proved by field Künneth and the
   self-map height tests. Deduce ⟨R_G⟩≤⟨E(n−1)⟩ and its
   E(n−1)-locality by the unital ring action. No commutation of
   Tate with infinite telescopes is needed here.

   Finally any K(n)-local Borel object E is L_n-local and has the
   equivariant action of the trivial-action idempotent ring L_nS.
   Its ordinary Tate spectrum is a unital R_G-module. Since
   K(n)∧R_G≃0, the unit/action retraction proves
   K(n)∧E^(tG)≃0 for every such action, yielding the required
   localized norm equivalence. This step does not move localization
   through homotopy fixed points. Finite versus telescopic
   localization retains the distinctions proved in F6.3–4.
Elliptic E2 consumes this finite-action API for its continuous towers.

For fixed p and n≥1 use F6.3’s cofinal generalized-Moore tower M_i
with its coherent quotient/unit maps and its already proved finite
pro-recovery and independence comparisons. Use finite duality and the
localization
universal property, as in Hovey–Strickland Proposition7.10(e), to
prove the model-level comparison
`L_(K(n))X≃holim_i(L_nX∧M_i)`
for every p-local spectrum X. Construct the map from X and prove the
homotopy limit is K(n)-local and that the map is a K(n)-equivalence,
using finite duality, the exponent bounds and fracture; do not replace
a coefficient completion by this object-level theorem. Specialize in
F4's actual right-module category over the strict MU_(p), for a
supplied even MU_(p)-module E and the ordered lifted height generators.
Construct MU_(p)∧M_i≃MU_(p)/J(i) and the actual module-map
multiplication identity for the good self-maps, compatible with the
chosen tower. Use F6.4's MU_(p)∧L_n^fY≃MU_(p)∧L_nY to
identify L_n(E∧M_i) with v_n⁻¹(E/J(i)), with comparison maps
and units; finite M_i commute with L_n. Then identify the limit with
`holim_i v_n⁻¹(E/J(i))` on this same index category. A homotopy
BP action may be compared separately through the stated p-typical
map; no A∞ BP-module category is presumed by this assertion.
Products require separately supplied coherent MU-algebra/derived
quotient models and multiplicative comparison maps, not ring
structures on every generalized Moore spectrum. Identify
π_* with ordinary coefficient completion only under explicit regularity
and Milnor/lim¹-vanishing hypotheses; retain the derived limit otherwise.
For a fixed prime p and a Landweber-exact
p-local coefficient module M with M/I_(n+1)=0 prove the represented theory is E(n)-local,
and construct its p-completion Hasse square under the stated finiteness
and completion hypotheses. EllipticCohomology E2 supplies the height≤2
elliptic instance. Include the K(1)/K(2) comparisons and the arithmetic square for
all spectra using derived p-completion, with vertices X, ∏_p X_p^∧,
X_ℚ and (∏_p X_p^∧)_ℚ, proving its homotopy-cartesian comparison
and retaining rationalization outside the product until a separate
commutation theorem is proved. These are the inputs consumed by
EllipticCohomology, and convergence conditions for assembling them.
Morava E∞ realizations, completed stabilizer cooperations and θ-algebra
obstruction theory are Elliptic E2 targets; this layer supplies their
local categories and fracture functors.

### F6.6. Torus Euler cancellation on finite MU pieces

Use G's single MU spectrum and complex orientation, F1–F3's formal group and
p-typicalization, F5's finitely presented comodule filtration, and G5.7's
continuous-torus action, coherent Thom family and mapping-tower comparisons.
For T=(S¹)^ℓ let C,D be compact closed stably-complex T-fixed manifolds with
their specified finite CW and compact-oriented duality models, with D
equidimensional of real dimension d_D. Treat different-dimensional connected
components of D by the finite-sum comparison, with their individual shifts.
Obtain the smooth finite CW models from GeometricTopology's
**The smoothing-and-triangulation comparison**, item1 **Smooth implies PL**,
using the locally finite smooth triangulation and compactness, followed by
AlgebraicTopology's manifold-to-abstract-CW comparison. Transport the bundle,
Euler and duality diagrams along the actual comparison homotopy equivalences.
Write
P_C=MU∧Σ∞C₊ and P_D=MU∧Σ∞D₊, as constant objects of
A_MU(BT)=Fun(Sing BT,Mod_MU). Treat specified finite-free presentations
P_C≃⊕_jΣ^{d_j}MU and P_D≃⊕_kΣ^{e_k}MU, as well as the general
finite-cell P_C,P_D without such presentations. Compactness supplies neither
a chosen finite CW model nor a finite-free MU basis; construct the former
through the cited manifold/CW comparison and carry the latter as actual data
when using the finite-free interface.

For a T-equivariant complex rank-r bundle ν→C with no zero character weights,
consume G5.7's actual Thom-cocone Euler map eν:P_C→Σ^{2r}P_C. Construct
`torusFiniteCellMappingEulerComparison`: compact MU-oriented duality on D
and the constant-family mapping comparison identify

`π_t Map_BT(Σ^{a+2r}P_C,Σ^bP_D)`
`  ≃ MU^{d_D+b−a−2r−t}(BT×C×D)`

for every a,b,t∈Z. Prove the underlying equivalence of mapping spectra,
composition, restrictions and finite-model comparisons. Precomposition with
Σ^a eν corresponds to multiplication by the Euler class pulled back from
BT×C, with degree +2r. Prove `momentNormalMU_eulerPrecomposition_injective`
on these groups in every degree. Construct the finite-sum variants and the
actual finite-duality transpose: for M=Σ^(−b)D_MU(P_D), identify the above
precomposition map with postcomposition

`Map_BT(M,Σ^(−a−2r)D_MU(P_C)) → Map_BT(M,Σ^(−a)D_MU(P_C))`

by D_MU(Σ^a eν). Construct its identification with Σ^(−a)D_MU(eν)
through evaluation/coevaluation and the ordered suspension-sphere interchange;
include the Koszul interchange factor (−1)^(2r k)=1 for an integer shift k.
This transposed assertion has the stated geometric M, not an arbitrary module.
For G5.7's specified finite-free
postcomposition interface identify its entries by the same oriented-duality
calculation and prove injectivity. Include the empty sums and r=0 unit branch.

For any finite CW X, build the actual finite projective-bundle comparisons
MU^k(X×(CP^n)^ℓ)=⊕_{0≤α_i≤n}MU^{k−2|α|}(X)x^α, their multiplicative
restriction maps and their surjectivity in every degree. Use G3's Milnor
sequence to obtain zero lim¹ and the completed graded ring
MU^k(X×BT)=∏_{α∈N^ℓ}MU^{k−2|α|}(X)x^α. Construct the same comparisons
for BP and MU_(p). Use x_i=e(λ_i) for CC/G5.7's standard character line
λ_i=O(−1); its ordinary coefficient image is −h_i. Relate this coordinate
to G4's dual-line projective-bundle coordinate by the actual formal inverse.
Prove tower and multiplication compatibility, and identify this instance's
mapping-spectrum Milnor sequence. Finite truncations have their own kernels;
prove cancellation on the full completed groups.

Consume RepresentationTheory/CompactGroups Layers1–2, **unitarizability**
and **complete reducibility**, and its **circle S¹ and Fourier series** engine
for integer characters of AddCircle 1. Construct `finiteProductCircleCharacters`:
continuous characters of T=(Fin ℓ→Circle) are uniquely
χ_m(z)=∏_i z_i^(m_i), m∈Z^ℓ, by coordinate restriction and finite-product
multiplication. Use Mathlib's AddCircle.homeomorphCircle and toCircle_addChar
at period1; toCircle_zsmul identifies the circle engine with z↦z^n.
For a finite-dimensional continuous T-representation, apply the compact-group
decomposition and abelian Schur lemma to obtain its finite character list.
Construct only the pointwise fibre/Euler adapter: at one vertex of each
connected C component decompose ν_v, and use G4's Thom multiplicativity to
identify its Borel Euler class. Prove that path-related vertex restrictions
agree by homotopy naturality. With χ_j≠0 these fibre characters, set
Π(x)=∏_j[χ_j]_F(x), using the formal inverse for negative weights. In the
C-skeletal multiplicative filtration, prove n=Π−eν has filtration ≥1 and
n^q=0 for a uniform q=1+dim CW C, at every torus stage and after completion.
Use relative cup products and cellular diagonals to prove the filtration
product law. In the actual cup ring MU^*(BT×C), Euler classes have even
degree, so construct the homogeneous ring identity

`eν · Σ_{i=1}^q Π^{q−i}n^{i−1} = Π^q`.

Apply this identity through the cup-action comparison of
`torusFiniteCellMappingEulerComparison`, with pullback to BT×C×D. Construct
that comparison as an action on the direct sum over all integer mapping
degrees: the scalars shift degrees, rather than acting within one degree.
This reduces cancellation to scalar Π regularity while retaining all
nilpotent constant terms of eν. The skeletal ideal need not be a subcomodule.

For finite X=C×D identify BP^k(X) with BP_{−k}(DΣ∞X₊), including the actual
coaction. Apply F5's finite filtration by shifts of BP_*/I_h, h finite and
including h=0. Prove scalar-character regularity on every completed factor:
write χ=dχ₀ with primitive χ₀, implement a GL_ℓ(Z) torus-coordinate change,
and use the nonzero linear coefficient d for h=0. For h≥1 write d=p^a d'
with p∤d'; prove the first surviving p^a-series coefficient is a nonzero
power of v_h up to a unit, using F5's quotient presentations and primality
for the domain BP_*/I_h. Prove the graded
power-series coefficient substitution is invertible for the chosen torus
coordinate change. Complete the finite module filtration coefficientwise,
prove exactness degree by degree, and induct to obtain Π and Π^q regularity.

Consume F6.3's `muPtypicalRingComparison` i:BP→MU_(p), including its
unit/product homotopies and homotopy BP-action. Consume F6.4's generic
`muPtypicalPolynomialCoefficientIso` and monomial basis for that same
coefficient embedding i_*, using F3's single fixed splitting
MU_(p) --p--> BP --i--> MU_(p). This generic coefficient foundation
precedes its localization application and depends only on the earlier
coefficient/idempotent constructions.

Construct `muPtypicalFiniteCohomologyComparison`: deduce flatness of the
polynomial BP_*→MU_(p)* embedding and the domain presentations modulo each
finite I_h, including I_0. Define the natural finite-CW-pair map

`MU_(p)^* ⊗_(BP^*) BP^*(X) → MU_(p)^*(X),  r⊗a ↦ r·i_*(a)`

and prove it an isomorphism by flatness, coefficient comparison and finite
cofiber/retract induction. Keep its naturality, products, suspensions and
relative boundary maps. Regrade coefficient degree j as cohomological
degree −j. Set x_BP:=p_*(x_MU). Construct the strict Cartier coordinate
comparison `i_*(x_BP)=c_F(x_MU)`, its inverse substitution and its scalar
character-series regularity transport. This scalar-coordinate comparison,
together with the finite-X coefficient comparison, supplies the injectivity
proof. Construct also the normalized Thom/Euler unit
`i_*(e_BP(ν))=u(ν)e_MU(ν)`, with `u(L)=c_F(x_MU(L))/x_MU(L)`
on lines, multiplicativity and the splitting-injection comparison on bundles.
Prove the unit and inverse are compatible on the finite Borel/flag models
and their completed tower, including rank0/unit1. Transfer the finite
Landweber filtration and Euler calculation through these finite-X and
scalar-coordinate comparisons. The full-bundle Thom unit is a separate
compatible orientation API. Consume the map, polynomial basis and p-typical
wedge comparison from their F6.3/F6.4 owners.

Recover integral injectivity by the finite-X localization comparison and
coefficientwise injection M→∏_p M_(p). Construct the coefficient maps on
power series; keep localization outside the infinite series product.

Apply G5.5/G5.7's full-base MU→HZ coefficient square, finite CP restrictions
and maps of mapping towers/Milnor sequences to these objects. Prove their
compatibility with `torusFiniteCellMappingEulerComparison`, its cup action
and the finite-X/completed comparisons. This gives the corresponding
coefficient maps on Euler and extension classes.

### F6.7. Euler cancellation and module-extension nullhomotopies

In G5.7's module-family category take an actual cofiber triangle
A→B→Q→δΣA, a specified finite sum A≃⊕_DΣ^{b_D}P_D, a finite family of
fixed components C and nonzero-weight complex bundles ν_C of ranks r_C,
and specified data
Q≃⊕_CΣ^{2r_C}P_C, j:⊕_C P_C→B, qj~⊕_C eν_C.
The ranks may vary. Construct `momentStratumExtension_nullhomotopy`: compose
the given diagonal homotopy with the actual cofiber nullhomotopy δq~0,
apply F6.6 to each finite mapping entry to prove [δ]=0 in the global
π₀ Map_BT(Q,ΣA), and construct a choice of path δ→0. Apply G5.7's
extension classification to give A⊕Q≃B under A and over Q. Include the
rank-zero, empty-family and empty-A branches. Prove replacement, restriction
and coefficient compatibility for diagrams carrying the chosen δ-nullpaths,
and describe the splitting-choice space by G5.7's mapping-space fibre.
Restrict a chosen global path to the finite Borel towers. For a finite
filtered diagram of such triangles with supplied compatible δ-nullpaths,
construct the compatible splittings by G5.7's filtered extension-classification
form. The finite Borel restriction diagram is obtained from the one global
path and its functorial restriction maps.

Construct the geometric instantiation in SymplecticGeometry/ConvexityToric
T2, **Morse–Bott and moment-map topology**, as a separate stable-stratum/
open-filtration and diagonal Thom/Euler construction. Supply its actual
stable-stratum/support cofiber, j, diagonal Thom/Euler homotopy and prior
finite-piece decomposition of A to instantiate the abstract lemma. Retain
the full integral MU-module moment-filtration application, including torsion
in fixed-component homology. T2's ordinary rational perfection and its
even/torsion-qualified integral cases precede this separate construction.
Send the resulting chosen path through G5.5's fixed MU→HZ scalar extension.

## Order and references

F6.6 consumes the earlier F1–F3/F5 coefficient/comodule constructions,
F6.3's generic p-typical ring map/action and F6.4's generic coefficient
polynomial/monomial foundation, together with G's finite-duality and G5.7
module-family/Thom adapters. Its coefficient proof does not consume the
chromatic localization, strong-smashing or Tate applications. The generic
F6.5 enhancement precedes G5.7 and has no F6.6 or geometric input.
F6.7 consumes F6.6 plus G5.7's extension classification.
The separate stable-stratum/diagonal construction in
SymplecticGeometry/ConvexityToric T2, **Morse–Bott and moment-map topology**,
supplies the geometric cofiber/diagonal data and instantiates F6.7 for the
full integral MU-module finite moment filtration. The Euler proof uses the
generic coefficient constructions and the stated module-family/duality inputs.

F1 precedes F2. F2 consumes TB B4's mod-p Adams/coefficient tools plus
G's MU model and supplies F3's spectra/cooperations. F4's initial AHSS
uses these construction targets; the F3 space-homology presentation then
precedes F4's Adams–Novikov/comodule applications. G3 owns integer
spectral localization, derived p-completion and π-holim/Milnor, with its
actual ring/module and convergence comparisons; consume it before MU_(p)
and keep F4's BP-nilpotent completion and its identification as new targets.
F6.1 builds homological localization from G2's model and its own
cardinality inputs. F6.2's nilpotence proof consumes G5's Thom and
complex Bott models and HomotopySpheres3B's James construction;
its X(r)-based towers and E₂ Thom refinements are new constructions.
F6.3 first constructs the quotient-operation stable homology
comparison and the P(n)/B(n)/E(n) class comparisons from F3/F5,
before height forms, finite support or Moore
systems. Its Smith toolkit and TB's Steenrod/Adams carriers supply
the separate linear-connectivity theorem, type examples and initial
periodic maps; then thick classification, periodicity transport and
Moore systems and their system-level MU/BP map comparisons follow.
Finite-local telescope comparison, Moore pro-recovery and the actual
Moore-dual Γ_k^fS model are then proved in F6.3 before F6.4’s
finite chromatic filtration and its source N/M comparison.
F6.4 consumes those class comparisons, actual cofinal Moore systems,
finite type examples and F5 exactness, then builds
algebraic stabilizer/change-of-rings/prenilpotence before smashing
and fracture. Its continuous cohomology consumes ProfiniteCohomology,
and its idempotent adapters consume SchurWeyl's earlier native
Young-diagram/symmetrizer/hook APIs. F6.5 first builds its native
simplicial Bergner, Kan-enriched diagram/internal-hom and enriched
Grothendieck/localization homotopy (co)limit foundations before unmarked
straightening and the Joyal model. Slice/equivalence-edge horn comparisons
precede its Joyal fibrancy proof. It then builds marked models and their
straightening, followed by coherent model-diagram rectification and
(co)limit comparison, Cat∞ colimits/descent/Kan extensions,
space-valued Ind and coCartesian monoidal/relative-adjoint constructors.
Its colored-operad rectification compares supplied strict associative
rings/modules independently of the BG-diagram rectification, after
the model (co)limit comparison; it does not rectify arbitrary homotopy
rings. It then constructs the
countable-cell/Milnor realization of the earlier homology comparison and ordinary Borel norm/Euler model before applying
F6.4's prenilpotent seed and finite height tower. The Morava E∞ realization lane
of EllipticCohomology remains downstream. F5 exactness uses F1–F4, while its algebraic
deformation lane begins with F1 independently of the spectral realization.
The String coefficient calculation and elliptic spectrum construction consume
these layers; neither is an input to Lazard, Quillen or BP construction.

- Quillen, [*Elementary proofs of some results of cobordism theory using Steenrod operations*](https://people.math.rochester.edu/faculty/doug/otherpapers/QuillenElem.pdf).
- Adams, *Stable Homotopy and Generalised Homology*, for orientations and cooperations.
- Ravenel, [*Complex Cobordism and Stable Homotopy Groups of Spheres*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/mybooks/ravenel3rd.pdf), for p-typical cooperations and Adams–Novikov constructions.
- Landweber–Ravenel–Stong, [*Periodic cohomology theories defined by elliptic curves*](https://people.math.rochester.edu/faculty/doug/mypapers/lrs.pdf), for exactness and elliptic examples.
- Wilson, *The Ω-spectrum for Brown–Peterson cohomology II*, and Hovey, [*The homotopy of MString and MU⟨6⟩ at large primes*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Hovey-bpbp1.pdf), for the Hopf-ring interfaces.
- Lubin–Tate, *Formal moduli for one-parameter formal Lie groups*, for the algebraic deformation theorem.

- Devinatz–Hopkins–Smith, [*Nilpotence and stable homotopy theory I*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/dhs-ocr.pdf), for the three nilpotence scopes and the Thom/James/vanishing-line proof.
- Hopkins–Smith, [*Nilpotence and stable homotopy theory II*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/HS.pdf), for finite support, thick classification and periodicity.
- Ravenel, [*Nilpotence and Periodicity in Stable Homotopy Theory*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/mybooks/nilpb2020.pdf), §§3.3,7.3,7.5, Chapters6–8 and AppendixC, for invariant primes, Bousfield classes, periodicity, the Hopkins–Ravenel smashing proof and Smith idempotents.
- Hovey–Strickland, [*Morava K-Theories and Localisation*](https://doi.org/10.1090/memo/0666), for generalized Moore systems, their local categories and completion comparisons.
- Greenlees–Sadofsky, [*The Tate spectrum of v_n-periodic complex oriented theories*](https://people.math.rochester.edu/faculty/doug/otherpapers/greenlees-sadofsky.pdf), and Kuhn, [*Tate cohomology and periodic localization of polynomial functors*](https://arxiv.org/abs/math/0307173), for the stated local Tate comparisons.

- Hovey–Sadofsky, [*Tate Cohomology Lowers Chromatic Bousfield Classes*](https://doi.org/10.1090/S0002-9939-96-03495-8), for the finite-height prenilpotence/Tate descent.
- Johnson–Wilson, *BP-operations and Morava’s extraordinary K-theories*, Math. Z. 144 (1975), 55–75, Proposition4.14, for the operation-defined comparison, and Würgler, [*Cobordism theories of unitary manifolds with singularities and formal group laws*](https://doi.org/10.1007/BF01221149), Theorem2.16 and Remark6.19, for quotient operations and the stable homology comparison; the countable-cell/Milnor realization is the additional spectral adapter specified here.
- Clausen–Mathew, [*A short proof of telescopic Tate vanishing*](https://arxiv.org/html/1608.02063), §2, for the unit/transfer and arbitrary-action module criteria.

- Symonds, [*Permutation complexes for profinite groups*](https://ems.press/content/serial-article-files/43113), §5 Theorem5.2, Proposition5.4, Corollary5.5 and §7, for finite signed weak permutation resolutions and complete cohomology; the uniform-vcd comparison is constructed in F6.4.
- Nikolaus–Scholze, [*On topological cyclic homology*](https://arxiv.org/abs/1707.01799), §I.3 and AppendixA, for the induced-object ideal, coherent stable quotient/Ind construction and lax symmetric monoidal Tate functor.

- Lurie, [*Higher Topos Theory*](https://www.math.ias.edu/~lurie/papers/HTT.pdf), §§1.2.4,1.2.9,2.1.2,2.2.1–2.2.5,2.4.5–2.4.6,3.1–3.3,4.2.4,4.3,5.2.7,5.3.5,A.2.6,A.3.2–A.3.6, and [*Higher Algebra*](https://www.math.ias.edu/~lurie/papers/HA.pdf), §§4.1.8,4.3.3,4.8.1,7.3.2, for the categorical models, natural marked straightening, model-diagram rectification and (co)limit comparison, Kan extensions, Ind, operadic rectification, monoidal Ind and relative adjoints constructed in F6.5.
