# Roadmap: quantum groups: compact reconstruction and generic rank-one representations

**Summary.** Build compact quantum groups from their C*-algebras and from their unitary
representation categories. Develop Haar integration, arbitrary-Hilbert-space
corepresentations, the dense Hopf *-algebra, weighted Peter–Weyl theory and
universal/reduced completions before reconstruction. Work out the deformation
SUq(2) and free orthogonal quantum groups, including their tensor categories,
dimensions, Haar laws and the full/reduced distinction.
Develop the generic quantized enveloping algebra U_q(sl₂), its signed
simple modules, complete reducibility, locally finite and type-1 module
categories, and their precise comparison with the compact SUq(2) example.

## Scope and ownership

This roadmap owns the compact quantum-group construction, reconstruction and
examples in Layers 1–7, the classical locally compact function-algebra diagrams
in §1.1, and generic complex rank-one representation theory in Layer 8.
CStarAlgebras C1.CommutativeMultiplierMorphisms owns continuous pullbacks,
compact-cutoff nondegeneracy, properness and strict composition; §1.1 specializes
those results to group maps. CStarAlgebras C5 owns completed minimal tensors;
§1.1 adds the locally compact identification `C₀(X,C₀(Y))≅C₀(X×Y)`, which
C5.2 states only for compact spaces.
VonNeumannAlgebras owns operator topologies, the bicommutant and Kaplansky
theorems, state spaces and GNS, finite-dimensional algebras, preduals and
normal functionals, Tomita–Takesaki theory, the KMS condition and full left
Hilbert algebras with their canonical weights; HilbertModules owns Hilbert
C*-modules, adjointable and compact module operators, the free module H⊗A
and interior tensor products. None of that is restated here.
Layer 0 is independent of quantum-group reconstruction and is the single home
of the following objects. Section 0.1 owns C*-categories with their finite
linking algebras, orthogonal sums, projection splittings and additive dagger
Karoubi completion with its universal property; the finite-Hilbert category
Hilb_f and the Hilbert-module C*-category; C*-tensor categories with solutions
of the conjugate equations, standard solutions with their uniqueness up to
unitary transport, and intrinsic dimension as the minimal norm product; the
unitary dual functor of standard solutions with its pivotal and spherical
structure; signed self-dualities; and unitary fiber functors. Section 0.2 owns
the comparison functor Φ_R of a signed cup; the sign map
s:TL_n(k,−δ)→TL_n(k,δ), for every commutative ring k and every δ∈k, with its
strand, involution and Markov-trace compatibilities; and, at every complex
loop parameter, the identification of the trace radical of Subfactors 3.2's
closure trace with the degree-n part of TemperleyLieb Layer 6's negligible
ideal, carried by s from −δ to δ.
CategoricalOperatorAlgebras CA1a–CA2a and TemperleyLiebOperatorAlgebras 1.3
and 2.1 come later in the build and consume these objects from §§0.1–0.2
rather than construct them a second time. Left to those roadmaps, with nothing
imported from them here: W*-categories, C*-bicategories and the classification
of unitary dual functors on multitensor categories by positive characters of
the universal grading groupoid (CategoricalOperatorAlgebras); the structure of
the trace radical at δ=2cos(π/m), the positivity classification at negative
loop parameters and the unitary Temperley–Lieb category
(TemperleyLiebOperatorAlgebras 1.3, 2.1 and Layer 3).
TemperleyLieb Layers 0–7 supplies the algebraic diagrams, trace, negligible
ideal, Jones–Wenzl objects, algebraic envelopes and fusion rules; Subfactors
3.1–3.3 supplies their analytic adjoint, positivity, path models and positive
quotients. Section 0.2 compares them with the intertwiners of a self-dual
object, and Layer 7 applies the comparison to quantum-group intertwiners.
OperatorTheory/SelfAdjointSpectralTheory Part B owns the spectral
projections used by §2.2. The algebraic coaction and matrix-coefficient infrastructure is supplied by Tau
Ceti; Mathlib supplies algebraic tensors, quotient algebras and module theory.
Layer 8 is implemented in Tau Ceti: the algebra `TauCeti.UqSl2` with its PBW
basis, domain property, Hopf structure, Casimir and polynomial center, the
signed ladder modules `TauCeti.UqSl2.LadderModule` with their classification,
finite complete reducibility, the semisimplicity and ladder decomposition of
locally finite modules, the Clebsch–Gordan and recoupling isomorphisms, the
compact real form with its invariant metric, quantum traces, contragredients,
formal characters and the classical specialization live under
`TauCeti/QuantumGroups/UqSl2/`, the quantum integers under
`TauCeti/QuantumGroups/QuantumInteger/`, the σ-derivation Ore extension under
`TauCeti/Algebra/OreExtension/` and the finite Hopf-module category with its
monoidal, rigid and double-dual trivialization structure under
`TauCeti/Algebra/Category/FiniteHopfModuleCat/`. Layer 8's prose is the
specification those files implement and names their declarations. The
local-finiteness characterization of §8.4 is
`TauCeti.UqSl2.isSignedTypeOne_and_forall_exists_pow_smul_eq_zero_iff_isLocallyFiniteModule`;
the Hom and endomorphism formulas for
finite-dimensional modules in §8.3; the shrink compatibilities, the
group-algebra comparison with `FDRep`, the naturality, dual compatibility and
Biedenharn–Elliott pentagon of the Clebsch–Gordan maps, the bundled pivotal
structure and the representation ring of §8.5; the compact comparison of §8.6;
and the comparison with RepresentationTheory/LieHighestWeight in §8.7 remain
targets.

Apart from §1.1's classical locally compact example, Layers 1–7 concern compact
symmetry. General locally compact quantum groups, their unbounded Haar weights and
general multiplicative-unitary reconstruction are outside the scope. VonNeumannAlgebras
Layer 11's Hilbert-algebra/weight correspondence supplies the compact Haar comparison. Layer 4
constructs the particular compact regular multiplicative unitary. Quantum-group
actions and crossed products are outside the scope. Layer 8 is algebraic and
has no C*-completion hypothesis in its classification.

## Conventions

Algebras and Hilbert spaces are complex. Compact quantum groups have a nonzero
unital C*-algebra A and a unital star homomorphism
`Δ:A→A⊗_min A`. Neither A nor the representation Hilbert space is assumed
separable. Finite-dimensional coefficient matrices use orthonormal bases and
column vectors: `δ(e_j)=Σ_i e_i⊗u_ij` and
`Δ(u_ij)=Σ_k u_ik⊗u_kj`. Matrix star is conjugate transpose;
`bar u=(u_ij*)` is entrywise star, and is a different operation.
Pin tensor corepresentations to `U_13 V_23`, with entries
`(u⊠v)_((i,k),(j,l))=u_ij v_kl`, as in Tau Ceti's native
`Comodule.TensorProduct`; thus `χ_(u⊠v)=χ_u χ_v`.
Algebraic tensors use Mathlib `TensorProduct` over ℂ; analytic tensors use the
minimal C*-tensor product. Insert associators and unit identifications in leg
notation. Scalar products are conjugate-linear in the first variable.

A morphism `(A,Δ_A)→(B,Δ_B)` is a unital star homomorphism f with
`Δ_B f=(f⊗f)Δ_A`. This is the direction of the function-algebra map; the
corresponding compact-group arrow has the reverse direction. Fiber functors
are faithful complex-linear dagger strong monoidal functors to finite Hilbert
spaces, with unitary tensor and unit constraints. Quantum dimension means the
intrinsic C*-tensor-category dimension, and Hilbert dimension means the rank of
the underlying vector space. These can differ.

## Exact supplier contracts

| Supplier | Interface consumed here |
| --- | --- |
| [CStarAlgebras C1–C5,C8](../CStarAlgebras/README.md) | C1.CommutativeMultiplierMorphisms: continuous pullbacks, nondegeneracy, properness and strict composition; C2 state extension, C3 matrix norms, C4 CP positivity and multiplicative domains, C5 minimal tensors and slice maps; C8's Toeplitz extension for Q7. Q5 owns the bounded universal presentations used here. |
| [VonNeumannAlgebras Layers 0,1,3,4,10,11](../VonNeumannAlgebras/README.md) | Layer 0 state space and Hilbert GNS; Layer 1 operator topologies, the bicommutant theorem and Kaplansky density; Layer 3 finite-dimensional algebras with their commutants and multiplicities; V4.Core, V4.PositivePredual and V4.Normality for the trace-class predual, normal functionals and vector states; V10.ModularTheory and V10.KMS for the modular group and KMS uniqueness of a faithful normal state; Layer 11 for full left Hilbert algebras, their full closure, Tomita's theorem and the canonical weight. Section 3.4 identifies the Haar Tomita algebra with these constructions. |
| [HilbertModules H1–H3](../HilbertModules/README.md) | H1 completions, Hilbert direct sums and the free module H⊗A; H2 adjointable and compact module operators, `L_A(E)≅M(K_A(E))` with the strict topology on bounded sets, `K_A(H⊗A)≅K(H)⊗min A` and `L_A(H⊗A)≅M(K(H)⊗min A)`; H3 interior tensor products with associators and unitors. Layer 2 builds coactions on these carriers. |
| [TemperleyLieb Layers 0–7](../TemperleyLieb/README.md) | Algebraic diagrams and reflections, the linear universal property `TLCat.lift` of Layer 2, the comparison `presentedTLEquiv` of Tau Ceti's presented algebra with the diagram algebra, the closure trace tr̂ with its uniqueness and its comparison with Tau Ceti's `markovTrace` (Layer 4), Jones–Wenzl objects and the negligible ideal (Layer 6), and the Karoubi envelope with its simple objects, Clebsch–Gordan rule and root-of-unity quotient (Layer 7). |
| [Subfactors 3.1–3.3](../Subfactors/README.md) | Analytic adjoint on TL_n, closure trace, trace radical, Jones's positivity theorem `markovTrace_nonneg_iff` with `jonesLoopParameters` and its pullback criterion, positive path models, the quotients Q_n and their finite C*-norms. |
| [OperatorTheory/SelfAdjointSpectralTheory Part B](../OperatorTheory/SelfAdjointSpectralTheory/README.md) | Spectral projections of the averaged compact self-adjoint operators of §2.2. |
| [RepresentationTheory/CompactGroups](../RepresentationTheory/CompactGroups/README.md) | Classical Peter–Weyl, compact Haar integration and the SU(2) representation calculation used for comparisons. |
| [RepresentationTheory/LieHighestWeight, sl₂ worked example](../RepresentationTheory/LieHighestWeight/README.md) | The classical highest-weight m module and native `sl (Fin 2) ℂ`/`IsSl2Triple` action conventions for Q8.7's matrix specialization. |
| [OperatorAlgebraDynamics D1–D2](../OperatorAlgebraDynamics/README.md) | Full/reduced discrete-group C*-algebras, canonical quotient/expectation and the invariant-mean/Reiter P₁/P₂ comparison. |
| [FreeProbability F1,F3,F6](../FreeProbability/README.md) | Scalar moments, the free-group adjacency norm/full–reduced counterexample and the standard semicircular law; Q7 supplies the quantum-group character realization. |
| [AmenableGroups, Layers 1,5,7](../AmenableGroups/README.md) | Layer 1 invariant means, Layer 5 discrete Følner criterion, Layer 7 locally compact amenability; Q4 constructs the reduced-counit comparison using D2's Reiter comparison. |
| [PivotalSpherical Layers 0–2 and 7](../PivotalSpherical/README.md) | Layers 0–2 specify the double right dual, pivotal structures, left and right traces and sphericity; Tau Ceti implements them as `TauCeti.doubleRightDualFunctor`, `TauCeti.PivotalCategory`, `TauCeti.leftTrace`, `TauCeti.rightTrace` and `TauCeti.SphericalCategory`, and §§0.1, 3.3 and 8.5 consume these native declarations; §3.3 compares its pivot with §0.1’s unitary duality. Layer7’s FDRep is the group-algebra comparison target for Q8.5. |

**From Mathlib.** Use `PositiveLinearMap.GNS` and
`PositiveLinearMap.gnsStarAlgHom` from
`Analysis/CStarAlgebra/GelfandNaimarkSegal.lean` for the Haar GNS
representation of §1.2. From `Analysis/InnerProductSpace/Spectrum.lean` use
`ContinuousLinearMap.orthogonalComplement_iSup_eigenspaces_eq_bot` and
`ContinuousLinearMap.finite_dimensional_eigenspace` for the averaged compact
operators of §2.2; the latter excludes the zero eigenvalue. `VonNeumannAlgebra`
in `Analysis/VonNeumannAlgebra/Basic.lean` is a star subalgebra equal to its
double commutant; VonNeumannAlgebras Layer 1 proves the bicommutant theorem on
this carrier. Use native `Coalgebra`, `Bialgebra`, `HopfAlgebra`,
`Coalgebra.counit` and `HopfAlgebra.antipode`.

**From Tau Ceti.** `Algebra.Coalgebra.Comodule` provides
comodules, comodule homomorphisms, categories, corestriction, duals and finite
matrix coefficients. Consume its `Subcomodule`, `IsCompletelyReducible`,
`fixedSubcomodule`, `Finite/Monoidal`, `Finite/RightRigid` and
`Comodule.convolutionAction` interfaces for subobjects, duality and convolution.
`Finite/RightRigid` supplies antipode-twisted right duals for arbitrary
Hopf algebras. `Finite/Rigid` uses commutativity and supplies both duals
for the classical function-algebra case. For noncommutative Pol(G),
construct left duals using its bijective antipode and S⁻¹, and compare
them with §0.1's standard conjugates and pivotal structure.
Use Mathlib `WithConv` for convolution notation.
In particular consume `coefficientMatrix`, its counit,
comultiplication and inverse-antipode equations, and `matrixComodule` with its
coefficient reconstruction. Add Hilbert/star/unitary structure to these APIs;
do not replace the algebraic coaction with a private matrix-corepresentation
carrier. The analytic free-module coaction is compared with that algebraic API
on the coefficient core.
`TauCeti.StarCoalgebra` (`Algebra/Coalgebra/Star.lean`) records star
preservation of Δ, with `TauCeti.StarCoalgebra.counit_star`; on it
`Algebra/HopfAlgebra/Star.lean` proves `TauCeti.HopfAlgebra.antipode_bijective`
and `antipode_star_antipode_star`, and `Algebra/HopfAlgebra/Cancellation.lean`
constructs `TauCeti.HopfAlgebra.comulMulRightEquiv` and `leftMulComulEquiv`
with their span statements; §§3.1 and 4.1 consume these. For the pivots of
§§0.1, 3.3 and 8.5 use `TauCeti.doubleRightDualFunctor`
(`CategoryTheory/Monoidal/Rigid/DualFunctor.lean`), the class
`TauCeti.PivotalCategory`, a monoidal natural isomorphism from the identity to
that functor (`CategoryTheory/Monoidal/Pivotal/Basic.lean`), its traces
`TauCeti.leftTrace` and `TauCeti.rightTrace` (`Pivotal/Trace.lean`) and
`TauCeti.SphericalCategory` (`Pivotal/Spherical.lean`). Layer 8 consumes
`TauCeti.UqSl2` with its generators, `TauCeti.UqSl2.LadderModule`,
`TauCeti.quantumInteger` with `IsGenericQuantumParameter`,
`TauCeti.IsLocallyFiniteModule`, `TauCeti.FiniteHopfModuleCat`, and
`TauCeti.OreExtension` with `TauCeti.SigmaDerivation` and
`skewPolynomialEquiv` for §8.1's δ=0 comparison. Section 0.2's sign map
consumes the presented algebra `TauCeti.TemperleyLieb` with
`TauCeti.TemperleyLieb.lift`, `TauCeti.TemperleyLieb.hom_ext` and
`TauCeti.TemperleyLieb.strandIncl` (`Algebra/TemperleyLieb/Basic.lean`), and
the Markov-trace predicate `TauCeti.TemperleyLieb.IsMarkovTrace` with its
uniqueness `TauCeti.TemperleyLieb.IsMarkovTrace.unique`, which holds over every
commutative semiring and at every loop parameter
(`Algebra/TemperleyLieb/Trace.lean`).

## How to read the build

Layer 0 constructs the shared categorical prerequisites.
Layers 1–4 construct Haar theory, representations, the Hopf core and its
completions. Layers 5–7 build the universal examples, reconstruct compact
quantum groups from fiber data and identify their representations. Layer 8
builds the algebraic rank-one theory independently through §8.5, then compares
it with the compact examples in §8.6 and with classical Lie modules in §8.7.
The labels Q1–Q8 refer to these same layers, and item k of Q8 is §8.k for
k=1,…,7: Q8 item 1 is §8.1, the presentation, PBW basis and Hopf structure of
U_q(sl₂), and Q8 item 5 is §8.5, the finite Hopf-module category
`TauCeti.FiniteHopfModuleCat` with its monoidal structure and duals. Local
*Needs:* lines distinguish the statement's carriers from inputs used by the
specified proof route.

