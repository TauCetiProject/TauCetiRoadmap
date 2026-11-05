# Roadmap: global shtukas and Langlands over function fields, part II — Ramanujan and Arthur weights

**Summary.** Build a general library of arithmetic Frobenius weights for reductive local and global parameters over function fields. Starting with the cuspidal excursion decomposition, curve weights, local representation theory and the local spherical unitary dual, prove geometric boundary propagation, the Gan–Harris–Sawin discrete-series pure-completion theorem, and the generic Ramanujan theorem in its central-compact sector. Develop elliptic and stack realizations, discrete-spectrum parametrization interfaces, and complementary-series propagation; conclude with the elimination of extraneous real Satake points using ramified weight arrays. The Arthur interfaces distinguish these weight theorems from the conjectural construction of a single global Arthur homomorphism.

## Scope and ownership

GlobalShtukasAndFunctionFieldLanglands stops at semisimple global parameters, Satake compatibility and the Genestier–Lafforgue comparison at every place: §§5.3–5.10 and 7.6–7.9. This Part II owns the arithmetic-weight consequences and the Fargues–Scholze comparison by local-to-global uniformization. It imports the parent's global stacks, cohomology and excursion operators without constructing them again. Section 3.0 owns their equal-characteristic local Fargues–Scholze application, using the abstract centre map and Schur-object reconstruction of LanglandsParameterStacks §§2.15 and 3.9. In §3.1 the analytic local-shtuka tower and its period map come from HeckeStacksAndLocalShtukas §HS2.9; this roadmap owns the equal-characteristic formal model, its generic-fibre identification and the local-to-global uniformization morphism.

FunctionFieldArithmetic §§6.2–6.6 owns automorphic function modules, constant terms, Harder finiteness for every connected reductive group, integral models, algebraic Hecke eigenvalues and normalized spherical Hecke actions. Its nonsplit finiteness is used at the same generality. SmoothRepresentationsOfLocalGroups §§SR.0.2, SR.0.4, SR.1.3, SR.2.2, SR.3.1–SR.3.4 and SR.4.1–SR.4.2 owns the smooth category, coefficient change, simple Hecke modules, induction and Jacquet functors, cuspidal support, tempered support, Casselman's criterion and normalized Satake. Its §SR.5.2 owns the raw linear Weil–Deligne fields, linear operations and monodromy construction. ArithmeticGaloisRepresentations §2.6 owns the linear monodromy filtration and arithmetic purity; DeligneWeightsAndPurity §§0.1–0.19, 5.2–5.11 and 8.17–8.18 owns scalar weights, their comparison with that purity, curve weight–monodromy and the fixed-embedding weight filtration. Here purity for reductive parameters is a specialization through algebraic representations, with a separate adjoint boundedness predicate.

LanglandsParameterStacks §§0.1–0.4, 1.13–1.15 and 2.5 owns parameter carriers, the group-valued Weil–Deligne dictionary and semisimplification. NilpotentOrbits §§N0–N2 owns adjoint orbits, Jacobson–Morozov and conjugacy of triples; algebraic highest-weight modules of the dual group and their Weyl characters come from ReductiveGroups §§10A–10B, and the sl₂ strings and Lie-character comparisons from RepresentationTheory/LieHighestWeight Layers 0 and 6. MotivesAndAlgebraicCycles §6.3 owns tensor generation and the closed-immersion criterion. SmoothRepresentationsOfLocalGroupsPartII owns the local spherical theory that Layers 5 and 8 consume: real parts of Satake parameters, the generic unitary spherical dual of a split adjoint group with its half-integral points, the fundamental-representation separators and the local generic temperedness test (SmoothRepresentationsOfLocalGroupsPartII §§5.1–5.28); the τ-fixed dual group, the unitary transfer to the split companion, the nonsplit temperedness test and the odd unitary residual point (SmoothRepresentationsOfLocalGroupsPartII §§6.1–6.4); and the Aubert involution of every connected reductive group, Kazhdan–Lusztig parameters, the nilpotent strata of the spherical dual, spherical complementary series, centralizer reduction and the extraneous-point lists (SmoothRepresentationsOfLocalGroupsPartII §§7.1–7.13). These are imported, not restated. Section 5.1 keeps the global test family of algebraic L-group representations and the reduction of an unramified semisimple group to its absolutely simple adjoint factors, and §8.0 keeps the recognition of real Satake classes by weight multiplicities. Those local theorems concern real or central-compact Satake parameters, and every global theorem here that uses them retains that hypothesis.

Section 4.0 owns the all-prime étale Kloosterman anchor for a split semisimple dual group, the invariant-parameter match, the specialized oper singularity space, its quantized Hitchin comparison and parahoric localization/eigenvalue theorem, the Bessel companion construction and the adjoint rigidity needed for it, and the transfer of adjoint conductors and inertia invariants. General opers, their function algebras and coordinate descent come from FormalConnectionsOpers §§F4–F5 and F8.4; critical vacuum and completed centers come from AffineLieAlgebras §§A7–A8. The rigid Kloosterman F-isocrystal of every rank and André's bound of the largest p-adic break by the largest formal slope are PadicDifferentialEquationsAndRigidCohomology §§RD.6.94–RD.6.97. The Newton polygons, monodromy classification, functoriality and classical and hypergeometric realizations of Bessel F-isocrystals for reductive groups belong to KloostermanSheavesAndBesselIsocrystals (Layers KB.5–KB.11) and are not used here. General crystalline-companion existence, counting local systems, special cycles, Tate cohomology and potential automorphy are outside this roadmap’s scope. The global Arthur decomposition is a conjectural interface in §7.2, not a consequence of equality of weight multiplicities.

## Conventions

Let X be a smooth projective geometrically connected curve over the finite field k₁ of cardinality q₁ and characteristic p, and K its function field. A local field F has equal characteristic p and finite residue cardinality q≥2. For a closed point w, write q_w=q₁^deg(w). Let ℓ≠p. Algebraic representations are finite dimensional over a characteristic-zero algebraically closed coefficient field; continuous arithmetic representations have a finite extension of ℚ_ℓ as coefficient model. Choose embeddings ℚ̄→ℚ̄_ℓ and ℚ̄→ℂ; a fixed-ι assertion uses one extension ℚ̄_ℓ≅ℂ, while an arithmetic assertion quantifies over every such embedding and includes algebraicity. A constant étale line requires an ℓ-adic-unit Frobenius value; a Weil line has no such integrality restriction. The examples with constant Frobenius 3 over 𝔽₄ use ℓ=5; the constant lines over 𝔽₂ with values 1+i and 1+2i use ℓ=7, so both values are coefficient-field units.

For reductive G, use the finite Galois L-group ᴸG=Ĝ⋊Γ from ReductiveGroupsPartII §§RG2.5.1–RG2.5.2. Parameters preserve the projection to Γ; semisimple means complete reducibility for this finite extension, not irreducibility of every algebraic realization. Irreducible parameters lie in no proper dynamic parabolic. Keep the outer Frobenius component separate from the dual-torus compact factor. A local Weil parameter has finite inertia image; an adic representation with quasi-unipotent inertia is first converted to Weil–Deligne form. All stacks and categories are formed in fixed nested universes, finite-rank realization spaces in the smaller universe, and conjugacy classes in the next universe. No unrestricted class of all sheaves is used as a type.

Geometric Frobenius has degree +1, and reciprocity sends a uniformizer to geometric Frobenius. Fix √q and compatible half Tate twists. A Tate twist by 1 multiplies geometric Frobenius by q⁻¹ and subtracts weight 2. Write a normalized Satake class as s_c·q^ν when G is split at the place, and as (s_c·q^ν, Fr) with the outer Frobenius component Fr kept separate and ν fixed by Fr when G is unramified nonsplit there (§2.3); on the q^ν-eigenspace containing a weight μ of an algebraic L-group representation, every Frobenius eigenvalue has weight 2⟨μ,ν⟩. These choices use the c-group charts of SmoothRepresentationsOfLocalGroups §SR.4.2. For Weil–Deligne data, r(w)Nr(w)⁻¹=q^(−deg(w))N, so N lowers weights by 2. If φ is the associated Weil×SL₂ parameter with e the upper generator, r(w)=φ(w,diag(q^(−deg(w)/2),q^(deg(w)/2))) and N=dφ(e). Arthur evaluation instead uses diag(q_w^(1/2),q_w^(−1/2)); its neutral weight multiset is unchanged by negation.

At finite level choose a factorizable compact open U=∏w U_w and a finite set S containing all places where G or the level is ramified. For w∉S choose the hyperspecial U_w. A cuspidal or discrete representation is accompanied by an occurring excursion block when a parameter is used; a Hecke isotypic space alone need not specify that block. Write m(π) for the spectral multiplicity and m_U(π)=m(π) when π^U≠0, with m_U(π)=0 otherwise. Positive occurrence means m_U(π)>0; it is distinct from dim π^U. A good-place-compatible hypothetical parameter carries a separate compatibility hypothesis at every ramified place used as an anchor.

**Checks.**

- At q=4 the Tate line has eigenvalue 1/4 and weight −2; its inverse has eigenvalue 4 and weight 2. This fixes the reciprocity and Tate directions.
- With r(Frob)=diag(1,4), Ne₁=e₀ and Ne₀=0, rNr⁻¹=N/4 and weights are 0,2. Thus N maps weight 2 to weight 0 and N:gr₂→gr₀ is an isomorphism; reversing the sign fails this two-term witness.
- For PGL₂, diag(2,1/2) in the dual SL₂ at q=4 has Satake exponents ±1/2 and weights ±1. The Arthur upper diagonal and the Weil–Deligne lower diagonal are inverse representatives with the same Weyl orbit.
- At degree 2 over 𝔽₄, eigenvalue 2 becomes 4 and q_w becomes 16: 2 log₄2=2 log₁₆4=1. Comparing numerical Frobenius values without changing q would double the weight.
- The zero vector space has empty weight multiset and is pure of every weight. An assertion of a unique common weight requires positive rank. A residue field of cardinality 1 does not occur; at formal q=1 the eigenvalue 1 would have every weight.

## Exact supplier contracts

### From Mathlib

At the pinned Mathlib, use `Finsupp` in Mathlib/Data/Finsupp/Defs.lean and `Finsupp.sum` in Mathlib/Algebra/BigOperators/Finsupp/Basic.lean, `Finset.sum_comm` in Mathlib/Algebra/BigOperators/Group/Finset/Sigma.lean and `Finset.sum_eq_single` in Mathlib/Algebra/BigOperators/Group/Finset/Basic.lean for the finite-array statement of §8.4. Its margins use `Finsupp.mapDomain` in Mathlib/Data/Finsupp/Basic.lean along the two coordinate projections. Use `Representation`, `LinearMap`, finite-dimensional vector spaces and the native `AlgebraicGeometry.Scheme` as underlying carriers. None of these names denotes an arithmetic local system or a reductive L-parameter. The scalar sums have their ordinary empty-support value zero.

### From Tau Ceti

Use the native smooth discrete representations from TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean through SmoothRepresentationsOfLocalGroups §SR.0.2, and the existing group and character infrastructure through its supplier contracts. The local Weil group of a nonarchimedean local field in the sense of Mathlib's `IsNonarchimedeanLocalField`, which includes F = k((t)), is `TauCeti.ClassFieldTheory.WeilGroup` with its degree `TauCeti.ClassFieldTheory.weilDegree` (TauCeti/NumberTheory/ClassFieldTheory/WeilGroup/Basic.lean). That degree is normalized arithmetically: arithmetic Frobenius lifts have degree 1, so the geometric degree of Conventions is its negative. TauCeti/NumberTheory/ClassFieldTheory/WeilGroup/Topology.lean gives it the Weil topology, a Hausdorff group topology in which inertia is an open subgroup with its profinite topology. No L-group-valued parameter, Weil–Deligne completion or local parametrization is defined on it at the pin. The newform Satake pair in TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean concerns classical newforms and does not supply the reductive local Satake class of this roadmap. No Tau Ceti module is imported by the acceptance file.

### From TauCetiRoadmap.GlobalShtukasAndFunctionFieldLanglands

Consume §§1.4, 1.9–1.14 (stack coefficients, normalized geometric Satake and nonsplit descent), 2.1–2.5 and 2.9–2.10 (bounded global shtukas, cohomology, Frobenius and fusion), 3.6, 3.10 and 3.12 (Hecke comparison and finiteness), 4.8 and 4.12 (realization functors and full Weil descent), 5.3–5.10 (excursions, reconstruction and split/nonsplit decomposition), 6.1–6.2 (constant twists and companions), and 7.6–7.9 (local parameters and every-place semisimple comparison). Every parameter retains its finite coefficient field, projection and occurrence hypotheses. Global cohomology with Satake coefficients is not identified with constant coefficients.

### From TauCetiRoadmap.FunctionFieldArithmetic

Consume §5.8 (Chebotarev) and §§6.1–6.6, specifically arbitrary connected-reductive cusp finiteness in §6.4, integral models and algebraic Hecke eigenvalues in §6.5, and normalized Hecke–Satake in §6.6. A reductive global representation has the compatible central character and central lattice of §6.2.

What FunctionFieldArithmetic must provide (gap:function-field-simple-trace-formula): The connected-reductive function-field Deligne–Kazhdan simple trace formula, with finiteness of both sides, for test functions supported on regular elliptic classes and having a supercuspidal matrix-coefficient factor.

What FunctionFieldArithmetic must provide (gap:poincare-series-globalization): Prescribed-central-character Poincaré-series globalization of finitely many supercuspidal local components of a connected reductive group over a global function field, every other component being a constituent of a principal series induced from a minimal parabolic.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

Consume §§SR.0.2 (the smooth category), SR.0.4 (*coefficient-change*), SR.1.3, SR.2.2, SR.3.1–SR.3.4, SR.4.1–SR.4.2 and SR.5.2 (*wd-raw-parameters*) on the domains specified in Scope. The Casselman criterion includes a unitary central character even for a torus; tempered support uses normalized induction from a discrete series on a rational Levi. Descent of finite-length constituents also uses admissibility and a finite-dimensional Hecke image, not coefficient change alone.

What SmoothRepresentationsOfLocalGroups must provide (gap:discrete-series-pseudo-coefficients): Pseudo-coefficients for discrete series of every connected reductive group over every local function field, and the implication that nonzero trace against one forces common cuspidal support.

What SmoothRepresentationsOfLocalGroups must provide (gap:elliptic-orthogonality-open-subgroups): Orthogonality of elliptic discrete-series characters on finite-index open subgroups of the rational points, giving nonvanishing of some elliptic regular orbital integral of a pseudo-coefficient.

What SmoothRepresentationsOfLocalGroups must provide (gap:discrete-series-number-field-model): Number-field descent of an arbitrary complex discrete-series representation of a semisimple group over a local function field, independently of pseudo-globalization with only common cuspidal support.

What SmoothRepresentationsOfLocalGroups must provide (gap:reductive-central-reduction): Reduction of reductive discrete series through unramified central twists and central isogenies or z-extensions, preserving discrete series and the fixed-embedding adjoint parameter, with unitary central part giving bounded full Weil part.

What SmoothRepresentationsOfLocalGroups must provide (gap:spherical-isogeny-transfer): Transport of spherical unitarity and genericity across central isogenies of unramified connected reductive groups over every local function field, with compatible hyperspecial and Whittaker data and lifted Satake classes, using the actual image of the rational points and its cokernel; no finite-index or openness assumption is imposed on an inseparable isogeny, whose cokernel can be infinite.

What SmoothRepresentationsOfLocalGroups must provide (gap:tempered-spherical-generic): Genericity of every tempered spherical representation of every unramified quasi-split group for the specified Whittaker datum.

What SmoothRepresentationsOfLocalGroups must provide (gap:parameter-square-root-transport): Comparison of the two normalized c-group charts under every coefficient automorphism, identifying their canonical finite central unramified normalization cocycle and its compatibility with local excursion parameters.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroupsPartII

Consume SmoothRepresentationsOfLocalGroupsPartII §5.1 (*real-satake-parameter*: the compact and positive parts of a Satake parameter and its real part ν), SmoothRepresentationsOfLocalGroupsPartII §§5.3–5.5 (tempered spherical criterion, irreducibility of unramified principal series, generic spherical criterion), SmoothRepresentationsOfLocalGroupsPartII §§5.7–5.12 and 5.27 (the generic unitary spherical region, its classification and the Hecke-algebra signature comparison in every characteristic), SmoothRepresentationsOfLocalGroupsPartII §§5.23–5.26 (half-integral generic unitary points, the fundamental separators, the local generic temperedness test and the noncentral G₂ witness), SmoothRepresentationsOfLocalGroupsPartII §§6.1–6.4 (τ-fixed dual group, nonsplit unitary transfer and temperedness test, the odd unitary residual point) and SmoothRepresentationsOfLocalGroupsPartII §§7.1–7.13 (Aubert involution and its semisimple parameter, Kazhdan–Lusztig parameters, nilpotent strata Sph(G,O∨), spherical complementary series CS(G,O∨), centralizer reduction, extraneous real parts and their classical and exceptional lists, the E₈ 4A₁ exclusion, and the noncentral-compact reduction). Its spherical statements are for quasi-simple split adjoint groups and for quasi-simple adjoint unramified nonsplit groups over every nonarchimedean local field, including local function fields; the temperedness test and the extraneous lists assume a real or central-compact Satake parameter. Its Aubert involution has no splitting hypothesis. In its classical extraneous lists the shift on an orthogonal multiplicity factor so(r) is along ε_⌊r/2⌋, which for r=4 is not a fundamental coweight.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

Consume §§3.1–3.4 (finite wild image, breaks, Swan and Artin conductors and their functoriality) and §2.6 (Jordan strings, the monodromy filtration, its uniqueness and tensor compatibility, and arithmetic Weil–Deligne purity), together with the raw local fields of SmoothRepresentationsOfLocalGroups §SR.5.2. The arithmetic condition quantifies over all complex conjugates; finite-dimensional characteristic-zero spaces are retained.

### From TauCetiRoadmap.DeligneWeightsAndPurity

Consume §§0.1–0.19 (scalar weights, eigenvalue arithmetic and the comparison with monodromy-graded purity), §§5.2–5.5 and 5.11–5.12 (Weil sheaves, real mixedness, normalization and curve weight–monodromy), §§7.8–7.9 (scheme direct images), and §§8.5, 8.17–8.18 (six operations, fixed-ι decomposition and weight filtration). The absolute splitting in §1.1 is stronger than fixed-ι splitting and has its own proof from laf02 Corollaire VII.8.

What DeligneWeightsAndPurity must provide (gap:stack-integer-weights): For every finite-type morphism from a finite-type algebraic stack to a smooth finite-field curve, integer punctual weights of every lisse irreducible constituent of each constant-coefficient compact direct image, with the smooth-descent and duality hypotheses stated.

What DeligneWeightsAndPurity must provide (gap:satake-constant-realization): A realization theorem expressing the lisse constituents selected from Satake intersection-cohomology coefficients, including frozen-leg factors and finite centralizer invariants, as constituents of constant-coefficient compact direct images of finite-type algebraic stacks.

### From TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology

Consume §§RD.2.49–RD.2.51 (Robba tensor categories, logarithmic fibres and inertia with its nilpotent operator), RD.3.13 and RD.3.25 (overconvergent coefficients), RD.4.10–RD.4.12 and RD.5.46 (rigid cohomology, finiteness and duality), RD.6.23 (trace formula), RD.6.51–RD.6.55 (local conductors, formal slopes and Euler characteristics), RD.6.64–RD.6.65 (Tannakian reconstruction), RD.6.77 and RD.6.84–RD.6.85 (purity and cohomological weights), RD.4.58–RD.4.59 (de Rham–rigid specialization and cospecialization and the forget-supports square) and RD.6.94–RD.6.97 (the rigid Kloosterman F-isocrystal of every rank; item 3 of RD.6.97 is André's theorem that a solvable differential module with algebraic-number coefficients, meromorphic at infinity and analytic on the exterior annulus, has largest p-adic break at most its largest formal slope at infinity, applied before extending constants). Section 4.0 constructs the Bessel tensor functor and proves its comparison and rigidity; these do not follow from the coefficient carriers alone.

What PadicDifferentialEquationsAndRigidCohomology must provide (gap:rigid-middle-extension-specialization): Intermediate extensions, relative de Rham–rigid specialization and duality for exponential twists of intersection-cohomology coefficients on bounded Hecke charts, including the middle-image comparison and compatibility with fusion and finite coefficient extension.

What PadicDifferentialEquationsAndRigidCohomology must provide (gap:pure-isocrystal-geometric-semisimplicity): Geometric semisimplicity of pure overconvergent F-isocrystals on smooth finite-field curves after forgetting Frobenius, giving reductive geometric Tannakian monodromy.

### From TauCetiRoadmap.LanglandsParameterStacks

Consume §§0.1–0.4, 1.13–1.15, 2.5, 2.15, 3.2–3.6 and 3.9: crossed cocycles with prescribed projection, geometric degree, group-valued monodromy, the abstract excursion centre map, Schur-object reconstruction and continuity. The equality q^(−deg(w)) scales N with geometric Frobenius. Nilpotence in an algebraic Lie algebra is the scheme-theoretic nilpotent cone, not nilpotence of a matrix over an arbitrary nonreduced coefficient ring.

### From TauCetiRoadmap.ReductiveGroupsPartII

Consume §§RG2.3–RG2.4 (parahoric and hyperspecial models, rational Levi groups and modulus characters) and §§RG2.5.1–RG2.5.2 (dual groups, finite pinned Galois action, the L-group, its standard Levi subgroups, the dual maps of finite central isogenies, products and z-extensions, and the L-group of a Weil restriction). Central isogenies are not presumed surjective on rational points.

What ReductiveGroupsPartII must provide (gap:normal-image-l-homomorphisms): For a homomorphism Υ:G₁→G₂ of connected reductive groups over a field whose image N is normal and whose kernel contains a smooth connected normal subgroup K₀ of G₁ with ker(Υ)/K₀ central in G₁/K₀, the pinned Γ-equivariant L-homomorphism ᴸΥ:ᴸG₂→ᴸG₁, well defined up to Ĝ₁-conjugacy and compatible with composition, central isogenies, products and Levi inclusions.

### From TauCetiRoadmap.ReductiveGroups

Consume Layer 10, §§10A–10B: the finite-dimensional rational representation category of a split connected reductive group with its actual character lattice and weight decomposition, scalar extension, integration of distribution-algebra actions, induced and Weyl modules and their simple heads, giving the algebraic highest-weight modules V(λ) of the split simply connected dual group over the characteristic-zero coefficient field together with their Weyl characters. These are the algebraic test modules of §5.1 and the characters used in the recognition theorem of §8.0. RepresentationTheory/LieHighestWeight Layers 0 and 6 supplies only the differentiated sl₂ strings and Lie-character comparisons; a Lie-algebra module is not by itself a representation of Ĝ_sc⋊Γ.

### From TauCetiRoadmap.MotivesAndAlgebraicCycles

Consume §6.3: tensor generation by a faithful closed representation of an affine algebraic group and the subquotient/closed-immersion criterion, with the dual, finite sums and finite tensor powers included. This is used by §0.2, rather than the unrelated Frobenius trace constructions of a differential-equation roadmap.

### From TauCetiRoadmap.NilpotentOrbits

Consume §§N0–N2, especially N2.1 (triples and group homomorphisms), N2.2 (neutral-element conjugacy) and N2.4 (named orbit classes). The zero orbit uses (0,0,0); it is not a nonzero embedded sl₂. RepresentationTheory/LieHighestWeight Layers 0 and 6 supplies the sl₂ strings used with these objects; character separation of semisimple classes uses the algebraic Weyl characters of ReductiveGroups §§10A–10B.

What NilpotentOrbits must provide (gap:exceptional-named-orbit-profiles): Orbit-to-triple identifications and adjoint neutral-weight profiles for F4 B3 and A1 plus short A1, E7 D5(a1) plus A1, and E8 D6, A6, A4 plus A2, and A2 plus two A1, in the coordinates of Ciubotaru–Harris §6.

### From TauCetiRoadmap.FormalConnectionsOpers

Consume §§F4–F5 and F8.4: intrinsic opers with their Borel reductions, Drinfeld–Sokolov coordinates, regular and punctured oper function algebras, evaluation characters and coordinate descent over characteristic-zero fields. Use the opposite Borel when writing the principal nilpotent as the sum of positive simple-root vectors. Section 4.0 owns the global singularity conditions and parahoric localization comparison specialized to the Kloosterman datum.

### From TauCetiRoadmap.AffineLieAlgebras

Consume §§A7–A8: the critical vacuum center, completed enveloping algebra and Feigin–Frenkel identification with regular and punctured dual-oper functions, with their filtrations, evaluation characters and coordinate compatibility. These are the local critical-center inputs to the specialized global quantization and localization in §4.0.

### From TauCetiRoadmap.HeckeStacksAndLocalShtukas

Consume §§HS0.1–HS0.4, HS1, HS2.9, HS3.1–HS3.4 and HS4.1, HS4.7: modifications, Beauville–Laszlo gluing, general-local-field analytic towers with their étale period maps, Satake-coefficient cohomology and the coherent continuous categorical Hecke datum. Section 3.1 constructs the equal-characteristic formal model and identifies its generic fibre with that supplied tower; its uniformization morphisms retain their precise sources and targets.

### From TauCetiRoadmap.DiamondEtaleCohomology and TauCetiRoadmap.DiamondSixOperations

Consume DiamondEtaleCohomology Layer C0 (sites, coefficient categories and descent), and DiamondSixOperations §§S1.2, S1.5 and S2.1–S2.4 (proper supports, smooth hypercovers, composition and base change). The source, target and compactifiability hypotheses of the local-to-global cohomology map are checked on bounded shtuka charts in §3.1. SchemeAndStackFoundations Layers 1–2 and EtaleCohomologyFoundations §§F.0–F.4 supply the algebraic-stack descent and curve adic realization underneath the global parent.

## How to read the build

Layers 0 and 1 pass from local geometricity and monodromy to weights of global curve systems. Layer 2 attaches those systems to cuspidal excursion blocks. Layer 3 compares the local constructions and proves geometricity functoriality; Layer 4 provides the discrete-series anchor. Layer 5 combines integral weights with the local spherical criterion to prove generic Ramanujan. Layer 6 gives the elliptic and conditional constant-stack routes. Layer 7 specifies exactly which discrete parameters and Arthur data are supplied, and Layer 8 uses their global weights, local monodromy and finite arrays to propagate complementary series and eliminate extraneous points. Each conditional theorem includes its mathematical input as a hypothesis; the weight theorems do not assert Arthur's conjectural global decomposition.

## Layer 0: Geometric local parameters and pure completions

### 0.1 Geometric local L-homomorphisms

Let G be a connected reductive group over F and ϕ: W_F → LG(C) a continuous semisimple L-homomorphism (compatible with the projection to the Galois factor). For a finite-dimensional algebraic representation τ: LG → GL_N write ρ(ϕ, τ) = τ ∘ ϕ. The parameter ϕ is geometric when, for a faithful τ, every eigenvalue λ of ρ(ϕ, τ)(Frob) is a Weil q-number of integer weight: λ is algebraic over Q and there is w(λ) ∈ ℤ with |σ(λ)| = q^(w(λ)/2) for every field embedding σ: Q(λ) → ℂ. The weight multiset of ϕ along τ is the multiset of the w(λ), counted with algebraic multiplicity. The same definition applies with C = ℚ̄_ℓ, and to a Weil-group representation W_F → GL_N(C) (the case LG = GL_N). The zero-dimensional realization has an empty multiset; weights are unique for each nonzero eigenvalue because q≥2.

Throughout this statement, F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W_F its Weil group and Frob ∈ W_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^(1/q)); C is an algebraically closed field of characteristic 0 (C = ℂ or C = ℚ̄_ℓ). Frobenius conventions are those of the parent roadmap: geometric Frobenius, local reciprocity sending a uniformizer to geometric Frobenius, and one fixed square root of q for normalized induction and half Tate twists. The Weil parameter is Frobenius-semisimple and has finite inertia image. Finite inertia is an admissibility hypothesis here; an ℓ-adic representation with quasi-unipotent inertia is first converted to its Weil–Deligne representation. A semisimple algebraic representation alone is not used as a substitute for this hypothesis.

(ch26, §2.3, Definition 2.5, p. 7; ch26 line 323.)

*Proof route:* The eigenvalues of τ(ϕ(Frob)) are those of an endomorphism of a finite-dimensional space, so the Weil-number predicate of DWP.0 applies to each of them. Independence of the chosen faithful τ and of the Frobenius lift is the theorem §0.2; the definition fixes one faithful τ and one lift.

The construction has the following API.

- The predicate on a semisimple L-homomorphism ϕ: W_F → LG(C): for a faithful τ, all eigenvalues of τ(ϕ(Frob)) are Weil q-numbers of integer weight.
- For geometric ϕ and an algebraic τ, the finite multiset of integer weights of the eigenvalues of τ(ϕ(Frob)) with algebraic multiplicity.
- ϕ is geometric iff the condition holds for one faithful τ iff it holds for every algebraic τ (§0.2).
- If f: LG → LH is an algebraic L-homomorphism and ϕ is geometric then f ∘ ϕ is geometric; if f is injective the converse holds.
- For a field automorphism γ of C, transport both the group data and the algebraic realization: ϕ is geometric iff its transport is, and corresponding weights agree.
- weights(τ ⊗ τ′) is the multiset of sums and weights(τ^∨) the negatives of weights(τ).

**Checks.**

- For G = G_m over F₄((t)) and ϕ unramified with ϕ(Frob) = 2, ϕ is geometric with weight multiset {1} along the identity representation.
- For G = G_m over F₄((t)) and ϕ(Frob) = 3, ϕ is not geometric: no integer w satisfies 3 = 4^(w/2).
- The trivial parameter of any G is geometric with all weights 0.
- For G = G_m and ϕ(Frob) = e^(i) ∈ ℂ, ι-purity of weight 0 holds for the inclusion, but ϕ is not geometric since e^(i) is transcendental.
- For G = G_m over F₅((t)) and ϕ(Frob) = (3+4i)/5, ϕ is geometric of weight 0 although ϕ(Frob) has infinite order: its conjugates (3±4i)/5 have absolute value 1.
- For G = GL₂ over F₄((t)) and ϕ unramified with ϕ(Frob) = diag(2,3), the weights are 1 and log₂3: the first summand is geometric and ϕ is not. This is the generalized-eigenspace form of the integer-weight purity of DeligneWeightsAndPurity §0.7.

