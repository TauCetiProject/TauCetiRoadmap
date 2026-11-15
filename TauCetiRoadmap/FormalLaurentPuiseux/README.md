# Formal Laurent fields, Puiseux expansions and continuous differential calculus

Develop formal substitution, continuous derivations and residues, finite ramified
Laurent extensions, the characteristic-zero Newton–Puiseux algebraic closure,
and its procyclic absolute Galois group. Supply usable coefficient, topology,
coordinate-change and finite-extension APIs for formal connections and loop
algebras.

## Carriers, scope and suppliers

Use Mathlib's `PowerSeries K`, `LaurentSeries K = HahnSeries ℤ K`,
`LaurentPolynomial K = AddMonoidAlgebra K ℤ`, and `HahnSeries ℚ K`.
K is an arbitrary field in L1–L4 except where characteristic zero is explicitly
required. L5's Newton-polygon and coprime-factor-Hensel APIs hold over arbitrary
K; its root theorem and L6–L7 assume characteristic zero and K algebraically
closed. Put `ord = HahnSeries.orderTop`, including ord(0)=∞;
ord(t)=1. Mathlib's multiplicative `LaurentSeries.valued` has v(t)=exp(−1).
Continuity on F=K((t)) always uses this valuation topology, with neighbourhoods
U_a=t^aK[[t]], a∈ℤ. Treat K as an algebraic coefficient field. A K-linear
functional to K is continuous precisely when it vanishes on some U_a; this
means a discrete codomain, independently of any other topology on K. For
ℂ((t)) use exactly this valuation topology.