## Layer 0: Categorical foundations

### 0.1 C*-categories, standard conjugates and fiber functors

Add a conjugate-linear involutive dagger to a native complex-linear category
with Banach Hom spaces, contractive composition, ‖f†f‖=‖f‖² and positivity of
f†f in End(X). Develop finite linking algebras, orthogonal sums and projection
splittings; construct the additive and dagger Karoubi completion and its
universal property for linear dagger functors. Prove automatic contractivity
of those functors and isometry when faithful. Construct the finite Hilbert
category Hilb_f and the Hilbert-module category with their operator norms
(Longo–Roberts §2, pp.4–5, and Appendix, pp.48–49).

For a C*-tensor category require dagger-compatible tensor products and unitary
associators and unitors. Use native rigid pairings for conjugates. In a rigid
category with simple unit, finite sums and subobjects, define standard
conjugate solutions by equality of the left and right induced traces on
End(X). Construct them, prove uniqueness up to unitary transport and prove
that their common dimension d(X) is the minimum of ‖R‖‖R̄‖ over all solutions
(R,R̄) of the conjugate equations for X; this norm product is unchanged by the
rescaling (λR,λ̄⁻¹R̄), λ≠0, so a solution attaining the minimum need not be
standard. Prove additivity, multiplicativity, and compatibility with subobjects
and unitary tensor equivalences (Longo–Roberts §3, especially Lemma 3.3,
Theorems 3.8 and 3.11; Neshveyev–Tuset §2.2, pp.29–36). Transport these
solutions to a dagger-compatible dual functor with unitary tensorator and the
pivotal and spherical structures of PivotalSpherical Layers 1–2, which are the
native `TauCeti.PivotalCategory` and `TauCeti.SphericalCategory`. For a unitary
self-duality r:X→X∨ keep the signed condition `bar(r) r=ε φ_X`, ε=±1, where
bar(f)=(f†)∨ and φ is the pivotal comparison; equivalently X has a cup
R:1→X⊗X with (R*⊗1)(1⊗R)=ε1_X. Prove invariance of the sign on a simple
self-dual object. Neshveyev–Tuset §2.5, p.52, normalise a self-conjugate
object by R̄=−(sign)R, so their sign parameter is −ε.

Let τ be a unitary fiber functor in the sense of the Conventions, a faithful
dagger tensor functor into Hilb_f. Prove that τ is isometric on Hom spaces by
the automatic isometry above, carries solutions of the conjugate equations for
X to solutions for τ(X), carries a cup R of zigzag sign ε to a cup of the same
sign, and that the Hilbert dimension of τ(X) is at most d(X). A faithful
Hilbert fiber functor need not carry standard solutions to standard solutions.

The analytic-category and duality interfaces have the following API.

- Dagger functors preserve unitary arrows, sums and projection splittings through their universal properties; faithful functors preserve Hom norms.
- Standard solutions give positive dimensions, coherent duals and equal left/right categorical traces on endomorphisms, and minimize the norm product among all conjugate solutions; solutions attaining the minimum, such as rescaled standard ones, need not be standard.
- Signed self-dualities transport along unitaries; negative sign is distinct from a positive loop value, and neither evaluation nor coevaluation is generally unitary.
- Unitary fiber functors are isometric, preserve conjugate solutions and zigzag signs, and bound Hilbert dimension by intrinsic dimension without preserving standardness.

**Checks.**

- For T=diag(2,1) in finite Hilbert spaces, ‖T†T‖=4=‖T‖². Using Hilbert–Schmidt norms instead gives √17≠5.
- The idempotent [[1,1],[0,0]] has norm √2 and is not self-adjoint; its range projection is diag(1,0). Only the latter splits by an isometry and its adjoint. End(0) has identity of norm 0.
- In Hilb_f, the standard cup for ℂ² has squared norm 2 and both zigzags are identities. Rescaling its two conjugate cups by 2 and 1/2 keeps the zigzags and the norm product 2 but gives squared norms 8 and 1/2, so the pair is not standard.
- In Hilb_f, R=2e₀⊗e₀+e₁⊗e₁ and R̄=(1/2)e₀⊗e₀+e₁⊗e₁ solve the conjugate equations with norm product √5·√(5/4)=5/2>2=d(ℂ²); no rescaling makes this pair minimal.
- At q=1/2, the fundamental quantum-group object has intrinsic dimension 5/2 and Hilbert dimension 2. Its forgotten conjugate solution has norm product 5/2>2; assuming a faithful fiber functor preserves standardness would give a false equality.
- On ℂ², J(z₁,z₂)=(−conj z₂,conj z₁) satisfies J²=−I; ordinary conjugation squares to I. Both are antiunitary, so antiunitarity alone does not choose the sign.
- The forgetful functor of SU(2) sends the invariant cup e₀⊗e₁−e₁⊗e₀, of zigzag sign −1, to a cup of sign −1 on ℂ². The symmetric cup e₀⊗e₀+e₁⊗e₁ of Hilb_f has sign +1 and is not SU(2)-invariant, so it cannot replace the image.

*Needs:* HilbertModules H2 for the module-category example; Mathlib `CategoryTheory.Category`, `CategoryTheory.Linear`, `CategoryTheory.MonoidalCategory`, `CategoryTheory.Idempotents.Karoubi` and native rigid pairings; PivotalSpherical Layers 0–2,7. Longo–Roberts §§2–3 and Appendix; Neshveyev–Tuset §2.2; signed equations also follow by transporting the two conjugate equations, and sign preservation by applying τ to the zigzag equation.

### 0.2 Temperley–Lieb comparison for self-dual objects

The analytic adjoint, the closure trace T_n, the trace radical, Jones's
positivity theorem and the positive quotients Q_n=TL_n/R_n with their finite
C*-norms are Subfactors 3.1–3.3; the Jones–Wenzl projections, the negligible
ideal and the Karoubi envelope with its simple objects and fusion rules are
TemperleyLieb Layers 6–7. This section adds only the comparison of these
objects with the intertwiners of a self-dual object, which §7.2 applies to
O_F^+.

Let C be a rigid C*-tensor category with simple unit, finite sums and
subobjects (§0.1), and X a nonzero object with a cup R:1→X⊗X satisfying
(R*⊗1)(1⊗R)=ε1_X for a sign ε=±1, as for §0.1's signed self-dualities; put
d=R*R=‖R‖². TemperleyLieb Layer 2's `TLCat.lift`, applied to coevaluation R
and evaluation εR*, whose loop value is εd, gives a ℂ-linear monoidal functor
Φ_R:TL(ℂ,εd)→C with Φ_R(n)≅X^⊗n. Prove that Φ_R carries Subfactors 3.1's
adjoint on each TL_n to the dagger of End(X^⊗n), whereas Φ_R(cup)†=εΦ_R(cap).
Closing x∈TL_n with the nested cups R_n of X^⊗n gives
R_n*(Φ_R(x)⊗1)R_n=ε^n T_n(x), so ε^n T_n(x†x)=‖(Φ_R(x)⊗1)R_n‖²≥0, with
equality only when Φ_R(x)=0.

For every commutative ring k, every δ∈k and every n, define the sign map
s:`TauCeti.TemperleyLieb k (−δ) n`→`TauCeti.TemperleyLieb k δ n` by
s(e_i)=−e_i through `TauCeti.TemperleyLieb.lift`. It respects the three
defining relations. For e_i²=(−δ)e_i in the source,
s(e_i)²=e_i²=δ·e_i=(−δ)·s(e_i). In e_ie_j=e_je_i (|i−j|≥2) both sides have
degree 2, and in e_ie_(i±1)e_i=e_i they have degrees 3 and 1; in each case the
two degrees have the same parity, so s multiplies both sides by the same sign.
The same construction at −δ inverts s by `TauCeti.TemperleyLieb.hom_ext`, so s
is a k-algebra isomorphism. It commutes with `TauCeti.TemperleyLieb.strandIncl`
and with every product-reversing involution that fixes the generators on both
sides: TemperleyLieb Layer 4's k-linear reflection, transported by
`presentedTLEquiv`, and, over ℂ at real δ, Subfactors 3.1's conjugate-linear
adjoint. For Markov families tr at δ and tr' at −δ in the sense of
`TauCeti.TemperleyLieb.IsMarkovTrace`, prove tr_n(s x)=(−1)^n tr'_n(x) for x
in TL_n(k,−δ): the family y↦(−1)^n tr'_n(s⁻¹y) on TL_n(k,δ) takes the value
(−1)^n(−δ)^n=δ^n at 1, is tracial, gains the factor (−1)(−δ)=δ under strand
inclusion and keeps the Markov property because s⁻¹ sends strandIncl(y)·e_last
to −strandIncl(s⁻¹y)·e_last, so it is tr by
`TauCeti.TemperleyLieb.IsMarkovTrace.unique`. Diagrammatically, a word of
length ℓ in the generators whose closure has c loops satisfies ℓ+c≡n (mod 2),
since each generator joins or splits one closed loop. For the closure traces,
TemperleyLieb Layer 4's tr̂ and, over ℂ, Subfactors 3.2's T_n, this gives
T_n^(δ)(s x)=(−1)^n T_n^(−δ)(x), and for invertible δ the map s preserves the
normalized traces δ^(−n)T_n. Over ℂ, at every δ, s therefore carries the trace
radical {x : T_n(xy)=0 for all y} of TL_n(ℂ,−δ) onto that of TL_n(ℂ,δ). At
every δ∈ℂ this radical, which for real δ is Subfactors 3.2's R_n, is the
degree-n part of TemperleyLieb Layer 6's negligible ideal: `presentedTLEquiv`
carries it onto the negligible endomorphisms f of n, those with tr̂(f∘g)=0 for
every g:n→n, because TemperleyLieb Layer 4's uniqueness of the Markov trace
identifies T_n with tr̂ through `presentedTLEquiv`.

Return to the cup. The positive form ε^n T_n(x†x) on TL_n(εd) is, for either
sign, the pullback of Subfactors 3.2's form T_n(y†y) on TL_n(d), through the
identity or through s. Deduce that d lies in `jonesLoopParameters` by
Subfactors 3.2's pullback criterion, that the kernel of Φ_R on TL_n(εd) is the
trace radical, carried through s when ε=−1, and that Φ_R induces injective
*-homomorphisms Q_n→End(X^⊗n), compatible with strand inclusions and
precomposed with s⁻¹ when ε=−1. Both presentations send the normalized
projection p_i=e_i/(εd) to 1^⊗(i−1)⊗RR*/d⊗1^⊗(n−i−1); the signed generator is
εd·p_i and the positive one d·p_i (Neshveyev–Tuset §2.5, pp.52–54, for the
signed cup–cap projections).

If Φ_R is full, prove for either sign that X is simple, R is standard with
d(X)=d, and the ranges of the projections Φ_R(f_r), for the Jones–Wenzl
projections f_r outside the trace radical, are pairwise inequivalent simple
objects exhausting the simple subobjects of the tensor powers of X, with
intrinsic dimensions [r+1] at loop parameter d and the fusion rules of
TemperleyLieb Layer 7's envelope: the Clebsch–Gordan rule for d≥2 and the
truncated rule of the root-of-unity quotient for d=2cos(π/m). For ε=−1
transport the block decompositions through s, which carries Jones–Wenzl
projections to Jones–Wenzl projections because it preserves idempotency, the
coefficient of the identity diagram and annihilation by every generator, and
through the isometries 1⊗R/√d:X^⊗r→X^⊗(r+2). The cup R and its sign remain
the conjugate data of X: s identifies algebras, adjoints and traces, not cups,
and for ε=−1 no monoidal functor from TL(ℂ,d) sends its cup to R.

The comparison interfaces have the following API.

- A cup of zigzag sign ε gives a monoidal functor from TL(ℂ,εd) that is a *-homomorphism on endomorphism algebras with the trace radical as kernel; d is a Jones loop parameter.
- Over every commutative ring and at every loop parameter δ, the sign map identifies the algebras at −δ and δ, commutes with strand inclusions and the generator-fixing involutions, multiplies Markov traces by (−1)^n and carries Jones–Wenzl projections to Jones–Wenzl projections; over ℂ it carries trace radicals onto trace radicals, each the degree-n part of the negligible ideal, while the cup stays signed.
- A full comparison carries the Jones–Wenzl ranges to all simple subobjects of the tensor powers, with dimensions [r+1] and the fusion rules of TemperleyLieb Layer 7.

**Checks.**

- In Hilb_f with X=ℂ and R=1, ε=1 and d=1. Then Φ_R(e)=1 and Φ_R(f₂)=Φ_R(1−e)=0: the kernel on TL₂ is the trace radical ℂf₂ and Q₂=ℂ. This Φ_R is not full, since TL has no morphism 1→0 while Hom(X,1)=ℂ; accordingly the ranges ℂ of f₀ and f₁ are isomorphic, and inequivalence needs fullness.
- In Hilb_f with X=ℂ² and R=e₀⊗e₁−e₁⊗e₀, ε=−1 and d=2, the loop value δ=−2 of SU(2) at q=1. Then Φ_R(e)=−RR* satisfies e²=−2e, while p=RR*/2 is the projection onto ℂR in both presentations. The evaluation R* instead of −R* has zigzag −1, so `TLCat.lift` does not apply to it.
- On one strand s is the identity and T_1^(d)(1)=d=−T_1^(−d)(1); on two strands T_2^(d)(s e)=−d=T_2^(−d)(e) and T_2^(d)(1)=d²=T_2^(−d)(1). Omitting the factor (−1)^n would give the wrong sign on one strand. At δ=−5/2, signed e=−(5/2)p and positive e=(5/2)p both give e²=δe in their own parameter and normalized trace 4/25 of p.
- Over 𝔽₂, or any coefficient ring with 2=0, −δ=δ and −e_i=e_i, so s is the identity of TL_n(𝔽₂,δ) and the factor (−1)^n is 1. Over ℤ at δ=1 the generator-fixing assignment e↦e is not an algebra map TL₂(ℤ,−1)→TL₂(ℤ,1): it would force e²=−e, hence 2e=0, while e acts on the two-strand representation as [[0,0],[1,1]] and 2e as [[0,0],[2,2]]≠0. At δ=0 the relation reads (−e_i)²=e_i²=0=0·(−e_i).
- At d=3/2 the quantum integers [2]=3/2, [3]=5/4, [4]=3/8 are positive and T₄(f₄)=[5]=−11/16<0. So no object of a C*-tensor category has a cup with ‖R‖²=3/2 and zigzag sign ±1; 3/2 lies between 2cos(π/4)=√2 and 2cos(π/5)=(1+√5)/2.
- In Rep(SU(2)) with the cup above, T_r(f_r) at δ=−2 is 1,−2,3 for r=0,1,2, while the ranges of Φ_R(f_r) have intrinsic dimensions 1,2,3=ε^r T_r(f_r). The signed closure traces are not dimensions.

*Needs:* §0.1; Tau Ceti `TauCeti.TemperleyLieb.lift`, `TauCeti.TemperleyLieb.hom_ext`, `TauCeti.TemperleyLieb.strandIncl` and `TauCeti.TemperleyLieb.IsMarkovTrace.unique` for the sign map; TemperleyLieb Layer 2 (`TLCat.lift`, `TLCat.lift_unique`), Layer 4 (`presentedTLEquiv`, the reflection, trace comparison), Layer 6 (Jones–Wenzl objects, negligible ideal) and Layer 7 (envelope, simple objects and fusion); Subfactors 3.1–3.3. Neshveyev–Tuset §2.5; the closure formula, the sign map and the fusion transfer are the displayed computations.

### Examples

The rescaled cup, the q=1/2 fundamental object and the d=1 Temperley–Lieb
kernel distinguish the dagger-category, fiber-functor and Temperley–Lieb
comparison interfaces.

### Dependencies

Section 0.1 uses native category theory, HilbertModules H2 and PivotalSpherical
Layers 0–2,7; §0.2 adds Tau Ceti's presented Temperley–Lieb algebra with its
Markov-trace uniqueness, TemperleyLieb Layers 2, 4, 6 and 7 and Subfactors
3.1–3.3. None consumes Layers 1–8 or quantum-group reconstruction.

## Layer 1: C*-bialgebras, cancellation and Haar integration