*Needs:* DeligneWeightsAndPurity §0.1; DeligneWeightsAndPurity §0.7; LanglandsParameterStacks §§0.1–0.4.

### 0.2 Geometricity is independent of the realization

Let ϕ: W_F → LG(C) be a continuous semisimple L-homomorphism. (a) If the eigenvalues of τ₀(ϕ(Frob)) are Weil q-numbers of integer weights for one faithful τ₀, then for every algebraic representation τ of LG the eigenvalues of τ(ϕ(Frob)) are Weil q-numbers of integer weights. (b) The condition does not depend on the Frobenius lift: for Frob′ = Frob·σ with σ in inertia, the eigenvalues of τ(ϕ(Frob′)) are Weil q-numbers of the same weights. (c) For an algebraic L-homomorphism f: LG → LH, geometricity of ϕ implies that of f ∘ ϕ, with equivalence when f is a closed embedding.

Throughout this statement, F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W_F its Weil group and Frob ∈ W_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^(1/q)); C is an algebraically closed field of characteristic 0 (C = ℂ or C = ℚ̄_ℓ). τ₀ is faithful: its kernel is trivial as a group scheme. The parameter has finite inertia image, as in §0.1.

(ch26, §2.3, Definition 2.5, p. 7; ch26 line 323.)

*Proof route:* (a) A faithful representation of an affine algebraic group is a tensor generator: every algebraic τ is a subquotient of a finite sum of τ₀^(⊗a) ⊗ (τ₀^∨)^(⊗b) (MotivesAndAlgebraicCycles §6.3, the tensor-generator and closed-immersion criteria). Eigenvalues of tensor products and duals are products and inverses of eigenvalues (DeligneWeightsAndPurity §0.13), and eigenvalues of a subquotient are among those of the ambient endomorphism; Weil q-numbers of integer weight are closed under products and inverses (DeligneWeightsAndPurity §0.2). (b) By the finite-inertia hypothesis ϕ(I_F) is finite, say of order m, normalized by ϕ(Frob). Some power ϕ(Frob)^N with N ≥ 1 commutes with ϕ(I_F); then ϕ(Frob′)^(Nm) = ϕ(Frob)^(Nm), so the eigenvalues of τ(ϕ(Frob′)) are Nm-th roots of those of τ(ϕ(Frob))^(Nm). A root of a Weil q^(Nm)-number of weight w is a Weil q-number of weight w (DeligneWeightsAndPurity §0.3). (c) τ ∘ f is an algebraic representation of LG, so (a) applies; for a closed embedding f a faithful representation of LH restricts to a faithful one of LG.

**Checks.**

- For G = SL₂ (Ĝ = PGL₂) and ϕ unramified with ϕ(Frob) = diag(q^(1/2), q^(−1/2)) (the trivial representation), the adjoint representation has eigenvalues q, 1, q^(−1) with weights 2, 0, −2.
- If the condition held only for a non-faithful τ (say the trivial representation) nothing would follow; faithfulness is needed.
- For the two-dimensional standard representation of S₃, take tame inertia C₃ and Frobenius a transposition, at q=5. The Frobenius eigenvalues are 1,−1 and both weights are 0; multiplying the transposition by a 3-cycle gives another transposition and the same weight multiset. At q=4, cyclic C₃ inertia with trivial Frobenius image also has all weights 0, since 4≡1 modulo 3. At q=5 that trivial Frobenius image would force the inertia image to be trivial, since Frobenius inverts C₃. This tests finite inertia on a nonabelian group as well as a cyclic one.

*Needs:* §0.1; DeligneWeightsAndPurity §0.13; DeligneWeightsAndPurity §0.2; DeligneWeightsAndPurity §0.3; MotivesAndAlgebraicCycles §6.3 (tensor generation).

### 0.3 Pure Weil–Deligne representations and parameters

For a Frobenius-semisimple finite-inertia parameter r:W_F→ᴸG(C), define arithmetic purity of its Weil–Deligne completion (r,N) through the monodromy-graded purity of ArithmeticGaloisRepresentations §2.6. For semisimple G, require weight 0 after every finite-dimensional algebraic representation of ᴸG. For reductive G define fixed-ι essential temperedness separately: the Weil part of the associated Weil×SL₂ parameter has bounded image after projection to the adjoint group. The linear comparison is DeligneWeightsAndPurity §0.19. In explicit eigenweight notation the arithmetic condition of common weight w says N lowers the weight filtration by 2 and N^j:gr_(w+j)→gr_(w−j) is an isomorphism for all j≥0; the fixed-ι version uses integer 2 log_q|ι(λ)| and omits the all-conjugates assertion. Pure completion never means that every faithful realization of a reductive group has one common weight.

Throughout this statement, F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W_F its Weil group and Frob ∈ W_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^(1/q)); C is an algebraically closed field of characteristic 0 (C = ℂ or C = ℚ̄_ℓ). Frobenius conventions are those of the parent roadmap: geometric Frobenius, local reciprocity sending a uniformizer to geometric Frobenius, and one fixed square root of q for normalized induction and half Tate twists. The Weil part has finite inertia image. A direct summand below is a Weil–Deligne direct summand, respecting both ϕ and N.

(ch26, §2.3, Definition 2.6, p. 7; ghs, §3.1, Definitions 3.1–3.3, p. 8; ty, §1, Lemma 1.4(3)–(6) and proof, pp.6–7; ty line 201.)

*Proof route:* Specialize the supplied linear monodromy filtration through each algebraic representation. The relation r(Frob)N=q⁻¹Nr(Frob) gives the downward weight shift. Compare this with the group-valued Weil–Deligne dictionary; the reductive analytic predicate is tested in the adjoint quotient.

The construction has the following API.

- For semisimple G the weight-0 condition is tested on every algebraic realization, and is invariant under conjugacy and coefficient transport.
- For reductive G adjoint boundedness is insensitive to central Weil twists; the full boundedness criterion also retains the central character.
- Tensor products, duals and Weil–Deligne direct summands of each algebraic realization obey the imported linear purity laws; arbitrary subquotients can have different weights.
- At a fixed ι, weight-0 purity in GL_n agrees with boundedness of the associated Weil part. Arithmetic purity adds algebraicity and the same weight at every embedding.

**Checks.**

- Sp(2) with ϕ(Frob) = diag(1, q) and N e₁ = e₀ is pure of weight 1.
- diag(1, q) with N = 0 is not pure: gr₂ ≠ 0 = N(gr₂).
- N = 0 and ϕ(Frob) = λ·id with λ a Weil q-number of weight w: pure of weight w.
- With the printed directions of Ciubotaru–Harris Definition 2.6 (N raising weights in (iii) while (ii) needs N to lower them), Sp(2) would fail (ii) or (iii); the corrected definition accepts it.
- For Sp(2), ker N = ⟨e₀⟩ is pure of weight 0 and V/ker N is pure of weight 2; neither is pure of the ambient weight 1.
- For G_m and ϕ(Frob)=q, the identity representation is pure of weight 2, while the faithful identity ⊕ trivial representation with N=0 has weights 2 and 0 and is not pure of any common weight.
- For a rank-one WD representation with Frobenius a unit-circle root of x⁴−x³−x²−x+1, the chosen complex realization is bounded and ι-pure of weight 0, but the representation is not arithmetically pure of weight 0: another conjugate has absolute value 1.7221….

*Needs:* LanglandsParameterStacks §§1.13–1.15; DeligneWeightsAndPurity §0.1; §0.1; NilpotentOrbits §N2; ArithmeticGaloisRepresentations §2.6; DeligneWeightsAndPurity §0.19; SmoothRepresentationsOfLocalGroups §SR.5.2.

### 0.4 Uniqueness of pure completions

For a fixed ι, a Frobenius-semisimple GL_n Weil–Deligne representation is ι-pure of weight 0 exactly when the Weil restriction of its associated Weil×SL₂ parameter is bounded. For any connected reductive group, a given Frobenius-semisimple finite-inertia parameter has at most one completion with adjoint-bounded Weil part at ι, up to Ĝ-conjugacy. For a semisimple group, an arithmetic weight-0 completion is consequently unique if it exists. The fixed-ι equivalence does not imply arithmetic purity.

Throughout this statement, F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W_F its Weil group and Frob ∈ W_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^(1/q)); C is an algebraically closed field of characteristic 0 (C = ℂ or C = ℚ̄_ℓ). C = ℂ for boundedness; for C = ℚ̄_ℓ transport by a field isomorphism ℚ̄_ℓ ≅ ℂ (ι-purity).

(ghs, §3.1, Lemma 3.5 and its proof, p. 9; ty, §1, Lemma 1.4(3)–(6) and proof, pp.6–7; ghs line 384.)

*Proof route:* For GL_n decompose the WD representation into special representations Sp(r); ι-purity of weight 0 says that the primitive Weil constituents have exactly the shifts cancelling the SL₂ weights, hence the associated Weil part is bounded. Taylor–Yoshida Lemma 1.4(3) compares its arithmetic version with temperedness at every embedding; it does not remove that quantifier. For uniqueness use Gan–Harris–Sawin Lemma 3.5(b): after projection to the adjoint group the Weil part is bounded; its centralizer is reductive, and its SL₂ lies in the derived subgroup of the identity component. The neutral element is determined by the real Frobenius part of the given semisimple parameter. Apply neutral-element conjugacy to that semisimple derived Lie algebra (NilpotentOrbits §N2.2 and NilpotentOrbits §N2.1). Lift back through the finite central isogeny; a connected SL₂ has no nontrivial morphism into the central torus. Unbounded central Weil characters do not affect this uniqueness argument.

**Checks.**

- For GL₂ and ρ unramified with ρ(Frob) = diag(q^(1/2), q^(−1/2)) (weights 1 and −1), the pure completion is the Steinberg parameter with N ≠ 0; N = 0 is not pure.
- For GL₂, diag(1,q²) has no essentially tempered completion: with N=0 its two real Weil exponents differ, while the WD relation prevents a nonzero N from joining eigenvalues whose ratio is q².

*Needs:* §0.3; NilpotentOrbits §N2.

### Examples

At q=4 the unramified torus value 2 has weight 1, while 3 has weight log₂3 and is not geometric. The two-term special representation has weights 0 and 2 and common monodromy weight 1.

### Dependencies

DeligneWeightsAndPurity §0.1; DeligneWeightsAndPurity §0.7; LanglandsParameterStacks §§0.1–0.4; DeligneWeightsAndPurity §0.13; DeligneWeightsAndPurity §0.2; DeligneWeightsAndPurity §0.3; MotivesAndAlgebraicCycles §6.3 (tensor generation); LanglandsParameterStacks §§1.13–1.15; NilpotentOrbits §N2; ArithmeticGaloisRepresentations §2.6; DeligneWeightsAndPurity §0.19; SmoothRepresentationsOfLocalGroups §SR.5.2. Each target states its statement and proof-route inputs separately.

## Layer 1: Curve weights and boundary propagation

### 1.1 Constant-field twist decomposition of a lisse sheaf

Let V be a smooth curve over a finite field k₁ and L a lisse ℚ̄_ℓ-sheaf on V. Call two continuous characters χ, χ′: Gal(k̄₁/k₁) → ℚ̄_ℓ^× equivalent when χ′χ^(−1)(Frob) is a Weil q₁-number of some integer weight. Then L decomposes uniquely as L = ⊕_([χ]) L_χ ⊗ χ, the sum over representatives of the equivalence classes, where each L_χ is mixed with integer weights in the absolute sense (every Frobenius eigenvalue at every closed point is a Weil number of integer weight, with no choice of ι) and almost all L_χ vanish. The summand of the trivial class is the largest subsheaf with integer weights; L has integer weights iff L = L_1. For each ι: ℚ̄_ℓ ≅ ℂ this refines Deligne's decomposition by ι-weights modulo ℤ.

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. V is smooth over k₁ (a dense open of a curve), L is lisse, χ is pulled back from Spec k₁.

(laf02, Chapitre VII, Proposition VII.7 and Corollaire VII.8, pp. 200–202; ch26, §5, proof of Theorem 5.4, equation (5.5), p. 14; laf02 line 11609.)

*Proof route:* Each irreducible constituent P of L is χ_P ⊗ P₀ with det P₀ of finite order (DeligneWeightsAndPurity §5.5). By L. Lafforgue (Théorème VII.6 and Proposition VII.7; GlobalShtukasAndFunctionFieldLanglands §6.2) the Frobenius eigenvalues of P₀ are algebraic with all complex conjugates of absolute value 1, i.e. P₀ is pure of weight 0 in the absolute sense. Group the constituents by the class of χ_P; on the summand attached to a class choose one representative χ and write χ_P = χ·(χ_Pχ^(−1)) with χ_Pχ^(−1) pure of integer weight; this gives L_χ mixed with integer weights. Use L. Lafforgue Corollaire VII.8 directly for the absolute constant-twist decomposition, including the splitting of extensions between distinct twist classes. DeligneWeightsAndPurity §§8.17–8.18 supplies the analogous fixed-ι decomposition; disjoint spectra by itself proves no-Hom, not the required Ext vanishing.

The construction has the following API.

- The finite set of equivalence classes [χ] with L_χ ≠ 0.
- The summand L_χ ⊗ χ attached to a class, functorial in L.
- L ≅ ⊕_([χ]) L_χ ⊗ χ, unique up to unique isomorphism given the representatives.
- The class components of L ⊗ L′ are the sums over products of classes.
- L has integer weights at every closed point iff L equals its trivial-class component.
- For each ι the class components refine Deligne's decomposition of L by ι-weights modulo ℤ (DeligneWeightsAndPurity §§8.17–8.18).

**Checks.**

- On Spec F₄ the rank-one sheaf with Frobenius 3 has a single nontrivial class and trivial-class component 0.
- The Tate twist ℚ̄_ℓ(−1) (Frobenius q₁) lies in the trivial class: it has integer weight 2.
- With ℓ=7, on Spec F₂ the character with Frobenius 1 + i lies in the trivial class (Weil 2-number of weight 1), while Frobenius 1 + 2i does not (|1 + 2i| = √5 is no half-integral power of 2).
- For a fixed ι the weight-mod-ℤ decomposition of DeligneWeightsAndPurity §8.17 can be strictly coarser: a non-Weil algebraic unit-circle value and the value 1 both have ι-weight 0.

*Needs:* DeligneWeightsAndPurity §5.5; GlobalShtukasAndFunctionFieldLanglands §6.2; GlobalShtukasAndFunctionFieldLanglands §6.1; DeligneWeightsAndPurity §8.17; DeligneWeightsAndPurity §0.17; DeligneWeightsAndPurity §0.2.

### 1.2 One geometric boundary place makes a local system geometric

Let L be a lisse ℚ̄_ℓ-sheaf on V = X ∖ |S| and u ∈ S a missing place with local Weil representation ρ_u of W_(K_u) on the generic geometric fibre. If ρ_u^(ss) is geometric (§0.1 with G = GL_n), then: (a) for every w ∉ S the Frobenius eigenvalues of ρ_w(Frob_w) are Weil q_w-numbers of integer weights; (b) L has a unique increasing filtration W_• by lisse subsheaves with gr_i = W_i/W_(i−1) punctually pure of weight i, and dim gr_i equals the number n(i) of Frobenius eigenvalues of weight i at any w ∉ S, independently of w; (c) the Weil–Deligne representation of W_(K_u) on (gr_i L) at u is pure of weight i (§0.3).

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. S is a nonempty finite set of places and L is lisse on X ∖ |S|; the same conclusions hold when u is a place where L is unramified and ρ_u(Frob_u) has Weil-number eigenvalues.

(ch26, §2.4, Proposition 2.7, p. 8; laf02, Corollaire VII.8, pp. 201–202; ch26 line 353.)

*Proof route:* Decompose L = ⊕ L_χ ⊗ χ by §1.1; each L_χ ⊗ χ is a sum of pieces χ′ ⊗ P with P pure of weight 0 for every ι and χ′ in the class of χ. Deligne's local weight–monodromy theorem (DeligneWeightsAndPurity §5.11) for P at u: the monodromy graded pieces have Frobenius eigenvalues of ι-weight i for every ι, with i read off from the monodromy filtration, which does not depend on ι; hence these eigenvalues are Weil numbers (DeligneWeightsAndPurity §0.6). Geometricity of ρ_u^(ss) forces χ′(Frob_u) = χ′(Frob)^(deg u) to be a Weil number of integer weight, so every class is trivial; L has integer weights and (a) follows at w ∉ S (DeligneWeightsAndPurity §0.3). (b) is Deligne's punctual weight filtration for a lisse mixed sheaf with integer weights (DeligneWeightsAndPurity §8.18); the count n(i) is constant in w because gr_i is pure of weight i. (c) gr_i L is lisse and punctually pure of weight i, so DeligneWeightsAndPurity §5.11 gives monodromy graded pieces of weight i + j at u, which is purity of weight i in the sense of Layer 0.

**Checks.**

- For the Kloosterman sheaf Kl_n on G_m over F_q (pure of weight n − 1, tame at 0 with unipotent monodromy), the place u = 0 is geometric and W_• has the single nonzero graded piece gr_(n−1) = Kl_n.
- The rank-one sheaf with Frobenius 3 on G_(m,F₄) is not geometric at any place, and the conclusion fails.

*Needs:* §1.1; DeligneWeightsAndPurity §5.11; DeligneWeightsAndPurity §0.6; DeligneWeightsAndPurity §0.3; DeligneWeightsAndPurity §8.18; §0.3; §0.1.

### 1.3 Purity of irreducible Ĝ-valued local systems

Let Ĝ be semisimple over ℚ̄_ℓ and σ: Gal(K^sep/K) → Ĝ(ℚ̄_ℓ) continuous, unramified outside a finite set, such that V ∘ σ is ι-mixed for one faithful V (automatic on curves by §1.1). If the image of σ lies in no proper parabolic subgroup of Ĝ, then V ∘ σ is ι-pure of weight 0 for every representation V of Ĝ. For LG-valued σ with Ĝ semisimple the same argument applies when parabolic subgroups of LG are taken in the dynamic sense (GHS Lemma 3.6 and Remark 3.7 note that the argument holds for any reductive G, giving a common weight for each irreducible algebraic representation; semisimplicity of Ĝ forces the weight to be 0 as in the last step below).

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. ι: ℚ̄_ℓ ≅ ℂ is fixed; the conclusion is then for every ι, since the hypothesis is ι-independent. Fixed-ι mixedness permits real weights. Apply the decomposition modulo ℤ followed by a constant twist before using DeligneWeightsAndPurity §§8.17–8.18 integer-indexed weight filtrations; alternatively use the real-weight version of the argument in Sawin–Templier §11.

(st, §11, Lemma 11.4 and its proof, p. 83; ghs, §3.2, Lemma 3.6 and Remark 3.7, pp. 9–10; st line 4018.)

*Proof route:* Use the real-weight filtration on an ι-mixed sheaf, as in Sawin–Templier §11, Lemma 11.4, p.83. DeligneWeightsAndPurity §§8.17–8.18 gives its integer-weight case; after splitting by weights modulo ℤ and applying constant twists it supplies the required filtration on the separate summands. The Frobenius cocharacter construction below is the real-weight version and must use the full faithful representation, not a single irreducible summand. At an unramified place v let T be a maximal torus containing the semisimple part of Frob_v; the linear function ω(χ) = log|ι(χ(Frob_v^(ss)))| on characters of T is increasing along the filtration, and the stabilizer is the subgroup generated by T and the root subgroups on which ω is ≤ 0, since a root operator shifts a T-weight χ to χ+α and must preserve the increasing weight filtration. That parabolic is proper unless ω vanishes on all roots; as Ĝ is semisimple, ω then vanishes on all characters of T, so V ∘ σ is pure of weight 0.

**Checks.**

- For Ĝ = SL₂ and σ = χ ⊕ χ^(−1) with χ(Frob) of weight 1 the image lies in a Borel subgroup and the weights are ±1: the irreducibility hypothesis is necessary.
- For Ĝ = SL₂ and σ the monodromy of the Legendre family twisted by q^(−1/2), σ is irreducible and pure of weight 0.
- At q=4, diag(2,1/2) has weight −1 line ⟨e₂⟩. Its increasing weight filtration is preserved by the lower Borel: the negative-root operator sends e₁ to e₂, while the positive-root operator sends e₂ outside that line. At diag(1,1) both weights are 0 and the stabilizer is all SL₂, an improper parabolic.

*Needs:* DeligneWeightsAndPurity §8.18; §1.1; DeligneWeightsAndPurity §5.3.

### 1.4 Local Weil–Deligne purity of irreducible global parameters

Let G be semisimple over K and σ a continuous semisimple global Galois parameter whose image lies in no proper parabolic of LG. At every place u, the Frobenius-semisimple WD representation of τ ∘ σ|_(W_(K_u)) is arithmetically pure of weight 0 for every algebraic τ. Its LG-valued WD completion is therefore the unique essentially tempered completion at every ι. For a general reductive group the corresponding assertion is about the adjoint projection; a common arithmetic weight for every τ is not asserted.

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands §5.10).

(ghs, §3.2, Lemma 3.6 with its proof and Corollary 3.8, pp. 9–10; Remark 3.13, p. 11; ghs line 408.)

*Proof route:* By §1.3, τ ∘ σ is pure of some weight (weight 0 for semisimple G) for every τ. Deligne's local monodromy theorem (DeligneWeightsAndPurity §5.11) gives that the i-th monodromy graded piece at z is pure of weight w + i; so the Frobenius eigenvalues are Weil numbers and the weight filtration is the monodromy filtration, which is condition (iii) of purity. Uniqueness is §0.4.

**Checks.**

- For G = PGL₂ and σ attached to a cuspidal π with π_z Steinberg, the local parameter at z is Sp(2) twisted to weight 0, pure with N ≠ 0.

*Needs:* §1.3; DeligneWeightsAndPurity §5.11; §0.3; §0.4.

### Examples

A rank-one constant twist by 3 over 𝔽₄ has a nontrivial twist class. The normalized Legendre system has weight 0 after its half Tate normalization; its boundary special representation retains nonzero monodromy.

### Dependencies

DeligneWeightsAndPurity §5.5; GlobalShtukasAndFunctionFieldLanglands §6.2; GlobalShtukasAndFunctionFieldLanglands §6.1; DeligneWeightsAndPurity §8.17; DeligneWeightsAndPurity §0.17; DeligneWeightsAndPurity §0.2; DeligneWeightsAndPurity §5.11; DeligneWeightsAndPurity §0.6; DeligneWeightsAndPurity §0.3; DeligneWeightsAndPurity §8.18; §0.3; §0.1; DeligneWeightsAndPurity §5.3; §0.4. Each target states its statement and proof-route inputs separately.

## Layer 2: Cuspidal blocks and rational Satake classes

### 2.1 Cuspidal representations belonging to a parameter

Let A₀(G,U,E) be the cusp module with its full level-U Hecke action and its commuting global excursion action. Use the generalized excursion decomposition A₀(G,U,ℚ̄_ℓ)=⊕σ A₀(G,U,ℚ̄_ℓ)_(λ(σ)) and let Φ(U) consist of its nonzero blocks. An occurring irreducible π with π^U≠0 belongs to σ when there is a nonzero full-level-Hecke-equivariant map from π^U⊗ℚ̄_ℓ into that block. Such a map is injective because its source is simple. Its spherical Hecke character away from S is consequently λ_H(σ). Define L(σ,τ) as the semisimple lisse sheaf τ∘σ on X∖|S| for an algebraic representation τ of ᴸG; write L(π,τ) only together with the chosen σ. This occurrence relation retains the block needed at ramified places; agreement of good-place Hecke eigenvalues alone is its weaker numerical consequence. For connected reductive G fix a torsion-free discrete central subgroup Ξ ⊂ Z(A_K) with Z(K)∖Z(A_K)/((Z(A_K)∩U)Ξ) finite, replace A₀(G,U,E) by the Ξ-invariant cusp module A₀(G,U,Ξ,E) of FunctionFieldArithmetic §6.2, and use the decomposition of GlobalShtukasAndFunctionFieldLanglands §5.10; the relation is then defined by the same words. A cuspidal Π enters it only when its central character is trivial on Ξ. A central character of finite order is trivial on a finite-index subgroup of any such Ξ, which is again such a subgroup, so every cuspidal Π with central character of finite order occurs for a suitable Ξ (the class A₀(G) of ghs line 236).

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. ℚ̄ is the algebraic closure of Q inside C, and ι: ℚ̄ → C, ι_ℓ: ℚ̄ → ℚ̄_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings ℚ̄ → C, equivalently over all field isomorphisms ℚ̄_ℓ ≅ C after extension. G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands §5.10). Use the factorizable compact open U and finite set S of Conventions; outside S the chosen U_w is hyperspecial and G is unramified. In the sentence on Ξ, G is connected reductive.

(ch26, §3.1, decomposition (3.3), Lemma 3.5 and Definition 3.7, pp. 9–10; §5, equation (5.3), p. 13; ghs, §2.1, Theorem 2.1 and Corollary 2.4(i), pp. 6–7; ch26 line 466; ghs line 236.)

*Proof route:* The decomposition and the parameters σ are GlobalShtukasAndFunctionFieldLanglands §5.9 (split G) and GlobalShtukasAndFunctionFieldLanglands §5.10 (general G); the excursion algebra contains the spherical Hecke operators away from S (GlobalShtukasAndFunctionFieldLanglands §5.7, Ciubotaru–Harris Lemma 3.5). τ ↦ L(σ, τ) is a symmetric monoidal functor from Rep(LG) to semisimple lisse sheaves on X ∖ |S| (GHS Corollary 2.4(i)).

The construction has the following API.

- The occurrence relation uses an actual full-Hecke-equivariant embedding into the chosen excursion block and implies equality of the away-from-S Hecke characters.
- L(σ, τ), the lisse sheaf τ ∘ σ on X ∖ |S|.
- L(σ, τ ⊗ τ′) ≅ L(σ, τ) ⊗ L(σ, τ′), L(σ, τ^∨) ≅ L(σ, τ)^∨ and L(σ, 1) = ℚ̄_ℓ.
- For w ∉ S, det(1 − T·Frob_w | L(σ, τ)) = det(1 − T·τ(s_w)) with s_w the Satake class of λ_w(σ) (§2.2).
- Every π with m_U(π) ≠ 0 belongs to at least one σ ∈ Φ(U).

**Checks.**

- For G = PGL₂ and τ the standard representation of SL₂, L(π, τ) is the rank-two sheaf of Drinfeld's correspondence for π with trivial determinant, and tr(Frob_w) is the Hecke eigenvalue of T_w normalized by q_w^(−1/2).
- For G = PGL₂ and σ induced from a character of an unramified quadratic extension, L(π, Sym²) contains the quadratic character of that extension, so L(π, τ) need not be irreducible for irreducible τ.
- Let the multiplicity space of π^U be L², on which the excursion algebra acts through L[ε]/(ε²) with ε(e₂)=e₁ and ε(e₁)=0. The generalized block of the character ε↦0 is all of L², of dimension 2, while the ordinary eigenspace ker ε=⟨e₁⟩ has dimension 1. The occurrence relation uses the generalized block, so both lines of L² embed π^U into it; a definition through ordinary eigenspaces would see only one.
- A multiplicity space of dimension two can have two one-dimensional excursion-character spaces. Both yield the same full-Hecke simple factor π^U, so belonging is a relation; equal good-place Satake classes alone do not choose either block.
- For G=G_m over K=𝔽₄(t) and ℓ=5, the unramified character ξ(a)=3^(deg a) is cuspidal, but an element of Ξ of degree d≠0 acts by 3^d≠1, so ξ is trivial on no admissible Ξ and belongs to no σ of the Ξ-invariant decomposition; with ℓ=3 a Galois character with Frobenius value 3 would not even be continuous. Its twist by ξ⁻¹ is the trivial character, which belongs to the trivial parameter for every Ξ.

*Needs:* GlobalShtukasAndFunctionFieldLanglands §5.9; GlobalShtukasAndFunctionFieldLanglands §5.10; GlobalShtukasAndFunctionFieldLanglands §5.7; FunctionFieldArithmetic §§6.2–6.6.

### 2.2 Rationality of Lafforgue's Satake classes

For σ ∈ Φ(U) and w ∉ S let s_(w,ℓ)(σ) ∈ [LG_ss(ℚ̄_ℓ)] be the Satake class of λ_w(σ). Then s_(w,ℓ)(σ) = ι_ℓ(s_w(σ)) for a class s_w(σ) ∈ [LG_ss(ℚ̄)], and s_(w,ℓ)(σ) = [σ(Frob_w)]. Consequently the eigenvalues of τ(σ(Frob_w)) are algebraic numbers for every algebraic representation τ of ᴸG with its ℚ̄-model (a Ĝ-module without an extension to the outer action enters only through the finite induction of §5.1), and if π belongs to σ then ι(s_v(σ)) is the Satake parameter of the unitary spherical representation π_v ⊗_ι ℂ for every v ∉ S.

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. ℚ̄ is the algebraic closure of Q inside C, and ι: ℚ̄ → C, ι_ℓ: ℚ̄ → ℚ̄_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings ℚ̄ → C, equivalently over all field isomorphisms ℚ̄_ℓ ≅ C after extension. G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands §5.10). Use the factorizable compact open U and finite set S of Conventions; outside S the chosen U_w is hyperspecial and G is unramified.

(ch26, §3, Proposition 3.1, Lemma 3.2, Lemma 3.5 and Theorem 3.6 with the paragraph after it, pp. 8–10; ch26 line 446.)

*Proof route:* A₀(G, U, E) is a finite E-module with A₀(G, U, E) ⊗ C ≅ A₀(G, U, C) for noetherian Z[1/p]-algebras E ⊂ C (FunctionFieldArithmetic §6.5, ch26, Proposition 3.1, p. 8); for a large number field E the action of H^S(G, U) ⊗ E is semisimple with finitely many eigencharacters, which take algebraic values (Lemma 3.2). The Hecke part of the excursion action is the ℚ̄_ℓ-linear extension of the rational Hecke action (GlobalShtukasAndFunctionFieldLanglands §3.6). GlobalShtukasAndFunctionFieldLanglands §§5.3 and 5.9 identifies the Satake class of λ_w(σ) with [σ(Frob_w)] through the normalized Satake isomorphism (FunctionFieldArithmetic §6.6, SmoothRepresentationsOfLocalGroups §SR.4.1). Cusp forms are compactly supported modulo the centre (FunctionFieldArithmetic §6.4), so the Petersson inner product makes π ⊗_ι ℂ unitary; its spherical components are unitary.