Consume Mathlib's coefficient/order, power-series coercion, rational-function
embedding, valuation, completeness, Hasse derivative and `LaurentSeries.derivative`
APIs. Tau Ceti's `Huber.LaurentSeries.powerSeries_as_subring_eq_integer`,
`integers_powerSeries_as_subring` and `isOpen_powerSeries_as_subring` supply
existing valuation-ring results. Use `PowerSeries.subst`, `heval`,
`derivative_subst`, `subst_comp_subst` and `HahnSeries.embDomainAlgHom` for
substitution and exponent embeddings. Follow
[Mathlib PR #42313](https://github.com/leanprover-community/mathlib4/pull/42313)'s
`LaurentSeries.expand (n : ℕ+)`, `contract (n : ℕ+) (f) (r : Fin n)`,
`sum_single_mul_expand_contract`, `contract_eq_of_sum_eq` and Hahn
`mem_range_embDomain_iff` shapes for ramified substitutions and the level basis.
Follow [PR #42471](https://github.com/leanprover-community/mathlib4/pull/42471)'s
`hasseDeriv_mul` and `derivative_mul` in commutative-ring generality. Implement
required missing material in Tau Ceti in these shapes and adopt Mathlib's APIs
as they land. General algebraic closures, separability, Kummer theory and Krull
topology remain Mathlib's.

[AlgebraicCurves](../AlgebraicCurves/README.md) Layer 5 owns general complete-DVR
constructions; Layer 9 owns k-compatible place expansions and geometric residues
at places with finite separable residue extension. This roadmap owns the
coordinate-level calculus on Laurent-series carriers; transport its identities
along that roadmap's completion isomorphisms, including its residue-field trace.
The coefficient-level identities allow arbitrary fields K; geometric transport
includes the stated separability hypotheses. Compute ramification for
our explicit levels in L4/L6 directly from their exponent decomposition.
[ProfiniteArithmetic](../ProfiniteArithmetic/README.md) supplies the profinite
group `TauCeti.zHat`; its ring carrier is `Additive TauCeti.zHat`.

The Puiseux field is the subfield of `HahnSeries ℚ K` whose support has a single
positive common denominator: for some n>0, every supported exponent is k/n,
k∈ℤ. It is the union of embedded K((t^(1/n))) under divisibility transition
maps. Construct it on this carrier. Define `RamificationIndex` as a type
synonym of ℕ+ with order n≤m meaning n|m, independently of ℕ+'s usual order.
In L4 form the level diagram in `CommAlgCat K` on its thin category.
Prove there that its cocone into Puiseux is a colimit: every compatible family of
K-algebra maps into any commutative K-algebra factors uniquely through it.

[Dean Cureton's formal Puiseux development](https://github.com/deancureton/Puiseux)
constructs this directed-union carrier and proves algebraicity and algebraic
closedness (`PuiseuxSeries.isAlgClosure`). It is an existing implementation
candidate for L4–L5, independent of Tau Ceti's analytic Puiseux results. Coordinate
with its author before integrating code, following this repository's porting
policy. The targets below specify the mathematics whether developed independently
or integrated; retain their full coefficient, topology, differential and Galois
APIs rather than stopping at the closure theorem.

## L1. Formal substitutions and coordinate groups

Expose the constant-field, polynomial, power-series and Laurent-field maps as
a compatible algebra tower. Construct the Laurent-polynomial embedding by
its finite sum of monomials. Prove injectivity, coefficient formulas, image
and order characterizations. Identify K[[t]] with the nonnegative-order
valuation ring, its maximal ideal with positive order and residue with constant
coefficient. Prove Laurent-polynomial density and truncation convergence:
f_i→f iff for every a, eventually ord(f_i−f)≥a. Equivalently, the supports
are eventually uniformly bounded below and each coefficient eventually equals
the corresponding coefficient of f. Prove this by stabilization of the finite
interval between the support bound and a. The sequence t^(−j), j≥1, has
coefficientwise eventual zero but fails valuation convergence.

For every nonzero φ∈tK[[t]] construct substitution on K[[t]] and extend to F
using f=t^(−N)f₊. Prove independence of N, K-algebra-map laws, composition,
injectivity and ord(f(φ))=ord(φ)ord(f) for f≠0. Supply continuity, coefficient
formulas and the ramified substitution t↦s^e, e>0, between two copies of F.

Coordinates are those φ with nonzero linear coefficient. Give K[[t]] the
subspace valuation topology from F through a scoped instance in a named namespace,
with its inclusion into F an `IsInducing` map. Keep this scope distinct from
`PowerSeries.WithPiTopology`; introduce no global topology instance. Construct their
K-algebra automorphism group of K[[t]] with multiplication σ·τ=σ∘τ.
Writing σ_φ(f)=f(φ), pin σ_φ∘σ_ψ=σ_(ψ(φ)); thus the parameter-series
composition group maps anti-isomorphically to this automorphism group.
Construct inverses and prove this parameter dictionary. Prove such automorphisms preserve the maximal ideal
and are automatically continuous. Obtain inverse coefficients recursively:
the degree-n composition equation determines b_n by the nonzero linear term,
and prove uniqueness. For each N≥1 define the N-jet group as these substitutions
modulo t^(N+1), give composition and truncation maps, and prove the full group
is their inverse limit, with the jet groups discrete and the coordinate group
given the topology of agreement modulo each t^(N+1). Define infinitesimal substitutions as K[ε]-algebra automorphisms of
`PowerSeries (DualNumber K)`, reducing to identity and preserving (t); identify their ε-coefficients with
tK[[t]]D. Prove every K-derivation K[[t]]→K[[t]] is t-adically continuous:
δ(t^n f)=nt^(n−1)fδ(t)+t^nδ(f) gives δ((t^n))⊆(t^(n−1)).
Truncation then determines δ from δ(t), including in positive characteristic. Over `DualNumber (DualNumber K)`, identified with
K[ε₁,ε₂]/(ε₁²,ε₂²), with σ₁=1+ε₁aD and σ₂=1+ε₂bD,
prove σ₁σ₂σ₁⁻¹σ₂⁻¹=1+ε₁ε₂(aDb−bDa)D. This pins the operator-commutator
sign. For every coefficient-field embedding K→K′, use coefficientwise
power/Laurent maps and prove naturality of substitution and jet truncation.

## L2. Continuous derivations and one-forms

Prove product, inverse and quotient rules for the existing Laurent derivative
D, compatibility with power-series derivatives and Hasse derivatives, and the
chain rule for all L1 substitutions. Prove ord(Df)≥ord(f)−1 and continuity.
For f≠0 with leading exponent r and coefficient a_r≠0, if r has nonzero
image in K prove coeff_(r−1)(Df)=r a_r and ord(Df)=r−1. When that image vanishes, locate the first
exponent with nonzero differentiated coefficient, or prove Df=0. In
characteristic zero prove ker D=K.

Use Mathlib's `Derivation K F F`; take the submodule of maps continuous for the
valuation topology. Prove each is uniquely aD, a∈F, and conversely every aD is
continuous. Prove bracket closure and [aD,bD]=(aDb−bDa)D. Characterize the
K[[t]]-preserving and maximal-ideal-preserving subalgebras as respectively
K[[t]]D and tK[[t]]D, with the L1 infinitesimal-coordinate comparison.

Package D as a `Derivation K F F` using its product rule.
Let λ:Ω[F/K]→F be `D.liftKaehlerDifferential`. Define Ω¹_cont(F/K) as
Ω[F/K]/ker λ and prove the induced F-linear equivalence with F, sending dt
to 1. Give it the transported valuation module topology. For a finite-dimensional
Hausdorff F-module M with `IsModuleTopology F M`, prove continuous K-derivations F→M
factor uniquely through this quotient by a continuous F-linear map. Establish
continuity of factorization and of the quotient derivation. The construction factors the algebraic Kähler derivation through the
specified quotient, identifying its dt class with 1.
Prove coordinate covariance du=Dφ dt, functoriality and compatibility with
coefficientwise field embeddings K→K′;
for coordinate automorphisms this gives an invertible semilinear map on forms.

## L3. Residue, primitives and coefficient duality

Define Res(f dt)=coeff_(−1) f. Prove linearity, vanishing on U_0 dt,
Res(dg)=0 and Res(f dg)=−Res(g df). Prove for every nonzero φ∈tK[[t]] of
order e the finite-map formula Res(f(φ)Dφ dt)=e Res(f dt), in all
characteristics. In particular coordinate changes preserve residue. Build the
universal coefficient identity, for a commutative ring R, a unit u∈R[[t]]ˣ
and e,k≥1:

`e·coeff_(ek)(u^(−k)) + coeff_(ek−1)(u^(−k−1)u′) = 0`.

Prove inverse/product/derivative compatibility with `PowerSeries.map` and
finite-jet dependence of these coefficients. In the universal ring
ℤ[x₀,…,x_(ek)][x₀⁻¹], prove the identity by passage to its characteristic-zero
fraction field and injectivity, then specialize x_j to the coefficients of u
in R. For φ=t^e u this treats all negative monomials except t^(−1), whose
residue is e; nonnegative monomials have zero residue. Extend by valuation
continuity. AlgebraicCurves Layer 9 transports this coordinate-level formula
along its completion charts.

In characteristic zero construct a primitive of every residue-zero form by
termwise division, prove uniqueness modulo K, and characterize im D as exactly
these forms. Include negative exponents and the excluded t^(−1) coefficient.
The t^(−1) form remains outside the derivative image.

Prove nondegeneracy of (f,g)↦Res(fg dt), annihilator(U_a)=U_(−a), and perfect
finite-dimensional pairings U_a/U_b × U_(−b)/U_(−a), a≤b. For finite-dimensional
K-vector spaces V use `HahnModule ℤ K V` for V((t)) with its F-module action,
and the coefficient-preserving `HahnModule.of` comparison to `LaurentSeries V`.
Topologize it by the K-linear lattices U_a=t^aV[[t]], consisting of series
with every coefficient below a zero; these are K[[t]]-submodules. Prove the natural F-linear comparison F⊗_K V≃V((t)) for finite-dimensional V,
using the singleton constant-coefficient map; prove finite-basis independence,
completeness and the power-series lattice/finite-jet comparisons. Identify its
continuous K-linear dual with V*((t))dt by coefficient contraction and residue.
Define the dual topology by annihilators of U_(−a)(V); prove this identification
is a homeomorphism and compatible with linear maps. The dt factor gives the
coordinate-covariant description; changing parameters transforms forms too.

Compare Laurent-polynomial derivative/residue with the Laurent embedding.
For every K-Lie algebra L, construct the K-linear map
`AddMonoidAlgebra K ℤ ⊗[K] L → HahnModule ℤ K L` sending t^j⊗v to the
coefficient-j singleton v. Define the bracket directly by coefficient
convolution on `HahnModule ℤ K L` for every K-Lie algebra L; prove the
coefficient sums finite and the support bounded below, and establish the Lie
identities over K. For finite-dimensional L give F⊗_K L its scalar-extended
F-Lie algebra and L((t)) its coefficientwise F-action, then prove the
comparison is an F-`LieEquiv`. Transport `LaurentSeries.derivative K` on `LaurentSeries L`
through `HahnModule.of` to define D on L((t)); prove continuity and
D(f·v)=Df·v+f·Dv. Prove coefficient formulas, injectivity, bracket compatibility and
functoriality. Extend a K-bilinear form Φ coefficientwise
and prove that Res(Φ(f,Dg)dt), restricted along this polynomial-loop embedding,
is Mathlib's `LieAlgebra.LoopAlgebra.residuePairing Φ`, including
its coefficient n on a second argument of degree n. These are the exact
supplier identities for formal loop cocycles.

## L4. Ramified levels and the Puiseux field

For n>0 construct ι_n:K((u))→K⟦ℚ⟧ using `HahnSeries.embDomainAlgHom` on
k↦k/n, with coefficient, support and injectivity theorems. For n|m construct
u_n↦u_m^(m/n), prove composition and compatibility with ι_n and ι_m.
Identify level-n images by denominator n, intersections by gcd, and generated
composita by lcm. Prove every finite family of Puiseux elements lies in a
single common level, with a common-level lift for polynomial coefficients.
Prove closure of their union under addition, multiplication and inverse, and install the resulting subfield's K- and level-one F-algebra
structures with the tower laws.

Over F, prove level n has basis 1,u,…,u^(n−1): split an arbitrary Laurent
series into its n exponent congruence classes and prove uniqueness. Thus its
degree is n and every Puiseux element is algebraic over F in all
characteristics. Identify the level with adjoining a root of X^n−t, and prove
irreducibility by this basis or the valuation-ring Eisenstein/Gauss argument.
Supply the substitution comparison to L1's t↦u^n.

Restrict `HahnSeries.addVal` to obtain the Puiseux additive valuation in
`WithTop ℚ`, and compare with each level's integer order scaled by 1/n.
Supply its multiplicative valuation in `WithZero (Multiplicative ℚ)`, sending
a nonzero series of order q to `WithZero.exp (−q)` and zero to zero;
use its valuation topology and prove level
embeddings are homeomorphisms onto their images. Prove the Puiseux field is
not complete: the partial sums of Σ_(j≥1) t^(j+1/(j+1)) are Puiseux elements
and form a valuation-Cauchy sequence, while its Hahn-series limit has no finite
common denominator. Prove coefficient uniqueness excludes any Puiseux limit.
This also exhibits its strict inclusion in the full rational Hahn field.

In characteristic zero define D_t on this subfield by the coefficient rule
D_t(t^q)=q t^(q−1). Prove its support remains at a finite level, level
compatibility, continuity and product/chain identities. Under ι_n,
D_t(ι_n f)=(1/n)u^(1−n)ι_n(D_u f). Define one-forms by the same continuous
quotient construction at each level, with compatible transition maps.
With dt=n u^(n−1)du prove Res_u(f dt)=n Res_t(f dt), where Res_t on Puiseux
means rational-exponent coefficient −1. Prove its residue-zero primitive
criterion and coordinate/substitution comparisons.

## L5. Newton polygons and formal Newton–Puiseux

For polynomials over F construct coefficient Newton polygons, faces/slopes and
initial polynomials. Supply translation, scaling, the Minkowski-sum formula for
Newton polygons of nonzero products (equivalently union of slope multisets), coefficient
valuation bounds and ramified-substitution APIs. Consume the existing
`IsAdicComplete.henselianRing`/simple-root Hensel theorem for K[[t]], proving
the reduction hypotheses needed. Consume the existing instance
`IsAdicComplete (Ideal.span {PowerSeries.X}) (PowerSeries K)` and compare that
ideal to the maximal ideal. Build the monic
coprime-factor lifting theorem as an explicit target: from a factorization
of the reduction into coprime monic factors, lift uniquely to monic factors
of the same degrees. Give the recursive coefficient correction by Bézout and
polynomial division, prove coefficientwise compatibility and completeness,
and compare its degree-one specialization to the existing simple-root theorem.

For algebraically closed K of characteristic zero prove every nonconstant
polynomial over F has a root at a finite L4 level. Normalize to monic and clear
poles by scaling the unknown. At a monic polynomial of degree m, remove its
degree-(m−1) coefficient by a Tschirnhaus shift. Write the translated
polynomial as P=Y^m+Σ_(i=2)^m a_i Y^(m−i). If every a_i=0, the root is
zero; otherwise choose the minimum ord(a_i)/i over its nonzero coefficients a_i,
ramify t=s^q to clear that slope's denominator, rescale Y=s^p Z and divide
by s^(pm). Prove the transformed polynomial is monic over K[[s]], still has
zero degree-(m−1) coefficient, and its reduction has a nonzero lower term.
Its reduction therefore cannot be (Z−a)^m: for a≠0 the coefficient −ma
is nonzero in characteristic zero, and for a=0 it has no lower term. Choose
a nonzero root and split off its multiplicity-r factor, with 0<r<m and
coprime complement. Apply the specified factor-Hensel target to obtain a
monic degree-r factor and recurse. Termination is strict degree descent.
Track all substitution/inverse transformations and finite ramification levels;
the final degree-one factor gives a root in one complete level. Include
polynomials with repeated roots and negative slopes after Laurent normalization. The
coprime-factor lifting theorem and polynomial transformations are built before
this degree induction.

For a polynomial over Puiseux, first lift its finite coefficient family to one
common level from L4, reinterpret that level as K((u)), apply the root theorem
there, and compare the resulting level-nm embedding to the original Hahn
carrier. Deduce splitting, algebraic closedness and identification of the
Puiseux field as an algebraic closure of F using L4's finite-degree algebraicity.
Include polynomials with repeated roots and nonmonic polynomials. Examples must compute X^n−t,
fractional leading orders and distinct branches with a common initial term.
The sharp minimal-level bound and the resulting degree-factorial bound are L6
targets following the finite-extension classification.

## L6. Finite extensions, trace and compatible roots

Assume K algebraically closed of characteristic zero. Use L4's degree-n root
adjunction and Mathlib's `autEquivRootsOfUnity`, `autEquivZmod` and
`isGalois_of_isSplittingField_X_pow_sub_C` after identifying level n as the
splitting field of X^n−t. Prove the Kummer action u↦ζu, restriction formulas
and fixed fields on the actual Hahn-level carrier, consuming generic Kummer
and Galois correspondence rather than rebuilding them.

Every finite extension embeds in a level by L5 and finite generation. Prove
it is isomorphic over F to K((t^(1/e))) by cyclic Galois correspondence. These
are chosen AlgEquiv maps between field constructions. Compute the residue
field K, ramification index e, integer ring and valuation comparisons directly
from their exponent decomposition; no finite-residue hypothesis is used.
For a root α of a degree-d polynomial its minimal level equals [F(α):F]≤d,
so α lies at a level dividing d!, and all roots can be placed at level d!.

Construct trace on differentials via Ω¹_cont(L/K)=L⊗_F Ω¹_cont(F/K), prove
this equivalence for the finite separable level map, and prove
Res_F(Tr_(L/F) ω)=Res_L(ω). Verify the formula on u-monomials and extend by
continuity. Prove that the finite-extension residue is independent of the chosen
F-algebra equivalence with K((u)): compare its parameter-root images, then use
L3 coordinate invariance. State the corollaries
Res_F(Tr_(L_e/F)ω)=e Res_t^ℚ(ω) and Res_(u_m)=(m/n)Res_(u_n) under n|m,
while Res_t^ℚ is compatible with the Hahn transition inclusions. Distinguish the coefficient-−1 Res_t on rational exponents from
Res_u: the latter includes the factor e when a form is expressed with dt.

Construct primitive roots ζ_n∈K for every n>0, compatible by
ζ_m^(m/n)=ζ_n when n|m, and prove existence. For K=ℂ use exp(2πi/n).
Use a fresh type synonym for each finite group μ_n(K) and give it the
discrete topology, independently of any topology on K or its units. Construct
the inverse limit in `ProfiniteGrp` of these finite discrete groups, with
transition ζ↦ζ^(m/n), as their compatible-family closed subgroup of the
product. Prove its profinite structure, and construct the induced compatible
coefficientwise action on every Puiseux level, faithfulness and fixed fields.

## L7. Absolute Galois topology and parameter independence

Use Mathlib's Krull-topology carriers and
`InfiniteGalois.continuousMulEquivToLimit` on the L5 algebraic closure.
Prove the ramified levels are cofinal among finite Galois intermediate fields,
and give the cofinal-limit comparison to L6's μ_n limit. Consume Mathlib's
compactness/Hausdorff and inverse-limit theorems. Identify finite-level
stabilizers and transport to Mathlib's chosen `AlgebraicClosure F` through a
chosen F-algebra equivalence. Prove that the induced Galois-group comparison
and normalized generator are independent of this choice: two choices differ
by a Galois automorphism, and conjugation is trivial by L6's abelian group.

The compatible roots define the automorphism σ_ζ by u_n↦ζ_n u_n. Use
`TauCeti.zHat.lift σ_ζ` into the profinite Galois group. Consume
`zHat.lift_surjective` and `lift_injective_of_finite_quotients`, proving their
generator/detection hypotheses using the finite-level coordinates and obtain inverse continuity by compact-to-T2.
Thus Gal(F)≃ₜ*TauCeti.zHat with the generator sent to σ_ζ. Changing the
primitive-root system changes this coordinate by a unit of the profinite
integer ring; consume `TauCeti.zHat.existsUnique_forall_toZMod_eq`,
`TauCeti.zpowHat_eq_pow_val_toZMod` and `TauCeti.zHat.unitsLift` for the
compatible finite-level coordinates, exponent action and unit comparison.
Prove the action and inverse formulas.

Prove every unit in K[[t]] has an n-th root there, for n>0, using its constant
root and simple-root Hensel. Consequently the character
θ_n(g)=g(π^(1/n))/π^(1/n) is independent of the chosen uniformizer π and
of its chosen n-th root. Prove compatibility in n. A K-linear formal parameter
automorphism lifts to the algebraic closure; any two lifts induce the same
conjugation on the abelian Galois group, and this conjugation is identity by
the θ_n comparisons. The whole absolute Galois group is inertia here. Only
the identification with the specified generator of zHat uses ζ.

## Order and boundaries

L1→L2→L3 is independent of Newton–Puiseux. L4's embeddings and basis depend
on L1; its differential refinement uses L2–L3 and characteristic zero.
L5→L6→L7 follows that finite-level foundation. Every new object has
extensionality, composition, transport and its coefficient/topology formulas
before use downstream.

Positive-characteristic algebraic-closure descriptions, mixed-characteristic
local fields, analytic branch convergence, Stokes data, formal connections,
opers, affine central extensions and categorical Langlands statements are
outside this roadmap's scope. Tau Ceti's analytic Puiseux results concern analytic branch convergence and
have their own analytic hypotheses.

## References

- [Frenkel, *Langlands Correspondence for Loop Groups*](https://math.berkeley.edu/~frenkel/loop.pdf),
  §1.2, for the formal Laurent/Puiseux and local-parameter setting.
- [Mannaa–Coquand, *Dynamic Newton–Puiseux Theorem*](https://arxiv.org/abs/1304.6770),
  §1, for the centered-polynomial, ramification and factor-Hensel proof route.
- [Mathlib Kummer theory](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/FieldTheory/KummerExtension.lean)
  and [profinite Galois comparison](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/FieldTheory/Galois/Profinite.lean).
- [Formal versus convergent Puiseux discussion](https://leanprover.zulipchat.com/#narrow/channel/287929-mathlib4/topic/Remaining.20100.20theorems/near/484400866)
  for the distinction from analytic branch convergence.