### 1.1 ClassicalMultipliers: the function algebra of a locally compact group
For a locally compact Hausdorff group G, without compactness or countability
assumptions, put `A=C₀(G,ℂ)`. CStarAlgebras C5.2 identifies `A⊗min A` with
`C₀(G,A)` and, for compact G only, with `C(G×G)`. Prove here the locally
compact identification `C₀(X,C₀(Y))≅C₀(X×Y)`, `F↦((x,y)↦F(x)(y))`, for
locally compact Hausdorff X and Y: the map is an isometric star homomorphism;
its image vanishes at infinity because, with K the compact set where
‖F(x)‖≥ε, finitely many values F(x_i) approximate F(K) within ε/2 and each
F(x_i) is below ε/2 outside a compact L_i, so |F(x)(y)|≥ε forces x∈K and
y∈⋃L_i; conversely a function H vanishing at infinity on X×Y has slices
H(x,·) in C₀(Y), the map x↦H(x,·) is sup-norm continuous by the tube lemma
over the compact projection to Y of the set where |H|≥ε/2, and it vanishes
at infinity because ‖H(x,·)‖≥ε forces x into the compact projection to X of
that set. Composing the two identifications gives the isometric star
isomorphism `A⊗min A≅C₀(G×G)`; use C1's native double-centralizer
identifications `M(C₀(X))≅C_b(X)`, with strict topology on bounded sets.
Construct the nondegenerate star homomorphism
`Δ:A→M(A⊗min A)`, `Δ(f)(g,h)=f(gh)`, from pullback by multiplication.
Specialize C1.CommutativeMultiplierMorphisms to multiplication to obtain
nondegeneracy, continuity and star preservation. Prove the group-specific
norm identity by evaluating at (g,1), and identify the multiplier action on C₀(G×G).
Construct `ε:A→ℂ`, `ε(f)=f(1)`, and the inclusion of constants
`η:ℂ→M(A)`. Inversion is a proper homeomorphism, so its pullback is the
isometric involutive star automorphism `S:A→A`, `S(f)(g)=f(g⁻¹)`;
also give its multiplier extension to C_b(G).

Specialize the same pullback theorem to multiplication on the first and last
two coordinates to obtain Δ⊗id and id⊗Δ as nondegenerate maps from A⊗min A into
M(A⊗min A⊗min A), with the native tensor associators. Extend them by C1's
unique strict multiplier-map extension and prove
`(Δ⊗id)̃∘Δ=(id⊗Δ)̃∘Δ`, by evaluation as
`f((gh)k)=f(g(hk))`. Specialize it to the two unit inclusions to obtain the nondegenerate slice maps
`id⊗ε, ε⊗id:A⊗min A→A`; their multiplier extensions are evaluation
at `(g,1)` and `(1,g)` on C_b(G×G). Prove both counit identities,
with the canonical A→M(A) inclusion on the right.

Make the inverse diagrams equally explicit. Specializing the proper-pullback theorem to the closed diagonal gives
the nondegenerate star homomorphism
`d:A⊗min A→A`, `d(a⊗b)=ab`; its multiplier extension is
`d̃(H)(g)=H(g,g)`. Compose it with the tensor inversion maps to obtain
`r₊(H)(g)=H(g,g⁻¹)` and `r₋(H)(g)=H(g⁻¹,g)` on C_b(G×G).
Prove `r₊∘Δ=η∘ε=r₋∘Δ` and all tensor/pullback comparison diagrams.
These compositions take values in M(A); the constant ε(f) need not lie
in A when G is noncompact. On elementary tensors the formulas are
`aS(b)` and `S(a)b`. Their extension here uses commutativity and the
specified diagonal pullback; it does not posit a continuous multiplication
star homomorphism from an arbitrary noncommutative C*-tensor product.
For compact G compare these maps with Q1's unital function-algebra
example. These identities follow by evaluation from associativity, the two
unit laws and the two inverse laws, using CStarAlgebras C1.CommutativeMultiplierMorphisms
for strict composition and C5.2 with the identification above for the tensor
identifications. The classical pair (C₀(G),Δ) is a bi-C*-algebra in the sense
of Kustermans–Vaes Definition 2.1, p.853; the multiplier diagrams are the
evaluation computations displayed here.

The defining objects have the following API.

- The coproduct is isometric and its strict extensions respect composition and both unit slices.
- Inversion is an involutive isometric star automorphism; the diagonal and two inverse restrictions have the stated elementary-tensor values.
- The identification `C₀(X,C₀(Y))≅C₀(X×Y)` is an isometric star isomorphism; for compact X and Y it is C5.2's.

**Checks.**

- For the trivial group and f=2+i, Δf=εf=Sf=2+i; both inverse composites are the scalar 2+i, whereas the zero map fails normalization.
- On ℤ×ℤ, 1[m=n=0]=1[0]⊗1[0] lies on both sides of the identification, with norm 1 on each. H=1[m+n=0] has slices H(m,·)=1[−m] of constant norm 1, so x↦H(x,·) does not vanish at infinity and H lies in neither C₀(ℤ,C₀(ℤ)) nor C₀(ℤ²), in agreement with the next Check.
- For G=ℤ and f=1[0], Δf(m,n)=1[m+n=0], with norm 1 and value 1 at every (N,−N); it is not in C₀(ℤ²). Both inverse composites are the constant 1, and both unit slices are f.
- For G=S₃, g=(12), h=(23), and f=1[(123)], Δf(g,h)=1 but Δf(h,g)=0. This distinguishes multiplication from opposite multiplication.
- For a=1[1], b=1[−1] on ℤ, diagonal restriction gives 0, r₊(a⊗b)=1[1] and r₋(a⊗b)=1[−1]; inversion sends 1[1] to 1[−1] and its square returns 1[1].

*Needs:* CStarAlgebras C1.CommutativeMultiplierMorphisms, C5.2; Mathlib continuous group operations and the tube lemma. Kustermans–Vaes Definition 2.1 for the bi-C*-algebra axioms; the identities are the displayed evaluations.

### 1.2 Cancellation and Haar states

Construct coassociative unital C*-bialgebras and their morphisms using the
native star homomorphisms and the C5 minimal tensor functor. Develop tensor
leg maps, their associativity/naturality, positive slice maps and compatibility
with Δ. A compact quantum group satisfies both cancellation conditions:

- The linear span of `Δ(A)(1⊗A)` is norm dense in A⊗_min A.
- The linear span of `Δ(A)(A⊗1)` is norm dense in A⊗_min A.

Develop equivalent cancellation-span formulations and transport by isomorphism,
opposite/co-opposite structures and tensor products. Cancellation is a density
condition on linear spans, not a pointwise surjectivity assertion. Give a
coassociative unital bialgebra failing cancellation, functions on
a finite monoid with an absorbing element that is not a group.

Define convolution of bounded functionals by `φ*ψ=(φ⊗ψ)Δ`. Prove boundedness,
associativity, positivity, preservation of states and separate weak-*
continuity. Define left invariance by `(id⊗h)Δ(a)=h(a)1` and right
invariance by `(h⊗id)Δ(a)=h(a)1`. Prove existence of a state h satisfying
both and uniqueness among even one-sided invariant states, without a
separability assumption. Build the proof's reusable pieces: Cesàro means of
convolution powers of a state, weak-* cluster points fixed by that state, and
the domination lemma saying `ω≤ρ` and `h*ρ=ρ*h=h` imply
`h*ω=ω*h=ω(1)h`. Prove the finite-intersection argument for all positive
functionals using both cancellation conditions. Supply the slice testing and
positive-functional separation that turn these equations into invariance.

Call h the Haar state. Specialize the native GNS Hilbert space and representation
to h, and develop their coefficient maps and null ideal. A compact quantum group is reduced when its
Haar state is faithful. Prove the tensor-product Haar formula and the
isomorphism transport law; do not assert Haar pullback along every morphism.
For C(G) recover ordinary compact-group Haar integration. Pin the
coefficient crosswalk to CompactGroups: its π_ij(g)=⟪π(g)e_j,e_i⟫
is conjugate to u_ij(g)=⟪e_i,π(g)e_j⟫ in this roadmap.
Transport coproduct, star and the defining SU(2) representation with
this conjugation explicitly. For a discrete
group Γ construct `Δ(u_g)=u_g⊗u_g` on its full group C*-algebra by
the universal unitary-representation property. On the reduced algebra
construct the Fell-absorption unitary
`W(δ_g⊗δ_h)=δ_g⊗δ_(gh)` and prove
`W(λ_s⊗1)W*=λ_s⊗λ_s`; this supplies the reduced-norm extension
of Δ. Prove coassociativity and both cancellation conditions using
the dense span of group unitaries. Identify both Haar states with
coefficient at the identity. Q4 proves the concrete nonfaithful full-group-algebra example
after the reduced-counit comparison has been established.

The defining objects have the following API.

- Bialgebra morphisms preserve the coproduct and compose; cancellation is invariant under isomorphism and tensor products.
- Convolution is associative, positive on positive functionals and state preserving; the Haar state is normalized, both invariant and unique.
- The GNS null ideal and tensor-product Haar state have the stated coefficient formulas.

**Checks.**

- For C(C₂), h(a,b)=(a+b)/2 and h(1)=1. Point evaluation at the identity gives 1 on 1[e], while h gives 1/2, excluding evaluation as Haar.
- On the monoid {1,0} with absorbing 0, Δf(0,1)=Δf(0,0)=f(0); the span Δ(A)(A⊗1) has dimension 3 instead of 4 and fails cancellation.
- For ℂΓ, h(u_g)=0 for g≠e and h(1)=1; convolution of two such functionals has the same values. On Γ=ℤ, W(δ_1⊗δ_2)=δ_1⊗δ_3 and W(λ_1⊗1)W* sends δ_1⊗δ_2 to δ_2⊗δ_3.

*Needs:* CStarAlgebras C2,C5; VonNeumannAlgebras Layer 0 for the state space and GNS; OperatorAlgebraDynamics D1–D2; RepresentationTheory/CompactGroups, Haar measure. Haar existence: Timmermann Theorem 5.1.6.

### Examples

C(C₂) and C*(ℤ) give the finite and infinite classical cases; §1.1 also treats C₀(ℤ).

### Dependencies

§1.1 uses CStarAlgebras C1.CommutativeMultiplierMorphisms and C5.2. §1.2 adds CStarAlgebras C2, VonNeumannAlgebras Layer 0, OperatorAlgebraDynamics D1–D2 and RepresentationTheory/CompactGroups for the Haar measure of a compact group.

## Layer 2: Unitary corepresentations and Peter–Weyl theory

### 2.1 Analytic corepresentations and intertwiners

For arbitrary Hilbert H define a unitary corepresentation as a coaction
`δ:H→H⊗A` on the free right Hilbert A-module satisfying
`⟨δξ,δη⟩=⟨ξ,η⟩1`, `[δ(H)A]=H⊗A`, and coassociativity.
Construct the equivalent unitary operator `U∈L_A(H⊗A)` with
`δξ=U(ξ⊗1)` and `(id⊗Δ)U=U_12 U_13`. Build the multiplier and
leg extensions on `H⊗A⊗A` needed to state this equation even when H is
infinite-dimensional. A general corepresentation operator is *invertible*
and satisfies the same equation; arbitrary noninvertible solutions are not
included in its unitarization theorem.
Construct the strictly continuous extension of positive slice maps from
`K(H)⊗_min A` to `M(K(H)⊗_min A)=L_A(H⊗A)` and its tensor-leg
and order laws; these are the slice maps used by Haar averaging below.

Intertwiners are bounded linear T with `(T⊗1)U=V(T⊗1)`.
Develop identities, composition, dagger for unitary objects, norm-closed
intertwiner spaces, invariant closed subspaces and projections, kernels,
closures of ranges, polar intertwiners and orthogonal complements. Construct
finite sums, arbitrary Hilbert sums, tensor products and their associators;
prove unitary change-of-basis formulas. For finite Hilbert H express analytic unitarity by its
coefficient matrix in an orthonormal basis, and prove independence of
that basis by unitary conjugation. Construct the coefficient-matrix description and the
finite Hilbert forgetful functor, proving it faithful, complex-linear and
dagger strong monoidal. Q3 compares it with native comodules after the
Hopf core has been constructed.

The defining objects have the following API.

- Coactions correspond to unitary free-module operators, and tensor-leg maps respect associators.
- Intertwiners form norm-closed spaces stable under composition and dagger; invariant projections give orthogonal summands.
- Finite, arbitrary Hilbert sums and tensor products have their stated universal maps and coefficient matrices.

**Checks.**

- For the trivial CQG on ℂ, δξ=ξ⊗1 and U=1, including H=0. The zero operator on H=ℂ fails the isometry equation 0=1.
- For the sign representation of C₂, the nonidentity coefficient is −1 and its tensor square is 1. Using a direct-sum rule instead would give −2.
- On the S₃ permutation representation, g=(12),h=(23) give u₁₃(gh)=1 and u₁₃(hg)=0; the column coefficient coproduct fixes the tensor order.

*Needs:* Layer 1; HilbertModules H1–H3 for the free module, its adjointable operators, the multiplier identification and the leg tensors; CStarAlgebras C5; §0.1 for the fiber functor. Timmermann Definitions 5.1.4 and §5.3.

### 2.2 Unitarization and complete reducibility

Prove every invertible corepresentation operator similar to a unitary one by
Haar averaging `T=(id⊗h)(U*U)` and its positive invertibility; derive the
identity `U*(T⊗1)U=T⊗1` and unitarize by
`(T^(1/2)⊗1)U(T^(-1/2)⊗1)`. Prove every nonzero
unitary corepresentation has a nonzero finite-dimensional invariant subspace.
Construct Haar averages of compact-operator compressions, their invariant
compact C*-algebra and a nonzero finite-rank spectral projection. Deduce
irreducibles finite-dimensional and, using a maximal orthogonal family,
every unitary corepresentation an arbitrary Hilbert direct sum of finite
irreducibles. State and prove Schur's lemma, uniqueness of multiplicities
and the unitary comparison of decompositions. No countable-sum restriction
is introduced.

The defining objects have the following API.

- Haar averaging of an invertible corepresentation gives a positive invertible invariant form and a similarity to a unitary representation.
- Every unitary corepresentation decomposes as a Hilbert sum of finite irreducibles, with unique multiplicities.

**Checks.**

- For U=1 on ℂ², the averaged operator T is I₂ and the unitarized operator is I₂; its irreducible multiplicity is 2.
- For the C₂ representation U(s)=[[1,2],[0,−1]], averaging U*U and I gives T=[[1,1],[1,3]], determinant 2; U(s)*TU(s)=T.
- For U=0 on ℂ, averaging gives T=0, which has no inverse. This excludes noninvertible solutions of the corepresentation equation.

*Needs:* §2.1; Layer 1 Haar state; HilbertModules H2 module compacts; the native compact self-adjoint spectral theorem and OperatorTheory/SelfAdjointSpectralTheory Part B for the spectral projections. Timmermann Theorem 5.3.3.

### 2.3 The regular corepresentation

Construct the regular corepresentation by
`δ_h(Λ_h(a))=(Λ_h⊗id)Δ(a)`, proving its isometry by right Haar
invariance and its dense module range by cancellation. Prove the
closed linear span of its slices is A and every finite irreducible occurs
in it. Give explicit coefficient projections and finite coefficient
approximants. This is density of the span of coefficients; it does not say
every element of A is one coefficient of one finite irreducible.

The defining objects have the following API.

- The regular coaction descends through the Haar null space and extends isometrically with dense module range.
- All finite irreducibles occur, and finite coefficient spans are dense in the algebra.

**Checks.**

- For C₂ the regular space has dimension 2 and contains the trivial and sign characters once each; the sum of their dimensions is 2.
- For S₃ the regular multiplicities are 1,1,2 for irreducible dimensions 1,1,2; the resulting dimension is 1+1+4=6.
- For the trivial group, Λ(2)=2 and δ_hΛ(2)=2⊗1; coefficient span is ℂ. A zero regular coaction would send this vector to 0.

*Needs:* §§1.2,2.1–2.2; VonNeumannAlgebras Layer 0 GNS. Timmermann Propositions 5.3.7–5.3.8.

### Examples

The C₂ sign object and S₃ regular representation distinguish tensor and direct-sum constructions.

### Dependencies

Layer 1; HilbertModules H1–H3; CStarAlgebras C5; §0.1; §§2.2–2.3 use the Haar averaging and spectral-projection route, with OperatorTheory/SelfAdjointSpectralTheory Part B for §2.2 and VonNeumannAlgebras Layer 0 GNS for §2.3.

## Layer 3: The Hopf *-core, orthogonality and modular data

### 3.1 Orthogonality and the Hopf core

For each finite irreducible unitary u construct the conjugate matrix
bar u and prove its algebraic coaction irreducible by conjugating
invariant subspaces. For each row i construct the coefficient intertwiner
`e_j↦Λ_h(u_ij*)` into the regular corepresentation. It is nonzero
because `Σ_j h(u_ij u_ij*)=1`; invariance of its kernel and
irreducibility make it injective. Its finite-dimensional invariant image
gives the unitary regular restriction, and thereby invertibility of
bar u. Using Haar invariance and Schur's lemma,
construct the positive invertible unitarizing matrix F̃, normalized by
`Tr F̃=Tr F̃⁻¹`, with `bar u* F̃ bar u=F̃`. Prove this determines
F̃ uniquely. This construction precedes the antipode. Bundle the normalized positive two-sided integral as `AlgebraicHaar`.
The headline `schur_orthogonality` states both
orthogonality formulas directly from these finite Haar forms:

`h(u_ij* u_kl)=δ_jl (F̃⁻¹)_ik/Tr(F̃⁻¹)`,

`h(u_ij u_kl*)=δ_ik F̃_jl/Tr(F̃)`.