**Checks.**

- For G = PGL₂ the class s_w(σ) is diag(α_w, α_w^(−1)) with α_w + α_w^(−1) = q_w^(−1/2) a_w, a_w the T_w-eigenvalue: algebraic, as a_w is.

*Needs:* GlobalShtukasAndFunctionFieldLanglands §3.6; GlobalShtukasAndFunctionFieldLanglands §5.9; GlobalShtukasAndFunctionFieldLanglands §5.3; GlobalShtukasAndFunctionFieldLanglands §5.10; SmoothRepresentationsOfLocalGroups §§SR.4.1–SR.4.2; §2.1; FunctionFieldArithmetic §§6.4–6.6.

### 2.3 The real part of a Satake class

For σ ∈ Φ(U), w ∉ S and an embedding ι, choose a representative s_w = (t_w, Fr_w) of ι(s_w(σ)) in T̂(ℂ)⋊⟨Fr_w⟩, where Fr_w is the outer Frobenius component of ᴸG at w (trivial when G is split at w) and t_w ∈ T̂(ℂ) is fixed by Fr_w; it is well defined up to the relative Weyl group and up to Fr_w-twisted conjugation by T̂(ℂ). Write t_w = s_c·q_w^(ν) with s_c in the maximal compact subgroup of T̂(ℂ) and ν ∈ t̂_ℝ (polar decomposition, as in SmoothRepresentationsOfLocalGroupsPartII §5.1); as t_w is Fr_w-fixed so are both factors, and ν ∈ (t̂_ℝ)^(Fr_w). The real part is ν_w^ι(σ):= ν = log_(q_w)|t_w| ∈ (t̂_ℝ)^(Fr_w), well defined up to the relative Weyl group: it is the positive component of the torus representative, with the outer Frobenius component kept separate. For an algebraic representation τ of ᴸG decompose τ into q_w^ν-eigenspaces; τ(s_w) preserves the eigenspace V_c on which q_w^ν acts by q_w^c, where c = ⟨μ,ν⟩ for every weight μ occurring in V_c, and every eigenvalue of τ(s_w) on V_c has absolute value q_w^c, including when Fr_w permutes the weight spaces inside V_c. Thus the Deligne ι-weight of each eigenvalue of τ(σ(Frob_w)) is 2⟨μ,ν⟩ for any weight μ of its eigenspace.

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. ℚ̄ is the algebraic closure of Q inside C, and ι: ℚ̄ → C, ι_ℓ: ℚ̄ → ℚ̄_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings ℚ̄ → C, equivalently over all field isomorphisms ℚ̄_ℓ ≅ C after extension. G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands §5.10). Use the factorizable compact open U and finite set S of Conventions; outside S the chosen U_w is hyperspecial and G is unramified. For nonsplit G at w the real part lies in the τ-fixed part (t̂_ℝ)^τ, as in SmoothRepresentationsOfLocalGroupsPartII §6.1.

(ch26, §5, equation (5.1) and Lemma 5.2, p. 12; ch26, §6, (6.2), p. 17; ch26 line 586.)

*Proof route:* A representative with t_w ∈ T̂(ℂ)^(Fr_w) exists because the Fr_w-twisted conjugacy classes of T̂ in the Frobenius component are the points of the coinvariant torus T̂_(Fr_w), which is connected and receives (T̂^(Fr_w))° surjectively. The polar decomposition of T̂(ℂ)^(Fr_w) = (T̂_ℝ)^(Fr_w)·(T̂_c)^(Fr_w) is unique; relative-Weyl-conjugate and twisted-conjugate representatives give relative-Weyl-conjugate real parts, the twisted conjugation t ↦ u·t·Fr_w(u)⁻¹ being by elements of T̂. On the q_w^ν-eigenspace V_c the operator τ(s_w) equals q_w^c times τ(s_c·Fr_w); s_c and Fr_w commute with q_w^ν since ν is Fr_w-fixed, and if Fr_w has order m then τ(s_c·Fr_w)^m = τ(s_c^m) lies in a compact torus, so every eigenvalue of τ(s_c·Fr_w) has absolute value 1 and every eigenvalue of τ(s_w) on V_c has absolute value q_w^c.

The construction has the following API.

- ν_w^ι(σ) ∈ (t̂_ℝ)^(Fr_w)/W_rel, the real part of ι(s_w(σ)), read on the positive component of its Frobenius-fixed torus representative, with the outer Frobenius component kept separate.
- For a weight α of τ the eigenvalues of τ(ι s_w) on the q_w^ν-eigenspace containing the α-weight space have absolute value q_w^(⟨α, ν⟩) and Deligne ι-weight 2⟨α,ν⟩; when Fr_w permutes weight spaces the eigenvectors are sums over the Fr_w-orbit of weights, all with the same pairing.
- π_w ⊗_ι ℂ is tempered iff ν_w^ι = 0 (SmoothRepresentationsOfLocalGroupsPartII §5.3 for split adjoint groups; Casselman's criterion, SmoothRepresentationsOfLocalGroups §SR.3.3, in general).
- If τ ∘ σ has eigenvalues of integer ι-weight at w then ⟨α, ν_w^ι⟩ ∈ ½ℤ for every weight α of τ (Ciubotaru–Harris (5.6)).
- Multiplying s_w by a central element of finite order does not change ν_w^ι.

**Checks.**

- For G = PGL₂ and π_w trivial, ν = ½α̂ and the standard representation of SL₂ has eigenvalue weights ±1.
- For a tempered spherical π_w, ν = 0 and all eigenvalues of τ(ι s_w) have absolute value 1.
- For PGL₂ and s = diag(q^(1/4), q^(−1/4)) (complementary series), ⟨α, ν⟩ = ¼ for a weight α of the standard representation, so s is not geometric for that representation.
- If s_w = diag(ζ, ζ^(−1)) with ζ a root of x⁴ − x³ − x² − x + 1 on the unit circle, ν^ι = 0 for ι keeping ζ on the circle and ν^(ι′) ≠ 0 for ι′ sending ζ to the Salem root 1.7221…
- For G = Res_(L/F) PGL₂ with L/F unramified quadratic and w a place of F inert in L, ᴸG = (SL₂×SL₂)⋊C₂ with Fr_w the nontrivial element of C₂, and the test module of §5.1 is the four-dimensional sum of the two standard modules with the swap action. The tempered spherical representation with t_w = 1 has Satake class (1, Fr_w), which acts on that module by the swap: eigenvalues 1, 1, −1, −1, all of weight 0 and ν = 0. It is not the identity, which is what a representative in the connected dual torus alone would give, and the eigenvalue −1 is not a dual-torus eigenvalue. Every Satake class at w projects to the nontrivial element of C₂, while every element s_c·q_w^ν of T̂ projects to 1.

*Needs:* §2.2; ReductiveGroupsPartII §§RG2.5.1–RG2.5.2 (dual torus, relative Weyl group and pinned outer action).

### Examples

For PGL₂, dual-standard normalized Frobenius (2,1/2) at q=4 has characteristic polynomial (1−2T)(1−T/2) and weights ±1; the trivial dual representation has characteristic polynomial 1−T.

### Dependencies

GlobalShtukasAndFunctionFieldLanglands §5.9; GlobalShtukasAndFunctionFieldLanglands §5.10; GlobalShtukasAndFunctionFieldLanglands §5.7; FunctionFieldArithmetic §§6.2–6.6; GlobalShtukasAndFunctionFieldLanglands §3.6; GlobalShtukasAndFunctionFieldLanglands §5.3; SmoothRepresentationsOfLocalGroups §§SR.4.1–SR.4.2; ReductiveGroupsPartII §§RG2.5.1–RG2.5.2 (dual torus, relative Weyl group and pinned outer action). Each target states its statement and proof-route inputs separately.

## Layer 3: Local-to-global comparison and geometric representations

### 3.0 Local excursion parameters

For a connected reductive group G over the equal-characteristic local field F, apply the abstract excursion centre map of LanglandsParameterStacks §2.15 and its Schur-object parameter of §3.9 to the coherent continuous Hecke datum on D_lis(Bun_G,L) exported by HeckeStacksAndLocalShtukas §§HS4.1 and HS4.7. Here L is an algebraically closed characteristic-zero coefficient field containing the chosen √q, with the relatively discrete condensed convention. For each compact lisse object, prove that one open wild-inertia subgroup acts trivially on every finite-leg Hecke transform; this supplies the finite-wild-cutoff passage (fs, Proposition IX.5.1, pp. 327–328, fs line 12683). For every Schur-irreducible A with End(A)=L as a condensed L-algebra, prove that the imported parameter φ_A is continuous and is the local Fargues–Scholze parameter. Restrict the resulting geometric centre action along D(G(F),L) → D_lis(Bun_G,L) to the Bernstein centre of smooth representations, and compare its Hecke action with the Satake-coefficient cohomology of the supplied local-shtuka tower. These are the Bun_G and Bernstein-centre applications (fs, Definition/Proposition IX.4.1, p. 327, Theorem IX.5.2, p. 329, and Proposition IX.3.2, pp. 326–327; fs line 12667, fs line 12745, fs line 12651).

The construction has the following API.

- The imported centre map, instantiated on D_lis(Bun_G,L), evaluates on a Schur-irreducible A by the invariant function of the tuple φ_A(γ_i).
- Restriction of that instantiated action along the fully faithful smooth-category inclusion preserves its scalar evaluations on irreducible admissible representations.
- On compact lisse objects the finite wild cutoffs are compatible with one another and with smaller coefficient fields carrying the Hecke data.
- The restricted central action commutes with each Hecke functor and agrees with the excursion action on the corresponding local-shtuka cohomology.

All maps have source the excursion algebra or the indicated lisse category and target its endomorphism algebra or centre. For rational characteristic-zero coefficients the component-group invertibility in Theorem IX.5.2 holds; an integral or mod-ℓ version retains that hypothesis.

**Checks.**

- For G=1 the parameter is unique and Bun_G is a point. On V=L with creation map α(1)=a and annihilation map β(z)=bz, the excursion scalar is the invariant function β∘α=ab: the unit choices a=b=1 give 1, a=2 and b=1 give 2, and a=0 gives 0. A construction returning 1 for every one-dimensional datum contradicts the evaluation rule at (a,b)=(2,1) (fs line 12671–12675).
- For G_m, an unramified character of uniformizer value a has φ_A(Frob)=a by geometric reciprocity, so values 2 and 1/2 at q=4 distinguish the inverse convention.
- For GL₂, Steinberg and the trivial representation have the same semisimple Frobenius pair (2,1/2) at q=4. Reconstructing their different monodromy operators from this scalar action alone would be incorrect.

*Needs:* HeckeStacksAndLocalShtukas §§HS3.1–HS3.4, HS4.1 and HS4.7 (local cohomology and exported Hecke datum); LanglandsParameterStacks §§2.15 and 3.9 (abstract centre map and Schur-object parameter), §§3.4–3.6 (continuity); SmoothRepresentationsOfLocalGroups §§SR.0.2, SR.1.3, SR.3.2 (smooth category and centre); DiamondEtaleCohomology Layer C0; DiamondSixOperations Layer S2.

### 3.1 Uniformization of global shtukas by local shtukas

Define the framed bounded equal-characteristic local G-shtuka moduli by torsors on the formal disc with Frobenius modification and a quasi-isogeny to the fixed trivial framing on the punctured disc. Construct the deformation functor, its formal representability and relative z-adic Hodge theory; identify its analytic generic fibre, with every finite level, with the analytic tower and étale period map of HeckeStacksAndLocalShtukas §HS2.9 (lh, Theorem 2.12, Theorem 4.9 and Proposition 4.12, pp. 8–33). Let C be the curve of a global function field, v a place with formal disc D, 𝒢 a parahoric group scheme over C with connected reductive generic fibre G, reductive away from finitely many places (lh §5.1, p. 33, lh line 1574), with its parahoric restriction to D as the local group (lh §1.1, p. 5, lh line 248), legs I placed in D with bounds μ_•, and N a level disjoint from v. Congruence subgroups enter as levels on this model, not as other smooth models. Gluing a framed local G-shtuka to the trivial G-bundle away from v by Beauville–Laszlo defines a formally étale morphism Θ̂ from the formal moduli of local G-shtukas bounded by μ_• to the formal completion along v of the moduli of global G-shtukas of level N (Li-Huerta Proposition 5.13). On a Harder–Narasimhan truncation ≤ s and for deg N large enough this is a morphism of formal schemes, formally étale and locally formally of finite type (Proposition 5.14). On generic fibres, for every n ≥ 0, it gives an étale morphism Θ_n of locally spatial diamonds from the analytic local shtuka moduli with level n·v to the diamond of the truncated global moduli with level n·v + N (Theorem 5.16), compatible with local partial Frobenius and the residue-degree iterate of global partial Frobenius, between the truncations specified below (Lemma 5.18). Through Θ_n the homology of the local shtuka moduli with Satake coefficients maps to the cohomology of the global shtuka stacks (§6).

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. N and v are disjoint. Put r=deg(v), and let V be the Satake representation specifying the bounds. Choose κ(V)≥0 such that one global partial Frobenius takes the truncation ≤s into ≤s+κ(V), as in lh §5.9, p. 36, lh line 1682. Write τ for q₁-Frobenius on the leg base and Fr_global^[r] for the composition of r global operations, pulling the j-th operation to the τ^j-twisted disc on the selected leg block, for 0≤j<r. At intermediate twists the disjoint leg blocks are reindexed as in lh Lemma 5.18; the resulting operation moves the selected block once around the modification chain. Local partial Frobenius uses q_v=q₁^r. Both Fr_local and Fr_global^[r] go from bound s to bound s+rκ(V), with local level n·v and global level n·v+N respectively. Choose deg N sufficiently large for Proposition 5.14 at the enlarged bound s+rκ(V), hence at every intermediate bound. Over the product of the punctured discs at v, prove Θ_(n,s+rκ(V)) ∘ Fr_local = (Fr_global^[r])^diamond ∘ Θ_(n,s), with the indicated base twists on each source and target (lh, Lemma 5.18, pp. 40–41, lh line 1870).

(lh, §5, Propositions 5.13–5.14, Theorem 5.16 and Lemma 5.18, pp. 37–41; lh, §§2–4, Theorem 2.12, Theorem 4.9 and Proposition 4.12, pp. 8–33; §6, Lemma 6.4 and §6.13, pp. 42–47; lh line 1737.)

*Proof route:* A framed local shtuka includes the quasi-isogeny trivialization on the punctured disc. Glue its bundles and modifications to the trivial bundle and identity modifications away from v; the level N is trivial there. This defines Θ̂ in the local-to-global direction. Rigidity of quasi-isogenies (Proposition 2.3) gives the unique infinitesimal lifting required by Proposition 5.13. On truncations the source is a formal scheme by Li-Huerta Theorem 2.12 and the target by the finite-type statement for large deg N (Proposition 5.14). Pass to generic fibres using their identification with the supplied analytic tower of HeckeStacksAndLocalShtukas §HS2.9 (Theorem 4.9, Proposition 4.12) to define Θ_n with level at v (Theorem 5.16); Lemma 5.18 compares one local partial Frobenius with the twisted r-fold global composition, enlarging s to s+rκ(V) and choosing N for that enlarged bound. The coefficient sheaves on both sides match under Θ_n (Lemma 6.4), which gives the maps on (co)homology used in §6.13.

The formal-moduli construction has the following API.

- Forgetting the quasi-isogeny is a map from framed bounded local shtukas to the corresponding unframed moduli; uniformization is defined on its framed source.
- Restriction in the bound and forgetful level maps commute with uniformization on their common domains.
- Deformation base change retains nilpotent test schemes, and formal étaleness gives unique lifts over square-zero thickenings.
- The analytic generic-fibre comparison gives the stated map between locally spatial diamonds with the specified source and target levels.
- For r=deg(v), Θ_(n,s+rκ(V)) ∘ Fr_local = (Fr_global^[r])^diamond ∘ Θ_(n,s), where the global composition includes the successive τ-twists and reindexings and N is large enough at s+rκ(V).

**Checks.**

- For G=GL₁ identify the generic fibre with K_v and choose the framed lattice z^(−d)O_v. Gluing it to the trivial line away from v gives O_X(dv), of degree d·deg(v); d=1 gives degree 1 at a rational v and degree 2 at a degree-two v. This degree is determined by the framed lattice, not by a nonzero total Frobenius-modification degree. Forgetting the framing does not define this map, and formal étaleness does not identify its image with all Pic-shtuka components.
- For a dual-number test ring k[ε]/(ε²), deformation data retain ε while reduction to k sets ε=0; replacing the functor by its reduced-point set loses this infinitesimal test of formal étaleness.
- For no legs and the trivial group there is one framed object and the map is the identity on the base, with zero relative tangent space.
- For G_m the congruence model Spec O_v[x,(1+zx)⁻¹] with multiplication x∗y=x+y+zxy (the image of x is 1+zx) is smooth with special fibre G_a and O_v-points 1+zO_v, while the parahoric model has special fibre G_m and points O_v^×. Only the latter is a parahoric group scheme; the former enters as the level-one congruence subgroup on the parahoric model, so a smooth-model hypothesis alone would admit a model outside the cited theorems.
- At q₁=4 and deg(v)=2 choose α∈𝔽₁₆ with α⁴+α+1=0. One global base operation gives α⁴=α+1≠α, while two give α¹⁶=(α+1)⁴=α. The local base operation also gives α¹⁶=α. At r=1 both sides use one operation. With s=3 and κ(V)=2 the two-step target bound is 7, with intermediate bound 5; a fixed bound 3 is not the asserted target.

*Needs:* GlobalShtukasAndFunctionFieldLanglands §2.1; GlobalShtukasAndFunctionFieldLanglands §2.9; GlobalShtukasAndFunctionFieldLanglands §2.2; HeckeStacksAndLocalShtukas §HS2.9; DiamondEtaleCohomology Layer C0; DiamondSixOperations §S1.5.

### 3.2 Li-Huerta: Lafforgue's global parameters are locally Fargues–Scholze

Let G be connected reductive over a global function field K, v a place and Π a cuspidal automorphic representation. For every occurring excursion parameter σ to which Π belongs in the sense of §2.1 (using the fixed central character and lattice for reductive G), the semisimplification of σ restricted to W_(K_v) equals the Fargues–Scholze semisimple parameter of Π_v. Consequently the Genestier–Lafforgue semisimple local parametrization of irreducible smooth representations of G(F), F of characteristic p, agrees with the Fargues–Scholze parametrization; at the level of Bernstein centres the excursion elements of the two constructions coincide.

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. Coefficients ℚ̄_ℓ with ℓ ≠ p; the mod-ℓ analogue also holds (Li-Huerta Theorem 6.15).

(lh, Introduction, Theorems A and C, pp. 2–3; §6, Theorems 6.13, 6.15 and §6.16, pp. 47–49; §7.2, p. 51; ch26, §3.2, Theorem 3.8 and the paragraph after it, p. 10; lh line 2126.)

*Proof route:* Through the uniformization morphism (§3.1) the local excursion algebra acting on the homology of local shtuka moduli maps to the global excursion algebra (Li-Huerta Theorem 6.13). Comparing the Fargues–Scholze Bernstein-centre elements (§3.0) with Lafforgue's global excursions (GlobalShtukasAndFunctionFieldLanglands §5.4) gives Theorem 6.15 and then Theorem A (§6.16). Genestier–Lafforgue's parameters satisfy the same local–global compatibility (GlobalShtukasAndFunctionFieldLanglands §7.8) and globalization of every irreducible representation's Bernstein-centre character forces agreement (Theorem C, §7.2).

**Checks.**

- At an unramified place both parameters give the Satake class: for the rank-two normalization at q=4 the pair is (2,1/2) and its trace is 5/2 (lh, remark after Theorem A).

*Needs:* §3.1; §3.0 (local excursion parameters); GlobalShtukasAndFunctionFieldLanglands §5.4; GlobalShtukasAndFunctionFieldLanglands §5.10; GlobalShtukasAndFunctionFieldLanglands §7.6; GlobalShtukasAndFunctionFieldLanglands §7.8; HeckeStacksAndLocalShtukas §HS3.1.

### 3.3 Properties of the semisimple local parametrization

Use the Genestier–Lafforgue semisimple local assignment L_F from GlobalShtukasAndFunctionFieldLanglands §7.6 and identify it with the local excursion assignment of §3.0 by §3.2. Prove compatibility with a homomorphism Υ:G₁→G₂ of connected reductive F-groups having normal image and kernel containing a smooth connected normal subgroup K₀ of G₁ with ker(Υ)/K₀ central in G₁/K₀: every irreducible constituent of the pullback of π has parameter ᴸΥ∘L_F(π), with ᴸΥ:ᴸG₂→ᴸG₁ the L-homomorphism of the normal-image-l-homomorphisms contract. Include products, Weil restriction and twists by characters through the abelianization; composition with algebraic dual representations is symmetric monoidal. A representation with pro-p Iwahori invariants for a quasi-split G has parameter in its torus L-group, and a parameter in no proper Levi forces supercuspidality. For coefficient automorphisms fixing √q the assignment commutes with transport. For other automorphisms use the canonical finite central unramified cocycle determined by the parameter-square-root-transport contract. The normal-image and coefficient assertions apply to the actual reconstructed parameter, not to an arbitrary monoidal functor.

Throughout this statement, F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W_F its Weil group and Frob ∈ W_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^(1/q)); C is an algebraically closed field of characteristic 0 (C = ℂ or C = ℚ̄_ℓ). Frobenius conventions are those of the parent roadmap: geometric Frobenius, local reciprocity sending a uniformizer to geometric Frobenius, and one fixed square root of q for normalized induction and half Tate twists. G connected reductive over F.

(ch26, §3.2, Theorem 3.8, p. 10; ghs, §2.1, Theorem 2.1(iii), p. 6; §2.2, Theorem 2.3(iv)–(vi) and Corollary 2.4(ii), pp. 6–7; fs, Theorem I.9.6(ii), (vi)–(vii), p. 36, fs line 1331, fs line 1337.)

*Proof route:* Use the parent’s normalized-induction identity and §3.2 for the common assignment. Transport the product, Weil-restriction and character-twist identities of fs Theorem I.9.6(ii), (vi)–(vii) through §3.2. Prove the normal-image identity on the L-homomorphisms ᴸΥ of the normal-image-l-homomorphisms contract (ReductiveGroupsPartII §RG2.5.2), and evaluate local excursions after pullback. The c-group chart comparison gives the coefficient law; its finite central twist has weight 0. For pro-p Iwahori invariants use a finite torus eigencharacter and principal-series support; in characteristic zero the finite torus action is semisimple. A parameter not contained in any proper Levi cannot arise from induction from a proper Levi.

**Checks.**

- For GL₂ the Steinberg representation and the trivial representation have the same semisimple parameter diag(q^(1/2),q^(−1/2)), by their common normalized-induction support. The calculation uses normalized induction over the local function field.
- For the Steinberg representation of PGL₂, L_F(St) is unramified with Frobenius diag(q^(1/2), q^(−1/2)): the parameter of the trivial representation, as normalized induction predicts.
- The relative Frobenius SL₂→SL₂ has normal image but infinitesimal noncentral kernel; on character lattices it multiplies by p and sends the root α to pα, which is not a root, so it induces no map of dual root data. The kernel hypothesis excludes it, while a central isogeny such as SL₂→PGL₂ with kernel μ₂ (nonreduced when p=2) is admitted.

*Needs:* GlobalShtukasAndFunctionFieldLanglands §7.8; GlobalShtukasAndFunctionFieldLanglands §7.6; §3.2; §3.0 (local excursion parameters); ReductiveGroupsPartII §RG2.5.2 (normal-image-l-homomorphisms contract)

### 3.4 Geometric representations of a local group

An irreducible smooth representation π of G(F) over ℚ̄_ℓ is geometric when it has a model π_E over a number field E ⊂ ℚ̄_ℓ (π_E ⊗_E ℚ̄_ℓ ≅ π) and its semisimple parameter L_F(π) is geometric (§0.1). A complex representation is geometric when it is π ⊗_(ι) ℂ for a geometric π.

Throughout this statement, F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W_F its Weil group and Frob ∈ W_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^(1/q)); C is an algebraically closed field of characteristic 0 (C = ℂ or C = ℚ̄_ℓ). G connected reductive over F; L_F as in §3.3.

(ch26, §3.2, Definition 3.9, p. 10; ch26 line 485.)

*Proof route:* The definition is stable under the choice of the faithful representation and of Frobenius (§0.2). The number-field model is part of the datum: it is what makes Galois conjugates π_E ⊗_(E,ι′) ℚ̄_ℓ meaningful.

The construction has the following API.

- π has a number-field model and L_F(π) is geometric.
- Conjugates of a geometric representation are geometric (§3.5).
- For a split torus, geometricity is equivalent to Weil q_F-number values; for an induced torus use the q_E-normalized criterion of §3.6.
- Constituents of normalized induction from a geometric representation are geometric; Jacquet-module constituents of a geometric representation are geometric (§3.7).
- The central character restricted to the smooth connected central torus is geometric, as specified in §3.8.
- Twisting by a geometric character of G(F) preserves geometricity.

**Checks.**

- The trivial representation of PGL₂(F) is geometric, with Frobenius eigenvalues q^(±1/2) in the standard representation of SL₂.
- The unramified character of F^× sending a uniformizer to 3, q = 4, is not geometric.
- The Steinberg representation of GL₂(F) is geometric: L_F has Frobenius eigenvalues q^(1/2), q^(−1/2), of weights 1 and −1.
- For GL_n the normalized induction of geometric characters has geometric semisimple parameter by GlobalShtukasAndFunctionFieldLanglands §7.6. The same calculation holds in equal characteristic.
- A unitary unramified character of F^× with transcendental value on a uniformizer has no number-field model and is not geometric.
- For split G the trivial representation has normalized semisimple Frobenius q^(ρ̂). For nonsplit G the parameter keeps its prescribed outer Frobenius component, and eigenvalues in an algebraic L-group realization can acquire root-of-unity factors: for the norm-one torus of an unramified quadratic extension, ᴸT=G_m⋊C₂ with inversion, and the trivial character gives the swap matrix in the induced two-dimensional realization, with eigenvalues 1 and −1, both of weight 0. The split torus gives (1,1) in that realization; the formula q^(ρ̂) alone would give (1,1) in the nonsplit case too.

*Needs:* §0.1; §3.3.

### 3.5 Galois conjugates of geometric representations

If π is geometric with model π_E, then π_E ⊗_(E, ι′) ℚ̄_ℓ is geometric for every embedding ι′: E → ℚ̄_ℓ.

Throughout this statement, F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W_F its Weil group and Frob ∈ W_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^(1/q)); C is an algebraically closed field of characteristic 0 (C = ℂ or C = ℚ̄_ℓ). G connected reductive over F. Use the coefficient-transport contract specified at §3.3, including the finite central normalization twist for automorphisms moving √q (the parameter-square-root-transport contract).

(ch26, §3.2, Proposition 3.10(1) and its proof, pp. 10–11; ch26 line 489.)

*Proof route:* Extend the two embeddings of the number field to an automorphism γ of ℚ̄_ℓ. The specified §3.3 coefficient-transport contract (parameter-square-root-transport) identifies L_F(γπ) with γL_F(π), allowing the specified finite central normalization twist. The representation twist is an autoequivalence preserving irreducibility and smoothness by the coefficient-change target of SmoothRepresentationsOfLocalGroups §SR.0.4; a transported number-field model is still a number-field model. Being a Weil q-number of a given integer weight depends only on the minimal polynomial (DeligneWeightsAndPurity §0.1), so γ preserves it; −1 is a Weil number of weight 0.

**Checks.**

- For an unramified character of G_m with value (1 + 2i) on a uniformizer and q = 5, the conjugate value (1 − 2i) again has absolute value √5.
- At q=5 the trivial PGL₂ representation has normalized pair (√5,1/√5). A coefficient automorphism sending √5 to −√5 changes the transported pair to (−√5,−1/√5); the central sign −I compares the two normalization charts, and both pairs have weights ±1. At q=4 every coefficient automorphism fixes √q=2, so that particular sign change cannot be induced by a coefficient automorphism.

*Needs:* §3.3; DeligneWeightsAndPurity §0.1; §3.4; SmoothRepresentationsOfLocalGroups §SR.0.4 (*coefficient-change*).

### 3.6 Geometric characters of tori

For a split F-torus T, a smooth character χ: T(F) → ℚ̄_ℓ^× is geometric iff all its values are Weil q_F-numbers of integer weight. For a finite separable extension E/F and T = Res_(E/F) G_m, let f=[k_E:k_F] and q_E=q_F^f. Then χ is geometric iff χ(ϖ_E) is a Weil q_E-number of integer weight; the values on O_E^× are roots of unity. The criterion must use q_E, not q_F. For an arbitrary nonsplit torus retain the definition through its torus L-parameter; the all-values condition with q_F is not asserted to be sufficient.

Throughout this statement, F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W_F its Weil group and Frob ∈ W_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^(1/q)); C is an algebraically closed field of characteristic 0 (C = ℂ or C = ℚ̄_ℓ). T a torus over F (not necessarily split).

(ch26, §3.2, Proposition 3.10(2) and its proof, pp. 10–11; ch26 line 492.)

*Proof route:* For G_m use local reciprocity, sending ϖ_F to geometric Frobenius. Smoothness makes the image of the compact unit group finite; a split torus is a finite product of this calculation. Algebraicity of the finitely many uniformizer values also supplies a number-field model. For Res_(E/F) G_m use the induced L-representation Ind_(W_E)^(W_F) χ. For unramified E/F its Frobenius eigenvalues λ satisfy λ^f=χ(ϖ_E), up to root-of-unity factors. Thus 2 log_(q_F)|λ| = 2 log_(q_E)|χ(ϖ_E)|, with the same equality for every conjugate. For ramified E/F, the same power argument uses the residue degree f and finite inertia. An isogeny or a resolution by induced tori does not remove this residue-degree constraint. For unramified quadratic E/F and χ(ϖ_E)=q_F^(1/2), every character value is a Weil q_F-number of integer weight, but the induced Frobenius eigenvalues ±q_F^(1/4) have weight 1/2, so χ is not geometric.

