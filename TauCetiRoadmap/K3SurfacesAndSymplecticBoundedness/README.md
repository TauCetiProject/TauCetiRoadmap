# Roadmap: k3 surfaces, part ii — picard lattices and symplectic boundedness

**Summary.** Extend K3Surfaces to native schemes over arbitrary fields and all characteristics, from smooth proper surfaces and coherent cohomology to their geometric and arithmetic Picard lattices. The base roadmap treats projective algebraic K3 surfaces over algebraically closed fields in its characteristic-p>2 lane and complex analytic K3 surfaces, including their periods, cones and Torelli; this Part II supplies arbitrary-field descent, the characteristic-2 differential theorem, arithmetic boundedness and polarized moduli. Develop characteristic-independent cohomology and faithful automorphism actions, bound every finite automorphism subgroup uniformly, retain the sharper tame symplectic bounds, and construct fixed-degree polarized Deligne–Mumford moduli of finite type over the integers.

## Scope and ownership

This roadmap owns the arbitrary-field extension of the unpolarized algebraic K3 predicate and its specialization adapter, field descent, the all-characteristic extension of the coherent calculations, crystalline and integral étale cohomology, the geometric realization of the Picard lattice, arithmetic rank descent, symplectic actions, K3 quotient calculations and fixed-degree polarized moduli. Smoothness is relative to the field, including imperfect fields. Projectivity is a theorem of general smooth proper surfaces, not a field of the predicate. The endpoints are the rank and descent bounds, faithful cohomological actions, uniform finite-subgroup bounds, tame symplectic bounds, polarized moduli and finite-field finiteness in Layers 1–8.

K3Surfaces, Conventions and K0, owns the algebraically closed projective presentation and its contraction and coherent numerical calculations; K0.A owns the characteristic-p>2 algebraic one-form/vector-field theorem and its Serre-dual consequence. K3Surfaces, Conventions and K1, owns the analytic K3 predicate, projective algebraic/analytic equivalence, Hodge numbers and exponential/Chern–Picard comparison; K2 owns the integral singular cup lattice, its freeness and marking. These targets are consumed once, with the specialization maps of §1.3. The arbitrary-field predicate below differs by allowing nonclosed and imperfect fields, imposing properness and proving projectivity; it stores no volume-form choice. Its algebraically closed projective specialization is the same unpolarized condition. The analytic predicate is used on K3Surfaces' carrier without a second definition. No stage of K3Surfaces consumes this Part II.

The native scheme morphism predicates, relative differential sheaf, sheaf exterior powers and internal-Hom duals, coherent cohomology with its base-ring action, line-bundle classes, rational-ambient integral lattice carrier, field-Brauer/Galois comparison and algebraic finite-field Brauer triviality are already in the pinned libraries. Their exact declarations appear below; this roadmap does not redefine those objects. SchemeAndStackFoundations §1.17 owns projective finite-group quotients; §§2.10 and 2.15 own topology/field comparisons and finite-cover Hochschild–Serre. Its §§2.20, 4.1–4.6, 4.14 and 5.8–5.10 own generic surface duality, deformations, Hilbert/Isom, RR, geometric numerical equivalence and Hodge index. JacobianChallenge Layers A, C and D own line-bundle classes, proper coherent finiteness/base change and projective Picard representability over fields; Layer D is not limited to a curve representability theorem. AlgebraicVectorBundles L0A–L0C own the exterior-power, determinant and pullback comparison theory. IntegralLattices, Completed Layers 1–5 and active Layers 1, 5–6, own abstract lattices and discriminant theory. The K3 lattice instance differs by being tied to actual line bundles and geometric intersection numbers. NoncommutativeAndEquivariantIwasawa §0.1 owns uniform pro-p groups, including the uniformity and hence torsion-freeness of the first principal congruence subgroup of GL_n(ℤ_ℓ) for every odd prime ℓ and n≥0; §4.5 applies that result to finite subgroups.

EtaleCohomologyFoundations F.0.3, F.2, F.4–F.6 and §0.9 own generic coefficients, base change, duality and cycle classes. ComplexKahlerGeometry K3–K6.1 owns native analytic sheaves, bundles and Kähler Hodge theory, and its Part II owns the exponential Chern comparison, shared with K3Surfaces K1, and the Chern-class intersection adapter (gap:integral-topology); ComplexComparisonPartII C−1.1, C1.9, C2.2, C3.2d.2–C3.2d.5, C5.1 and C6.3/C6.6 own analytification, GAGA, relative Picard representability and Artin comparison. AlgebraicModuliForArithmeticGeometry §7.6.1–§7.6.1a owns the relative class sheaf and section splitting. AlgebraicTopology Stage 6 owns integral products, universal coefficients and manifold duality; MorseNovikov N6 owns the topological Lefschetz formula. CrystallineCohomology CR.2.3, CR.3, CR.4 and CR.7.3 own the generic crystalline and de Rham–Witt comparisons. StableReduction Layer 2 owns effective polarized scheme descent; the ample algebraic-space scheme criterion and local/global projectivity are derived from it below. AdicSpacesPartIII F0.3 and F0.8 own the formal-scheme/tower comparison and effective algebraization of proper formal schemes carrying an invertible sheaf with ample closed-fibre restriction; SchemeAndStackFoundations §4.10 supplies coherent modules and morphisms on given schemes. Extensions of these suppliers are their Part II contracts below; each contract specifies where the base theory stops. The geometric K3 instances remain the targets of this roadmap.

NeronModelsAndSemistableAbelianVarietiesPartII owns genus-one fibration theory: the genus-one fibration carrier over a smooth proper curve with its localization to the native DVR model and its field-change comparisons (§2.1), fibre-type divisors (§2.2), the geometric fibre classification (§§2.3, 2.5), the canonical formula and Hodge-line degree (§§4.1–4.2), the generic Picard restriction theorem on regular surfaces over regular one-dimensional bases and Shioda–Tate generation (§§4.7–4.8), the characteristic restriction on quasi-elliptic fibrations (§4.16) and the regular minimal Jacobian fibration with its zero section (§4.17). Section 6.0b consumes these by section and owns only what that roadmap does not state: the fibre root quotient with its square-index determinant law, the Euler-characteristic and fibre-type comparisons between a genus-one fibration and its Jacobian including the quasi-elliptic case, the numerical restriction and determinant laws of a Jacobian fibration, quasi-elliptic unirationality over ℙ¹, and the rank-five K3 pencil. The K3 pencil, recognition of its Jacobian as K3, Picard-rank deductions and finite-action consequences belong to §§6.0b–6.3a; no rational-elliptic-surface classification is a premise.

EllipticCurves Layer 4 owns the symbol type `ReductionSymbol`; NeronModelsAndSemistableAbelianVarietiesPartII §2.3 owns its geometric fibre realization, including multiple and quasi-elliptic fibres, on that same symbol type, and §6.0b consumes it.

McKaySkewGroup Layer 0 owns the classification of finite subgroups of SL₂(ℂ) by concrete models, with conjugators and transport of the defining representation; its §§7.1–7.3 own the complex invariant quotients, their ADE hypersurface presentations and their minimal resolutions. NilpotentOrbits N8 owns the explicit complex ADE resolutions, their exceptional curves and integral intersection matrices. The contracts gap:tame-linear-groups and gap:tame-quotient-singularities consume these stages and add only the transport to every algebraically closed field of characteristic zero, the tame positive-characteristic extension, tame local linearization, rationality and discrepancy.

ComplexCurveModuli D0–D2 and D7 fix compatible analytic curve conventions but supply no surface theorem here. AbelianSchemesAndArithmeticModuli, ArithmeticDynamics and ErdosProgressionPowers supply no premise. PeriodsAndSpecialValues consumes the K3 outputs, including those used in K3/Bloch-group applications.

The K3 example in ArithmeticDynamics §1.26 concerns canonical heights of divisor eigenclasses; §5.4 here constructs the surface and its symplectic automorphisms. These examples are independent.

The bounded quantities are Picard rank, the degree of a rank-revealing field extension, the order of a finite automorphism subgroup, and the finite-type family for a fixed positive polarization degree. Rank does not bound lattice discriminants. The full symplectic automorphism group need not be finite. Period maps, Global Torelli, Kuga–Satake, abstract lattice classification, Tate/Shafarevich theorems, Bloch identities and special values are outside these endpoints. In particular the necessity direction of the finite-group classification does not consume a period-map realization theorem.

## Conventions

All schemes and coefficient fields lie in a fixed universe, with comparison isomorphisms transported along universe lifts when necessary. A field is nontrivial. A geometric fibre uses an algebraically closed overfield of its residue field. Cohomology degrees and exterior degrees are nonnegative; Ωᵖ=0 for p>2 on a smooth surface. Pic denotes the additive version of the native multiplicative line-bundle class group. The unpolarized predicate stores only existence of canonical triviality.

The surface pairing is the integral bilinear intersection B, with positive square for an ample line. An even lattice uses Q(x)=B(x,x)/2 in ℤ. Source notation disc Pic means the signed Gram determinant B, represented by the lattice determinant, while the discriminant-group order is its absolute value. The library term discriminant form retains its finite-module meaning. Signature (1,ρ−1) abbreviates the native triple (1, 0,ρ−1) after nondegeneracy. A quartic hyperplane has B(H,H)=4 and Q(H)=2, while a rational curve has B(C,C)=-2. In the rank 22 geometric case the sign is negative. Surface RR is written 2χ(L)=4+L² in integers, so it is meaningful also in characteristic 2.

The étale pairing is positive cup-trace: tr(c₁(L)∪c₁(M))=L·M with c₁(L) in H²(ℤ_ℓ(1)) and trace H⁴(ℤ_ℓ(2))→ℤ_ℓ. Thus on a quartic the value is 4. Rizov §2.4 writes its auxiliary form with a minus sign; that auxiliary form is the negative of the pairing used here. No unchosen Tate generator identifies a twist with the untwisted coefficient module equivariantly.

Automorphisms compose as maps. Pullback satisfies (f∘g)*=g*∘f*, so the left representation is inverse pullback. Its kernel is precisely the actual symplectic condition f*σ=σ. Contraction by σ is v↦σ(v,−); in a frame with σ(e₁,e₂)=1 it sends e₁,e₂ to e₂*,-e₁*. These computed witnesses fix both direction and sign; the sign becomes plus in characteristic 2. All identities, including the inverse-pullback law, are required as proved tests when their carriers are available. Aut_k(X) is the group of automorphisms of X over Spec k, the native `CategoryTheory.Aut` of `Over.mk f` for the structure morphism f; a finite subgroup is a native `Subgroup` with `Finite`, and its order is `Nat.card`. The pullback of a line-bundle class along the underlying morphism of an automorphism is `TauCeti.AlgebraicGeometry.LineBundleClass.pullback`; an automorphism fixes every class under pullback exactly when it does so under inverse pullback, so both conventions have the same kernel.

A finite group action is faithful through its inclusion in Aut, and tame means that the order is invertible in the base field. In characteristic zero every finite group is tame. The identity has the entire surface as fixed locus and is excluded from the nonidentity element table. The Mathieu action used for orbit counts is the 24-letter action of M₂₄ restricted to its point stabilizer M₂₃, with the stabilized letter retained. At identity its character is 24; at order 2 it is 8. Polarization degree is L²=2d with d>0; geometric primitivity is additional. Families use Picard sections and Cartesian isomorphisms, with no chosen line-isomorphism data. Cubing gives rank 9d+2 of sections and projective dimension 9d+1.

## Exact supplier contracts

### From Mathlib