These are the orthogonality relations of Neshveyev–Tuset Theorem 1.4.2(i), p.9:
their weight ρ is the matrix F∈Hom(u,S²u) constructed below, whose entries are
f₁(u_ij) (§3.2; their Definition 1.7.1, p.21), so F̃=ρᵗ. Coefficients of inequivalent irreducibles are orthogonal in both forms.
Prove coefficient linear independence and the algebraic Peter–Weyl direct
sum. Now let Pol(G) be their linear span; prove it a dense unital
*-subalgebra, with Δ in its algebraic tensor square. Construct the native
coalgebra/bialgebra/Hopf structure with `ε(u_ij)=δ_ij` and
`S(u_ij)=u_ji*`, using the just-proved independence for well-definedness.
Star preservation of Δ is the native `TauCeti.StarCoalgebra`.
A Hopf *-algebra means a native complex Hopf algebra with compatible
star algebra structure and that star-preserving Δ. Its consequences are
native: ε star-preserving is `TauCeti.StarCoalgebra.counit_star`, S bijective
is `TauCeti.HopfAlgebra.antipode_bijective` and `S⁻¹(a)=S(a*)*` is
`TauCeti.HopfAlgebra.antipode_star_antipode_star`; consume them, and Mathlib's
`HopfAlgebra.antipode_mul_antidistrib` for `S(ab)=S(b)S(a)`.
Prove products, sums and basis-change compatibility, morphisms preserving
cores and the unitary finite-comodule comparison with Q2. The native
algebraic dual has coefficient matrix bar u in the dual basis; construct
its Hilbert structure using F̃.
Only now construct `F∈Hom(u,S²u)`, normalized positive with
`Tr F=Tr F⁻¹`, and prove `F̃=Fᵗ` as a theorem.

The defining objects have the following API.

- The normalized unitarizing matrix is positive definite and unique; the two weighted Schur forms distinguish its inverse and transpose.
- The coefficient core is a dense Hopf star algebra, functorial under quantum-group morphisms.
- `AlgebraicHaar` bundles a linear functional h with h(1)=1, (id⊗h)Δ(a)=h(a)1 and (h⊗id)Δ(a)=h(a)1 for every a, and h(a*a)≥0 for every a (Neshveyev–Tuset Theorem 1.6.6, Step 1, p.18, for the normalization and the two invariance equations); the normalization forces the algebra to be nonzero.

**Checks.**

- For a one-dimensional unitary character, F̃=1, h(u*u)=h(uu*)=1; a rescaled F̃=2 violates Tr F̃=Tr F̃⁻¹ since 2≠1/2.
- For the SUq(2) fundamental matrix at q=1/2, F̃=diag(2,1/2), Tr F̃=5/2, and the first Schur form has diagonal weights 1/5,4/5. Thus h(a*a)=1/5 and h(c*c)=4/5.
- In the orthonormal basis formed by the columns of W*, where W=(1/√2)[[1,i],[i,1]], the q=1/2 fundamental comodule has coefficient matrix v=WuW*, with F̃_v=W̄F̃Wᵗ=[[5/4,3i/4],[−3i/4,5/4]] and F_v=WFW*=[[5/4,−3i/4],[3i/4,5/4]], its transpose. The second Schur form gives h(v₁₁v₁₂*)=(3i/4)/(5/2)=3i/10; weighting by F_v instead of F̃_v would give −3i/10.
- For ℂ[C₂] the identity-coefficient integral has h(1)=1 and h((1+u)*(1+u))=2; the zero functional has normalization 0 and is excluded.
- On ℂ[C₂] the counit ε(x+yu)=x+y is normalized and positive, since ε((x+yu)*(x+yu))=|x+y|², but (id⊗ε)Δ(u)=u while ε(u)1=1, so it fails invariance; invariance forces h(u)(u−1)=0, hence h(x+yu)=x.
- For [[0,i],[1,0]], matrix adjoint is [[0,1],[−i,0]], while entrywise conjugation is [[0,−i],[1,0]]. The dual conventions must keep these distinct.

*Needs:* Layer 2; native Tau Ceti comodule coefficients; Mathlib Hopf algebra. Timmermann Propositions 3.2.9,3.2.17 and Theorem 5.4.1; Neshveyev–Tuset Theorem 1.4.2, p.9, and Theorem 1.6.6, Step 1, p.18.

### 3.2 Plancherel theory and modular characters

Complete the weighted coefficient spaces in L²(h), with norm squared
`Σ_(α,i,j,k) conjugate(c_ij^α)(F̃_α⁻¹)_ik c_kj^α/Tr(F̃_α⁻¹)`
for a coefficient sum Σ c_ij^α u_ij^α. Identify the regular
representation multiplicities and this Plancherel formula.
Build algebraic convolution with functionals, pinning
`φ*a=(id⊗φ)Δ(a)` and `a*φ=(φ⊗id)Δ(a)`, and construct Woronowicz
characters `f_z(u_ij)=(F^z)_ij`, with complex powers of the positive F.
First prove these are well-defined linear functionals, basis independent,
with `f_0=ε`, `f_z*f_w=f_(z+w)`, `f_z∘S=f_(-z)` and
`f_z(a*)=conjugate(f_(-conjugate z)(a))`, without assuming
multiplicativity. From the preceding coefficient orthogonality derive
`h(ab)=h(bθ(a))` for θ(a)=f_1*a*f_1; on a coefficient matrix
θ(u)=FuF. Derive the identity on a in the irreducible coefficient
basis and b in the starred-coefficient basis, then extend bilinearly.
Use the identity three times to prove
`h(cθ(ab))=h(cθ(a)θ(b))` for every c, and use Plancherel
faithfulness to deduce θ(ab)=θ(a)θ(b), with θ(1)=1.
Then ε∘θ=f_2 is a character. Convolution and antipode give
multiplicativity of f_(2m) for all integral m. Own the finite
Vandermonde step: for fixed a,b, the defect
f_z(ab)−f_z(a)f_z(b) is a finite sum Σ_j c_j λ_j^z
with distinct positive λ_j. Its values at z=2m, m≥0, vanish;
the first finitely many equations have invertible Vandermonde matrix
on the distinct λ_j², so every c_j=0. Thus all f_z are
multiplicative before they are used in a pivotal monoidality argument.
For every finite unitary corepresentation w, define F_w by
`(F_w)_ij=f_1(w_ij)`. Prove it is positive invertible, agrees with the
normalized F on irreducibles, and is block diagonal on direct sums. This
defines F on reducible objects independently of the trace normalization.
Derive F_(u⊠v)=F_u⊗F_v from the character law.

The defining objects have the following API.

- The weighted coefficient norm gives the Plancherel isometry and the regular multiplicities.
- Modular characters obey convolution, star and antipode laws and are multiplicative; their matrices respect sums and tensor products.

**Checks.**

- At q=1/2, a coefficient sum a+c has squared Haar norm 1/5+4/5=1, with zero mixed term; replacing the weights by 1/2 would lose the individual norms.
- On the fundamental SUq(2) coefficient a, F=diag(2,1/2) gives f_z(a)=2^z and θ(a)=4a; f_0(a)=1 and f_1*f_1(a)=4=f_2(a).
- For exponential bases λ₁=1,λ₂=2, the m=0,1 equations have matrix [[1,1],[1,4]], determinant 3; a defect vanishing at these two even integers has both coefficients zero.

*Needs:* §3.1; Mathlib positive matrix powers and Vandermonde determinant; Timmermann Theorem 3.2.19 and Theorems 5.4.3,5.4.5. The finite Vandermonde argument is the displayed derivation from those coefficient formulas.

### 3.3 Duals, pivots and Kac type

Construct duals and fusion multiplicities with their finite decomposition
and Frobenius reciprocity laws. On the native finite-comodule monoidal
category construct left duals via the inverse of the explicitly supplied
`Function.Bijective (HopfAlgebra.antipode)` and their evaluation/coevaluation
triangle identities. Package the resulting `RigidCategory` as a named
definition, installed locally in every statement using its left duals,
pivot, pivotal traces or dimensions. In the commutative case consume native
`TauCeti.HopfAlgebra.antipode_antipode` and `antipodeAlgEquiv`
for S⁻¹=S, identify the pairings with native Finite/Rigid’s existing
global instance, and use that native instance in the classical cases. For Pol(G), pin the pivotal comodule map
`j_V(v)=can_V((id⊗f_1)δ(v))` into V**, where can_V is the ordinary
double-dual identification. Its matrix is F; prove colinearity using
S²u=FuF⁻¹ and monoidal naturality using the character law for f_1, and
bundle j as a `TauCeti.PivotalCategory` structure on that rigid category.
Identify its right and left traces, `TauCeti.rightTrace` and
`TauCeti.leftTrace`, with tr(Ff) and tr(F⁻¹f), respectively. Use §0.1’s balanced unitary dual functor with the stated
algebraic evaluation/coevaluation. Compare its dagger-dual equations
with these evaluations/coevaluations; their squared norms are both
Tr F=Tr F⁻¹. Transport its Hilbert metrics and prove j is unitary,
`j†j=id` and `jj†=id`; evaluations and coevaluations are not
asserted unitary maps. In orthonormal coefficient bases the metric is
F̃ on the native right dual, F̃⁻¹ on the S⁻¹ left dual and F⁻²
on the double dual. Compare this pivotal structure with §0.1's balanced
conjugates and standard solutions. Prove the intrinsic dimension
`d(u)=Tr F=Tr F⁻¹`, its additivity/multiplicativity, `d(u)≥dim_H(u)`
and equality precisely when the normalized F is the identity. Prove the
corresponding Kac equivalences: Haar traciality, S²=id on Pol(G), and
all these F matrices equal to one. In that case recover ordinary
dimension-normalized orthogonality and an involutive antipode on
the Hopf core. Q4 constructs its bounded extensions to A_u
and A_r.

The defining objects have the following API.

- Inverse-antipode duals satisfy both triangle equations and compare with native commutative duals.
- The pivotal map is monoidal, the traces are tr(Ff) and tr(F⁻¹f), and intrinsic dimension is additive and multiplicative.
- Haar traciality, S²=id and identity normalized F matrices are equivalent.

**Checks.**

- For F=I₂, both pivotal dimensions are 2 and the ordinary dimension is 2; Haar is tracial in the classical SU(2) example.
- For F=diag(2,1/2), both traces are 5/2>2, but tr(F diag(1,0))=2 and tr(F⁻¹ diag(1,0))=1/2; the latter projection is not an irreducible intertwiner.
- For the trivial object, evaluation and coevaluation are scalar identities and both triangle composites are 1; on a two-dimensional classical object the cup norm squared is 2, so it is not a unitary map.

*Needs:* §§3.1–3.2; §0.1; PivotalSpherical Layers 0–2,7; native Tau Ceti Finite/RightRigid and commutative Finite/Rigid. Timmermann §3.2 and §5.4.

### 3.4 Tomita comparison

Derive `S²(a)=f_(-1)*a*f_1` and
compare the already proved modular identity with this S² formula,
using the same explicitly defined convolution actions.
Construct `σ_t(a)=f_(it)*a*f_(it)` and
`τ_t(a)=f_(-it)*a*f_(it)`, their group laws and norm-continuous
actions on the core. Prove `S²=τ_(-i)` and the KMS crosswalk
`h(ab)=h(b σ_(-i)(a))` for analytic core elements.
Prove the core is a dense Tomita algebra in Haar GNS, construct its
commuting right action, and prove the GNS vector separating for the
left von Neumann closure. Thus the vector Haar state is faithful normal
there. Identify the full closure of this concrete Tomita algebra with
VonNeumannAlgebras Layer 11's full left Hilbert algebra, including its left
representation, closable involution and polar operators. Consume Layer 11's
Tomita theorem and canonical-weight comparison, and prove its recovered
weight is this Haar vector state. First implement σ_t by the Haar-preserving unitaries
U_tΛ(a)=Λ(σ_t(a)) and obtain normal automorphisms of the von Neumann
closure. Prove the KMS identity on the analytic core, extend it by
density, and use V10.KMS's uniqueness to identify this group with
Δ_h^(it)(·)Δ_h^(−it).
Derive its action from the KMS boundary equation rather
than treating all f_z as bounded states on a completion.

The defining objects have the following API.

- The modular and scaling groups obey the specified convolution formulas and preserve the analytic core.
- The completed Tomita algebra recovers the faithful normal Haar vector state and its modular automorphisms.

**Checks.**

- At q=1/2, σ_t(a)=4^(it)a and σ_(-i)(a)=4a; h(aa*)=4/5=h(a*σ_(-i)(a)). The inverse modular convention gives 1/20 instead.
- On the coefficient c at q=1/2, S²(c)=q²c=c/4 and τ_(-i)(c)=c/4, whereas σ_t(c)=c.
- For the classical trivial group, F=1, σ_t=τ_t=id and the GNS modular operator is 1; its polar involution is complex conjugation.

*Needs:* §§3.1–3.3; VonNeumannAlgebras V10.ModularTheory, V10.KMS and Layer 11. Timmermann Theorems 3.2.19,5.4.5; the Tomita identification uses the stated KMS uniqueness route.

### Examples

The SUq(2) fundamental coefficients at q=1/2 have weights 1/5 and 4/5, dimension 5/2 and nontrivial modular group.

### Dependencies

Layer 2; native Hopf/comodule API; PivotalSpherical Layers 0–2,7 and §0.1 for §3.3; VonNeumannAlgebras V10.ModularTheory, V10.KMS and Layer 11 for §3.4.

## Layer 4: Algebraic compact type and the two completions

### 4.1 Algebraic compact type

Develop nonzero Hopf *-algebras of compact type over ℂ on the native Hopf API.
The headline `compactType_iff` equates a normalized positive Haar integral
with linear spanning by `unitaryCoefficientSet`, the coefficients of all finite
unitary native comodules in coordinate bases. Prove the equivalence with all
finite comodules unitarizable, spanning by finite unitary coefficients,
and a basis of coefficients of pairwise inequivalent unitary irreducibles.
An algebraic finite unitary comodule is a native finite-dimensional
comodule with a Hilbert inner product whose coefficient matrix in an
orthonormal basis is unitary; prove independence of that basis.
In the positive-integral direction first prove algebraic faithfulness of
a nonzero invariant integral on the Hopf *-algebra: neither h(a·) nor
h(·a) vanishes identically for nonzero a. Under positivity use
Cauchy–Schwarz to deduce `h(a*a)>0`. For an initial finite Hilbert product
use the averaged form `⟨v,w⟩_h=h(⟨δv,δw⟩_A)`.
The counit makes δ injective, so its orthonormal coefficient expansion
gives a sum `Σ_i h(a_i*a_i)>0` for v≠0. Prove Haar invariance of
this form and algebraic unitarization; no C*-order lower bound
is assumed before completion. Develop Q3's conjugate/orthogonality API
algebraically. In the coefficient direction first prove independence of
simple coefficient coalgebras and the spanning-to-direct-sum decomposition.
Then define the invariant functional which is one on the trivial
coefficient and zero on the other irreducible blocks, and prove that
the conjugate of each finite unitary comodule is equivalent to a member
of the unitary family. Construct positive F̃ from that unitary comparison,
then derive orthogonality from invariance/Schur theory algebraically;
these steps do not assume an analytic positive Haar state. Use these matrices
and the displayed orthogonality forms to prove `h(a*a)>0` for a≠0.
This positivity is a theorem needed for completion and reconstruction;
coefficient spanning alone is not defined to mean existence of a positive
state. The algebraic cancellation maps and their antipode inverses are
native `TauCeti.HopfAlgebra.comulMulRightEquiv` and `leftMulComulEquiv`,
with their span statements; consume them.

By the positive-integral direction such an algebra is spanned by finite unitary
coefficients, so with these algebraic orthogonality relations and the positivity
`h(a*a)>0` the derivations of §§3.2–3.3 hold on every Hopf *-algebra with an
`AlgebraicHaar` h. The headline `haar_modular_automorphism` states that there
is exactly one algebra automorphism θ with `h(ab)=h(bθ(a))` for all a and b; on
a unitary coefficient matrix θ(u)=FuF, and uniqueness is the faithfulness of h
(Neshveyev–Tuset Theorem 1.7.3, p.22). The headline
`haar_trace_iff_antipode_involutive` is the Kac equivalence: h is a trace
exactly when S∘S is the identity (Neshveyev–Tuset Proposition 1.7.7, p.23).

The defining objects have the following API.

- For a nonzero Hopf star algebra, positive normalized Haar and spanning by finite unitary coefficients are equivalent.
- A positive normalized invariant integral has exactly one modular automorphism, and it is a trace exactly when the antipode is involutive.
- Every finite comodule is unitarizable; coefficient independence gives the algebraic Peter–Weyl sum.
- The native algebraic cancellation maps have inverses determined by the antipode.

**Checks.**