**Checks.**

- For the unramified quadratic torus Res_(E/F) G_m, χ(ϖ_E)=q_F has weight 1 relative to q_E and gives induced Frobenius weights 1; χ(ϖ_E)=q_F^(1/2) fails integrality.
- For split G_m the values on units have weight 0 and the sole unramified weight is 2 log_(q_F)|χ(ϖ_F)|, independent of the embedding precisely for a Weil number.
- For E=F(t^(1/p)), the extension is purely inseparable: after algebraic closure the restriction-of-scalars multiplicative group has a unipotent part of dimension p−1, so it is not a torus. The separability hypothesis excludes this false application of the residue-degree criterion.

*Needs:* §3.3 (normal-image and coefficient transport); §3.4.

### 3.7 Stability of geometricity

Geometricity of irreducible smooth representations is preserved by: constituents of normalized parabolic induction i_P^G(ρ) from geometric ρ; constituents of the normalized Jacquet module r_P(π) of geometric π; external tensor products for G₁ × G₂; and twisting by geometric characters of G(F) factoring through G → G^(ab).

Throughout this statement, F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W_F its Weil group and Frob ∈ W_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^(1/q)); C is an algebraically closed field of characteristic 0 (C = ℂ or C = ℚ̄_ℓ). G connected reductive over F, P = MN a parabolic subgroup.

(ch26, §3.2, Proposition 3.10(3) and its proof, pp. 10–11; ch26 line 494.)

*Proof route:* Induction: L_F(π)=i_M∘L_F(ρ). The normalized induced object is defined over a number field after adjoining √q. For induction and Jacquet modules use finite length and admissibility, choose a compact open subgroup whose invariants see all constituents, and use the finite-dimensional image of its Hecke algebra over that number field. Its simple modules descend after finite coefficient extension; the simple Hecke-module/smooth-representation correspondence then gives number-field models of the constituents. Use SmoothRepresentationsOfLocalGroups §§SR.0.4 and SR.2.2 for coefficient change of invariants and functors, and its §SR.1.3 for the simple-Hecke-module correspondence. For a Jacquet constituent η on M, its cuspidal support, viewed in G, is G-conjugate to the cuspidal support of π, by the geometric lemma and the cuspidal-support theorem. Compatibility with normalized induction therefore identifies i_M∘L_M(η) with L_G(π). Since i_M is a closed embedding, §0.2(c) gives geometricity of L_M(η). Products and twists: §3.3 (products) and §3.3 (twists), with §3.6 for the character.

**Checks.**

- Every irreducible constituent of an unramified principal series of PGL₂ induced from a character with value q^(1/2) on a uniformizer is geometric (the trivial and Steinberg representations).

*Needs:* §3.3 (normal-image and coefficient transport); SmoothRepresentationsOfLocalGroups §SR.2.2; SmoothRepresentationsOfLocalGroups §SR.3.3; §3.6; §0.2; SmoothRepresentationsOfLocalGroups §SR.0.4 (*coefficient-change*); SmoothRepresentationsOfLocalGroups §SR.1.3.

### 3.8 Central characters of geometric representations

Let π be geometric. For every F-split torus A contained in Z_G, the restricted central character ω_π|_(A(F)) is geometric and hence takes Weil q_F-number values of integer weight. More generally, the restriction to T=(Z_G)_red^∘ is geometric through the torus local parameter, provided the normal-image central functoriality specified at §3.3 is supplied. No L-group of a nonsmooth centre is formed. For example the centre μ_p of SL_p in characteristic p is not a torus; its group of F-points is trivial.

Throughout this statement, F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W_F its Weil group and Frob ∈ W_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^(1/q)); C is an algebraically closed field of characteristic 0 (C = ℂ or C = ℚ̄_ℓ). G connected reductive over F with centre Z_G.

(ch26, §3.2, Proposition 3.10(4) and its proof, pp. 10–11; ch26 line 496.)

*Proof route:* For a smooth central torus T→G the image is normal, so the normal-image compatibility of GHS Theorem 2.3(vi) identifies the parameter of ω_π|_T with the composite LT←LG←W_F. This precise extension of the §3.3 central-character supplier is the supplier contract; the existing z-embedding supplier alone does not make a nonsmooth centre a torus. Composition with an algebraic L-map preserves geometricity by §0.2. In the split case §3.6 converts this into the values criterion. This is exactly the input on the split centres A_M required in Casselman inequalities.

**Checks.**

- For G = GL_n and π = St_n, ω_π is trivial.

*Needs:* §3.3 (normal-image and coefficient transport); §3.6; §0.2.

### Examples

The trivial and Steinberg representations have the same semisimple pair (2,1/2) at q=4. For an unramified quadratic torus the uniformizer value 2 gives induced eigenvalues ±√2, of weight 1/2 over 𝔽₄, and fails geometricity.

### Dependencies

HeckeStacksAndLocalShtukas §§HS3.1–HS3.4, HS4.1 and HS4.7 (local cohomology and exported Hecke datum); LanglandsParameterStacks §§2.15 and 3.9 (abstract centre map and Schur-object parameter), §§3.4–3.6 (continuity); SmoothRepresentationsOfLocalGroups §§SR.0.2, SR.1.3, SR.3.2 (smooth category and centre); SmoothRepresentationsOfLocalGroups §SR.0.4 (coefficient change); DiamondEtaleCohomology Layer C0; DiamondSixOperations Layer S2; GlobalShtukasAndFunctionFieldLanglands §2.1; GlobalShtukasAndFunctionFieldLanglands §2.9; GlobalShtukasAndFunctionFieldLanglands §2.2; HeckeStacksAndLocalShtukas §HS2.9; DiamondSixOperations §S1.5; GlobalShtukasAndFunctionFieldLanglands §5.4; GlobalShtukasAndFunctionFieldLanglands §5.10; GlobalShtukasAndFunctionFieldLanglands §7.6; GlobalShtukasAndFunctionFieldLanglands §7.8; §0.1; DeligneWeightsAndPurity §0.1; SmoothRepresentationsOfLocalGroups §SR.2.2; SmoothRepresentationsOfLocalGroups §SR.3.3; §0.2. ReductiveGroupsPartII §RG2.5.2 (normal-image-l-homomorphisms contract). Each target states its statement and proof-route inputs separately.

## Layer 4: Discrete-series anchors and embedding independence

### 4.0 Étale Kloosterman anchors in every characteristic

Let k be any finite field of characteristic p and cardinality q, let ℓ≠p, and let H be a split semisimple dual group over characteristic-zero algebraically closed coefficients. Fix a pinning, a nontrivial additive character ψ of 𝔽_p and an affine-generic functional φ on the first positive-depth Iwahori quotient: every affine-simple-root coefficient of φ is nonzero. Construct the étale Kloosterman tensor local system on G_m,k and its automorphic eigenobject with trivial tame character at zero. At zero its inertia is regular unipotent; at infinity its adjoint inertia-invariant space is zero, and the corresponding local automorphic component is supercuspidal. Identify its algebraic realizations with those of the global excursion parameter using normalized Satake and Chebotarev. The no-invariants conclusion excludes proper Levi images, since their centres have positive Lie dimension modulo the centre of H. It does not assert irreducibility of the adjoint inertia representation (hny, Theorem 1, pp. 16–17, hny line 950; Theorem 2, p. 17, hny line 976, with its small-prime restriction lifted by xz, Corollary 4.5.7 and Remark 4.5.8(i), pp. 53–54, xz line 2478, xz line 2503; ghs, Proposition 3.9 and Remark 3.10, pp. 10–11, ghs line 450, ghs line 486).

**Invariant parameters.** Work over a characteristic-zero coefficient field containing the algebraic lifts, and write G₀ for the split semisimple group dual to H. Let V=Lie(I(1)/I(2)) for G₀ and let φ̃∈V* be the chosen lift of φ. Construct the isomorphism of affine quotients V*//T → Lie(H)_aff(1)//T_H induced by restriction of the classical Hitchin map and the dual Cartan invariant identification. On each almost-simple factor of Coxeter number h, choose corresponding homogeneous degree-h generators P and P_dual of the invariant algebras. The orbit of λφ̃ matches ξ exactly when P_dual(ξ)=λ^h P(φ̃). Fix λ=−π for the Dwork parameter attached to ψ. After fixing x and the pinning, identify the target quotient with the space of highest-root terms xE; the matched connection is d+(N+xE)dx/x. The comparison is on generic orbits when every affine-root coordinate is nonzero; the affine-quotient map itself includes the zero parameter (xz, Theorem 4.3.3 and §4.3.4, pp. 47–48, xz line 2201, xz line 2221, equation (4.3.4.1), xz line 2233; §4.4.1, p. 49, xz line 2292).

Its API is:

- The quotient map is an isomorphism of affine schemes and commutes with coefficient extension and the factor decomposition.
- Scaling φ̃ by λ scales the degree-h parameter by λ^h; simultaneous rescaling of the corresponding invariant generators preserves the matching equation.
- On the generic locus the invariant match determines the T_H,ad-orbit and hence the pinned Bessel connection up to gauge, with the fixed base coordinate x.

**Checks.**

- In type A₁ normalize P(φ̃)=1 and P_dual(N+c xE)=c. At p=5, λ=−π gives c=π². The candidate c=2π² has the same residue N and maximal formal slope 1/2, but its invariant differs by π²≠0. The parameter equation rejects it.
- In type A₂, h=3 and P(φ̃)=1 give c=−π³. The candidate +π³ differs by 2π³≠0 in the characteristic-zero coefficient field, including when the residue characteristic is 2; this fixes the sign invisible in A₁.
- In type A₁ the affine invariant is the product ab of the two affine-root coordinates. Coordinates (1,1) give 1 and match a nonzero Bessel parameter; (1,0) give 0 and fail affine-genericity. Under multiplication by λ these products become λ² and 0. No division by a zero root coordinate is used on the affine quotient.

**Oper singularities and quantization.** Using the intrinsic oper and function-algebra suppliers, define Op_H in characteristic zero as the fibre product of H_ad-opers on G_m with the prescribed local oper subschemes at zero and infinity. At zero use the regular-singular oper subscheme with nilpotent oper residue ϖ(0): for a principal triple (h₀,N,F), its local DS presentation is ∂_t+N/t+u(t), with u(t) in Lie(H)^F[[t]]. At infinity use the DS oper subscheme with coefficient pole orders at most d_i for invariant degrees d_i<h and at most h+1 for degree h, on each almost-simple factor. Here DS coefficients are taken in the homogeneous basis of Lie(H)^F in the normalized form ∂_t+N+v(t). These oper conditions give principal unipotent monodromy at zero and maximal formal slope at most 1/h at infinity; a condition only on the forgotten connection does not define this oper subscheme (zhu-fg, §5, pp. 21–22, zhu-fg line 950–991). Construct its affine-space presentation by xE, with base point d+N dx/x (tame at both ends), and the map sending xE to the oper underlying d+(N+xE)dx/x. Construct the filtered algebra isomorphism U(V)^T → Fun(Op_H), where U(V) has the PBW filtration and the oper algebra has its induced oper filtration. Prove that its associated graded map is the pullback along the inverse of the invariant-parameter isomorphism above, including the displayed normalization, and identify the evaluation character belonging to λφ̃ with the matched oper (xz, §4.3.5, pp. 48–49, xz line 2247, xz line 2251, xz line 2263).

Its API is:

- The oper presentation retains the transverse Borel reduction and the specified local oper residues and pole bounds, and is natural under coefficient extension; forgetting that reduction maps to connections on G_m.
- The filtered algebra map and its inverse preserve the unit and filtration; their associated graded maps are the two inverse invariant-algebra maps.
- Evaluation at each parameter commutes with the algebra comparison; the zero parameter is the distinguished tame oper, and nonzero generic factor parameters give the corresponding Bessel oper.

**Checks.**

- For A₁ and c=0 the connection d+N dx/x has principal residue N at zero and is tame at infinity, with formal slope 0≤1/2. Thus the oper space contains the zero parameter even though the automorphic affine-generic datum excludes it.
- For A₁ and c≠0, d+(N+c xE)dx/x has maximal formal slope 1/2 and belongs to Op_H; d+(N+c x²E)dx/x has maximal formal slope 1 and fails the bound. Keeping only the residue condition would admit this wrong oper.
- In A₁, U(V)^T is the polynomial algebra in the product of the two commuting root generators. That product has PBW degree 2, and its classical symbol evaluates to ab. At (a,b)=(1,1) the symbol is 1, whereas replacing the comparison by twice that map gives 2. The associated graded normalization rules out this unit rescaling.

**Parahoric localization and the de Rham eigenvalue.** For H adjoint (so G₀ is simply connected), construct critical-level localization with opposite Iwahori level at zero and I(2) level at infinity on Bun_(G₀)(0,2), with the compatible sheaf D_tw of critically twisted differential operators. Prove goodness, dim T*Bun_(G₀)(0,2)=2 dim Bun_(G₀)(0,2), and construct the half-canonical line, trivialized on the open V-chart. For the V-action prove flatness of the moment map T*Bun_(G₀)(0,2) → V* and hence U(V)-flatness of D_tw. Use the vacuum centers of AffineLieAlgebras §§A7–A8 and the oper evaluation characters of FormalConnectionsOpers §§F4–F5 and F8.4. Prove that the local central supports of the level vacua impose the stated singularity bounds, whose global oper space is Op_H. Construct the global central action Fun(Op_H) → Γ(Bun_(G₀)(0,2),D_tw) and prove that its composite with U(V)^T → Fun(Op_H) equals the infinitesimal V-action restricted to T-invariants. On the open V-chart use the exponential connection E_η=(O,d−dη); let Lie(V) act by minus the translation vector field, so its character on E_η is η. For every affine-generic η=λφ̃, specialize D_tw over the full algebra U(V) at η and untwist by the inverse half-canonical line. Prove that the resulting automorphic D-module A_(λφ̃) is holonomic, is nonzero on the open V-chart with restriction the exponential module for λφ̃, identifies with its clean (V,λφ̃)-equivariant extension, and satisfies the normalized Hecke-eigenvalue identity Hk_W(A_(λφ̃)) ≅ A_(λφ̃) ⊠ Be_H,W(ξ) for every W∈Rep(H), compatible with tensor products and intertwiners. This constructs the needed localization and proves its Hecke compatibility at these levels, including the vacuum-support, half-canonical and flatness statements just specified. Apply the construction factorwise for semisimple H of adjoint type. Consequently the de Rham Kloosterman tensor eigenvalue is Be_H(ξ), rather than merely a connection with the same residue and slope. For general semisimple H, prove the central descent: a lift of this H_ad-connection with unipotent monodromy at zero is unique up to isomorphism, since the difference is a finite-central local system extending to A¹ in characteristic zero, and such a local system is trivial. Apply this to the two constructed lifts (xz, Theorem 4.3.3 and §§4.3.5–4.3.6, pp. 47–49, xz line 2201, xz line 2276, xz line 2283; zhu-fg, §§3.4–4.2, Propositions 14–15 and Lemma 16, pp. 17–19, zhu-fg line 748, zhu-fg line 789, zhu-fg line 838; zhu-fg, Theorem 8 and Corollary 9, pp. 9–10, Lemmas 17–21 and Remark 5.1, pp. 20–23, zhu-fg line 377, zhu-fg line 435, zhu-fg line 888, zhu-fg line 918, zhu-fg line 1008).

Its API is:

- Localization has source the indicated critical-level module category and target critically twisted differential modules on Bun_(G₀)(0,2). The U(V)-flat specialization at the full additive character, followed by the half-canonical untwist, is the clean automorphic eigenobject; specialization only over U(V)^T is not this construction.
- The Hecke comparison identifies the tensor eigenconnection, with the chosen parameter and Satake normalization, in every algebraic representation.
- Central descent gives an isomorphism of H-connections and is compatible with products and finite coefficient extension; no uniqueness of a chosen isomorphism is claimed.

**Checks.**

- For the tensor unit W, Be_H,W is the rank-one connection d, and the Hecke identity is A≅A⊠1. For two unit factors it gives 1·1=1; an arbitrary scalar eigenvalue would violate this constraint.
- For A₁, P(φ̃)=1 and p=5, localization evaluates the invariant at π². The candidate connection with 2π² evaluates it at 2π², so it cannot be the eigenconnection of this localized character although its residue and slope agree.
- On one translation coordinate t with η(t)=λt, the exponential generator satisfies ∂_t e=−λe and the infinitesimal action −∂_t has eigenvalue λ. With λ=−π these values are +π and −π respectively; this fixes the localization character and agrees with the cubic parameter −π³.
- In A₁ the open V-chart has dimension 2, its cotangent chart has dimension 4, and the moment-map fibres there have dimension 2. The full V-character specialization fixes both cotangent coordinates; specialization at only their product leaves one free parameter.
- In A₁, the distinct V-characters (a,b)=(1,c) and (2,c/2), c≠0, both have invariant ab=c. Specialization over U(V)^T fixes only c; the construction specializes over U(V) to the chosen pair. Both pairs have the same matched eigenconnection but give different exponential modules on the fixed open V-chart.
- For SL₂→PGL₂ the kernel is μ₂. A nontrivial μ₂-Kummer twist on G_m has monodromy −1 at zero and fails the unipotence condition; the extending twist on A¹ has monodromy +1 and is trivial. This distinguishes uniqueness with the zero-boundary condition from unrestricted central lifting.

**Bessel companion construction.** Choose algebraic Teichmüller lifts of the nonzero root coordinates of φ and an algebraic Dwork parameter for ψ, so the matched meromorphic connection has algebraic-number coefficients. Construct the tensor functor Be† from Rep(H) to overconvergent F-isocrystals on G_m,k over an algebraic closure of a finite extension of W(k)[1/p], with every object descending to a finite coefficient extension. Its underlying connection is the Bessel connection identified with the de Rham eigenvalue by the parameter, quantization and localization theorems above, and its q-Frobenius is fixed by the same normalized Hecke eigenvalue: for every algebraic H-representation V and every closed point a of G_m,k, its geometric-Frobenius characteristic polynomial equals that of the étale Kloosterman realization V after the chosen algebraic coefficient embeddings. Construct the rigid exponential-cohomology realization and its tensor-compatible comparison with the de Rham eigenvalue, using the rigid-middle-extension-specialization contract for the quasi-minuscule middle-image comparison; transport Frobenius to the matched connection. These comparisons are part of this construction. Prove that its realizations are pure of weight zero and that its restriction at zero has principal nilpotent residue (xz, Theorems 4.2.1, 4.3.3 and 4.4.4, pp. 42–50, xz line 1994, xz line 2201, xz line 2329; §4.4.2, p. 50, xz line 2314).

**Adjoint rigidity in every characteristic.** For H almost simple of rank r and Coxeter number h, put E=Be†(Lie H) and j:G_m→P¹. Prove that the largest p-adic break of E at infinity is at most 1/h, by André's comparison of p-adic and formal slopes (PadicDifferentialEquationsAndRigidCohomology §RD.6.97, item 3) applied to the matched connection, whose coefficients are algebraic numbers and whose largest formal slope at infinity is 1/h, and hence Irr_∞(E)≤r from dim Lie H=r(h+1) and integrality. Prove Hⁱ(P¹,j_!+E)=0 for every i, Irr_∞(E)=r, (Lie H)^(I_∞)=0 and N_∞=0 for the local Robba Weil–Deligne datum. Here j_!+ denotes the middle extension whose cohomology is indexed so that its boundary sequence is 0→H⁰(P¹,j_!+E)→H⁰₀(j_+E)⊕H⁰_∞(j_+E)→H¹_c(G_m,E)→H¹(P¹,j_!+E)→0. Each boundary space is ker N on inertia invariants. No good-prime hypothesis is imposed (xz, §4.3.1, p. 47, xz line 2175; Lemma 4.5.5 and (4.5.5.1), pp. 52–53, xz line 2433; andre-bessel, Proposition 3.2, pp. 788–789, andre-bessel line 393; Corollary 4.5.7 and its proof, pp. 53–54, xz line 2478).

**Transfer to the étale adjoint realization.** Prove Swan_∞(Kl_Ad)=r and dim (Kl_Ad)^(I_∞)=0 for the actual companion pair above, including p=2 and p=3 (xz, Remark 4.5.8(i), p. 54, xz line 2503). The comparison concerns local conductors and full inertia invariants; equality of abstract global monodromy groups is not its definition.

*Proof route:* Construct the invariant match, the singular oper space and filtered quantization, then the specialized parahoric localization/Hecke-eigenvalue comparison and semisimple central descent. Only after this de Rham identification use the rigid-middle-extension-specialization comparison to transport Frobenius and construct the tensor companions. Prove the maximal-slope bound and principal residue just stated. The pure-isocrystal-geometric-semisimplicity contract and the principal unipotent at zero give a principal SL₂ in the reductive geometric monodromy group; its centralizer in Lie H is zero. Thus E has no global invariant or coinvariant adjoint vector. Duality, the slope bound and the boundary sequence force dim H¹_c(E)=r, the contribution at zero to be r, and the contribution at infinity and all middle-extension cohomology to vanish. Nilpotence gives inertia-invariant space zero from ker N=0 on that space; the group-valued N_∞ is itself an invariant adjoint vector and is zero. To transfer, use the rigid and étale trace formulas and the common closed-point polynomials. For either pure weight-zero coefficient on the affine curve, H⁰_c=0, H¹_c has weights at most 1 and H²_c is pure of weight 2. The disjoint weights prevent numerator/denominator cancellation in its L-function, so the compact-cohomology characteristic polynomials agree degree by degree. Therefore the étale H²_c is zero and dim H¹_c=r. Its boundary exact sequence already has r independent vectors from the principal unipotent at zero, leaving no infinity invariants; étale Grothendieck–Ogg–Shafarevich then gives Swan_∞=r. This proves the required local transfer directly, without identifying two groups over different coefficient fields. Products and central quotients extend the adjoint assertions to semisimple H. Finally compare with excursions at every algebraic realization and use §3.2 and the no-proper-Levi criterion of §3.3 for the local component.

The construction has the following API.

- The étale eigenvalue has normalized Satake Frobenius classes, principal unipotent inertia at zero and a supercuspidal automorphic component at infinity.
- The parameter and localized oper determine the de Rham eigenconnection before Frobenius is transported; the Bessel functor preserves the tensor unit, tensor products, duals and intertwiners; its companion characteristic polynomials agree for every V and every closed point, with the chosen coefficient and half-twist conventions.
- In the almost-simple adjoint realization, the Bessel irregularity and étale Swan conductor at infinity both equal r, and both full inertia-invariant spaces are zero. The Bessel middle-extension cohomology vanishes in every degree.
- Products and compatible central isogenies transport the adjoint assertions with their specified dual maps; the trivial semisimple group has zero adjoint space.

**Checks.**

- The rank-two Kloosterman system has standard Swan conductor 1; a constant rank-two system has Swan 0 and two inertia invariants. Its Bessel companion has the same standard local values.
- At zero, a nonzero unipotent 2×2 logarithm has kernel dimension 1 and its adjoint logarithm has kernel dimension 1. Replacing it by zero gives kernel dimensions 2 and 3, so the companion's principal-residue condition excludes the constant connection. Killing only the highest-root coefficient while retaining the principal residue gives d+N dx/x, tame at infinity with Swan 0; affine-genericity excludes this further wrong model.
- For type A₁, r=1, h=2 and dim Lie H=3: the slope bound gives Irr≤3/2, hence Irr≤1. The one-dimensional zero-boundary term forces H¹_c to have dimension 1 and the infinity boundary to have dimension 0.
- For split G₂ over 𝔽₂(t) and 𝔽₃(t), r=2, h=6 and dim Lie H=14 give Irr≤14/6<3, hence Irr≤2. The zero-boundary dimension 2 forces Irr=Swan=2 and infinity invariant dimension 0 in both characteristics. The hypothesis p>3 in hny Theorem 2 fails in both cases; the Bessel and transfer theorems above supply the conclusion. No assertion that every nonzero break is 1/6 is used.
- At p=2, the SO₃ local inertia image A₄ has adjoint character values 3 on the identity, −1 on the three involutions and 0 on the eight 3-cycles. Its invariant dimension is (3−3+0)/12=0 (xz, Remark 4.5.8(iv), p. 54, xz line 2512); replacing this image by a torus would leave an invariant line.
- For an odd-characteristic rank-two example, adjoint inertia preserves a torus line and the two-root-line sum, but neither has invariants. Its invariant dimension is 0 and total dimension 3; vanishing does not imply adjoint irreducibility.
- For H=A₁×G₂ the adjoint ranks and infinity conductors add to 1+2=3, while invariant dimension stays 0+0=0. Passing from SL₂ to PGL₂ leaves the three-dimensional adjoint realization unchanged.
- For H=1, Lie H has dimension 0 and its invariant dimension is 0, while Be† sends the tensor unit to the rank-one constant F-isocrystal with Frobenius 1. This separates the adjoint zero object from the tensor unit.
- In the trace-formula comparison at q=4, a weight-2 H²_c eigenvalue has modulus 4, while every H¹_c eigenvalue has modulus at most 2. Equal numerator and denominator roots cannot cancel. For the type A₁ adjoint coefficient, H²_c has dimension 0 and the sole H¹_c boundary eigenvalue is 1/4 (weight −2), so L(T)=1−T/4 on both sides.

*Needs:* FormalConnectionsOpers §§F4–F5 and F8.4 (intrinsic opers, function algebras and coordinate descent); AffineLieAlgebras §§A7–A8 (critical vacuum and completed centers); the invariant-parameter, oper-quantization and parahoric-localization targets of this section; GlobalShtukasAndFunctionFieldLanglands §1.4 (étale trace formula) and §§1.9–1.14 (Satake), §§5.3, 5.8–5.10 (excursions); FunctionFieldArithmetic §5.8 (Chebotarev); §3.2; §3.3 (no-proper-Levi criterion); EtaleCohomologyFoundations §§F.0–F.4 (étale realization); ReductiveGroupsPartII §§RG2.3–RG2.5 (Iwahori quotients and dual maps); NilpotentOrbits §N2 (triples); RepresentationTheory/LieHighestWeight Layer 0 (principal SL₂ invariants); ArithmeticGaloisRepresentations §§3.1–3.4 (étale conductors); DeligneWeightsAndPurity §§5.2–5.12 and 7.8–7.9 (curve and cohomological weights); PadicDifferentialEquationsAndRigidCohomology §§RD.2.49–RD.2.51, RD.3.13, RD.3.25, RD.4.10–RD.4.12, RD.5.46, RD.6.23, RD.6.51–RD.6.55, RD.6.64–RD.6.65, RD.6.77 (pure-isocrystal-geometric-semisimplicity contract), RD.6.84–RD.6.85 (coefficient categories, local monodromy, duality, trace formula, Tannaka and weights), RD.4.58–RD.4.59 and RD.6.39 (de Rham–rigid specialization; rigid-middle-extension-specialization contract), RD.6.52a and RD.6.97 (formal slopes at infinity and André's comparison of p-adic and formal slopes).

### 4.1 ι-tempered and ι-discrete representations

Let π be an irreducible admissible representation of G(F) defined over ℚ̄ and ι: ℚ̄ → ℂ an embedding. π is ι-tempered (resp. ι-discrete series) when π ⊗_(ℚ̄, ι) ℂ is tempered (resp. square-integrable modulo the centre) in the sense of SR.3. π is tempered (resp. discrete series) in the absolute sense when this holds for every embedding ι′.

Throughout this statement, F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W_F its Weil group and Frob ∈ W_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^(1/q)); C is an algebraically closed field of characteristic 0 (C = ℂ or C = ℚ̄_ℓ). G connected reductive over F; π irreducible admissible over ℚ̄.

(ch26, §4.1, Definition 4.1 and the paragraph after it, p. 11; ch26 line 519.)

*Proof route:* Temperedness of π ⊗_ι ℂ requires a unitary central character together with Casselman’s inequalities on the exponents of proper normalized Jacquet modules (SmoothRepresentationsOfLocalGroups §SR.3.3). Coefficient change transports these algebraic characters and exponent values by ι′. Hence ι-temperedness depends only on the absolute values |ι(χ(a))| of the exponents χ of π.

The construction has the following API.

- π ⊗_ι ℂ is tempered.
- π ⊗_ι ℂ is square-integrable modulo the centre.
- ι′-tempered for every ι′: ℚ̄ → ℂ.
- π is ι-tempered iff its central character is ι-unitary and |ι(χ(a))|≤1 for every exponent χ of a proper standard Jacquet module and a in its negative cone (SmoothRepresentationsOfLocalGroups §SR.3.3).
- If central-character values and all normalized-Jacquet exponent values on split Levi centres are Weil q-numbers of integer weight, ι-tempered for one ι implies tempered (§4.8).

**Checks.**

- For PGL₂ and the unramified principal series with Satake parameter diag(ζ, ζ^(−1)), ζ a root of x⁴ − x³ − x² − x + 1 on the unit circle, π is ι-tempered for ι keeping ζ on the circle but not ι′-tempered for ι′ sending ζ to the Salem number 1.7221…
- For G anisotropic (G(F) compact) every irreducible π is ι-discrete series for every ι.
- For PGL₂ and Satake parameter diag(ζ, ζ^(−1)) with ζ = (3 + 4i)/5, π is tempered for every ι (all conjugates of ζ have absolute value 1).
- The Steinberg representation of PGL₂(F) is discrete series for every ι, matching the complex Steinberg representation of SmoothRepresentationsOfLocalGroups §SR.3.4.
- For G_m over 𝔽₄((t)) let χ be trivial on O^× with χ(t)=ζ₃, a character with model over Q(ζ₃). Its two embeddings give the values ζ₃ and ζ₃², both of modulus 1, so both conjugates are tempered. G_m(F) is its own centre, the quotient is one point, the proper-parabolic exponent list is empty and the normalized squared matrix-coefficient integral over the quotient is 1: both conjugates are ι-discrete series, and the conjugation is meaningful only because of the Q(ζ₃)-model.
- On the torus G_m the proper-parabolic exponent list is empty. The unramified character with a Salem unit-circle value is unitary at that embedding and has central modulus 1.722083805739 at its real conjugate; omitting the central-character condition would incorrectly predict embedding independence.

*Needs:* SmoothRepresentationsOfLocalGroups §SR.3.3; SmoothRepresentationsOfLocalGroups §SR.2.2.

### 4.2 Globalizing supercuspidals with irreducible parameter