The baseline is `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. Read declarations at this pin:

- `AlgebraicGeometry.SmoothOfRelativeDimension` and its `smooth` lemma, in `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean`, give the relative dimension 2 hypothesis and native smoothness. This is not absolute regularity.
- `AlgebraicGeometry.IsProper`, in `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean`, combines separatedness, universal closedness and local finite type.
- `AlgebraicGeometry.GeometricallyIntegral`, in `Mathlib/AlgebraicGeometry/Geometrically/Integral.lean`, requires integral geometric field fibres; it includes nonemptiness. Its base-change instance and `isIntegral_of_subsingleton` have the needed field domain.
- `Matrix.GeneralLinearGroup`, `Matrix.GeneralLinearGroup.map` and `Matrix.GeneralLinearGroup.map_apply`, in `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`, give invertible matrices and entrywise change of coefficients; `IsOfFinOrder`, in `Mathlib/GroupTheory/OrderOfElement.lean`, is the native finite-order predicate. The finite subgroup restrictions in §4.5 use the native `Subgroup` carrier.
- `CategoryTheory.Aut`, in `Mathlib/CategoryTheory/Endomorphism.lean`, with its `Group` instance, and `CategoryTheory.Over.mk`, in `Mathlib/CategoryTheory/Comma/Over/Basic.lean`, present Aut_k(X) as the automorphism group of the structure morphism in the over category; `Nat.card` measures a finite subgroup of it. The finite-subgroup and wild-prime headlines of §§6.4 and 6.6 are stated on this carrier.
- `PadicInt.toZMod` and `PadicInt.ker_toZModPow`, in `Mathlib/NumberTheory/Padics/RingHoms.lean`, give reduction to 𝔽_ℓ and kernel (ℓⁿ). `PadicInt.ext_of_toZModPow` in the same file separates all residue levels; `PadicInt.mem_span_pow_iff_le_valuation` in `Mathlib/NumberTheory/Padics/PadicIntegers.lean` identifies the power filtration for a nonzero entry. The standing prime and nonzero hypotheses are retained. The finite-subgroup reduction consequence is §4.5.

- `WittVector.isDiscreteValuationRing`, in `Mathlib/RingTheory/WittVector/DiscreteValuationRing.lean`, and `WittVector.quotientPEquiv`, in `Mathlib/RingTheory/WittVector/Complete.lean`, give the DVR W(k) and its residue-field identification W(k)/(p)≅k for a perfect field k of characteristic p>0. These are the coefficient-ring facts used in §2.4.

- `littleWedderburn` (alias `Finite.divisionRing_to_field`), in `Mathlib/RingTheory/LittleWedderburn.lean`, makes a finite division ring a field; the cohomological field-Brauer comparison is the composite specified below.

### From Tau Ceti

The baseline is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Read declarations at this pin:

- `AlgebraicGeometry.Scheme.relativeDifferentials` and `relativeDifferentialsHomEquiv`, in `TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.lean`, use native schemes over Spec R and the native module-sheaf category. `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf.rank_relativeDifferentials_apply`, in the companion `Rank.lean`, gives rank n under relative smoothness of dimension n. The curve-only invertible differential adapter is not used as a surface canonical line.
- `SheafOfModules.exteriorPower`, in `TauCeti/Algebra/Category/ModuleCat/Sheaf/ExteriorPower.lean`, is the native sheaf exterior-power functor; `SheafOfModules.dual`, in `TauCeti/Algebra/Category/ModuleCat/Sheaf/TensorProduct/Closed.lean`, is the internal-Hom dual. Applying the second exterior power to relative differentials states canonical triviality without constructing a new determinant carrier.
- `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`, in `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean`, is the Zariski cohomology of a native module sheaf. `AlgebraicGeometry.Scheme.Modules.cohomologyBaseModule`, in `TauCeti/AlgebraicGeometry/Cohomology/Module/Base.lean`, restricts its global-function action to the specified base ring. A zero group is expressed by `Subsingleton`; finite-dimensionality is a separate conclusion in the Hodge-number theorem.
- `TauCeti.AlgebraicGeometry.LineBundleClass`, `LineBundleClass.mk_eq_mk_iff`, `mk_tensorProduct` and `mk_eq_one_iff`, in `TauCeti/AlgebraicGeometry/LineBundle/Class.lean`, supply the global Picard class carrier and tensor/dual/trivial comparisons. The class is a skeleton of invertible sheaves, not an affine ring Picard group.
- `TauCeti.AlgebraicGeometry.LineBundleClass.pullback`, `pullback_id` and `pullback_comp`, in `TauCeti/AlgebraicGeometry/LineBundle/Functoriality.lean`, give the pullback of a line-bundle class along a scheme morphism with its identity and composition laws. The Picard-faithfulness headline of §6.4a is stated on this map.
- `TauCeti.IntegralLattice`, `IntegralLattice.ofSubmodule` and `integralForm_cast`, in `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean`, use a full finite ℤ-submodule of a rational vector space and an integral symmetric rational form. Nondegeneracy is a separate mixin. §4.2 supplies precisely the geometric instance.
- `TauCeti.Model` and `TauCeti.Model.IsProper`, in `TauCeti/AlgebraicGeometry/Curves/StableReduction/Model/Basic.lean`, give a flat finitely presented DVR model with a specified generic-fibre isomorphism, and its separate properness predicate. Neither regularity, relative minimality nor smoothness of the generic fibre is a field of this carrier. The companion `TauCeti/AlgebraicGeometry/Curves/StableReduction/Model/BaseChange.lean` supplies `TauCeti.Model.baseChange` and `TauCeti.Model.baseChangeGenericFiberIso` for a `TauCeti.FiniteDVRExtension`; this is a finite DVR-extension API. NeronModelsAndSemistableAbelianVarietiesPartII §2.1 constructs the global-to-local adapter from a genus-one fibration to this carrier and compares it with this existing API; §6.0b consumes that adapter and does not construct it again.

- `TauCeti.subsingleton_brauerGroup_of_finite`, in `TauCeti/Algebra/BrauerGroup/Trivial.lean`, proves `Subsingleton (BrauerGroup k)` for any finite field k, in the full Brauer carrier universes. Together with the following comparisons it gives H²_fppf(Spec k,G_m)=0 for finite k.

- `TauCeti.brauerCohomologyEquiv`, in `TauCeti/Algebra/CrossedProduct/Comparison.lean`, is the additive equivalence from Br(k) to H²_cont(G_k,(kˢ)ˣ) for every field k. Compose its inverse with SchemeAndStackFoundations §2.10 `smoothGroup_fppf_etale_comparison` for G_m and §2.15 `etale_galois_comparison` in degree two to identify H²_fppf(Spec k,G_m) with Br(k).

### From TauCetiRoadmap.K3Surfaces

Consume Conventions and K0 for the algebraically closed projective K3 presentation, canonical-line pullback, contraction by a nonzero two-form, h⁰(ω)=1, χ(O)=2 and c₂=24 on their stated algebraic domain. Consume K0.A for H⁰(Ω¹)=H⁰(T)=H²(T)=0 over algebraically closed fields of characteristic p>2. Consume K1 for the analytic predicate, projective algebraic/analytic equivalence, its coherent/canonical/Picard maps, the Hodge diamond and integral (1,1) description of Pic; consume K2 for the actual integral H² cup lattice of signature (3,19), its torsion-freeness, integral marking and pullback isometries. The remaining integral cohomology groups follow from its simple connectivity and integral manifold duality. Only these stages are prerequisites: periods, cones, Torelli and Enriques applications K3–K7 supply no premise.

K3Surfaces is a direct supplier. Its K1 consumes IndexTheory I7.3 for the Dolbeault-symbol identification and index/Todd normalization used in its analytic surface Riemann–Roch calculation. The required order is IndexTheory I7.3 → K3Surfaces K1 → K3Surfaces K2 → the complex/Betti applications here. IndexTheory is therefore a transitive supplier, and the K3 numerical specialization does not replace it. Its K1 identification of Pic with integral (1, 1)-classes consumes ComplexKahlerGeometry's exponential comparison, the first item of gap:integral-topology below. The required order is that comparison → K3Surfaces K1 → §§1.3, 3.1 and 4.4 here; the second item, the intersection adapter, enters §3.1 directly. The exponential comparison is not constructed a second time here.

The adapter of §1.3 identifies the algebraic presentations on the same structure morphism after projectivity, and §1.2 permits field descent. A chosen volume form is extra input to contraction; rescaling it by a∈kˣ rescales contraction by a and changes neither predicate nor Picard class. The characteristic-2 vanishing and arbitrary-field extension of the coherent calculations are §§2.1a–2.4. The complex comparison is applied through this adapter, with the positive cup-trace convention and exponential normalization exp(2πiz) (huybrechts, Chapter 1 §§3.1–3.3, lines 405–511; arapura-chern, §7.5, Lemma 7.5.1 and Definition 7.5.2, p.150, uncertified locator).

### From TauCetiRoadmap.SchemeAndStackFoundations

Consume §0.9, §0.11, §1.1, §1.11, §§1.18–1.21, §1.23, §2.10, §2.11, §2.15, §§2.19–2.21, §2.23, §3.4, §§4.1–4.6, §4.10, §§4.11–4.12, §4.14, §§5.8–5.10. Native field descent, spaces/stacks and coarse spaces, Kummer, surface duality, equivariant cohomology, marked deformations, coherent existence and morphism algebraization on given proper schemes, modifications, Hilbert/Isom, RR and the geometric numerical quotient/Hodge index.

Consume §1.17 `finiteGroupQuotient_projective`, §2.10 `smoothGroup_fppf_etale_comparison`, and §2.15 `etale_galois_comparison` and `hochschildSerre_galois_covering`. The last theorem applies to every abelian étale sheaf, including G_m, on a finite étale G-torsor; multiplicative notation for G_m does not change its abelian-sheaf domain. Consume §2.19 `trace`, §2.20 `cm_serre_duality` and §2.21 `coherent_duality`, `trace_finite`: proper coherent duality identifies the dual of pullback on H²(O) with trace on global canonical forms. On a finite étale locus this is the ordinary degree trace; §6.8a applies it after resolving a generically finite rational map.

Consume §3.4 `classGroup_picard_locallyFactorial`, `picard_excision_sequence` and `picard_units_sequence` for divisor classes, restriction to open subschemes and the vertical kernel. The generic-fibre Picard restriction built from these on regular surfaces over regular one-dimensional bases is NeronModelsAndSemistableAbelianVarietiesPartII §4.7; §6.0b consumes it and uses §3.4 directly only for the vertical divisor classes in its numerical restriction laws.

**Part II §smooth-proper-surfaces.** What SchemeAndStackFoundations must provide (gap:surface-projectivity): Supply projectivity for every smooth proper geometrically integral surface over an arbitrary field. The base §§4.11–4.12 supply modifications and Chow domination. The full surface theorem is Stacks, Resolution of Surfaces, Lemma 54.16.11 (tag 0C5P), p.51, stacks-surface-resolution line 2327: a proper regular two-dimensional scheme over a Noetherian base is projective. Smooth relative dimension two over any field gives regularity, including over imperfect fields. Lemmas 54.16.9–54.16.10, tags 0C2N and 0C5N, give the contraction/Chow-domination proof. Target 1.3 is its K3 instance. Required by §1.3.

**Part II §tame-equivariant-deformations.** What SchemeAndStackFoundations must provide (gap:tame-equivariant-deformations): Supply, for smooth proper schemes over a perfect field of characteristic p>0 with a finite group G of order prime to p, the marked equivariant deformation functor, its identification with the G-fixed subfunctor when infinitesimal automorphisms vanish, invariant tangent and obstruction spaces, and formal algebraization of equivariant ample pairs; in particular, a G-action over W(k) on a formally smooth W(k)-deformation space with a fixed closed point has a formally smooth fixed locus of relative dimension equal to the invariant tangent dimension. The base §§4.1–4.6 supply marked deformation theory and obstruction classes. For a compatible polarized tower over a complete Noetherian DVR, AdicSpacesPartIII F0.3 and F0.8 construct the proper scheme and ample line. After that construction, §4.10 algebraizes the compatible action maps and line isomorphisms; full faithfulness gives the identity, composition and linearization cocycle laws on the algebraization. The extension uses exactness of G-invariants: average lifts of tangent coordinates and obstructions, obtain G-equivariant coordinates, and set the noninvariant coordinates to zero. The pair obstruction is the invariant part of the usual H²(O) obstruction, with identity, composition and base-change comparisons. Deligne §2.3–§2.4 supplies the Kodaira–Spencer and graded Gauss–Manin calculation used for the K3 application (deligne-lift lines 257–326); this contract adds the general tame equivariant formalism. Flatness of a K3 polarization on that fixed locus is proved in §6.7d, rather than presumed for every invariant line. Required by §6.7d.

**Part II §projective-complete-intersections.** What SchemeAndStackFoundations must provide (gap:hypersurface-cohomology): Supply the projective complete-intersection conormal/Koszul cohomology comparison over every field and geometric connectedness for positive-dimensional complete intersections cut out by an ordered regular sequence of ample effective Cartier divisors in a product of projective spaces. Consume SchemeAndStackFoundations §5.5 conormal_regular and §2.20 regular-section Koszul duality for arbitrary regular immersions; these require no positivity or dimension bound. JacobianChallenge Layer C supplies twisting-sheaf cohomology. Connectedness has separate hypotheses: each defining divisor is ample on the product, and the final dimension is at least one. After algebraic closure, the intermediate complete intersections are Cohen–Macaulay and have dimension at least two before each cut. Repeatedly apply SGA 2, Exposé XII Corollary 3.5, p.120 (2005 arXiv v1 re-edition), sga2 lines 4277–4287. Thus the final smooth intersection is geometrically connected and geometrically integral. The quartic in ℙ³ and the (1, 1),(2, 2) intersection in ℙ²×ℙ² both have dimension two and ample defining divisors. Their conormal calculations are the applications at huybrechts lines 160–166 and 12221–12231. Required by §1.6, §5.4.

**Checks.**

- A smooth quartic in ℙ³ and a smooth (1, 1),(2, 2) intersection in ℙ²×ℙ² are geometrically connected over every field; regularity of the equations is retained.
- Over ℂ, V(x₀x₁) in ℙ¹×ℙ² is the disjoint union of two copies of ℙ². Its divisor has bidegree (2, 0), so ampleness fails despite smoothness and positive dimension.
- V(x₀x₁) in ℙ¹ is two reduced points over ℂ. Its divisor is ample but its dimension is zero, so the positive-dimension condition is essential.

**Part II §surface-numerical-base-change.** What SchemeAndStackFoundations must provide (gap:surface-arithmetic-quotient): Supply the numerical divisor quotient and its functorial intersection comparison over arbitrary fields. The base §5.10 specifies the quotient over algebraically closed fields. Extend its definition and compatibility over all fields without assuming that arithmetic numerical equivalence is always geometric numerical equivalence. For K3 surfaces target 1.5 proves the numerical kernel zero directly over k; target 4.2 compares the resulting pairing. Define the arithmetic relation by D≡D′ exactly when (D−D′)·C=0 for every integral k-curve C, using §5.9 Chow.intersectionNumber, and descend that pairing to its quotient. For a finite field extension K/k, §5.6 projection_formula gives [K:k](D_K·C′)_K=(D·π_*C′)_k: the right side uses residue-weighted degree. For divisors both pulled back, intersection degree is unchanged by field extension, by flat base change in §5.2 and the normalized degree on Spec K. Over an algebraic closure, every curve and its equations descend to a finite extension; testing with its pushforward proves agreement of the numerical kernels. This proves the required comparison without identifying arithmetic Picard groups with all geometric classes. Required by §4.2.

**Part II §finite-surface-quotients.** What SchemeAndStackFoundations must provide (gap:surface-quotient-resolutions): Supply normality and projective minimal resolution of the projective finite-group quotient of a smooth projective surface over an algebraically closed field in every characteristic, with canonical-divisor and coherent-pushforward comparison maps. Consume SchemeAndStackFoundations §1.17 finiteGroupQuotient_projective for the quotient, including wild actions. On stable affine opens, the invariant subring of a normal domain is normal: an element of its fraction field integral over the invariants is integral over the ambient domain and fixed by G. Stacks, Resolution of Surfaces, Theorem 54.14.5 (0BGP), pp.41–42, stacks-surface-resolution lines 1880–1908, gives resolution for these excellent normal surfaces by normalized blowups. Contract exceptional curves of the first kind using Lemma 54.16.9 (0C2N); Picard rank drops at each step, and §54.17 (0C5Q) compares resolutions. The resulting regular proper surface is projective by 0C5P. Canonical-divisor pullback and the O→Rπ_*O comparison are maps, not wild vanishing assertions; coherent duality is §2.20. K3 quotient types are determined in §6.2a–§6.3. Required by §5.4, §6.1, §6.2a, §6.3.

**Part II §tame-surface-singularities.** What SchemeAndStackFoundations must provide (gap:tame-quotient-singularities): Supply tame local linearization and extend the complex ADE quotient resolutions to every algebraically closed field k and every finite G≤SL₂(k) of order invertible in k. Over ℂ consume McKaySkewGroup §§7.1–7.3 for the invariant quotient, its ADE hypersurface presentation and its minimal resolution, and NilpotentOrbits N8 for the exceptional ℙ¹ components, their incidence and self-intersection −2, and the ADE intersection matrix with its rank and determinant; this contract does not construct them again. Require discrepancy zero, R¹π_*O=0 and negative ADE exceptional intersection matrices over every such k; their determinants and ranks are compared with IntegralLattices, as used in dolgachev-keum Lemma 3.1 and Theorem 3.3, lines 399 and 511. The contract owns the following results.

- Tame local linearization: let a finite group G of order invertible in k act faithfully on a smooth integral surface over k and fix a closed point x. Averaging any k-linear lift m_x/m_x²→m_x by |G|⁻¹Σg gives a G-equivariant lift, hence a G-equivariant isomorphism of the completed local ring with the completed symmetric algebra of the cotangent space. Then the stabilizer acts faithfully on the tangent space, and the quotient at the image of x is formally the quotient of the plane by that linear action.
- Characteristic-zero transport: by gap:tame-linear-groups, G is GL₂(k)-conjugate to a model whose entries are algebraic over ℚ. Taking invariants is a finite limit, so it commutes with flat base change, and the invariant ring and its presentation are defined over the algebraic closure ℚ̄ of ℚ in k. Its minimal resolution over ℚ̄ exists by Stacks, Resolution of Surfaces, Theorem 54.14.5 (0BGP), stacks-surface-resolution lines 1880–1908, and contraction of (−1)-curves by Lemma 54.16.9 (0C2N). Base change along an extension of algebraically closed fields carries a minimal resolution of a rational surface singularity to a resolution with the same irreducible exceptional curves and intersection numbers, hence to the minimal resolution. Through ℚ̄⊂k and ℚ̄⊂ℂ the exceptional configuration over k is that of McKaySkewGroup §7.3, hence of N8. An arbitrary algebraically closed field of characteristic zero is not assumed to embed in ℂ.
- Tame positive characteristic: for p=char k>0 with p∤|G| the quotient is a Klein singularity, hence a rational Gorenstein surface singularity, that is a rational double point (liedtke-mckay, §4.6 Definition 4.11 and Theorem 4.12, pp.19–20, lines 786–815). Its minimal resolution is the G-Hilbert scheme (Theorem 4.5, p.16, line 650). Lift G to SL₂(W(k)) by gap:tame-linear-groups. The quotient of the plane over W(k) by that lift is the canonical lift of the singularity (§4.4 and Definition 4.7, p.16, lines 662–673). Its simultaneous minimal resolution identifies the exceptional components of the special fibre and of the generic fibre, and specialization is an isometry of their lattices (Theorem 4.10, p.18, lines 736–745). The geometric generic fibre is the characteristic-zero case, so the exceptional graph and intersection matrix over k are the complex ones.

Rationality gives R¹π_*O=0. For a rational double point the exceptional curves have square −2; adjunction makes the discrepancy pair trivially with every component, and negative definiteness forces all discrepancy coefficients to vanish. Ranks and determinants then follow from the ADE matrices; the local group-order comparison is the separate dolgachev-keum lines 450–463. Required by §6.1, §6.1a.

**Checks.**

- G={±I} in characteristic other than 2 has invariants x², xy, y² with the single relation XY=Z². The resolution has one exceptional curve of square −2 and determinant 2, over every such algebraically closed field and over ℂ.
- In characteristic 3, SL₂(𝔽₃)≤SL₂(k) is abstractly the binary tetrahedral group of order 24. The Moore determinant xy³−x³y vanishes exactly on the four 𝔽₃-rational lines, where the degree-six Dickson invariant is nonzero. So these two invariants have only the origin as common zero and their degrees multiply to 24; the invariant ring is therefore polynomial and the quotient is smooth. The complex binary tetrahedral quotient is E₆, so the tame hypothesis cannot be dropped.
- In characteristic 2 the matrix −I is I, and the unipotent involution [[1,1],[0,1]] fixes y and x²+xy on its contragredient coordinates. These have only the origin as common zero and degrees multiplying to 2, so the invariant ring is k[y, x²+xy] and the quotient is smooth rather than A₁.

**Part II §quotient-surface-correspondences.** What SchemeAndStackFoundations must provide (gap:quotient-transcendental-comparison): Supply, for a finite group G acting on a smooth projective surface X over an algebraically closed field and a smooth projective resolution Y of X/G, an isomorphism T²_ℓ(Y)≅T²_ℓ(X)^G over ℚ_ℓ for every ℓ invertible in the field. Here T²_ℓ is the cokernel of the divisor cycle map Pic⊗ℚ_ℓ→H²_et(ℚ_ℓ(1)); require quotient pullback/trace and the algebraic exceptional contributions, including wild groups (keum §6, line 811; dolgachev-keum Lemma 4.2, line 590). No integral isomorphism or ℤ_ℓ-averaging is asserted. The general finite-group comparison is Shioda, An explicit algorithm for computing the Picard number of certain algebraic surfaces, Proposition 5 (1986, pp.415–432; shioda-transcendental, locator-only uncertified). Keum Proposition 2.2(4), keum lines 305–325, applies it to arbitrary smooth projective surfaces and cyclic groups; dolgachev-keum lines 590–594 applies its finite-group form. These are application locators, and the primary proposition is not certified from them. Required by §6.3, §6.8a.

**Part II §birational-surface-forms.** What SchemeAndStackFoundations must provide (gap:ruled-surface-two-forms): Supply birational invariance of global regular two-forms on smooth proper surfaces over algebraically closed fields and their vanishing on ruled surfaces. This gives geometric non-ruledness from the nonzero K3 volume form, the hypothesis used in Rizov Theorem 4.3.3 Step 5 (rizov line 1075). General derivation: Stacks, Lemmas 54.17.1–54.17.2 (0C5R, 0C5S), pp.52–53, stacks-surface-resolution lines 2335–2399, factor a proper birational map of regular surfaces into point blowups and contractions. For a point blowup, a regular two-form on the blowup restricts off the exceptional curve and extends uniquely across the missing point downstairs by SchemeAndStackFoundations §0.4 reflexive_extension_normal, applied to the locally free Ω²; pullback supplies the inverse. On a ℙ¹-bundle over a smooth curve, Ω² restricts to O(−2) on each fibre, so every global two-form is zero. The ruled case follows by factorization. Rizov line 1075 is the K3 application of this general argument. Required by §8.2.

**Part II §polarized-nonruled-traits.** What SchemeAndStackFoundations must provide (gap:matsusaka-mumford): Supply Matsusaka–Mumford’s extension theorem for smooth proper polarized families over DVRs with geometrically non-ruled special fibre. Matsusaka–Mumford Theorem 2 is used in Rizov Theorem 4.3.3 Step 5 (rizov line 1084). Include uniqueness and descent for algebraic spaces after étale local representatives; K3 non-ruledness is verified here using its nonzero regular two-form, not assumed for all surfaces. Required by §8.2.

**Part II §birational-surface-cohomology.** What SchemeAndStackFoundations must provide (gap:rational-surface-cohomology): Supply, for every smooth projective unirational surface Y over an algebraically closed field and every invertible prime ℓ, surjectivity of NS(Y)⊗ℚ_ℓ→H²_et(Y,ℚ_ℓ(1)); also require H¹_et(Y,ℚ_ℓ)=H³_et(Y,ℚ_ℓ)=0, so in particular a smooth projective rational surface has algebraic H². The general surface theorem uses resolution of dominant rational maps and pullback–pushforward, with purely inseparable degrees retained; §4.11 supplies modifications. Shioda, An example of unirational surfaces in characteristic p, Lemma p.234 and Corollary 2 p.235, shioda-unirational-primary lines 98–140; the K3 rank instance is also proved in rudakov-shafarevich-inseparable lines 489–491. Required for the rational quotient and κ=0 consequences and the vector-field rank reduction. Required by §2.1a, §6.0c, §6.2a, §6.3, §6.5.

### From TauCetiRoadmap.JacobianChallenge

Consume Layer A, Layer C, Layer D. Native line-bundle classes, proper coherent finiteness, flat base change and finite-projective cohomology complexes; Layer D supplies the fppf relative Picard sheaf and its Picard–Brauer obstruction sequence on arbitrary test schemes over a field. General algebraic-space representability is supplied by ComplexComparisonPartII C3.2d.2–C3.2d.3.

### From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

Consume §7.6.1 `relativePicardSheaf`, `relativePicardBaseChange` and `relativePicardKernel` for the fppf class sheaf on algebraic-space families, and §7.6.1a `sectionPicardSplit` for normalized representatives when a section and universal functions are supplied. Smooth surjective K3 families admit sections étale-locally; apply this split comparison there, then descend the Picard section. Consume §9.10 `algebraicAdjointVanishing`: on a smooth projective characteristic-zero variety, a nef big rational divisor with SNC fractional support has vanishing Hⁱ(ω_X⊗O(⌈A⌉)) for i>0. An integral nef big line bundle has empty fractional support, giving the characteristic-zero input of §7.4.

### From TauCetiRoadmap.AlgebraicVectorBundles

Consume L0A–L0C. Sheaf tensor, dual, finite locally free exterior powers and determinants, monoidal pullback and base change.

**Part II §surface-adjoint-positivity.** What AlgebraicVectorBundles must provide (gap:adjoint-positivity): Supply general surface adjoint separation in characteristic zero and positive characteristic, and positive-characteristic adjoint vanishing, with the full Reider–Terakawa hypotheses. Terakawa Theorems 1.4–1.6 and 2.4, Lemma 2.2: rank-two instability and locally free extensions; for nef A, r≥0, A²−4r−5≥0, either K+A is r-very ample or an effective D through a failure subscheme Z of length ≤ r+1 satisfies A·D−length Z≤D²<A·D/2<length Z. Hypotheses are char 0, or positive characteristic with surface neither general type nor quasi-elliptic of Kodaira dimension 1, or general type with minimal model S0 and p≥3, A²−4r−5>K_S0², or p=2 and A²−4r−5>max(K_S0²,K_S0²−3χ(O)+2). Terakawa Theorem 1.6 is the positive-characteristic vanishing theorem for nef big A under the stated surface restrictions and bounds on A². Characteristic-zero adjoint vanishing is consumed from AlgebraicModuliForArithmeticGeometry §9.10 algebraicAdjointVanishing; this contract adds separation in that characteristic and the stated vanishing and separation in positive characteristic. The base L0A–L0C develops the bundle operations used by these surface theorems. Required by §7.4, §7.5.

### From TauCetiRoadmap.StableReduction

Consume Layer 0 for the category of native DVR models, generic-fibre identifications and their base-change comparisons. Consume Layer 2, in particular effective étale descent for schemes equipped with a compatible relatively ample invertible sheaf, including its graded section algebra, relative Proj, morphisms and base-change coherence. Projective means a closed immersion into ℙ(E) for a finite-type quasi-coherent E, as in Stacks Definition 29.44.1 (01W8); H-projective means an embedding into a single ℙⁿ_S. Rizov’s strongly projective means an embedding into ℙ(E) for E locally free of constant finite rank. These notions are not identified over an arbitrary base. Its curve duality is not a surface input. Consume Layers 4–5 for blowups, vertical intersection matrices, contractions and unique regular minimal models of smooth positive-genus curves over DVRs. The global genus-one Jacobian and its regular nonsmooth extension are NeronModelsAndSemistableAbelianVarietiesPartII §§4.16–4.17, built on these layers; §6.0b consumes them, and neither is inferred from the smooth-generic model theorem.

Prove the polarized descent criterion for an ample algebraic space to be a scheme: if an algebraic space X over a scheme S carries an actual invertible L whose pullbacks give relatively ample scheme families étale-locally on S, descend the polarized schemes over affine base opens, identify the descended space with X by SchemeAndStackFoundations §1.11, and glue on their overlaps. Thus X is a scheme and L is relatively ample, compatibly with base change (Stacks, Divisors on Algebraic Spaces, Lemmas 71.14.2–71.14.6, tags 0D32–0D36, pp.27–29, stacks-relative-ample lines 1253–1327). Its local projectivity consequence says that if X→S is proper, it is locally projective over every S (Stacks 0B5N, stacks-projective-morphisms lines 4688–4692). The global projectivity consequence says that if S is quasi-compact and quasi-separated, relative ampleness and properness give global projectivity (Stacks 0BCL and the quasi-projectivity criterion, stacks-projective-morphisms Definition 41.1 (01VW), lines 4229–4238, and Lemma 44.13 (0BCL), p.104, lines 4764–4775). For arbitrary-base polarized K3 families in §§7.3, 8.2 and 8.5 apply the scheme criterion only where a line representative exists and apply projectivity on affine base opens. A Picard section alone is not a global line descent datum.

**Checks.**

- Over Spec k an actual ample line on a proper algebraic space gives a scheme projective over k; the base is quasi-compact and quasi-separated.
- For S the disjoint union of points indexed by n≥0 and X the disjoint union of ℙⁿ over them, O(1) is relatively ample and every restriction is H-projective, but no fixed N embeds X into ℙᴺ_S. It is projective in the stated ℙ(E) convention via the unbounded-rank locally free E. Affine-local embeddings do not give one global finite-dimensional projective-space embedding.
- A Picard section without a compatible global line does not supply polarized scheme descent data; §7.3 retains all algebraic-space families by working étale-locally and then on affine base opens.

### From TauCetiRoadmap.AdicSpacesPartIII

Consume F0.3's formal-scheme-carrier-comparison and its coherent-module comparison for locally Noetherian Cartesian adic towers with finitely generated first-order ideal. Consume F0.8's grothendieck-algebraization and its ample-line conclusion: over a complete Noetherian adic ring A with specified ideal I, a proper formal scheme with an actual compatible invertible sheaf whose reduction modulo I is ample is the completion of a projective A-scheme carrying that line. The comparison includes the specified reductions of both scheme and line. For §§2.7 and 6.7d take A=R, I=(π), R a complete DVR finite over W(k), and levels over R/(π^(n+1)); the first-order ideal is generated by π. This is the algebraization theorem used in Deligne Corollary 1.8 (deligne-lift lines 155–160).

Consume R2.9's smooth-formal-scheme comparison on all reductions and R2.10's adic-local-flatness-criterion at Noetherian local rings B along the closed fibre: use A=R, I=(π), M=B, with π∈Jac(R) and πB⊂Jac(B). For an algebraization of a smooth tower these give flatness and the smooth Jacobian criterion at the closed fibre; SchemeAndStackFoundations §4.1's algebraic lifting criterion identifies its smooth locus. Mathlib `AlgebraicGeometry.Scheme.Hom.isOpen_smoothLocus`, in `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean`, makes its complement closed. Properness over the local trait then excludes any remaining nonsmooth locus: the image of a nonempty closed locus would contain the closed point. SchemeAndStackFoundations §4.10 supplies the subordinate module and morphism comparisons after the scheme exists.

### From TauCetiRoadmap.IntegralLattices

Consume Layer 1, Layer 5, Layer 6, Completed Layers 1–5. The common rational-ambient lattice and discriminant conventions, even lattice signature and discriminant-module restrictions. No classification of geometric Picard lattices is imported.

### From TauCetiRoadmap.NoncommutativeAndEquivariantIwasawa

Consume §0.1, Constant lower-p-series indices, including its first-congruence-subgroup Check: for every odd prime ℓ and n≥0, ker(GL_n(ℤ_ℓ)→GL_n(𝔽_ℓ)) is a uniform pro-ℓ group of dimension n². The uniform predicate includes torsion-freeness. At ℓ=2 only the level-4 subgroup is covered; §4.5 uses odd ℓ. This §0.1 group-theoretic prefix is a prerequisite of §4.5, hence of §§4.6 and 6.6. Its own input is the native pro-p carrier and the closed lower-p-series/power operations from ProfiniteArithmetic; no Iwasawa algebra, localization or arithmetic theorem of Layers 1–7 is an input here.

### From TauCetiRoadmap.EllipticCurves

Consume Layer 4's `ReductionSymbol` type, with symbols I₀, I_n (n≥1), II, III, IV, I_n* (n≥0), IV*, III* and II*. This is a symbolic label; NeronModelsAndSemistableAbelianVarietiesPartII §2.3 defines its realization by the full primitive geometric fibre, retaining component multiplicities and incidence schemes, and §6.0b consumes that realization. The symbol type supplies no geometric classification theorem.

### From TauCetiRoadmap.NeronModelsAndSemistableAbelianVarietiesPartII

Consume §2.1 (the genus-one fibration carrier over a smooth proper curve, its scheme-theoretic fibres, its localization to `TauCeti.Model` with the specified generic fibre, field extension, and the elliptic, quasi-elliptic and relative-minimality conditions), §2.2 (fibre-type divisors, multiplicity and primitive divisor), §2.3 (the geometric realization of EllipticCurves Layer 4's `ReductionSymbol`), §2.5 (the classification of primitive geometric fibres of relatively minimal fibrations over algebraically closed fields, with its affine matrix classification `canonicalFiber_affineMatrixClassification`), §3.11 (the local comparison of Jacobian and torsor fibre types over a strictly henselian base for smooth generic curves), §§4.1–4.2 (the canonical bundle formula and the degree of the Hodge line, with the torsion of R¹f_*O retained), §4.7 (generic Picard restriction with vertical kernel on regular surfaces over regular one-dimensional bases), §4.8 (geometric Shioda–Tate generation of Pic for a fibration with a section over a smooth proper curve), §4.16 (quasi-elliptic fibrations only in characteristics 2 and 3, `regularGenusOne_char_two_or_three`, and the quasi-elliptic Jacobian compactification) and §4.17 (the relatively minimal regular Jacobian fibration with its zero section, for elliptic and quasi-elliptic generic curves). Its Scope states that later roadmaps import these by section; §6.0b does so and adds only the fibre root quotient with its square-index determinant law, the Jacobian Euler-characteristic and fibre-type comparisons including the quasi-elliptic case, the numerical restriction and determinant laws, quasi-elliptic unirationality over ℙ¹ and the rank-five K3 pencil. Its rational-elliptic-surface classification in Layers 5–7 and its finite pinching in Layer 1 supply no premise.

### From TauCetiRoadmap.GlobalQuadraticForms

Consume §5.5. Hasse–Minkowski isotropy for regular forms over number fields; combined here with local isotropy and real indefiniteness to obtain Meyer’s rational rank-five corollary.

### From TauCetiRoadmap.QuadraticFormInvariants

Consume Layer 6D. Isotropy of every regular quadratic form of rank at least five over any nonarchimedean local field of characteristic zero, including ℚ₂.

### From TauCetiRoadmap.EtaleCohomologyFoundations

Consume F.0.3, F.2.1–F.2.2, F.4.2, F.4.4–F.4.6, F.5–F.6, §0.9. Tate coefficients, smooth/proper base change, integral adic cohomology and continuous actions, duality, cycle classes, intersection/trace; the additional geometric tame trace theorem is gap:tame-lefschetz.

For a finite étale G-torsor X→Y of smooth proper varieties over an algebraically closed field with ℓ invertible, derive Hⁱ_et(Y,ℚ_ℓ)≅Hⁱ_et(X,ℚ_ℓ)^G as follows. Apply SchemeAndStackFoundations §2.15 `hochschildSerre_galois_covering` to ℤ/ℓⁿ at every level. EtaleCohomologyFoundations F.4.2 `classicalAdicRealization`, F.4.4 `adicFiniteness`, F.4.5 `rationalAdicRealization` and F.4.6 `adicFunctoriality` pass the equivariant descent complex through derived inverse limit and rationalization. On ℚ_ℓ[G]-modules the projector |G|⁻¹Σg makes invariants exact, so higher group cohomology vanishes and the edge map is the claimed isomorphism. Finite G makes each group-cochain degree a finite product, compatible with this passage; retain Rlim before rationalization. Pullback and cup compatibility follow from the same finite-level maps. This includes ℓ dividing |G| and asserts no integral invariants equality. F.6 supplies the quotient Gauss–Bonnet calculation used in §6.3.

**Part II §proper-correspondence-trace.** What EtaleCohomologyFoundations must provide (gap:tame-lefschetz): Supply the proper tame étale Lefschetz equality for smooth projective varieties over algebraically closed fields of characteristic p>0. For finite-order g prime to the positive characteristic and ℓ invertible, Fix(g) is smooth and its ℚ_ℓ Euler characteristic equals the alternating cohomology trace of g; isolated reduced fixed points each contribute 1. F.6 supplies the identity/Gauss–Bonnet case. Keum Proposition 2.4, lines 336–341, gives the exact source-facing contract. The characteristic-zero topological formula is consumed from MorseNovikov N6. Required by §6.1a, §6.2, §6.9.

### From TauCetiRoadmap.AlgebraicTopology

Consume Stage 6 items 1–2 for integral universal coefficients and Alexander–Whitney cup/cap products, and Stage 6 item 4 for oriented Poincaré–Lefschetz duality, including `compactTriadPoincareLefschetz`. For a closed oriented real n-manifold with finitely generated homology, universal coefficients identify torsion in Hⁱ with Ext¹(H_(i−1),ℤ), and duality gives the corresponding vanishing equivalence with torsion in H^(n−i+1); the K3 application has n=4.

### From TauCetiRoadmap.MorseNovikov

Consume N6, the mapping-torus example’s topological Lefschetz fixed-point formula for diffeomorphisms of closed manifolds, with its continuous local index and Hopf trace comparison. At an isolated holomorphic nondegenerate fixed point the real determinant det(1−dg)=|det_C(1−dg)|² is positive, so its index is +1.

### From TauCetiRoadmap.ComplexKahlerGeometry

Consume K3–K4, K5a–K5b, K6.1. Native analytic germs/sheaves and bundles, coherent/Dolbeault/Serre comparison, compact Kähler Hodge decomposition and cycle classes.

**Part II §integral-Chern-comparison.** What ComplexKahlerGeometry must provide (gap:integral-topology): Supply the following two generic results on complex manifolds; neither has a K3 hypothesis. The base K3–K4 supply analytic sheaves and holomorphic bundles but no exponential sequence, and the base K6.1 supplies the analytic-cycle/fundamental-class integration comparison.

- Exponential comparison: construct the analytic exponential sheaf sequence 0→ℤ→O→Oˣ→1 with f↦exp(2πif), the group isomorphism from holomorphic line-bundle classes to H¹(M,Oˣ) with its tensor, dual and holomorphic-pullback laws, and identify the connecting map Pic_hol(M)→H²(M,ℤ) with the integral first Chern class of the underlying line, naturally for holomorphic pullback. Arapura, Algebraic Geometry over the Complex Numbers, §7.5, Lemma 7.5.1 and Definition 7.5.2, p.150 (arapura-chern, uncertified published locator), specifies the normalized exponential and its connecting Chern class for every complex manifold. The frame convention fixes the sign: on small charts take holomorphic logarithms u_ij with g_ij=exp(2πi u_ij), where local frames satisfy e_j=e_i g_ij. With the Čech differential (δu)_ijk=u_jk−u_ik+u_ij, the integers δu represent c₁(L). Refining the cover or changing logarithms changes this by an integral coboundary; composing the transition functions and their logarithms with a holomorphic map gives the pullback class. Local logarithms prove sheaf exactness, and the kernel is exactly ℤ. In general only the exact segment H¹(M,O)→Pic_hol(M)→H²(M,ℤ)→H²(M,O) is used. This is the comparison through which K3Surfaces K1 identifies the Picard group of a complex K3 surface with its integral (1, 1)-classes; the complex applications here reach it through K1 and the §1.3 adapter, so it is constructed once. A K3 surface has H¹(O)=0 and h²(O)=1, so c₁ is injective with image the kernel of H²(X,ℤ)→H²(X,O); the identification of Pic_hol(M) with all of H²(M,ℤ) under H¹(O)=H²(O)=0 does not apply to it.
- Intersection adapter: identify c₁(O(D)) with the Poincaré dual of D, and cup-evaluation of first Chern classes on a compact complex surface with analytic divisor intersection, naturally for holomorphic pullback. For L=O(D), the positive meridian around a simple holomorphic zero has logarithmic increment +1, so the class of the exponential comparison is the complex-oriented Thom class of D. AlgebraicTopology Stage 6 cup/cap products and oriented Poincaré–Lefschetz duality then identify c₁(O(D)) with PD[D] and cup-evaluation with analytic divisor intersection, including multiplicities by the local zero order. Additivity and differences of effective divisors cover Cartier divisors; transverse representatives and the same Thom classes give the general topological Chern intersection. Thus O(1) has degree +1 on ℙ¹.

Huybrechts Chapter 1 §3.2, pp.15–16, huybrechts lines 452–472, remains the K3 application, and §3.1 records its winding-number Check. Neither a rescaling of the lattice ℤ nor a reversal of the connecting map is implicit. Required by §3.1.

**Checks.**

- On ℙ¹, H¹(O)=H²(O)=0, so c₁ is an isomorphism Pic(ℙ¹)→H²(ℙ¹,ℤ)≅ℤ; evaluation on the complex-oriented fundamental class sends O(1) to +1. The inverse frame cocycle, or a reversed connecting map, sends it to −1 and fails.
- On a complex K3 surface H²(X,ℤ) has rank 22, while the integral (1, 1)-classes have rank ρ≤h¹¹=20. So c₁ is injective but not onto, and applying the conditional identification Pic≅H² would force ρ=22.
- On ℙ² the line class has c₁(O(1))∪c₁(O(1)) evaluating to 1=H·H, and so does its negative: a square does not detect the sign of c₁. The sign is fixed by the degree +1 of O(1) on a line, as in the first Check.

### From TauCetiRoadmap.ComplexComparisonPartII

Consume C−1.1 for scheme analytification, smooth-manifold and proper/compact comparison; C1.9 `projectiveComplexGaga`, `properSchemeGagaPushforward` and `properSchemeGagaEquivalence` for coherent GAGA; C2.2 `projectiveGeometricDictionaries` for ideals, sections, invertible modules and their algebraization; C5.1 for analytification of differentials and de Rham comparison; C6.3 `artinComparison` and C6.6 `adicArtinComparison` for finite-level and integral singular–étale comparison, with pullback, cup and trace compatibility. Consume C3.2d.2 `relative_picard_algebraicSpace`, C3.2d.3 `relative_picard_separated`, C3.2d.4 `picard_brauer_obstruction` and C3.2d.5 `finite_picard_cartier_torsors` on their universal-functions hypotheses.

The Artin-comparison prerequisites include C6.0–C6.2. C6.1's topological support and sheaf/singular bridges consume AlgebraicTopology Stages 2.6 and 6.1 and CharacteristicClasses C1.2a S0–S5 on their stated support and CW domains, together with the further inputs that C6.1 itself names. The required order is those topological stages → ComplexComparisonPartII C6.1 → C6.3 → C6.6 → §3.1 here. ComplexComparisonPartII is a direct supplier; AlgebraicTopology and CharacteristicClasses are transitive suppliers, including for the smooth projective application. Their support and CW hypotheses are retained, and the K3 numerical calculations do not replace their constructions.

### From TauCetiRoadmap.CrystallineCohomology

Consume CR.2.3 (smooth-lift/de Rham comparison and PD filtration), CR.3.2 (proper smooth crystalline perfectness, finite generation and derived reductions), CR.3.3 (first Chern class and cup products), CR.3:duality.1 (trace, crystalline Poincaré duality and Gysin maps), CR.4.1 and CR.4.6 (Witt differentials, Cartier operations, `FdV=d` and `FV=VF=p`), CR.4.7 (the crystalline/de Rham–Witt comparison; its integral cohomological control, namely bounded p-torsion, a finite free quotient and V-adic separatedness and completeness of Hᵇ(X,WΩᵃ) for X smooth proper over a perfect field; and the degree-filtration slope spectral sequence), and CR.7.3 (relative Gauss–Manin and formal-base compatibility). Derived reduction gives the universal-coefficient short exact sequence; K3 freeness is proved in §2.4.

**Part II §Picard-Dieudonne.** What CrystallineCohomology must provide (gap:oda-interface): Supply Oda’s comparison for smooth proper schemes over perfect fields of characteristic p>0 with a rational point. Oda Corollary 5.12 identifies the Dieudonné module of p-torsion Picard data inside H¹_dR, with the appropriate indefinitely closed-form image. Lang–Nygaard Theorem 1.1 extracts 0→H¹(O)→DM(pPic)→H⁰(Ω¹), the last image indefinitely closed forms. State both with conventions reconciled; passing to algebraically closed fields supplies the rational point. The additional comparison belongs to this owner’s Part II. Required by §2.3.

**Part II §formal-Brauer.** What CrystallineCohomology must provide (gap:witt-formal-brauer): Supply Artin–Mazur prorepresentability of the formal Brauer functor for smooth proper surfaces with H¹(O)=H³(O)=0, its Dieudonné realization H²(WO), the finite-height/p-divisible versus infinite-height/unipotent alternative when it is one-dimensional, and Hodge–de Rham degeneration when it is p-divisible, together with pullback and trace on the formal Brauer functor, with trace after pullback equal to the degree for finite flat maps, and their birational comparison on smooth proper surfaces; over a perfect field a p-divisible one-dimensional formal group of finite height h has a free rank-h Dieudonné module over W(k), and every homomorphism in either direction between it and the formal additive group is zero. Nygaard Corollary 2.7 (nygaard-closedness line 286) supplies degeneration; de Rham–Witt operations are consumed from CR.4.1 and CR.4.6, and V-adic separatedness from the integral cohomological control of CR.4.7. Pullback/trace and the formal-group separation are used in dolgachev-keum lines 652–661. For the latter, compose a homomorphism with [p]: the finite-height p-series is nonzero, whereas [p] on the formal additive group is zero. The K3 consequences are §§2.2, 6.0a, 6.0c and 6.8a. The general representability/realization locators are Artin–Mazur, Formal groups arising from algebraic varieties, II Corollaries (4.1)–(4.4), pp.109–110, artin-mazur-formal lines 902–938; II Proposition (2.13), lines 808–821, proves the Cartier-module cohomology comparison. For functoriality use their principal-units description II (1.3)–(1.4), lines 658–685: pullback is the cohomology pullback of 1+I O_X, and a finite locally free map has the determinant norm on this sheaf. On scalars its norm is u↦u^degree, so trace after pullback is multiplication by degree, even for inseparable maps. Under a point blowup b, the successive quotients of the nilpotent principal-units filtration are I^j/I^(j+1)⊗O; b_*O=O and R^q b_*O=0 for q>0 (Stacks Lemma 54.3.4, tag 0AGS, p. 7, stacks-surface-resolution lines 289–295) give an isomorphism on their H² by induction on I. Factor birational surface maps using Stacks 0C5S, stacks-surface-resolution line 2390, to obtain the formal Brauer comparison. These constructions also give the pullback/trace compatibility with the Artin–Mazur realization. The finite-height rank is the Dieudonné classification in Artin–Mazur I §1, artin-mazur-formal lines 391–416; one-dimensional infinite height means the formal additive group after algebraic closure. No claim that an arbitrary higher-dimensional unipotent formal group is additive is used. Required by §2.1a, §2.2, §6.0a, §6.0c, §6.8a.

**Part II §formal-Chern-variation.** What CrystallineCohomology must provide (gap:crystalline-chern-derivative): Supply the filtered Gauss–Manin comparison and Kodaira–Spencer derivative of crystalline c₁ of an invertible sheaf on a formal smooth proper deformation over W(k), as the cup/contraction obstruction to extending its Hodge class. CR.7.3 supplies the relative connection; this contract is the derivative and line-class compatibility used by Deligne §2 (deligne-lift line 188). Required by §2.6 and §6.7d.

**Part II §supersingular-cycle-lattices.** What CrystallineCohomology must provide (gap:artin-discriminant): Supply p-elementarity of the rank-22 geometric Picard discriminant and the crystalline cycle-lattice index; at discriminant length 22 require integrality and evenness of B/p including p=2; for Artin invariant >1 require injectivity of Pic(X)/p→H¹(X,Ω¹_X) as an 𝔽_p-linear map, in particular nonvanishing on a primitive ample class. Huybrechts Chapter 17 Proposition 2.19, lines 14328–14341, gives the index and parity requirements. Dolgachev–Keum lines 737–755 give the de Rham (1, 1) requirement; this is not injectivity after tensoring Pic/p with k. Averaging a finite tame orbit gives an invariant ample class; divide by its maximal integral divisibility in Pic to obtain a primitive invariant ample class. Abstract lattice classification remains IntegralLattices; its K3 realization is §6.0. Required by §6.0, §6.8a, §6.9.

**Part II §automorphism-realizations.** What CrystallineCohomology must provide (gap:cross-realization): Supply equality and integrality of automorphism characteristic polynomials on rational crystalline and prime-to-p étale cohomology of smooth projective varieties over algebraically closed fields of characteristic p>0. Require compatibility with de Rham reduction; keum Proposition 2.1 (keum line 271) states the equality for arbitrary automorphisms. Only for finite order may semisimplicity turn identity characteristic polynomial into identity action. Used also in dolgachev-keum Proposition 4.5, line 758. Required by §6.5, §6.7d and §6.8a.

### From TauCetiRoadmap.McKaySkewGroup

Consume Layer 0's classification, §§0.1–0.2: every finite subgroup of SL₂(ℂ) is GL₂(ℂ)-conjugate to one of the concrete models of §0.1, the cyclic subgroup of order n (n≥1, the trivial subgroup at n=1), the binary dihedral subgroup of order 4n (n≥2), and the binary tetrahedral, binary octahedral and binary icosahedral subgroups of orders 24, 48 and 120. Its `Suggested.lean` states this as `finite_subgroup_SL2_classification` (cyclic, `QuaternionGroup n` for n≥2, `SL(2,𝔽₃)`, order 48, or `SL(2,𝔽₅)`), `finite_subgroup_SL2_conjugate_of_mulEquiv` and `card_eq_48_conjugate`; their conjugacy is inside SL₂(ℂ), which is stronger than the GL₂(ℂ)-conjugacy used here. The classification includes the conjugating element, the subgroup equality, the induced group equivalence and transport of the defining representation. Consume §7.1's invariant quotient X_Γ with its projection, the free action off the origin and conjugation transport. Consume §7.2's mutually inverse algebra maps from the invariant ring to the hypersurfaces XY−Zⁿ, X²+Y²Z+Z^(m+1), X²+Y³+Z⁴, X²+Y³+YZ³ and X²+Y³+Z⁵ for cyclic order n≥1 and binary dihedral order 4m with m≥2, with its explicit invertible coordinate rescalings onto the N8 equations of types A_(n−1) (n≥2), D_(m+2), E₆, E₇ and E₈; for n=1, Z eliminates and the quotient is the plane. The type of each quotient is the ADE type that NilpotentOrbits N8 assigns to its displayed equation; for example XY−Zⁿ becomes xy+zⁿ, type A_(n−1), under Z↦ζZ with ζⁿ=−1. Section 7.2's comparison of that type with the McKay matrix after deleting the trivial vertex is not consumed, and neither is Layer 1, which constructs that matrix. Consume §7.3's minimal resolution Y_Γ→X_Γ pulled back from NilpotentOrbits N8, with Y=X=ℂ² for trivial Γ. These are the stages consumed. The skew-group, Koszul and FKS Layers 3–6 and the cluster and tautological-bundle comparisons of §§7.4–7.5 are not prerequisites. Section 6.10 consumes Layer 0 directly after embedding into ℂ; §§6.1 and 6.1a consume these stages through gap:tame-linear-groups and gap:tame-quotient-singularities.

McKaySkewGroup is a direct supplier. Its §7.1 consumes ReflectionInvariantTheory §1 for the invariant algebra, the nonmodular Reynolds operator and the Noether bound. Its §7.2 consumes GroebnerGeometry G1's elimination and standard-monomial normal forms to prove generation and the relation kernel for the three exceptional invariant triples, and its §7.3 pulls back the NilpotentOrbits N8 resolutions. The required order is ReflectionInvariantTheory §1 and GroebnerGeometry G1 → McKaySkewGroup §§7.1–7.2 → McKaySkewGroup §7.3 → gap:tame-quotient-singularities → §§6.1–6.1a here. GroebnerGeometry is therefore a transitive supplier; its Layers G2–G6 supply no premise. Because the type labels come from the N8 equations, McKaySkewGroup Layer 1 and its faithful tensor-generation input are not on this chain.

### From TauCetiRoadmap.NilpotentOrbits

Consume N8's explicit chart resolutions of the complex ADE hypersurfaces xy+z^(m+1) (A_m, m≥1), x²+y²z+z^(m−1) (D_m, m≥4) and x²+y³+z⁴, x²+y³+yz³, x²+y³+z⁵ (E₆, E₇, E₈). Consume their exceptional irreducible curves, each isomorphic to ℙ¹, with transversality, incidence and self-intersection −2. Consume the integral intersection matrix on the free exceptional divisor lattice, equal to minus the ADE Cartan matrix through a component-index bijection, with its rank and determinant, and the divisor, normal-bundle and local intersection API for these surfaces. This stage is consumed through McKaySkewGroup §7.3. The K3 application uses the explicit charts and the exceptional intersection data, not N8's completed-local comparison with subregular slices or its identification with the Springer resolution; N9 is not an input.

### From TauCetiRoadmap.CFSGStatement

**Part II §finite-linear-groups.** What CFSGStatement must provide (gap:tame-linear-groups): Extend McKaySkewGroup Layer 0 to every finite G≤SL₂(k) over an algebraically closed field k with |G| invertible in k. Show that G is GL₂(k)-conjugate to a model with algebraic entries that corresponds to one of the cyclic, binary dihedral, binary tetrahedral, binary octahedral or binary icosahedral models, of orders n, 4n, 24, 48 and 120 respectively (n≥1 cyclic, n≥2 binary dihedral). Dolgachev–Keum Lemma 3.1, lines 399–402, gives these abstract types in tame characteristic; retain characteristic-zero and tame positive-characteristic domains. Over ℂ the conjugators, subgroup equalities and transported representations are McKaySkewGroup Layer 0's; this contract does not classify the complex case again. The ordinary rotation groups occur in the projective quotient classification. ADE resolution discriminants belong to gap:tame-quotient-singularities and quaternion representation obstructions to gap:mukai-eleven-groups-recognition. Required by §6.1.

- Characteristic zero: the entries of the elements of G generate a finitely generated field, whose algebraic closure k₁ in k is countable of finite transcendence degree over ℚ; choose a field embedding σ:k₁→ℂ. Layer 0 conjugates σ(G) to a model M by some g∈GL₂(ℂ). The matrices A with Aσ(h)=gσ(h)g⁻¹A for all h∈G form a subspace cut out by linear equations over the algebraically closed field σ(k₁). That field contains the algebraic entries of M, and the determinant is a nonzero polynomial on the subspace because it is nonzero at g. Since σ(k₁) is infinite, some invertible A has entries in σ(k₁), and σ⁻¹(A) conjugates G to σ⁻¹(M) inside GL₂(k₁). Only k₁ is embedded; k itself need not embed in ℂ.
- Tame positive characteristic: with p=char k∤|G|, the inclusion lifts to SL₂(W(k)). The obstruction and ambiguity groups H²(G,M₂(k)) and H¹(G,M₂(k)) vanish, and the determinant of the lift is the Teichmüller lift of 1, hence 1. The lift is faithful because its reduction is the given faithful inclusion. Apply the characteristic-zero case over an algebraic closure of Frac W(k). Cyclic models have root-of-unity entries; every other model has entries integral over ℤ[1/2] and even order. So for p∤|G| the model has entries in the valuation ring O of a finite extension of Frac W(k), whose residue field is k, and it reduces to GL₂(k). The reduction is faithful because the congruence kernel ker(GL₂(O)→GL₂(k)) has no nonidentity element of finite order prime to p: write a nonidentity kernel element as A=I+π^r B with π a uniformizer, r≥1 and B≢0 mod π. Then A^m≡I+mπ^r B mod π^(r+1), so A^m=I with p∤m would force B≡0 mod π. That kernel need not be a pro-p group; for infinite k the first graded quotient of the congruence filtration is the infinite additive group M₂(k). G and the reduced model are semisimple by Maschke and have the same Brauer character under the induced isomorphism, hence are conjugate in GL₂(k).

**Checks.**

- Over ℂ the ordinary tetrahedral group A₄ has three involutions, whereas the only nonidentity involution in SL₂ is −I: diagonalizability and determinant one force both eigenvalues to be −1. The SL₂ list must use the binary group of order 24.
- Let k be the algebraic closure of ℚ(t_α : α∈A) for an index set A of cardinality larger than the continuum. Then k does not embed in ℂ, but each finite subgroup of SL₂(k) has entries in a countable algebraically closed subfield. The transport embeds only that subfield.
- In characteristic 3 the quaternion group of order 8 is tame. It is conjugate to the reduction of the binary dihedral model generated by diag(i,−i) and [[0,1],[−1,0]], whose entries are integral at 3. The group SL₂(𝔽₃), abstractly binary tetrahedral, has order divisible by 3 and lies outside the contract.
- For k=F̄_p, sending I+pX to X mod p identifies (I+pM₂(W(k)))/(I+p²M₂(W(k))) with the infinite additive group M₂(k), so the congruence kernel of GL₂(W(k)) is not profinite. At p=2 it contains −I=I+2(−I), of order 2=p. For odd m, r≥1 and B≢0 mod 2, (I+2^r B)^m≡I+2^r B mod 2^(r+1), so no nonidentity kernel element has odd order. Faithfulness therefore uses only orders prime to p, not a pro-p or torsion-free kernel.

**Part II §Mathieu-permutation-model.** What CFSGStatement must provide (gap:mathieu-permutation-model): Supply faithful permutation models M₂₄≤S₂₄ and M₂₃ as a point stabilizer, of orders 244823040 and 10200960, with the fixed-point character on the retained 24 letters. For n=1, 2, 3, 4, 5, 6, 7, 8, 11, 14, 15, 23 the fixed-letter numbers in M₂₃ are 24, 8, 6, 4, 4, 2, 3, 2, 2, 1, 1, 1 (mukai (0.2), lines 59–63). Mukai §3, p.201, mukai line 756 gives |M₂₃|=2⁷·3²·5·7·11·23=10200960; its index 24 in M₂₄ gives 244823040. The base CFSGStatement S1 specifies presentations. Required by §6.10, §6.11.

**Part II §Mathieu-subgroup-recognition.** What CFSGStatement must provide (gap:mukai-eleven-groups-recognition): Supply, for a finite group G admitting a 24-dimensional rational Mathieu representation with invariant dimension at least five and a Sylow 2-subgroup embedding into M₂₃, an embedding into one of Mukai’s eleven groups and an M₂₃ embedding with at least five orbits, and supply the same conclusion for a compatible family of 24-dimensional Mathieu representations over every ℚ_ℓ with ℓ≠p, where |G| is prime to p, the invariant dimension is at least five and a Sylow 2-subgroup embeds in M₂₃; include exclusion of the faithful two-dimensional quaternion representation over ℚ and over ℚ₂, the latter used when 2 divides |G| (then p≠2). The Mathieu character is ε(n)=24/(n∏_(q|n,q prime)(1+1/q)), with n the element order. The rational implication is Mukai (0.6), §§3–8, especially §8 lines 1503–1540, with the eleven groups of (0.4) and maximal order 960. The ℓ-adic implication is dolgachev-keum Theorem 4.7 proof, lines 793–808. The K3 argument giving the Sylow embedding remains in §§6.10–6.11; local SL₂ classification and ADE resolution discriminants have their separate contracts. Required by §6.10, §6.11.

**Part II §exceptional-Mathieu-subgroups.** What CFSGStatement must provide (gap:exceptional-mathieu-embeddings): Supply an injective homomorphism into M₂₃ for each abstract group listed in Dolgachev–Keum Theorem 5.2, with the extension and semidirect-product structures specified there. The hypotheses here identify the abstract groups, including their non-split extensions; Proposition 5.14 (dolgachev-keum line 1566) provides subgroup chains, not merely orders. The K3 deduction that an exceptional tame action has a group in that list belongs to §6.11. Required by §6.11.

## How to read the build

[Suggested.lean](Suggested.lean) is the acceptance test for the headline theorems against the pinned APIs. It states field-extension invariance, the vanishing and Hodge theorems, Picard finite freeness, rank bounds, bounded rank descent, the universal finite-subgroup bound, the wild-prime bound and rank-22 Picard faithfulness on native schemes, line-bundle classes and automorphism groups. Its module docstring identifies the missing carriers for the remaining geometric headlines. The README specifies every target, interface law and Check on the full K3, cohomology and moduli objects.

Layer 1 fixes the native surface predicate and integer RR conventions. Layer 2 constructs its Picard-space instance and proves the positive-characteristic vanishing and lifting floor. Layer 3 transports the supplied complex cup lattice to integral geometric étale cohomology. Layer 4 builds the geometric lattice instance and proves rank/descent bounds using the supplied general odd-prime congruence theorem. Layer 5 defines actual symplectic and polarized stabilizers and tests full-group infinitude. Layer 6 starts with discriminants, height and genus-one rank comparisons, then supplies quotient, faithfulness and finite-subgroup bounds; the involution pencil follows the fixed-point table. Layers 7–8 construct the all-prime Hilbert atlas and separated polarized stacks, then prove smoothness on its stated open base and finite-field finiteness. Each layer uses its predecessors and the exact supplier contracts. A gap specifies a mathematical theorem supplied by its named owner; it adds no hypothesis to a K3 surface.

## Layer 1: Native surfaces and the K3 predicate

### 1.1 One unpolarized predicate

For a field k and f:X→Spec k, define `IsK3 k f` to mean that f is smooth of relative dimension 2, proper and geometrically integral, the determinant of the relative differential sheaf of X over k is isomorphic to the structure sheaf, and H¹(X, Oₓ)=0. It is a proposition, with no chosen trivialization, polarization or embedding. (huybrechts, Chapter 1 Definition 1.1, p. 7; huybrechts lines 133–146).

Define `differentialForms k f p` as the p-th native sheaf exterior power of the relative differential sheaf. Its API uses the native exterior-power and pullback comparisons:

- Degree zero is O and degree one is the relative differential sheaf.
- On a smooth surface the second exterior power is det Ω¹ and all exterior powers of degree greater than two are zero.
- Field pullback identifies the relative differential forms before and after base change; use AlgebraicVectorBundles L0C for the comparison.

Here H¹ is native module-sheaf cohomology. Prove the following interface laws for the K3 predicate:

- The five conditions construct a proof of IsK3.
- IsK3 is equivalent to precisely the five displayed conditions.
- The smooth dualizing line identifies canonically with det Ω¹; any isomorphism with O is existential.
- A K3 surface is projective by 1.3, using the full general surface supplier contract.

*Needs:* Mathlib `AlgebraicGeometry.SmoothOfRelativeDimension`; Mathlib `AlgebraicGeometry.IsProper`; Mathlib `AlgebraicGeometry.GeometricallyIntegral`; Tau Ceti `AlgebraicGeometry.Scheme.relativeDifferentials`; AlgebraicVectorBundles L0C; SchemeAndStackFoundations §2.20.

**Checks.**

- For a rank-two cotangent frame e₁,e₂, exterior degrees zero and one have ranks 1 and 2; using global sections before taking the sheaf exterior power need not have these local ranks.
- Its second exterior power has generator e₁∧e₂ and rank 1; exchanging e₁,e₂ negates the generator, with the same value in characteristic 2.
- Its third exterior power is zero since each basis triple repeats an entry; the tensor cube would have rank 8 and fails this test.
- A smooth quartic over any field satisfies IsK3 by 1.6; a definition requiring a chosen embedding would change the object.
- The empty scheme fails geometric integrality, which includes nonemptiness.
- E×E for an elliptic curve has h¹(O)=2, despite trivial canonical sheaf.
- P² has H¹(O)=0 but canonical line O(-3).

### 1.2 Isomorphisms and arbitrary field extension

For every isomorphism over k the K3 predicate is invariant; for every extension K/k, IsK3(X_K/K) ↔ IsK3(X/k). These equivalences respect identity extensions and towers. The field-extension equivalence is `isK3_fieldExtension_iff`. (huybrechts, Chapter 17 §2.1, p.365; huybrechts lines 13964–13970).

Descent and base change handle relative smoothness, properness, dimension and geometric integrality. Flat coherent base change handles H¹ and differentials. For a line bundle on a proper geometrically integral scheme, triviality is equivalent to nonzero global sections of it and its inverse; their nonzero product is a constant, so they trivialize it. Faithfulness detects the two nonzero spaces over k.

*Needs:* §1.1; SchemeAndStackFoundations §0.11; SchemeAndStackFoundations §1.1; JacobianChallenge Layer C; AlgebraicVectorBundles L0C.

**Checks.**

- K=k gives identity transport; a transport that changes the surface fails this identity law.
- The equivalence includes purely inseparable extensions.
- Multiplying a geometric volume form by a nonzero scalar changes no predicate; retaining a chosen form as part of the K3 predicate would distinguish these choices.

### 1.3 Projectivity over the original field

Every K3 surface over an arbitrary field k is projective over k. (huybrechts, Chapter 1 Remark 1.2, p. 7; huybrechts line 147).

Apply the general smooth proper surface projectivity theorem required from the scheme owner, with relative smoothness of dimension 2 and geometric integrality supplied by 1.1. The supplier contract retains its full arbitrary-field surface statement and its modification/ample-support proof. Projectivity is not inferred merely from projectivity after algebraic closure.

Over an algebraically closed k of characteristic zero or p>2, construct the specialization equivalence between `IsK3 k f` and its Conventions' projective algebraic condition on the same f. In the forward direction use projectivity and the native identification ∧²Ω¹≅ω; in the reverse direction forget projectivity to properness and use the same identification. Both composites are the identity on the underlying scheme and its isomorphisms. For k=ℂ, compose this adapter with K3Surfaces K1 to obtain its projective analytic object. The algebraization counit is an isomorphism over ℂ to the original X; transport along it identifies the canonical line, coherent cohomology and Picard classes with the originals. The adapter commutes with isomorphisms and field extension wherever both presentations apply. It makes no choice of σ; when a construction asks for σ, its possible choices form a kˣ-torsor. (huybrechts, Chapter 1 Definition 1.1, Remark 1.2 and Proposition 3.2, lines 135–153, 420–429.)

*Needs:* §1.1; §1.2; `gap:surface-projectivity`; AlgebraicVectorBundles L0C; K3Surfaces Conventions, K0 and K1.

**Checks.**

- A smooth quartic has O(1) as an ample witness; it satisfies the native predicate rather than carrying an embedding as data.
- The argument is a surface theorem and does not assert projectivity of all smooth proper varieties.
- Relative smoothness is retained over imperfect k; regularity alone is not the stated hypothesis.
- Over ℂ the algebraic specialization of a smooth quartic fixes f; its analytic algebraization counit pulls the hyperplane class back to H of square 4. The analytic equivalence uses this specified isomorphism over ℂ.
- For σ(e₁,e₂)=1, replacing σ by 2σ over ℂ gives contraction values 2e₂* and −2e₁*, while the two unpolarized predicates are unchanged. The zero form gives the zero map and is excluded from the chosen-form input.

### 1.4 Coherent invariants and contraction

For a K3 surface X/k, ω=∧²Ω¹, h⁰(O)=h²(O)=1, χ(O)=2 and 2χ(L)=4+L² in ℤ for every invertible L. For each nonzero σ∈H⁰(ω), v↦(w↦σ(v,w)) identifies T_X with Ω¹_X; scaling σ scales this map. (huybrechts, Chapter 1 §2.3 equation (2.5), pp.11–12; huybrechts lines 142, 305, 316).

Extend the K3Surfaces K0 calculation through §1.3 and flat field base change on its algebraic domain. Over arbitrary k, proper geometric integrality identifies global functions with k and Serre duality gives h²; surface RR gives the same integer formula, including characteristic 2. Construct the contraction map on the native differential sheaf over k and identify its base change with K0 on that domain; in characteristic 2 its same alternating-frame formula remains invertible. Euler characteristics and intersections commute with field extension.

*Needs:* §1.3; §1.1; §1.2; K3Surfaces K0; SchemeAndStackFoundations §2.20; SchemeAndStackFoundations §5.8; SchemeAndStackFoundations §5.9; SchemeAndStackFoundations §5.10; JacobianChallenge Layer C.

**Checks.**

- L=O gives 2χ=4, including characteristic 2: division never occurs in k.
- For a quartic hyperplane H, H²=4 and χ(H)=4.
- If σ(e₁,e₂)=1, e₁ maps to e₂* and e₂ to -e₁*; in characteristic 2 the latter sign becomes plus.

### 1.5 Numerical and torsion kernels

For a K3 surface X/k, a line-bundle class whose intersection with every class of Pic(X) is zero is trivial. In particular Pic(X) has no nontrivial torsion, in any characteristic. (huybrechts, Chapter 1 Proposition 2.4 and Remark 2.5, p.12; huybrechts lines 335–354).

Fix a k-ample H. A nontrivial L with L·H=0 has no section, nor does its inverse, since every nonzero effective divisor has positive H-intersection. Duality gives χ(L)≤0; numerical triviality and RR give χ(L)=2. Torsion is numerically trivial by cancellation in integer intersections.

*Needs:* §1.3; §1.4; SchemeAndStackFoundations §5.9; SchemeAndStackFoundations §5.10.

**Checks.**

- The argument also excludes p-torsion in characteristic p.
- A smooth rational curve C has C²=-2 by adjunction and is not numerically trivial.
- O belongs to the kernel and is its only element; the zero class must not be excluded from the numerical kernel.

### 1.6 Quartics over every field

For every field k, a smooth quartic hypersurface X⊂P³_k is K3, with H=O_X(1), H²=4 and χ(O_X(t))=2t²+2 for all integers t. The Fermat quartic is smooth exactly when char k≠2. (huybrechts, Chapter 1 Example 1.3(i), p. 8; huybrechts lines 160–183).

The hypersurface and conormal sequences compute H¹ and ω. Smooth geometric connectedness gives integrality. Bézout gives H², then RR gives the polynomial. Fermat partials are 4x_i³.

*Needs:* §1.1; §1.4; `gap:hypersurface-cohomology`; SchemeAndStackFoundations §5.10; JacobianChallenge Layer C.

**Checks.**

- χ(O)=2 although h⁰(O)=1.
- χ(H)=4.
- Over F₂ the equation is (Σx_i)⁴=0, a nonreduced thickening.
- The ample quartic has positive dimension and is geometrically connected; the smooth ample divisor V(x₀x₁) in ℙ¹ consists of two points, so smoothness and ampleness without positive dimension do not suffice.

### Examples

Smooth quartics, the empty scheme, P², and products of elliptic curves distinguish the predicate; the quartic polynomial gives χ(O)=2 and χ(O(1))=4.

### Dependencies

K3Surfaces Conventions, K0 and K1; Mathlib `AlgebraicGeometry.SmoothOfRelativeDimension`; Mathlib `AlgebraicGeometry.IsProper`; Mathlib `AlgebraicGeometry.GeometricallyIntegral`; Tau Ceti `AlgebraicGeometry.Scheme.relativeDifferentials`; AlgebraicVectorBundles L0C; SchemeAndStackFoundations §2.20; SchemeAndStackFoundations §0.11; SchemeAndStackFoundations §1.1; JacobianChallenge Layer C; `gap:surface-projectivity`; SchemeAndStackFoundations §5.8; SchemeAndStackFoundations §5.9; SchemeAndStackFoundations §5.10; `gap:hypersurface-cohomology`.

## Layer 2: Picard spaces, vanishing and lifting

### 2.1 The relative Picard space

For a smooth proper finitely presented algebraic-space family X→S whose geometric fibres are K3 schemes, represent the fppf sheafification of T↦Pic(X_T)/Pic(T) by a separated algebraic space locally of finite presentation. It is unramified, has trivial fibrewise identity and torsion subfunctors, and commutes with arbitrary base change. Over a field it is an étale group scheme. (rizov, Theorem 3.1.1, Lemma 3.1.2, Proposition 3.1.3, pp.9–11; rizov lines 404, 416, 440).

First prove the universal-functions comparison: O_T→(f_T)_*O_(X_T) is an isomorphism for every T→S, by coherent cohomology and base change from fibrewise H⁰(O)=k and H¹(O)=0. Apply the supplied relative class-sheaf representability, separatedness and tangent formula. H¹(O)=0 makes the tangent zero; over fields the identity is a reduced point, and 1.5 eliminates torsion. Relative unramifiedness follows from geometric fibres and finite presentation, not from relative flatness.

Prove the following interface laws:

- Morphisms T→Pic_X/S are precisely sections of the specified sheaf, functorially.
- Pic_X/S×_S T≅Pic_X_T/T, preserving tensor product and zero.
- Two morphisms to the representative are equal when they induce the same sheaf section.
- At a geometric [L], the relative tangent space is H¹(X_s,O).
- Pic(X) maps injectively to Pic_X/k(k), retaining the Brauer obstruction to surjectivity.

*Needs:* §1.2; §1.5; AlgebraicModuliForArithmeticGeometry §7.6.1–§7.6.1a; ComplexComparisonPartII C3.2d.2–C3.2d.5; JacobianChallenge Layer D; SchemeAndStackFoundations §1.11; JacobianChallenge Layer C.

**Checks.**

- Over algebraically closed k the rational points are Pic(X).
- The relative space need not be étale: new divisor classes can occur only over a closed locus.
- The zero component and torsion subfunctor are exactly the zero section; a nonreduced identity component would contradict unramifiedness.

### 2.1a The infinite-height kernel input

For a K3 surface X over an algebraically closed field k of characteristic p>0, if its one-dimensional formal Brauer group has infinite height and H⁰(X,T_X)≠0, the map d:H²(X,WO_X)→H²(X,WΩ¹_X) has nonzero kernel. Under the nonzero-vector-field hypothesis X is unirational and its geometric Néron–Severi rank is 22. (lang-nygaard, Theorem 1.3 proof, p.172, lang-nygaard lines 93–104; nygaard-vectorfields Lemma 3.3; rudakov-shafarevich-inseparable §2, Theorem 5 and Corollaries 1–2, pp.1216–1217, lines 438–497; shioda-unirational-primary Lemma p.234 and Corollary 2 p.235).

Prove the Rudakov–Šafarevič vector-field unirationality reduction and apply the general unirational-surface cycle theorem to get rank 22 as in their Corollary 2, then the kernel assertion with the Witt and formal-Brauer comparisons. For this unirational surface, the general surface input gives H¹_et=H³_et=0 and ρ=b₂; Noether from χ(O)=2 and K=0 gives deg c₂=24, and étale Gauss–Bonnet gives b₂=22. This uses only the earlier coherent invariants and general surface theorems, not §2.4, §3.1 or the later K3 lattice. In 2.2, a nonzero d on global one-forms produces a nonzero vector field by contraction. The dual d on H²(O) is then injective; FdV=d and V-separatedness would make the Witt differential injective, contradicting this target.

Prove the following interface laws:

- A nonzero global vector field on a geometric K3 surface makes X unirational. (rudakov-shafarevich-inseparable §2, Corollary 1, p.1217, lines 481–486).
- The same hypothesis gives Néron–Severi rank 22. (shioda-unirational-primary Corollary 2, p.235; rudakov-shafarevich-inseparable Corollary 2 proof, p.1217, lines 489–491).
- Under the infinite-height and vector-field hypotheses, some nonzero x∈H²(WO) satisfies dx=0.

*Needs:* §1.4; §2.1; `gap:witt-formal-brauer`; CrystallineCohomology CR.4.6–CR.4.7; SchemeAndStackFoundations §5.10; `gap:rational-surface-cohomology`; EtaleCohomologyFoundations F.6; SchemeAndStackFoundations §5.4; SchemeAndStackFoundations §5.8.

**Checks.**

- The witness must have x≠0; d(0)=0 alone does not contradict injectivity.
- The reduction and V-separatedness argument include characteristic 2 without dividing by 2.
- Finite height uses Nygaard Corollary 2.7 instead; no unirationality assertion follows merely from infinite height.

### 2.2 The positive-characteristic closedness theorem

For every K3 surface in characteristic p>0, the differential d:H⁰(X,Ω¹)→H⁰(X,Ω²) is zero. (lang-nygaard, Theorem 1.3, pp.172–173; lang-nygaard lines 76–104).

Extend to an algebraic closure, a perfect field. At odd p use K3Surfaces K0.A, via §1.3, so H⁰(Ω¹)=0 and its differential is zero. At p=2, finite-height formal Brauer gives Hodge–de Rham degeneration by Nygaard Corollary 2.7. In infinite height, Serre duality turns a nonzero differential into injectivity on H²(O); FdV=d then forces any Witt differential kernel into every image of V, contradicting the separate kernel theorem. The kernel and its vector-field/unirationality reduction are the earlier target §2.1a.

*Needs:* §1.2; §1.3; §1.4; §2.1; K3Surfaces K0.A; `gap:witt-formal-brauer`; §2.1a; CrystallineCohomology CR.4.1, CR.4.6–CR.4.7.

**Checks.**

- No division by 2 or restriction p>2 occurs.
- The zero one-form is closed.
- No assertion of degeneration for arbitrary surfaces follows from this K3 theorem.

### 2.3 Vanishing in all characteristics

Prove `IsK3.noVectorFields`: for every K3 surface over every field, H⁰(X,Ω¹)=H⁰(X,T_X)=H²(X,T_X)=0, with T_X the native internal-Hom dual of Ω¹. (lang-nygaard, Theorem 1.1 and Corollary 1.2, pp.171–172; lang-nygaard lines 54–74; characteristic-zero branch huybrechts Chapter 1 §3.3, p.16, lines 488–493).

At p>2 extend to an algebraic closure, apply §1.3 and K3Surfaces K0.A, then descend the three zero cohomology spaces by flat base change. At p=2, §2.2 makes all forms and their Cartier iterates closed. Oda identifies them as an image of p-torsion Picard Dieudonné data, zero by §2.1; contraction and duality give the tangent vanishings. In characteristic zero spread out to a finitely generated field, embed it into ℂ, apply the specialization adapter and K3Surfaces K1 Hodge/Serre comparison, then descend. The conclusion over k is the same native sheaf-cohomology statement in every branch.

*Needs:* §1.2; §1.3; §1.4; §1.5; §2.1; §2.2; K3Surfaces K0.A and K1; `gap:oda-interface`; ComplexKahlerGeometry K6.1; ComplexComparisonPartII C−1.1, C1.9, C5.1; SchemeAndStackFoundations §0.9.

**Checks.**

- An abelian surface has nonzero invariant vector fields and is excluded by H¹(O).
- The automorphism functor has zero tangent at the identity.
- The theorem includes p=2.

### 2.4 Hodge numbers and integral crystalline modules

For a K3 surface over any field, the Hodge number dim Hᑫ(X, Ωᵖ) is 1 at (p, q)=(0, 0),(2, 0),(0, 2),(2, 2), 20 at (1, 1), and 0 otherwise. The finite-dimensional coherent statement is `IsK3.hodgeNumbers`. In characteristic p>0 over perfect k, Hⁱ_crys(X/W(k)) is free of ranks (1, 0, 22, 0, 1), zero outside 0≤i≤4, and the Hodge–de Rham spectral sequence degenerates at E₁. (deligne-lift, Proposition 1.1, pp.59–60; deligne-lift lines 29–57; huybrechts line 367).

Transport c₂=24 from K3Surfaces K0 on its algebraic domain; in characteristic 2 Noether gives c₂=12χ(O)=24 directly. In characteristic zero the coherent diamond also agrees with K3Surfaces K1 under §1.3. Over every k, RR for Ω¹ gives χ(Ω¹)=-20; §2.3 and coherent duality leave h¹¹=20. The positions in the diamond force all spectral differentials to vanish, giving de Rham dimensions (1, 0, 22, 0, 1). For perfect k of characteristic p>0, put W=W(k) and Mⁱ=Hⁱ_crys(X/W). CrystallineCohomology CR.3.2, Proper smooth crystalline perfectness and reductions (3), gives finite generation, vanishing outside [0, 4] and derived reduction modulo p; CR.2.3 identifies this reduction with de Rham cohomology. Since W is a DVR with residue k, universal coefficients give 0→Mⁱ/pMⁱ→Hⁱ_dR(X/k)→M^(i+1)[p]→0 for every integer i. At i=3, Nakayama gives M³=0 and the right term gives M⁴[p]=0; at i=4, M⁴/pM⁴ has dimension 1. At i=1, M¹=0 and M²[p]=0; at i=2, M²/pM² has dimension 22. At i=−1, M⁰[p]=0; at i=0, M⁰/pM⁰ has dimension 1. A finite W-module without p-torsion is free, so the integral ranks are (1, 0, 22, 0, 1). This is the universal-coefficient argument of Deligne Proposition 1.1, deligne-lift lines 52–57.

*Needs:* §1.3; §1.4; §2.3; K3Surfaces K0 and K1; SchemeAndStackFoundations §5.8; SchemeAndStackFoundations §5.10; CrystallineCohomology CR.2.3, CR.3.2 (Proper smooth crystalline perfectness and reductions (3)).

**Checks.**

- The de Rham Euler sum is 1+22+1=24.
- χ(Ω¹)=-20, with H⁰=H²=0.
- Exterior degree>2 and coherent degree>2 give zero.
- A summand W/p in M² would force a nonzero quotient M²[p] of H¹_dR, contradicting H¹_dR=0; a summand W/p in M⁰ would similarly force H⁻¹_dR≠0. Perfectness alone does not imply torsion-freeness, including at p=2.

### 2.5 Unpolarized formal deformations

For geometric K3 X/k in characteristic p>0, its marked deformation functor on Artinian local W(k)-algebras with residue k is prorepresented by Spf W(k)[[t₁,…,t₂₀]], up to noncanonical coordinates. In characteristic zero use Artinian local k-algebras and Spf k[[t₁,…,t₂₀]]. (deligne-lift, Corollary 1.2, p.60; deligne-lift line 58; rizov Proposition 4.1.1 line 756).

The supplied cotangent/deformation theory has automorphisms H⁰(T)=0, tangent H¹(T) of dimension 20 and obstruction H²(T)=0. Apply its prorepresentability and lifting criterion with the fixed marking.

*Needs:* §2.3; §2.4; SchemeAndStackFoundations §4.1; SchemeAndStackFoundations §4.2; SchemeAndStackFoundations §4.3; SchemeAndStackFoundations §4.6.

**Checks.**

- First-order marked deformations form a 20-dimensional tangent space.
- The unmarked global moduli groupoid can have finite automorphisms; the formal marked functor is the one prorepresented.

### 2.6 Line-bundle deformation loci

For geometric K3 X/k in characteristic p>0 and a nontrivial line-bundle class L, the marked pair deformation functor is a closed formal subfunctor of 2.5 defined by one equation and flat over W(k), of relative dimension 19. If L is ample of square 2d and p∤2d, it is formally smooth. In characteristic zero an ample L gives a formally smooth dimension 19 locus. (deligne-lift, Proposition 1.5 and Theorem 1.6, pp.60–62; deligne-lift lines 78, 131; rizov Lemma 4.1.3 line 779).

H¹(O)=0 gives uniqueness of class extension and H²(O)=k gives one equation. Deligne’s Gauss–Manin/Kodaira–Spencer argument shows this equation is not divisible by p for nontrivial L: if L extended over the entire characteristic-p universal deformation, its crystalline class x would be nonzero, horizontal and satisfy Fx=px. Divide by its maximal power pᵃ to obtain y=p^(−a)x with nonzero reduction y₀; p-adic separatedness ensures this normalization exists. Frobenius divisibility puts y₀ in F¹. The graded Gauss–Manin map on F² excludes y₀∈F², and its map on F¹/F² excludes the remaining nonzero class, a contradiction (Deligne §2.11, deligne-lift lines 510–526). At p∤2d, c₁²=2d≠0 makes its tangent obstruction functional nonzero, giving smoothness.

*Needs:* §2.4; §2.5; CrystallineCohomology CR.2.3, CR.3.2–CR.3.3, CR.3:duality.1, CR.4.7, CR.7.3; SchemeAndStackFoundations §4.4; SchemeAndStackFoundations §4.5; `gap:crystalline-chern-derivative`.

**Checks.**

- L=O extends everywhere and has dimension 20; nontriviality is essential.
- At p|2d only flatness of the pair locus is asserted.
- One nonzero linear obstruction cuts the tangent dimension from 20 to 19.
- For L=M^p with M ample, c₁,dR(L)=0. Flatness uses the primitive integral crystalline normalization, not this zero reduction.

### 2.7 A polarized characteristic-zero lift

For a K3 surface over algebraically closed k of characteristic p>0 and any ample L, there is a complete DVR R finite over W(k), a smooth proper R-scheme 𝓧, a relatively ample 𝓛, and a marked special-fibre isomorphism (𝓧_k,𝓛_k)≅(X,L). (deligne-lift, Corollaries 1.7–1.8, pp.62–63; deligne-lift lines 140–160).

Use the flat pair-deformation divisor to find a finite trait in it: a parameter quotient followed by normalization gives the complete Noetherian DVR R. For a uniformizer π, pull the marked deformation back to compatible smooth proper levels 𝓧_n over R/(π^(n+1)), with Cartesian transition squares and actual invertible sheaves 𝓛_n together with compatible restriction isomorphisms. Their closed-fibre pair is (X,L), with L ample. AdicSpacesPartIII F0.3 transports this tower to its proper formal scheme and invertible sheaf; F0.8 constructs the projective R-scheme 𝓧 and relatively ample line 𝓛 with those reductions. The smoothness comparison in the supplier contract makes 𝓧 smooth along its closed fibre, and properness excludes a nonempty closed nonsmooth locus elsewhere. SchemeAndStackFoundations §4.10 compares coherent modules and morphisms on this constructed scheme. This is existence of a suitable lift, not liftability along every fixed deformation.

*Needs:* §2.6; AdicSpacesPartIII F0.3, F0.8, R2.9 smooth-formal-scheme and R2.10 adic-local-flatness-criterion; SchemeAndStackFoundations §§4.1 and 4.10; Mathlib `AlgebraicGeometry.Scheme.Hom.isOpen_smoothLocus`.

**Checks.**

- R may be ramified, including p=2.
- The conclusion supplies a chosen trait; it does not make the pair deformation space smooth at every bad prime.
- On the algebraization input, the tower ℙ¹ over R/(π^(n+1)) with O(1) has degree 1 at n=0 and n=1 and algebraizes to (ℙ¹_R,O(1)), also at residue characteristics 2 and 3. Taking O(1) at n=0 and O(2) at n=1 instead gives restriction degrees 1≠2, so it is not a compatible polarized tower.
- A smooth closed fibre alone does not imply smoothness over R: Spec(R/(π))→Spec R has closed fibre a smooth point, but π kills 1 in its local ring and it is not flat. It fails the smooth-level hypothesis already over R/(π²).

### Examples

The positive-power vanishing excludes O; characteristic 2 remains in the closed-form and lifting arguments. A trivial line deforms everywhere, so it cannot define a flat dimension 19 divisor.

### Dependencies

K3Surfaces K0, K0.A and K1; §1.2; §1.3; §1.5; AlgebraicModuliForArithmeticGeometry §7.6.1–§7.6.1a; ComplexComparisonPartII C3.2d.2–C3.2d.5; JacobianChallenge Layer D; SchemeAndStackFoundations §1.11; JacobianChallenge Layer C; §1.4; `gap:witt-formal-brauer`; CrystallineCohomology CR.4.6–CR.4.7; SchemeAndStackFoundations §5.10; CrystallineCohomology CR.4.1, CR.4.6–CR.4.7; `gap:oda-interface`; ComplexKahlerGeometry K6.1; ComplexComparisonPartII C−1.1, C1.9, C5.1; SchemeAndStackFoundations §0.9; SchemeAndStackFoundations §5.8; CrystallineCohomology CR.2.3, CR.3.2–CR.3.3, CR.3:duality.1, CR.4.7, CR.7.3; SchemeAndStackFoundations §4.1; SchemeAndStackFoundations §4.2; SchemeAndStackFoundations §4.3; SchemeAndStackFoundations §4.6; SchemeAndStackFoundations §4.4; SchemeAndStackFoundations §4.5; `gap:crystalline-chern-derivative`; AdicSpacesPartIII F0.3, F0.8, R2.9 smooth-formal-scheme and R2.10 adic-local-flatness-criterion; Mathlib `AlgebraicGeometry.Scheme.Hom.isOpen_smoothLocus`; SchemeAndStackFoundations §4.10; `gap:rational-surface-cohomology`; EtaleCohomologyFoundations F.6; SchemeAndStackFoundations §5.4.

## Layer 3: Integral geometric étale cohomology

### 3.1 Integral geometric étale invariants

For every K3 X/k and prime ℓ invertible in k, Hⁱ_et(X_kbar,ℤ_ℓ) is free with ranks (1, 0, 22, 0, 1), vanishes outside 0≤i≤4, and its degree 2 cup-trace pairing with the appropriate Tate twists is perfect. (rizov, §2.4, pp. 7–8; rizov lines 273–300).

Over ℂ apply the §1.3 adapter to K3Surfaces K1–K2 and then integral singular–étale comparison. Keep the actual singular cup lattice and its complex orientation throughout the comparison. For any characteristic-zero field, spread the polarized surface to a finitely generated subfield, embed that subfield into ℂ and apply geometric base change; the original field need not embed into ℂ. In positive characteristic lift by §2.7 and compare the compatible ℤ/ℓⁿ systems on geometric special and generic fibres by smooth proper base change before taking the adic limit. Duality supplies the pairing (rizov §2.4, rizov lines 273–300; the finite-presentation descent is SchemeAndStackFoundations §0.9).

*Needs:* §2.7; EtaleCohomologyFoundations F.0.3; EtaleCohomologyFoundations F.2.1; EtaleCohomologyFoundations F.2.2; EtaleCohomologyFoundations F.4.2; EtaleCohomologyFoundations F.4.4; EtaleCohomologyFoundations F.4.6; EtaleCohomologyFoundations F.5; ComplexComparisonPartII C6.3, C6.6; §1.3; K3Surfaces K1–K2; `gap:integral-topology`; SchemeAndStackFoundations §0.9.

**Checks.**

- The assertion excludes ℓ=char k.
- ℓ=2 is included when char k≠2; only the congruence bound later chooses odd ℓ.
- H⁰=ℤ_ℓ and the trace of the class of a geometric point in H⁴(2) is 1.
- A quartic hyperplane has integral singular cup square 4 and étale cup-trace square 4; negating the cup-trace pairing gives −4 and fails.
- For exp(2πit), the positive loop t∈[0,1] lifts with increment +1 in ℤ; c₁(O(1)) on ℙ¹ evaluates to +1. This fixes the normalization when transporting the supplied complex Chern class.

### Examples

For a smooth complex quartic the specialization adapter preserves the surface and its hyperplane; integral comparison sends its cup square 4 to cup-trace square 4. The free ranks are (1,0,22,0,1), with Euler sum 24.

### Dependencies

§1.3; §2.7; K3Surfaces K1–K2; `gap:integral-topology`; EtaleCohomologyFoundations F.0.3, F.2.1–F.2.2, F.4.2, F.4.4, F.4.6, F.5; ComplexComparisonPartII C6.3, C6.6; SchemeAndStackFoundations §0.9.

## Layer 4: Picard lattices and arithmetic rank boundedness

### 4.1 Picard pullback and arithmetic descent

For K3 X/k and every extension K/k, Pic(X)→Pic(X_K) is injective and preserves intersections, and is bijective when k is algebraically closed. Every geometric line-bundle class descends to a finite extension. A purely inseparable extension of degree pⁿ has Picard cokernel killed by pⁿ. For a finite Galois extension K/k with group G, Picard–Brauer descent gives Pic(X)⊗ℚ≅(Pic(X_K)⊗ℚ)^G. For geometric classes use G_k=Gal(kˢ/k): Pic(X)⊗ℚ≅(Pic(X_kbar)⊗ℚ)^(G_k), using purely inseparable comparison after rationalization. (huybrechts, Chapter 17 Lemma 2.2, Remark 2.4, §2.2, pp.365–367; huybrechts lines 13964, 13971, 13995, 14011–14025).

Injectivity uses nonzero sections of L and L⁻¹. Field base change preserves the Euler-characteristic intersection formula. Over an algebraically closed base the discrete étale Picard scheme makes a spread-out class constant. Descent over finite extensions follows from finite presentation. The pⁿ-power cocycle descends through purely inseparable extensions. Hochschild–Serre and Hilbert 90 give the Brauer obstruction, killed after tensoring ℚ. Define the Picard specialization map for a smooth proper K3 family over a DVR, with compatible geometric generic and special points fixed: closure of divisors after finite trait extensions defines an injective, intersection-preserving map Pic(X_ηbar)→Pic(X_sbar), hence ρ_geom(X_η)≤ρ_geom(X_s). Intersections are constant by the Euler-characteristic formula. If a class specializes to zero, its intersection with every generic-fibre line class is zero by this compatibility; §1.5 then makes the generic class zero, proving injectivity without using the lattice construction of §4.2 (Huybrechts Chapter 17 §2.5, Proposition 2.10, p.369, huybrechts lines 14121–14138).

*Needs:* §1.2; §1.4; §2.1; SchemeAndStackFoundations §0.9; SchemeAndStackFoundations §2.11; JacobianChallenge Layer C; JacobianChallenge Layer D; ComplexComparisonPartII C3.2d.4; §1.5; SchemeAndStackFoundations §§5.9–5.10.

**Checks.**

- K=k gives the identity on Pic(X), rather than multiplication by a degree or identification with all geometric classes.
- On the real Fermat quartic ∑xᵢ⁴=0, the line x₀=ζx₁, x₂=ζx₃ with ζ=exp(πi/4) and its conjugate are skew (solve both pairs of equations). Their classes have square −2 and mutual intersection zero, so are distinct. Gal(ℝ/ℝ)=1 cannot replace Gal(ℂ/ℝ) in geometric descent (huybrechts lines 14011–14018; adjunction §1.4).
- On a constant K3 family the specialization map agrees with field pullback; it preserves a quartic hyperplane square 4. Rank can increase under specialization, so no surjectivity assertion is made.
- C⊂K adds no Picard classes.
- An invariant geometric class need not be represented over k; no integral Galois-invariant identification is unconditional.

### 4.2 The geometric lattice realization

For a K3 surface X/k, prove `IsK3.picardGroup_finiteFree`: Pic(X) is free and finitely generated as an abelian group. Its rank is ρ and its intersection form realizes a nondegenerate even integral lattice of signature (1,ρ−1) on the image of Pic(X) in Pic(X)⊗ℚ. The quotient to the supplied arithmetic numerical divisor group is an isometry. Over algebraically closed k, Pic=NS as well. (huybrechts, Chapter 1 Proposition 2.4, p.12; Chapter 17 §2, p.364; huybrechts lines 335, 13945).

Over algebraically closed k use 1.5 to identify Pic with Num, whose finiteness and Hodge index are supplied. Over k, inject Pic into geometric Pic to obtain finite freeness; its rational span contains a k-ample positive class, so its orthogonal complement is negative definite. Apply the pinned rational-ambient lattice constructor; the geometry supplies the pairing, not a new abstract carrier.

Prove the following interface laws:

- The additive carrier is naturally equivalent to Additive(LineBundleClass X).
- B([L],[M])=L·M, in ℤ.
- 2Q([L])=L², and Q(O)=0.
- A lattice vector is determined by its native line-bundle class.
- Isomorphisms of K3 schemes induce isometries, with identity and composition laws.
- The numerical quotient comparison preserves the integral form and its scalar extensions.

*Needs:* §1.5; §4.1; SchemeAndStackFoundations §5.9; SchemeAndStackFoundations §5.10; `gap:surface-arithmetic-quotient`; Tau Ceti `TauCeti.IntegralLattice.ofSubmodule`; IntegralLattices Layer 1; IntegralLattices Completed Layers 1–5.

**Checks.**

- B(H,H)=4 and Q(H)=2 on a quartic.
- O is zero and pairs to 0 with every class.
- A rank-one lattice generated by a degree 4 polarization has Gram [4] and discriminant 4; it is not unimodular.
- A smooth rational curve has B(C,C)=-2 and Q(C)=-1.
- A line in ℙ² has square 1 over both ℝ and ℂ. Pushing a complex line to ℙ²_ℝ gives twice the real line class, so the finite-extension projection formula has the factor [ℂ:ℝ]=2 on its left; it must not multiply the intersection of two pulled-back classes by 2.

### 4.3 Arithmetic and geometric Picard ranks

Define ρ(X)=rankℤ Pic(X) and `geometricPicardRank k f`=ρ_geom(X)=rankℤ Pic(X_kbar), with the geometric rank independent of the chosen algebraic closure or algebraically closed overfield. (huybrechts, Chapter 17 Definition 2.3, p.365; huybrechts lines 13987–13994).

Use finite free ranks and compare two choices in a common algebraically closed overfield.

Prove the following interface laws:

- Two algebraic closures give equal ranks.
- Every field extension preserves ρ_geom.
- ρ is the finite ℤ-rank of the native additive Picard group.
- Over an algebraically closed field it evaluates to ρ.

*Needs:* §4.1; §4.2.

**Checks.**

- If k is algebraically closed, ρ_geom=ρ; closure choices cannot introduce a second rank.
- In positive characteristic ρ_geom can be 22 although h¹¹=20; rank is not defined as h¹¹.
- An ample line has positive square and infinite order, so rank 0 is impossible.
- The real Fermat quartic has geometric rank 20 (huybrechts Chapter 15 §3.2, line 12288). The skew conjugate lines of §4.1 make conjugation nontrivial on Pic(X_ℂ)⊗ℚ, so arithmetic rank is strictly smaller by Galois descent. Extending ℝ to ℂ increases arithmetic rank while geometric rank stays 20.

### 4.4 Rank bounds and the cycle map

Prove `IsK3.picardRank_bounds`: for K3 X/k, 1≤ρ(X)≤ρ_geom(X)≤22; in characteristic zero ρ_geom≤20. For every ℓ invertible in k, c₁ embeds Pic(X_kbar)⊗ℤ_ℓ into H²_et(X_kbar,ℤ_ℓ(1)) and preserves the intersection/cup-trace pairing. The saturated cycle-map theorem asserts that its cokernel is torsion-free; at ρ_geom=22 the map is an isomorphism. (huybrechts, Chapter 17 §§2.1–2.2, pp.365–366; huybrechts lines 13994, 14001–14010; rizov §2.4, lines 296–300).

Use the finite-level Kummer injections Pic/ℓⁿ→H²(µ_ℓⁿ), then the compatible inverse limit on the finite free Picard lattice. Reduction of c₁ modulo ℓⁿ is still injective: if ℓⁿy=c₁(x), finite-level Kummer injectivity gives x=ℓⁿz and torsion-freeness of H² gives y=c₁(z). Thus the cokernel is torsion-free; equal rank makes it zero. The bound 22 uses §3.1; characteristic zero spreads to C and uses the (1, 1) image of c₁, of dimension 20. Positivity gives the lower bound.

*Needs:* K3Surfaces K1–K2; §3.1; §4.1; §4.2; §4.3; EtaleCohomologyFoundations §0.9; EtaleCohomologyFoundations F.6; SchemeAndStackFoundations §2.11; SchemeAndStackFoundations §0.9.

**Checks.**

- The bound 20 is explicitly restricted to characteristic 0.
- tr(c₁(H)²)=4, fixing the positive cup-trace convention.
- At ρ_geom=22, saturation and rank 22 make c₁ an isomorphism, so no ℓ-primary index remains; multiplication by ℓ on ℤ_ℓ is an injective equal-rank map that would fail this test.

### 4.5 Congruence input for finite subgroups

For every odd prime ℓ and n≥0, prove that entrywise reduction GL_n(ℤ_ℓ)→GL_n(𝔽_ℓ) restricts to an injective homomorphism on every finite subgroup. Deduce that every finite subgroup of GL_n(ℤ) embeds by reduction into GL_n(𝔽₃). (huybrechts, Chapter 17 proof of Lemma 2.6, p.367; huybrechts lines 14045–14049).

Use torsion-freeness of the first principal congruence subgroup from NoncommutativeAndEquivariantIwasawa §0.1. If A and B in a finite subgroup have the same reduction, their multiplicative quotient A B⁻¹ belongs to that finite subgroup and to the congruence kernel; finite order and torsion-freeness give A B⁻¹=1, hence A=B. The integral consequence follows by the injective coefficient map ℤ→ℤ₃. Native matrix coefficient maps are `Matrix.GeneralLinearGroup.map` and `PadicInt.toZMod`.

*Needs:* NoncommutativeAndEquivariantIwasawa §0.1; Mathlib `Matrix.GeneralLinearGroup.map`; Mathlib `PadicInt.toZMod`.

**Checks.**

- GL₀ has only 1 and its kernel is trivial.
- The element -1 in GL₁(ℤ₃) reduces to 2, not 1.
- At ℓ=2, −1 in GL₁(ℤ₂) lies in the kernel and has order 2; oddness is essential.
- In GL₂(ℤ₃), for the nonzero elementary matrix E₁₂ one has E₁₂²=0 and (I+3E₁₂)^m=I+3mE₁₂, so no positive m kills I+3E₁₂.

### 4.6 Bounded extension degree for rank

Prove `IsK3.boundedPicardDescent`: for every K3 X/k some finite separable K/k of degree ≤ |GL₂₂(𝔽₃)| has ρ(X_K)=ρ_geom(X); choose K as an intermediate field in the fixed algebraic closure. Some finite extension, without a uniform degree assertion, realizes all Pic(X_kbar). The degree ≤ B conclusion realizes the entire geometric Picard group when k is finite, or char k=0 and X(k)≠∅. (huybrechts, Chapter 17 Lemma 2.6, p.367; huybrechts lines 14038–14054).

By §4.1 each geometric Picard class descends to a finite extension, so its Galois stabilizer is open, also over imperfect k by taking the separable part of that extension. This proves continuity for the discrete Picard group. Intersect the stabilizers of a finite basis from §4.2 to obtain an open kernel, hence finite image. Reduction mod 3 bounds its order in rank ≤ 22; pad lower ranks with identity blocks. The fixed field of the kernel has bounded separable degree. Brauer obstructions are torsion and purely inseparable cokernels are p-primary, so rational descent gives the whole rank. The composite of SchemeAndStackFoundations §§2.10, 2.15 with the inverse of TauCeti.brauerCohomologyEquiv and TauCeti.subsingleton_brauerGroup_of_finite gives H²_fppf(Spec K,G_m)=0 for finite K. This vanishing, or a rational point in characteristic zero, kills the integral obstruction. Descending finitely many generators gives the unconditional unbounded extension.

*Needs:* §4.1; §4.2; §4.4; §4.5; SchemeAndStackFoundations §§2.10, 2.15 and `TauCeti.brauerCohomologyEquiv` with `TauCeti.subsingleton_brauerGroup_of_finite`; ComplexComparisonPartII C3.2d.4.

**Checks.**

- An algebraically closed base needs degree 1.
- Equal rational span does not force equality of integral Picard groups.
- The point used for integral descent is k-rational and survives in K, not merely a geometric point.

### Examples

The quartic hyperplane has bilinear square 4 and half-norm 2. Rank 0 cannot occur. Reduction modulo 2 has the torsion kernel element -1, while odd residue primes exclude it.

### Dependencies

§1.2; §1.4; §2.1; SchemeAndStackFoundations §0.9; SchemeAndStackFoundations §2.11; JacobianChallenge Layer C; JacobianChallenge Layer D; SchemeAndStackFoundations §§2.10, 2.15 and `TauCeti.brauerCohomologyEquiv` with `TauCeti.subsingleton_brauerGroup_of_finite`; ComplexComparisonPartII C3.2d.4; §1.5; SchemeAndStackFoundations §5.9; SchemeAndStackFoundations §5.10; `gap:surface-arithmetic-quotient`; Tau Ceti `TauCeti.IntegralLattice.ofSubmodule`; IntegralLattices Layer 1; IntegralLattices Completed Layers 1–5; K3Surfaces K1–K2; §3.1; EtaleCohomologyFoundations §0.9; EtaleCohomologyFoundations F.6; Mathlib `PadicInt.toZMod`; Mathlib `PadicInt.ker_toZModPow`; Mathlib `PadicInt.ext_of_toZModPow`; Mathlib `PadicInt.mem_span_pow_iff_le_valuation`; NoncommutativeAndEquivariantIwasawa §0.1.

## Layer 5: Symplectic and polarized automorphisms

### 5.1 The actual symplectic predicate

For K3 X/k, a k-automorphism f is symplectic when its pullback on H⁰(X,ω) is the identity. This defines the kernel subgroup SymplecticAut X. To make pullback a left representation use ρ(f)=(f⁻¹)*; its kernel is the same. The predicate is independent of a nonzero volume-form generator and equivalent before and after any field extension. (huybrechts, Chapter 15 Definition 1.1 and Remark 1.3, pp.307–308; huybrechts lines 11765–11788).

The one-dimensional canonical section space has invertible pullbacks; functoriality gives the inverse-pullback representation. Faithful scalar extension detects equality of linear maps. A generator tests the whole one-dimensional space.

Prove the following interface laws:

- For σ≠0, IsSymplectic f ↔ f*σ=σ.
- Membership in the subgroup is the pullback-identity condition.
- Identity, product and inverse satisfy the subgroup laws.
- For K/k, f_K is symplectic iff f is.
- Inverse pullback is multiplicative with the native automorphism composition.

*Needs:* §1.2; §1.4; JacobianChallenge Layer C; AlgebraicVectorBundles L0C.

**Checks.**

- id pulls σ to σ; using a nontrivial canonical scalar would incorrectly exclude the identity.
- If f*σ=σ and g*σ=σ, (f∘g)*σ=g*f*σ=σ.
- If f*σ=aσ and b≠0, f*(bσ)=a(bσ); changing the generator does not change a.
- In characteristic ≠ 2 a map acting by -1 on the canonical line fails; in characteristic 2 that scalar equals 1.

### 5.2 Polarization stabilizers

For an ample L on K3 X/k, define Aut(X,[L]) as the stabilizer of its native Picard class under inverse pullback, and define SymplecticAut(X,[L]) by intersection with 5.1. A member records f with f*L≅L as a property, not a chosen isomorphism. (rizov, the unnumbered definition following Remark 3.3.2 and Proposition 3.3.3, pp.14–15; rizov lines 610–642).

Take the class stabilizer of the functorial Picard action and its intersection. Equality of classes is exactly existence of a sheaf isomorphism.

Prove the following interface laws:

- Membership is f*L≅L.
- Identity, products and inverses stabilize [L].
- An isomorphism of polarized surfaces gives a group isomorphism.
- The symplectic stabilizer is the subgroup intersection, with its natural injective inclusion.

*Needs:* §4.1; §5.1; Tau Ceti `TauCeti.AlgebraicGeometry.LineBundleClass`.

**Checks.**

- id fixes [L] for every L; the stabilizer condition is equality of classes, without extra scalar-isomorphism data.
- Multiplying a chosen isomorphism f*L≅L by k× does not create additional automorphisms.
- Aut(X,[Lⁿ])=Aut(X,[L]) for n>0 by torsion-freeness of Pic.
- On the complex Wehler surface of §5.4, H₁ is ample since the first projection is finite. The equality σ₁*H₁=H₁ puts σ₁ in Aut(X,[H₁]).
- H₂ is also ample, but σ₁*H₂=4H₁−H₂≠H₂: the Gram determinant −12 makes H₁,H₂ independent. Thus σ₁ is outside Aut(X,[H₂]); the full automorphism group would fail this test.
- The same σ₁ lies in Aut(X,[H₁]) but outside SymplecticAut(X,[H₁]), since its canonical scalar is −1 over ℂ.

### 5.3 Finite étale polarized automorphism schemes

For K3 X/k and ample L, the functor of k-scheme automorphisms preserving the relative Picard class of L is represented by a finite étale k-group scheme. The kernel of its action on the canonical section line is also a finite étale k-group scheme, with k-points exactly the symplectic polarized subgroup. Both k-point groups are finite. (huybrechts, Chapter 5 Proposition 3.3 and Remark 3.4, pp.91–92; huybrechts lines 3372, 3400; rizov Proposition 3.3.3 line 615).

Use an embedding by a sufficiently high power of L and the graph Hilbert scheme to represent the stabilizer by a finite-type closed algebraic subgroup of PGL. Its tangent is H⁰(T_X)=0, hence it is unramified and dimension 0. A finite-type dimension 0 group scheme over a field with zero geometric tangent is finite étale. Intersect its k-points with the symplectic subgroup. The canonical section line defines an inverse-pullback group-scheme character by coherent base change. Its scheme-theoretic kernel is a closed subgroup of a finite étale k-scheme, hence finite étale, and recovers the symplectic polarized subgroup on k-points. Prove the symplectic finite étale kernel comparison with this comparison.

*Needs:* §2.3; §5.2; SchemeAndStackFoundations §4.14.

**Checks.**

- A polarized involution is retained as a nonidentity point.
- Geometric automorphisms need not all be k-rational.
- Zero tangent supplies étaleness even in characteristic 2.

### 5.4 An infinite symplectic subgroup

There exists a smooth complex K3 complete intersection of bidegrees (1, 1),(2, 2) in P²×P² with both projections finite double covers. Their deck involutions σ₁,σ₂ act by -1 on H⁰(ω), and f=σ₁∘σ₂ is symplectic of infinite order. (huybrechts, Chapter 15 §2.5(i), p.318; huybrechts lines 12221–12231).

The open smooth finite-projection locus is nonempty in this complete-intersection family; adjunction and the Koszul sequence give K3. Deck involutions negate the canonical form by the double-cover formula. On column vectors in the ordered hyperplane classes H₁,H₂, prove that the actual pullbacks of σ₁ and σ₂ have matrices S₁=[[1, 4],[0,-1]] and S₂=[[-1, 0],[4, 1]], respectively. Then f*=S₂S₁=[[-1,-4],[4, 15]]. Trace 14 and eigenvalues 7±4√3 imply infinite order.

*Needs:* §1.1; §5.1; SchemeAndStackFoundations §2.23; SchemeAndStackFoundations §5.10; `gap:hypersurface-cohomology`; `gap:surface-quotient-resolutions`; JacobianChallenge Layer C.

**Checks.**

- Both deck pullback matrices preserve the Gram matrix [[2, 4],[4, 2]], of determinant −12; using the transpose matrices as column actions fails this pairing test.
- S₂S₁ has trace 14 and determinant 1, hence is not finite order.
- The two canonical scalars multiply (-1)(-1)=1; each deck involution alone fails symplecticity.
- The two Wehler equations are ample of bidegrees (1, 1),(2, 2) and their intersection is a surface; the smooth bidegree-(2, 0) divisor V(x₀x₁) in ℙ¹×ℙ² is disconnected, so positivity in each factor cannot be dropped.

### Examples

Identity is symplectic; pullback composition reverses order. Polarized automorphisms retain surface automorphisms and discard the scalar choices of a line-bundle isomorphism. A Wehler product has infinite order.

### Dependencies

§1.2; §1.4; JacobianChallenge Layer C; AlgebraicVectorBundles L0C; §4.1; Tau Ceti `TauCeti.AlgebraicGeometry.LineBundleClass`; §2.3; SchemeAndStackFoundations §4.14; §1.1; SchemeAndStackFoundations §2.23; SchemeAndStackFoundations §5.10; `gap:hypersurface-cohomology`; `gap:surface-quotient-resolutions`.

## Layer 6: Finite symplectic actions and universal bounds

### 6.0 The supersingular geometric lattice

For geometric K3 X/k of characteristic p>0 with ρ=22, there is a unique integer σ with 1≤σ≤10 and disc Pic(X)=-p^(2σ); its discriminant group is (ℤ/p)^(2σ). (huybrechts, Chapter 17 Proposition 2.19, pp.373–374; huybrechts lines 14317–14342).

The rank-22 isomorphism from §4.4 and prime-to-p unimodularity make the discriminant a signed p-power. Crystalline cycle-lattice duality makes it p-elementary and forces an even exponent. Hodge index gives the negative sign; IntegralLattices Layer 1 (1I), Milgram’s congruence, excludes σ=0 and 11; the latter uses evenness of B/p at discriminant length 22, including the dyadic parity in the crystalline contract. Uniqueness follows from p>1.

*Needs:* §4.2; §4.4; `gap:artin-discriminant`; IntegralLattices Layer 5; IntegralLattices Layer 6; §4.4; IntegralLattices Layer 1 (1I).

**Checks.**

- Signature (1, 21) gives negative determinant.
- An even unimodular lattice of signature (1, 21) is impossible.
- At σ=11 the rescaled lattice (Pic,B/p) would be even unimodular of signature (1, 21), so 8 must divide −20, a contradiction. For p=2 its evenness uses the crystalline parity input; p-elementarity alone would allow an odd unimodular rescaling.
- The statement includes p=2; no odd-prime-only supersingular classification is imported.

### 6.0a Height and Picard rank

For a K3 surface X over an algebraically closed field of characteristic p>0 with finite one-dimensional formal Brauer height h, one has h≥1 and ρ(X)≤22−2h. Consequently ρ(X)=22 forces infinite height. (artin-supersingular, Theorem (0.1), pp.543–544, artin-supersingular lines 40–55; the projective lifting hypothesis is supplied by §2.7).

Use a polarized projective characteristic-zero lift from §2.7, apply Artin’s surface height inequality with b₂=22, and use the one-dimensional finite-height alternative. The rank of the height-h Dieudonné module belongs to the formal-Brauer supplier contract.

*Needs:* §2.7; §3.1; §4.4; `gap:witt-formal-brauer`.

**Checks.**

- At h=1 the bound is ρ≤20, excluding 21 and 22 in that branch.
- At h=10 the bound is ρ≤2; h=11 would contradict the ample class and ρ≥1.
- Infinite height is not substituted as an integer in 22−2h; only the contrapositive rank-22 implication is asserted.

### 6.0b Genus-one surface theory and rank-five pencils

Genus-one fibration theory is consumed from NeronModelsAndSemistableAbelianVarietiesPartII and is not restated. Its §2.1 is the genus-one fibration carrier f:X→C over a smooth proper curve, with scheme-theoretic fibres, localization at a closed point to `TauCeti.Model` with its specified generic fibre, field extension, and the elliptic, quasi-elliptic and relative-minimality conditions. Its §2.2 is the fibre-type divisor with the multiplicity m_t and primitive divisor Fbar_t of a fibre, f⁻¹(t)=m_t Fbar_t. Its §2.3 is the geometric realization of EllipticCurves Layer 4's `ReductionSymbol` by the primitive divisor, with component schemes, normalization genera, intersection lengths and incidence points. Its §2.5 proves, for a relatively minimal fibration over an algebraically closed field, that the primitive geometric fibre has type I₀, I_n (n≥1), II, III, IV, I_n* (n≥0), IV*, III* or II*, including multiple fibres and the regular nonsmooth generic case, through its affine matrix classification. Its §§4.1–4.2 split R¹f_*O_X≃L⊕T with L invertible and T torsion, prove the canonical formula ω_X≃f*(ω_C⊗L⁻¹)⊗O_X(Σa_t Fbar_t) with 0≤a_t<m_t and a_t=m_t−1 at tame fibres, and prove deg L=−χ(O_X)−length(T). Its §4.7 is the generic Picard restriction theorem: for a proper flat g:S→B with S regular integral Noetherian of dimension two, B regular integral of dimension one and g_*O_S=O_B, restriction Pic(S)→Pic(S_η) is surjective with kernel generated by g*Pic(B) and the vertical component classes. Its §4.8 generates Pic(J) of a fibration with a section by the pullback of Pic(C), the section, the fibre components disjoint from it and the section classes. Its §4.16 proves that quasi-elliptic fibrations occur only in characteristics 2 and 3 and compactifies the quasi-elliptic generic Jacobian as a twisted additive group. Its §4.17 constructs the relatively minimal regular Jacobian fibration j:J→C with its generic identification and distinguished zero section, for elliptic and quasi-elliptic generic curves alike. Every genus-one pencil on a K3 surface has base ℙ¹, so the proper-base carrier suffices here. The targets below assume k algebraically closed, C a smooth proper curve over k and f:X→C relatively minimal, as in that supplier.

**Fibre root quotients.** Define R(φ) for a genus-one fibration φ as the orthogonal sum, over its reducible fibres, of their component lattices modulo their full integral radicals (enriques-one, Theorem 4.1.4, pp.363–364, lines 17436–17526; dolgachev-keum, §3, lines 424–443).

- Identify the root quotient of a reducible fibre with the negative definite ADE lattice of the finite type underlying the affine type that NeronModelsAndSemistableAbelianVarietiesPartII §2.5 assigns to the fibre; its radical is generated by the primitive multiplicity vector of §2.2. Prove invariance of the geometric type, hence of R(φ), under extension of the algebraically closed field.
- For a negative definite sublattice M_t of maximal rank in each reducible fibre component lattice, set M=⊕M_t and construct the induced isometric embedding M→R(φ). With a=[R(φ):image(M)] and d the absolute Gram determinant, prove d_M=a²d_R(φ). The same construction applies to quasi-elliptic fibres by their component classification (dolgachev-keum, equation (3.1), lines 420–443).

*Needs:* NeronModelsAndSemistableAbelianVarietiesPartII §§2.2–2.3 and §2.5; SchemeAndStackFoundations §§5.8–5.10 for adjunction and intersections; IntegralLattices Layers 1 and 5.

**Checks.**

- I₂ and III have root rank 1 and determinant 2, but I₂ has two transverse nodes and III one tangency of intersection length 2. I₃ and IV have root rank 2 and determinant 3, but three nodes versus one triple point. The root quotient does not see this distinction; the geometric realization does.
- A tame double smooth fibre has m=2 and Fbar reduced. An I₀* fibre has m=1 and primitive vector (2,1,1,1,1); its matrix kills that vector but sends (1,1,1,1,1) to (2,−1,−1,−1,−1). Primitive does not mean reduced.
- The sublattice 2ℤ in the negative rank-one lattice with Gram [−2] has index 2 and determinant magnitude 8=2²·2. Dividing by the index square gives the wrong value 1/2.
- A smooth I₀ fibre contributes the rank-zero root lattice, of determinant 1; a negative definite exceptional divisor has zero-dimensional radical and cannot be a fibre configuration.

**Jacobian comparisons.** Let j:J→C be the relatively minimal regular Jacobian fibration of NeronModelsAndSemistableAbelianVarietiesPartII §4.17 attached to f. Prove the following (enriques-one, Proposition 4.3.7, p.385, lines 18452–18464; Proposition 4.3.14, p.389, lines 18646–18657; Theorem 4.3.20, p.392, lines 18799–18817).

- J has no multiple fibres, R¹j_*O_J is invertible and ω_J≃j*(ω_C⊗(R¹j_*O_J)⁻¹), of degree −χ(O_J): the zero section meets every fibre with intersection number one, so the torsion T of §4.1 vanishes for J and the canonical formula of §§4.1–4.2 has no multiple-fibre term.
- χ(O_X)=χ(O_J) in every characteristic, including quasi-elliptic fibrations, using the map R¹f_*O_X→R¹j_*O_J with torsion kernel and cokernel of equal length at every closed point.
- Preservation of primitive Kodaira type and of the fibre root quotient, R(j)=R(f), and an isomorphism of actual fibres when the original fibre is nonmultiple. For an elliptic fibration the local comparison of the Jacobian type with the primitive torsor type is NeronModelsAndSemistableAbelianVarietiesPartII §3.11 after strict henselization at the closed point; the quasi-elliptic case is proved here on actual schemes, without inferring it from a smooth-generic torsor theorem.

*Needs:* NeronModelsAndSemistableAbelianVarietiesPartII §§2.1, 2.5, 3.11, 4.1–4.2 and 4.17; SchemeAndStackFoundations §§2.19–2.21 and §§5.8–5.10 for relative duality, Leray, adjunction and intersections; JacobianChallenge Layers B–C for coherent cohomology and curve RR; the fibre root quotient above.

**Checks.**

- For a Jacobian K3 over ℙ¹, χ(O_J)=2 and T=0 give R¹j_*O_J=O(−2) and ω_J=O; omitting ω_C or inverting the wrong line fails one of these values. This is the K3 recognition used in §6.0c.
- A section C₀ meets a full fibre in 1, so 1=C₀·(mFbar)=m(C₀·Fbar) forces m=1. A torsor may have a double fibre; its Jacobian cannot, and full-fibre isomorphism is asserted only for m=1.
- Equal kernel and cokernel lengths t=0,1,2 contribute 0−0=1−1=2−2=0 to the Euler comparison; a torsion kernel without a matching cokernel would change χ.
- A quasi-elliptic generic smooth group becomes G_a and multiplication by p is zero; the elliptic product's proper smooth generic group is not G_a. The comparison must retain both cases.

**Numerical restriction and determinant laws.** For the Jacobian fibration j:J→C the section C₀ and fibre F have Gram [[−χ(O_J),1],[1,0]], of determinant −1 (enriques-one, Corollary 4.3.8, p.385, lines 18465–18471). Define the degree-normalized restriction r:Pic(J)→MW(J/C) by restricting D−(D·F)C₀ to the generic fibre and using its zero section to identify degree-zero classes with generic Jacobian points. Let K_num be the kernel of Pic(J)→Num(J), let N=r(K_num), and let V⊂Num(J) be generated by C₀, F and the fibre components disjoint from C₀. Prove the following, using the generic Picard restriction theorem and Picard generation of NeronModelsAndSemistableAbelianVarietiesPartII §§4.7–4.8 (enriques-one, Proposition 4.3.2, p.382, lines 18349–18360):

- The map r is surjective, its kernel is generated by C₀ and vertical divisor classes, and it induces Num(J)/V≃MW(J/C)/N. In particular restriction to the generic fibre need not factor through Num(J); quotient its target by N before descending it.
- The section–fibre plane is orthogonal to the components disjoint from C₀, and V is its orthogonal sum with R(j). Hence |disc V|=d_R(j), including the rank-zero root lattice with determinant 1.
- If MW(J/C) is finite, put q=|MW(J/C)/N|. Then V has full rank, [Num(J):V]=q and q²|disc Num(J)|=d_R(j), by the square-index law. The equality q=|MW(J/C)| holds exactly when N=0, and then the formula uses the full Mordell–Weil order.

These targets use the numerical quotient and its actual kernel, rather than identifying numerical classes with all Picard classes. The K3 specialization has K_num=0 by §1.5 and is applied in §6.1 through the lattice comparison of §4.2; neither K3 input is a premise of the generic laws.

*Needs:* NeronModelsAndSemistableAbelianVarietiesPartII §§4.7–4.8 and §4.17; SchemeAndStackFoundations §§5.8–5.10; JacobianChallenge Layers A and D; IntegralLattices Layers 1 and 5; the fibre root quotient and Jacobian comparisons above.

**Checks.**

- For E×C over a positive-genus base C, pulling back a nontrivial degree-zero line gives a vertical class of degree zero; one fixed fibre cannot generate the entire kernel. For C=ℙ¹ the base Picard group instead has rank 1.
- For χ=2 the section–fibre matrix is [[−2,1],[1,0]], of determinant −1; replacing C₀ by C₀+F gives [[0,1],[1,0]]. At χ=1 the section square is −1 and the plane is odd, in agreement with the ordered basis (F,O) of NeronModelsAndSemistableAbelianVarietiesPartII §4.6.
- An A₈ sublattice of index 3 in E₈ has determinant magnitude 9=3²·1; replacing the index square by the index gives 3 instead of 9. For E×ℙ¹ over the algebraic closure of a finite field, E(k) is infinite torsion of rank zero; rank zero alone does not supply a finite group order.
- Over ℂ choose nonisogenous elliptic curves E,D and 0≠a∈D[2]. The free involution (x,t)↦(−x,t+a) gives a smooth Jacobian J=(E×D)/⟨ι⟩ over C=D/⟨t↦t+a⟩. Its sections are the constant points E[2], since every morphism D→E is constant and equivariance requires P=−P. Thus MW has order 4, all fibres have type I₀, and d_R=1. The invariant part of H²(E×D,ℚ) consists of the two factor classes, so b₂(J)=2; C₀,F have matrix [[0,1],[1,0]] and fill Num(J), of determinant −1. Each section difference C_P−C₀ is numerically zero and r(C_P−C₀)=P, so N=MW and q=1. The numerical formula reads 1²·1=1; using the full order gives 4²·1=16≠1. This fibration is not a product, since a product has infinitely many constant sections.
- For the degree-normalized restriction, r(C₀)=0 and r(F)=0, while r(C_P)=P for a section with generic point P. On the bielliptic example a nonzero P∈E[2] has C_P−C₀=0 in Num but r(C_P−C₀)=P≠0, so descent with target MW itself fails in both the quotient and determinant assertions.
- For the product E×ℙ¹ over ℂ with E:y²+y=x³ and P=(0,0), the tangent y=0 has intersection multiplicity 3 at P, so P has order 3 and −P=(0,−1)≠P. Thus r(C_P)=P distinguishes restriction from its inverse. The classes pulled back from Pic⁰(E) are numerically trivial and restrict to every element of MW=E(ℂ), so N=MW and both Num/V and MW/N are zero, although MW is infinite. The quotient law applies, while the finite-order determinant assertion has no finite m here.
- For a Jacobian K3 with finite MW, K_num=N=0, so q=|MW|. If a Jacobian K3 has Picard rank 18 and two II* fibres with all other fibres irreducible, then R=E₈(−1)² and d_R=1; its full-rank V gives finite MW, and the formula forces q=|MW|=1 and |disc Pic|=1. This is a conditional numerical test, not an existence claim or a determination of Picard rank from the fibre types alone. The section square −2 distinguishes this case from the bielliptic section square 0.

**Quasi-elliptic unirationality.** For a quasi-elliptic fibration, so in characteristic 2 or 3 by NeronModelsAndSemistableAbelianVarietiesPartII §4.16, construct a purely inseparable dominant rational map from a ruled surface over C to X; when C=ℙ¹, deduce that X is unirational (liedtke-surfaces, Corollary 4.2 and Definition 4.3, pp.20–21, lines 749–767; Theorem 8.3, p.34, lines 1326–1335).

*Needs:* NeronModelsAndSemistableAbelianVarietiesPartII §§2.1 and 4.16; SchemeAndStackFoundations §§4.11–4.12 for the ruled-surface map and modifications.

**Checks.**

- A quasi-elliptic geometric generic curve has normalization ℙ¹ and delta invariant 1. At p=3 the divisor (p−1)/2 is 1; at p=5 it is 2 and cannot divide 1, so the ruled-surface map is never requested at p=5. Characteristic 2 remains a separate allowed case.
- For C=ℙ¹ the ruled source is rational, so the dominant map gives unirationality. For C of genus 1 the ruled source instead has a nonconstant map to C; rationality of that source is not asserted.
- The elliptic product has smooth genus-one generic fibre; it is outside the quasi-elliptic assertion.

**Rank-five K3 pencils.**

For a K3 surface X over an algebraically closed field, ρ(X)≥5 implies a surjective genus-one fibration X→ℙ¹ with geometrically integral generic fibre. The fibration is elliptic outside characteristics 2 and 3; in those characteristics the quasi-elliptic alternative is retained. (huybrechts, Chapter 11 Proposition 1.3(ii), p.208, huybrechts line 7879, stated there for char k≠2, 3; the genus-one statement in every characteristic is Chapter 2 §3.3 and Remark 3.13, pp.32–34, huybrechts lines 1110–1132 and 1173–1183).

Hodge index makes Pic⊗ℚ indefinite. GlobalQuadraticForms §5.5 and the local rank-at-least-five criterion from QuadraticFormInvariants Layer 6D give a nonzero rational isotropic vector. Clear denominators and choose its primitive effective sign by RR. Reflection in effective (−2)-curves yields a primitive nef isotropic class; its complete linear system is a base-point-free genus-one pencil, a genus-one fibration in the sense of NeronModelsAndSemistableAbelianVarietiesPartII §2.1 with base ℙ¹. Retain the possible cuspidal geometric generic fibre in characteristics 2 and 3.

*Needs:* §1.4; §4.2; GlobalQuadraticForms §5.5; QuadraticFormInvariants Layer 6D; NeronModelsAndSemistableAbelianVarietiesPartII §§2.1 and 4.16.

**Checks.**

- A rank-one positive lattice generated by H with H²=4 has no nonzero isotropic vector; the rank threshold cannot be dropped.
- For a fibre F, (2F)²=0 but |2F| is composite with |F|; primitivity distinguishes the pencil from its multiples.
- A quasi-elliptic fibre has arithmetic genus one and rational cuspidal geometric generic fibre; isotropy alone does not prove smoothness in characteristics 2 and 3.

### 6.0c Infinite height with a genus-one pencil

For a K3 surface X over an algebraically closed field of characteristic p>0, infinite formal Brauer height together with an elliptic fibration X→ℙ¹ implies ρ(X)=22; no section is assumed. A quasi-elliptic fibration also implies ρ(X)=22, without a height hypothesis. For every geometric K3 in positive characteristic, ρ≥21 implies ρ=22: finite height is excluded by §6.0a, and at infinite height §§6.0b–6.0c give a pencil and rank 22. (artin-supersingular, Theorem (1.7)(i), p.547, artin-supersingular lines 192–210; quasi-elliptic alternative huybrechts Chapter 2 Remark 3.13, lines 1182–1183).

Apply Artin’s elliptic theorem in its formal-height convention, using the Jacobian-fibration comparison also when the pencil has no section. For a quasi-elliptic pencil over ℙ¹, use the general surface unirationality input and the unirational-surface cycle theorem. These alternatives close the small-characteristic branch without assuming every genus-one pencil is elliptic. For an elliptic K3 pencil without a section, its relatively minimal Jacobian J is K3 and ρ(J)=ρ(X), by Artin Lemma (1.8), artin-supersingular lines 204–210. The genus-one Jacobian construction preserves the fibre root quotient (dolgachev-keum lines 493–496); include the quasi-elliptic Jacobian of NeronModelsAndSemistableAbelianVarietiesPartII §§4.16–4.17 in characteristics 2 and 3, with the comparisons of §6.0b. For the K3 recognition, χ(O_X)=χ(O_J)=2 and C=ℙ¹ give R¹j_*O_J=O(−2), hence ω_J=O and H¹(J,O_J)=0 by Leray. Its section–fibre plane becomes the even hyperbolic plane after C₀ is replaced by C₀+F; the numerical lattice is Pic by §1.5. Apply the preceding rank implication to both X and J whenever their vertical root lattices have rank 20.

Prove also the rank-21 exclusion: For a geometric K3 in positive characteristic, ρ≥21 if and only if ρ=22, using the finite-height inequality and the elliptic or quasi-elliptic pencil alternatives.

Prove also the K3 Jacobian comparison: For a relatively minimal genus-one pencil on a geometric K3, its relatively minimal Jacobian is K3 with the same fibre-component root lattice; for an elliptic pencil their Picard ranks agree (dolgachev-keum lines 493–496; Artin Lemma (1.8), artin-supersingular lines 204–210).

*Needs:* §3.1; §4.4; `gap:witt-formal-brauer`; NeronModelsAndSemistableAbelianVarietiesPartII §§2.1, 4.16–4.17; §6.0b; `gap:rational-surface-cohomology`; §6.0a.

**Checks.**

- An elliptic genus-one fibration without a section satisfies the same height/rank assertion; adding a section would narrow Artin’s theorem.
- At finite height h=1 the rank is at most 20 by §6.0a; the elliptic hypothesis alone does not imply rank 22.
- The characteristic-2 or characteristic-3 quasi-elliptic case uses unirationality, not a claim of smooth elliptic generic fibre.
- Rank 21 would force infinite height by §6.0a and a genus-one pencil by §6.0b, hence rank 22 by the elliptic or quasi-elliptic alternative; the rank-20 root argument may therefore use rank 22 on both the quotient K3 and its Jacobian.

### 6.1 Tame quotients and their exceptional lattices

For geometric K3 X/k and finite symplectic G with |G| invertible in k, X/G has rational double points and its minimal resolution Y is K3. The exceptional root lattice R_G⊂Pic(Y) has discriminant prime to char k when char k>0. If char k>0 and rank R_G=20 its determinant is nonsquare. Local stabilizers embed into SL₂(k). (dolgachev-keum, Lemmas 3.1–3.2 and proof of Theorem 3.3, pp.10–13; dolgachev-keum lines 399, 444, 507).

Tame linearization makes a local symplectic stabilizer a finite subgroup of SL₂. Resolve its ADE singularities; discrepancy 0 and coherent quotient formulas give canonical triviality and H¹=0 on Y. Use the prime-to-p local discriminants. In rank 20, the exceptional classes and an ample class give ρ(Y)≥21, hence ρ(Y)=22 by §6.0c. Use §6.0 to write |disc Pic(Y)|=p^(2σ). If det R is a square, the rank-two orthogonal complement has negative square determinant and a primitive isotropic vector. RR and reflections as in §6.0b give a genus-one pencil whose vertical root lattice contains an isometric copy M of R with finite index a; thus det M=a²det R(φ). Its Jacobian J is K3 with R(J)=R(φ), so ρ(J)≥21 and §6.0c gives ρ(J)=22. The section and fibre span a unimodular plane. Pic(J)=Num(J) by §1.5 and §4.2, so the numerical-kernel image N of §6.0b is zero. The generic Picard restriction and Shioda–Tate generation of NeronModelsAndSemistableAbelianVarietiesPartII §§4.7–4.8 identify the Mordell–Weil group with the finite quotient of Pic(J) by the full-rank section–fibre and component lattice; hence it has finite order m and det R(J)=m²|disc Pic(J)| by §6.0b. By §6.0 this is divisible by p, contradicting p∤det R. The Jacobian construction and vertical-lattice comparison retain the quasi-elliptic alternative at p=2, 3 (dolgachev-keum lines 465–505). G=1 has Y=X and zero root lattice.

*Needs:* §1.4; §1.5; §2.3; §3.1; §4.2; §5.1; `gap:surface-quotient-resolutions`; McKaySkewGroup Layer 0 and §§7.1–7.3; NilpotentOrbits N8; `gap:tame-linear-groups`; NeronModelsAndSemistableAbelianVarietiesPartII §§2.1, 4.7–4.8 and 4.17; §6.0b; IntegralLattices Layer 5; `gap:tame-quotient-singularities`; §6.0; §6.0c.

**Checks.**

- G=1 gives Y=X and rank R=0, with determinant 1.
- A symplectic involution gives eight A₁ points, whose root lattice has determinant 2⁸.
- The argument is not applied to a group of order divisible by char k.

### 6.1a Cyclic quotient arithmetic

Let a cyclic group C_n, n>1 invertible in an algebraically closed k, act faithfully and symplectically on a K3 X. For each divisor m>1 of n let a_m count orbits whose stabilizer has order m. Then 24(n−1)=Σ_(m|n,m>1) a_m(n/m)(m²−1), the quotient exceptional lattice is ⊕_(m|n,m>1) A_(m−1)^(a_m) with negative form, and for each d|n, d>1, the order-d subgroup fixes Σ_(d|m|n)(n/m)a_m points. The corresponding relations for every subgroup, orbit divisibility and rank bounds leave n∈{2, 3, 4, 5, 6, 7, 8, 11, 14, 15}; the last three possibilities are excluded by the rank-20 nonsquare-discriminant theorem in positive characteristic and by the rank-19 bound in characteristic zero. (nikulin-symplectic, §5 equation (5.2) and cyclic cases, Russian original pp.108–110, nikulin-symplectic lines 1561–1624; dolgachev-keum Theorem 3.3 proof, lines 511–520).

Remove the finitely many points with nontrivial stabilizer. The free degree-n cover multiplies the compact-support Euler characteristic by n, while resolving an A_(m−1) point contributes m to Euler characteristic. Apply the resulting identity also to every subgroup. Divisor inversion gives f(r)=24/(r∏_(q|r,q prime)(1+1/q)) for the fixed-point number of each nontrivial subgroup of order r. For a prime q, f(q)=24/(q+1) is integral, leaving q∈{2,3,5,7,11,23}; q=23 forces exceptional rank 22 and is excluded. Orbit divisibility for order 16 would require 2=1+2a₈, and for order 9 would require 6=2+3a₃; both are impossible. The squared orders 25,49,121 have nonintegral f. For two distinct remaining primes, integrality of 24/((q+1)(r+1)) leaves only orders 6,14,15. Order 12 would require 2=1+2a₆, while order 28 has nonintegral f; every other larger mixed order contains an excluded subgroup. Thus the root-rank bound and the subgroup relations give exactly the candidate list stated above, before the discriminant exclusions. In characteristic zero the projective Picard rank is at most 20, so a negative definite root lattice has rank at most 19. In positive characteristic use 6.1 to exclude the three square-discriminant rank-20 candidates. The displayed arithmetic must include order 14 even though the cited case lists omit it; its exclusion uses the same rank-20 theorem.

Prove the following interface laws:

- The displayed orbit identity holds for the full cyclic group and for each nontrivial subgroup.
- The order-d fixed-point number is the displayed stabilizer sum.
- The order-11, order-14 and order-15 candidate root lattices 2A₁₀, A₁₃⊕A₆⊕A₁ and A₁₄⊕A₄⊕A₂ have rank 20 and square determinants 121, 196 and 225, respectively, and cannot occur.

*Needs:* K3Surfaces K1–K2; §3.1; §5.1; §6.1; McKaySkewGroup §§7.2–7.3; NilpotentOrbits N8; `gap:tame-quotient-singularities`; IntegralLattices Layer 1; `gap:tame-lefschetz`; MorseNovikov N6; §4.4.

**Checks.**

- a₂=8 gives 24(2−1)=8·3 and the root lattice 8A₁.
- a₄=4 and a₂=2 give 72=4·15+2·2·3; the square fixes 4+2·2=8 points.
- 2A₁₀, A₁₃⊕A₆⊕A₁ and A₁₄⊕A₄⊕A₂ have rank 20 and determinants 121, 196 and 225; Euler arithmetic alone must not certify them.
- At n=14 the counts (a₂,a₇,a₁₄)=(1,1,1) give 21+96+195=312=24·13; the order-7 subgroup fixes 1+2=3 points and gives 3·48=144=24·6, while the involution fixes 1+7=8 points and gives 8·3=24. Thus the subgroup relations also retain this candidate.

### 6.2 The element-order and fixed-point table

For geometric K3 X/k and a nonidentity finite-order symplectic automorphism g, if char k=0 or ord(g) is prime to char k, its geometric fixed scheme is reduced finite and (ord(g),number of points) is one of (2, 8),(3, 6),(4, 4),(5, 4),(6, 2),(7, 3),(8, 2). The same counts apply after algebraic closure for nonclosed k. (dolgachev-keum, Theorem 3.3, p.13; dolgachev-keum lines 507–520; nikulin-symplectic §5; mukai (0.1), line 53).

No eigenvalue 1 at a tame nonidentity symplectic fixed point makes the fixed scheme reduced of dimension 0. Apply §6.1a to every cyclic subgroup: its quotient Euler and orbit relations give the counts and exclude orders 11, 14 and 15 by the square-discriminant or characteristic-zero root-rank argument.

*Needs:* §3.1; §5.1; §6.1; EtaleCohomologyFoundations F.6; §6.1a; `gap:tame-lefschetz`; MorseNovikov N6.

**Checks.**

- Order 2 gives 8 fixed points, hence total cohomological trace 8 and H² trace 6.
- Order 7 gives 3 points, not the value 2 for order 8.
- id fixes X and must not enter the finite table.

### 6.2a Wild fixed loci and quotient divisors

For a geometric K3 X in characteristic p>0 and an automorphism g of exact order p, put F=Fix(g)_red. A zero-dimensional F has at most two points; if empty then p=2 and X/⟨g⟩ is a µ₂-type nonclassical Enriques surface; if it has one point the resolution is rational or K3, and if two points the resolution is K3; the K3-resolution cases require p≤5. If F has a curve, it is a connected divisor and κ(X,F) is 0, 1 or 2. At κ=0 it is a negative definite ADE nodal cycle. At κ=1 a divisor supported on F gives a genus-one fibration, with the quasi-elliptic possibility only in characteristics 2 and 3 and p≤11. At κ=2 choose a nef big D of minimal multiplicities with support F, set N=D²/2+1 and d=h⁰(O(D−F)); then p(N−d−1)≤2N−2. (wild-cyclic, Theorems 1–4, pp.1–2, wild-cyclic lines 14–44; dolgachev-keum Proposition 2.4, lines 218–226).

Use the equivariant O-cohomology sequences to separate the finite fixed sets from the divisor case. In the divisor case prove the anticanonical quotient relation and connectedness, then apply RR and surface intersection theory to its three Kodaira dimensions. Keep all maps on the actual quotient, without a prime-to-p averaging operator.

Prove the following interface laws:

- When F is one-dimensional, the normal quotient Z has rational singularities and −K_Z∼(p−1)B, where B is its effective quotient divisor with support the image of F; no claim B is reduced is made.
- After contracting F in the κ=0 case, its quotient is rational with trivial canonical divisor and one elliptic Gorenstein singularity, using the refinement in dolgachev-keum Proposition 2.4. Its smooth projective resolution has algebraic H² by gap:rational-surface-cohomology; no cohomology claim is made for the singular contraction itself.
- For the fibration at κ=1 the induced base action has order p unless p=2 and the fibration is elliptic; the fixed-fibre types are those in wild-cyclic Theorem 3.

*Needs:* §1.4; §3.1; §4.2; §5.1; SchemeAndStackFoundations §2.23; `gap:surface-quotient-resolutions`; NeronModelsAndSemistableAbelianVarietiesPartII §2.1; §6.0b; `gap:rational-surface-cohomology`.

**Checks.**

- An empty fixed set is retained at p=2; a positive fixed-point count cannot be assumed for wild actions.
- The κ=0 intersection matrix is negative definite, whereas the fibre-component matrix at κ=1 has a radical; interchanging them fails.
- If D²=2 and d=1, then N=2 and N−d−1=0: the inequality is 0≤2 and gives no prime bound; dividing by N−d−1 would be invalid.

### 6.3 Wild quotient alternatives

For geometric K3 X/k in characteristic p>0 and g of order p, the minimal resolution of X/⟨g⟩ is rational, a nonclassical µ₂-type Enriques surface (only p=2 with empty fixed locus), or K3. The fixed locus is either finite with at most 2 points or a connected divisor of Kodaira dimension 0, 1 or 2. In the K3 quotient branch the exceptional locus increases Picard rank, and the rational transcendental cokernel H²_et/(Pic⊗ℚ_ℓ) of its resolution is the g-invariant cokernel of X. In the rational branch H²_et(X,ℚ_ℓ(1))^g is algebraic. In the free Enriques branch dim H²_et(X,ℚ_ℓ)^g=10; this assertion uses the second Betti number, without a Picard-rank identification. (wild-cyclic, Theorems 1–4, pp.1–2; wild-cyclic lines 14–44; keum §6, lines 788–815).

Analyze equivariant O-cohomology and the anticanonical quotient. Track rational versus rational-double-point singularities and the empty-fixed-locus characteristic 2 case. Quotient correspondences with ℚ_ℓ coefficients and resolution contributions identify the algebraic and transcendental pieces. No tame linearization is used. In the rational branch apply the general rational-surface cycle theorem, then the quotient transcendental comparison. In the Enriques branch q:X→Y is a finite étale C₂-torsor, even in characteristic 2. Rational quotient descent gives Hⁱ(Y,ℚ_ℓ)=Hⁱ(X,ℚ_ℓ)^g and H¹(Y)=H³(Y)=0. Since T_X=q* T_Y, the projection formula gives deg c₂(T_X)=2 deg c₂(T_Y). Gauss–Bonnet yields e(Y)=24/2=12 and b₂(Y)=12−2=10.

*Needs:* §3.1; §4.2; §4.4; SchemeAndStackFoundations §2.23; `gap:surface-quotient-resolutions`; §6.2a; `gap:quotient-transcendental-comparison`; `gap:rational-surface-cohomology`; SchemeAndStackFoundations §2.15 and EtaleCohomologyFoundations F.4.2–F.4.6; EtaleCohomologyFoundations F.6; SchemeAndStackFoundations §5.4.

**Checks.**

- Empty fixed locus belongs only to p=2 and the µ₂-Enriques branch.
- The free characteristic-2 quotient has e=12 and b₂=10, hence cannot come from an identity action on H² of dimension 22; no equality ρ=b₂ is used.
- The nontrivial exceptional root lattice makes the K3 resolution rank strictly larger than the quotient rank.
- For the free C₂-torsor in characteristic 2, ℓ is odd and rational descent computes b₂=10 without computing ρ; replacing this with an unowned Picard-rank assertion fails.

### 6.3a Refinements of the wild alternatives

For geometric K3 X in characteristic p>0 and g of order p, a fixed divisor of Kodaira dimension 2 forces p≤5; a nodal fixed cycle forces p=2. If Fix(g)_red is one point and the quotient is rational, then either p=11 or X has a g-invariant arithmetic-genus-one fibration. Any g-invariant genus-one fibration forces p≤11. For any elliptic K3 fibration with section over an algebraically closed field of characteristic p>7, its group of p-torsion sections is zero. (dolgachev-keum, Propositions 2.3, 2.5, 2.9, 2.11 and Theorem 2.13, pp.4–10, dolgachev-keum lines 160, 229, 287, 353, 391).

For κ=2 refine the minimal nef-supported-divisor inequality and its fixed components; for a nodal cycle intersect the fundamental anticanonical divisor with a (−1)-curve to get p=2. In the one-point rational-quotient case, the exceptional p-elementary lattice gives an isotropic class and invariant pencil, or the rank-two Euler calculation gives p=11. Bound an invariant pencil by its base action and singular fibres or the Jacobian p-torsion calculation. Retain the stronger p>7 torsion exclusion as its own elliptic K3 assertion, rather than making it a premise on all genus-one fibrations.

Prove the following interface laws:

- κ(X,F)=2 implies p≤5.
- κ(X,F)=0 implies p=2.
- A rational quotient with one fixed point gives p=11 or an invariant genus-one pencil.
- An invariant arithmetic-genus-one pencil implies p≤11.
- For an elliptic K3 fibration with section at p>7, the p-torsion-section subgroup is zero.

*Needs:* §1.4; §4.2; §6.2a; NeronModelsAndSemistableAbelianVarietiesPartII §§2.1 and 4.17; §6.0b; IntegralLattices Layer 1; IntegralLattices Layer 5.

**Checks.**

- At p=11 the pencil reduction is not assumed; that branch already satisfies the bound.
- Quasi-elliptic pencils at p=2 or 3 satisfy the bound and are not treated as smooth elliptic generic fibres.
- At p=13 an invariant genus-one pencil is impossible for an order-13 automorphism; no general vanishing of p-torsion for arbitrary elliptic surfaces is inferred.

### 6.4 The wild-prime bound

If a finite subgroup of Aut_k(X) has order divisible by p=char k>0, then p≤11. No symplectic hypothesis on the subgroup is needed. This is `IsK3.wildPrime_le_eleven` in `Suggested.lean`, stated over every field for a finite subgroup of Aut_k(X) whose order the characteristic divides. (dolgachev-keum, Theorem 2.1, pp.4–10; dolgachev-keum lines 138–139, 160; keum line 128).

Cauchy gives an order-p element, automatically symplectic because k× has no p-torsion. Apply the fixed-locus analysis: the general-type fixed divisor gives p≤5, a nodal cycle gives p=2, and the remaining cases reduce to genus-one fibrations and their p-torsion restrictions. Descend the assertion from algebraic closure.

*Needs:* §5.1; §6.3; §6.3a.

**Checks.**

- At p=13 every finite automorphism subgroup has order prime to 13.
- Characteristic 2 is included, with no assertion that the subgroup is tame.
- Finiteness of the subgroup is an explicit hypothesis: the order of an infinite subgroup is the junk value 0, which every prime divides, and the infinite automorphism groups of §5.4 would otherwise make the statement false.

### 6.4a Faithfulness on the rank-22 Picard group

For a K3 surface X over an algebraically closed field of characteristic p>0 with geometric Picard rank 22, inverse pullback Aut(X)→Aut(Pic(X)) is injective: an automorphism fixing every line-bundle class is the identity. No finite-order assumption is required. This is `IsK3.picardFaithful_of_rank22` in `Suggested.lean`: on a K3 surface over an algebraically closed field of positive characteristic whose group of line-bundle classes has rank 22, an automorphism whose pullback fixes every class is the identity. (rudakov-shafarevich, §8, Proposition 3; its precise use is keum §6, lines 799–801).

Prove the rank-22 surface theorem of Rudakov–Shafarevich, retaining its geometric hypothesis and every characteristic. The polarized stabilizer result first makes any Picard-trivial automorphism finite order; the remaining rigidity is the rank-22 K3 theorem, not a consequence of abstract lattice finiteness or of the later étale faithfulness theorem.

Prove the following interface laws:

- For rank 22, the Picard action kernel consists only of the identity.
- Two automorphisms inducing the same Picard action are equal.

*Needs:* §4.2; §5.3.

**Checks.**

- The identity induces the identity and is the only kernel element at rank 22.
- Characteristic 2 is included, so the rational-quotient branch in 6.5 needs no p>2 restriction.
- A degree-two K3 in characteristic zero has a deck involution fixing its polarization; fixing an ample class alone cannot replace the rank-22 and full-Picard hypotheses.

### 6.5 Faithfulness in every characteristic

For any K3 X/k and every prime ℓ invertible in k, inverse pullback gives a faithful action of Aut_k(X) on H²_et(X_kbar,ℤ_ℓ), hence also on H²_et(X_kbar,ℚ_ℓ). (keum, Theorem 1.4 and §6, pp.3, 19–20; keum lines 120–123, 767–815; characteristic-zero integral case rizov Lemma 3.4.1 line 659).

A cohomologically trivial automorphism fixes Pic and an ample class, so has finite order by 5.3. In characteristic 0 Hodge comparison makes it symplectic; the nonidentity tame trace table contradicts identity trace 22 on H². In positive characteristic cross-realization makes it symplectic; remove the prime-to-p part using 6.2 and reduce to order p. The rational quotient has algebraic H² by the surface cycle contract; §6.3 and cohomological triviality force ρ=22, then the supersingular Picard-faithfulness theorem applies. The free Enriques quotient has invariant dimension 10 by the finite étale descent and Gauss–Bonnet calculation of §6.3; the K3-resolution case gives 22>22 by the strict exceptional-rank increase and invariant transcendental comparison. Integral freeness relates the two actions.

*Needs:* K3Surfaces K1–K2; §3.1; §4.4; §5.1; §5.3; §6.2; §6.3; §6.4; `gap:cross-realization`; §6.4a; `gap:rational-surface-cohomology`; SchemeAndStackFoundations §2.15 and EtaleCohomologyFoundations F.4.2–F.4.6.

**Checks.**

- id acts identically and is the only kernel element.
- There is no use of a rank 22 ℤ_p étale realization in characteristic p.
- The µ₂-Enriques branch is included rather than discarded by a p≠2 assumption.

### 6.6 A universal finite-subgroup bound

For every K3 X/k and finite subgroup G≤Aut_k(X), |G|≤max(|GL₂₂(𝔽₃)|,|GL₂₂(𝔽₅)|). Consequently only finitely many abstract finite group isomorphism types occur over all fields and K3 surfaces. The bound is `IsK3.finiteSubgroup_card_le` in `Suggested.lean`, stated for every field and every finite subgroup of Aut_k(X). (keum, Derived from Theorem 1.4, p.3, keum line 120; integral ranks rizov §2.4 line 273; congruence input huybrechts line 14049).

Choose ℓ=3 unless char k=3, then ℓ=5. A basis identifies rank 22 integral cohomology with ℤ_ℓ²². Faithfulness and odd-prime congruence inject G into the finite GL₂₂. Finite groups of bounded order have finitely many multiplication tables up to isomorphism; this is a finiteness proof, not an enumeration procedure.

*Needs:* §3.1; §4.5; §6.5.

**Checks.**

- G=1 has order 1 and satisfies both candidate bounds; an order-zero convention would give the wrong value.
- Characteristic 3 uses ℓ=5.
- A wild finite subgroup is included; no averaging in its group order is used.
- Over a nonclosed field Aut_k(X) embeds in the geometric automorphism group, so the bound descends; the statement does not assume k algebraically closed.

### 6.7d The involution pencil input

For a geometric K3 X in characteristic p>0 with p≠2 and a symplectic automorphism g of exact order two, an invariant ample line admits a polarized lift of (X,g) over a finite extension of W(k). The generic automorphism is again a symplectic involution. This is a K3 consequence of Deligne’s deformation calculation, with the tame equivariant formalism in `gap:tame-equivariant-deformations` (deligne-lift §2.3–§2.4 and §2.11, lines 257–326, 510–526).

The fixed marked deformation space is formally smooth over W(k), with tangent H¹(T_X)^g. The eight-point trace in §6.2 gives invariant H² rank 14; crystalline cross-realization and equivariant Hodge degeneration give dim H¹(Ω¹)^g=12 and hence dim H¹(T_X)^g=12 by contraction with the invariant volume form. Choose the norm ample line A⊗g*A, with its canonical involution linearization. Its pair locus inside the fixed formal space is defined by one equation. To prove that equation is not divisible by p, assume extension over the entire characteristic-p fixed deformation and apply the primitive crystalline normalization of §2.6. The normalized class is still g-invariant since the crystalline module is torsion-free. If its reduction lies in F², contraction identifies the graded Gauss–Manin map along the nonzero invariant tangent space with multiplication by the volume form, giving a contradiction to horizontality. Otherwise its nonzero class in (F¹/F²)^g pairs nontrivially with H¹(T_X)^g: Serre duality is equivariant and averaging is exact since 2 is invertible. This again contradicts horizontality. Thus the pair locus is flat. Take a mixed-characteristic trait R through its closed point. As in §2.7, its pullback gives Cartesian smooth proper levels over R/(π^(n+1)) with compatible actual ample-line representatives and their involution linearizations. Apply AdicSpacesPartIII F0.3 and F0.8 to construct the projective pair, and the smoothness comparison of §2.7 to obtain its smooth R-scheme. SchemeAndStackFoundations §4.10 then algebraizes the compatible involutions g_n:𝓧_n→𝓧_n and the isomorphisms g_n*𝓛_n≅𝓛_n. Full faithfulness gives g²=id and the line-linearization cocycle, since these identities hold at every level. The reduction g is nonidentity, so the algebraized involution has exact order two. The scalar on the lifted canonical line has square one and reduces to +1; since 2 is invertible it is +1.

*Needs:* §2.3; §2.4; §2.5; §2.6; §3.1; §6.2; `gap:tame-equivariant-deformations`; `gap:crystalline-chern-derivative`; `gap:cross-realization`; SchemeAndStackFoundations §§4.1–4.6 and §4.10; AdicSpacesPartIII F0.3, F0.8, R2.9 smooth-formal-scheme and R2.10 adic-local-flatness-criterion; CrystallineCohomology CR.7.3.

**Checks.**

- Trace 6 on H² gives invariant rank (22+6)/2=14; subtracting the invariant H²(O) and H⁰(Ω²) gives tangent dimension 12, not 20.
- Replacing the norm ample line L by L^p annihilates its de Rham class, but primitive crystalline normalization still proves flatness of the fixed pair divisor.
- At p=2 averaging and the separation of +1 from −1 fail, so this lifting assertion is not used.
- On the auxiliary tower ℙ¹_R with O(1), [x:y]↦[−x:y] squares to the identity and its diagonal line linearization squares to 1. For odd residue characteristic its reduction is nonidentity, so algebraization preserves exact order two; in residue characteristic 2 that reduction is the identity, illustrating why the reduction test needs p≠2.

For a K3 surface X over an algebraically closed field of characteristic p>0 with p≠2 and a symplectic automorphism g of exact order two, ρ(X)≥9, hence ρ(X)≥5 and X admits a genus-one fibration. It is elliptic if p≠3; at p=3 a quasi-elliptic fibration suffices for the rank-22 deduction of §6.0c. (dolgachev-keum, Lemma 4.3, pp.15–16, dolgachev-keum lines 597–648; the genus-one versus elliptic distinction is huybrechts lines 1127–1132, 1173–1183).

Apply the tame involution lifting theorem of §6.7d, spread its polarized generic fibre and involution to a finitely generated characteristic-zero field and compare over ℂ. Lefschetz gives trace 6 on H² and an anti-invariant subspace of dimension (22−6)/2=8. Symplecticity makes that rational subspace of type (1,1); the exponential-sequence description in K3Surfaces K1 makes it algebraic. An invariant ample class is independent of it, giving generic Picard rank at least 9 (huybrechts Chapter 15 §1.2, lines 11901–11908). The injective intersection-preserving Picard specialization map of §4.1 gives ρ(X)≥9. Apply §6.0b. The integral modulo-2 inference in dolgachev-keum lines 643–647 is not a premise of this proof.

*Needs:* §6.7d; K3Surfaces K1–K2; §3.1; §4.1; §4.2; §6.2; §6.0b.

**Checks.**

- The identity is excluded: an arbitrary rank-one polarized K3 has no pencil forced by its identity automorphism.
- The integral involution interchanging the two basis vectors is nonidentity modulo 2. It disproves the integral inference in dolgachev-keum lines 643–647; the lifting and specialization proof uses no such inference.
- At p=3 a quasi-elliptic pencil is retained, and §6.0c still gives rank 22 at infinite height; p=2 is excluded by tameness of the involution.

### 6.8 The exceptional-locus predicate

For geometric K3 in characteristic p>0 define IsArtinInvariantOne X to mean ρ(X)=22 and disc Pic(X)=-p². By 6.0 this agrees with Artin invariant σ=1, using the bilinear intersection discriminant. (huybrechts, Chapter 17 Proposition 2.19, pp.373–374; huybrechts line 14317; dolgachev-keum §5 line 815).

Read the invariant from the geometric lattice; the determinant is the bilinear form determinant, not that of its half-norm polynomial.

Prove the following interface laws:

- For rank 22, the predicate is equivalent to σ=1.
- An isomorphism of geometric K3 surfaces preserves it.
- An extension between algebraically closed fields preserves it.
- It implies rank 22 and discriminant −p².

*Needs:* §6.0.

**Checks.**

- For p=3 the numerical condition rank 22, disc=−9 satisfies the predicate’s defining equations; replacing -9 by +9 fails. This checks the signed bilinear discriminant and the exponent 2, without asserting realization of arbitrary numerical data.
- At p=3, rank 22 and discriminant -81 give σ=2 and fail.
- A rank 20 lattice does not satisfy the predicate even if its discriminant happens to be -9.
- The Fermat quartic over F̄₃ has rank 22 and discriminant −9, so satisfies the Artin-invariant-one predicate.
- The Fermat quartic over F̄₇ has rank 22 and discriminant −49 and also satisfies the predicate, testing the characteristic read from the field.
- The Fermat quartic over F̄₅ has formal Brauer height one and rank at most 20 by §6.0a, so fails the predicate. These realized surfaces use Huybrechts Chapter 18 §3, Example 3.4, huybrechts lines 15264–15270, and Shioda Proposition 1 and Corollary 2, shioda-unirational-primary lines 52–53, 137–147. For p=3,7 Shioda gives unirationality and rank 22; §6.0 forces a p-power discriminant, so the two discriminants printed with “respectively” in Huybrechts must be interchanged: −p² belongs to p≡3 modulo 4, whereas −64 cannot be a rank-22 p-elementary discriminant for these odd p.

### 6.8a The K3 invariant-dimension calculation

For a geometric K3 X and a finite tame symplectic group G, write Y for the minimal K3 resolution of X/G. In characteristic p>0, if either X or Y is not of Artin invariant one, then dim_(ℚ_ℓ) H*(X,ℚ_ℓ)^G≥5 for every ℓ≠p. In characteristic zero the same bound holds without the exceptional hypothesis. (dolgachev-keum, Lemmas 4.2–4.4 and Proposition 4.5, pp.14–19, dolgachev-keum lines 579–594, 597, 649–682, 683–779; complex case mukai (1.4)).

If ρ(Y)<22, §6.0a rules out finite-height rank 21. If Y had rank 21 at infinite height, §6.0b would give a genus-one pencil and §6.0c would force rank 22. Thus the transcendental cokernel has dimension at least two; quotient comparison, an invariant ample class and H⁰,H⁴ give five invariants. If ρ(Y)=22, §6.0a gives infinite height; the formal-Brauer pullback with nonzero tangent constructed below, and absence of homomorphisms between finite-height formal groups and the formal additive group, transfer infinite height to X. Resolve the dominant rational map X⇢Y to q:V→Y with V→X birational between smooth proper surfaces. Pullback along q and the birational formal-Brauer comparison give Br̂(Y)→Br̂(X). Proper coherent duality identifies the dual tangent map with trace on global two-forms (SchemeAndStackFoundations §2.19 `trace`, §2.20 `cm_serre_duality`, §2.21 `coherent_duality`, `trace_finite`). On the dense finite étale locus, trace after pullback of a two-form is |G| times that form, and equality extends between the canonical line sheaves. Since |G| is invertible, this trace and hence the tangent map are nonzero. No finite-flat formal-Brauer trace is applied to the singular quotient or to a resolution. For even |G| apply §6.7d and §6.0c. For odd |G| outside {7, 21}, the element-order table and quotient root lattices give ρ(X)≥6 as in Lemma 4.4, so §§6.0b–6.0c apply. The separate order-7 and order-21 character averages each give six invariants. For Artin invariant >1 the nonzero de Rham (1, 1) cycle contribution supplies a third H² invariant, or the quotient root-lattice discriminant gives invariant Picard rank >2. Average only in |G| in characteristic p; the crystalline idempotent commutes with reduction and cross-realization transfers its rank to every ℚ_ℓ. In characteristic zero the volume form, its conjugate and an averaged ample class give three H² invariants.

Prove the following interface laws:

- For the tame quotient correspondence X⇢Y between these K3 surfaces, resolution and birational comparison define Br̂(Y)→Br̂(X) with nonzero tangent, independently of the chosen resolution; proper coherent trace gives the preceding degree calculation.
- If ρ(Y)<22, then dim H*(X,ℚ_ℓ)^G≥5 (Lemma 4.2).
- For p≠2 a symplectic involution gives the genus-one pencil of §6.7d, with its quasi-elliptic alternative at p=3.
- If ρ(Y)=22 and |G|∉{7, 21}, then ρ(X)=22, by formal-height transfer and §§6.0a–6.7d; elliptic and quasi-elliptic pencils are both included.
- If X or Y is rank 22 with Artin invariant >1, the crystalline filtration and quotient-discriminant calculation give at least three invariants in H², hence five in total (Proposition 4.5).

*Needs:* §2.4; K3Surfaces K1–K2; §3.1; §4.4; §6.1; §6.2; §6.8; `gap:quotient-transcendental-comparison`; `gap:witt-formal-brauer`; `gap:artin-discriminant`; `gap:cross-realization`; CrystallineCohomology CR.2.3, CR.3.2–CR.3.3, CR.3:duality.1, CR.4.7; §6.0a; §6.0b; §6.0c; §6.7d; SchemeAndStackFoundations §§2.19–2.21.

**Checks.**

- For G=1 the total invariant dimension is 24, including when both surfaces have Artin invariant one.
- For C₇ the character average is (24+6·3)/7=6; for the nonabelian group of order 21 it is (24+14·6+6·3)/21=6, so neither needs the excluded transfer hypothesis.
- When both X and Y have Artin invariant one the lower bound five is not asserted; the four-invariant branch remains in 6.11.
- For the tame involution (x,y)↦(−x,−y), k[x,y] over k[x²,xy,y²] has generic rank 2 but origin fibre dimension 3. Finite-flat formal-Brauer trace is unavailable at this A₁ point; the resolved proper coherent trace still gives nonzero tangent.

### 6.9 Tame characters and invariant dimensions

Define the rational Mathieu function ε(n)=24/(n∏_(q|n,q prime)(1+1/q)) for natural numbers n. Prove that ε(1)=24 and ε(q)=24/(q+1) for every prime q. Its value at 0 is 0 by the field division convention and has no element-order interpretation. All geometric uses require n>0.

For a geometric K3 and finite tame symplectic G, total rational cohomology has dimension 24 and character χ(g)=ε(n)=24/(n∏(1+1/r)), where n=ord(g)>0 and the product runs over primes r dividing n. This equals 24 at identity. In characteristic 0 its G-invariant dimension is at least 5. In characteristic p>0 it is at least 5 if either X or the K3 resolution Y of X/G fails IsArtinInvariantOne. (dolgachev-keum, Propositions 4.1, 4.5 and Theorem 4.7, pp.14–20; dolgachev-keum lines 522, 569, 683, 785; mukai Theorem (1.4)).

The tame trace formula and 6.2 give the character values. The trivial representation contributes H⁰ and H⁴. In the complex projective case a volume form, its conjugate and an averaged ample class add 3. In positive characteristic §6.8a supplies the invariant-dimension lower bound outside the stated exceptional case.

*Needs:* K3Surfaces K1–K2; §3.1; §6.1; §6.2; §6.8; EtaleCohomologyFoundations F.6; §6.8a; CrystallineCohomology CR.2.3, CR.3.2–CR.3.3, CR.3:duality.1, CR.4.7, CR.7.3; `gap:artin-discriminant`; `gap:tame-lefschetz`.

**Checks.**

- n=1 has empty prime product 1, hence character 24.
- 24/(2(1+1/2))=8.
- 24/(7(1+1/7))=3.
- This fixed-point character formula is not asserted for wild elements.

### 6.10 The characteristic-zero sharp bound

For K3 X over a characteristic-zero field and finite symplectic G≤Aut_k(X), G embeds in M₂₃ with at least 5 orbits on its induced 24-point action and in one of Mukai’s eleven maximal groups. In particular |G|≤960. (mukai, Theorems (0.3), (0.6), Example (0.4), pp.184–185; mukai lines 70, 76, 102; huybrechts lines 12268–12283).

Spread the finite action and surface to a finitely generated characteristic-zero field and embed into C. Use the fixed-point and quotient-root configurations of §6.1–§6.2 to prove the Sylow 2-subgroup embedding: Mukai §6 first excludes the forbidden abelian and central-product configurations, then treats the order-128 central-involution action on its eight fixed points. This geometric deduction remains here; apply the finite-group (W)→(E) recognition contract only after establishing that embedding and the Mathieu representation with five invariants. The eleven groups have maximal order 960. Only containment and the bound are endpoints here, not the converse realization of every group.

*Needs:* §5.1; §6.1; §6.9; SchemeAndStackFoundations §0.9; `gap:mathieu-permutation-model`; `gap:mukai-eleven-groups-recognition`; McKaySkewGroup Layer 0.

**Checks.**

- The trivial subgroup has 24 orbits.
- Cycle type 1⁸2⁸ has 16 orbits on 24 letters.
- A 23-cycle with one fixed letter has 2 orbits and cannot satisfy the required five-orbit condition.

### 6.11 Tame groups and the exceptional branch

For geometric K3 X/k in characteristic p>0 and finite tame symplectic G, there is an embedding G→M₂₃ and hence |G|≤10200960. If either X or the minimal resolution of X/G is not of Artin invariant 1, G lies in Mukai’s list and |G|≤960. In the exceptional branch retain M₂₃ containment; the exceptional candidate list is a necessary classification, with no assertion all candidates occur. The embeddings and bounds for k-subgroups over nonclosed fields follow after base change. (dolgachev-keum, Theorem 4.7, Theorem 5.2, Proposition 5.14, pp.19–22, 37; dolgachev-keum lines 785, 862, 1566).

Outside the exceptional invariant-dimension 4 branch establish the Sylow 2-subgroup embedding by the tame local-stabilizer and fixed-point argument, then apply finite-group recognition with at least 5 invariants; the rational quaternion obstruction is replaced by the ℚ₂ obstruction when 2∣|G|. In the remaining branch the K3 calculations give the hypotheses EG1–EG4: Mathieu character over every ℚ_ℓ, invariant dimension 4, exceptional-root rank 20 and prime-to-p nonsquare determinant (dolgachev-keum lines 833–840). Prove the necessary group-list reduction of Theorem 5.2 using those data and the local stabilizers here, then consume only the abstract embeddings of Proposition 5.14. The 24-letter action, including the stabilized letter, is the action in the orbit statements.

*Needs:* §6.1; §6.8; §6.9; `gap:mathieu-permutation-model`; `gap:mukai-eleven-groups-recognition`; `gap:exceptional-mathieu-embeddings`.

**Checks.**

- An exceptional candidate has 4 orbits; no universal five-orbit claim is made.
- In characteristic 2 the tame hypothesis means odd group order.
- A k-automorphism subgroup embeds faithfully into the geometric automorphism group before applying a bound.

### Examples

A tame symplectic involution fixes eight geometric points. The identity fixes the whole surface and is excluded from the table. M₂₃ acts here on 24 letters, including its fixed letter; exceptional tame groups need no five-orbit assertion.

### Dependencies

NeronModelsAndSemistableAbelianVarietiesPartII §§2.1–2.3, 2.5, 3.11, 4.1–4.2, 4.7–4.8 and 4.16–4.17; EllipticCurves Layer 4's `ReductionSymbol`; StableReduction Layers 0 and 4–5; JacobianChallenge Layers A–D; SchemeAndStackFoundations §3.4, §§4.11–4.12 and §§5.8–5.10; §6.0; §6.0c; §2.7; §1.4; §2.3; §3.1; §4.2; §5.1; `gap:surface-quotient-resolutions`; McKaySkewGroup Layer 0 and §§7.1–7.3; NilpotentOrbits N8; `gap:tame-linear-groups`; §6.0b; IntegralLattices Layer 5; `gap:tame-quotient-singularities`; K3Surfaces K1–K2; IntegralLattices Layer 1; `gap:tame-lefschetz`; MorseNovikov N6; §4.4; EtaleCohomologyFoundations F.6; SchemeAndStackFoundations §2.23; `gap:quotient-transcendental-comparison`; §5.3; K3Surfaces K1; `gap:cross-realization`; §4.5; `gap:artin-discriminant`; IntegralLattices Layer 6; §4.4; IntegralLattices Layer 1 (1I); §2.4; `gap:witt-formal-brauer`; CrystallineCohomology CR.2.3, CR.3.2–CR.3.3, CR.3:duality.1, CR.4.7; CrystallineCohomology CR.2.3, CR.3.2–CR.3.3, CR.3:duality.1, CR.4.7, CR.7.3; SchemeAndStackFoundations §0.9; `gap:mathieu-permutation-model`; `gap:mukai-eleven-groups-recognition`; `gap:exceptional-mathieu-embeddings`; §6.0a; §6.0c; §6.7d; GlobalQuadraticForms §5.5; QuadraticFormInvariants Layer 6D; `gap:rational-surface-cohomology`; SchemeAndStackFoundations §2.15 and EtaleCohomologyFoundations F.4.2–F.4.6; SchemeAndStackFoundations §5.4; §4.1; §2.5; §2.6; `gap:tame-equivariant-deformations`; `gap:crystalline-chern-derivative`; SchemeAndStackFoundations §§2.19–2.21, §§4.1–4.6 and §4.10; AdicSpacesPartIII F0.3, F0.8, R2.9 smooth-formal-scheme and R2.10 adic-local-flatness-criterion; Mathlib `AlgebraicGeometry.Scheme.Hom.isOpen_smoothLocus`.

## Layer 7: Polarizations and a finite-type atlas

### 7.1 Geometric primitivity

For K3 X/k and λ∈Pic(X), define geometric primitivity to mean that λ_kbar is not n times a geometric Picard class for any integer n>1. For a relative Picard section test this on every geometric fibre. (rizov, Definition 3.2.3, p.13; rizov line 555; Lemma 3.1.6 line 463).

Use divisibility in the one native additive Picard group; over a field its freeness identifies this with primitive vector/saturated cyclic submodule for nonzero λ.

Prove the following interface laws:

- The condition is exactly absence of proper integral multiples after geometric extension.
- Polarized isomorphisms preserve primitivity.
- Every field extension preserves and reflects geometric primitivity.
- For a nonzero geometric class, primitivity agrees with saturation of its generated rank 1 sublattice.

*Needs:* §2.1; §4.1; §4.2.

**Checks.**

- The zero class is divisible by 2 and fails.
- In ℤ with Gram [2d], the generator is primitive while twice it is not.
- An ample class of square 2d is primitive if d is squarefree: λ=nµ would force n²|d by evenness.

### 7.2 Root loci and primitive openness

For a strongly projective K3 scheme family over a Noetherian base S and n>0, [n]:Pic_X/S→Pic_X/S is a closed immersion. For a relative Picard section λ the locus of geometric primitivity is open. These statements descend to polarized K3 algebraic-space families after étale localization and extend by approximation. (rizov, Lemma 3.1.6(i)–(ii), pp.11–12; rizov lines 463–516, with the square-zero case supplied by Hodge index).

Torsion-freeness gives monomorphy. On finite-Hilbert-polynomial Picard pieces the valuative extension and intersection constraints make [n] proper, hence closed. For an arbitrary Picard section λ choose an auxiliary relative ample H from strong projectivity. Locally the integers d=λ²/2 and m=λ·H are constant, by the fibre Hilbert polynomials and integer RR. If d≠0, λ=nµ with n>1 forces n²∣d, leaving finitely many n. If d=0 and m≠0 it forces n∣m, again leaving finitely many n. If d=m=0, Hodge index makes λ numerically zero on every geometric fibre, and §1.5 makes λ=0 there; no point on that piece is primitive. In the first two cases the nonprimitive locus is a finite union of the closed root loci λ⁻¹([n]Pic); in the last it is the whole piece. These cases prove openness for every section, including square-zero and nonample sections.

*Needs:* §1.5; §2.1; §7.1; SchemeAndStackFoundations §5.10 Hodge index; JacobianChallenge Layer C; SchemeAndStackFoundations §0.9; AlgebraicModuliForArithmeticGeometry §7.6.1–§7.6.1a; ComplexComparisonPartII C3.2d.2–C3.2d.5; JacobianChallenge Layer D.

**Checks.**

- [0] is constant and is not a closed immersion of the entire Picard space.
- [3] is a closed immersion also in characteristic 3.
- Existence of a cube root is imposed as a closed root condition, not an unconditional open condition.
- On an elliptic K3 with section C and fibre F, F²=0 and F·C=1, so F is primitive. For an ample H, F·H>0 bounds any possible root by n∣(F·H), even though n²∣0 gives no bound.
- On the same surface, (2F)²=0 but 2F has the root F. The primitive locus for the constant section 2F is empty, whereas that for F is the whole base.
- For λ=0, d=m=0 and λ=2·0 on every fibre; its primitive locus is empty and open. Hodge index and §1.5 give the same conclusion whenever d=m=0.

### 7.3 Families and Picard polarizations

For d>0 and scheme S, a degree 2d polarized K3 family is a smooth proper finitely presented algebraic space X→S with native geometric K3 scheme fibres and a section λ of Pic_X/S that is étale-locally represented by a relatively ample line bundle and has geometric square 2d. Arrows are Cartesian family isomorphisms preserving λ. The primitive subcategory imposes 7.1 fibrewise. (rizov, Definition 1.1.5 and Remark 1.1.6, pp.3–4, rizov lines 121–135; Definitions 3.2.1–3.2.3 and Lemma 3.2.4, pp.12–13, rizov lines 530–570).

Use the relative Picard sheaf rather than a chosen universal bundle. Choose a line representative étale-locally, import StableReduction Layer 2 polarized scheme descent to obtain the scheme criterion, and restrict to affine base opens for projectivity. This retains families over every base scheme; descent of the Picard section retains the algebraic-space family globally.

Prove the following interface laws:

- A smooth proper finitely presented K3-space family and a Picard section with the stated local ampleness and square give an object.
- Every base morphism gives a family pullback with identity and composition isomorphisms.
- Arrows are determined by the underlying family isomorphism preserving the Picard section.
- After an étale cover refined by affine base opens, the family is a projective scheme with an ample representative of λ.
- For an actual line L on a field-valued native K3, its class gives the same polarized object and stabilizer as 5.2. The cubic Brauer–Severi bundle constructed in §7.7 supplies the complete cubic linear system even without a global representative.

*Needs:* §1.2; §2.1; §7.1; StableReduction Layer 2; SchemeAndStackFoundations §1.11.

**Checks.**

- An ample class on X/k produces the constant family over every k-scheme.
- d=0 is excluded since an ample surface class has positive square.
- A section of the Picard sheaf need not have a global line-bundle representative.
- Changing an isomorphism of representatives by a scalar is not an extra arrow.

### 7.4 Polarized Hilbert polynomial and vanishing

For K3 X/k and ample L with L²=2d, d>0, χ(L^t)=dt²+2 for every integer t, and Hⁱ(X,L^m)=0 for every i>0 and integer m>0. Consequently h⁰(L^m)=dm²+2 for m>0. (rizov, Theorem 1.2.2, p.4; rizov line 142; terakawa Theorem 1.6, pp.191–192, terakawa line 183).

After algebraic closure use the general adjoint vanishing theorem: K_X=0, X has Kodaira dimension 0, and mL is nef big. This is within Terakawa’s characteristic 2 domain. Descend cohomology and use integer RR. In characteristic zero use AlgebraicModuliForArithmeticGeometry §9.10 `algebraicAdjointVanishing` for the integral nef big divisor mL, whose fractional support is empty; in positive characteristic use Terakawa Theorem 1.6, since a K3 is neither general type nor quasi-elliptic of Kodaira dimension one.

*Needs:* §1.4; `gap:adjoint-positivity`; AlgebraicModuliForArithmeticGeometry §9.10 `algebraicAdjointVanishing`; JacobianChallenge Layer C.

**Checks.**

- At m=0, H²(O)=k, so the vanishing must exclude 0.
- For d=2, h⁰(L),h⁰(L²),h⁰(L³) are 4, 10, 20.
- χ(L⁻¹)=d+2, but negative powers are not asserted to have zero higher cohomology.

### 7.5 Uniform embeddings in all characteristics

For K3 X/k and ample L with L²=2d, d>0, L^m is globally generated for m≥2 and very ample for m≥3. The complete system of L³, after choosing a basis, embeds X into P^(9d+1) with Hilbert polynomial 9dt²+2. For a K3 scheme family over a Noetherian base with a relatively ample representative L, f_*L³ is locally free of rank 9d+2, commutes with arbitrary base change and gives the corresponding relative closed immersion. (rizov, Theorem 1.2.2 and Lemma 1.2.5, pp.4–5; rizov lines 142, 169; terakawa Theorem 2.4 line 354).

Apply the general length-(r+1) separation criterion with r=0 for 2L and r=1 for 3L. For 2L, A²≥8; a failure has 0<A·D<2, impossible because A=2L. For 3L, A²≥18; failure gives 0<3L·D<4, hence L·D=1, D²≥1 and D²<3/2; evenness of the K3 lattice contradicts D²=1. Higher powers follow similarly. Relative vanishing and the finite-projective cohomology complex give local freeness and arbitrary base change, including nonreduced bases; fibrewise very ampleness gives the closed immersion.

*Needs:* §7.4; `gap:adjoint-positivity`; SchemeAndStackFoundations §5.10; JacobianChallenge Layer C; StableReduction Layer 2.

**Checks.**

- d=2 gives P¹⁹ and polynomial 18t²+2.
- d=1 gives P¹⁰ and polynomial 9t²+2.
- The same proof treats characteristic 2 and needs no smooth member of |L|.

### 7.6 The K3 locus inside the projective Hilbert family

In the universal flat projective Hilbert family of surfaces with polynomial 9dt²+2, d>0, construct a finite-type locally closed subscheme U_K3 carrying exactly the smooth geometrically integral fibres with H¹(O)=0 and trivial canonical class. The construction and its family commute with base change; every embedded K3 with this polynomial factors through it. Use the scheme-theoretic equality locus of the canonical and zero Picard sections, not merely equality of their ranks. (rizov, Proposition 4.2.1 proof, p.19; rizov lines 831–849).

First restrict to the open smooth geometrically integral surface locus, then the open H¹(O)=0 locus by semicontinuity. The general relative Picard representative carries the canonical class and zero section; take their scheme-theoretic equality locus. Its separatedness makes this a closed subscheme of that open locus. Relative smoothness identifies the canonical determinant, and the relative Picard trivial class is represented locally by a line pulled back from the base. This is the required K3 family and is finite type. Over arbitrary bases use the finite-presentation descent and cohomology/base-change comparison to establish the universal family statement.

Prove the following interface laws:

- Its restricted Hilbert universal family has native geometric K3 fibres.
- An embedded family with the specified polynomial and the displayed relative smoothness, integrality, cohomology and canonical-class conditions factors uniquely through U_K3.
- The locus and restricted family commute with base change, preserving the canonical and zero Picard sections.

*Needs:* §1.1; SchemeAndStackFoundations §4.14; JacobianChallenge Layer C; AlgebraicModuliForArithmeticGeometry §7.6.1–§7.6.1a; ComplexComparisonPartII C3.2d.2–C3.2d.5; JacobianChallenge Layer D; AlgebraicVectorBundles L0C.

**Checks.**

- The cube embedding of a smooth quartic (d=2) lies in the polynomial 18t²+2 locus.
- Equal ranks of ω and O do not imply equal Picard classes: the equality locus must compare the classes themselves.
- A singular flat degeneration with the same Hilbert polynomial does not lie in the smooth K3 locus.

### 7.7 An actual finite-type covering family

For every d>0 construct a finite-type scheme H_d over ℤ parametrizing linearly normal K3 embeddings into P^(9d+1) of polynomial 9dt²+2 whose hyperplane Picard class is 3λ for an ample section λ of square 2d. It has an open primitive locus H_d^prim and a PGL_(9d+2)-action. Every geometric polarized object is a fibre; every polarized family lies étale-locally in its image after choosing its complete projective frame. (rizov, Proposition 4.2.1 and Theorem 4.3.3 Steps 1–3, pp.19–24; rizov lines 807, 1004–1052).

Start with the actual K3 locus 7.6 and impose linear normality. Use the pullback of [3] along [O(1)] to impose the unique Picard cube-root section, then ampleness and square 2d. The root locus is closed within the appropriate K3 Hilbert locus even at 3; primitivity is open. Construct the cubic Brauer–Severi bundle: the étale-local projective bundles ℙ(f_*L³) descend to a Brauer–Severi projective bundle P_λ of relative dimension 9d+1. Replacing a representative L by L⊗f*N changes f_*L³ by tensoring with N³; its projectivization is canonically unchanged. Local isomorphisms differ by base units, which act trivially on projective space, so the comparisons satisfy the overlap and triple-overlap cocycle laws. Prove independence of representatives and arbitrary-base-change compatibility; §7.5 and finite-presentation descent give these statements over every base scheme. Projective frames of P_λ give the covering family and its smooth frame-torsor property (rizov lines 1023–1067).

Prove the following interface laws:

- H_d carries the Hilbert universal K3 family and its polarization section.
- Every geometric object is isomorphic to a fibre, and families admit the stated local presentations.
- The stack pullback over a prescribed family, retaining an isomorphism to that family, is Isom_S(P_λ,ℙ_S^(9d+1)), a PGL_(9d+2)-torsor; when λ has a global representative L it recovers the projective frames of f_*L³.
- The family, primitive locus and group action commute with base change.

*Needs:* §7.2; §7.3; §7.5; SchemeAndStackFoundations §4.14; SchemeAndStackFoundations §0.9; §7.6.

**Checks.**

- The characteristic 3 root locus is justified by 7.2, not division by 3.
- On the Fermat quartic over ℂ, swapping x₀ and x₁ permutes the independent cubic sections x₀³ and x₁³ and gives distinct projective frames with the same cubic Hilbert point. Its PGL stabilizer is Aut(X,[O_X(1)]), equal to Aut(X,[O_X(3)]) by Picard torsion-freeness. A frame change outside this stabilizer changes the Hilbert point. The frame torsor over a prescribed polarized family also retains its source identification, so these remain distinct torsor points.
- The universal datum is a Picard section; no global cube-root line bundle is asserted.
- A smooth anticanonical surface in a nonsplit real Brauer–Severi threefold is geometrically a quartic K3. Its hyperplane Picard section has the nonzero quaternion obstruction α∈Br(ℝ); its cube has 3α=α, so neither L nor L³ is a global representative. The descended P_λ and its projective frame torsor still exist.
- Replacing L by L⊗f*N changes the local section bundle by N³ and induces the identity comparison on its projectivization; three such replacements compose as tensor products, with scalar ambiguity disappearing. A construction descending a vector bundle would fail this test.

### Examples

For degree 2d the polynomial is dt²+2. Cubing gives h⁰=9d+2 and projective dimension 9d+1. Multiplication by 3 on the Picard space is a closed immersion even in characteristic 3.

### Dependencies

§2.1; §4.1; §4.2; §1.5; JacobianChallenge Layer C; SchemeAndStackFoundations §0.9; AlgebraicModuliForArithmeticGeometry §7.6.1–§7.6.1a; ComplexComparisonPartII C3.2d.2–C3.2d.5; JacobianChallenge Layer D; §1.2; StableReduction Layer 2; SchemeAndStackFoundations §1.11; §1.4; `gap:adjoint-positivity`; AlgebraicModuliForArithmeticGeometry §9.10; SchemeAndStackFoundations §5.10; §1.1; SchemeAndStackFoundations §4.14; AlgebraicVectorBundles L0C.

## Layer 8: Separated moduli and arithmetic finiteness

### 8.1 The polarized stacks

For every d>0 the étale stacks M_2d and F_2d of 7.3 and its primitive subcategory are Deligne–Mumford stacks of finite type over Spec ℤ, with F_2d→M_2d an open immersion. There are quotient presentations [H_d/PGL_(9d+2)]≃M_2d and [H_d^prim/PGL_(9d+2)]≃F_2d. (rizov, Definitions 4.3.1–4.3.2 and Theorem 4.3.3, pp.20–25; rizov lines 879, 898, 917, 964, 1004).

Effective descent for spaces and Picard sections produces the stack. The frame torsor gives a smooth finite-type atlas and quotient. The graph Hilbert Isom functor is finite type and its tangent is zero, so the diagonal is unramified and the stack is DM. Primitive openness descends from H_d.

Prove the following interface laws:

- The groupoid over S is the one in 7.3, with exactly those objects and arrows.
- The frame-torsor quotient is equivalent to the polarized moduli stack.
- Its fibrewise pullback agrees with 7.3 and respects compositions.
- The primitive substack is the open substack determined by 7.1.

*Needs:* §2.3; §5.3; §7.7; SchemeAndStackFoundations §1.18; SchemeAndStackFoundations §1.19; SchemeAndStackFoundations §1.20; SchemeAndStackFoundations §1.21; SchemeAndStackFoundations §4.14.

**Checks.**

- The stabilizer of (X,λ) is exactly its polarized surface automorphism group.
- A polarized involution yields a nontrivial arrow and prevents treating the stack as a fine scheme.
- The finite-type atlas is over ℤ, including primes dividing 2d.

### 8.2 Trait extension, separation and finite inertia

For d>0, any generic-fibre polarized isomorphism between two smooth proper polarized K3 families over a DVR extends uniquely over that DVR. The diagonals of M_2d and F_2d are finite unramified, so the stacks are separated and have finite inertia. (rizov, Theorem 4.3.3 Step 5, p.25; rizov lines 1075–1085).

Étale locally use actual ample representatives and StableReduction Layer 2 polarized descent for the scheme criterion. The DVR base is quasi-compact and quasi-separated, so properness and relative ampleness give projectivity. A K3 has a nonzero regular two-form; a ruled smooth surface has none, so the special fibre is not geometrically ruled. Apply the general trait-extension theorem and descend uniqueness. The proper quasi-finite Isom diagonal is finite; its tangent is zero.

*Needs:* §8.1; `gap:matsusaka-mumford`; SchemeAndStackFoundations §1.20; StableReduction Layer 2; `gap:ruled-surface-two-forms`.

**Checks.**

- The generic identity extends to the identity; an extension defined only up to scalar would violate the surface-isomorphism uniqueness statement.
- The extension theorem extends isomorphisms between given smooth families; it does not extend every punctured-trait family.

### 8.3 Separated coarse algebraic spaces

For every d>0, M_2d and F_2d have separated coarse moduli algebraic spaces of finite type over Spec ℤ. The coarse map is universal for maps to algebraic spaces and bijects geometric isomorphism classes with geometric points over algebraically closed fields. (rizov, Corollary 4.3.10, p.25; rizov lines 1097–1101).

Apply the general finite-inertia coarse-space existence theorem to the actual separated finite-type stacks. Preserve its precise universal property and geometric-point assertion.

*Needs:* §8.2; SchemeAndStackFoundations §1.23.

**Checks.**

- The coarse space does not encode an object’s nontrivial polarized automorphisms.
- The geometric-point bijection does not identify k-forms with coarse k-points for arbitrary k.

### 8.4 The smooth open arithmetic base

For each d>0, M_2d and F_2d over Spec ℤ[1/(2d)] are smooth of relative dimension 19. (rizov, Lemma 4.1.3, p.18; rizov lines 779–784; huybrechts Chapter 5 Remark 4.11, p.96, line 3577).

The polarized deformation loci are formally smooth of dimension 19 at the stated geometric points. Combine their marked versal property with the atlas and the infinitesimal criterion for stack smoothness. This is a stack statement, not smoothness of its coarse space.

*Needs:* §2.6; §8.1; SchemeAndStackFoundations §4.6.

**Checks.**

- For d=1 the base is ℤ[1/2].
- No smoothness claim is asserted at p|2d, despite finite-type existence there.

### 8.5 Finiteness including forms over a finite field

For every finite field k and integer d>0, there are finitely many k-isomorphism classes of degree 2d polarized K3 families over Spec k; the primitive subset is finite too. Forms and twists are counted separately unless k-isomorphic. (huybrechts, Chapter 17 §3 preceding Proposition 3.8, p.379; huybrechts lines 14545–14548).

The field-cohomology composite of SchemeAndStackFoundations §§2.10, 2.15, TauCeti.brauerCohomologyEquiv and TauCeti.subsingleton_brauerGroup_of_finite gives H²_fppf(Spec k,G_m)=0. Thus the Picard section has an actual ample line representative. Its ample line makes the proper algebraic space a scheme. A k-basis of H⁰(L³) yields a k-point of H_d for every k-isomorphism class, including every twist. The finite-type scheme has finitely many k-points. No assertion of unpolarized finiteness or Tate conjecture is used.

*Needs:* §7.5; §7.7; §8.1; SchemeAndStackFoundations §§2.10, 2.15 and `TauCeti.brauerCohomologyEquiv` with `TauCeti.subsingleton_brauerGroup_of_finite`; AlgebraicModuliForArithmeticGeometry §7.6.1–§7.6.1a; ComplexComparisonPartII C3.2d.2–C3.2d.5; JacobianChallenge Layer D; StableReduction Layer 2.

**Checks.**

- Both k and d are fixed; the union over all d is not bounded by this argument.
- Geometrically isomorphic polarized forms are still separate until a k-isomorphism is supplied.
- Every k-object has a k-frame after its line representative is obtained; a coarse rational point alone is not the proof.

### Examples

The moduli object retains finite stabilizers. Finite-type atlases include every prime. Finite-field finiteness counts distinct forms, rather than replacing them by coarse rational points.

### Dependencies

§2.3; §5.3; §7.7; SchemeAndStackFoundations §1.18; SchemeAndStackFoundations §1.19; SchemeAndStackFoundations §1.20; SchemeAndStackFoundations §1.21; SchemeAndStackFoundations §4.14; `gap:matsusaka-mumford`; StableReduction Layer 2; `gap:ruled-surface-two-forms`; SchemeAndStackFoundations §1.23; §2.6; SchemeAndStackFoundations §4.6; §7.5; SchemeAndStackFoundations §§2.10, 2.15 and `TauCeti.brauerCohomologyEquiv` with `TauCeti.subsingleton_brauerGroup_of_finite`; AlgebraicModuliForArithmeticGeometry §7.6.1–§7.6.1a; ComplexComparisonPartII C3.2d.2–C3.2d.5; JacobianChallenge Layer D.

## Downstream consumers

- **PeriodsAndSpecialValues** consumes the native predicate and comparisons (Layers 1–3), geometric/arithmetic Picard lattices and bounds (Layer 4), finite-action bounds (Layers 5–6), and polarized moduli (Layers 7–8).
- K3/Bloch-group applications use the same native K3 predicate and invariants; no Bloch or special-value endpoint belongs here.

No consumer supplies a premise to this roadmap.

## References

Numbering follows the editions specified below. A locator such as “huybrechts line 133” refers to the numbered text extraction of the source identified by the SHA-256 digest in the source identity table. Printed pages and theorem numbers give independent locators. The table distinguishes accessible source texts from published-locator citations; the latter are supported here by the stated application locators or explicit derivations.

- **huybrechts**: Daniel Huybrechts, [Lectures on K3 surfaces (author draft)](https://www.math.uni-bonn.de/people/huybrech/K3Global.pdf) (2015). 2015 author prepublication draft; numbering cited as read, distinct from the 2016 Cambridge edition Chapter 1: Definition 1.1, Remark 1.2, Example 1.3(i), section 2.3/equation (2.5), Proposition 2.4, Remark 2.5, section 2.4, section 3.1/Proposition 3.2 (pp. 7-14; lines 133, 147, 160, 305, 316, 335, 367, 405); Chapter 5: section 1, section 2.1, Proposition 3.3, Remark 3.4, Remark 4.11 (pp. 81, 84-86, 91-92, 96; lines 2975, 3102, 3372, 3400, 3577); Chapter 15: Definition 1.1, section 2.5(i), Theorem 3.1 (pp. 307, 318-320; lines 11765, 12221, 12268); Chapter 17: section 2, Lemma 2.2, Remark 2.4, Lemma 2.6, section 3 preceding Proposition 3.8 (pp. 364-367, 379; lines 13945, 13964, 13971, 13994, 14001, 14038, 14545); Chapter 1 §§3.2–3.3, pp.15–17 (lines 452–511); Chapter 17 Proposition 2.19, pp.373–374 (line 14317). Chapter 2 §3.3 and Remark 3.13, pp.32–34 (huybrechts lines 1110–1132 and 1173–1183); Chapter 11 Proposition 1.3(ii), p.208 (huybrechts lines 7879–7888, char k≠2,3). Chapter 15 §1.2, pp.310–311 (huybrechts lines 11901–11908); Chapter 17 §2.5, Proposition 2.10, p.369 (huybrechts lines 14121–14138); Chapter 18 §3, Example 3.4, p.398 (huybrechts lines 15264–15270).
- **rizov**: Jordan Rizov, [Moduli Stacks of Polarized K3 Surfaces in Mixed Characteristic](https://arxiv.org/abs/math/0506120v2) (2005). arXiv v2 Theorem 1.2.2 (p. 4, line 142); Proposition 2.2.1 and Remark 2.2.2 (p. 6, line 218); section 2.4 (p. 7, line 273); Definition 3.2.3 (p. 13, line 555); Proposition 3.3.3 (pp. 14-15, line 615); section 3.4 and Lemma 3.4.1 (p. 15, lines 656, 659); Theorem 4.3.3 (p. 20, line 898); Corollary 4.3.10 (p. 25, line 1099); §§3.1–3.2, Theorem 3.1.1, Lemmas 3.1.2 and 3.1.6, Proposition 3.1.3 (lines 404, 416, 440, 463); Proposition 4.1.1, Theorem 4.1.2, Lemma 4.1.3 (lines 756, 770, 779); Proposition 4.2.1 and Theorem 4.3.3 proof (lines 807, 917–1093).
- **dolgachev-keum**: Igor Dolgachev, JongHae Keum, [Finite groups of symplectic automorphisms of K3 surfaces in positive characteristic](https://arxiv.org/abs/math/0403478v5) (2004). arXiv v5 Theorem 2.1 (p. 4, line 138); Theorem 3.3 (p. 13, line 507); Theorem 4.7 (pp. 19-20, line 785); Theorem 5.2 (pp. 21-22, line 862); Proposition 5.14 (p. 37, line 1566); all numbering in arXiv v5; Lemmas 3.1–3.2 and Propositions 4.1, 4.5 (lines 399, 444, 569, 683); §2 fixed-locus refinements and §5 exceptional recognition.
- **keum**: JongHae Keum, [Orders of automorphisms of K3 surfaces](https://arxiv.org/abs/1203.5616v9) (2012). arXiv v9 Theorem 1.4 (v9 p. 3, line 120); introduction on infinite-order symplectic automorphisms (v9 p. 4, line 146); Propositions 2.1, 2.2, 2.4 and §6, pp. 7–9, 19–20 (lines 271, 316, 336, 767–815).
- **lang-nygaard**: William E. Lang, Niels O. Nygaard, [A short proof of the Rudakov–Šafarevič theorem](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0251/LOG_0035.pdf) (1980).  Theorem 1.1, Corollary 1.2 and Theorem 1.3, pp.171–173; lang-nygaard lines 54, 63, 76, 99.
- **mukai**: Shigeru Mukai, [Finite groups of automorphisms of K3 surfaces and the Mathieu group](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0094/LOG_0017.pdf) (1988). 1988 GDZ original; its main theorem is numbered (0.3), rather than Theorem 0.1 Theorems (0.3), (0.6), (1.4), Example (0.4), §§1, 3–8; mukai lines 53, 70, 76, 102, 191.
- **rudakov-shafarevich**: A. Rudakov, I. Shafarevich, *Surfaces of type K3 over fields of finite characteristic* (1981).  §8, Proposition 3.
- **matsusaka-mumford**: Teruhisa Matsusaka; David Mumford, [Two fundamental theorems on deformations of polarized varieties](https://doi.org/10.2307/2373030) (1964).  Theorem 2, as cited in rizov line 1084.
- **nikulin-symplectic**: V. V. Nikulin, *Finite automorphism groups of Kähler K3 surfaces* (1979). Russian original, Trudy Moskovskogo Matematicheskogo Obshchestva 38 (1979), pp. 75–137; no numbering match to the 1980 translation is presumed Russian original §5, pp.108–110; nikulin-symplectic lines 1537–1624.
- **nygaard-vectorfields**: Niels O. Nygaard, *A p-adic proof of the non-existence of vector fields on K3 surfaces* (1979).  Lemma 3.3.
- **oda**: Tadao Oda, [The first de Rham cohomology group and Dieudonné modules](https://www.numdam.org/item/ASENS_1969_4_2_1_63_0.pdf) (1969). 1969 Numdam original; the rational-point hypothesis is retained by passage to an algebraically closed field Corollary 5.12, p.131; oda line 2490.
- **nygaard-closedness**: Niels O. Nygaard, [Closedness of regular 1-forms on algebraic surfaces](https://doi.org/10.24033/asens.1360) (1979).  Corollary 2.7, p.41; nygaard-closedness line 286.
- **wild-cyclic**: I. Dolgachev, J. Keum, [Wild p-cyclic actions on K3 surfaces](https://arxiv.org/abs/math/9812094v1) (1998). arXiv v1 Theorems 1-4.
- **deligne-lift**: Pierre Deligne; written by Luc Illusie, [Relèvement des surfaces K3 en caractéristique nulle](https://publications.ias.edu/sites/default/files/Number36.pdf) (1981). Institutional scan of the LNM 868 contribution, printed pages 58–79 Proposition 1.1, Corollary 1.2, Proposition 1.5, Theorem 1.6, Corollaries 1.7–1.8, §2 and Appendix §3, pp.58–79; deligne-lift lines 29, 58, 78, 131, 140, 157, 188; §2.3–§2.4 and §2.11 (deligne-lift lines 257–326, 510–526).
- **terakawa**: Hiroyuki Terakawa, [The d-very ampleness on a projective surface in positive characteristic](https://msp.org/pjm/1999/187-1/pjm-v187-n1-p09-p.pdf) (1999).  Theorems 1.4–1.6, Lemma 2.2, Theorem 2.4, Corollary 2.5, pp.190–198; terakawa lines 148, 176, 183, 354, 390.
- **artin-supersingular**: Michael Artin, [Supersingular K3 surfaces](https://www.numdam.org/item/ASENS_1974_4_7_4_543_0.pdf) (1974). Theorem (0.1), pp.543–544, artin-supersingular lines 40–55; Theorem (1.7)(i), p.547, artin-supersingular lines 192–210. Supersingularity in this source means infinite formal Brauer height.
- **rudakov-shafarevich-inseparable**: A. N. Rudakov and I. R. Shafarevich, [Inseparable morphisms of algebraic surfaces](https://www.mathnet.ru/php/archive.phtml?jrnid=im&option_lang=eng&paperid=2260&wshow=paper) (1976). English translation, §2, Theorem 5 and Corollaries 1–2, pp.1216–1217, rudakov-shafarevich-inseparable lines 438–497; distinct from the 1981 work cited for Picard faithfulness.
- **shioda-unirational-primary**: Tetsuji Shioda, [An example of unirational surfaces in characteristic p](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0211/LOG_0049.pdf) (1974). §2, Lemma p.234 and Corollary 2 p.235, shioda-unirational-primary lines 98–140; Proposition 1, p.233 (shioda-unirational-primary lines 52–53), Proposition 2, p.235 (shioda-unirational-primary lines 144–147). The surface cohomology argument includes inseparable dominant maps.

- Grothendieck, with contributions by Raynaud, SGA 2, 2005 arXiv v1 re-edition, Exposé XII Corollary 3.5, p.120 (`sga2`).
- The Stacks Project, Resolution of Surfaces, tags 0BGP, 0C2N, 0C5P, 0C5R–0C5S, pp.41–42, 50–53 (`stacks-surface-resolution`).
- Artin–Mazur, Formal groups arising from algebraic varieties, 1977, I §1 and II §§1–4, pp.95–96, 102–110 (`artin-mazur-formal`).
- Liedtke, A McKay Correspondence in Positive Characteristic, arXiv:2207.06286v2 (2024), §§4.2–4.6, Theorems 4.5, 4.10 and 4.12, Definitions 4.7 and 4.11, pp.15–20 (`liedtke-mckay`).
- Shioda, An explicit algorithm for computing the Picard number of certain algebraic surfaces, 1986, Proposition 5, pp.415–432, DOI 10.2307/2374678 (`shioda-transcendental`, uncertified locator-only citation). Only its mathematical cohomology comparison is consumed.

- The Stacks Project, Divisors on Algebraic Spaces, §14, tags 0D32–0D36, pp.27–29 (`stacks-relative-ample`); Morphisms of Schemes, §44, Definition 44.1 (01W8), Lemmas 44.6 (0B5N) and 44.13 (0BCL), pp.101–105 (`stacks-projective-morphisms`). Stable tags determine the locators despite chapter renumbering.
- Cossec, Dolgachev and Liedtke, Enriques Surfaces I, author draft dated 19 April 2024, Theorem 4.1.6, pp.364–366; Proposition 4.3.2, p.382, lines 18349–18360; Proposition 4.3.7 and Corollary 4.3.8, p.385; Proposition 4.3.14, p.389; Theorem 4.3.20, p.392 (`enriques-one`).
- Christian Liedtke, Algebraic Surfaces in Positive Characteristic, 55-page author notes, Corollary 4.2, Definition 4.3 and Theorem 8.3, pp.20–21, 34 (`liedtke-surfaces`).
- Donu Arapura, Algebraic Geometry over the Complex Numbers, 2012, §7.5, Lemma 7.5.1 and Definition 7.5.2, p.150 (`arapura-chern`, uncertified locator-only citation). The normalized Čech/Thom derivation is given in the supplier contract.

### Source identities

The digest identifies the source document, rather than its numbered text extraction. “Published locator” means no source document is identified by a digest here.

| Source id | Source document | SHA-256 |
| --- | --- | --- |
| huybrechts | [Lectures on K3 surfaces (author draft)](https://www.math.uni-bonn.de/people/huybrech/K3Global.pdf) | `59da72d5807fd05d08ce28ceaf30a030cfc7e52b92e27778d824ac86cb1dd287` |
| rizov | [Moduli Stacks of Polarized K3 Surfaces in Mixed Characteristic](https://arxiv.org/abs/math/0506120v2) | `c3f4a828f17baf37575d47aea7ecf5dd3a5208bf62ee50c958565d9f66ad82ac` |
| dolgachev-keum | [Finite groups of symplectic automorphisms of K3 surfaces in positive characteristic](https://arxiv.org/abs/math/0403478v5) | `063270b1660f66fefcbd3e6a2b6c4e7750abbe640ef934cd6b5f98dc49b9450d` |
| keum | [Orders of automorphisms of K3 surfaces](https://arxiv.org/abs/1203.5616v9) | `5551ed209c61c5765e596b862ab22606abaf4d132ddcaca99e95bb840c60c68b` |
| lang-nygaard | [A short proof of the Rudakov–Šafarevič theorem](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0251/LOG_0035.pdf) | `44786bda1baf192e45b8a7ed283690767cff15e2f22b6c064cf19ef1cc4eeb7b` |
| mukai | [Finite groups of automorphisms of K3 surfaces and the Mathieu group](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0094/LOG_0017.pdf) | `1155fa5c111210480dcd69ca23332446537eda73a3f26358fa4957be1cbb8cb0` |
| rudakov-shafarevich | Surfaces of type K3 over fields of finite characteristic | Published locator |
| matsusaka-mumford | Two fundamental theorems on deformations of polarized varieties | Published locator |
| nikulin-symplectic | Finite automorphism groups of Kähler K3 surfaces | `e4bcedec3da7eb847d1fb363527b9c2161fb1efe7d12352c5a62b2a3c98762c6` |
| nygaard-vectorfields | A p-adic proof of the non-existence of vector fields on K3 surfaces | Published locator |
| oda | [The first de Rham cohomology group and Dieudonné modules](https://www.numdam.org/item/ASENS_1969_4_2_1_63_0.pdf) | `a17490b6e1e1270199ac4b5c3a4937567a017ed1d9ae039bad0685a15a285684` |
| nygaard-closedness | [Closedness of regular 1-forms on algebraic surfaces](https://doi.org/10.24033/asens.1360) | `e54c84a51c69a947a4c5f5bc2de10c50474827f1ca2ff53a747d989a76c8e038` |
| wild-cyclic | [Wild p-cyclic actions on K3 surfaces](https://arxiv.org/abs/math/9812094v1) | `f57c7ec16c50f9e4415ef429d68232abec437d94875a6d673e40d50e3cbb2db5` |
| deligne-lift | [Relèvement des surfaces K3 en caractéristique nulle](https://publications.ias.edu/sites/default/files/Number36.pdf) | `caea4d901d59143b5a005adbff0b6bb3b7a854ec9cc57c25adcde15ebbf26d79` |
| terakawa | [The d-very ampleness on a projective surface in positive characteristic](https://msp.org/pjm/1999/187-1/pjm-v187-n1-p09-p.pdf) | `4c660b54e7f2757640055e495f56adafc525395cf97ce9669beea8ba9f8a605e` |
| artin-supersingular | [Supersingular K3 surfaces](https://www.numdam.org/item/ASENS_1974_4_7_4_543_0.pdf) | `f75d3f289a33ef139f6ca2eb2f7271375114465d5bc1423643038c7475d67eba` |
| rudakov-shafarevich-inseparable | [Inseparable morphisms of algebraic surfaces](https://m.mathnet.ru/php/getFT.phtml?jrnid=im&paperid=2260&what=fullteng) | `0c16411ef53a678a9ef21a599b0b99903f53a0e4772ccdddad57423d3829a6fa` |
| shioda-unirational-primary | [An example of unirational surfaces in characteristic p](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0211/LOG_0049.pdf) | `dce94c4a92982b892104373613c29b3b55d81cf4a98bcc43d35a99cd23c7d6b0` |
| artin-mazur-formal | [Formal groups arising from algebraic varieties](https://www.numdam.org/item/ASENS_1977_4_10_1_87_0.pdf) | `8c71c34290534220de9adb0f53550407e3299b08c356439db9e70c6f735e7fe8` |
| sga2 | [Cohomologie locale des faisceaux cohérents et théorèmes de Lefschetz locaux et globaux (SGA 2)](https://arxiv.org/abs/math/0511279v1) | `41ad02c57321a8d2200ff32a929bc93adbc3de0d59dcd5a284d28d859fb87a90` |
| stacks-surface-resolution | [Resolution of Surfaces](https://stacks.math.columbia.edu/download/resolve.pdf) | `6c6efffce73e982fa6c090792042a1842e7f53816a18c24ea172749571fa3db7` |
| liedtke-mckay | [A McKay Correspondence in Positive Characteristic](https://arxiv.org/abs/2207.06286v2) | `72a331ee10d39160f37821e3ca5688d716e85e78910dbaa7979dbeb1b64bd148` |
| shioda-transcendental | [An explicit algorithm for computing the Picard number of certain algebraic surfaces](https://doi.org/10.2307/2374678) | Published locator |
| stacks-relative-ample | [Divisors on Algebraic Spaces](https://stacks.math.columbia.edu/download/spaces-divisors.pdf) | `51d90e8a3058611785f756c163d700e762363e8ef69cbfc93b5aef7f9e1d0475` |
| liedtke-surfaces | [Algebraic Surfaces in Positive Characteristic](https://cims.nyu.edu/~tschinke/books/simons12/lectures.pdf) | `1f59795f87151b34d8d5c6a31a858592dad57d55ed0bf127cc5b1bf78e18e861` |
| stacks-projective-morphisms | [Morphisms of Schemes](https://stacks.math.columbia.edu/download/morphisms.pdf) | `0bebe1d93baa7e4e99cb4f36fe50c7bcb6094772b8a2f760885a492892eca75f` |
| enriques-one | [Enriques Surfaces I](https://sites.lsa.umich.edu/idolga/wp-content/uploads/sites/1334/2024/08/EnriquesOne.pdf) | `3c6bf1d54954e28728935bbe1f4b1e38435fe469cf2b8543d657087815a2f526` |
| arapura-chern | [Algebraic Geometry over the Complex Numbers](https://doi.org/10.1007/978-1-4614-1809-2) | Published locator |