- For ℂ with Δ1=1⊗1, h(z)=z, the coefficient 1 spans ℂ; both sides of the compact-type equivalence hold.
- For ℂ[C₂], the two group-like unitary coefficients 1,u form a basis and h((a+bu)*(a+bu))=|a|²+|b|², positive for every nonzero pair.
- For the zero algebra, coefficient span equals the whole zero space, but a linear functional sends 1=0 to 0≠1. Nontriviality is necessary for the equivalence.
- For primitive self-adjoint x in ℂ[x], invariance would give (id⊗h)Δx=x+h(x) and h(x)1 on the two sides, forcing x=0. Thus no normalized invariant integral exists.
- On ℂ[S₃] with h(u_g)=δ_(g,e), h(u_g u_k)=δ_(gk,e)=δ_(kg,e), so h is a trace, θ=id and S²(u_g)=u_g. On the SUq(2) core at q=1/2, θ(a)=4a gives h(aa*)=4/5=h(a*θ(a)), while h(a*a)=1/5 and S²(c)=c/4: both sides of the Kac equivalence fail. The inverse automorphism, θ⁻¹(a)=a/4, would give h(a*θ⁻¹(a))=1/20.

*Needs:* Mathlib Hopf algebra; native Tau Ceti finite comodules; §3.1 algebraic orthogonality route; §§3.2–3.3 for the modular identity and the Kac equivalences. Timmermann Proposition 2.2.4, Remark 2.2.2(iv)(c), Theorem 3.2.12; Neshveyev–Tuset Theorem 1.6.6, p.18, for the invariant functional of a Hopf *-algebra generated by unitary coefficients, Theorem 1.7.3, p.22, and Proposition 1.7.7, p.23.

### 4.2 Universal and reduced completions

Construct the universal C*-norm as the supremum over star representations.
Prove finiteness on every coefficient sum using unitary entries, and
nondegeneracy using the faithful algebraic Haar GNS representation.
Construct A_u and its universal extension property, extended Δ and ε,
and prove both cancellation conditions. For Kac cores construct the bounded involutive antipode on A_u.
Construct A_r by the Haar GNS
representation, prove the core embeds faithfully and h_r is faithful,
and extend Δ with its cancellation conditions, and in the Kac case
extend its bounded involutive antipode. Compare the GNS
regular corepresentation with Q2's regular object on the original
completion. Build the regular unitary
on `L²(h)⊗L²(h)` from

`U(Λ(a)⊗Λ(b))=(Λ⊗Λ)(Δ(a)(1⊗b))`.

Prove this formula preserves inner products by right Haar invariance,
is onto by algebraic cancellation, satisfies the pentagon
`U_12 U_13 U_23=U_23 U_12`, and implements
`Δ_r(λ(a))=U(λ(a)⊗1)U*`. Prove the resulting tensor-norm estimates
and extension to A_r. These are statements for this regular construction.

Construct the canonical quotient A_u→A_r and, for every C*-completion
of this compact-type core with its quantum-group structure, the compatible
maps from the universal completion and to the reduced completion. Compare
all their finite unitary representation categories and dense cores.
A_u has bounded counit; A_r need not. The algebraic antipode need not
be bounded even on A_u. Prove extension/transport with the stated norm
bounds `‖f(a)‖_target≤C‖a‖_source` on the core, including
the contractive star-map case; an arbitrary Hopf *-map need not extend
between reduced norms.

The defining objects have the following API.

- The universal norm is finite and separates points, and the Haar reduced completion has faithful Haar.
- The canonical completion maps preserve the dense core and its finite unitary category.
- The regular multiplicative unitary satisfies the stated pentagon and implements the reduced coproduct.

**Checks.**

- For Γ=ℤ, the regular unitary sends (δ_1,δ_2) to (δ_1,δ_3); both pentagon words send (δ_1,δ_2,δ_3) to (δ_1,δ_3,δ_6).
- For the trivial core ℂ, universal and reduced norms of 2+i are both √5 and the quotient is the identity.
- For C₂ the core element 1+u has norm 2 in both completions and Haar square norm 2; equality of C*-norm and Haar norm would give the wrong value √2.

*Needs:* §4.1; CStarAlgebras C1–C5; HilbertModules H2. Bédos–Murphy–Tuset §2 and §3, especially Theorem 3.6.

### 4.3 Coamenability

Define coamenability as the universal-to-reduced quotient being an
isomorphism. Prove its isomorphism invariance and the equivalences with
a bounded reduced counit, existence of a nonzero character on A_r,
and faithfulness of the universal Haar state. For an intermediate
completion A the corresponding criterion is faithfulness of h_A
together with boundedness of ε_A, not faithfulness alone.
Build the proof's slice-invariant Haar null ideal and the counit
testing identity: a bounded reduced counit forces this ideal in A_u
to vanish. Construct Haar-preserving translation maps from a reduced
character, their inverse on each coefficient block, and their unitary
GNS implementation; use their reduced-norm extensions to recover the
counit. Compare all canonical completion maps.
For group algebras prove coamenability equivalent to
amenability of Γ, including the reduced-counit criterion and the
nonamenable free-group counterexample. Identify `A_u(ℂΓ)=C*(Γ)` and
`A_r(ℂΓ)=C*_r(Γ)` compatibly with Q1's coproducts and canonical
quotient. Consume F3's Cayley-tree norm
calculation `‖λ(s)+λ(s)⁻¹+λ(t)+λ(t)⁻¹‖=2sqrt(3)<4`. The full counit
takes this sum to four, so it cannot extend to the reduced algebra.
Consume F3's noninjectivity theorem under those identifications and
deduce nonamenability and the nonfaithful full Haar state. Build the reduced-counit/amenability
comparison via positive regular coefficients, almost invariant ℓ²
vectors, D2's Reiter P₂ equivalence and the invariant-mean/Følner
interfaces of AmenableGroups. Do not confuse this compact-side
terminology with Haar traciality or with amenability of a compact group.
For classical compact groups identify Pol(G), A_r=C(G), and the
ordinary reduced counit and inversion using Haar's full support, and apply
the bounded-reduced-counit criterion to prove A_u=A_r=C(G). Section 6.3
later compares this with the reconstruction of an arbitrary commutative
compact quantum group.
Reconstruction below determines the Hopf
*-core; Q4 specifies its chosen completions separately.

The defining objects have the following API.

- Coamenability is invariant under isomorphism and is equivalent to a bounded reduced counit, a reduced character and universal Haar faithfulness.
- For group cores it is equivalent to amenability; classical compact groups have a single compatible completion.

**Checks.**

- For Γ=ℤ, the interval F_N=[−N,N] has boundary ratio 2/(2N+1), tending to 0; the reduced counit takes u to 1.
- For the free group on two generators, the adjacency sum has reduced norm 2√3<4 but counit value 4; it cannot have a bounded star-character extension.
- For the reduced free-group CQG, Haar is faithful while the reduced counit is unbounded. Faithfulness alone therefore does not characterize coamenability of an intermediate completion.

*Needs:* §4.2; OperatorAlgebraDynamics D2; AmenableGroups Layers 1,5,7; FreeProbability F3. Bédos–Murphy–Tuset Theorems 2.2,2.8,3.6 and Corollary 2.9.

### Examples

ℂ[C₂] has one completion; the free-group core distinguishes its universal and reduced completions.

### Dependencies

§4.1 is algebraic and uses §§3.1–3.3: the algebraic orthogonality route of §3.1, and §§3.2–3.3 for the modular automorphism and the Kac equivalence; §4.2 uses CStarAlgebras C1–C5 and HilbertModules H2; §4.3 uses OperatorAlgebraDynamics D2, AmenableGroups Layers 1,5,7 and FreeProbability F3.

## Layer 5: Compact matrix presentations

### 5.1 Matrix generation and SUq(2)

A compact matrix quantum group has a finite unitary matrix u whose entries
generate A as a C*-algebra and whose entrywise conjugate matrix is invertible and `Δ(u_ij)=Σ_k u_ik⊗u_kj`.
Prove the coefficient criterion: a unital coassociative C*-bialgebra whose
finite unitary coefficients with invertible conjugates span a dense
subalgebra satisfies both cancellation conditions. Develop bounded
universal presentations, core generation and their matrix-coordinate
universal properties before using them in Q6.

For real q with `0<|q|≤1`, construct SUq(2), generated by a,c and

`u=[[a,−q c*],[c,a*]]`,

with u unitary. Equivalently impose `a*a+c*c=1`, `aa*+q²c*c=1`,
`c*c=cc*`, `ac=q ca` and `ac*=q c*a`. Prove equivalence of these
presentations, existence and nonzero representations. Construct
`Δ(a)=a⊗a−q c*⊗c` and `Δ(c)=c⊗a+a*⊗c`, prove coassociativity,
invertibility of the conjugate matrix and cancellation. On the core
prove `ε(a)=1`, `ε(c)=0`, `S(a)=a*`, `S(c)=−q c` and
`S(c*)=−q⁻¹c*`. Construct its ordered monomial basis, coefficient
core and concrete star representations. Prove `SU_1(2)≃C(SU(2))`
as compact matrix quantum groups; q=0 is not in this quantum-group family.

The defining objects have the following API.

- The bounded matrix presentation has the stated universal property and a coproduct respecting its relations.
- The SUq(2) unitary-matrix and generator-relation presentations agree, and its coefficient core has the stated antipode and basis.

**Checks.**

- At every allowed q, a=1,c=0 gives u=I₂ and a nonzero representation; a=c=0 violates the first relation 0=1.
- At q=1, a=0,c=1 gives u=[[0,−1],[1,0]], whose adjoint product is I₂; q=1/2 with this same tuple gives aa*+q²c*c=1/4≠1.
- At q=1/2, S(c)=−c/2 and S(c*)=−2c*, so S²(c)=c/4; replacing both factors by −1 would incorrectly make S²(c)=c.

*Needs:* Layers 1,3,4; CStarAlgebras C1–C5. Timmermann Chapter 6 §2; Bédos–Murphy–Tuset §2, pp.13–14.

### 5.2 Free orthogonal quantum groups

For a nonempty finite index set of cardinality n, take invertible complex
F with `F bar F=cI`, c real and nonzero. Construct the free orthogonal
quantum group O_F^+, with universal A_o(F) generated by a unitary matrix
u and relation `u=F bar u F⁻¹`. Prove the universal norm is finite,
the algebra nonzero, and Δ(u_ij)=Σ_k u_ik⊗u_kj defines a compact
matrix quantum group. Build its Hopf core and generator maps. Prove
presentation comparisons under nonzero scalar rescaling of F and unitary
basis changes, with the induced transformation of the fundamental matrix.
Construct the cup `E(1)=Σ_ij F_ji e_i⊗e_j` and verify
`(E*⊗1)(1⊗E)=cI`. Retain the sign of c. Normalize the two conjugate
solutions and identify their self-duality map r with
§0.1's signed variant: the normalized cup E/√|c| has zigzag sign ε=sign(c),
corresponding to r̄r=εφ and to J²=ε in the finite-Hilbert realization.
Here `J(v)=F conjugate(v)/sqrt(|c|)` is an antilinear map. Prove it
is antiunitary precisely when F is proportional to a unitary; compare
the general map through Rep(O_F^+)'s chosen unitary dual functor and its
fibre Hilbert metrics.
Derive `d(u)≤‖E(1)‖²/|c|`, with
`‖E(1)‖²/|c|≥n` by AM–GM. Prove equality in this latter inequality
iff F is proportional to a unitary. Q7 proves irreducibility and then
standardness of this solution and the intrinsic-dimension equality.
Symmetric self-duality
and negative Frobenius–Schur sign are distinct; positive symmetric TL
cups cannot silently replace the signed conjugate data.

The defining objects have the following API.

- Free orthogonal universal presentations respect rescaling and unitary congruence of F.
- The signed cup satisfies its invariant and zigzag equations, with normalized sign sign(c).
- The dimension bound and antiunitarity criterion distinguish a general admissible F from a scalar multiple of a unitary.

**Checks.**

- For F=[[0,1],[−2,0]], F bar F=−2I, the cup is −2e₀⊗e₁+e₁⊗e₀, its squared norm is 5 and its normalized zigzag is −I.
- For that F, the intrinsic dimension bound is 5/2>2, and J(e₀)=−√2 e₁ has squared norm 2, so J is not antiunitary.
- For F=I₂, c=1, the cup squared norm is 2 and J is conjugation. For n=1,F=1, the relation gives u*=u and u²=1, the C₂ boundary case.

*Needs:* §5.1; §0.1 for signed conjugates and the dimension bound; Layer 3 duality. Banica Proposition 1 and Lemma 1; Malacarne §2, Lemma 2.1.

### Examples

SU₁(2) is classical, SU_(1/2)(2) is non-Kac, and the one-dimensional free orthogonal example is C*(C₂).

### Dependencies

Layers 1,3,4; CStarAlgebras C1–C5; §0.1 for signed conjugates and the dimension bound.

## Layer 6: Tannaka–Krein reconstruction

### 6.1 Reconstruction from a fiber functor

Let C be an essentially small rigid C*-tensor category, closed under
finite sums and subobjects, with simple unit, and a unitary fiber functor
τ:C→Hilb_f. Use a skeleton in `Type u` and form the coefficient algebra
in the same controlled universe; prove independence of the skeleton.
Define its coefficient algebra by generators and relations imposed by all
intertwiners, multiplication, star, Δ, ε and S. Prove the Hopf *-laws
and that its coefficients are unitary. Apply Q4's *proved* compact-type
positivity and completion theorems. Construct a unitary monoidal
equivalence C≃Rep_f(G) and the natural unitary monoidal comparison of τ
with the forgetful functor. Prove full faithfulness by recovering exactly
the prescribed intertwiner spaces, and essential surjectivity through
finite sums, conjugates and subobjects.

The defining objects have the following API.

- The coefficient quotient respects all intertwiner relations and carries Hopf star operations.
- The reconstructed representation category is equivalent to the original one with its fiber functor, independently of skeleton choice.

**Checks.**

- For finite Hilbert spaces with their ordinary forgetful functor, every linear map is an intertwiner, so coefficient relations leave only ℂ and the trivial CQG.
- For Rep(C₂) with its forgetful functor, the reconstructed core is C(C₂), dimension 2; collapsing the sign coefficient to 1 would reduce it to dimension 1.
- For Rep(S₃), the irreducible block dimensions give 1²+1²+2²=6 coefficients. Taking only diagonal coefficients would give 1+1+2=4 and fail reconstruction.

*Needs:* §4.1–§4.2; §5.2; §0.1. Malacarne Theorem 4.1, preprint pp.5–6.

### 6.2 Finite generators and filtered unions

Give the concrete finite-generator construction: spaces
`C(k,l)⊆B(H^⊗k,H^⊗l)` contain identities and are closed under
tensor product, composition and dagger; there is a cup
`R:ℂ→H⊗H` with `(R*⊗1)(1⊗R)=±1`. Construct the tensor algebra
of coefficient functionals, with
A=T(B(H)*), A_(≤n)=⊕_(k=0)^n B(H^⊗k)* and finite intertwiner
commutant B_n. Construct the bialgebra on A with
Δ(u_ij)=Σ_k u_ik⊗u_kj and ε(u_ij)=δ_ij. Identify the degree-k
part with the dual coalgebra of B(H^⊗k), preserving the
U_13 V_23 tensor coefficient convention. Construct its annihilator subspace/coideal
I_n=B_n^⊥ inside A_(≤n). Prove the compatibility
I_(n+1)∩A_(≤n)=I_n using the finite-dimensional case of VonNeumannAlgebras
Layer 1's bicommutant theorem, and prove
A_(≤m)I_n+I_n A_(≤m)⊆I_(m+n). Prove counit vanishes on I_n
and its coproduct lies in I_n⊗A_(≤n)+A_(≤n)⊗I_n. The finite
truncation is a coalgebra, with no assertion that it is a subalgebra.
Prove the increasing union I=⋃_n I_n is a bi-ideal of the full A, and
construct the induced finite-stage injections A_(≤n)/I_n→A/I.
For H=0 construct the quotient ℂ and trivial compact quantum group
directly, including its degree-zero coefficient comparison. For dim H>0 pass through
Q5's free orthogonal Hopf core: write
R=Σ_(i,j) F_ji e_i⊗e_j with F bar F=±1, and construct the
bi-ideal I_F generated by its cup relations. Prove I_F⊆I and
A/I_F≅Pol(O_F^+) (Malacarne Lemma 2.1), preserving coefficient
generators. Transport the star and antipode through this comparison;
prove the remaining ideal a Hopf *-ideal. Use finite-dimensional
bicommutants to show no extra intertwiners have been imposed. Construct
the generator reduction by adjoining conjugates and finite sums.

For an arbitrary generating set, use its finite subsets, their full rigid
C*-subcategories, the compatible coefficient embeddings and filtered
union of Hopf *-cores. Prove every object and intertwiner appears in
such a finite subcategory. Construct the canonical isomorphism from
this filtered union to the generators-and-relations algebra defined
above, preserving every coefficient, Hopf structure and the
fiber-compatible representation equivalence. The resulting equivalence
has the stated generality. Do not assert a single finite-dimensional
fundamental matrix for an infinitely generated C.