Let G be connected reductive over a global function field K, z a place with K_z ≅ F and π a supercuspidal representation of G(F) whose central character has finite order. Fix an automorphic character ξ of finite order of the smooth connected central torus, with ξ_z equal to the restriction of the central character of π. There is a cuspidal automorphic Π of G(A_K) with central character ξ and Π_z ≅ π; Π occurs in the Ξ-invariant cusp module for a suitable Ξ (§2.1), at least one global parameter σ to which Π belongs exists, and every such σ lies in no proper parabolic subgroup of LG. The restriction of each σ at z gives an adjoint-bounded Weil–Deligne completion of L_F(π) at every embedding; for semisimple G this is arithmetic purity of weight 0. If the derived group of G is nontrivial there are infinitely many such Π; for a torus the prescribed central character determines Π.

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. G connected reductive over K; z a place of K; ξ is globally automorphic of finite order and compatible with π at z, with the central-torus convention of §4.3. A supercuspidal whose central character has infinite order is first moved to this case by an unramified twist of G(F) (reductive-central-reduction contract), and its parameter changes by the corresponding central unramified Weil character (§3.3); this local reduction is the one used in §4.5. No global automorphic character trivial on no admissible Ξ enters.

(ghs, §2.1, the class A₀(G) of cuspidal representations with central character of finite order, p. 5, ghs line 236; ghs, §3.3, Proposition 3.9 and its proof, Remark 3.10, pp. 10–11; glo, Theorem 1.1, pp. 1–2; hny, Theorem 2, p. 17 (arXiv v1), extended to every p by xz, Remark 4.5.8(i), p. 54, xz line 2503, as proved in §4.0; ghs line 450.)

*Proof route:* If G is a torus, Π=ξ and there is no proper parabolic or nontrivial adjoint parameter. Otherwise choose a split place x≠z outside the ramification of ξ; Chebotarev gives infinitely many choices. Use the semisimple Kloosterman anchor of §4.0 at x through central-isogeny reduction to G, matching the central character to ξ_x by an unramified twist as in the reductive-central-reduction contract. Its adjoint inertia invariants vanish, so its parameter lies in no proper Levi. Gan–Lomelí's prescribed-central-character Poincaré-series globalization gives Π_x equal to this supercuspidal anchor and Π_z≅π (FunctionFieldArithmetic, poincare-series-globalization contract). For every occurring σ, §3.2 identifies σ|_(W_x)^(ss) with that same local parameter. Complete reducibility then excludes a global proper parabolic: a proper Levi has a positive-dimensional centre modulo the centre of Ĝ, yielding a nonzero invariant vector in Lie(Ĝ)/Lie Z(Ĝ). Apply the adjoint assertion of §1.4 at z, and the reductive-central-reduction contract to retain the central part without claiming its arithmetic purity. Distinct fresh auxiliary places, with nontrivial derived ramification, give infinitely many Π. Vanishing of adjoint inertia invariants is used here; irreducibility of the adjoint representation is unnecessary.

**Checks.**

- For the semisimple group G=PGL₂, Kl₂ at ∞ has irreducible inertia and Swan conductor 1; its normalized completion at z is arithmetically pure of weight 0.
- For G=G_m and ξ=1 there is exactly one prescribed-central-character automorphic representation, Π=1. Its adjoint Lie algebra is zero, so the completion is adjoint-bounded. This excludes an unconditional infinitude assertion for reductive G.
- For G=G_m over 𝔽₄(t), the character ξ=3^deg has infinite order: it is trivial on no admissible Ξ (§2.1), so no excursion parameter is attached to it and the conclusion would be vacuous. The finite-order hypothesis excludes it; its twist by ξ⁻¹ is the trivial character, whose parameter is trivial with zero adjoint.

*Needs:* §4.0 (étale Kloosterman anchors in every characteristic); FunctionFieldArithmetic §5.8 and §§6.2–6.6 (poincare-series-globalization contract); §2.1 (occurrence on the Ξ-invariant cusp module); §3.2; §3.3; §1.4; SmoothRepresentationsOfLocalGroups §SR.3.3 (reductive-central-reduction contract).

### 4.3 Beuzart-Plessis's pseudo-globalization of discrete series

Let G be connected reductive over K with Z⁰ the identity component of its centre, ξ a character of Z⁰(K)∖Z⁰(A_K), S_ram the places where G or ξ ramify, and S, S′ ⊂ |X| disjoint with S′ ∩ S_ram = ∅. For v ∈ S let π_v be discrete series with central character ξ_v on Z⁰(K_v), at least one π_(v₀) supercuspidal; for v ∈ S′ let X_v be a proper Zariski-closed subset of the unramified characters with central character ξ_v. Then there is a cuspidal automorphic Π with central character ξ on Z⁰(A_K) such that Π_v has nonzero trace against a pseudo-coefficient of π_v for v ∈ S (so Π_v and π_v have the same cuspidal support), and Π_v is unramified with Satake parameter outside X_v for v ∈ S′. It is not asserted that Π_v ≅ π_v for v ∈ S ∖ {v₀}.

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. G connected reductive over K; pseudo-coefficients exist by the trace Paley–Wiener theorem. S and S′ are finite. The central torus formulation assumes Z_G^∘ is smooth; for a nonsmooth centre use its maximal smooth connected central torus and supply the corresponding central-character formulation.

(ghs, Appendix A (R. Beuzart-Plessis), Lemma A.1 and its proof with Lemma A.3, pp. 38–39; glo, §8, Lemma 8.1 and Proposition 8.2 with the remark after it, pp. 38–40; ghs line 1789.)

*Proof route:* Choose f = ⊗f_v: pseudo-coefficients at S (a matrix coefficient of π_(v₀)^∨ at v₀), Hecke functions at S′ whose Satake transforms vanish on X_v, units almost everywhere, and support meeting only regular elliptic classes. Apply the Deligne–Kazhdan simple trace formula: the spectral side counts exactly the Π of the conclusion. Find a regular elliptic δ ∈ G(K) with nonzero local orbital integrals at S ∪ S′ (Lemma A.3), using weak approximation up to the finite-index open closure of G(K) in G(K_(S∪S′)) and Beuzart-Plessis's elliptic orthogonality for discrete-series characters; shrink an auxiliary support so that only δ contributes.

**Checks.**

- For S = {v₀} (one supercuspidal) the conclusion gives Π_(v₀) ≅ π_(v₀): a matrix coefficient of a supercuspidal detects it.
- For the PGL₂ Steinberg Euler–Poincaré pseudo-coefficient normalized to have trace 1 on Steinberg, the trivial representation has trace −1: the reducible principal series has trace 0 and its two constituents are Steinberg and the trivial representation. Nonzero trace therefore does not isolate the discrete-series constituent (ghs, Appendix A, p. 38; glo, Lemma 8.1 and the remark after Proposition 8.2, pp. 38–40).

*Needs:* FunctionFieldArithmetic §§6.4–6.6 (function-field-simple-trace-formula contract); SmoothRepresentationsOfLocalGroups §SR.3.3 (discrete-series-pseudo-coefficients and elliptic-orthogonality-open-subgroups contracts); SmoothRepresentationsOfLocalGroups §§SR.4.1–SR.4.2.

### 4.4 Discrete series parameters realized in irreducible global parameters

For connected reductive G and an essentially discrete series π of G(F) whose central character has finite order (so π is discrete series), fix K, z and a compatible automorphic central character ξ of finite order as in §4.2. There is a cuspidal automorphic Π of G over K with central character ξ and L_F(Π_z)=L_F(π); Π occurs for a suitable Ξ (§2.1), and every global parameter σ to which Π belongs lies in no proper parabolic subgroup. Each σ restricted at z realizes an adjoint-bounded completion of L_F(π); for semisimple G this completion is arithmetically pure of weight 0.

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. G connected reductive; K, z with K_z ≅ F and G defined over K; ξ has finite order and the compatibility and central-torus convention of §4.2. An essentially discrete series whose central character has infinite order is moved to this case by the local unramified twist of §4.2 before §4.3 is applied, and the parameter is twisted back by the corresponding central unramified Weil character; §4.3 is applied only to discrete series with central character ξ_v.

(ghs, §3.3, Proposition 3.11 and its proof, p. 11; ghs line 495; ghs line 236.)

*Proof route:* For a torus use Π=ξ. Otherwise take x and π′ with central character ξ_x as in §4.2. Apply §4.3 with S={x,z}, π_x=π′ supercuspidal and π_z=π. Then Π_x≅π′ and Π_z has the cuspidal support of π, so L_F(Π_z)=L_F(π) by GlobalShtukasAndFunctionFieldLanglands §7.6. Every occurring σ is irreducible because its restriction at x is (§3.2); apply §1.4 in the adjoint quotient, retaining the same central-reduction input as §4.2.

**Checks.**

- For GL₂ at q=4 and π=St⊗(χ∘det) with χ unramified, χ(ϖ)=3, the central character sends ϖ to 9 and has infinite order, so π is essentially discrete series but not discrete series and §4.3 is not applied to it directly. Untwisting gives St with semisimple pair (2,1/2); the twisted parameter has pair (6,3/2), central determinant 9 and the same adjoint ratio 4.
- For PGL₂ the only infinite-dimensional constituent with the cuspidal support of St is St itself, so Π_z ≅ St (local components of cuspidal representations of PGL₂ are generic); for groups with non-generic cuspidal representations, such as Sp₄, Π_z may be a non-tempered constituent with the same support, and only the common semisimple parameter is used.

*Needs:* §4.2; §4.3; §3.2; §3.3; §1.4; SmoothRepresentationsOfLocalGroups §SR.3.3 (reductive-central-reduction contract).

### 4.5 Weil–Deligne purity of discrete series

For connected reductive G and a discrete-series π, the semisimple local parameter has a unique essentially tempered WD refinement at a fixed ι (GHS Theorem 1.2). The refinement is essentially tempered after every coefficient embedding in the adjoint sense. For semisimple G, every algebraic τ of LG gives an arithmetically pure WD representation of weight 0, so its semisimple Frobenius eigenvalues have integer weights symmetric about 0. For general reductive G no single arithmetic weight in an arbitrary faithful representation is asserted; the proof requires the central reduction in the central-reduction contract.

Throughout this statement, F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W_F its Weil group and Frob ∈ W_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^(1/q)); C is an algebraically closed field of characteristic 0 (C = ℂ or C = ℚ̄_ℓ). G connected reductive over F of any characteristic p (the published version has no restriction on p; the arXiv v3 version assumed p > 3).

(ghs, §1, Theorem 1.2 and Corollary 1.3, p. 3; §3.3, Corollary 3.12 and Remark 3.13, p. 11; ch26, §4.2, paragraph after Proposition 4.5, p. 12; proof of Theorem 5.4, p. 14; ghs line 519.)

*Proof route:* For semisimple G, existence follows from §4.4 and §1.4; uniqueness is §0.4. For reductive G, first twist the central character by an unramified character to reduce its unramified part to finite order, and compare discrete series and parameters under central isogenies/z-extensions. These exact local reduction and parameter-transport statements are supplier contracts at SR.3/§3.3 (the central-reduction contract); they cannot be replaced by the semisimple globalizations alone. The semisimple global input is pure for every embedding. The reductive assertion concerns adjoint boundedness, which is unchanged by central twists (GHS Remark 3.13 read with this convention). For semisimple G use Sawin–Templier for each ι and every algebraic τ, plus the absolute weight argument through constant-twist classes; the determinant of τ factors through a finite Galois quotient, forcing the common weight to be 0. GHS Corollary 3.12 states the adjoint case, and the same semisimple argument applies to any τ. For semisimple G, arithmetic purity of every τ ∘ L_F(π) gives integer-weight Weil-number Frobenius eigenvalues. This yields geometricity when the representation also has the number-field model required in §3.4. No such central arithmetic assertion follows for general reductive G from adjoint boundedness alone.

**Checks.**

- For G = PGL₂ and π = St, L(π) is the Steinberg parameter and τ = standard of SL₂ gives Sp(2) twisted by q^(−1/2): weights 1 and −1, pure of weight 0.

*Needs:* §4.4; §0.4; §1.3; §0.3; SmoothRepresentationsOfLocalGroups §SR.3.3; §3.3 (normal-image and coefficient transport).

### 4.6 Discrete series with algebraic models are geometric

Let G be semisimple over F and let an irreducible π have a number-field model. If its realization at one embedding is discrete series, then π is geometric: the pure completion of §4.5 supplies arithmetic integer Frobenius weights. For a connected reductive G the corresponding assertion with geometric central torus character additionally assumes the reductive-central-reduction contract, its parameter compatibility, and the torus residue-degree criterion of §3.6. Roots of nonzero integer-weight numbers alone do not prove that assertion.

Throughout this statement, F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W_F its Weil group and Frob ∈ W_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^(1/q)); C is an algebraically closed field of characteristic 0 (C = ℂ or C = ℚ̄_ℓ).

(ch26, §3.2, Proposition 3.10(5) and the last line of its proof, p. 11; ch26 line 501.)

*Proof route:* Choose a field isomorphism ℚ̄_ℓ ≅ ℂ restricting to ι ∘ ι_ℓ^(−1) on ι_ℓ(ℚ̄); then π ⊗ ℚ̄_ℓ is a discrete series for that isomorphism and §4.5 applies. Purity of τ ∘ L(π) gives Weil-number Frobenius eigenvalues of integer weight.

**Checks.**

- The Steinberg representation of PGL₂(F) is geometric with weights ±1 in the standard representation.

*Needs:* §4.5; §3.4; §3.8.

### 4.7 Galois conjugates of discrete series are discrete series

For semisimple G/F, let π have a number-field model and suppose its realization at ι is irreducible discrete series. Then its realization at every embedding ι′ is discrete series. Exponents of the actual normalized Jacquet modules have Weil-number values on the split central torus of each Levi, so the strict Casselman inequalities have the same truth value at every embedding. The claim for an arbitrary complex discrete series also assumes the discrete-series-number-field-model contract.

Throughout this statement, F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W_F its Weil group and Frob ∈ W_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^(1/q)); C is an algebraically closed field of characteristic 0 (C = ℂ or C = ℚ̄_ℓ). π is assumed to have a number-field model, viewed over ℚ̄; this holds for local components of cuspidal representations (§2.2) and for supercuspidals (§4.2). For arbitrary complex discrete series also assume the discrete-series-number-field-model contract.

(ch26, §4.1, Theorem 4.2 and the sketch (1)–(4) after Theorem 4.3, pp. 11–12; ch26 line 527.)

*Proof route:* By §4.6, L_F(π) is geometric; the exponents of π (central characters of the constituents of its Jacquet modules on the split centres A_M) are geometric by §3.7 and §3.8, so their values are Weil q-numbers of integer weights. Casselman's strict inequalities for ι (SmoothRepresentationsOfLocalGroups §SR.3.3) are inequalities between integer weights, which do not depend on the embedding; hence π ⊗_(ι′) ℂ is square-integrable.

**Checks.**

- For PGL₂ the Steinberg representation and the supercuspidals have conjugates of the same kind for every ι.

*Needs:* §4.6; §3.7; §3.8; SmoothRepresentationsOfLocalGroups §SR.3.3; §4.1.

### 4.8 Embedding independence of temperedness for geometric components

Let G be semisimple over K and Π an occurring cuspidal representation with a number-field model. Fix a place v and assume the local parameter of Π_v is geometric. If Π_v is ι-tempered then Π_v is ι′-tempered for every embedding ι′. Use all normalized Jacquet exponents and the unitary central character. Without the geometricity hypothesis no all-embeddings conclusion is part of this statement.

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands §5.10).

(ch26, §4.1, Theorem 4.3 and step (2) of the sketch, p. 11; ch26 line 531.)

*Proof route:* Every irreducible constituent of every normalized Jacquet module of Π_v is geometric by §3.7. Its central character restricted to the split centre A_M therefore has Weil-number values by §3.8. The central character of Π_v is unitary (Π is cuspidal semisimple); apply Casselman to these actual Jacquet exponents rather than identifying them with the supercuspidal support. Casselman's criterion (SmoothRepresentationsOfLocalGroups §SR.3.3) is then an inequality between integer weights, independent of ι.

**Checks.**

- When L_F(Π_v) is unramified with Satake parameter of real part 0 for one ι and Weil-number eigenvalues, temperedness holds for all ι.

*Needs:* §3.7; SmoothRepresentationsOfLocalGroups §SR.3.3; §4.1; §2.2; §3.8.

### Examples

For PGL₂ Steinberg, the weight-0 pure completion has two Frobenius weights −1,1 joined by N. Its proper normalized-Jacquet exponent satisfies the strict inequality, so its conjugates remain discrete series.

### Dependencies

FormalConnectionsOpers §§F4–F5 and F8.4; AffineLieAlgebras §§A7–A8; GlobalShtukasAndFunctionFieldLanglands §1.4; ArithmeticGaloisRepresentations §§3.1–3.4; GlobalShtukasAndFunctionFieldLanglands §§5.3, 5.8–5.10; FunctionFieldArithmetic §5.8 (Chebotarev); §3.2; étale curve realization from EtaleCohomologyFoundations §§F.0–F.4; ReductiveGroupsPartII §§RG2.3–RG2.5; DeligneWeightsAndPurity §§5.2–5.11 (realization, conductors and curve weights); SmoothRepresentationsOfLocalGroups §SR.3.3 (discrete-series-pseudo-coefficients and elliptic-orthogonality-open-subgroups contracts); FunctionFieldArithmetic §§6.4–6.6 (function-field-simple-trace-formula and poincare-series-globalization contracts); §2.1; SmoothRepresentationsOfLocalGroups §SR.2.2; FunctionFieldArithmetic §§6.4–6.6; §3.3 (normal-image and coefficient transport); §1.4; SmoothRepresentationsOfLocalGroups §§SR.4.1–SR.4.2; §0.4; §1.3; §0.3; §3.4; §3.8; §3.7; §2.2. PadicDifferentialEquationsAndRigidCohomology §§RD.2.49–RD.2.51, RD.3.13, RD.3.25, RD.4.10–RD.4.12, RD.5.46, RD.6.23, RD.6.51–RD.6.55, RD.6.64–RD.6.65, RD.6.77, RD.6.84–RD.6.85, RD.4.58–RD.4.59, RD.6.39, RD.6.52a and RD.6.97 with the two p-adic supplier contracts of §4.0; NilpotentOrbits §N2; RepresentationTheory/LieHighestWeight Layer 0; DeligneWeightsAndPurity §§5.12, 7.8–7.9. Each target states its statement and proof-route inputs separately.

## Layer 5: Generic Ramanujan

### 5.1 Test representations of the dual group

For G absolutely simple over K, let G^(ad) be its adjoint group, whose dual Ĝ_sc is simply connected. The test set T(G) consists of the adjoint representation of Ĝ_sc and, by type of G: A_(n−1) with n even, the standard representation V(ω̂₁) of SL_n; B_n, the standard representation V(ω̂_n) of Sp_(2n); C_n, the spin representation V(ω̂₁) of Spin_(2n+1); D_n, the half-spin V(ω̂₁) and the vector representation V(ω̂_n) of Spin_(2n) (Ciubotaru–Harris numbering); E₇, the 56-dimensional V(ω̂₇); for A_(n−1) with n odd, E₆, E₈, F₄ and G₂, the adjoint representation alone. For G not adjoint these are representations of L(G^(ad)), used after lifting the parameter (§5.2). For the finite Galois L-group, replace each listed Ĝ_sc-module V by Ind_(Ĝ_sc)^(Ĝ_sc⋊Γ) V: its restriction is the direct sum of the Γ-translates of V. Thus the test list supplies algebraic L-group representations even when a fundamental highest weight is not Γ-fixed. For connected semisimple G write G^(ad)=∏_j Res_(K_j/K) G_j with G_j absolutely simple adjoint over finite separable extensions K_j/K. For H = Res_(L/K) H₀ the L-group is ᴸH = (∏_(a: L→K^sep) Ĥ_(0,a))⋊Γ with Γ permuting the factors (ReductiveGroupsPartII §RG2.5.2, the L-group of a Weil restriction); let Γ_L ⊂ Γ be the stabilizer of the distinguished embedding a₀, of index [L:K]. A member V of T(H₀), an algebraic Ĥ₀⋊Γ_L-module, is pulled back to Ĥ⋊Γ_L along the Γ_L-equivariant projection onto the factor a₀ and then induced from the finite-index subgroup Ĥ⋊Γ_L to Ĥ⋊Γ: the result is an algebraic ᴸH-module of dimension [L:K]·dim V whose restriction to Ĥ is the direct sum of the [L:K] conjugate factor modules. T(G) consists of these induced modules, one for each member of each T(G_j), composed with the projection of ᴸG^(ad) onto ᴸRes_(K_j/K) G_j. Induction from ᴸG_j itself, a subgroup of ᴸRes_(K_j/K) G_j of infinite index containing none of the other factors, is not this construction and does not give a finite-dimensional module.

Throughout this statement, G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands §5.10). G absolutely simple in the definition by type, and semisimple in the product definition; numbering of fundamental weights as in Ciubotaru–Harris §6 and the local spherical criteria.

(ch26, §3, standing hypothesis that G is semisimple and unramified quasi-split at v, p. 8, ch26 line 372; §5, the table after Theorem 5.4, p. 13; §6.12, Proposition 6.31, p. 24; ch26 line 619.)

*Proof route:* The list is the one for which SmoothRepresentationsOfLocalGroupsPartII §5.24 shows that every nonzero half-integral generic unitary point of a split adjoint form left by the adjoint representation (SmoothRepresentationsOfLocalGroupsPartII §5.23) fails half-integrality for some member, and SmoothRepresentationsOfLocalGroupsPartII §6.3 does the same for the unramified nonsplit forms through restriction to the τ-fixed dual group. For a finite pinned action Γ, finite induction extends each module by taking ⊕_(γ∈Γ) {}^γV with Γ permuting the summands. The original module occurs as a direct summand after restriction, so integrality for the induced module implies integrality for the required separator. In type D the two half-spin translates must both be retained. For a Weil restriction the induction is along the finite-index subgroup Ĥ⋊Γ_L after pulling the factor module back along the projection; its restriction to Ĥ is the sum of the conjugate factor modules, so every weight of the induced module is a weight of one factor module placed in its factor, and integrality for the induced module implies integrality for the original module over K_j. Restriction to the folded group then uses SmoothRepresentationsOfLocalGroupsPartII §6.3.

The construction has the following API.

- The finite list of fundamental weights ω̂ᵢ of Ĝ_sc used beside the adjoint representation, by Cartan type; T(G) is the adjoint representation together with the V(ω̂ᵢ).
- The adjoint representation is always in T(G).
- A generic unitary real point ν of the split adjoint form that is half-integral for every member of T(G) is 0 (SmoothRepresentationsOfLocalGroupsPartII §§5.23–5.25).
- For nonsplit unramified G, the members restrict to the representations of G^∨(τ) used in SmoothRepresentationsOfLocalGroupsPartII §6.3; for the quasi-split PSU(2n+1) they leave the residual point ½ω_n of SmoothRepresentationsOfLocalGroupsPartII §6.4.
- Finite induction V↦⊕_(γ∈Γ) {}^γV gives an algebraic Ĝ_sc⋊Γ-module whose restriction contains V; integer weights for the induced module imply integer weights for V.
- For H=Res_(L/K)H₀ the module induced from Ĥ⋊Γ_L to Ĥ⋊Γ has dimension [L:K]·dim V and restricts to Ĥ as the sum of the [L:K] conjugate factor modules; its weights are the weights of the factor modules placed in their factors.

**Checks.**

- T(PGL₂) = {adjoint, standard of SL₂}; ½ω (the PGL₂ point ½ω_(n/2)) pairs to ¼ with the standard weight, so it is excluded.
- T(PGL₃) is the adjoint representation alone: no nonzero half-integral generic unitary point exists for PGL₃ (SmoothRepresentationsOfLocalGroupsPartII §5.14).
- For PSp_(2n) the vector representation of SO_(2n+1) does not separate the residual point ½ω_n; the spin representation is required. In dual B₂ coordinates ν=(1/2,0), the vector pairings are 1/2,−1/2,0,0,0, while the spin pairings are ±1/4, each twice.
- For PSO₈, in the coordinates of ch26 line 1039, the half-spin module V(ω̂₁) has pairings 1/2, 0, −1/2 with multiplicities 1, 6, 1 on ½ω₁, but ±1/4 with multiplicities 4, 4 on ½ω₂, and ±1/4 on ½ω₄. It leaves ½ω₁ and excludes the other two. The vector module has pairings ±1/4 on ½ω₁ and on ½ω₂ but only 0 and ±1/2 on ½ω₄; together the two modules exclude all three points. For PSO₁₂ the highest half-spin weight pairs to 3/4 on ½ω₁ and to 1/2 on ½ω₂, so for even n the spin-node point left by V(ω̂₁) is ½ω₁ when n≡0 and ½ω₂ when n≡2 modulo 4.
- For G=PGL₂×PGL₃, T(G) consists of the two adjoint representations and the standard representation of SL₂ on the first factor. The real point ν equal to (1/4,−1/4) on the first factor and 0 on the second is half-integral on both adjoint representations but pairs to ±1/4 on the standard one, so it is excluded; omitting the factorwise separators would retain it.
- For Res_(L/F) PGL₂ with L/F unramified quadratic, ᴸH=(SL₂×SL₂)⋊C₂ and Γ_L is trivial, so the test module is the standard module pulled back along the first factor and induced from SL₂×SL₂, of index 2: the four-dimensional module V⊕V with C₂ swapping the summands. Algebraic induction from the first SL₂ alone, of infinite index, would carry a factor of the coordinate ring of the second SL₂ and is not finite-dimensional. The point (1/4,−1/4) relative to q_L gives standard eigenvalues q_L^(±1/4); the induced Frobenius eigenvalues ±q_F^(±1/4) have weights ±1/2 relative to q_F, equal to the weights relative to q_L. Measuring the q_L-eigenvalues q_L^(±1/4) against q_F would give ±1, doubling them.
- For the order-two outer action on type D_n, one half-spin module alone need not extend; its sum with its outer translate does extend and retains both required restrictions.

*Needs:* ReductiveGroups §§10A–10B (rational representations and algebraic highest-weight modules of Ĝ_sc); RepresentationTheory/LieHighestWeight Layers 0 and 6 (sl₂ strings and Lie characters); ReductiveGroupsPartII §RG2.5.2 (L-groups of products and Weil restrictions); §2.3 (polar decomposition before local unitarity)

The local criterion used with this test family is the following. For a quasi-simple split adjoint group over a local function field, SmoothRepresentationsOfLocalGroupsPartII §5.25 (*generic-temperedness-test*) proves that if s = s_c·q^ν, with s_c equal to 1 or central, is the Satake parameter of a generic unitary spherical representation, then ν is half-integral on the adjoint representation and on the separators of SmoothRepresentationsOfLocalGroupsPartII §5.24 (*fundamental-separators*) exactly when ν = 0. SmoothRepresentationsOfLocalGroupsPartII §6.3 (*nonsplit-generic-temperedness*) proves the same for quasi-simple adjoint unramified nonsplit groups other than the quasi-split PSU(2n+1), whose residual point ½ω_n is SmoothRepresentationsOfLocalGroupsPartII §6.4 (*odd-unitary-residual*), and SmoothRepresentationsOfLocalGroupsPartII §5.26 (*g2-noncentral-witness*) shows that the hypothesis on s_c cannot be dropped. Both rest on the spherical unitary classification and the characteristic-independent Hecke comparison of SmoothRepresentationsOfLocalGroupsPartII §§5.10–5.11 and 5.27, valid over every nonarchimedean local field.

Prove the reduction of this criterion to the quasi-simple adjoint case. Let G be an unramified semisimple group over a local function field F whose adjoint group is ∏_j Res_(L_j/F) H_j, with H_j absolutely simple adjoint and L_j/F unramified of residue degree f_j. Prove that an irreducible spherical representation of a finite product of unramified groups is unitary, respectively generic for the product of the chosen Whittaker data, iff each tensor factor is; that the hyperspecial spherical representations of (Res_(L_j/F) H_j)(F) = H_j(L_j) are those of H_j over L_j, the Satake class (t,Fr) of the Weil restriction corresponding to the class of H_j over L_j obtained from its f_j-th power; and that integer weights relative to q_F of an induced test module (the finite induction from Ĥ⋊Γ_(L_j) of the definition above, whose restriction to Ĥ is the sum of the conjugate factor modules) are equivalent to integer weights relative to q_(L_j) = q_F^(f_j) of the original module, since the induced Frobenius eigenvalues are f_j-th roots of the original ones up to roots of unity. Combined with the imported criterion this proves, for G adjoint, and for general G through the spherical-isogeny-transfer contract below: on the unitary generic spherical representations of G(F) whose Satake parameter has central compact part, and when no H_j is the quasi-split PSU(2n+1), half-integrality of the weights of every member of T(G) relative to q_F forces ν = 0. No restriction on the residue characteristic is imposed (ch26, Proposition 6.31, Corollary 6.32, Theorem 7.4, Corollary 7.5 and Remark 7.6, pp. 24–27; ch26 line 1192 for the split criterion).

The reduction has the following API.

- Restriction and finite induction along the pinned outer action preserve the indicated algebraic realizations and their weight multiplicities.
- Unitarity and genericity of a spherical representation of a finite product are tested on its tensor factors, and the spherical representations of a Weil restriction are those of its factor over the extension field, with the f_j-th power matching of Satake classes.
- Integer weights relative to q_F of an induced test module are equivalent to integer weights relative to q_(L_j) of the original module.
- On the unitary generic spherical representations with central compact part of an unramified semisimple group without quasi-split PSU(2n+1) factors, half-integrality for every member of T(G) implies zero real part.

The central-isogeny transfer of spherical unitarity and genericity used for non-adjoint groups is the spherical-isogeny-transfer contract, required in its inseparable case: when the order of the kernel of G → G^(ad) is divisible by p, the image of G(F) in G^(ad)(F) is closed of infinite index and not open, so the transfer is formulated on that image and its cokernel.

**Checks.**