The defining objects have the following API.

- Finite coefficient truncations inject compatibly, and their annihilators form a Hopf star ideal in the full tensor algebra.
- Finite generating subcategories assemble by filtered union and recover every object and intertwiner.

**Checks.**

- For H=0, degree zero is ℂ and all positive-degree coefficient spaces are zero; the quotient is ℂ, not the zero algebra.
- For H=ℂ, the degree ≤1 tensor space has dimension 2, with distinct degree-zero and degree-one basis vectors; multiplying the degree-one vector by itself leaves this truncation.
- For a character category generated by two independent characters z,w, a single generator misses w, whereas their finite generating subset contains zw. This distinguishes filtered union from one fixed fundamental matrix.

*Needs:* §6.1 coefficient-algebra definition; §5.2; VonNeumannAlgebras Layers 1 and 3 for finite-dimensional bicommutants. Malacarne Lemmas 1.2, 2.1 and 3.1 and the proof of Theorem 4.1, preprint pp.2–6.

### 6.3 Uniqueness and commutative reconstruction

Prove uniqueness up to Hopf *-isomorphism with its fiber-compatible
representation data, and naturality under unitary equivalences of
fiber-functor pairs. Compare universal and reduced reconstructed compact
quantum groups using Q4; do not turn algebraic uniqueness into a claim
of a unique C*-norm. For symmetric fiber data preserving the usual Hilbert flip, prove
the reconstructed coefficient algebra commutative. Prove every
commutative compact quantum group is C(G): recover a compact Hausdorff
space by Gelfand duality and associative multiplication from Δ.
Cancellation spans separate pairs and imply both topological cancellation
laws. Prove a compact Hausdorff cancellative semigroup is a group:
construct an idempotent in each closed cyclic subsemigroup using a
minimal compact subsemigroup; cancellation makes it the global identity,
and compactness of powers supplies inverses. Construct the identity
and inverse without assuming boundedness of the core ε and S.
Prove the resulting counit/inversion agree with the core maps, and
that the representation equivalence recovers its original fiber data.
Ordinary compact-group Haar has full support, so every commutative
compact quantum group has faithful Haar. Compare this reconstruction
with Q4's single classical-group completion theorem A_u=A_r=C(G),
including its counit, inversion and original fibre functor.

The defining objects have the following API.

- Fiber-compatible equivalence determines the Hopf core and its specified completions.
- Symmetric fiber data gives a commutative core; a commutative compact CQG reconstructs a compact group with matching counit, inverse and Haar.

**Checks.**

- For inclusion {e}→C₂, the function map is ℂ²→ℂ, (a,b)↦a; reversing it loses the required arrow direction.
- For the finite absorbing monoid {1,0}, 0·1=0·0 with 1≠0, so it fails cancellation and cannot pass group reconstruction.
- For C(C₂), the recovered identity is e, the inverse fixes both elements, and Haar gives each point mass 1/2; both points lie in its support.

*Needs:* §§6.1–6.2; §4.2 for the reconstructed universal and reduced completions and §4.3 for A_u=A_r=C(G); CStarAlgebras C1 Gelfand duality; Layer 1 cancellation. Malacarne Theorem 4.1 for fiber reconstruction; the compact-semigroup step is the idempotent/cancellation argument stated above.

### Examples

Finite Hilbert spaces reconstruct ℂ; Rep(C₂) and Rep(S₃) reconstruct their 2- and 6-dimensional function algebras.

### Dependencies

Layers 4–5; §0.1; VonNeumannAlgebras Layers 1 and 3 for finite bicommutants; §6.3 also uses §§4.2–4.3, the cancellation of Layer 1 and CStarAlgebras C1 Gelfand duality.

## Layer 7: SUq(2), free orthogonal fusion and Haar calculations

### 7.1 SUq(2) representations and Haar integration

For SUq(2) construct exactly one irreducible r_k of Hilbert dimension
k+1 for every k≥0, the conjugate solutions, matrix coefficients and
Clebsch–Gordan intertwiners. Prove the SU(2) fusion rules and completeness,
including the classical endpoint and the negative-q signed duality.
For `0<|q|<1`, compute the Haar functional on the ordered monomial basis
and prove its functional-calculus consequence
`h(f(c*c))=(1−q²)Σ_(j≥0)q^(2j) f(q^(2j))` for continuous f.
Derive the normalized F matrices, quantum dimensions, modular character
values and modular group on generators. At q=1 identify r_1 with the
defining matrix action on ℂ², and hence with CompactGroups' su2Irrep 1
by an actual unitary intertwiner. Derive Haar integration of all ordered
monomials from the SU(2) unit-sphere coordinates
a=√(1−t)z, c=√t w, 0≤t≤1 and z,w∈𝕋: prove normalized invariant
measure has pushforward dt dz dw, using the sphere-volume Jacobian
and invariance. Phase integration gives the monomial values and
`h(f(c*c))=∫_0^1 f(t)dt`, including non-class functions.
For q=−1 construct the
reduced matrix-function model `a=sqrt(1−t) z σ₃`,
`c=sqrt(t) w σ₁`, (t,z,w)∈[0,1]×𝕋², and prove the Haar
state is the integral of the normalized 2×2 trace with dt and Haar
dz,dw. Prove the core representation faithful and the invariant
monomial identities; in particular `h(f(c*c))=∫_0^1 f(t)dt`.
Neither endpoint is obtained by substituting into a divergent series.
Prove SUq(2) coamenable throughout `0<|q|≤1`. In the interior
use the weighted shift model on ℓ²(ℕ×ℤ) and identify its kernel with
the Haar null ideal. Write a=a₀⊗1 with a₀=S*D on ℓ²(ℕ), where
D−1 is compact. Thus a₀ belongs to C8's Toeplitz algebra and its
symbol is the symbol of S*. Compose that symbol map with evaluation
at z=1 to obtain a character χ with χ(a₀)=1. Transport χ along
the concrete isomorphism 𝒯≃𝒯⊗1⊆B(ℓ²(ℕ×ℤ)), extend this state
by C2, and restrict it to the reduced image. Apply Q4's character
criterion. Compactness of D−1 is used on ℓ²(ℕ).
Use C4's multiplicative-domain theorem and the generator relations to
prove this state is a character: its value a=1 forces both a-defects
and c*c=cc* to have value zero, so a,c lie in its multiplicative domain.
At q=1 use the classical comparison; at q=−1 identify the above
faithful-Haar matrix-function model with the reduced completion and
take its character at t=0, z=1 on the σ₃ eigenvalue-one component.

The defining objects have the following API.

- SUq(2) simples, tensor decompositions and conjugate solutions cover the signed parameter interval including both endpoints.
- Haar monomial integration yields the interior geometric distribution and endpoint uniform distribution of c*c.
- The reduced character proves coamenability and compares all completions.

**Checks.**

- At q=1/2, h(c*c)=4/5 and h((c*c)²)=16/21. At either endpoint q=±1 these values are 1/2 and 1/3, so direct substitution in the geometric series is invalid.
- For r₁⊗r₁, Hilbert dimensions give 2·2=1+3; at q=1/2 intrinsic dimensions give (5/2)²=1+21/4.
- At q=−1,t=0,z=1, the matrix model has a=σ₃,c=0; evaluation on the positive σ₃ eigenspace sends a to 1,c to 0, the counit character.

*Needs:* Layers 3–6; CStarAlgebras C2,C4,C8; RepresentationTheory/CompactGroups, SU(2). Bédos–Murphy–Tuset Theorem 2.12 and Corollary 2.13; Timmermann Chapter 6 §2. Endpoint integration follows the explicit models above.

### 7.2 Free orthogonal fusion and coamenability

For O_F^+ and n≥2 prove Banica's representation theorem. Construct the
concrete tensor category generated by its signed cup/cap maps and identify
it with the entire intertwiner category by Q6 and the universal
presentation. Prove End(u)=ℂ, hence the normalized conjugate solution
from Q5 is standard and `d(u)=‖E(1)‖²/|c|`. For cup-cap projections on adjacent tensor factors prove
`p_i²=p_i*=p_i`, distant commutation and
`β p_i p_(i±1) p_i=p_i`, with
`β=c⁻²‖E(1)‖⁴=d(u)²`. Compare with the TL positive quotient by
applying §0.2 to u with the normalized cup E(1)/√|c| and ε=sign(c),
retaining the signed conjugate structure. Construct the Catalan dimension
upper bound. Choose real q with `0<|q|≤1` by `|q|+|q|⁻¹=d(u)` and
`sign(q)=−sign(c)`, and use the SUq(2) signed cup, Haar moment
crosswalk. The signed algebraic loop is δ=−(q+q⁻¹)=sign(c)d(u),
whereas Subfactors 3.1–3.3 use the positive-loop parameter d(u). Section 0.2
identifies the normalized projections p_i in both presentations, the signed
generator being δ p_i and the positive generator d(u)p_i, and gives the
trace-compatible injective quotient comparison, keeping the signed
cup/duality data separate from its sign map. Use the Haar moment
calculation and faithful TL trace form to transfer the matching lower
bound. Prove the intertwiner dimension equality, so that §0.2's comparison
is full, and obtain the irreducibles as its Jones–Wenzl ranges. Prove all irreducibles are r_k,
k≥0, r_0=1,r_1=u, with

`r_k⊗r_l ≃ r_|k−l| ⊕ r_|k−l|+2 ⊕ … ⊕ r_(k+l)`.

Separate the dimension recurrences: Hilbert dimensions have
`a_0=1,a_1=n,a_(k+1)=n a_k−a_(k−1)`; intrinsic dimensions
replace n by d(u). Prove equality of the two scales exactly when F
is proportional to a unitary, and work out a non-Kac admissible F.
Prove the Haar distribution of the self-adjoint fundamental character
χ=Σ_i u_ii is the centered variance-one semicircular law on [−2,2],
using its Catalan moments and compactly supported moment uniqueness.
For n>2 deduce failure of coamenability: ε(χ)=n whereas the reduced
Haar spectral support is [−2,2]. Supply the faithful-Haar spectral
support argument and the invertibility contradiction. For n=2 prove
that nonzero scalar rescaling and unitary congruence `F↦VFVᵗ`
reduce every admissible F to `[[0,1],[−q⁻¹,0]]` for a real
`0<|q|≤1`, and construct the induced compact-quantum-group
isomorphism `O_F^+≃SUq(2)`. At n=1 prove instead
`A_o(F)=C*(ℤ/2)`, with two irreducibles and two-point character law;
the infinite fusion and semicircular assertions do not hold there.

The defining objects have the following API.

- Signed cup intertwiners identify the complete free orthogonal representation category and its fusion.
- Hilbert and intrinsic dimensions obey different recurrences unless F is proportional to a unitary.
- The fundamental character has the semicircular law for n≥2, yielding the stated coamenability classification.

**Checks.**

- For F=[[0,1],[−2,0]], d=5/2, signed loop δ=−5/2 and positive loop 5/2. The generators are −(5/2)p and (5/2)p, while β=d²=25/4 is unchanged.
- For n=2,d=5/2, Hilbert dimensions start 1,2,3,4; intrinsic dimensions start 1,5/2,21/4,85/8. Equality of the sequences would already fail at r₁.
- For n=3, ε(χ)=3 lies outside [−2,2], excluding coamenability. Semicircular moments m₂=1,m₄=2 differ from the n=1 two-point law with m₂=m₄=1.

*Needs:* §7.1; §§5.2,6.1–6.2; TemperleyLieb Layers 0–7; §0.2; Subfactors 3.2–3.3; FreeProbability F1,F6. Banica Theorem 1 and Proposition 2, pp.1–4.

### Examples

The parameters n=1,2,3 distinguish the two-point law, coamenable rank-two case and noncoamenable semicircular examples.

### Dependencies

Layers 3–6; TemperleyLieb Layers 0–7; §0.2 with Subfactors 3.1–3.3; CStarAlgebras C2,C4,C8; RepresentationTheory/CompactGroups for SU(2) in §7.1; FreeProbability F1,F6.

## Layer 8: Generic U_q(sl₂), signed modules and integrability

Work over ℂ with q≠0 and q^r≠1 for every positive integer r. In particular
q≠±1. Modules in this layer are algebraic modules, with no topology or
finite-dimensional assumption unless stated. The generic hypothesis is the
native `IsGenericQuantumParameter`. Quantum integers are the native
`TauCeti.quantumInteger`, [r]_q=(q^r−q^(−r))/(q−q⁻¹) for r∈ℤ, with their
Laurent-polynomial formula, recurrence, sign law and nonvanishing for r≠0.

### 8.1 Presentation, PBW and Hopf API

U_q is the native `TauCeti.UqSl2`, the `RingQuot` of `FreeAlgebra ℂ` on
E,F,K,K⁻¹ by the relations `TauCeti.UqSl2.Rel`:
KK⁻¹=K⁻¹K=1, KE=q²EK, KF=q⁻²FK and
EF−FE=(K−K⁻¹)/(q−q⁻¹). Their images are the generators `TauCeti.UqSl2.e`,
`f`, `k` and `kInv`, and `TauCeti.UqSl2.kUnit` bundles K with its inverse.
The universal property for actual generator tuples in an arbitrary complex
algebra is `TauCeti.UqSl2.lift`, with extensionality on generators and the
inverse-K commutation formulas. The basis F^a K^b E^c, (a,b,c)∈ℕ×ℤ×ℕ, is
`TauCeti.UqSl2.pbwBasis`, with unique coefficient expansion, subalgebra
inclusions, the triangular decomposition `TauCeti.UqSl2.triangularEquiv` and
the domain instance `TauCeti.UqSl2.instIsDomain`.
The reusable σ-derivation Ore extension is the native `TauCeti.OreExtension`
over a k-algebra R on finitely supported
nonnegative coefficient sequences: T r=σ(r)T+δ(r),
with an explicit k-algebra endomorphism σ and k-linear δ satisfying
δ(rs)=σ(r)δ(s)+δ(r)s. Require σ injective for leading-term/domain
results. The left-coefficient monomial basis holds for every σ;
require σ bijective for the right-coefficient monomial basis.
Its associative multiplication, coefficient recursion, leading term,
monomial basis `monomialBasis` and universal property `liftAlgHom` are
native; `skewPolynomialEquiv` identifies δ=0 with Mathlib's `SkewPolynomial` and its
`MulSemiringAction (Multiplicative ℕ)` convention under a local instance
induced by the explicit σ parameter; use no global q-dependent instance.
For PBW start with ℂ[K,K⁻¹], adjoin F with σ_F(K)=q²K, then E
with σ_E(K)=q⁻²K, σ_E(F)=F, δ_E(K)=0 and
δ_E(F)=(K−K⁻¹)/(q−q⁻¹). These maps respect the first extension's
relations and extend by the Ore universal property; they are the native
`TauCeti.UqSl2.sigmaF`, `TauCeti.UqSl2.sigmaE` and `TauCeti.UqSl2.deltaE`,
the last obtained from the triangular-matrix algebra map
r↦[[σ_E(r),δ_E(r)],[0,r]] by `TauCeti.SigmaDerivation.ofMatrix`.
`TauCeti.UqSl2.oreTowerEquiv` identifies the tower presentation
with the quotient. Its left-coefficient basis K^b F^a E^c equals
q^(−2ab) F^a K^b E^c, hence yields the specified PBW basis.
Under `[Fact (q≠0)]`, the native `HopfAlgebra` instance
`TauCeti.UqSl2.instHopfAlgebra` lives on this quotient; all coproduct/counit/antipode
definitions and instance synthesis use that same hypothesis. Its formulas,
`TauCeti.UqSl2.comul_e`, `comul_f` and `comul_k` on the generators, are
ΔK=K⊗K, ΔE=E⊗1+K⊗E, ΔF=F⊗K⁻¹+1⊗F,
εK=1, εE=εF=0, S(K)=K⁻¹, S(E)=−K⁻¹E and S(F)=−FK.
The structure maps `TauCeti.UqSl2.comul`, `TauCeti.UqSl2.counit` and
`TauCeti.UqSl2.antipodeOp` are defined through `TauCeti.UqSl2.lift`, which
checks the relations, and the Hopf identities are the content of
`TauCeti.UqSl2.instHopfAlgebra`.
The antipode inverse and its square are `TauCeti.UqSl2.antipodeEquiv` and
`antipode_antipode`, the automorphisms E↦tE,F↦t⁻¹F for t≠0 are
`TauCeti.UqSl2.rescale`, and the algebra isomorphism from the q⁻¹
presentation sending K to K⁻¹ and E,F to E,F is
`TauCeti.UqSl2.inverseParameterEquiv`. This map is not a Hopf isomorphism
for the pinned coproduct; its transported coproduct is proved with it.

The defining objects have the following API.

- The presentation and Ore tower have universal maps, extensionality and the same ordered monomial basis; the quotient is a domain.
- The coproduct, counit and antipode respect the relations, including negative K powers; the coproduct convention is fixed on generators.
- Quantum integers have Laurent expressions, sign and recurrence laws and are nonzero at nonzero integers under the generic hypothesis.

**Checks.**

- At q=1/2, [−2]_q=−5/2,[−1]_q=−1,[0]_q=0,[1]_q=1,[2]_q=5/2; q−q⁻¹=−3/2 is nonzero. At q=1 the totalized quotient formula gives 0, unlike the Laurent specialization [2]_1=2.
- The PBW monomials with indices (0,0,0),(0,−1,0),(1,0,1) are 1,K⁻¹,FE. At q=1/2, KF=4FK agrees with q^(−2ab)=4 for a=b=1; the inverse coefficient 1/4 fails.
- On L₁⁺ at q=1/2, K=diag(1/2,2), K⁻¹=diag(2,1/2), E=[[0,1],[0,0]], F=[[0,0],[1,0]]; EF−FE=diag(1,−1)=(K−K⁻¹)/(−3/2).
- At q=0, the relations and invertible K force E=F=0; hence a PBW family indexed by arbitrary E,F powers would contain zero. At q=±1 the totalized presentation is commutative, so the generic center theorem cannot apply.
- For the Ore relation with σ=id, δ(x)=1, Tx=xT+1; at δ=0 it becomes Tx=xT. For σ(x)=2x, δ=0 it becomes Tx=2xT, distinguishing the two independent inputs.

*Needs:* Mathlib FreeAlgebra, RingQuot, LaurentPolynomial, SkewPolynomial, TensorProduct, HopfAlgebra. Virelizier §2.3, Proposition 2.4, p.8 fixes the Hopf convention and monomial spanning; linear independence and the domain use the specified general Ore tower.

### 8.2 Modules, weights and highest-weight construction

Modules are native
complex modules with U_q actions, equivalently complex algebra maps to
`Module.End ℂ V`; intertwiners, kernels, quotients, sums and arbitrary
algebraic direct sums are Mathlib's linear maps, submodules, quotient
modules and `DFinsupp` over U_q. Tensor and dual actions are §8.5's single
generic Hopf-module construction on §8.1's Hopf structure; the weight and
highest-weight results of this section use no tensor or dual action.
The K eigenspaces and generalized eigenspaces are `TauCeti.UqSl2.weightSpace`
and `TauCeti.UqSl2.genWeightSpace`, and E and F shift λ to q²λ and q⁻²λ
(`TauCeti.UqSl2.e_smul_mem_weightSpace`, `TauCeti.UqSl2.f_smul_mem_weightSpace`). Define locally nilpotent
E and F by eventual annihilation of each vector, and local finiteness
by finite dimension over ℂ of each cyclic U_q submodule, the native predicate
`TauCeti.IsLocallyFiniteModule ℂ (UqSl2 q) V`; scalar actions obey `IsScalarTower`.
The Verma module `TauCeti.UqSl2.VermaModule` for every λ≠0 is the quotient
by the left ideal UE+U(K−λ), with basis F^jv, j≥0
(`TauCeti.UqSl2.VermaModule.basis`), its action, singular vectors
(`TauCeti.UqSl2.VermaModule.singularMap`), submodules
(`TauCeti.UqSl2.VermaModule.eq_bot_or_exists_eq_span_singleton_vec`) and,
for λ=εq^m, simple quotient L_m^ε
(`TauCeti.UqSl2.VermaModule.ladderModuleEquivQuotient`). For m≥0 and ε∈{1,−1}
the signed ladder `TauCeti.UqSl2.LadderModule q m ε` is L_m^ε, with basis v₀,…,v_m and
K v_j=εq^(m−2j)v_j, F v_j=[j+1]_q v_(j+1),
E v_j=ε[m−j+1]_q v_(j−1), with out-of-range vectors zero.
The relations hold because the action `TauCeti.UqSl2.LadderModule.rep` is
defined through `TauCeti.UqSl2.lift`; at a generic parameter, simplicity,
Schur's lemma and pairwise nonisomorphism are
`TauCeti.UqSl2.LadderModule.isSimpleModule`,
`TauCeti.UqSl2.LadderModule.algebraMap_end_bijective` and
`TauCeti.UqSl2.LadderModule.nonempty_linearEquiv_iff`.
`TauCeti.UqSl2.existsUnique_linearEquiv_ladderModule` classifies every finite-dimensional simple as
exactly one L_m^ε, deriving existence of a highest vector from the
finite K spectrum without assuming K is diagonalizable beforehand.

The defining objects have the following API.

- Weights shift by q² and q⁻²; cyclic local finiteness is over ℂ, with a compatible scalar tower.
- Verma quotients have the prescribed basis and singular vectors; the signed finite ladders are simple, distinct and exhaust finite simples.

**Checks.**

- At q=1/2, L₀⁺ has K=1 and L₀⁻ has K=−1, with E=F=0 in both; the two nonisomorphic one-dimensional simples cannot be identified.
- For L₂⁺ the weights are 1/4,1,4; F coefficients are 1,5/2,0 and E coefficients are 0,5/2,1. The EF−FE diagonal is 5/2,0,−5/2, equal to [2−2j]_q.
- For L₁⁻, K=diag(−1/2,−2), E=[[0,−1],[0,0]], F=[[0,0],[1,0]]; EF−FE=diag(−1,1), the negative of the positive ladder. The zero module has dimension 0 and is not simple.

*Needs:* §8.1; Mathlib Module, IsScalarTower, Submodule and finite-dimensional eigenspaces. Virelizier Example 3.3, Proposition 3.7 and Corollary 3.8, pp.11–12 give type-1 inputs; the signed and generalized-weight extension is the highest-vector argument specified here.

### 8.3 Casimir and finite-dimensional complete reducibility

The Casimir `TauCeti.UqSl2.casimir` is
Ω=FE+(qK+q⁻¹K⁻¹)/(q−q⁻¹)², central by `casimir_mem_center`, and the whole
center is ℂ[Ω] by PBW/leading-coefficient reduction:
`TauCeti.UqSl2.polynomialAlgEquivCenter` says an element is central if and
only if it is a unique polynomial in Ω. Its scalar on
L_m^ε is ε(q^(m+1)+q^(−m−1))/(q−q⁻¹)²
(`TauCeti.UqSl2.casimirScalar_units_mul_pow`), and these scalars are
pairwise distinct for all (m,ε) under the generic hypothesis
(`TauCeti.UqSl2.casimirScalar_units_mul_pow_inj`).
`TauCeti.UqSl2.isSemisimpleModule_of_finiteDimensional` says every
finite-dimensional U_q module is semisimple, including
ones initially given with generalized K weights. Split into Casimir
primary blocks; in a block with composition factors L_m^ε, the top
generalized K-weight space W has dimension equal to their multiplicity
by a composition series and exactness of generalized eigenspaces.
E W=0 is `TauCeti.UqSl2.e_smul_eq_zero_of_casimirBlock_eq_top`, and F^r is
injective on W for r≤m by `TauCeti.UqSl2.eq_zero_of_f_pow_smul_eq_zero`. For the latter use
W_r=ker(F^r)∩W: the commutator sends X_r W_r into W_(r−1),
where X_r=(q^(1−r)K−q^(r−1)K⁻¹)/(q−q⁻¹) is invertible on
W for 1≤r≤m. Induction gives W_r=0. The commutator formula
E F^r=F^r E+[r]_q F^(r−1)
(q^(1−r)K−q^(r−1)K⁻¹)/(q−q⁻¹), for q−q⁻¹≠0, is `TauCeti.UqSl2.e_mul_f_pow`.
Applied at r=m+1 with F^(m+1)W=0 it forces K²=q^(2m) on W.
The two roots are distinct and the block has chosen sign ε, so
K=εq^m on W (`TauCeti.UqSl2.genWeightSpace_eq_weightSpace_of_forall_e_smul_eq_zero`
and `TauCeti.UqSl2.f_pow_smul_eq_zero_of_forall_e_smul_eq_zero`). The strings
F^jW then give the actual direct sum of L_m^ε. The multiplicity of L_m^ε in a
finite-dimensional V is `dim Hom_U(L_m^ε,V)`, the coefficient of the formal
character at εq^m minus its coefficient at εq^(m+2)
(`TauCeti.UqSl2.finrank_linearMap_ladderModule_eq_formalCharacter_coeff_sub`),
so multiplicities are unique, and short exact sequences of finite-dimensional
modules split by Mathlib's `IsSemisimpleModule.extension_property` and
`IsSemisimpleModule.lifting_property`. K is diagonalizable on every
finite-dimensional module, the finite-dimensional case of §8.4's
`TauCeti.UqSl2.isSignedTypeOne_and_forall_exists_pow_smul_eq_zero_iff_isLocallyFiniteModule`
through the instance `TauCeti.IsLocallyFiniteModule.of_finite`. Derive that
dim Hom_U(V,W)=Σ_(m,ε) dim Hom_U(L_m^ε,V)·dim Hom_U(L_m^ε,W) for
finite-dimensional V and W, and that End_U(V) is the product over (m,ε) of the
full matrix algebras on the multiplicity spaces Hom_U(L_m^ε,V).

The defining objects have the following API.

- The Casimir generates the center freely and separates the signed finite simples.
- Every finite-dimensional complex module splits into signed simples, with unique multiplicities and diagonalizable K.

**Checks.**

- At q=1/2, Ω on L₀⁺,L₁⁺,L₂⁺ is respectively 10/9,17/9,65/18; on the corresponding negative simples these values are negated, and all six are distinct.
- On L₁⁺, FE=diag(0,1), while the toral Casimir term is diag(17/9,8/9); their sum is (17/9)I₂ and commutes with E and F.
- L₀⁻⊕L₁⁺ has dimension 1+2=3 and Casimir blocks −10/9,17/9. The zero module is also semisimple. In the algebra itself Ω has PBW leading term FE, so Ω² has leading term F²E² with coefficient 1, distinct from degree-one polynomials.

*Needs:* §§8.1–8.2; Mathlib polynomial evaluation, IsSemisimpleModule and primary decomposition. Virelizier Theorem 3.13 and Corollary 3.14, p.13 give the type-1 splitting; the full center and generalized-weight splitting follow the PBW and primary-block arguments above.

### 8.4 Arbitrary local finiteness and the type-1 distinction

`TauCeti.UqSl2.isSemisimpleModule_of_isLocallyFiniteModule` and
`isLocallyFiniteModule_iff_exists_linearEquiv_dfinsupp_ladderModule` say that an
arbitrary locally finite module is an algebraic direct sum of the signed
finite simples. In the Zorn argument a finite cyclic submodule intersects
the maximal semisimple sum in a finite submodule, splits by §8.3, and
supplies a new simple complement if the sum is not all V. The converse and the evaluation isomorphism
⊕_(m,ε) (L_m^ε⊗Hom_U(L_m^ε,V))≃V, `TauCeti.UqSl2.ladderModuleTensorHomEquiv`,
come with actual commuting actions.
Type 1, the native `TauCeti.UqSl2.IsTypeOne`, is K diagonalizable with eigenvalues in {q^k:k∈ℤ},
using an algebraic eigenspace direct sum even for infinite V. The native
`isTypeOne_and_forall_exists_pow_smul_eq_zero_iff_exists_linearEquiv_dfinsupp_ladderModule`
and `isTypeOne_and_isLocallyFiniteModule_iff_exists_linearEquiv_dfinsupp_ladderModule`
say that type 1 plus locally nilpotent E,F is equivalent to a direct sum of
L_m^+ and to local finiteness plus type 1. For the forward implication
PBW bounds the E powers on each vector, the F powers on each resulting
E^cv, and the K powers on their finite weight spans. The native predicate `TauCeti.UqSl2.IsSignedTypeOne` means algebraic spanning
by K eigenvectors with eigenvalues in {±q^k}. The native
`TauCeti.UqSl2.isSignedTypeOne_and_forall_exists_pow_smul_eq_zero_iff_isLocallyFiniteModule`
says that this condition characterizes
unrestricted local finiteness when combined with E,F local nilpotence.
The one-dimensional L_0^- (K=−1,E=F=0) is locally finite
and locally nilpotent but not type 1:
`TauCeti.UqSl2.LadderModule.not_isTypeOne` proves this for every L_m^-. Thus the unsigned integral-weight
condition is not equivalent to unrestricted local finiteness.

The defining objects have the following API.

- Local finiteness gives an arbitrary algebraic direct sum of finite signed simples and the evaluation isomorphism.
- Signed integral weights plus local nilpotence of both ladders characterize local finiteness; positive integral weights select the positive family.

**Checks.**

- L₀⁻ has one-dimensional cyclic span, E¹=F¹=0 and K=−1; at q=1/2 no q^z is −1. Thus local finiteness is true and type 1 is false.
- In the algebraic direct sum of countably many L₀⁺, every nonzero vector has cyclic dimension 1 and E=F=0, while the whole module has infinite dimension. Finite total dimension is not required.
- In the Verma module of highest weight 1, F^jv₀ is nonzero for every j and its weights are 4^j at q=1/2; it has signed integral weights but its highest cyclic span is infinite-dimensional. Local nilpotence of F excludes it.
- On the zero module the cyclic dimension is 0, the eigenvector span is the whole zero space, and n=0 already annihilates its only vector; both sides of the equivalence hold.

*Needs:* §§8.1–8.3; Mathlib algebraic direct sums, cyclic submodules and Zorn maximality. The stated finite-cyclic-submodule and PBW argument derives this extension from §8.3; Virelizier §3.2 supplies the type-1 convention.

### 8.5 Tensor, dual and explicit Clebsch–Gordan theory