- In dual SL₂, ν=(1/4,−1/4) pairs to half-integers on the adjoint weights but to ±1/4 on the standard weights. At q=16 its standard eigenvalues are 2,1/2, of weights ±1/2. The extra separator is necessary.
- In type A₂ the adjoint criterion leaves only ν=0; its eigenweights are all 0, with total multiplicity 8.
- A compact Satake class has ν=0 and every weight has modulus 1. The trivial PGL₂ representation has s_c=1 and ν=(1/2,−1/2): its adjoint pairings 1, 0, −1 and standard pairings ±1/2 are all half-integral and ν≠0. It is unitary and geometric but not generic, the positive coroot taking the value q on its Satake class, so the generic hypothesis of the imported criterion is what excludes it; the point ν=(1/4,−1/4) is excluded instead by the standard pairing ±1/4.
- For PGL₂×PGL₂ the spherical representation 1⊗π₂, with π₂ tempered spherical, is unitary, but it is not generic because its first factor is not; a genericity test on the second factor alone would accept it and leave the nonzero real part (1/2,−1/2) on the first factor.
- For F=𝔽₂((t)) the determinant identifies PGL₂(F)/image(SL₂(F)) with F^×/F^(×2). The classes of 1+t^(2n+1), n≥0, are pairwise distinct: the ratio of two of them has odd lowest nonconstant exponent, while every square in F is a series in t². So the image of SL₂(F) has infinite index. It is closed, since squaring has closed image in characteristic 2, and it is not open: already the classes of 1+t^(2n+1) are distinct in O^×/O^(×2), so O^(×2) is a closed subgroup of infinite index of the compact group O^×, hence not open, and neither is F^(×2) in F^× nor the image of SL₂(F) in PGL₂(F). For F=𝔽₃((t)) by contrast F^×/F^(×2) has order 4 and the image is open of index 4. A transfer contract assuming a finite-index or open image has no instance at the characteristic-2 isogeny, which the generic Ramanujan theorem for SL₂ over 𝔽₂(t) needs.
- For the quasi-split PSU₃ the split companion is SL₂ and the residual candidate is ½ω₁ (SmoothRepresentationsOfLocalGroupsPartII §6.4); the pairing ±1/4 that would separate it comes from the spin representation of Spin₃, which does not factor through the fixed dual group SO₃ ⊂ SL₃ and so occurs in no representation of the ambient dual SL₃. This is why §5.4 excludes such factors.

*Needs:* the finite test family just defined; SmoothRepresentationsOfLocalGroupsPartII §§5.23–5.27 and 6.1–6.4 (split and nonsplit local criteria); SmoothRepresentationsOfLocalGroups §§SR.2.3, SR.4.1–SR.4.2 (Whittaker functionals and Satake parameters); ReductiveGroupsPartII §§RG2.3–RG2.5 (hyperspecial models, root data and Weil restriction); ReductiveGroups §§10A–10B (algebraic representations); §2.3 (polar decomposition before local unitarity).

### 5.2 Lifting a parameter to the L-group of the adjoint group

Let σ: Gal(K^sep/K) → LG(ℚ̄_ℓ) be continuous with image in LG(E) for a finite E/Q_ℓ, and LG^(ad) → LG the central extension dual to G → G^(ad) (kernel Z = ker(Ĝ_sc → Ĝ), a subgroup of the finite centre). There is a finite separable K′/K and a continuous lift σ̃′: Gal(K^sep/K′) → LG^(ad)(ℚ̄_ℓ) of σ|_(Gal(K^sep/K′)). For every place u′ of K′ over u, every τ ∈ T(G) and every place w′ unramified for σ̃′, the real part of σ̃′(Frob_(w′)) equals that of σ(Frob_(w′)), and τ ∘ σ̃′ is geometric at u′ when σ|_(u)^(ss) has a pure completion of weight 0. There is also a fixed-ι version: if the local completion has bounded Weil part at ι, every lifted algebraic representation has integer local ι-weights; this assertion does not imply arithmetic geometricity.

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands §5.10).

(ch26, §5, proof of Theorem 5.4, p. 14 and footnote 6; ch26 line 665.)

*Proof route:* The image of σ is a compact ℓ-adic Lie group; an open subgroup lifts through the finite central extension (de Jong's remark, Ciubotaru–Harris footnote 6), giving K′; equivalently the obstruction in H²(Gal(K^sep/K), Z) dies on a finite extension. At each fixed Frobenius the finite central kernel changes eigenvalues only by roots of unity. Compare real parts using the same residue field q_(w′); the kernel is trivial if G is already adjoint. The algebraic SL₂ of the local completion lifts through the central isogeny because SL₂ is simply connected. The real neutral element has integer eigenvalues in every representation, giving integer WD weights. A bounded Weil part lifts to a bounded Weil part; in the arithmetic case its eigenvalues are roots of Weil numbers of weight 0, which remain weight 0 at every embedding. This proves the distinct fixed-ι and arithmetic assertions.

The construction has the following API.

- The finite extension K′/K over which the lift exists.
- The lift σ̃′: Gal(K^sep/K′) → LG^(ad)(ℚ̄_ℓ).
- Composing σ̃′ with LG^(ad) → LG gives σ restricted to K′.
- Real parts of Frobenius classes of σ̃′ and σ agree.
- Two lifts differ by a continuous 1-cocycle with values in the actual finite kernel Z, with its Galois action; this is a character only when that action is trivial.

**Checks.**

- If G is adjoint then LG^(ad) = LG, K′ = K and σ̃′ = σ.
- For G=SL₂ and σ with values in PGL₂(ℚ̄_ℓ), the lifting obstruction lies in H²(Gal(K^sep/K′),μ₂(ℚ̄_ℓ)), where μ₂(ℚ̄_ℓ)={±1} is the constant coefficient group. For odd p, Kummer theory identifies this group with Br(K′)[2]. For p=2, Artin–Schreier theory gives H²=0, so the lift already exists over K. The group scheme μ₂ over K′ in characteristic 2 is a different coefficient object (Stacks project, Tags 03PL, 03R7 and 0A3K; stacks-as line 1410, stacks-as line 4359, stacks-as line 4444).
- In odd characteristic a projective parameter with nonzero obstruction in H²(Gal(K^sep/K),μ₂(ℚ̄_ℓ)) has no lift over K itself; its obstruction must first vanish after extension. There is no such nonzero class in characteristic 2.
- The two lifts ±I in SL₂ of the identity of PGL₂ have the same real part 0 (the isogeny Ĝ_sc → Ĝ is an isomorphism on Lie algebras) but traces 2 and −2; the lift statement identifies real parts, not characteristic polynomials.
- For a nontrivial Galois action on Z, the difference satisfies c(γδ)=c(γ)·γ(c(δ)); the untwisted homomorphism law is not the lift-ambiguity law.

*Needs:* §0.4; §2.1; NilpotentOrbits §N2; §0.1.

### 5.3 Integrality of Frobenius weights from a tempered place

Let π ⊂ A₀(G, ℚ̄) belong to σ (§2.1) and let u be a place. (a) If π_u is ι-tempered, then for every algebraic τ of LG the sheaf L(π, τ) has integer punctual ι-weights, and ⟨α, ν_w^ι(σ)⟩ ∈ ½ℤ for every weight α of τ and every w ∉ S. (b) If π_u is ι-discrete series, then for every τ the eigenvalues of τ(σ(Frob_w)), w ∉ S, are Weil q_w-numbers of integer weights (σ is geometric at every unramified place) and L(π, τ) has the weight filtration of §1.2. The same holds for τ ∈ T(G) composed with the lift σ̃′ of §5.2.

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. ℚ̄ is the algebraic closure of Q inside C, and ι: ℚ̄ → C, ι_ℓ: ℚ̄ → ℚ̄_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings ℚ̄ → C, equivalently over all field isomorphisms ℚ̄_ℓ ≅ C after extension. G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands §5.10). Use the factorizable compact open U and finite set S of Conventions; outside S the chosen U_w is hyperspecial and G is unramified.

(ch26, §5, proof of Theorem 5.4, pp. 14–15; ch26 line 639.)

*Proof route:* (b) By §4.6 π_u is geometric; by GlobalShtukasAndFunctionFieldLanglands §7.8 the semisimplified restriction of τ ∘ σ to W_(K_u) is τ ∘ L_F(π_u), hence geometric; apply §1.2 to L(π, τ). For (a), realize π_u inside normalized induction from a discrete series ρ of a Levi M with ι-unitary central character (SR.3). Use the reductive fixed-ι completion theorem §4.5, including the central reduction of the reductive-central-reduction contract: the central real part is 0 and the SL₂ weights are integers. This gives local integer ι-weights without asserting arithmetic geometricity. Apply the mod-ℤ decomposition and local weight–monodromy theorem to eliminate every other weight class globally. The half-integrality is §2.3 (half-integrality). For τ ∈ T(G) use §5.2 at the places of K′. If u∉S, apply the boundary argument after deleting u from the open curve. The original sheaf is lisse at u, and its supplied local weights restore the same conclusion there; the constant-twist summands and weight filtration restrict from the original open. This also covers u=v and an empty original S.

**Checks.**

- For PGL₂ a Steinberg anchor has normalized local weights ±1. The integrality conclusion by itself is not the Hasse bound for an elliptic curve; weight-0 automorphic normalization and purity require separate input.
- A hyperspecial anchor can equal the place v of §5.4(1): at q=4 a compact pair has weights 0,0 before and after deleting and restoring that point. With no anchor, the constant-Frobenius-3 line on a complete curve still has weight log₂3∉ℤ, so an empty boundary by itself gives no geometricity assertion.

*Needs:* §4.6; §3.3; §1.2; §4.5; DeligneWeightsAndPurity §8.17; DeligneWeightsAndPurity §5.11; §2.3; §5.2; §1.1; SmoothRepresentationsOfLocalGroups §SR.3.3.

### 5.4 The generic Ramanujan theorem over function fields

Let G be connected semisimple over K and π ⊂ A₀(G, ℚ̄) with m_U(π) ≠ 0 belonging to σ. Assume (1) at a place v ∉ S where G_(K_v) is unramified quasi-split and none of the simple factors of its adjoint group is the quasi-split form of PSU(2n+1) over an unramified extension of K_v, π_v ⊗_ι ℂ is generic and the compact part of its Satake parameter ι(s_v(σ)) is equal to 1, or represented by z∈Z(Ĝ)^Γ giving a unitary unramified character twist. In the nonsplit case this condition concerns the dual-torus compact factor: the Frobenius component is kept separate and is not required to be central; (2) at a place u, π_u is ι-tempered. Then π_w ⊗_ι ℂ is tempered for every w ∉ S, and every irreducible constituent of every L(π, τ) is ι-pure of weight 0. If π_u is ι-discrete series, π_w is tempered for every embedding and every L(π, τ) is pure of weight 0.

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. ℚ̄ is the algebraic closure of Q inside C, and ι: ℚ̄ → C, ι_ℓ: ℚ̄ → ℚ̄_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings ℚ̄ → C, equivalently over all field isomorphisms ℚ̄_ℓ ≅ C after extension. Use the factorizable compact open U and finite set S of Conventions; outside S the chosen U_w is hyperspecial and G is unramified.

(ch26, §1.1, the main theorem and the outline of its proof, pp. 2–3; §3, standing hypothesis that G is semisimple and unramified quasi-split at v, p. 8, ch26 line 372; §5, Theorem 5.4 and its proof, pp. 13–15; ch26 line 609.)

*Proof route:* §5.3 gives ⟨α, ν_v^ι(σ)⟩ ∈ ½ℤ for the adjoint representation and, through §5.2, for every τ ∈ T(G) (§5.1). π_v is unitary, spherical and generic. For adjoint G apply the criterion of §5.1: SmoothRepresentationsOfLocalGroupsPartII §5.25 on split factors and SmoothRepresentationsOfLocalGroupsPartII §6.3 on nonsplit factors, with their central-compact hypotheses read on the full L-group. For non-adjoint G use the central-isogeny transfer of spherical unitarity and genericity of the spherical-isogeny-transfer contract (SmoothRepresentationsOfLocalGroups §SR.4.2): triviality on Z(G)(F) alone does not extend a representation from the image of G(F) to every element of G^ad(F). The transfer is required for every central isogeny G → G^(ad), including an inseparable one, where the image of G(F) is closed of infinite index and not open; no finite-index or openness assumption is available there. With this transfer and the lifted test modules the same local criterion gives ν_v^ι=0. Then every constituent of L(π, τ) has ι-weight 0 at v; since the constituents are ι-pure of integer weight (previous step and DeligneWeightsAndPurity §§8.17–8.18 weight filtration), they are all of weight 0, so ν_w^ι(σ) = 0 for every w ∉ S. Temperedness at w: SmoothRepresentationsOfLocalGroupsPartII §5.3 (split adjoint) and Casselman's criterion (SmoothRepresentationsOfLocalGroups §SR.3.3) in general. For the discrete-series anchor the weights are Weil numbers, so the conclusion holds for every ι. The reduction from semisimple to absolutely simple groups is local at v: the adjoint group of G_(K_v) is a product of groups Res_(L_j/K_v) H_j with H_j absolutely simple adjoint and L_j/K_v unramified, the separator family is the family of §5.1 induced from Ĥ_j⋊Γ_(L_j), and the product and Weil-restriction reduction of §5.1 reduces the local criterion to each H_j over L_j; §§5.2–5.3 are already stated for semisimple G.

**Checks.**

- For G=PGL₂ with a Steinberg anchor, a non-tempered generic unitary π_v has central compact factor, so the separator theorem applies. If π_v is tempered, its real part is already 0 and the same weight-zero propagation applies directly. At q=4 the excluded complementary pair (√2,1/√2) has weights ±1/2.
- The quasi-split PSU(2n+1) case is excluded: SmoothRepresentationsOfLocalGroupsPartII §6.4 leaves the point ½ω_n.
- Without central compactness, take split G₂ with the compact involution satisfying (aα₁∨+bα₂∨)(s_c)=(−1)^a and ν=½ω₂. At q=4 the six positive-coroot values of s_c q^ν are −1,2,−2,2,−2,−4, none equal to 4 or 1/4. The regular principal series stays irreducible along its Hermitian deformation from the unitary compact endpoint, hence is unitary and generic with nonzero ν. Removing s_c gives the value +4 at the highest coroot and the real spherical class fails genericity. This separates the compact-factor hypothesis using the actual root values (ch26, Corollary 6.32 and its proof, p. 25; ch26 line 1192).

*Needs:* §5.3; §5.1 (test family and product reduction); SmoothRepresentationsOfLocalGroupsPartII §§5.25, 6.3–6.4 (local generic temperedness tests); §5.2; §2.2; §2.3; SmoothRepresentationsOfLocalGroups §SR.3.3; DeligneWeightsAndPurity §8.18; SmoothRepresentationsOfLocalGroups §§SR.4.1–SR.4.2 (spherical-isogeny-transfer contract); ReductiveGroupsPartII §RG2.5.2 (L-groups of products and Weil restrictions).

### 5.5 Propagation of genericity

Under the hypotheses of §5.4, π_w ⊗_ι ℂ is generic at every w ∉ S; if G is quasi-split over K, π is locally generic at almost every place.

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. ℚ̄ is the algebraic closure of Q inside C, and ι: ℚ̄ → C, ι_ℓ: ℚ̄ → ℚ̄_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings ℚ̄ → C, equivalently over all field isomorphisms ℚ̄_ℓ ≅ C after extension. Use the factorizable compact open U and finite set S of Conventions; outside S the chosen U_w is hyperspecial and G is unramified.

(ch26, §5, Corollary 5.7 and its proof, p. 15; ch26 line 702.)

*Proof route:* Use the genericity of tempered spherical representations of unramified quasi-split groups, the tempered-spherical-generic contract (SmoothRepresentationsOfLocalGroups §SR.4.2), with its isogeny and Whittaker hypotheses. SmoothRepresentationsOfLocalGroupsPartII §5.5 supplies the split adjoint special case; it does not alone prove the general nonsplit or non-adjoint statement. This is the general-isogeny genericity input used in ch26, Corollary 5.7, p. 15. Apply this at every w ∉ S after §5.4.

**Checks.**

- For PGL₂ every tempered spherical representation is an irreducible unitary principal series, hence generic.

*Needs:* §5.4; SmoothRepresentationsOfLocalGroupsPartII §5.5 (tempered spherical representations are generic, split adjoint case); SmoothRepresentationsOfLocalGroups §§SR.4.1–SR.4.2 (tempered-spherical-generic contract).

### Examples

For the nonzero half-integral rank-one real point ν=(1/4,−1/4), the adjoint test sees integral weights −1,0,1, while the standard test sees −1/2,1/2. This is the separator step before the global weight-0 conclusion.

### Dependencies

ReductiveGroups §§10A–10B (algebraic highest-weight modules); RepresentationTheory/LieHighestWeight Layers 0 and 6 (sl₂ strings and Lie characters); ReductiveGroupsPartII §§RG2.3–RG2.5 (hyperspecial models, root data, L-groups of products and Weil restrictions); §2.3 (polar decomposition before local unitarity); SmoothRepresentationsOfLocalGroupsPartII §§5.3, 5.5, 5.23–5.27 and 6.1–6.4 (split and nonsplit local spherical criteria); SmoothRepresentationsOfLocalGroups §§SR.2.3, SR.3.3, SR.4.1–SR.4.2 (Whittaker functionals, Casselman's criterion, Satake parameters, and the spherical-isogeny-transfer and tempered-spherical-generic contracts); §0.1; §0.4; §1.1; §1.2; §2.1; §2.2; §3.3; §4.5; §4.6; NilpotentOrbits §N2; DeligneWeightsAndPurity §§5.11, 8.17–8.18. Each target states its statement and proof-route inputs separately.

## Layer 6: Elliptic parameters and stack realization

### 6.1 Elliptic global parameters

For a continuous semisimple σ: Gal(K^sep/K) → LG(ℚ̄_ℓ) let S_σ be the centralizer in Ĝ of its image. σ is elliptic when S_σ / (Z(Ĝ))^(Gal(K̃/K)) is finite; equivalently (for semisimple σ) its image lies in no proper Levi subgroup of LG, equivalently (Ad⁰)^σ = 0 for the adjoint representation on Lie(Ĝ)/Lie(Z(Ĝ)).

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. G is a connected reductive group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands §5.10).

(lz, §1, definition before Proposition 1.2, p. 3; §2, p. 4; §3, p. 5 (Lie(S_σ) = (Ad)^σ); ch26, §5, Remark 5.8, pp. 15–16; lz line 103.)

*Proof route:* Lie(S_σ) is the σ-invariant Lie algebra. Exactness of invariants for the reductive Zariski closure of the semisimple parameter in characteristic 0 identifies Lie(S_σ/(Z(Ĝ))^Γ) with (Lie(Ĝ)/Lie Z(Ĝ))^σ, so finiteness of the reductive quotient is equivalent to vanishing of these invariants. A semisimple σ in a proper Levi M is centralized by the connected centre of M̂, a positive-dimensional torus modulo Z(Ĝ); conversely a positive-dimensional reductive S_σ contains a torus whose centralizer is a proper Levi containing the image.

The construction has the following API.

- S_σ/(Z(Ĝ))^Γ is finite.
- σ elliptic iff (Ad⁰ ∘ σ)^(Gal) = 0.
- For semisimple σ, elliptic iff the image lies in no proper Levi, iff no proper parabolic of LG contains it.
- The finite group 𝒮_σ = S_σ/(Z(Ĝ))^Γ acting on the Lafforgue–Zhu multiplicity space.
- For G = GL_r, elliptic iff the r-dimensional representation is irreducible.

**Checks.**

- For GL₂, σ = χ₁ ⊕ χ₂ is not elliptic: S_σ ⊇ G_m² and S_σ/G_m is one-dimensional.
- For a torus, S_σ=(Ĝ)^Γ=(Z(Ĝ))^Γ even when Γ acts nontrivially. The quotient is trivial, so every torus parameter is elliptic; S_σ need not equal all of Ĝ.
- For G = SL₂ (Ĝ = PGL₂) and σ with image the Klein four-group in PGL₂ (projectively induced from each of three quadratic extensions), S_σ is that Klein four-group: σ is elliptic with 𝒮_σ ≅ (ℤ/2)², not stable (the Labesse–Langlands endoscopic case).
- For GL_r and irreducible σ, S_σ = G_m = Z(Ĝ), 𝒮_σ = 1.
- For G = PGL₂ (Ĝ = SL₂) every irreducible σ is elliptic and stable, its centralizer being ±1 by Schur's lemma.

*Needs:* GlobalShtukasAndFunctionFieldLanglands §5.8; LanglandsParameterStacks §2.5.

### 6.2 Elliptic parameters are tempered at unramified places

Let G be semisimple over K, σ ∈ Φ(U) elliptic and π belonging to σ. Then L(σ, τ) is pure of weight 0 for every algebraic τ, and π_w ⊗_ι ℂ is tempered for every w ∉ S and every ι.

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. ℚ̄ is the algebraic closure of Q inside C, and ι: ℚ̄ → C, ι_ℓ: ℚ̄ → ℚ̄_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings ℚ̄ → C, equivalently over all field isomorphisms ℚ̄_ℓ ≅ C after extension. G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands §5.10). Use the factorizable compact open U and finite set S of Conventions; outside S the chosen U_w is hyperspecial and G is unramified.

(st, §11, Lemmas 11.4–11.5, p. 83; lz, §3, p. 5; ch26, §5, Remark 5.8, pp. 15–16; st line 4037.)

*Proof route:* An elliptic semisimple σ lies in no proper parabolic (§6.1), so §1.3 gives purity of weight 0 for every τ and every ι. Then ν_w^ι(σ) = 0 at every w ∉ S (§2.3) and π_w is tempered (Sawin–Templier Lemma 11.5; SmoothRepresentationsOfLocalGroupsPartII §5.3 and SmoothRepresentationsOfLocalGroups §SR.3.3).

**Checks.**

- For G=PGL₂ and an elliptic cuspidal parameter, the standard representation of the dual SL₂ has weight 0 at all good places, so the spherical components are tempered. The GL_r analogue additionally requires the finite-order central normalization and is not an example of the displayed semisimple hypothesis.

*Needs:* §6.1; §1.3; §2.3; SmoothRepresentationsOfLocalGroupsPartII §5.3 (tempered spherical criterion); SmoothRepresentationsOfLocalGroups §SR.3.3.

### 6.3 Lafforgue–Zhu decomposition over elliptic parameters

Let G be split reductive over K, N a level, Ξ a cocompact central lattice and σ an elliptic parameter occurring in the cuspidal excursion decomposition. There is a finite-dimensional graded ℚ̄_ℓ-space A_σ with commuting actions of the full level-N Hecke algebra and 𝒮_σ=S_σ/Z(Ĝ), such that (H^cusp_({0}∪I,W))_σ ≅ (A_σ⊗W_(σ^I))^(S_σ), where W is an algebraic representation of Ĝ×(LG)^I, Γ^I acts through σ on the moving factors and trivially on the factor 0, and S_σ acts diagonally on all factors of W and through 𝒮_σ on A_σ. This is functorial in W, compatible with coalescence and level change. These generalized excursion eigenspaces are genuine eigenspaces and semisimple as Γ^I-representations; no Hecke semisimplicity of A_σ is asserted. With a suitable auxiliary representation at the frozen leg, each irreducible constituent of τ∘σ occurs in Satake-coefficient shtuka cohomology. The constant-coefficient consequence assumes the Satake-to-constant realization contract.

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. G split (the nonsplit case is conditional on extending Xue's finiteness to nonsplit groups, as Lafforgue–Zhu state); σ is one of Lafforgue's parameters, so it satisfies the conditions (C1)–(C5) of Lafforgue–Zhu §1 (finite coefficients, reductive Zariski closure, unramified outside a finite set, Galois projection, finite image in the abelianization). The Satake-coefficient consequence uses a nonzero A_σ and a suitable auxiliary factor at the frozen leg. The constant-coefficient consequence suggested by Ciubotaru–Harris Remark 5.8 is conditional on the Satake-to-constant realization contract.

(lz, §1, Theorem 1.1 and Proposition 1.2 with Remarks 1.3–1.5, pp. 2–3; §4, Lemma 4.1, p. 7; §2, Corollary 2.1, p.4; ch26, §5, Remark 5.8, pp. 15–16; lz line 107.)

*Proof route:* Use Lafforgue–Zhu Proposition 1.2 and the extra frozen base leg: its Ĝ-representation W₀ supplies the central character needed for (A_σ⊗W₀⊗τ)^(S_σ) to contain the desired τ∘σ constituent. One must retain invariants under the full centralizer S_σ, including its connected centre; invariants under the finite quotient alone give a different formula. Lemma 4.1 supplies the nondeformability input to the proof, not a standalone assertion that every excursion algebra is reduced. The cohomology functors are those of GlobalShtukasAndFunctionFieldLanglands §4.8 with finiteness from GlobalShtukasAndFunctionFieldLanglands §3.10. The exact promotion from Satake-coefficient shtuka cohomology to constant-coefficient stack cohomology must be supplied: Satake IC sheaves are not constant sheaves. This realization bridge is recorded in the Satake-to-constant realization contract; Proposition 1.2 by itself gives the displayed Satake-cohomology formula.

**Checks.**

- For GL_r and irreducible σ, A_σ=π^(K_N) and (H^cusp_(I,W))_σ=π^(K_N)⊗(W^(G_m))_(σ^I) (Corollary 2.1, p.4). For a single moving standard factor without a compensating frozen factor, W^(G_m)=0, so the summand vanishes.

*Needs:* §6.1; GlobalShtukasAndFunctionFieldLanglands §4.8; GlobalShtukasAndFunctionFieldLanglands §3.10; GlobalShtukasAndFunctionFieldLanglands §5.9; DeligneWeightsAndPurity §8.5.

### 6.4 Realisability in the cohomology of stacks

A semisimple lisse ℚ̄_ℓ-sheaf L on X ∖ |S| is realisable in stack cohomology when there are a finite set S′ ⊇ S, an algebraic stack Z of finite type over k₁ and a morphism f: Z → X ∖ |S′| such that every irreducible constituent of L|_(X∖|S′|) is a constituent of some Rⁱf_! ℚ̄_ℓ. Ciubotaru–Harris Expectation 5.9 asks this for L(π, τ) with τ adjoint and τ ∈ T(G); it is recorded here as a hypothesis, not a theorem.

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. Use the adic algebraic-stack categories and proper supports of GlobalShtukasAndFunctionFieldLanglands §1.4.

(ch26, §5, Remark 5.8 and Expectation 5.9, p. 15; ch26 line 731.)

*Proof route:* Direct summands and restriction to a smaller open preserve the predicate. Tensor products use the fibre product of two witnessing stacks, Künneth and exactness on semisimplified finite-rank constituents. Verdier duality changes the constant coefficient sheaf to a dualizing complex and by itself does not prove closure of this constant-coefficient predicate under duals. For elliptic σ, §6.3 gives the Satake-coefficient realization; the extra bridge to constant coefficients is an explicit hypothesis in the Satake-to-constant realization contract.

The construction has the following API.

- The predicate of the statement, with its witness (S′, Z, f).
- Realisable sheaves are closed under tensor product and direct summand; restriction to a smaller open also preserves realisability. Closure under duals requires an additional realization argument.
- Conditional on the stack integrality input of the stack integer-weight contract, a realisable sheaf has integer punctual ι-weights for every ι (§6.5).
- For elliptic σ the Satake-coefficient formula is §6.3; constant-coefficient stack realisability follows once the Satake-to-constant realization contract is supplied.

**Checks.**

- The constant sheaf on X ∖ |S| is realisable with Z = X ∖ |S| and f the identity.
- R¹f_! ℚ̄_ℓ of the Legendre family is realisable with Z the family itself (a scheme).
- With ℓ=5, the constant rank-one étale sheaf on G_m/F₄ whose Frobenius is 3 is not realisable if the stack integer-weight contract holds: its ι-weight is 2 log₄3, not an integer. Choosing ℓ=3 would not define a continuous constant-field étale character.
- For the constant quadratic cover f:U×_(k₁)k₂→U with [k₂:k₁]=2, the rank-two direct image f_*ℚ̄_ℓ has Frobenius eigenvalues 1 and −1 at a rational point. Its nontrivial rank-one constituent is realisable, with witness this cover, although it is not the constant sheaf.
- The zero sheaf has no irreducible constituents and is witnessed by the empty stack, with every direct image equal to zero.

*Needs:* GlobalShtukasAndFunctionFieldLanglands §2.5; DeligneWeightsAndPurity §8.5; §6.3 for the conditional elliptic realization

### 6.5 Integral weights of realisable sheaves

Assuming the stack integrality contract, every irreducible constituent of a stack-realisable L is punctually ι-pure of integer weight. If this realization and integrality hold for all the adjoint and separator modules actually used in Layer 5 (including their lifts over K′ when G is not adjoint), the proof of §5.4 gives its fixed-ι conclusion without a tempered anchor; the arithmetic conclusion additionally requires embedding-independent arithmetic weights in that realization contract. The central-compact and local transfer hypotheses at the place v of §5.4(1) are retained.

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. Assume the stack integrality theorem specified in the stack integer-weight contract: for finite-type f:Z→U, each lisse constituent of Rⁱf_!ℚ̄_ℓ has integer punctual ι-weights. Sun Theorem 2.11 supplies ι-mixedness and is not silently treated as this additional integer-weight assertion.

(ch26, §5, Expectation 5.9 and Sketch 5.10, pp. 15–16; sun, §2, Theorem 2.11, p. 14 (arXiv v2); sun line 667.)

*Proof route:* Sun's Theorem 2.11: the stacky six operations and Verdier duality preserve ι-mixedness. The stack integer-weight contract adds preservation of the integer-weight subclass, using smooth presentations, a hypercover spectral sequence and a mixed dualizing complex. Sun Theorem 2.11 and Remark 2.12 supply the mixedness statement with the boundedness and stack hypotheses in that source. With integer weights for every ι, rerun the proof of §5.4 from the half-integrality step.

**Checks.**

- For Z a scheme the statement is Deligne's integrality of weights of Rf_!.

*Needs:* §6.4; DeligneWeightsAndPurity §8.5; DeligneWeightsAndPurity §7.8; §5.4 for the Ramanujan consequence

### Examples

For GL_r a moving standard representation without a compensating frozen factor has nontrivial central character and no centralizer invariants. A frozen dual factor can compensate it. The constant rank-one sheaf is realized by the identity morphism.

### Dependencies

GlobalShtukasAndFunctionFieldLanglands §5.8; LanglandsParameterStacks §2.5; §1.3; §2.3; SmoothRepresentationsOfLocalGroupsPartII §5.3 (tempered spherical criterion); SmoothRepresentationsOfLocalGroups §SR.3.3; GlobalShtukasAndFunctionFieldLanglands §4.8; GlobalShtukasAndFunctionFieldLanglands §3.10; GlobalShtukasAndFunctionFieldLanglands §5.9; DeligneWeightsAndPurity §8.5; GlobalShtukasAndFunctionFieldLanglands §2.5; DeligneWeightsAndPurity §7.8; §5.4 for the Ramanujan consequence. Each target states its statement and proof-route inputs separately.

## Layer 7: Discrete parameters and Arthur interfaces

### 7.1 Global Arthur homomorphism data

Define weak global Arthur homomorphism data over C=ℚ̄_ℓ as a homomorphism ψ:W_K×SL₂(C)→ᴸG(C), continuous with finite coefficient model on W_K, algebraic on SL₂, compatible with Γ, unramified outside S and Frobenius-semisimple at unramified places, modulo Ĝ(C)-conjugacy. Let N_ψ be the orbit of dψ(e). At w∉S write j_w=diag(q_w^(1/2),q_w^(−1/2)) and define the Satake evaluation as ψ(Frob_w,j_w). This is a map from weak homomorphism data to the semisimple conjugacy classes in the Frobenius component of ᴸG. Boundedness after complex transport is a separate local condition. At ramified places the Weil representation can have its own Deligne monodromy; the Arthur SL₂ does not replace that factor.

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands §5.10). Use the factorizable compact open U and finite set S of Conventions; outside S the chosen U_w is hyperspecial and G is unramified.

(ch26, §1.2, (1.1)–(1.7), pp. 3–4; ch26 line 145.)

*Proof route:* At an unramified place restrict the weak Weil homomorphism and evaluate it with the Arthur SL₂ as displayed. At a ramified place, converting the Weil representation to a WD representation introduces its monodromy/Deligne SL₂; merely restricting the weak homomorphism does not supply this additional factor. N_ψ is defined by Jacobson–Morozov theory in Ĝ (NilpotentOrbits §N2).

The construction has the following API.

- A homomorphism W_K × SL₂(C) → LG(C) as in the statement.
- The nilpotent orbit N_ψ ⊂ Lie(Ĝ).
- ψ_w for each place w, unramified outside S.
- ψ_w(Frob_w, j(Frob_w)) ∈ [LG_ss(C)] at unramified w.
- Equivalence is Ĝ(C)-conjugacy; N_ψ is an invariant.

**Checks.**

- If ψ is trivial on SL₂ then N_ψ=0 and the Satake evaluation of ψ at w=ψ(Frob_w). Boundedness follows only under the separate bounded-Weil-at-w hypothesis of the local Arthur prediction; triviality on SL₂ alone does not imply it.
- For PGL₂ and ψ = 1 ⊠ std, the unramified Satake class is diag(q_w^(1/2), q_w^(−1/2)), weights ±1 in the standard representation of SL₂.
- ψ ↦ ψ|_(W_K × {1}) loses N_ψ: the trivial representation's ψ and the tempered parameter 1 have the same restriction to W_K.
- If ψ(Frob_w) is bounded at the chosen ι, the Deligne ι-weights of τ(the Satake evaluation of ψ at w) are the integer eigenvalues of h_(N_ψ). Arithmetic Weil weights additionally require algebraicity and the same boundedness for every embedding.
- Take G=PGL₂ and an unramified Weil homomorphism whose dual Frobenius is diag(q,q^(−1)), with trivial SL₂. These are valid weak homomorphism data and are unbounded at the chosen complex embedding.

*Needs:* LanglandsParameterStacks §§0.1–0.4; NilpotentOrbits §N2.

### 7.2 Arthur's weight prediction at unramified places

For a discrete automorphic π, weak Arthur data ψ and w∉S, define the local Arthur prediction to require three conditions: (a) every algebraic realization of s(π_w) has algebraic eigenvalues of integer Weil weight; (b) s(π_w) equals the Satake evaluation of ψ up to Ĝ-conjugacy; and (c) the Weil factor of ψ_w is bounded at the specified complex transport. To obtain the arithmetic neutral-element weight multiset, require the matching and boundedness after every embedding. Under these conditions the weights on a representation τ are the eigenvalues of the neutral element h_(N_ψ). Place independence means equality of these integer multiplicity functions at every w∉S. The global decomposition of the discrete spectrum by Arthur homomorphisms, and existence of one ψ realizing all the full Satake classes, are conjectural assertions (ch26, Conjectures 1.3 and 1.8, Expectation 1.9, p. 4). Layer 8 proves its weight and real-part statements without asserting that conjectural construction.

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands §5.10). Use the factorizable compact open U and finite set S of Conventions; outside S the chosen U_w is hyperspecial and G is unramified. When a single integer weight pattern determined by N_ψ is asserted arithmetically, impose (b) and (c) after every embedding. Boundedness at just one embedding need not give the same weights at its algebraic conjugates.

(ch26, §1.2, Conjecture 1.3, Conjecture 1.8 and Expectation 1.9, p. 4; ch26 line 193.)

*Proof route:* (b) and fixed-ι boundedness (c) give the neutral-element eigenvalues as the local ι-weight pattern. For the arithmetic pattern impose the same condition after every embedding, together with the algebraicity in (a). Layer 8 proves place-independent weight patterns and normalized real Satake parts under its stated hypotheses. It does not construct a single global ψ with the required commuting SL₂ and bounded Weil part, and therefore does not prove the full conjunction (a)–(c). The construction of the commuting global SL₂ and matching bounded Weil factor is the conjectural target of §7.2.

The construction has the following API.

- The conjunction (a)–(c) for (π, ψ, w).
- Expectation 1.9 for π.
- Under (a)–(c) the weights of τ(s(π_w)) are the eigenvalues of h_(N_ψ) on τ.
- Given (a)–(c) and N_ψ=0, π_w is tempered at the chosen embedding and its Satake eigenvalues are arithmetic Weil numbers of weight 0. The converse requires a supplied ψ satisfying the actual Satake equality (b).

**Checks.**

- The trivial representation of PGL₂(A_K) satisfies (a)–(c) at every w for ψ = 1 ⊠ std, with weights ±1 in the standard representation.
- If a global ψ with trivial SL₂ and the specified local Satake class is already supplied, and the local class is arithmetically pure of weight 0, then (a)–(c) hold at that place. Temperedness of one spherical representation does not construct such a global ψ.
- A complementary-series π_w of PGL₂ with parameter diag(q^(1/4), q^(−1/4)) fails (a).
- In SL₂ the classes I and −I both have weight multiplicity n(0)=2 in the standard representation but traces 2 and −2. Equality of weight patterns, and hence place-independence of weights, does not imply equality of full Satake classes.
- For cuspidal generic π under the discrete-series-anchor clause of Layer 5, the compatible σ with trivial SL₂ satisfies (a)–(c) at every good place and embedding. Under only the fixed-ι tempered-anchor clause, the fixed-ι weight conclusion does not itself prove arithmetic condition (a).
- For the trivial representation of G(A_K) (residual, ψ = 1 ⊠ principal SL₂) the weights at every w are the eigenvalues of 2ρ̂ on τ.

*Needs:* §7.1; DeligneWeightsAndPurity §0.1.

### 7.3 Compatible global parameters of discrete representations

Let π ⊂ A_disc(G, ℚ̄) be irreducible with m_U(π) ≠ 0. A compatible global parameter for π is a continuous semisimple σ: W_K → LG(ℚ̄_ℓ) (Weil-group valued), unramified outside S, such that for every w ∉ S the Satake class of π_w is ι_ℓ of an algebraic class s_w(π) ∈ [LG_ss(ℚ̄)] and equals [σ(Frob_w)]. The local systems L(π, τ) = τ ∘ σ are then lisse Weil sheaves on X ∖ |S|. Ciubotaru–Harris take σ Galois-valued; Weil-group values are allowed here to include Xue's parameters, and the weight arguments of Layer 1 and Layer 8 hold for lisse Weil sheaves (DeligneWeightsAndPurity §§5.2 and 5.5 supplies Weil sheaves and their constant-Weil-twist reduction to étale sheaves).

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. ℚ̄ is the algebraic closure of Q inside C, and ι: ℚ̄ → C, ι_ℓ: ℚ̄ → ℚ̄_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings ℚ̄ → C, equivalently over all field isomorphisms ℚ̄_ℓ ≅ C after extension. G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands §5.10). Use the factorizable compact open U and finite set S of Conventions; outside S the chosen U_w is hyperspecial and G is unramified.

(ch26, §9.1, Definition 9.4 and Conjecture 9.5(2), p. 31; §9.2, p. 32; ch26 line 1512.)

*Proof route:* For cuspidal π, the parameters of §2.1 are compatible (§2.2), with Galois-valued σ. Under the hypotheses of §7.4 (Conjectures 9.1 and 9.5), every discrete π belonging to some σ ∈ Φ_disc(U) has one. For π with a number-field model occurring in a finite-codimension Hecke quotient of compactly supported forms, Xue gives a compatible parameter (§7.6). Without the number-field model, finite codimension alone does not imply the algebraicity required by this definition.

The construction has the following API.

- A Weil-group parameter σ with the Satake compatibility at all w ∉ S.
- L(π, τ) = τ ∘ σ as a lisse Weil sheaf.
- A cuspidal π belonging to σ ∈ Φ(U) has the compatible parameter σ.
- det(1 − T·Frob_w | L(π, τ)) = det(1 − T·τ(ι_ℓ s_w(π))).

**Checks.**

- The trivial representation of PGL₂(A_K) has the compatible parameter σ(Frob_w) = diag(q_w^(1/2), q_w^(−1/2)) (σ = |·|^(1/2) ⊕ |·|^(−1/2) composed to SL₂), a Weil-group parameter not attached to a cusp form.
- Compatibility at w ∉ S determines σ only up to local conjugacy at each Frobenius; two non-conjugate σ may both be compatible for non-GL_n groups.
- For every compatible σ and τ trivial, L(π, 1) is the constant sheaf of rank one.
- Without algebraicity of s_w(π) the compatibility cannot even be stated over ℚ̄.

*Needs:* §2.2; §2.1; DeligneWeightsAndPurity §5.2; DeligneWeightsAndPurity §5.5.

### 7.4 The parametrization hypotheses for the discrete spectrum

The parametrization hypotheses for (G, U) are: (9.1) for every noetherian Z[1/p]-algebra E ⊂ C, A_disc(G, U, E) is a finite E-module and A_disc(G, U, E) ⊗ C ≅ A_disc(G, U, C); (9.5)(1) the excursion algebra acts on A_disc(G, U, ℚ̄_ℓ) and decomposes it as ⊕_σ A_disc(G, U, ℚ̄_ℓ)_(λ(σ)) (display (9.3)); (9.5)(2) for σ ∈ Φ_disc(U) and w ∉ S the Satake class of λ_w(σ) is ι_ℓ(s_w(σ)) with s_w(σ) ∈ [LG_ss(ℚ̄)] and equals [σ(Frob_w)]. A discrete π belongs to σ when π^U lies in the λ(σ)-summand.

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. ℚ̄ is the algebraic closure of Q inside C, and ι: ℚ̄ → C, ι_ℓ: ℚ̄ → ℚ̄_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings ℚ̄ → C, equivalently over all field isomorphisms ℚ̄_ℓ ≅ C after extension. G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands §5.10). Use the factorizable compact open U and finite set S of Conventions; outside S the chosen U_w is hyperspecial and G is unramified.

(ch26, §9.1, Conjecture 9.1, display (9.3), Definition 9.4 and Conjecture 9.5, pp. 30–31; ch26 line 1468.)

*Proof route:* The hypotheses hold for the cuspidal spectrum (§2.2). Under (9.1), base change to ℂ gives the finite-dimensional unitary discrete-spectrum module. Its Hecke action is semisimple over ℂ and hence after algebraic scalar extension as used by §7.5. No semisimplicity over an arbitrary characteristic-zero coefficient ring E is asserted.

The construction has the following API.

- Conjecture 9.1: finiteness and base change of A_disc(G, U, E).
- The decomposition over the excursion algebra (9.3).
- Conjecture 9.5(2): algebraic Satake classes equal to Frobenius classes.
- Every discrete π with m_U(π) ≠ 0 has a compatible global parameter (§7.3).

**Checks.**

- Restricted to A₀(G, U), (9.1) is FunctionFieldArithmetic §6.5 and (9.5) is Lafforgue's theorem.
- For PGL₂ the trivial representation lies in A_disc and has parameter with σ(Frob_w) = diag(q_w^(1/2), q_w^(−1/2)), algebraic as (9.5)(2) requires.
- The hypotheses do not assert that the excursion algebra is reduced; generalized eigenspaces suffice.
- For G anisotropic, A_disc(G, U, C) = A(G, U, C) is finite-dimensional and (9.1) holds trivially.
- For PGL₂ the residual characters have the form χ∘det with χ²=1, so that the character descends from GL₂ to PGL₂; their parameters are explicit.

*Needs:* FunctionFieldArithmetic §6.5; GlobalShtukasAndFunctionFieldLanglands §5.9; §7.3 (compatible-parameter interface)

### 7.5 Rationality of the discrete spectrum under the finiteness hypothesis

Assume Conjecture 9.1 for (G,U). Then the eigenvalues of H^S(G,U) on A_disc(G,U,C) are algebraic, and A_disc(G,U,ℚ̄)=⊕_(π:π^U≠0)m_U(π)π^U. Each irreducible π occurring at this level has a number-field model. To deduce the assertion for every discrete automorphic π, impose Conjecture 9.1 at all sufficiently small levels.

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. ℚ̄ is the algebraic closure of Q inside C, and ι: ℚ̄ → C, ι_ℓ: ℚ̄ → ℚ̄_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings ℚ̄ → C, equivalently over all field isomorphisms ℚ̄_ℓ ≅ C after extension. G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands §5.10). Use the factorizable compact open U and finite set S of Conventions; outside S the chosen U_w is hyperspecial and G is unramified. The assertion about a representation π at fixed level U concerns π with π^U≠0. To assert the result for every discrete automorphic π, assume Conjecture 9.1 at every sufficiently small level.

(ch26, §9.1, Lemma 9.2 and the decomposition after it, p. 31; ch26 line 1479.)

*Proof route:* A_disc(G, U, Q) is a finite-dimensional Q-space stable under the Hecke algebra with integral structure; its eigenvalues are algebraic and the action is semisimple over a large number field, as in Lemma 3.2. For π^U≠0 use the full level-U Hecke algebra, rather than good-place eigenvalues alone. Its image on the finite-dimensional rational space A_disc(G,U,Q) is a finite-dimensional Q-algebra. Its simple modules have models over finite extensions of Q; the simple Hecke-module/smooth-representation correspondence recovers π from π^U. This also accounts for a finite Schur-index extension. The all-representations assertion uses sufficiently small levels.

**Checks.**

- Restricted to the cuspidal spectrum the hypothesis holds by FunctionFieldArithmetic §6.5 and the conclusion is §2.2. A rational Hecke matrix [[0,−1],[1,0]] on a two-dimensional rational space has characteristic polynomial X²+1 and eigenvalues ±i, obtained over Q(i): rationality of A_disc gives algebraic eigenvalues after a finite extension, not rational ones, and the Schur-index extension of the proof route is of the same kind.

*Needs:* §7.4; FunctionFieldArithmetic §6.5; SmoothRepresentationsOfLocalGroups §SR.1.3.

### 7.6 Xue: parametrization of finite-codimension Hecke quotients

Let G be split reductive over K, N a level, Ξ a cocompact central lattice, u ∉ N a place and 𝔍 an ideal of finite codimension in the spherical Hecke algebra H_(G,u). Then C_c(Bun_(G,N)(F_q)/Ξ, ℚ̄_ℓ) is of finite type over H_(G,u) (Proposition 1), so the quotient Q = C_c/𝔍·C_c is finite-dimensional, and Q decomposes canonically as ⊕_σ H_σ over continuous semisimple σ: Weil(K̄/K) → Ĝ(ℚ̄_ℓ) unramified outside N, H_σ being the generalized eigenspace for the character f((σ(γ_i))) of the excursion algebra; H_σ lies in the generalized eigenspace of T(h_(V,v)) with eigenvalue χ_V(σ(Frob_v)) for v ∉ N. The decomposition is compatible with constant-term morphisms. A discrete automorphic π with a number-field model occurring in such a quotient has a compatible global parameter (§7.3). For a constituent π the full compact-support comparison of Li-Huerta Theorem 6.13 also identifies σ|_(W_(K_v))^(ss)=L_(K_v)(π_v) at ramified places, whenever π lies in the chosen σ generalized eigenspace. No algebraicity of eigenvalues for arbitrary coefficient-field ideals 𝔍 is asserted.

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. G split; Hecke operators on Q need not be diagonalizable (Xue Remark 3.6.8).

(xue, Introduction, Proposition 1 and Theorem 2, pp. 2–3; §3.6, Definition 3.6.5, Lemma 3.6.6 and Theorem 3.6.7 with Remarks 3.6.3 and 3.6.8, pp. 30–31; §4.2, pp. 40–41; ch26, §9.2, p. 32; lh, §6, Theorem 6.10, §6.11 and Theorem 6.13, pp. 46–48; xue line 1412.)

*Proof route:* Finiteness of compactly supported shtuka cohomology over H_(G,u) (Xue Theorem 2; GlobalShtukasAndFunctionFieldLanglands §3.12) gives the Weil^I action via Drinfeld's lemma for finite-type H_(G,u)-modules (GlobalShtukasAndFunctionFieldLanglands §4.12). Excursion operators on C_c (GlobalShtukasAndFunctionFieldLanglands §5.4) descend to Q and generate a finite-dimensional commutative algebra B_𝔍; continuity in (γ_i) (Lemma 3.6.6) and continuous reconstruction from GlobalShtukasAndFunctionFieldLanglands §5.8 give Theorem 3.6.7. Satake compatibility is Xue Theorem 3.6.7. For a constituent π with a number-field model, its spherical Hecke character is algebraic, and the normalized Satake isomorphism identifies an algebraic semisimple class with σ(Frob_v). The rational structure on C_c alone does not make an arbitrary ℚ̄_ℓ-ideal 𝔍 algebraic. Ciubotaru–Harris (§9.2) speak of ideals of finite codimension in H^S(G, U); such an ideal contains a finite-codimension ideal 𝔍 of a single H_(G,u), so their quotients are quotients of Xue's Q and inherit the decomposition. Li-Huerta Theorem 6.13, with Theorem 6.10/§6.11, compares the local excursion algebra via the Bernstein centre with global excursions on the full C_c space. The commuting identity descends to 𝔍-quotients and their generalized eigenspaces. Evaluating its character on a π^U constituent gives the local semisimple parameter, including at ramified v. This uses the full C_c theorem rather than only the cuspidal Theorem A.

**Checks.**

- For H=ℚ̄_ℓ[T] and 𝔍=(T−2) the quotient H/𝔍 has dimension 1 and T acts by the scalar 2: Q is the largest quotient on which H acts by that character (Xue Remark 3.6.3). For 𝔍=(T−2)² the quotient has dimension 2 and T−2 acts by a nonzero nilpotent, so Q is a generalized eigenspace and not a quotient on which T acts by 2; the decomposition of the statement is into generalized eigenspaces.
- On the cuspidal part the decomposition is Lafforgue's.
- For the abstract Hecke algebra ℚ̄_ℓ[T], the codimension-one ideal (T−a) can have a transcendental a over Q. Finite codimension alone is not an algebraicity argument; the positive constituent statement uses the given number-field model.

*Needs:* GlobalShtukasAndFunctionFieldLanglands §3.12; GlobalShtukasAndFunctionFieldLanglands §4.12; GlobalShtukasAndFunctionFieldLanglands §5.4; GlobalShtukasAndFunctionFieldLanglands §5.8; GlobalShtukasAndFunctionFieldLanglands §5.3; §7.3; §3.2 (full compact-support local comparison); §3.3 (normal-image and coefficient transport)

### Examples

For the residual trivial PGL₂ representation, Arthur data with trivial Weil factor and the identity SL₂ give weights −1,1 at every place. Weak data with trivial SL₂ and Frobenius diag(4,1/4) are unbounded at q=4 and do not satisfy the local prediction.

### Dependencies

LanglandsParameterStacks §§0.1–0.4; NilpotentOrbits §N2; DeligneWeightsAndPurity §0.1; §2.2; §2.1; DeligneWeightsAndPurity §5.2; DeligneWeightsAndPurity §5.5; FunctionFieldArithmetic §6.5; GlobalShtukasAndFunctionFieldLanglands §5.9; SmoothRepresentationsOfLocalGroups §SR.1.3; GlobalShtukasAndFunctionFieldLanglands §3.12; GlobalShtukasAndFunctionFieldLanglands §4.12; GlobalShtukasAndFunctionFieldLanglands §5.4; GlobalShtukasAndFunctionFieldLanglands §5.8; GlobalShtukasAndFunctionFieldLanglands §5.3; §3.2 (full compact-support local comparison); §3.3 (normal-image and coefficient transport). Each target states its statement and proof-route inputs separately.

## Layer 8: Global weight patterns and elimination of extraneous points

### 8.0 Weight recognition of real Satake classes

For the recognition statement let G be an unramified, hence quasi-split, connected reductive group over a local function field F, with dual torus T̂, Frobenius Fr acting through the pinned outer action, and relative Weyl group W_rel = W^Fr acting on (t̂_ℝ)^(Fr). For ν ∈ (t̂_ℝ)^(Fr) and an algebraic representation τ of Ĝ define the weight multiplicity function n_(ν,τ): ℤ → ℕ by letting n_(ν,τ)(i) be the number of weights μ of τ, counted with multiplicity, with 2⟨μ,ν⟩ = i, and call ν geometric when every such pairing 2⟨μ,ν⟩ is an integer for every τ. For the real part ν of a Satake class at a place with residue cardinality q, n_(ν,τ)(i) is the number of eigenvalues of τ(q^ν) of absolute value q^(i/2). Prove that two geometric ν, ν′ ∈ (t̂_ℝ)^(Fr) satisfy n_(ν,τ) = n_(ν′,τ) for every algebraic τ iff they are W_rel-conjugate. The comparison is between normalized real parts, so it applies to Satake classes at places of different residue cardinalities (ch26, Proposition 10.2, p. 32, ch26 line 1554).

Layer 8 uses the following local spherical results of SmoothRepresentationsOfLocalGroupsPartII: the Aubert involution D_G and its irreducible representative AZ(π), for every connected reductive group over a local function field, with no splitting hypothesis, AZ(π) having the cuspidal support of π (SmoothRepresentationsOfLocalGroupsPartII §7.1, *aubert-involution*); for split adjoint G, Kazhdan–Lusztig triples, the nilpotent strata Sph(G,O∨) of the spherical dual, central points q^(h∨/2), spherical complementary series CS(G,O∨) and their reduction to the triple centralizer (SmoothRepresentationsOfLocalGroupsPartII §§7.3–7.8); extraneous real parts (SmoothRepresentationsOfLocalGroupsPartII §7.9), with their lists for symplectic and spin duals in terms of the multiplicity r_j of Jordan blocks of size j and the residual indicators ε_j (SmoothRepresentationsOfLocalGroupsPartII §7.10, *extraneous-classical*), and the seven exceptional points F₄ B₃, F₄ Ã₁+A₁, E₇ D₅(a₁)+A₁ and E₈ D₆, A₆, A₄+A₂, A₂+2A₁ (SmoothRepresentationsOfLocalGroupsPartII §7.11, *extraneous-exceptional*), with the E₈ 4A₁ exclusion (SmoothRepresentationsOfLocalGroupsPartII §7.12). These lists concern real or central-compact Satake parameters; noncentral compact parts reduce to the centralizer of the compact part (SmoothRepresentationsOfLocalGroupsPartII §7.13), and no list is applied to them here. Prove that L_F(AZ(π)) = L_F(π) for every irreducible π, with L_F the semisimple local parametrization of §3.3. The affine-Hecke condition Ad(s)e = q·e of a Kazhdan–Lusztig triple is not the Weil–Deligne relation r(Frob)Nr(Frob)⁻¹ = q⁻¹N of Conventions (ch26, §4.2, Proposition 4.5, p. 12; §8.1, Theorem 8.3 and Definition 8.4, pp. 27–28; ch26 line 563, ch26 line 1330).

*Proof route:* Evaluate the character of τ at q^ν as the finite sum Σ_i n_(ν,τ)(i) q^(i/2). Equal multiplicity functions for every τ give equal characters, and characters of algebraic representations separate semisimple conjugacy classes of Ĝ (the Weyl characters of ReductiveGroups §§10A–10B). Real elements q^ν and q^(ν′) of T̂ that are Ĝ-conjugate are W-conjugate, and ν and ν′ are then W-conjugate because the exponential is injective on t̂_ℝ. For Fr-fixed ν and ν′ this is W_rel-conjugacy, since the Fr-fixed part of the dominant chamber is a fundamental domain for W_rel. For L_F(AZ(π)) = L_F(π), AZ(π) and π are constituents of the same normalized induction from a supercuspidal representation of a Levi subgroup, and §3.3 computes L_F of every such constituent from that cuspidal datum.

The construction has the following API.

- For every ν, n_(ν,τ) is finitely supported, n_(ν,τ^∨)(i) = n_(ν,τ)(−i) and n_(wν,τ) = n_(ν,τ) for w ∈ W_rel. For geometric ν, moreover Σ_i n_(ν,τ)(i) = dim τ and n_(ν,τ⊗τ′) is the convolution of n_(ν,τ) and n_(ν,τ′).
- For geometric ν and ν′, n_(ν,τ) = n_(ν′,τ) for every algebraic τ iff ν and ν′ are W_rel-conjugate.
- For every connected reductive G over F and every irreducible π, L_F(AZ(π)) = L_F(π); no equality of monodromy operators is asserted.

**Checks.**

- For ν=(1/4,−1/4) in dual SL₂ the standard weights pair to 2⟨μ,ν⟩=±1/2, so n_(ν,std) is the zero function although dim std = 2; the sum law needs geometricity, and this point is excluded from recognition.
- For two zero real parts every representation has its full dimension in weight 0, and the zero-dimensional representation contributes the zero function. The trivial representation alone gives n(0)=1 for every ν and cannot distinguish nonzero real parts, which is why recognition quantifies over all τ.
- In dual Spin₈ the real parts ν=½(1,1,1,1) and ν′=½(1,1,1,−1) are geometric and have the same vector profile, value 4 at ±1. They are not W(D₄)-conjugate, since an odd number of sign changes is needed, and the half-spin module V(ω̂₁), with weights ½(±1,±1,±1,±1) with an even number of minus signs, separates them: its profile is 1,6,1 at 2,0,−2 for ν and 4,4 at 1,−1 for ν′. A recognition statement through the vector representation alone would identify them.
- In dual Sp₆ the central point (1/2,1/2,1/2) of the orbit (2,2,2) has standard profile 3,3 at 1,−1, while the extraneous point (0,1/2,1) has profile 1,1,2,1,1 at 2,1,0,−1,−2; their squared norms 3/4 and 5/4 also show that they are not Weyl-conjugate. §8.5 compares these two profiles.
- At ν=(1/2,−1/2) in dual SL₂ the positive root pairs to 1. For q_v=4 and q_w=16 the numerical adjoint eigenvalues are 4 and 16, while both multiplicity functions are 1,1,1 at 2,0,−2. Recognition compares the normalized real parts, not the numerical operators.
- For PGL₂ at q=4, the trivial and Steinberg representations have semisimple pair (2,1/2) and are exchanged by AZ, so L_F(AZ(π)) = L_F(π) holds for both; their monodromy ranks 0 and 1 differ, so no monodromy equality is claimed.
- For G anisotropic over F the only parabolic is G, D_G is the identity and AZ(π) = π, so the two parameters are literally equal. An adjoint inner form split at v and anisotropic at u is admitted at the anchor u of §8.6, where no split classification is used.

*Needs:* §2.3 (normalized real part); §3.3 (L_F and normalized induction); SmoothRepresentationsOfLocalGroupsPartII §7.1 (Aubert involution and cuspidal support), SmoothRepresentationsOfLocalGroupsPartII §§7.3–7.13 (strata, complementary series and extraneous lists); ReductiveGroups §§10A–10B (algebraic Weyl characters and character separation); RepresentationTheory/LieHighestWeight Layer 6 (Weyl characters); ReductiveGroupsPartII §RG2.5.1 (dual torus and relative Weyl group).

### 8.1 Global weight patterns

Let π have a compatible global parameter σ (§7.3) such that L(π, τ) has integer weights for every τ (for instance π_u geometric at some place u, by §1.2). The global weight pattern is n(i, π, τ):= rank gr_i^W L(π, τ). For every w ∉ S, the weight multiplicity function of §8.0 of the real part of s_w(π), normalized with q = q_w and τ restricted to Ĝ, equals n(·, π, τ) for every τ.

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. ℚ̄ is the algebraic closure of Q inside C, and ι: ℚ̄ → C, ι_ℓ: ℚ̄ → ℚ̄_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings ℚ̄ → C, equivalently over all field isomorphisms ℚ̄_ℓ ≅ C after extension. G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands §5.10). Use the factorizable compact open U and finite set S of Conventions; outside S the chosen U_w is hyperspecial and G is unramified. Whenever geometricity or an Aubert anchor at u is used, require σ|_(W_(K_u))^(ss)=L_(K_u)(π_u). This follows for cuspidal parameters by §3.3 and for a chosen Xue quotient eigenspace by §7.6 with Li-Huerta Theorem 6.13. For a bare hypothetical parameter known only by good-place Satake compatibility, it is an additional hypothesis.

(ch26, §10.1, definition of the weight pattern, p. 32; proof of Theorem 1.11, pp. 32–33; ch26, §2.4, Proposition 2.7, p. 8; ch26 line 1549.)

*Proof route:* gr_i^W L(π, τ) is punctually pure of weight i, so its rank is the number of Frobenius eigenvalues of weight i at every w ∉ S (§1.2 (b)). The eigenvalues of τ(σ(Frob_w)) are those of τ(s_w(π)) by compatibility.

The construction has the following API.

- n(·, π, τ): ℤ → ℕ, finitely supported, Σ_i n(i, π, τ) = dim τ.
- For every w ∉ S, n(·, π, τ) is the weight pattern of s_w(π) along τ, with weights relative to q_w.
- n(·, π, τ ⊗ τ′) is the convolution of n(·, π, τ) and n(·, π, τ′); n(i, π, τ^∨) = n(−i, π, τ).
- For semisimple G and unitary π, n(i) = n(−i) (the class is conjugate to its inverse up to the compact part).