For any Hopf algebra
H over a field k, the finite Hopf-module category over k is the native
`TauCeti.FiniteHopfModuleCat k H`, a type synonym
of native `CategoryTheory.ObjectProperty.FullSubcategory` on
`ModuleCat.{u} H` for k:Type u and H:Type v, whose restriction
along `algebraMap k H` is finite-dimensional over k. The carrier
universe is u, so the unit k, k-duals and tensor-over-k stay in the
category and match native FDRep. Its finite-basis shrink
equivalence `ofShrink` with `ofShrinkEquiv` carries higher-universe finite
modules to these small models,
with linear comparison maps and transported H-actions, following native
`FDRep.ofShrink` and `FDRep.ofShrinkEquiv`. Prove compatibility with
the tensor, dual and forgetful structures constructed here. Use native
`ModuleCat.restrictScalars` and its morphisms; the forgetful functor
lands in native `FGModuleCat.{u} k`. The category instance on the synonym,
the faithful forgetful functors to `ModuleCat.{u} k` and `FGModuleCat.{u} k`
and their compatibility are native:
`TauCeti.FiniteHopfModuleCat.forgetToModule`,
`TauCeti.FiniteHopfModuleCat.forgetToFiniteModule` and
`TauCeti.FiniteHopfModuleCat.forgetToFiniteModuleCompIso`.
Its native
`MonoidalCategory` structure has tensor over k through the coproduct,
and the counit unit action; do not inherit tensor over H from a
commutative-H ModuleCat instance. Its tensor intertwiners,
associator and unitors are those of
`TauCeti.FiniteHopfModuleCat.instMonoidalCategory`, and
`TauCeti.FiniteHopfModuleCat.forgetToModule` is
monoidal by the instance of
`TauCeti/Algebra/Category/FiniteHopfModuleCat/Monoidal.lean`. For H=k[G],
restrict native `Rep.equivalenceModuleMonoidAlgebra` to finite objects
and identify this monoidal category, duals and trivial-pivot structure
with PivotalSpherical Layer7’s `FDRep k G`. Consume Layer7’s
`RigidCategory (FDRep k G)`, constructed from its canonical
`LeftRigidCategory (FGModuleCat k)` and native `Action` rigid instances,
together with Mathlib’s existing right duals. For H=k[G], prove the
generic S⁻¹ left dual and its evaluation/coevaluation agree with these
canonical duals, using S⁻¹=S. Prove the monoidal
equivalence comparison rather than treating the native unbundled
categorical equivalence as already monoidal. Right duals via S with native `ExactPairing` triangle identities are
`TauCeti.FiniteHopfModuleCat.instRightRigidCategory`.
Given `Function.Bijective (HopfAlgebra.antipode)`, the
inverse left dual and named `RigidCategory` data are `TauCeti.FiniteHopfModuleCat.leftDual` and
`TauCeti.FiniteHopfModuleCat.rigidCategory`, installed locally
in every statement using its left duals, pivot, pivotal traces,
dimensions or dual-compatible Clebsch–Gordan and 6j maps. For g:H with native
`IsGroupLikeElem k g` (Mathlib `RingTheory/Coalgebra/GroupLike.lean`)
and S²=Ad(g), consume
`GroupLike.toUnits k ⟨g,hg⟩` and native antipode/inverse laws.
Such a g makes S bijective,
`TauCeti.HopfAlgebra.antipode_bijective_of_antipode_antipode`; write hS for
that proof. The double-dual trivialization j_V(v)(φ)=φ(gv), an H-linear
isomorphism natural in V from the identity functor to
`TauCeti.doubleRightDualFunctor`, is
`TauCeti.FiniteHopfModuleCat.unitEvalNatIso`; for group-like g it is monoidal,
`TauCeti.FiniteHopfModuleCat.unitEvalNatIso_isMonoidal`. Bundle the two as a
`TauCeti.PivotalCategory` structure on `TauCeti.FiniteHopfModuleCat k H` with
the rigid structure `TauCeti.FiniteHopfModuleCat.rigidCategory hS`, whose right
duals are `instRightRigidCategory`.
Instantiate this generic category at U_q and g=K⁻¹, which is group-like by
`TauCeti.UqSl2.comul_kInv` and `counit_kInv` and satisfies S²=Ad(K⁻¹) by
`TauCeti.UqSl2.antipode_antipode`.
The normalized
highest vectors `clebschGordanVector` and the actual intertwiners
`TauCeti.UqSl2.clebschGordanEquiv` give
L_m^ε⊗L_n^δ≃⊕_(j=0)^min(m,n) L_(m+n−2j)^(εδ).
Pin the highest vector as Σ_(i=0)^j α_i v_i⊗v_(j−i), with
α₀=1 and α_(i+1)=−δ q^(m−2i)
[n−j+i+1]_q/[m−i]_q α_i for 0≤i<j; these are
`TauCeti.UqSl2.clebschGordanCoeff`, the denominators are nonzero in this range,
and `TauCeti.UqSl2.e_smul_clebschGordanVector` derives E w_j=0 for j≤m from
the specified ΔE and ladder actions. The extension of this highest-vector map
along the normalized F ladder to each summand is
`TauCeti.UqSl2.clebschGordanInclusion`.
For r≥0 the symmetric quantum binomial formulas, native
`TauCeti.UqSl2.comul_e_pow` and `comul_f_pow`, are
Δ(E^r)=Σ_(s=0)^r q^(s(r−s)) [r choose s]_q
E^s K^(r−s)⊗E^(r−s) and
Δ(F^r)=Σ_(s=0)^r q^(s(r−s)) [r choose s]_q
F^(r−s)⊗F^s K^(−(r−s)), derived from q²-commutation.
The inverse Clebsch–Gordan maps and the 6j change of decomposition on
triple products in the α₀=1 and normalized F-ladder bases are
`clebschGordanProjection` and `TauCeti.UqSl2.clebschGordanRecouplingEquiv`.
Prove their naturality and their Biedenharn–Elliott
pentagon identity on L_a^ε⊗L_b^δ⊗L_c^ζ⊗L_d^θ under the actual associator,
and compatibility with dual evaluation and coevaluation.
Both tensor orders of the sign representation, with their basis
rescalings, are `TauCeti.UqSl2.LadderModule.signTensorEquiv` and
`tensorSignEquiv`. Finite duals are the
corresponding signed simples by the explicit antipode intertwiners
`TauCeti.UqSl2.LadderModule.contragredientEquiv`, comparing the
U_q right/left duals and pivot with the generic construction above. For this
pivotal structure identify the native traces: `TauCeti.rightTrace` sends f to
tr_V(gf) and `TauCeti.leftTrace` sends f to tr_V(g⁻¹f), under the right duals
of `instRightRigidCategory`. At U_q, where g=K⁻¹, they coincide for all module
endomorphisms (`TauCeti.UqSl2.trace_lsmul_k_comp_eq_trace_lsmul_kInv_comp`),
giving `TauCeti.SphericalCategory`. Ordinary weight characters are
`TauCeti.UqSl2.formalCharacter`; give the representation ring.
The common pivotal dimension is ε[m+1]_q on L_m^ε;
it is [m+1]_q on the positive family. These statements
use algebraic tensors and the constructed Hopf module actions, independent
of Q1–Q7's C*-tensor-category construction.

The defining objects have the following API.

- The finite Hopf-module category has tensor over the base field, counit unit, antipode duals and the specified faithful forgetful functors.
- A group-like pivot implements S² and gives pivotal traces; the rank-one signed category is spherical.
- Normalized Clebsch–Gordan maps obey the stated recurrence, invertibility, dual compatibility and pentagon.

**Checks.**

- At q=1/2, m=n=j=1, α₀=1 and α₁=−1/2; ΔE annihilates v₀⊗v₁−(1/2)v₁⊗v₀ because its top coefficient is 1/2−1/2=0.
- For r=2, the middle coefficient in Δ(E²) is q[2]_q=5/4=1+q², while using q⁻¹[2]_q would give 5.
- On L₁⁺, g=K⁻¹ has trace 5/2, as does g⁻¹. On L₀⁻, both traces are −1, so discarding the sign changes the pivotal dimension.
- For L₁⊗L₁, dimensions give 4=3+1; for L₀⁻⊗L₀⁻ the resulting sign is + and dimension 1. For H=k[C₂], S=S⁻¹ sends the nonidentity generator to itself, so the two dual actions agree.

*Needs:* §§8.1–8.4; Mathlib ModuleCat, FGModuleCat, ExactPairing and Rep.equivalenceModuleMonoidAlgebra; PivotalSpherical Layers 0–2,7. Virelizier Lemma 2.3 and Proposition 4.1, pp.6–7,13–14; the signed normalization and trace comparisons are the displayed constructions.

### 8.6 Compact real form and the SUq(2) comparison

For real 0<q<1
the compact real form K*=K, E*=KF, F*=EK⁻¹ with its Hopf/star compatibility
is native, `TauCeti.UqSl2.instStarRing` and `instStarCoalgebra` for a
self-adjoint nonzero parameter.
On each L_m^+ the positive invariant inner product with
h₀=1 and h_j/h_(j−1)=[m−j+1]_q/([j]_q q^(m−2j)) is
`TauCeti.UqSl2.LadderModule.invariantForm`, with its star relations and K positivity
(`invariantForm_pos`, `invariantForm_k_pos`). Build the coefficient Hopf pairing
and monoidal equivalence between finite positive-K modules
(finite direct sums of the L_m^+) and
Q5/Q7's SUq(2) finite unitary corepresentations, comparing the actual
fundamental matrix [[a,−q c*],[c,a*]], cup, antipode and conjugate
conventions in the orthonormal basis v_j/√h_j. The matching cup,
written in the original ladder basis, is proportional to
v₀⊗v₁−q v₁⊗v₀. Compare the pivotal and positive intrinsic dimensions.
On the orthonormal fundamental basis pin the pairing by
(⟨K,u_ij⟩)=diag(q,q⁻¹),
(⟨E,u_ij⟩)=[[0,q^(−1/2)],[0,0]], and
(⟨F,u_ij⟩)=[[0,0],[q^(1/2),0]]. These fix its values on
a,c,a*,c* through the stated fundamental matrix. Prove both Hopf
pairing equations and the star/antipode comparison from these values,
then extend to all finite coefficients and intertwiners.
Negative-K signed modules remain in the algebraic classification; they
are not identified with this positive-K compact representation category.

The defining objects have the following API.

- The compact real involution makes every positive ladder a positive-K star representation with the stated invariant metric.
- The coefficient pairing induces the monoidal equivalence with finite unitary SUq(2) corepresentations and compares cups and dimensions.

**Checks.**

- At q=1/2, m=1, h₀=1,h₁=1/2. The adjoint of E in this metric is 2F=KF; setting h₁=1 would incorrectly give F.
- In the orthonormal basis, E has upper entry √2 and F lower entry 1/√2, while K=diag(1/2,2); their commutator is diag(1,−1).
- The ladder cup v₀⊗v₁−(1/2)v₁⊗v₀ is annihilated by ΔE and ΔF; L₀⁻ has K=−1 and is excluded by positive K.

*Needs:* §§8.1–8.5; §§5.1,7.1; Layer 3 coefficient duality. The pairing is derived from the displayed matrices and Virelizier §2.3 Hopf relations; Timmermann Chapter 6 §2 supplies the compact presentation.

### 8.7 Classical finite-module comparison

For the positive family its matrices over native ℤ[v,v⁻¹], with the
Laurent-polynomial quantum integers, are `TauCeti.UqSl2.ladderMatrixE`,
`ladderMatrixF`, `ladderMatrixK` and the diagonal `ladderMatrixH` with entries
[m−2j]_v. Their evaluation at v=1 is the classical module
`TauCeti.UqSl2.ClassicalLadder` on native `sl (Fin 2) ℂ`, pinning E,F,H
through `IsSl2Triple`, and `TauCeti.UqSl2.ClassicalLadder.equivSl2Std` is
its Lie-module isomorphism with the standard highest-weight m module. Give an
actual module isomorphism to RepresentationTheory/LieHighestWeight's
highest-weight m action, retaining the basis normalization rather
than identifying two separately chosen ladder or symmetric-power bases.
This is an explicit representation-family specialization; substitution
into U_q's denominator presentation does not define U(sl₂).

The order within Q8 is presentation/PBW/Hopf → weights/Verma/simple modules
→ Casimir/finite splitting → local finiteness and tensor theory → the
compact/classical comparisons. Section 8.6 additionally consumes Q5/Q7's compact
coefficient core; Q1–Q7 have no dependency on Q8. Generic higher-rank and
root-of-unity quantized enveloping algebras are separate from the rank-one
classification specified here.

The defining objects have the following API.

- Laurent-polynomial ladder matrices specialize to the highest-weight sl₂ module with an actual Lie-module comparison.
- The comparison preserves the chosen basis normalization and does not specialize the denominator quotient as an algebra.

**Checks.**

- At v=1,m=1, E=[[0,1],[0,0]], F=[[0,0],[1,0]], H=diag(1,−1); [E,F]=H and [H,E]=2E.
- At v=1,m=2, F coefficients are 1,2,0 and E coefficients 0,2,1; [E,F]=diag(2,0,−2). At m=0 all three matrices are zero.
- The Laurent expression [2]_v=v+v⁻¹ specializes to 2, while the totalized rational formula at v=1 gives 0/0=0. Only the Laurent-family specialization gives the classical action.

*Needs:* §8.2; Mathlib LaurentPolynomial, LieModule, sl and IsSl2Triple; RepresentationTheory/LieHighestWeight, sl₂ worked example. Derivation: specialize the Laurent form of Virelizier Example 3.3 after the indicated ladder-basis rescaling.

### Examples

The signed one-dimensional ladders, the fundamental two-dimensional module and their three-dimensional sum test the full generic classification.

### Dependencies

§8.1 → §8.2 → §8.3 → §§8.4–8.5. Section 8.5 additionally uses PivotalSpherical Layers 0–2,7; §8.6 uses Layers 3,5,7; §8.7 uses RepresentationTheory/LieHighestWeight. Layers 1–7 do not consume Layer 8.

## Downstream consumers

The rank-one comparison in QuantumEnvelopingAlgebras QEA1 and the stable
Hopf-module construction in HopfologicalAlgebra §2.1 consume Layer 8.
CategoricalOperatorAlgebras CA1a–CA2a consume §0.1's C*-categories and their
Karoubi completion, Hilb_f, the Hilbert-module C*-category, standard solutions,
intrinsic dimension, the unitary dual functor and signed self-dualities.
TemperleyLiebOperatorAlgebras 1.3 and 2.1 consume §0.2's sign map over every
commutative ring with its Markov-trace relation, and the identification of the
trace radical with the negligible ideal at every complex loop parameter.

## References

- R. Longo and J. E. Roberts, [*A Theory of Dimension*](https://arxiv.org/abs/funct-an/9604008v1) (1996 preprint), §2, pp.4–5, and Appendix, pp.48–49, for C*-categories; §3, pp.10–18, especially Lemma 3.3 and Theorems 3.8,3.11, for standard solutions and dimension. Section 0.1 transports the strict-category formulas with native associators and unitors.
- S. Neshveyev and L. Tuset, [*Compact Quantum Groups and Their Representation Categories*](https://folk.universitetetioslo.no/sergeyn/papers/CQGRC.pdf) (2013), Theorem 1.4.2, p.9, for the orthogonality relations, whose weight ρ is the transpose of F̃; Theorem 1.6.6, p.18, for the invariant functional on a Hopf *-algebra generated by unitary coefficients, with its normalization and two invariance equations in Step 1; Definition 1.7.1, p.21, for the Woronowicz characters; Theorem 1.7.3, p.22, for the modular identity `h(ab)=h(bσ_(−i)(a))`; Proposition 1.7.7, p.23, for the Kac equivalences; §2.2, pp.29–36, for conjugate objects and intrinsic dimension, and §2.5, pp.52–54, for the signed cup–cap projections of a self-conjugate object; their sign parameter is the negative of the zigzag sign ε used here.
- J. Kustermans and S. Vaes, [*Locally compact quantum groups*](https://www.numdam.org/item/ASENS_2000_4_33_6_837_0/), Ann. Sci. École Norm. Sup. 33 (2000), Definition 2.1, p.853, for the bi-C*-algebra axioms that §1.1's classical example satisfies.
- Timmermann, [*An Invitation to Quantum Groups and Duality*](https://doi.org/10.4171/043) (EMS, 2008),
  Proposition 2.2.4 and Remark 2.2.2(iv)(c) for algebraic integral
  faithfulness and its strict-positivity consequence; strict positivity
  here also uses the explicit positive Haar-functional hypothesis and is
  not analytic Haar faithfulness on an arbitrary completion;
  Chapters 3 and 5: Definitions 5.1.1,5.1.4, Theorem 5.1.6;
  Theorem 5.3.3, Propositions 5.3.7–5.3.8; Theorems 5.4.1,5.4.3,5.4.5.
  Theorem 3.2.12 proves coefficient-based compact-type positivity;
  Propositions 3.2.9,3.2.17 and Theorem 3.2.19 give the two F conventions
  and modular characters. Chapter 6 §§2,4 supplies matrix examples.
- Bédos–Murphy–Tuset, [*Co-Amenability of compact quantum groups*](https://arxiv.org/abs/math/0010248),
  Theorems 2.2,2.8,3.6 and Corollary 2.9, pp.6,10–11,18–19,
  for the general completion/counit/character criteria; Theorem 2.12
  and Corollary 2.13, pp.13–14, for the signed interior SUq(2) result.
- The q=−1 matrix-function model, its monomial invariance calculation
  and endpoint character are direct constructions specified here.
  The interior geometric-series Haar formula is not applied at q=±1.
- Malacarne, [*Woronowicz Tannaka–Krein duality and free orthogonal quantum
  groups*](https://arxiv.org/abs/1602.04807v1), Theorems 1.1,4.1,
  Lemmas 1.2, 2.1 and 3.1 and the proof of Theorem 4.1, preprint pp.2–6:
  reconstruction, intertwiner recovery and the filtered finite-generator
  argument.
- Banica, [*The representation theory of free orthogonal quantum
  groups*](https://arxiv.org/abs/math/9806063), Proposition 1, Lemma 1,
  Proposition 2 and Theorem 1, pp.1–4. The valid infinite-fusion range
  is n≥2, as in its abstract; the one-dimensional presentation gives
  the separate ℤ/2 boundary case.
- Mathlib `RingTheory/HopfAlgebra`, `RingTheory/Bialgebra`,
  `Algebra/Star/Unitary` and matrix star/tensor APIs fix the algebraic
  vocabulary. Tau Ceti's `Comodule/MatrixCoefficient/{Matrix,FromMatrix}`
  fixes the matrix orientation and inverse-antipode identities.
  Use these existing algebraic interfaces and §0.1's analytic dagger
  structure for all required additions.
- Virelizier, [*Quantum groups*](https://www.math.virelizier.com/sources/cours/QuantumGroupM2.pdf),
  §§2.3–4.1, for the fixed rank-one Hopf convention, type-1 finite modules
  and fusion. The Verma/center, signed generalized-weight splitting,
  locally finite/Zorn theorem, explicit Clebsch–Gordan maps, compact
  pairing and classical specialization in Q8 are direct mathematical
  developments specified here, not claims that those source sections
  prove every extension. The reusable σ-derivation construction is also
  specified intrinsically.
- Etingof–Gelaki–Nikshych–Ostrik,
  [*Tensor Categories*](https://math.mit.edu/~etingof/egnobookfinal.pdf),
  §§5.1–5.3 for bialgebra/Hopf representation categories and duals,
  as supplementary background. Q8 specifies its own module
  classification, quantum function-algebra comparison and conventions.
- Mathlib `Algebra/SkewPolynomial/Basic.lean` constructs the zero-derivation
  skew extension on `SkewMonoidAlgebra`. Q8's σ-derivation construction
  uses its finitely supported coefficient design with an explicit σ and
  proves the comparison for δ=0 under the induced local action instance.
- [AlgebraicAnalysis's derivation-Ore construction](https://github.com/itpplasma/algebraic-analysis/blob/fbb7bb423146c1300807ec971e8a9eb5ac86303b/AlgebraicAnalysis/Ore/Associativity.lean)
  proves faithful normal forms, associativity and the universal property
  for σ=id over a noncommutative coefficient ring (the declarations
  rightMul_assoc_of_ring and oreLift). Q8 requires general σ-derivations; it
  extends this mathematical scope.