**Checks.**

- For the trivial representation of PGL₂(A_K) and τ the standard representation of SL₂, n(1) = n(−1) = 1, n(i) = 0 otherwise.
- If every L(π,τ) is arithmetically pure of weight 0, as in the discrete-series-anchor clause of Layer 5, n(0,π,τ)=dim τ. Temperedness at a single complex embedding alone does not imply this arithmetic assertion.
- Without integer weights (no geometric place) the ranks of ι-weight pieces could depend on ι and the pattern is undefined; the complementary-series class diag(q^(1/4), q^(−1/4)) has no weight pattern.

*Needs:* §7.3; §1.2; §8.0 (weight multiplicity functions).

### 8.2 Propagation of complementary series

Let G be connected semisimple over K and split at v, and let π ⊂ A_disc(G, ℚ̄) with m_U(π) ≠ 0 having a compatible global parameter (§7.3: π cuspidal, or occurring in a finite-codimension Hecke quotient, or under the hypotheses of §7.4). Assume a place u with π_u geometric (§3.4) and a place v ∉ S with π_v ⊗_ι ℂ in the complementary series CS(G(K_v), O^∨) of a nilpotent orbit O^∨. Then: (a) for every w ∉ S, s_w(π) is geometric with the same L-group weight pattern as s_v(π), and for every split such w the normalized real parts ℜ(s_w) and ℜ(s_v) are Weyl-conjugate; (b) if G is adjoint, w ∉ S is split and s_v and s_w have central compact parts, π_w ⊗_ι ℂ lies in CS(G(K_w), O^∨); (c) if G is adjoint and s_v has central compact part, ℜ(s_v) is the central point ½h^∨ of O^∨ or one of the extraneous real parts listed in SmoothRepresentationsOfLocalGroupsPartII §§7.10–7.12, and every split w ∉ S has the same real part.

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. ℚ̄ is the algebraic closure of Q inside C, and ι: ℚ̄ → C, ι_ℓ: ℚ̄ → ℚ̄_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings ℚ̄ → C, equivalently over all field isomorphisms ℚ̄_ℓ ≅ C after extension. Use the factorizable compact open U and finite set S of Conventions; outside S the chosen U_w is hyperspecial and G is unramified. Whenever geometricity or an Aubert anchor at u is used, require σ|_(W_(K_u))^(ss)=L_(K_u)(π_u). This follows for cuspidal parameters by §3.3 and for a chosen Xue quotient eigenspace by §7.6 with Li-Huerta Theorem 6.13. For a bare hypothetical parameter known only by good-place Satake compatibility, it is an additional hypothesis.

(ch26, §1.2, Theorem 1.11, p. 5; §10.1, Proposition 10.2 and the proof of Theorem 1.11, pp. 32–33; ch26 line 1566.)

*Proof route:* §1.2 at u gives integer weights for every L(π, τ); §8.1 makes the weight pattern of s_w independent of w ∉ S. For comparison at split places, apply §1.2 on a connected finite splitting cover to every Ĝ-representation; normalization by residue degree preserves the integer weights. The recognition theorem of §8.0 (Ciubotaru–Harris Proposition 10.2) then determines the normalized real part up to the absolute Weyl group, giving (a). For (b), equality of normalized real parts gives the same root subsets ⟨α,ν⟩=0 and ⟨α,ν⟩=1. With central compact parts these identify the centralizer root algebra and the q_w-eigenspace of Ad(s_w), and similarly at v. Their nilpotent strata match under the root-datum identification; the numerical operators Ad(s_w) and Ad(s_v) need not be equal because q_w can differ from q_v. Unitarity then places π_w in the same complementary-series stratum (SmoothRepresentationsOfLocalGroupsPartII §7.6). For (c) apply the centralizer reduction and the real or central-compact extraneous lists of SmoothRepresentationsOfLocalGroupsPartII §§7.8–7.12 componentwise to the simple factors of the split local adjoint group at v. No split-unitary-dual classification is asserted at nonsplit w. No claim of these classifications for arbitrary compact parts or arbitrary non-adjoint groups is made.

**Checks.**

- For O^∨=0 in the central-compact sector, the real part is 0 at v and at every split w∉S; this conclusion uses no global splitting of G.
- Sp(6) dual, O^∨ = (2,2,2): the possible real parts are ½h^∨ = (½, ½, ½) and the extraneous (0, ½, 1) (Remark 8.6).

*Needs:* §7.3; §3.4; §1.2; §8.1; §8.0 (weight recognition); SmoothRepresentationsOfLocalGroupsPartII §§7.6–7.12 (strata, complementary series and extraneous lists); §5.2; §7.6.

### 8.3 The weight array of a global parameter at a ramified place

With π, σ, u ∈ S and τ as in §8.2 and L(π, τ) with integer weights, let a(i, k)(τ) be the dimension of the generalized eigenspace of weight k of Frob_u on the fibre at u of gr_i^W L(π, τ). Then: the row sums Σ_k a(i, k) are n(i, π, τ) = n_v(i) (the global pattern, equal to that of s_v); the column sums Σ_i a(i, k) are the weight multiplicities n_u(k) of τ ∘ L_F(π_u) at u; and a(i, i + j) = a(i, i − j) for all i, j. View this as a finitely supported natural-valued function on ℤ×ℤ. Its row and column margins are `Finsupp.mapDomain` along the first and second projections; the geometry supplies the symmetry needed for §8.4.

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. ℚ̄ is the algebraic closure of Q inside C, and ι: ℚ̄ → C, ι_ℓ: ℚ̄ → ℚ̄_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings ℚ̄ → C, equivalently over all field isomorphisms ℚ̄_ℓ ≅ C after extension. G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands §5.10). Use the factorizable compact open U and finite set S of Conventions; outside S the chosen U_w is hyperspecial and G is unramified. Whenever geometricity or an Aubert anchor at u is used, require σ|_(W_(K_u))^(ss)=L_(K_u)(π_u). This follows for cuspidal parameters by §3.3 and for a chosen Xue quotient eigenspace by §7.6 with Li-Huerta Theorem 6.13. For a bare hypothetical parameter known only by good-place Satake compatibility, it is an additional hypothesis.

(ch26, §10.2, proof of Theorem 10.3, (10.4)–(10.6), pp. 33–34; ch26 line 1616.)

*Proof route:* Row sums: dim gr_i^W = n(i, π, τ) (§8.1). Column sums: the fibre at u of L(π, τ) is the Weil representation τ ∘ σ|_(W_(K_u)), whose semisimplification is τ ∘ L_F(π_u) (§3.3). Symmetry: (gr_i^W)_u is pure of weight i as a Weil–Deligne representation (§1.2 (c)), so N^j identifies the weight i + j and i − j pieces.

The construction has the following API.

- a: ℤ → ℤ → ℕ vanishing outside a finite window, attached to (π, τ, u).
- A diagonal array (no monodromy) has equal row and column sums.
- r(i) = Σ_k a(i, k) = n_v(i).
- c(k) = Σ_i a(i, k) = n_u(k).
- a(i, i + j) = a(i, i − j).
- Σ_i r(i) = Σ_k c(k) = dim τ.

**Checks.**

- The array a(0, 1) = a(0, −1) = 1 (zero elsewhere) satisfies the symmetry but has r = 2·δ₀ and c = δ₁ + δ₋₁: equality of row and column sums is not automatic.
- If N = 0 on every graded piece at u, a is diagonal and r = c.
- For rank two with gr₀ = L and L_u ≅ Sp(2) normalized to common weight 0 (Frobenius weights −1, 1), a(0, 1) = a(0, −1) = 1.
- For a diagonal singleton a(−2,−2)=3, the two margins both have value 3 at −2 and 0 elsewhere; a positive-index-only definition would lose this piece.

*Needs:* §8.1; §1.2; §3.3; §8.2 (global and anchor hypotheses)

### 8.4 Property A for symmetric weight arrays

Let a: ℤ × ℤ → ℕ have finite support and satisfy a(i, i + j) = a(i, i − j) for all i, j; let r(i) = Σ_k a(i, k) and c(i) = Σ_k a(k, i). Then either a is diagonal and r = c, or at the largest index i₀ with r(i₀) ≠ c(i₀) one has c(i₀) > r(i₀). This auxiliary finite-array theorem uses the native finitely supported function carrier and its two `Finsupp.mapDomain` margins, without a chosen bounding interval.

Throughout this statement, a has finite support; no other hypothesis.

(ch26, §10.2, Property A and its proof, pp. 33–34; Remark 10.8, p. 35; ch26 line 1639.)

*Proof route:* Downward induction from an index above the support. Suppose r(i) = c(i) for all i > i₁ and that a(i, k) = a(k, i) = 0 for i > i₁, k ≠ i. Row i₁ is diagonal: a(i₁, k) = 0 for k > i₁ since column k > i₁ is diagonal, and for k < i₁ by symmetry with 2i₁ − k > i₁. Hence r(i₁) = a(i₁, i₁) ≤ c(i₁). If r(i₁) = c(i₁) then column i₁ is diagonal too and the induction continues; otherwise c(i₁) > r(i₁) at the first (largest) index of difference.

**Checks.**

- The array of Remark 10.8 (a(0, ±1) = 1) has largest difference index 1 with c(1) = 1 > r(1) = 0.
- A diagonal array has r = c.
- With a(2,1)=a(2,3)=1, row(2)=2 and col(1)=col(3)=1; the greatest discrepancy is 3 and col(3)=1>row(3)=0.
- The zero array has both margins 0 at every integer and satisfies the diagonal alternative without a greatest support element.
- Without row symmetry, the single entry a(1,0)=1 has greatest discrepancy 1 with col(1)=0<row(1)=1; symmetry is essential.
- With signed coefficients, a(0,±1)=−1 would give col(1)=−1<row(1)=0. Natural-number multiplicities are essential.

*Needs:* Mathlib `Finsupp`, `Finsupp.mapDomain`, `Finsupp.sum`, `Finset.sum_comm` and `Finset.sum_eq_single`; nonnegative multiplicities and finite support.

### 8.5 Weight multiplicity comparisons excluding extraneous points

For each extraneous real part x attached to the orbit O∨ in the real or central-compact lists of SmoothRepresentationsOfLocalGroupsPartII §§7.10–7.11, prove the following comparison on an actual representation τ of Ĝ. There is a largest discrepancy i₀ such that n_x(i)=n_(h/2)(i) for i>i₀ and n_x(i₀)>n_(h/2)(i₀), where n_y = n_(y,τ) is the weight multiplicity function of §8.0, so n_y(i) is the multiplicity of weights μ with 2⟨μ,y⟩=i. For Sp(2n) use its standard representation and the largest even j with r_j≥3 and ε_j=1; for Spin(m) use its vector representation and the largest odd j with r_j≥3 and ε_j=1, with r_j and ε_j as in SmoothRepresentationsOfLocalGroupsPartII §7.10. The discrepancy is +1. For the adjoint representations of exceptional duals the comparisons are: F₄ B₃, i₀=8, multiplicities 2>1; F₄ short A₁ plus A₁, i₀=4, 1>0; E₇ D₅(a₁)+A₁, i₀=9, 1>0; E₈ D₆, i₀=16, 2>1; E₈ A₆, i₀=13, 1>0; E₈ A₄+A₂, i₀=9, 1>0; E₈ A₂+2A₁, i₀=5, 1>0. Equality above each index is included. Use the named-orbit profile contract to attach each neutral element to the named orbit; an array of dimensions bearing an orbit label is insufficient.

(ch26, §10.2, proof of Theorem 10.3, cases (1)–(5), p. 34; §8.2, Theorem 8.5 and Remark 8.6, pp. 28–29; Appendix Tables 2–3, pp. 36–37; ch26 line 1657.)

*Proof route:* Use the sl₂ decomposition of the named neutral element to obtain its multiplicities, and compare with the weight multiplicities of the actual dual-group representation at x. The named-orbit profile contract supplies the semantic identification of the exceptional neutral element. Classical comparisons use the partition multiplicity spaces of SmoothRepresentationsOfLocalGroupsPartII §7.10, with the shift on an orthogonal factor so(r) along ε_⌊r/2⌋. The explicit checks below and the root-system comparisons in the worked examples fix the discrepancy direction.

**Checks.**

- Sp(6), O^∨ = (2,2,2): standard weights ±e_i, central (½, ½, ½) gives n(±1) = 3; x = (0, ½, 1) gives n(2) = 1, n(1) = 1, n(0) = 2, n(−1) = 1, n(−2) = 1; i₀ = 2.

*Needs:* §8.0 (weight multiplicity functions); SmoothRepresentationsOfLocalGroupsPartII §§7.10–7.11 (extraneous lists); NilpotentOrbits §N2 (triples) and §N2.4 (exceptional-named-orbit-profiles contract); RepresentationTheory/LieHighestWeight Layer 0 (sl₂ strings).

### 8.6 Elimination of extraneous points

Under the hypotheses of §8.2 with G adjoint over K and split at v and s_v of central compact part, assume moreover that u ∈ S and π_u ≅ AZ(σ_u), with AZ the Aubert representative of SmoothRepresentationsOfLocalGroupsPartII §7.1, for an irreducible discrete series σ_u whose pure Weil–Deligne parameter (§4.5) has monodromy in O^∨. Then for every split w ∉ S the real part of the Satake parameter of π_w is the central point ½h^∨ of O^∨; no split unramified component is extraneous. Moreover all monodromy operators N_i on (gr_i^W L(π, τ))_u vanish.

Throughout this statement, K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q_w = |k(w)| for a place w; ℓ ≠ p is a prime. ℚ̄ is the algebraic closure of Q inside C, and ι: ℚ̄ → C, ι_ℓ: ℚ̄ → ℚ̄_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings ℚ̄ → C, equivalently over all field isomorphisms ℚ̄_ℓ ≅ C after extension. Use the factorizable compact open U and finite set S of Conventions; outside S the chosen U_w is hyperspecial and G is unramified. Whenever geometricity or an Aubert anchor at u is used, require σ|_(W_(K_u))^(ss)=L_(K_u)(π_u). This follows for cuspidal parameters by §3.3 and for a chosen Xue quotient eigenspace by §7.6 with Li-Huerta Theorem 6.13. For a bare hypothetical parameter known only by good-place Satake compatibility, it is an additional hypothesis.

(ch26, §1.2, Theorem (Theorem 10.3), pp. 5–6; §10.2, Theorem 10.3 with its proof and Remark 10.7, pp. 33–35; ch26 line 1592.)

*Proof route:* L_F(π_u) = L_F(σ_u) by §8.0 (L_F(AZ(π)) = L_F(π) for every connected reductive group), which needs no splitting or quasi-splitness of G at u; so n_u is the weight pattern of the Frobenius of the pure parameter of σ_u, whose normalized real exponent is Weyl-conjugate to h/2, with h the neutral element of an sl₂-triple through the monodromy (bounded part ϕ₀, §4.5). By §8.2 (c), ℜ(s_v) is ½h^∨ or extraneous. For nonsplit G over K, make the detecting-representation comparison on a connected finite splitting cover: every Ĝ-representation then defines a local system, and restriction raises Frobenius to a positive power without changing normalized weights or the monodromy orbit. This uses restriction of σ, not automorphic base change. In the extraneous case §8.5 gives a representation violating Property A for the array constructed as in §8.3 on that cover, contradicting §8.4. So n_v = n_u, the pattern of ½h^∨; by §8.1 and the recognition theorem of §8.0 every split w ∉ S has real part ½h^∨. With n_u = n_v the array is diagonal (Property A, first alternative), which is the vanishing of every N_i (Remark 10.7).

**Checks.**

- For O^∨ = 0, σ_u supercuspidal and AZ(σ_u) = σ_u: the theorem says the real part is 0 at every split unramified place, recovering the generic statement in that case.

*Needs:* §8.2; §8.3; §8.4; §8.5; §8.1; §4.5; §8.0 (weight recognition and L_F(AZ(π)) = L_F(π)); SmoothRepresentationsOfLocalGroupsPartII §§7.1 and 7.9–7.12 (Aubert representative and extraneous lists); NilpotentOrbits §N2.4 (exceptional-named-orbit-profiles contract).

### Examples

For dual Sp₆ the central and extraneous standard profiles are respectively 3δ₁+3δ₋₁ and δ₂+δ₁+2δ₀+δ₋₁+δ₋₂. At the greatest discrepancy 2 the extraneous multiplicity 1 exceeds the central multiplicity 0, in the opposite direction from Property A for global rows and ramified columns.

### Dependencies

§2.3 (normalized real part); §3.3 (L_F and normalized induction); SmoothRepresentationsOfLocalGroupsPartII §§7.1 and 7.3–7.13 (Aubert representative, Kazhdan–Lusztig strata, complementary series and extraneous lists); ReductiveGroups §§10A–10B (algebraic Weyl characters and character separation); RepresentationTheory/LieHighestWeight Layers 0 and 6 (sl₂ strings and Weyl characters); ReductiveGroupsPartII §RG2.5.1 (dual torus and relative Weyl group); §1.2; §3.4; §4.5; §5.2; §7.3; §7.6; NilpotentOrbits §§N2 and N2.4 (triples; exceptional-named-orbit-profiles contract); Mathlib `Finsupp`, `Finsupp.mapDomain`, `Finsupp.sum`, `Finset.sum_comm` and `Finset.sum_eq_single`; nonnegative multiplicities and finite support. Each target states its statement and proof-route inputs separately.

## Downstream consumers

The exported results are the generic Ramanujan theorem and genericity propagation (§§5.4–5.5), the local Fargues–Scholze comparison and the geometricity theory of local representations (§§3.0–3.8 and 4.5–4.8), the elliptic and stack realizations (Layer 6), and the propagation and elimination theorems for complementary series (§§8.2 and 8.6). The counting, crystalline-companion, special-cycle, Tate-cohomology and potential-automorphy directions listed in Scope consume the parent global geometry rather than the Ramanujan theorem. Arthur-type applications consume the exact conditional interfaces of Layer 7 and the real-part theorem of §8.6; they do not receive a constructed global ψ.

## Worked examples

The rank-one, rank-two and Sp₆ examples in the layers are also the normalization witnesses for every imported comparison. At q=4, weights −1,1 correspond to eigenvalue absolute values 1/2,2; at a degree-two place they correspond to 1/4,4 over q_w=16. The normalized real exponents remain −1/2,1/2.

For the dual F₄ use the coordinate roots ±2e_i, ±e_i±e_j and (±e₁±e₂±e₃±e₄), with the four zero Cartan weights added in the adjoint representation. The corrected B₃ extraneous point is x=(5/2,1,1/2,0), which is ω₁+½ω₃+½ω₄ in the coordinates of ch26 (6.21). Its adjoint top multiplicities at weights 10,9,8 are 1,0,2. The B₃ neutral profile at those weights is 1,0,1. Adding the extra printed ω₂ term would give top weight 16 and would fail this check. The short A₁ plus A₁ point has top weight 4 with multiplicity 1, while the central profile has maximum 3 (ch26, §6.8, (6.21), Theorem 8.5 and Table 3; ch26 line 1813).

For E₈ use the roots ±e_i±e_j and the half-coordinate roots with an even number of minus signs, with eight zero Cartan weights. At the D₆ point, multiplicities at weights 18,17,16 are 1,0,2, against neutral values 1,0,1. The A₆, A₄+A₂ and A₂+2A₁ points have top weights 13,9,5 respectively, each of multiplicity 1, while the corresponding neutral maxima are 12,8,4. The E₇ point has multiplicities 1,1 at 10,9; its D₅(a₁)+A₁ neutral profile has 1,0 there. The named-orbit profile contract includes the latter semantic identification (ch26, §10.2, p. 34, cases (4)–(5), Tables 2–3; ch26 line 1668).

For the symmetric array a(0,−1)=a(0,1)=1, global row multiplicities are r(0)=2 and ramified column multiplicities are c(−1)=c(1)=1. Total rank is 2 on each side; the largest disagreement is 1 with c(1)=1>r(1)=0. If an extraneous global profile required r(2)=1 and c(2)=0 with equality at larger indices, Property A would contradict it. This uses the direction of the inequality, not merely equality of total ranks (ch26, Property A and Remark 10.8, pp. 34–35; ch26 line 1639, ch26 line 1691).

## References

All statements above use the versions specified here, with their own theorem numbers. Source-line locators refer to the corresponding legally obtained text. The published Ciubotaru–Harris numbering is not used.

- **ch26**: Dan Ciubotaru, Michael Harris, *On the generalized Ramanujan and Arthur conjectures over function fields* (2023). [2311.15300v1](https://arxiv.org/abs/2311.15300v1). Locators: §2.3, Definition 2.5, p. 7; §2.3, Definition 2.6, p. 7; §5, proof of Theorem 5.4, equation (5.5), p. 14; §2.4, Proposition 2.7, p. 8; §3.1, decomposition (3.3), Lemma 3.5 and Definition 3.7, pp. 9–10; §5, equation (5.3), p. 13; §3, Proposition 3.1, Lemma 3.2, Lemma 3.5 and Theorem 3.6 with the paragraph after it, pp. 8–10; §5, equation (5.1) and Lemma 5.2, p. 12; §6, (6.2), p. 17; §3.2, Theorem 3.8 and the paragraph after it, p. 10; §3.2, Theorem 3.8, p. 10; §3.2, Definition 3.9, p. 10; §3.2, Proposition 3.10(1) and its proof, pp. 10–11; §3.2, Proposition 3.10(2) and its proof, pp. 10–11; §3.2, Proposition 3.10(3) and its proof, pp. 10–11; §3.2, Proposition 3.10(4) and its proof, pp. 10–11; §4.1, Definition 4.1 and the paragraph after it, p. 11; §4.2, paragraph after Proposition 4.5, p. 12; proof of Theorem 5.4, p. 14; §3.2, Proposition 3.10(5) and the last line of its proof, p. 11; §4.1, Theorem 4.2 and the sketch (1)–(4) after Theorem 4.3, pp. 11–12; §4.1, Theorem 4.3 and step (2) of the sketch, p. 11; §5, the table after Theorem 5.4, p. 13; §6.12, Proposition 6.31, p. 24; §5, proof of Theorem 5.4, p. 14 and footnote 6; §5, proof of Theorem 5.4, pp. 14–15; §1.1, the main theorem and the outline of its proof, pp. 2–3; §5, Theorem 5.4 and its proof, pp. 13–15; §5, Corollary 5.7 and its proof, p. 15; §5, Remark 5.8, p. 16; §5, Remark 5.8 and Expectation 5.9, p. 15; §5, Expectation 5.9 and Sketch 5.10, pp. 15–16; §1.2, (1.1)–(1.7), pp. 3–4; §1.2, Conjecture 1.3, Conjecture 1.8 and Expectation 1.9, p. 4; §9.1, Definition 9.4 and Conjecture 9.5(2), p. 31; §9.2, p. 32; §9.1, Conjecture 9.1, display (9.3), Definition 9.4 and Conjecture 9.5, pp. 30–31; §9.1, Lemma 9.2 and the decomposition after it, p. 31; §9.2, p. 32; §10.1, definition of the weight pattern, p. 32; proof of Theorem 1.11, pp. 32–33; §1.2, Theorem 1.11, p. 5; §10.1, Proposition 10.2 and the proof of Theorem 1.11, pp. 32–33; §10.2, proof of Theorem 10.3, (10.4)–(10.6), pp. 33–34; §10.2, Property A and its proof, pp. 33–34; Remark 10.8, p. 35; §10.2, proof of Theorem 10.3, cases (1)–(5), p. 34; §8.2, Theorem 8.5 and Remark 8.6, pp. 28–29; Appendix Tables 2–3, pp. 36–37; §1.2, Theorem (Theorem 10.3), pp. 5–6; §10.2, Theorem 10.3 with its proof and Remark 10.7, pp. 33–35.

- **ghs**: Wee Teck Gan, Michael Harris, Will Sawin, Raphaël Beuzart-Plessis, *Local parameters of supercuspidal representations* (2024). [10.1017/fmp.2024.10](https://www.cambridge.org/core/journals/forum-of-mathematics-pi/article/local-parameters-of-supercuspidal-representations/10EEB98855332F11F5555C45665BBA5F). Published text; Locators: Theorem 1.2; §2.1, finite-order central characters, p. 5; Lemma 3.5; Proposition 3.11; Appendix A, Lemmas A.1 and A.3.

- **lh**: Siyan Daniel Li-Huerta, *Local-global compatibility over function fields* (2023). [2301.09711v2](https://arxiv.org/abs/2301.09711v2). Locators: §5, Propositions 5.13–5.14, Theorem 5.16 and Lemma 5.18, pp. 37–41; §§2–4, Theorem 2.12, Theorem 4.9 and Proposition 4.12, pp. 8–33; §6, Lemma 6.4 and §6.13, pp. 42–47; Introduction, Theorems A and C, pp. 2–3; §6, Theorems 6.13, 6.15 and §6.16, pp. 47–49; §7.2, p. 51; §6, Theorem 6.10, §6.11 and Theorem 6.13, pp. 46–48; §§1.1 and 5.1, parahoric models, pp. 5 and 33.

- **st**: Will Sawin, Nicolas Templier, *On the Ramanujan conjecture for automorphic forms over function fields I. Geometry* (2018). [1805.12231v4](https://arxiv.org/abs/1805.12231v4). Locators: §11, Lemma 11.4 and its proof, p. 83; §11, Lemmas 11.4–11.5, p. 83.

- **xue**: Cong Xue, *Finiteness of cohomology groups of stacks of shtukas as modules over Hecke algebras, and applications* (2018). [1811.09513v3](https://arxiv.org/abs/1811.09513v3). Locators: Introduction, Proposition 1 and Theorem 2, pp. 2–3; §3.6, Definition 3.6.5, Lemma 3.6.6 and Theorem 3.6.7 with Remarks 3.6.3 and 3.6.8, pp. 30–31; §4.2, pp. 40–41.

- **lz**: Vincent Lafforgue, Xinwen Zhu, *Décomposition au-dessus des paramètres de Langlands elliptiques* (2018). [1811.07976v2](https://arxiv.org/abs/1811.07976v2). Locators: §1, definition before Proposition 1.2, p. 3; §2, p. 4; §3, p. 5 (Lie(S_σ) = (Ad)^σ); §3, p. 5; §1, Theorem 1.1 and Proposition 1.2 with Remarks 1.3–1.5, pp. 2–3; §4, Lemma 4.1, p. 7; §2, Corollary 2.1, p.4.

- **sun**: Shenghao Sun, *L-series of Artin stacks over finite fields* (2010). [1008.3689v2](https://arxiv.org/abs/1008.3689v2). Locators: §2, Theorem 2.11, p. 14 (arXiv v2).

- **glo**: Wee Teck Gan, Luis Lomelí, *Globalization of supercuspidal representations over function fields and applications* (2015). [1510.00131v2](https://arxiv.org/abs/1510.00131v2). Locators: Theorem 1.1, pp. 1–2; §8, Lemma 8.1 and Proposition 8.2 with the remark after it, pp. 38–40.

- **hny**: Jochen Heinloth, Ngo Bao Chau, Zhiwei Yun, *Kloosterman sheaves for reductive groups* (2010). [1005.2765v1](https://arxiv.org/abs/1005.2765v1). Locators: Theorems 1–2 and Corollary 2.13, pp. 16–18 (arXiv v1).

- **ty**: Richard Taylor, Teruyoshi Yoshida, *Compatibility of local and global Langlands correspondences* (2004). [math/0412357v2](https://arxiv.org/abs/math/0412357v2). Locators: §1, Lemma 1.4(3)–(6) and proof, pp.6–7.

- **laf02**: Laurent Lafforgue, *Chtoucas de Drinfeld et correspondance de Langlands* (2002). [10.1007/s002220100174](https://www.laurentlafforgue.org/math/fulltext.pdf). Locators: Théorème VII.6, Proposition VII.7, Corollaire VII.8, pp. 198–202.

- **fs**: Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence* (2021). [2102.13459v4](https://arxiv.org/abs/2102.13459v4). Locators: Theorem I.9.6(ii), (vi)–(vii), p. 36; Theorem VIII.4.1 and Corollary VIII.4.3, pp. 291–293; Proposition IX.3.2, pp. 326–327; Definition/Proposition IX.4.1, p. 327; Proposition IX.5.1, pp. 327–328; Theorem IX.5.2, p. 329.

- **xz**: Daxin Xu, Xinwen Zhu, *Bessel F-isocrystals for reductive groups* (2019). [1910.13391v2](https://arxiv.org/abs/1910.13391v2). Locators: arXiv v2: Theorems 4.2.1, 4.3.3 and 4.4.4, pp. 42–50; §§4.3.4–4.3.6, pp. 47–49; §4.4.1, pp. 49–50; §4.4.2, p. 50; §4.3.1 and Lemma 4.5.5, pp. 47, 52–53; Corollaries 4.5.6–4.5.7 and Remark 4.5.8, pp. 53–54.

- **stacks-as**: The Stacks Project Authors, *The Stacks Project, Étale Cohomology*. [Tags 03PL](https://stacks.math.columbia.edu/tag/03PL), [03R7](https://stacks.math.columbia.edu/tag/03R7) and [0A3K](https://stacks.math.columbia.edu/tag/0A3K), Lemmas 28.1 and 63.1 and Theorem 61.6, pp. 31, 95 and 97; Kummer exactness, the Brauer comparison and characteristic-p Artin–Schreier vanishing.

- **andre-bessel**: Yves André, *Représentations galoisiennes et opérateurs de Bessel p-adiques*, Annales de l’Institut Fourier 52 (2002), 779–808. [Numdam open archive](https://www.numdam.org/item/AIF_2002__52_3_779_0/). Locator: Proposition 3.2 and proof, pp. 788–789, andre-bessel line 393; algebraic coefficients and the exterior-annulus hypothesis are retained.

- **zhu-fg**: Xinwen Zhu, *Frenkel–Gross’ irregular connection and Heinloth–Ngô–Yun’s are the same* (2016). [1603.05796v2](https://arxiv.org/abs/1603.05796v2). Locators: arXiv v2, §§3.4–4.2, Propositions 14–15 and Lemma 16, pp. 17–19; Theorem 8 and Corollary 9, pp. 9–10; Lemmas 17–21 and Remark 5.1, pp. 20–23.
