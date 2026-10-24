# Roadmap: Heegner-point Euler systems and arithmetic descent

**Summary.** Heegner points relate the geometry of complex multiplication to the arithmetic of an elliptic curve. A point of conductor one alone does not provide a descent argument: one needs its full conductor family, exact trace and reduction identities, derivative classes with the right coefficients, and compatible local Selmer conditions. This roadmap constructs that arithmetic family and uses it to control Mordell–Weil rank and Tate–Shafarevich groups. Its second branch carries the same geometry into an anticyclotomic tower, where nonvanishing, characteristic ideals and determinant lattices give increasingly precise descent statements.

The finite branch starts with transported quadratic orders and ring-class fields, constructs integral CM divisor classes, and differentiates their Kummer images. It includes the clean elliptic rank-one theorem, residual indivisibility for modular forms of GL₂ type, and error-tolerant descent at exceptional primes, including the dyadic and CM cases. The anticyclotomic branch builds coherent norm families and Λ-adic classes before proving nonvanishing or using any main conjecture. It treats both the split-prime equality results and the refined equivalence at unramified primes, with the inert case retaining its conjectural hypothesis.

## Scope and ownership

The general theories have other owners. GlobalNumberFields supplies orders and Picard groups; ClassFieldTheory supplies the fields and reciprocity maps. ComplexMultiplicationAndExplicitReciprocity and the modular and quaternionic curve roadmaps supply moduli, canonical models and level structures. EllipticCurves supplies Tate modules, Kummer sequences and Mordell–Weil theory. SelmerIwasawaCohomology and ArithmeticGaloisDuality supply continuous cohomology, local conditions and duality. EulerSystemsAndKolyvaginSystems supplies derivative operators, abstract descent and rigidity. The task here is to construct the actual Heegner objects and verify those theories' arithmetic hypotheses. Outside the statistics scope specified below, heights and explicit reciprocity come from GrossZagierAndArithmeticHeights; the Gross–Zagier formula is not needed to construct the Euler system or to prove descent from an already non-torsion point.

ImaginaryQuadraticClassNumber H1.4 owns the conductor residue-unit exact sequence, class-number formula and exceptional units; §0.4 applies them to successive conductors. EffectiveClassNumbers §2.8, Classical Heegner construction, owns the classical cusp-normalized conductor-one trace and its Artin and conjugation laws; §§1.5–1.6 extend that normalization to the conductor family. HeightsRationalPointsAndObstructions §1.7 supplies abelian Mordell–Weil finite generation to the RM branch.

Generic automorphic transfer, level raising, congruence modules, heights and p-adic regulators retain the owners and sections named in the supplier contracts. The additional contracts state required mathematical inputs; they are not assertions that a supplier contains a target beyond its specified scope. The definite period comparison is proved independently in Layer 6, before Zhang’s indivisibility theorem. The Eisenstein equality in Layer 8b uses independent elliptic-unit/Katz inputs and precedes its finite-system application; it does not consume a cyclotomic return theorem proved from that application. The additional general inputs are the explicit supplier obligations below, with their mathematical scope and source locators.

Outside the supplied statistics CM realizations, the cyclic-isogeny CM pair at every quadratic discriminant and the optimal-embedding/canonical-model comparison are supplied by GrossZagierAndArithmeticHeights §§0a.2–0a.4. Layer 1 here applies those points and the normalized Hodge class of its §3.2 to one fixed integral conductor family; it does not construct a second CM moduli or canonical-descent theory. Its denominator-clearing target differs from the rational Hodge-class construction by retaining the fixed integral d and its quotient image.

EulerSystemsAndKolyvaginSystems §1.6 owns the residual Kummer-field evaluation pairing; §1.16 owns the residual local pairing, simultaneous detection of two classes and classes with prescribed ramification. Sections 5.7, 6.15 and 6.18 consume them for the actual Heegner classes. Section 4.1 identifies the coefficient ideal of this family with that roadmap’s §1.4 inert-prime ideal; §8.15 specializes its §5.12 divisibility profile. These arithmetic identifications retain the actual eigenvalues and point family.

ArithmeticStatisticsPartVI, “Heegner logarithm and low rank”, owns its marked classical/quaternionic CM divisor and elliptic image, logarithm and height formulas, and the low-analytic-rank implication in its stated scope. “Anticyclotomic character nonvanishing” owns its classical elliptic conductor-tower CM divisors and images as well as higher-point nonvanishing for every odd p with trivial tame character; “Anticyclotomic character Selmer multiplicity one” owns its character-level descent. In these scopes §§1.5–1.6 reuse those supplied divisors and images, proving the conductor relations and normalization comparisons needed for the arithmetic system, rather than reconstructing them. The conditional non-torsion, all-prime classical descent of §7.11 and general-F RM descent of §7.12 have different hypotheses from the statistics applications; neither asserts its character-multiplicity theorem. Section 8.21 here treats general totally real F and prescribed torsion character χ₀, while §8.24 uses the supplied classical theorem to prove non-torsion of this roadmap’s actual normalized Λ-adic class.

## Conventions

All global fields are number fields of characteristic zero, and all local fields are their finite-place completions. For a finite coefficient extension L_𝔭/ℚ_p, O_𝔭 is its integer ring with valuation normalized by v_𝔭(ϖ)=1; the coefficient DVR R in finite-system descent is likewise finite over ℤ_p. Separately, ℤ_p^ur denotes the completed integer ring of the maximal unramified extension, with residue field the algebraic closure of 𝔽_p, and Λ^ur is its completed scalar extension of Λ. Length over ℤ_p^ur is not cardinality of its residue field. All coefficient rings are nonzero; p always denotes a prime. Conductor integers are positive, and auxiliary conductors are squarefree. Lengths are module lengths over the displayed coefficient ring; cardinality formulas require the asserted finiteness. Fix fields inside separable closures and retain the actual inclusion and restriction maps. For the classical modular branch, E/ℚ has conductor N, K is imaginary quadratic of signed discriminant D_K<0 and every prime of N splits in K. The clean classical descent theorems impose D_K≠−3,−4 as stated at their uses; the order, tower and CM constructions retain the actual unit stabilizers also at those two discriminants. For c prime to N, write O_c=ℤ+cO_K and K[c] for its ring-class field. P_c lies in E(K[c]); the point used over K is the trace `y_K=Tr_{K[1]/K}P_1`, with the classical normalization supplied as specified in Scope and ownership. An index in E(K)/E(K)_tors is a free-lattice index. It differs from the full-group index by the torsion factor, which is retained whenever cardinalities are compared.

The modular quotient φ, integral cusp or Hodge basepoint, denominator-clearing integer d and differential normalization remain fixed throughout a conductor family. For an elliptic parametrization X→E retain its finite degree; for a general quotient J→A retain the quotient and polarizations, using degrees only for finite isogenies. For a quaternionic curve, the rational Hodge class must first be multiplied by a suitable d. Replacing φ by an isogeny or a p-divisible multiple changes integral divisibility. No such change is treated as multiplication by a unit without a proof. The uncorrected integral equalities use precisely the source-normalized family and lattice of §8.6a; other scalar multiples carry the correction there. Finite Artin actions use the arithmetic convention; a source using geometric Frobenius is transported by inversion. An Artin automorphism and the power map on a special fibre are compared through reduction, rather than identified by notation.

For finite descent, p is the specified coefficient prime and T is the actual Tate lattice over its coefficient DVR R, with uniformizer ϖ and residue field k. For elliptic curves R=ℤ_p and ϖ=p; for GL₂-type quotients R=O_𝔭. An admissible squarefree conductor n has inert auxiliary primes ℓ. Write I_ℓ=(a_ℓ,ℓ+1) and `I_n=Σ_{ℓ∣n}I_ℓ` in R, using the integer image of ℓ+1 in R. Thus I_1=0. For n>1 its exponent M(n) is the minimum of the normalized v_ϖ valuations at all its prime factors. Set M(1)=∞ in depth comparisons; the conductor-one coefficient ideal remains I_1=0, rather than a finite power of ϖ. Reduction modulo ϖ^M requires M(n)≥M; reduction modulo p^m requires M(n)≥v_ϖ(p)m. Equality k=𝔽_p does not identify R with ℤ_p. The derivative class includes its tensor of cyclic Galois groups; changing a cyclic generator transforms the scalar class and the tensor factor together.

Howard's clean theorem assumes an odd p coprime to ND_K and surjectivity G_K→GL₂(ℤ_p). Gross's mod-p theorem uses its own residual hypotheses and a nonzero bottom class modulo p. Neither theorem automatically supplies Zhang's hypotheses. For Zhang, V is the two-dimensional representation over k₀ attached to the coefficient prime of a weight-two newform g and its quotient A_g. For its derivative system choose the (O,𝔭)-optimal quotient, meaning that the image of T_pJ→T_pA is not contained in 𝔭T_pA, and the Hecke-normalized degree-zero point map with a 𝔭-unit denominator of Zhang §3.7, (3.20), p.211. Comparisons with any other fixed quotient or clearing integer retain their actual scalar and 𝔭-divisibility as in §1.6; residual indivisibility is asserted for this normalized system. The factor N⁻ is squarefree, of even parity for an indefinite quaternion algebra and odd parity for a definite one. The three clauses of Hypothesis ♥ are stated at their uses. A statement about E[p]/ℤ_p is not silently substituted for V/k₀.

For Zhang's notation, let Ram(ρ) consist of residual-ramified primes with exact exponent one in N. Hypothesis ♥ has three requirements: first, every ℓ∥N⁺ and every ℓ∣N⁻ with ℓ≡±1 mod p belongs to Ram(ρ); second, if N is nonsquarefree then Ram(ρ) is nonempty, and either one of its primes divides N⁻ or N⁺ has at least two prime factors of exponent one; third, at every ℓ²∣N⁺ both H¹(ℚ_ℓ,V) and `V^{G_ℚ_ℓ}` vanish. The second alternative in the middle requirement does not require both of those N⁺ primes to be residually ramified. Hypothesis ♠ for elliptic E imposes the first two requirements, with the additive-local calculation providing the third. These are Zhang, Notations (xv), pp.202–203, and Introduction, pp.194–195.

Write 𝒩 for the squarefree products of inert Kolyvagin primes ℓ∤ND_Kp with a_ℓ≡ℓ+1≡0 mod 𝔭, and 𝒩′ for products of inert level-raising primes q∤ND_Kp with p∤q²−1 and a_q²≡(q+1)² mod 𝔭. The two prime sets are disjoint. The superscripts ± on 𝒩′ specify the parity of the number of factors; a level m∈𝒩′⁺ gives the indefinite curve. This avoids confusing the conductor set denoted Λ in Zhang with the Iwasawa algebra Λ used below. Coefficient fields, embeddings and derivative generators are fixed when comparing level-raised forms. See Zhang, Notations (vi)–(xiv), pp.200–202, and §3.1, pp.204–205. In the trivial-nebentypus surjective GL₂(k₀) branch, the cyclotomic determinant has image 𝔽_p×, so surjectivity forces k₀=𝔽_p; the other GL₂-type constructions retain their stated coefficient field without this surjectivity assumption.

For integral RM descent, F is totally real of degree d and B/F is ramified at every real place except a specified τ₁; its finite ramification set S_B has #S_B≡d−1 mod 2. Choose an open compact level U⊂B̂× and the central quotient N_U*, with its modular compactification when B=M₂(ℚ). Let A/F be an F-simple Hecke-linear quotient of J(N_U*), with End_F(A)=O_L for a totally real field L satisfying [L:ℚ]=dim A, and fix a nonzero integral Hecke-linear quotient map. On each geometric component use the cusp or Hodge map ι(P)=m[P]−mδ, with one fixed denominator-clearing integer m, and compose with the quotient map to obtain ι_A. Take a totally imaginary quadratic K/F in which every prime of S_B is inert or ramified, an embedding K↪B, and a CM point x of the specified level defined over K(x). The point `y=Tr_{K(x)/K}ι_A(x)` is assumed non-torsion, and A does not acquire CM over K. These hypotheses apply to the integral RM targets below; they do not strengthen an unrelated weak-torsion anticyclotomic theorem. See [Nekovář](#references), §1.19, pp.14–15, and §3.1–Theorem 3.2, pp.18–19.

For an elliptic curve with CM, the endomorphism field M is distinguished from the Heegner field K. The conductor comparison |D_M|∣N, together with the split Heegner hypothesis, gives M≠K. Over KM the Tate module has conjugate character components; over K their descent retains its semilinear action. Full GL₂ image is never assumed for this branch. At p=2 use the integral operators 1±τ and explicit restriction/corestriction errors, without division by two.

Write (Heeg) for splitting in K of every prime of N, (spl) for p=v v̄ split in K, and (tor) for E(K)[p]=0, as in BCGS Introduction and §1.2. Write (disc) for D_K odd with D_K≠−3, as in CGLS §1 and §4.1. The ordinary Heegner family and its arithmetic consumers carry (disc); the order and unit-corrected CM constructions include D_K=−3. In the ordinary anticyclotomic branch, D_K is odd, p is odd and prime to ND_K, and E has good ordinary reduction at p. Put Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧ and ι(γ)=γ⁻¹. The action on T⊗Λ uses the specified inverse character. The unit root α_p satisfies α_p²−a_pα_p+p=0, with other root β_p=p/α_p. The actual ring-class layer containing K_k, and its class-number shift d(k), are retained. The finite ring-class group G(n), the first-step degree group Δ, and Γ are separate groups. Unless a target explicitly weakens them, its ordinary arithmetic context is the one just given; the additional torsion or image hypothesis is then stated at that target.

For Cornut–Vatsal, F is totally real, K/F is CM, π has parallel weight two and finite-order everywhere-unramified central character ω, and P is the moving conductor prime. A primitive stratum has exact P-conductor and prescribed torsion character χ₀ satisfying χ₀ω=1 on A_F×. The generic sign counts all real places and the specified inert finite places. The definite branch assumes π≠π⊗η; the indefinite derivative statement assumes ω=1 and N,D_(K/F),P pairwise coprime. The conclusion produces a nonvanishing character in each sufficiently large permitted stratum. It does not say every character is nonvanishing. For a level given by an order R in the quaternion algebra, CV(H1) means that R_P is Eichler in the split algebra B_P; CV(H2) means that at every Q≠P ramifying in K, B_Q is split and R_Q is maximal (Cornut–Vatsal §§4, 5.3). The condition at the moving prime is H1, even when P ramifies in K.

The compact ordinary Selmer module S and its Heegner line H=Λy∞ are distinguished from their discrete duals. For BCGS/BCS the torsion Greenberg module has the (0,∅) condition: strict at one prime over p and unrestricted at the other. The Castella–Sano complex instead uses the strict ordinary cone at every prime over p and has a rank-one dual with torsion part. Its finite quotient called X_BK uses propagated local conditions; for general twists it need not be the Bloch–Kato Selmer quotient. Rational equalities extend ideals to Λ⊗ℚ_p. Integral equalities retain every p-factor. The BDP square-root convention and the single-power convention for its square are reconciled only after coefficient, period and primitive-factor comparisons.

The arithmetic constructions, APIs and Checks below are specified in prose. Suggested.lean is the acceptance test for headline theorems on the pinned carriers. Its module docstring lists the arithmetic headlines and their required constructions; it supplies no generic-map substitutes. Continuous cohomology, Tate modules and completed group algebras have native carriers, but those alone do not determine the Heegner families, their Selmer structures or their canonical determinant comparisons.

## Exact supplier contracts

### From Mathlib

Use Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Use the algebraic carriers and elementary operations below. Their arithmetic interpretation still requires the named supplier layers. A subring preimage does not construct a full integral order, a group ring does not construct Λ, and compactness does not prove that the arithmetic constraints have the finite intersection property.

| Declaration at the Mathlib pin | Use |
| --- | --- |
| [`Subring.comap`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/Ring/Subring/Basic.lean) | Preimage subring along a ring homomorphism. |
| [`ClassGroup.equivPic`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/PicardGroup.lean) | ClassGroup R ≃* CommRing.Pic R for any commutative domain R. |
| [`CommRing.Pic.mapRingHom`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/PicardGroup.lean) | Pic R →* Pic S for f:R→+*S between commutative semirings. |
| [`PadicInt`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/NumberTheory/Padics/PadicIntegers.lean) | The bounded subtype of Q_p defining Z_p under Fact p.Prime. This definition alone does not supply DVR ideal/valuation theorems; cite the two separately checked declarations below for Layer 4. |
| [`WeierstrassCurve.Affine.Point`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean) | Nonsingular points with infinity. |
| [`Module.length`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/Length.lean) | Module length in ℕ∞ for a ring, additive group and module. |
| [`Nat.primeFactorsList`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Data/Nat/Factors.lean) | The sorted list of prime factors with multiplicity. Taking toFinset/card counts distinct conductor primes. |
| [`IsDiscreteValuationRing.ideal_eq_span_pow_irreducible`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/DiscreteValuationRing/Basic.lean) | In a commutative DVR domain, every nonzero ideal is spanned by a power of a specified irreducible uniformizer; the zero ideal is excluded. |
| [`PadicInt.ideal_eq_span_pow_p`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/NumberTheory/Padics/PadicIntegers.lean) | For a nonzero ideal s of Z_p, there exists n with s=span{p^n}; s≠⊥ is essential. |
| [`PadicInt.mem_span_pow_iff_le_valuation`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/NumberTheory/Padics/PadicIntegers.lean) | For x≠0, x∈span{p^n} iff n≤x.valuation; the zero case must be handled separately. |
| [`DihedralGroup.sr_mul_r`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/GroupTheory/SpecificGroups/Dihedral.lean) | Abstract cyclic-dihedral algebra; the generalized-dihedral ring-class action is the separate arithmetic target §0.6. |
| [`DihedralGroup.sr_mul_sr`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/GroupTheory/SpecificGroups/Dihedral.lean) | Abstract cyclic-dihedral algebra; the generalized-dihedral ring-class action is the separate arithmetic target §0.6. |
| [`DihedralGroup.inv_r`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/GroupTheory/SpecificGroups/Dihedral.lean) | Abstract cyclic-dihedral algebra; the generalized-dihedral ring-class action is the separate arithmetic target §0.6. |
| [`DihedralGroup.inv_sr`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/GroupTheory/SpecificGroups/Dihedral.lean) | Abstract cyclic-dihedral algebra; the generalized-dihedral ring-class action is the separate arithmetic target §0.6. |
| [`hensels_lemma`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/NumberTheory/Padics/Hensel.lean) | A sufficiently simple approximate root lifts uniquely to ℤ_p; the ordinary quadratic has simple unit residue root a_p mod p. |
| [`PadicInt.isUnit_iff`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/NumberTheory/Padics/PadicIntegers.lean) | An element of ℤ_p is a unit iff its p-adic norm is 1; used to distinguish the β-unit factors from the possibly nonunit Φ. |
| [`MonoidAlgebra.single`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/MonoidAlgebra/Defs.lean) | The finite group-ring basis element r·g; this is not a completed arithmetic Iwasawa algebra. |
| [`Submodule.span`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/Span/Defs.lean) | The smallest module containing a supplied subset; useful for the Heegner line, without asserting arithmetic saturation. |
| [`LinearMap`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/Module/LinearMap/Defs.lean) | Bundled semilinear/linear maps between actual modules; used for supplied corestriction and localization maps. |
| [`MonoidHom`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/Group/Hom/Defs.lean) | Bundled multiplicative homomorphisms; finite CM character and character-power algebra. Continuity/topology of Γ remains a supplier condition. |
| [`TensorProduct.tmul`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/TensorProduct/Defs.lean) | The canonical bilinear tensor of actual modules; it supplies the algebraic Heegner tensor, not a Selmer determinant comparison. |
| [`Module.finrank`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/Dimension/Finrank.lean) | Finite rank obtained from cardinal rank; use rank assertions on supplied fraction-field modules, never assumed to make the integral Selmer lattice free. |
| [`ENat`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Data/ENat/Defs.lean) | Extended naturals ℕ∪{∞}; records zero-system divisibility and empty-stratum minima. |
| [`Pi.compactSpace`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Topology/Compactness/Compact.lean) | Dependent products of compact spaces are compact; no surjectivity of transition maps is required. |
| [`IsCompact.inter_iInter_nonempty`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Topology/Compactness/Compact.lean) | A compact set meets an intersection of closed constraints when every finite subfamily has nonempty intersection. |

### From Tau Ceti

The native elliptic Tate module is `TauCeti.TateModule`. In `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Basic.lean`, `WeierstrassCurve.nonempty_linearEquiv_tateModule`, `WeierstrassCurve.free_tateModule` and `WeierstrassCurve.finrank_tateModule` give freeness and rank two over ℤ_p for an elliptic curve over a separably closed field with p nonzero. In `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.lean`, `WeierstrassCurve.Affine.fg_point_of_numberField` gives finite generation of the point group over a number field. Mathlib `ContinuousCohomology.tateShafarevich`, in `Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean`, is the intersection of the localization kernels for a supplied topological Galois module and a supplied family of field extensions; it includes no identification with an elliptic Kummer quotient. These inputs do not determine a Heegner point family. The acceptance file consequently needs no Tau Ceti import.

### From TauCetiRoadmap.GlobalNumberFields

Layer 11, “orders and Picard groups”: full orders, invertible proper Picard groups and conductor-prime-to extension/contraction. The quadratic trace-dual calculation is proved in Layer 0 here.

### From TauCetiRoadmap.ImaginaryQuadraticClassNumber

H1.4 “Orders and conductor comparisons”: the conductor residue-unit exact sequence, the order class-number formula and the exceptional-unit indices. Section 0.4 applies the compatible extension/contraction maps at c and cℓ to the successive kernel.

### From TauCetiRoadmap.EffectiveClassNumbers

§2.8 “Exact vanishing from a Heegner height gap”, Classical Heegner construction: the cusp-normalized conductor-one trace, arithmetic-Artin action, K-rationality and conjugation with its cusp-torsion correction. Sections 1.5–1.6 extend this supplied normalization to higher conductors and to the integral quaternionic family.

### From TauCetiRoadmap.ClassFieldTheory

Layer 12, “separate arithmetic global existence, the norm index, and the global correspondence”, and Layer 13, “norm theorems and class fields”: actual relative class-field existence, finite quotients and arithmetic Artin/norm compatibility. Relative CM towers use Layer 12, not the absolute quadratic carrier alone.

### From TauCetiRoadmap.ComplexMultiplicationAndExplicitReciprocity

CM.1–CM.2: ideal actions and full level reciprocity; CM.4: CM Tate characters. The arithmetic conductor induction is ArithmeticGaloisRepresentations §3.5, including ramified and dyadic cases.

### From TauCetiRoadmap.ModularCurvesPartII

§9.9 “Full and cyclic isogeny correspondences”; §§13.1–13.4 modular Jacobians, Hecke and adjoints; §17.1 “Reduction of the supplied modular Hecke action”; §17.2 “The Eichler–Shimura relation”; §17.3 “Cusp-normalised Abel–Jacobi maps”. Reduction is the canonical specialization map and the Frobenius relation includes the diamond at Γ₁ level.

### From TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurves

R18.1–R18.5: admissible quaternionic levels, canonical curves, definite sets, optimal embeddings, degeneracy and integral specialization. Use the fixed embedding and both vertex copies in the semistable comparison.

### From TauCetiRoadmap.ShimuraVarieties

§4.4 “Canonical-model condition” and §7.14 “Canonical models for every pure datum”: descent and special-point reciprocity, applied to the specified quaternionic curve.

### From TauCetiRoadmap.EllipticCurveModularity

Layer R29.5, “Quotient isogenies and modular parametrisations”: the actual fixed quotient, differential and Hecke/Fricke action. A quotient multiplied by p is not integrally interchangeable with the fixed one.

### From TauCetiRoadmap.GrossZagierAndArithmeticHeights

§§0a.2–0a.4 CM points and level/canonical descent, Layer 0 normalization, Layer 3 Hodge classes and differential constants, Layers 4–5 signs and definite special values, §8.11 quaternionic Gross–Zagier, and §§9.10, 9.14, 9.20, 9.22 isogeny, toric-square and logarithm/function comparisons. Retain CM units, stabilizers, discriminants and integral primitive vectors. General height and CM-moduli constructions remain there; this roadmap applies them to its conductor family.

What GrossZagierAndArithmeticHeights must provide (gap:integral-family-logarithm): For the ordinary split anticyclotomic Heegner family, provide the integral family logarithm and explicit reciprocity identity on the specified distinguished Tate lattice, with coefficient extension, periods and regulator cokernel, used by BCGS Lemmas 1.2.3–1.2.5; the rational finite-point identity alone does not give this contract.

### From TauCetiRoadmap.EllipticCurves

Layers 2, 4, 6 and 7: torsion/Tate modules, local reduction and Tate uniformization, Mordell–Weil finite generation, and the Kummer/Selmer–Sha exact sequences.

### From TauCetiRoadmap.HeightsRationalPointsAndObstructions

§1.7 “Mordell–Weil”: finite generation of A(K) for every abelian variety over a number field, and finiteness of its torsion. This supplies the RM point-divisibility input independently of the rank-one conclusion.

### From TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties

§§1.2, 1.10, 2.1–2.2 and 2.6 supply marked Néron models, unramified base change, identity/component groups and the elliptic reduction filtration; §§4.3–4.6 supply graph monodromy and component pairings; §§5.0a–5.0c supply finite-étale torsion specialization and good-reduction Frobenius. Rational component points and geometric components are kept distinct. Quaternionic curve specialization uses HilbertModularVarietiesAndShimuraCurves §§R18.2.6, R18.5.15–R18.5.18.

### From TauCetiRoadmap.SelmerIwasawaCohomology

§§0.6, 0.8 limit Kummer; §2.12a abelian Kummer/Selmer/Sha and `abelianSelmerGroup_finite`; §§2.3, 2.5–2.8, 2.13–2.22 Selmer propagation, saturation, ordinary conditions, duality and mapping fibres; §§3.1–3.3, 3.5–3.6, 3.9–3.11 Iwasawa–Shapiro, universal norms, semilocal and derived control; §§4.9, 4.12 finite/ordinary local comparison with errors.

What SelmerIwasawaCohomology must provide (gap:surjective-three-integral-comparison): For p=3, E/ℚ good ordinary with surjective residual G_ℚ image and K satisfying (disc),(Heeg),(spl), use the actual Heegner family and integral family logarithm to prove equivalence of both integral Heegner-index and (0,∅)-Greenberg/BDP divisibilities of §8b.2, retaining height-one (3) lengths, coefficient extension, periods, involution and every finite local cokernel, without inverting 3 or assuming either divisibility.

The arithmetic evaluation of these specialization errors for the strict-at-v unrestricted-at-v̄ Heegner condition is proved in §8.36 here. It uses the supplied error sequences, not an imported arithmetic JSW formula or perfect specialization of the all-p ordinary complex.

### From TauCetiRoadmap.ArithmeticStatisticsPartVI

“Heegner logarithm and low rank” (target `heegner_logarithm_lowRank`) supplies its marked CM divisor and elliptic image, logarithm/height identities and low-analytic-rank implication under the hypotheses stated there. “Anticyclotomic character Selmer multiplicity one” (target `anticyclotomic_character_selmer_multiplicity_one`) supplies the character-level descent under its preceding nonvanishing hypotheses; it is not replaced by the untwisted §7.12 here. The divisor/image comparisons in §§1.5–1.6 retain that roadmap’s quotient, isogeny and differential factors.

“Anticyclotomic character nonvanishing” (target `anticyclotomic_character_nonvanishing`): for E/ℚ with all bad primes split in the imaginary quadratic field K and without CM by K, every sufficiently large anticyclotomic layer has a primitive character with a non-torsion traced CM-point component. It includes odd bad, ramified and nonordinary coefficient primes. Apply it here only after identifying its fixed modular CM family and trace with §§1.5–1.6 and 8.2–8.6; in the ordinary branch the additional ordinary hypotheses remain those of the local construction. For CM E/ℚ, §7.8 supplies the distinctness of its CM field from K.

### From TauCetiRoadmap.ArithmeticGaloisDuality

§R02.2.2 “The low-degree sequence and the transgression”, §R02.2.3 “Descent along open subgroups, norms and compact coefficients”, R02.4 local/global duality and real Tate corrections, and D7 derived continuous Selmer complexes and specialization. Inflation–restriction retains its H¹/H² errors until invariant vanishing is proved.

### From TauCetiRoadmap.EulerSystemsAndKolyvaginSystems

Layer 1 auxiliary primes and finite–singular modules, in particular §1.6 the residual evaluation pairing and §1.16 the local pairing, simultaneous prime detection and prescribed ramification; §§3.1–3.8 cyclic derivatives, tensor factors and selected descent; §§4.13, 4.18–4.19 all-prime descent and uniform errors; §5.2 “Howard’s self-dual Selmer triples and hypotheses H.0–H.5”; §5.10 “Howard’s bound for self-dual Kolyvagin systems over a discrete valuation ring”; §§5.11–5.13 rigidity, profile and exact length in their stated prime range; §§8.28, 8.31 self-dual Λ-adic bounds. The common-multiple error bound is independent of the multiplying power.

What EulerSystemsAndKolyvaginSystems must provide (gap:classical-uniform-square-index): In the classical setting of Kolyvagin’s Theorem A, supply the integral length descent giving a positive d_E independent of the Heegner field K, with v_ℓ(d_E)=0 at the full Tate-image primes B(E) of §7.13 and #Sha(E/K) dividing d_E[E(K):ℤy_K]², retaining Cartan/CM and dyadic errors.

What EulerSystemsAndKolyvaginSystems must provide (gap:self-dual-rigidity-three): For residue characteristic 3, a coefficient DVR R finite over ℤ₃, surjective residual elliptic representation, the self-dual cartesian ordinary conditions and a prime set containing every sufficiently deep auxiliary set, prove the common stub exponent d in BCGS Lemma 2.2.4 on N(2k−1), independent of k, with d finite if a core value is nonzero, and deduce the deep-prime invariance and exact paired length of Proposition 2.2.1 and Theorem 2.2.2 without the printed p>3 rigidity restriction.

### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

§§R07.4.21–R07.4.25 supply the integral Barsotti–Tate/crystalline lattice comparisons, including the separate dyadic classification; §R07.5.6a supplies finite-coefficient finite-flat Kummer comparison with its odd-prime coefficient hypotheses. Apply these with the specified lattice, ramification and local torsion conditions; SelmerIwasawaCohomology §§4.9, 4.12 supply the finite/ordinary local-condition comparison.

### From TauCetiRoadmap.FaltingsFinitenessAndIsogenyTheorems

R28.4.5–R28.4.6: semisimplicity and the Tate endomorphism/Hom comparisons; R28.6.7: integral generation of the commutant at almost every prime, with rational generation at every prime. For the RM application, §7.3 proves absolute irreducibility of each coefficient representation by the no-CM/self-twist criterion, then uses these comparisons and the double-centralizer theorem to obtain C₃. The O_L-linear centralizer is the relevant one; no equality End_K(A)=O_L is inferred merely from the no-CM hypothesis. Adelic openness and scalar-image bounds have the separate contracts below.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

§3.5 “Induction and the conductor–discriminant formula”; §§6.1–6.2 “The Tate module” and “Weil pairing and determinant”; §§6.4–6.4a coefficients/images and Frattini detection. The actual representation and base-field index are retained.

What ArithmeticGaloisRepresentations must provide (gap:elliptic-adelic-open-image): For every non-CM elliptic curve over a number field, supply Serre’s adelic open-image theorem with finite base-change index and cyclotomic determinant, implying full residual GL₂(𝔽_p) image for E/ℚ at all but finitely many p.

What ArithmeticGaloisRepresentations must provide (gap:abelian-scalar-image): For the RM quotients of the integral context over K, supply a scalar u_p∈ℤ_p× distinct from 1 in the G_K image on T_pA for every p, and a bound on the indices of the scalar subgroups independent of p, so that u_p−1 can be a unit at all but finitely many p (Nekovář Proposition 6.1.1, pp.35–36).

### From TauCetiRoadmap.SerreWeightAndLevelOptimisation

§§1.1–1.3 “Level-changing algebra and cohomology” and §2.4 “Diamond’s level-raising criterion”; the additional quaternionic congruence contract is stated below.

What SerreWeightAndLevelOptimisation must provide (gap:zhang-level-raising): For the weight-two GL₂-type residual representation over k₀ satisfying Zhang’s three-clause Hypothesis ♥ and admissible primes q₁,q₂, provide the integral/rational residual structures and definite/indefinite quaternionic multiplicity-one identifications, with prescribed local types, used in Zhang Theorem 4.3; existence of a q-new form alone is insufficient.

### From TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer

R17.3 `global-jl` and `multiplicity-one`: the specified Jacquet–Langlands transfer and multiplicity-one comparison, with its actual coefficient structures.

### From TauCetiRoadmap.ModularIwasawaMainConjectures

§§0.5–0.10 the ordinary, zeta and determinant formulations; §1.3 “The Skinner–Urban ordinary main conjecture” and §1.7 “Skinner’s theorem for multiplicative reduction”. Integral rank-zero specialization needs the additional GL₂-type contract below.

What ModularIwasawaMainConjectures must provide (gap:gl2-integral-rank-zero): For g and its quadratic twist g_K in Zhang Theorem 7.1, give the integral ordinary main-conjecture/Kato comparison and trivial-character GL₂-type control formula over the coefficient DVR, assuming residual image containing SL₂(𝔽_p), good ordinary p≥3 and a residually ramified prime ℓ∥N, and retain the canonical-period and local component factors without assuming full integral SL₂ image.

### From TauCetiRoadmap.KatoEulerSystems

§6.6 “Elliptic local lattice and Kato period”, §7.4 “Elliptic ordinary and multiplicative divisibility”, and §7.7 “Control at the trivial character”. The distinguished lattice and étale-isogeny comparison are retained.

### From TauCetiRoadmap.PadicMeasuresIwasawaAlgebras

§1.6 continuous-character evaluation and §1.7 measure/completed-algebra comparison; §3.1 pseudo-measure evaluation only at admissible characters; §3a.1 varying character spaces; Layers 4–5 Weierstrass zero isolation, characteristic ideals, determinant lines and base change. Compactness additionally needs simultaneous finite solvability.

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

§4.2 “Mixing, ergodicity and unipotent flows” supplies its real dynamics. The needed nonarchimedean extension is a distinct contract below.

What GeometryOfNumbersAndQuadraticArithmetic must provide (gap:cm-local-dynamics): For every finite extension L/ℚ_p, r≥1 and product of cocompact lattices Γᵢ⊂SL₂(L), supply the homogeneous orbit-closure probability measure and dilated-compact-set equidistribution for every L-one-parameter unipotent subgroup of SL₂(L)ʳ, the twisted-diagonal containment for Δ(U) with U nontrivial, and the full-product criterion that the conjugated lattices are pairwise not U-commensurable (Cornut–Vatsal Theorem 2.29, Lemma 2.30 and Proposition 2.35, pp.31–34).

### From TauCetiRoadmap.PadicHodgeTheory

§3.5 “Crystalline and semistable classification”: a rank-one rational character of G_ℚp is crystalline precisely when it is an integral cyclotomic power times an unramified character. This is used for the two split local factors of the algebraic-Hecke characters in §8.14; no family reciprocity law is consumed in constructing the Heegner family.

### From TauCetiRoadmap.PadicHodgeRegulators

§§1.3, 1.9–1.10 Bloch–Kato logarithms of local Kummer classes and §§8.17–8.22 integral Perrin–Riou regulators. The arithmetic family reciprocity comparison remains the GrossZagierAndArithmeticHeights contract above.

### From TauCetiRoadmap.AutomorphicCongruences

L5a.1–L5a.3 ordinary two-variable equivalence, quartic-CM restriction and factorization; L5w.1, L5w.3 and L5w.10 Fujiwara’s minimal theorem, primitive quaternionic periods and Hilbert-family divisibility. L5b cyclotomic return is not an input to the anticyclotomic result.

What AutomorphicCongruences must provide (gap:primitive-toric-mu): Supply the precise primitive toric μ=0 theorem and projection/period comparison on the character domain used in BCS Theorem 4.2.1 and Proposition 5.2.1, with p≥5, split ordinary CM hypotheses, residual ramification and every imprimitive Euler factor retained; the independent anticyclotomic divisibility must not consume its cyclotomic-return application.

### From TauCetiRoadmap.EulerSystemsCyclotomicMainConjecture

The cyclotomic theory retains its existing scope. The elliptic-unit/Katz extension required for the Eisenstein branch is the explicit contract below; identifying its earlier owner is necessary before that branch can be completed.

What EulerSystemsCyclotomicMainConjecture must provide (gap:eisenstein-elliptic-unit-inputs): Provide an earlier elliptic-unit/Katz main-conjecture and μ input for the imaginary-quadratic finite-order character components used by CGS Theorem C under φ|G_p≠1,ω, including local and integral lattice corrections, independently of the Heegner anticyclotomic equality; the cyclotomic-unit theorem over ℚ alone is insufficient.

### From TauCetiRoadmap.Chebotarev

Layer 10, “Dirichlet-density Chebotarev”: simultaneous Frobenius selection and finite avoidance. The actual Kummer fields, disjointness and conjugacy classes are verified here.

The classical error-tolerant argument gives a uniform exponent. Its stronger global cardinality estimate additionally uses Kolyvagin's classical square-index theorem, quoted as Theorem A on p.95 of the structure paper. Its integral length argument is required by gap:classical-uniform-square-index; the exponent theorems in EulerSystemsAndKolyvaginSystems §§4.13, 4.18–4.19 do not supply that cardinality estimate. Likewise, neither an unspecified elliptic-unit theorem nor a real Ratner theorem supplies the additional arithmetic interfaces described above.


## How to read the build

Layers 0–3 construct the orders, conductor towers, fixed integral point maps and Kummer local conditions. Layers 4–5 differentiate and descend those points, retaining the coefficient ideals, cyclic tensor factors and global correction maps. Layer 6 applies clean descent and the independent level-raising, period and rank-zero inputs; Layer 7 treats exceptional coefficients, CM and RM errors. Layer 8 builds the anticyclotomic family before geometric nonvanishing, specialization, control and conditional determinant comparisons. Layer 8b proves the split-prime equalities before applying the conditional finite-system and refined-index theorems.

## Layer 0: Quadratic orders and CM conductor towers

Construct the order attached to the actual torus embedding and adelic translate, then identify its ideal classes and class fields. The quadratic étale local algebra may be split. The global transported order must be recovered from all its local conditions; intersecting only the original maximal order gives a different object. The relative CM tower is needed independently of the classical quadratic tower, because the quaternionic and general-F branches have distinct level subgroups.

### 0.1 Local toral order

For a specified embedding ι:E_v↪B_v of a quadratic étale Q_v-algebra, a maximal Z_v-order O_v⊂B_v and g_v∈B_v×, the Heegner local order is ι⁻¹(g_v O_v g_v⁻¹). It is a full Z_v-order of the form Z_v+f_v O_(E_v), is stable under quadratic conjugation, and is maximal away from finitely many places for a rational embedding and restricted adelic g.

([khayutin](#references), §2.4.4, Definition2.1 and Proposition2.2 p.165; Lemma2.3 p.166.)

*Needs:* `Subring.comap` (Mathlib); GlobalNumberFields Layer 11, “orders and Picard groups”.


Define the local toral order by the displayed embedding preimage. Its API is:

- Membership is exactly integrality of the embedded, transported element.
- The conductor ideal exists and is unique.
- The order is stable under quadratic conjugation.

**Checks.**

- With an optimal embedding ι(O_E)=ι(E)∩O_v and g=1, the local order is O_E. For ℚ₅(√2), the embedding √2↦[[0,2],[1,0]] into M₂(ℤ₅) has this property.
- In L×L with diagonal torus and g=[[1,π⁻¹],[0,1]], integrality is a−b∈πO_L; the order is O_L+π(O_L×O_L), of conductor π.
- The same optimality condition gives O_E for a ramified extension, including ℚ₂(i) with i↦[[0,−1],[1,0]]. Its discriminant valuation is 2, rather than 0.
- Without optimality, g=1 need not give O_E: for √2↦[[0,10],[1/5,0]] over ℚ₅, integrality of a+b√2 requires a∈ℤ₅ and b∈5ℤ₅, giving ℤ₅+5ℤ₅√2, of conductor 5. Likewise i↦[[0,−2],[1/2,0]] gives ℤ₂+2ℤ₂i, of conductor 2.

### 0.2 Transported global order

For a rational quadratic embedding E↪B and a restricted adelic g, Λ=E∩∏_v Λ_v is a finite-index Z-order in O_E, with Λ⊗Z_v≃Λ_v. Its Picard group is CommRing.Pic Λ, equivalently ClassGroup Λ; only invertible proper fractional ideals occur.

([khayutin](#references), §2.4.4, Definition2.6 p.166 and its following paragraph p.167.)

*Needs:* [Local toral order](#01-local-toral-order); GlobalNumberFields Layer 11, “orders and Picard groups”; `ClassGroup.equivPic` (Mathlib).


Define the transported order by the intersection in E. Its API is:

- Its localization at each finite place is the specified local order.
- It has finite index in O_E.
- Equality at all finite localizations implies equality of global orders.

**Checks.**

- If all local orders are maximal, their intersection in E is O_E.
- For E=ℚ(i), conductor 3 gives ℤ+3ℤi, of index 3 and discriminant −36; the lattice index is not the discriminant multiplier.
- The local family of conductor 3 at one finite place and maximal elsewhere recovers the same order; omitting that place incorrectly gives ℤ[i].

### 0.3 Toral orbit and ideal-class comparison

For the imaginary quadratic transported order Λ, map a finite invertible idele t to the locally principal fractional ideal E∩t∏_v Λ_v. Taking the double quotient E×\A_E,f×/Λ̂× gives Pic(Λ); the S={∞} toral orbit quotient C_S has the same ideal-class description. The compact stabilizer uses the unit subgroup of the transported order. The torus covering E×→E×/Q× is used explicitly; kernel triviality uses the class number one of Q.

([khayutin](#references), §2.4.3 p.165; §2.4.4, Remark2.7 and Definition2.8 p.167.)

*Needs:* [Transported global order](#02-transported-global-order); GlobalNumberFields Layer 11, “orders and Picard groups”.


Construct the finite-idele-to-fractional-ideal map. Its API is:

- Idele multiplication maps to fractional-ideal multiplication.
- Principal ideles give principal ideals.
- The quotient by principal and transported-unit subgroups is isomorphic to the invertible Picard group.

**Checks.**

- The identity idele represents the unit ideal class.
- Multiplication by a∈E× gives a principal ideal and leaves the Picard class unchanged; changing the chosen idele representative must not change the class.
- In E=ℚ(√−5), the ideal (2,1+√−5) is a nonprincipal invertible maximal-order ideal; collapsing the orbit quotient to one point loses it.

### 0.4 Conductor-change kernel

Let K/Q be imaginary quadratic, c≥1 and ℓ prime. Extension of invertible ideals gives Pic(O_cℓ)→Pic(O_c), surjectively. If ℓ∤c, its kernel is (O_c/ℓO_c)×/((Z/ℓZ)×·image(O_c×)); thus u_c,ℓ·#ker=ℓ−χ_K(ℓ), where u_c,ℓ=[O_c×:O_cℓ×]. If ℓ|c, u_c,ℓ·#ker=ℓ. χ takes −1,0,1 in inert, ramified, split cases. Every quotient and map is induced by the actual inclusions of orders.

([cornut-vatsal](#references), §2.3 p.24 (successive local unit quotient); Appendix §6.1 pp.62–63 (quadratic local orders).)

*Needs:* ImaginaryQuadraticClassNumber H1.4 “Orders and conductor comparisons”; GlobalNumberFields Layer 11, “orders and Picard groups”; `CommRing.Pic.mapRingHom` (Mathlib).


Apply ImaginaryQuadraticClassNumber H1.4 at f=c and f=cℓ, using its compatible extension/contraction maps. Identify the successive Picard kernel with the displayed residue-unit quotient and deduce its cardinality in the new and repeated-prime cases. The global-unit image is retained in this application. Its API is:

- Extension Pic(O_cℓ)→Pic(O_c) is surjective.
- The successive kernel has the displayed residue-unit description with the global-unit image.
- Its cardinality is (ℓ−χ_K(ℓ))/u_c,ℓ for ℓ∤c and ℓ/u_c,ℓ for ℓ∣c.

**Checks.**

- For ordinary units and ℓ∤c, inert, split and ramified cases give kernel orders ℓ+1, ℓ−1 and ℓ.
- If ℓ|c, the next kernel has order ℓ after the actual unit quotient; the first-step ℓ+1 formula is false.
- For K=ℚ(i), c=1 and ℓ=3, the unit index is 2, so the kernel has order 2 rather than 4; the extension must retain exceptional units.

### 0.5 Ring-class tower and finite Galois quotients

Using the ring-class existence theorem imported from ClassFieldTheory Layer 13, realize every K[c] in a fixed separable closure of K. For c|d, O_d⊂O_c gives K[c]⊂K[d] and restriction Gal(K[d]/K)→Gal(K[c]/K), compatible under composition and with ideal extension under Artin. Its kernel is Gal(K[d]/K[c]), and [K[cℓ]:K[c]] equals the kernel cardinal computed in §0.4. Splitting of a prime away from the conductor is equivalent to its invertible ideal class being trivial; K[c]/K is unramified outside c and the exact local ramification is supplied by local unit reciprocity.

([gross](#references), §3 pp.238–240; Cornut–Vatsal §2 pp.20–23.)

*Needs:* [Conductor-change kernel](#04-conductor-change-kernel); ClassFieldTheory Layer 13, “norm theorems and class fields”.


On the supplied class fields use restriction for c|c′. Its API is:

- Restriction is surjective.
- It agrees with ideal extension under arithmetic Artin away from the conductors.
- Its kernel is the actual conductor Picard kernel.

**Checks.**

- At c=1 the extension K[1]/K is the Hilbert class field, which need not be K.
- For K=ℚ(√−5), the conductor-one quotient has order 2; treating P₁ as K-rational fails.
- For c|c′ the restriction map is surjective and its kernel is the conductor-change group, while the field inclusion points from K[c] to K[c′].

### 0.6 Dihedral action on the tower

For imaginary quadratic K/Q, K[c]/Q is Galois and a chosen complex conjugation τ satisfies τστ⁻¹=σ⁻¹ for σ∈Gal(K[c]/K). The conjugation is attached to an archimedean embedding and compatible throughout the tower. Do not equip a general ring class field with IsCMField: it need not be a CM field.

([gross](#references), §3, printed p.238 (conjugation action); Lemma4.3 proof p.242 (dihedral quotient).)

*Needs:* [Ring-class tower and finite Galois quotients](#05-ring-class-tower-and-finite-galois-quotients); ClassFieldTheory Layer 13, “norm theorems and class fields”; `DihedralGroup.sr_mul_r` (Mathlib); `DihedralGroup.sr_mul_sr` (Mathlib); `DihedralGroup.inv_r` (Mathlib); `DihedralGroup.inv_sr` (Mathlib).

### 0.7 Relative CM conductor tower

Let F be totally real, K/F totally imaginary quadratic and P a finite prime of F of residue characteristic p. The imported orders O_Pn=O_F+PⁿO_K and class fields K[Pⁿ] have a compatible Galois inverse limit G∞. The finite idele/unit quotient realizes this limit; G∞ has finite torsion subgroup G0 and G∞/G0≃Z_p^[F_P:Q_p]. For sufficiently large n, [K[Pⁿ⁺¹]:K[Pⁿ]]=N(P), with the finite initial global-unit indices retained. The admissible level subgroup is the intersection with the specified quaternionic level, not an arbitrary replacement.

([cornut-vatsal](#references), §2 pp.20–23, Lemmas2.1–2.9; §1.1 p.4.)

*Needs:* GlobalNumberFields Layer 11, “orders and Picard groups”; ClassFieldTheory Layer 12, “separate arithmetic global existence, the norm index, and the global correspondence”; HilbertModularVarietiesAndShimuraCurves R18.1.


Construct the relative CM tower from the specified local orders and admissible subgroups using ClassFieldTheory Layer 12. Its API is:

- Restriction maps compose along the tower.
- The torsion-free inverse-limit quotient has rank [F_P:ℚ_p].
- Step degrees are eventually N(P), with the initial unit indices retained.

**Checks.**

- For F=ℚ the torsion-free quotient has ℤ_p-rank 1.
- If [F_P:ℚ_p]=2 its rank is 2, so replacing it by a procyclic group loses a direction.
- At an initial level with a global-unit or class-number shift, the degree need not yet be N(P); the eventual degree assertion does not apply there.

### 0.8 Norm, reciprocity and level compatibility

For the relative CM towers and an inclusion of admissible finite-level subgroups, field restriction, finite idele quotient projection and order ideal extension commute under Artin. For a finite extension of CM bases, field norm and ideal norm agree with the imported functorial Artin map on the relevant finite quotient. Cornut–Vatsal uses geometric Frobenius: the arithmetic-Frobenius version here inverts the reciprocity/Frobenius arguments before using any pointwise identity.

([cornut-vatsal](#references), §1.7 p.19, §2.1 pp.20–21, §3.8 p.35.)

*Needs:* [Relative CM conductor tower](#07-relative-cm-conductor-tower); ClassFieldTheory Layer 13, “norm theorems and class fields”; GrossZagierAndArithmeticHeights §0.5 The Artin-map convention and the Galois action on Heegner points.


**Checks.**

- For an identity extension the norm and field restriction squares are identities.
- A generator s of C₃ maps to s⁻¹=s² under arithmetic/geometric conversion; the polynomial 27−s−s² of §8.1 is unchanged after exchanging the two Artin elements.
- Norm down a nontrivial finite extension is compared with restriction under Artin; using field inclusion in the opposite direction is not a map with the required domain.

### 0.9 Different of the local toral order

For the local quadratic étale order Λ_v, define its trace dual Λ_v∨={a∈E_v:Tr(aΛ_v)⊆Z_v} using the imported lattice/trace pairing. Its inverse different is a principal invertible fractional Λ_v-ideal; the different is its inverse. The ideal norm (equivalently the absolute local discriminant valuation) agrees with the order discriminant. This does not identify the signed field norm of a generator with a positive discriminant; in a split conductor-π order a generator (π,−π) has norm −π².

([khayutin](#references), §5.2, Definition5.7 and Lemma5.8, printed p.184.)

*Needs:* [Local toral order](#01-local-toral-order); GlobalNumberFields Layer 11, “orders and Picard groups”.


Define the trace dual by trace integrality and the different as its fractional-ideal inverse. Its API is:

- Taking the trace dual twice recovers the order.
- The different times the trace dual is the unit ideal.
- The norm ideal of the different equals the discriminant ideal.

**Checks.**

- The maximal unramified quadratic order has unit different and trace dual equal to itself.
- For Λ={(a,b):a−b∈πO_L} in L×L, the different is generated by (π,−π); its norm is −π², whereas its discriminant ideal is (π²).
- For ℚ₂(i), the maximal-order different is (2i), with discriminant valuation 2; a ramified maximal order cannot be assigned unit different.


### Examples

For K=ℚ(i), the order ℤ+3ℤi has basis (1,3i), index 3 and discriminant −36. Its Picard number is 3·(1+1/3)/2=2, so the corresponding extension over K has degree 2. The unit correction 2 is essential in both the field degree and the later trace formula (§§0.2, 0.4–0.5).

### Dependencies

This layer uses the earlier internal targets specified in each *Needs:* sentence, the pinned algebraic APIs, and ClassFieldTheory, GlobalNumberFields, GrossZagierAndArithmeticHeights, HilbertModularVarietiesAndShimuraCurves.

## Layer 1: CM points and integral quotient maps

Pass from an ideal action on a moduli point to a point over its specified canonical class field. For modular curves use the rational cusp; for quaternionic curves first clear the Hodge denominator. The quotient map is fixed before points of different conductors are compared. Its degree and possible torsion basepoint errors will return in the integral descent bounds.


### 1.4 Jacobian basepoint and Hodge denominators

For X₀(N) use the rational cusp ∞ to form [x−∞]. For a compact quaternionic curve use the imported normalized rational Hodge class ξ=(K_X+B_X)/deg(K_X+B_X), where B_X is the orbifold elliptic-point correction Σ_x(1−1/e_x)[x] and the supplied hyperbolic curve has deg(K_X+B_X)>0 on each component; the normalized class has degree one; x↦[x−ξ] lies in J⊗Q. Choose a nonzero integer d clearing the denominators to obtain the integral class [d x−d ξ]. Do not erase d. For an auxiliary ℓ₀, (ℓ₀+1−Tℓ₀)x is degree zero; after quotienting by an eigenform g, division by ℓ₀+1−aℓ₀ is valid integrally at p only if it is a p-adic unit.

([cornut-vatsal](#references), §3.5 pp.29–32; Zhang Remark6 pp.205–206.)

*Needs:* GrossZagierAndArithmeticHeights §0a.4 Quaternionic CM points, levels and canonical-model descent; GrossZagierAndArithmeticHeights Layer 3 Hodge classes, realizations and differential constants; EllipticCurveModularity R29.5; ModularCurvesPartII §17.3 Cusp-normalised Abel–Jacobi maps.


Using the supplied rational Hodge class, form the integral divisor at the fixed nonzero clearing integer d. Its API is:

- The divisor has degree zero.
- Formation commutes with base change.
- Multiplying d multiplies the class by the same integer, retaining nonunit factors.

**Checks.**

- A rational cusp gives [x−∞] integrally with d=1.
- If ξ=D/2 for an integral divisor D of degree 2, clearing by 2 gives [2x−D]; declaring [x−D] degree zero is false.
- If ℓ₀+1−a_ℓ₀ is divisible by p, its inverse is not an integral coefficient; the auxiliary Hecke normalization must retain its denominator.

### 1.5 Heegner point family

Fix the descended CM family x_c, the level orientation, the integral cusp or d-cleared Hodge construction, and an actual fixed modular quotient φ:J→A defined over the base. For a supplied CM divisor/image in the scopes of ArithmeticStatisticsPartVI, “Heegner logarithm and low rank” or “Anticyclotomic character nonvanishing”, use that image and identify its marking with the fixed φ and basepoint. In the other GL₂-type and relative quaternionic contexts, define P_c=φ([d x_c−d ξ])∈A(K[c]); the modular cusp branch has d=1. For the induced finite elliptic parametrization X→E keep its degree and Manin constant; a positive-dimensional-kernel quotient J→A itself has no finite degree. For the classical modular branch, import the cusp-normalized trace `y_K=Tr_{K[1]/K}P_1` from EffectiveClassNumbers §2.8, Classical Heegner construction, and prove agreement at conductor one. For the quaternionic branch take the trace of its fixed integral Hodge-normalized point. P_1 is generally not K-rational.

The required API is:

- For the descended CM point x_c and the fixed quotient φ:J→A, P_c=φ([d x_c−d ξ]).
- Evaluation applies the fixed quotient to the d-cleared Jacobian class of x_c.
- Postcomposing φ by a defined homomorphism f carries each point to f(P_c).
- The fixed quotient commutes with the Galois action on the descended CM family.

**Checks.**

- For the classical cusp map, the point is φ([x_c−∞]); no Hodge denominator occurs.
- Postcomposing the fixed quotient with the zero homomorphism A→A yields the zero point at every conductor.
- For the two-element group acting on ℤ by negation, the selected point is 1 and its orbit trace is 1+(−1)=0. The point-family constructor returns 1, not its trace.

([howard](#references), §1.7 p.19; Gross §1 p.236; Zhang §3.7 p.213.)

*Needs:* ArithmeticStatisticsPartVI, “Heegner logarithm and low rank” and “Anticyclotomic character nonvanishing”, for their supplied CM images; EffectiveClassNumbers §2.8, Classical Heegner construction; GrossZagierAndArithmeticHeights §0a.4 Quaternionic CM points, levels and canonical-model descent; [Jacobian basepoint and Hodge denominators](#14-jacobian-basepoint-and-hodge-denominators); EllipticCurveModularity R29.5; EllipticCurveModularity Layer R29.5 Quotient isogenies and modular parametrisations; ModularCurvesPartII §17.3 Cusp-normalised Abel–Jacobi maps.

### 1.6 Parametrization choice, degree and torsion

Import the classical conductor-one arithmetic-Artin, K-rationality and conjugation laws, including the cusp-torsion correction, from EffectiveClassNumbers §2.8, Classical Heegner construction. Identify the supplied statistics CM images with the same conductor-one trace and retain their marked quotient/isogeny factors. Extend this normalization to the higher-conductor arithmetic relations: ideal-class translation gives the corresponding Galois translation, and a Fricke/orientation change acts by the recorded eigenvalue and rational cusp-torsion translation. Multiplying the modular parametrization or clearing Hodge denominators scales P_c and the bottom trace by that integer. For Gross’s rational optimal curve, φ*ω_E=c_φ·(2πif(z)dz), with positive integral Manin constant c_φ; once rank one and non-torsion of y_K have been proved, for a fixed E, I_K/c_φ is independent of the nonzero parametrization. Under an isogeny ψ:E→E′, let j=[E′(K)_free:ψE(K)_free] and ψ*ω_E′=aω_E. Then I′_free=j I_free and c_ψφ=a c_φ; their positive ratio changes by j/|a| (with c_ψφ taken positive). For full indices multiply by #E′(K)_tors/#E(K)_tors. These factors are retained separately (Gross §1, p.236).

([gross](#references), §1 pp.236–237; §5 pp.243–244; Zhang Remarks6–7.)

*Needs:* EffectiveClassNumbers §2.8, Classical Heegner construction; [Heegner point family](#15-heegner-point-family); EllipticCurveModularity R29.5; GrossZagierAndArithmeticHeights Layer 3 Hodge classes, realizations and differential constants.


**Checks.**

- At N=37 and D_K=−139 the conductor-one trace is the sum of the same three cusp-normalized CM classes supplied by EffectiveClassNumbers §2.8.
- At N=5077 and D_K=−7 there is one summand, because h(K)=1.
- With free index j=5 and differential factor a=1, an isogeny multiplies I_free/c_φ by 5; multiplying a parametrization on the same curve by 5 multiplies numerator and denominator by 5.


### Examples

Take an integral degree-two divisor D with ξ=D/2. The divisor 2x−D has degree 2−2=0 and defines the integral quotient point at clearing integer 2. Replacing 2 by 6 multiplies this point by 3. If its free rank-one index is I and the parametrization is multiplied by 5, both I and the differential constant are multiplied by 5 (§§1.4–1.6).

### Dependencies

This layer uses the earlier internal targets specified in each *Needs:* sentence, the pinned algebraic APIs, and ComplexMultiplicationAndExplicitReciprocity, EllipticCurveModularity, GrossZagierAndArithmeticHeights, HilbertModularVarietiesAndShimuraCurves, ShimuraVarieties.

## Layer 2: Hecke correspondences, traces and reduction

The Euler-system relations come from classifying Hecke neighbours by their order conductor. Separate a new inert prime, a first split or ramified step, and a repeated conductor step. Their degrees and predecessor terms are different. Transport divisor identities through the fixed eigenquotient, and only then compare integral reduction and Frobenius. Local recurrences at nonmaximal level are retained for the relative CM nonvanishing argument.

### 2.1 Hecke neighbors of a CM point

At a finite prime P where B is split and the Eichler level is maximal, let ε_P=−1,0,1 for inert, ramified, split K/F. A level-zero CM lattice has 1+ε_P horizontal neighbors and N(P)−ε_P neighbors of conductor P. At positive conductor n it has one predecessor of conductor n−1 and N(P) neighbors of conductor n+1. The conductor-increasing set is a torsor for O_n×/O_n+1×. Global unit stabilizers must be divided out when converting this local sum into a field trace.

([cornut-vatsal](#references), Appendix6.1–6.2 pp.62–64.)

*Needs:* GrossZagierAndArithmeticHeights §§0a.3–0a.4 Optimal embeddings and quaternionic CM points, levels and canonical-model descent; [Conductor-change kernel](#04-conductor-change-kernel); HilbertModularVarietiesAndShimuraCurves R18.4.

### 2.2 Inert Heegner norm relation

Under the classical Heegner hypothesis, ℓ prime with ℓ∤cN and inert in K, the compatible cusp-normalized family satisfies `u_c,ℓ·Tr_{K[cℓ]/K[c]}P_cℓ=a_ℓP_c.` With ordinary units u=1 this is the Gross/Howard equality. For a d-cleared Hodge family, first prove that the chosen basepoint is a Hecke eigenclass and transport the divisor relation; retain any integral torsion difference if only a rational eigenclass identity is known.

([gross](#references), Proposition3.7(i), pp.240–241; Howard §1.7 p.19.)

*Needs:* [Hecke neighbors of a CM point](#21-hecke-neighbors-of-a-cm-point); [Heegner point family](#15-heegner-point-family); [Conductor-change kernel](#04-conductor-change-kernel); EllipticCurveModularity R29.5.

### 2.3 Split and ramified first-step relations

For ℓ∤cN, the local divisor trace with u_c,ℓ retained equals T_ℓx_c−(σ_ℓ+σ_ℓbar)x_c in the split case and T_ℓx_c−σ_ℓx_c in the ramified case. Here Frobenius on the lower-conductor field is unramified at ℓ; the ramified case refers to K/Q ramification, not ramification of K[c]/K away from c. Use the specified reciprocity convention. After the fixed eigenquotient replace T_ℓ by a_ℓ only with the exact Jacobian basepoint corrections.

([cornut-vatsal](#references), Corollary6.6, p.64.)

*Needs:* [Hecke neighbors of a CM point](#21-hecke-neighbors-of-a-cm-point); [Norm, reciprocity and level compatibility](#08-norm-reciprocity-and-level-compatibility); [Heegner point family](#15-heegner-point-family).

### 2.4 Repeated-conductor predecessor relation

At maximal local quaternionic level, identify CM lattices with O_(F,P)-lattices L in the rank-one K_P-module and put O_n=O_(F,P)+PⁿO_(K,P). For conductor n≥1 define the upper predecessor by prᵘ(L)=O_(n−1)L and the lower predecessor by prˡ(L)=P O_(n−1)L. These are maps from the conductor-positive CM set to the same CM set, lowering conductor by one; upper/lower refer to inclusion of lattices. Define Tˡ_P(L) as the sum of sublattices L′⊂L with L/L′ of residue dimension one, and Tᵘ_P(L) as the analogous sum of over-lattices. Both preserve the divisor module, and central multiplication gives Tˡ_P=P·Tᵘ_P. With conductor n≥2, the local unit trace of x is Tˡ_P(prᵘx)−prˡ(prᵘx). Passing to a global field trace divides this local orbit by the actual global-unit stabilizer. For the classical coherent family this gives Tr(P_(cℓ))=a_ℓP_c−P_(c/ℓ) when ℓ∣c and the unit index is one; with other normalizations keep their unit and central actions.

The predecessor and Hecke API is:

- Each predecessor commutes with the K_P× action and therefore descends to a Galois-equivariant map on CM points of positive conductor.
- Their conductor is n−1, and prˡ=P·prᵘ on lattices; central multiplication is retained in the CM quotient.
- The displayed trace identity holds in the divisor module for n≥2 and transports through the fixed integral quotient with its basepoint correction.

**Checks.**

- For L=O_2, prᵘ(L)=O_1 and prˡ(L)=P O_1, so both have conductor one but are distinct lattices before the central quotient.
- Over residue size 5 a positive-conductor lattice has one lower-conductor neighbor and five higher-conductor neighbors. Removing its predecessor from a six-term Hecke sum leaves five terms, rather than six.
- At conductor zero O_(n−1) would be undefined; neither predecessor is evaluated there. At conductor one the correction is instead the split, ramified or inert first-step term of §2.3.

([cornut-vatsal](#references), Corollary6.6, p.64.)

*Needs:* [Hecke neighbors of a CM point](#21-hecke-neighbors-of-a-cm-point); [Conductor-change kernel](#04-conductor-change-kernel); [Heegner point family](#15-heegner-point-family).

### 2.5 Distribution at nonmaximal local level

For Eichler exponent δ≥1, use an oriented pair of rank-two O_(F,P)-lattices L(δ)⊂L(0) with cyclic endpoint quotient L(0)/L(δ)≃O_(F,P)/P^δ as O_(F,P)-modules. Its intermediate lattices are L(i)=L(δ)+P^iL(0), for 0≤i≤δ; each successive quotient has residue dimension one. Write n_i for the conductor of L(i) and n=max_i n_i. Its type is I if n_0<n_δ, II if n_0>n_δ and III if n_0=n_δ. This definition uses the fixed optimal K_P-embedding and orientation. In the terminology of Cornut–Vatsal, a CM point is good when δ=0, or when δ>0 and its two endpoint orders differ, equivalently its type is I or II; type III is bad. For δ=1 and conductor n≥2, define the predecessor pair as (L(0),P O_(n−2)L(0)) in type I and (O_(n−2)L(1),L(1)) in type II. It is a map from those conductor-at-least-two CM pairs to the same oriented CM-pair set.

On the free divisor module of oriented δ=1 pairs, define Tˡ_P(L) as the sum of all other pairs L′ with L′(1)=L(1), and Tᵘ_P(L) as the sum of all other pairs with L′(0)=L(0). Each is an endomorphism of this module. The local unit trace is Tᵘ_P(pr(x)) in type I and Tˡ_P(pr(x)) in type II. The P-new quotient kills each complete fixed-endpoint fibre sum, including the original pair, so both operators act by −1 there and the trace is −pr(x). For δ≥2, use the quotient by the complete fibre sums of the two truncations (L(0),L(δ−1)) and (L(1),L(δ)); type I/II points have zero trace in that quotient; no zero-trace assertion is made for type III. These are divisor-module statements before any abelian quotient.

The oriented type and predecessor API is:

- The cyclic endpoint condition determines the intermediate chain. The intersection of the endpoint endomorphism orders is an Eichler order of exponent δ, and the common endpoint stabilizer in GL₂ is its unit group.
- K_P× preserves the type and commutes with the predecessor maps on their domains.
- Reversing the orientation exchanges types I and II and exchanges the corresponding trace formulas.
- The trace identities descend to the P-new quotient with the stated sign for δ=1 and zero for δ≥2 of type I/II.
- The good-point predicate is preserved by the K_P× action and by orientation reversal; at δ=0 it includes every CM point.

**Checks.**

- For δ=2 and L(0)=Oe₁⊕Oe₂, the endpoint L(2)=Oe₁⊕π²Oe₂ gives quotient O/(π²) and intermediate lattice Oe₁⊕πOe₂. The backtracking endpoint πL(0) gives k², killed by π, whereas π acts nontrivially on O/(π²); two successive one-dimensional quotients alone do not define this carrier.
- At residue size 2 a fixed-endpoint fibre of δ=1 pairs has three elements e₀,e₁,e₂. Either operator sends its original e₀ to e₁+e₂, which becomes −e₀ after imposing e₀+e₁+e₂=0; including e₀ in the operator would instead give zero. Tᵘ fixes the first endpoint and Tˡ fixes the second.
- With endpoint conductors (1,2), the type is I; reversing them to (2,1) gives type II, so the upper/lower operator must also change.
- With endpoint conductors (2,2), the type is III. For even δ such examples occur at arbitrarily large conductor, so large conductor alone cannot justify the type I/II zero-trace law.
- In the δ=1 new quotient, a predecessor with coefficient 4 contributes −4 to the trace; replacing the operator by +1 would give 4 and the wrong sign. For δ≥2 and type I/II its trace coefficient is 0.

([cornut-vatsal](#references), Definition1.6 p.9 and Appendix6.3–6.4 pp.65–67.)

*Needs:* GrossZagierAndArithmeticHeights §§0a.3–0a.4 Optimal embeddings and quaternionic CM points, levels and canonical-model descent; [Hecke neighbors of a CM point](#21-hecke-neighbors-of-a-cm-point); HilbertModularVarietiesAndShimuraCurves R18.4.

### 2.6 Heegner reduction congruence

For the classical compatible family, ℓ∤cND inert, choose compatible primes λ_cℓ|λ_c over ℓ and the actual good-reduction specialization maps. Then red_λcℓ(P_cℓ)=Fr_ℓ(red_λc(P_c)) after the specified residue-field identifications, where Fr_ℓ is the ℓ-power Frobenius endomorphism of the model over 𝔽_ℓ. The residue field here is 𝔽_(ℓ²): its own arithmetic Frobenius is the ℓ²-power map, whereas Fr_ℓ acts through the nontrivial element of Gal(𝔽_(ℓ²)/𝔽_ℓ). Compare any global Artin element through these reduction maps and invert geometric Galois conventions explicitly. This is pointwise, not merely an equality of traces.

([gross](#references), Proposition3.7(ii) and proof, pp.240–241.)

*Needs:* [Inert Heegner norm relation](#22-inert-heegner-norm-relation); NeronModelsAndSemistableAbelianVarieties §§1.2, 2.2, 2.6; ModularCurvesPartII §17.2 The Eichler–Shimura relation; ModularCurvesPartII §17.1 Reduction of the supplied modular Hecke action.

**Checks.**

- In 𝔽₉=𝔽₃[i] with i²=−1, Fr₃(i)=i³=−i, whereas the residue-field arithmetic Frobenius gives i⁹=i. Replacing Fr₃ by the latter changes the pointwise identity.
- Fr₃²(i)=i⁹=i, so the two-step action is the identity on 𝔽₉; it need not be the identity after one step.
- On 𝔽₃-rational coordinates both maps are the identity, so such coordinates alone cannot distinguish the two conventions.

### 2.7 Quaternionic CM reduction and specialization

For Zhang’s m∈𝒩′⁺ and an admissible q∤m, reduction of x_m(n) at q is x_mq(n) in the definite Shimura set, using the matched optimal embedding and supersingular identification. For q|m, specialization is x_m/q(n) on the chosen vertex copy of the semistable reduction graph. Both formulas require the same CM/basepoint identifications and the prime λ=qO_K splitting completely in the CM fields of definition over K (in particular K[n]/K, since q∤n). Rational q is inert in K/Q; reduction uses residue field F_q².

This target also assumes q is an admissible prime, n∈𝒩 and m∈𝒩′⁺, so q∤n by disjointness of 𝒩 and 𝒩′. The chosen prime above λ and the conventions above are fixed.

([zhang](#references), §§3.4–3.6, pp.207–211, Theorem3.1.)

*Needs:* GrossZagierAndArithmeticHeights §§0a.3–0a.4 Optimal embeddings and quaternionic CM points, levels and canonical-model descent; GrossZagierAndArithmeticHeights §0a.4 Quaternionic CM points, levels and canonical-model descent; HilbertModularVarietiesAndShimuraCurves §§R18.5.15–R18.5.18; HilbertModularVarietiesAndShimuraCurves R18.2; HilbertModularVarietiesAndShimuraCurves R18.3; HilbertModularVarietiesAndShimuraCurves R18.5.


### Examples

At residue size 5 and maximal level, the inert, ramified and split first steps have respectively (horizontal, conductor-increasing) counts (0,6), (1,5) and (2,4). Each totals 6, while a positive-conductor step has one predecessor and 5 conductor-increasing neighbors. With eigenvalue 2 and trivial lower Artin actions, the split quotient trace coefficient is 2−2=0 and the ramified coefficient is 2−1=1 (§§2.1–2.4). These are local numerical ledgers, without an asserted global curve realizing all choices.

### Dependencies

This layer uses the earlier internal targets specified in each *Needs:* sentence, the pinned algebraic APIs, and EllipticCurveModularity, HilbertModularVarietiesAndShimuraCurves, NeronModelsAndSemistableAbelianVarieties.

## Layer 3: Heegner Kummer classes and Selmer conditions

Apply the continuous Kummer map to the integral point family. Good primes, bad component groups, coefficient primes and real places require separate local comparisons. The image in the rational finite condition does not automatically identify an integral Kummer lattice. Each saturation and local torsion defect must be retained before claiming that a descended class belongs to the intended Selmer group.

### 3.1 Heegner Kummer classes

For a GL₂-type quotient A_g with integral O-action, put R=O_𝔭, T=T_𝔭A_g and A_g,M=T/ϖ^M T. Localize the abelian Kummer sequence on the 𝔭-component to obtain the injection from the R-completed point module modulo ϖ^M to H¹_cont(K[c],A_g,M), and apply it to the actual normalized point of §1.5. Zhang’s Hecke-normalized point has a 𝔭-unit denominator, so it lies in that completed point module. Use the actual O-action, the completion and scalar projection, not a division map on an uncompleted point group. For the elliptic specialization R=ℤ_p this is the finite Kummer injection E(K[c])/p^mE(K[c])→H¹_cont(K[c],E[p^m]) applied to P_c. Apply the imported completed Kummer map to obtain the integral T_𝔭A_g class, specializing to T_pE for an elliptic curve. The finite classes are its actual coefficient reductions, and restriction/corestriction commute with the field maps/point trace, including all trace/unit constants from Layer 2. The Tate module has its inverse-limit topology and finite torsion coefficients their discrete topology.

([howard](#references), §§1.1,1.7 pp.5–8,19–21; Gross §4 pp.241–243; [zhang](#references), §3.7, (3.20)–(3.22), pp.211–213.)

*Needs:* [Heegner point family](#15-heegner-point-family); [Inert Heegner norm relation](#22-inert-heegner-norm-relation); EllipticCurves Layer 7, “Selmer groups and Sha”; SelmerIwasawaCohomology §§0.6, 0.8 The limit Kummer map and p-adic Kummer identification; SelmerIwasawaCohomology §2.12a Abelian Kummer and Sha interfaces.


Apply the imported Kummer injection to the actual point modulo p^m. Its API is:

- Reduction T/ϖ^M T→T/ϖ^M′T for M′≤M carries the class to the corresponding finite Kummer class; completed coefficient extension commutes with the point Kummer map.
- Restriction agrees with field extension of the point.
- Corestriction agrees with the actual point trace.

**Checks.**

- A zero point has zero Kummer class at every level.
- A point divisible by p^m has zero finite Kummer class; nonzero points need not give nonzero residual classes.
- At conductor one, the class over K is the Kummer class of the full trace; for a two-element negation orbit that trace is 0 although the selected point is 1.
- In R=ℤ₅[ϖ] with ϖ²=5, the free point-module model R has ϖ nonzero modulo ϖ² and zero modulo ϖ. A 5-adic depth of one corresponds to ϖ-depth two, not one.

### 3.2 Good-place Kummer condition

For ℓ≠p of good reduction, the finite Kummer image E(K_v)/p^m agrees with H¹_unr(K_v,E[p^m]); in particular P_c’s Kummer class is unramified at such v, after transfer to the relevant field. The proof uses the Néron model and unramified torsion, not a claim that all local cohomology is unramified.

([gross](#references), §7 pp.247–249.)

*Needs:* [Heegner Kummer classes](#31-heegner-kummer-classes); EllipticCurves Layer 7, “Selmer groups and Sha”; SelmerIwasawaCohomology §§2.13–2.20 Dual Selmer structures, local duality and Poitou–Tate.

### 3.3 Component obstruction at bad places

For finite v∤p, compare the local point Kummer image with the propagated rational unramified condition. The discrepancy factors through the p-primary component group of the Néron model, together with the precise local invariants/quotient torsion terms. Equality requires the appropriate obstruction to vanish; residual irreducibility alone does not remove it. For Gross’s derived d(n), the cusp-divisor and connected-Néron-model argument proves local triviality away from n even at primes dividing N.

([gross](#references), Proposition6.2 and proof, pp.244–247.)

*Needs:* [Heegner Kummer classes](#31-heegner-kummer-classes); NeronModelsAndSemistableAbelianVarieties §§1.2, 2.2, 2.6; EllipticCurves Layer 7, “Selmer groups and Sha”; NeronModelsAndSemistableAbelianVarieties Layer 2 special fibres and component groups; NeronModelsAndSemistableAbelianVarieties §2.6 The elliptic reduction filtration; SelmerIwasawaCohomology §2.15 Finite against unramified classes at bad primes.

### 3.4 Kummer condition at the coefficient prime

At v|p with good reduction, the actual Kummer class of P_c satisfies the finite/crystalline rational condition and its integral propagated Kummer condition. In the good ordinary branch compare with the Greenberg filtration only under the exact ordinary/crystalline comparison hypotheses and retain local-torsion error terms. A rational equality after tensoring with Q_p is not an equality of integral lattices.

([howard](#references), §1.6, Theorem1.6.5 proof, pp.18–19.)

*Needs:* [Heegner Kummer classes](#31-heegner-kummer-classes); EllipticCurves Layer 7, “Selmer groups and Sha”; SelmerIwasawaCohomology Layer 2 Selmer structures and complexes; SelmerIwasawaCohomology §2.5 Propagating local conditions; SelmerIwasawaCohomology §2.8 Greenberg’s local condition and §4.12 Finite versus ordinary local conditions with explicit exceptional terms; SelmerIwasawaCohomology §4.9 The Bloch–Kato local condition on T and W; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.4.21–R07.4.25, R07.5.6a.

### 3.5 Saturated integral Kummer comparison

Compare the actual finite/p-adic Heegner Kummer classes in the Selmer lattice with E(K)⊗Z_p, V_pE, and E[p∞]. Use the Kummer exact sequence to identify the quotient by the Mordell–Weil lattice with the appropriate Sha group. Saturation is a separate integral assertion; the finite cokernel and local component-group defects must be retained before rationalizing.

([howard](#references), Introduction pp.1–3; §1.6 pp.18–19.)

*Needs:* [Heegner Kummer classes](#31-heegner-kummer-classes); [Component obstruction at bad places](#33-component-obstruction-at-bad-places); [Kummer condition at the coefficient prime](#34-kummer-condition-at-the-coefficient-prime); EllipticCurves Layer 7, “Selmer groups and Sha”; SelmerIwasawaCohomology §§0.6, 0.8 The limit Kummer map and p-adic Kummer identification; SelmerIwasawaCohomology §2.6 From V to T and W; saturation; SelmerIwasawaCohomology §2.12a Abelian Kummer and Sha interfaces.

### 3.6 Archimedean Tate correction

Over imaginary quadratic K all archimedean completions are C, so the relevant local H¹ vanishes. In descent to Q at a real place use the real/Tate local condition on the actual E[p^m] module. Odd p permits the usual conjugation eigenspace splitting; at p=2 its kernel/cokernel must be retained and one cannot divide by two on an integral Z₂ lattice.

([gross](#references), Proposition6.2, p.245; §8 p.249.)

*Needs:* [Heegner Kummer classes](#31-heegner-kummer-classes); ArithmeticGaloisDuality R02.4.


### Examples

A local component group ℤ/25 at p=5 contributes length 2. The lattices 5ℤ₅⊂ℤ₅ have the same ℚ₅-span but quotient of order 5. Thus neither rational finite-condition comparison nor global irreducibility can discard the component or lattice corrections (§§3.3–3.5).

### Dependencies

This layer uses the earlier internal targets specified in each *Needs:* sentence, the pinned algebraic APIs, and EllipticCurves, FiniteFlatGroupsAndIntegralPadicHodgeTheory, NeronModelsAndSemistableAbelianVarieties.

## Layer 4: Derivative coefficients and descent to K

Use the conductor coefficient ideal and the cyclic derivative operators from the abstract Euler-system theory. Invariance is proved modulo the sum of local coefficient ideals; unique descent uses the actual torsion-invariant vanishing. The bottom class is the Kummer image of a trace, not of a raw conductor-one point. Generator changes are absorbed in cyclic tensor coefficients, and reduction is allowed only at sufficiently deep auxiliary primes.

### 4.1 Heegner conductor coefficient ideal

Fix an odd prime p, the coefficient DVR R finite over ℤ_p with uniformizer ϖ, and the actual Hecke eigenvalues a_ℓ∈R. Set I_ℓ=(a_ℓ,ℓ+1)⊂R and `I_n=Σ_{ℓ|n}I_ℓ` for squarefree n of admissible inert primes. The coefficient ring is R/I_n and the coefficient representation is T/I_nT. For n=1 the empty sum is zero, so the coefficient module is the full Tate lattice, not its residual reduction. If n>1 then I_n=(ϖ^M(n)) with `M(n)=min_{ℓ|n}min(v_ϖ(a_ℓ),v_ϖ(ℓ+1)).` An intersection/product would give the wrong modulus.

The required API is:

- For the finite prime set s and eigenvalues a, I_s is the sum over ℓ∈s of the ideals (a_ℓ,ℓ+1) in R.
- I_∅=0.
- For ℓ∉s, the ideal for insert ℓ s is span{a_ℓ,ℓ+1}+the ideal for s.
- For nonempty finite s, I_s=(ϖ^m) with m=min over s of min(v_ϖ(a_ℓ),v_ϖ(ℓ+1)), using v_ϖ(0)=∞. Since ℓ+1 is a nonzero integer, the exponent is finite; the empty case is excluded.
- s⊆t implies I_s≤I_t, hence there are the quotient maps R/I_s→R/I_t and T/I_sT→T/I_tT.

**Checks.**

- The empty conductor has I_1=0 and depth M(1)=∞, so every finite coefficient reduction is allowed and the integral coefficient ring does not force p to vanish.
- At a_ℓ=0, the ideal is (ℓ+1), and the first generator contributes valuation ∞ rather than zero.
- For p=5, s={19}, a_19=10, the ideal is (5).
- For p=5, s={19,149}, a_19=10,a_149=25, the ideal is (5), not (25); the sum takes the minimum valuation.
- In R=ℤ₅[ϖ], ϖ²=5, with ℓ=19 and a_19=ϖ, the valuations are 1 and 2 and I_19=(ϖ). Its quotient has R-length 1 and cardinality 5; a_19∉ℤ₅ although the residue field is 𝔽₅. This is a coefficient-ring example, without a claim that these chosen eigenvalues come from a global newform.

([howard](#references), §1.7 pp.19–20; Zhang §1 p.194 and Notations p.202.)

*Needs:* EulerSystemsAndKolyvaginSystems §1.4 coefficient ideals over R and §§3.1–3.8 Kolyvagin derivatives and descent; LocalFieldsRamification Layer 0 normalized coefficient valuations; `PadicInt` (Mathlib) in the elliptic specialization; `PadicInt.ideal_eq_span_pow_p` (Mathlib); `PadicInt.mem_span_pow_iff_le_valuation` (Mathlib).

### 4.2 Differentiated point invariance

For the actual squarefree ring-class conductor n, let G_n=Gal(K[n]/K[1]) be the product of its cyclic inert factors and 𝒢_n=Gal(K[n]/K). Under ordinary units and the clean torsion-image hypotheses, choose generators σ_ℓ and coset representatives S for 𝒢_n/G_n. Use EulerSystemsAndKolyvaginSystems Layer 3’s D_n=∏D_ℓ and set the differentiated point `˜P_n=Σ_{s∈S}sD_nP_n.` Its class modulo I_n is 𝒢_n-invariant and independent of S. For the normalized GL₂-type points use the same coset sum in the R-completed point module of §3.1 and reduce modulo I_n in R. Use the full 𝒢_n action, not merely invariance under G_n. Exceptional-unit factors require a modified bounded-denominator construction, not an assumed direct product.

([howard](#references), Lemma1.7.1 pp.19–20; Gross §4 pp.241–243.)

*Needs:* [Heegner conductor coefficient ideal](#41-heegner-conductor-coefficient-ideal); [Inert Heegner norm relation](#22-inert-heegner-norm-relation); EulerSystemsAndKolyvaginSystems §§3.1–3.8 Kolyvagin derivatives and descent; [Ring-class tower and finite Galois quotients](#05-ring-class-tower-and-finite-galois-quotients).


Construct the differentiated point with the full coset sum. Its API is:

- The full Galois group fixes its class modulo the coefficient ideal.
- Changing coset representatives preserves that reduced class.
- At conductor one it is the full trace. Choice independence is asserted only after the required coefficient reduction.

**Checks.**

- At n=1 the derivative is 1 and the full orbit sum is Tr P₁; replacing that sum by P₁ fails when the class number exceeds 1.
- For one cyclic factor of order d, take D=Σ_(i=1)^(d−1)iσ^i. Then (σ−1)D=d−Σ_(i=0)^(d−1)σ^i; at d=3 the coefficients on both sides are (2,−1,−1). Reversing the sign of D changes that value to (−2,1,1). Zhang’s endpoint sum through d differs by d·1, which vanishes modulo I_ℓ because d=ℓ+1∈I_ℓ.
- When the coefficient ideal is (p), invariance is only modulo p and need not hold in the integral point group; invariance before reduction is stronger and false.

### 4.3 Vanishing of ring-class torsion invariants

Under Gross’s odd-p full residual image hypothesis or Howard’s full G_K Tate-image hypothesis, E[p^m](K[n])=0 for the relevant ring-class towers and all m≥1. The residual case uses the generalized-dihedral nature of K[n]/Q and the irreducible two-dimensional image; bootstrap finite exponent using multiplication by p. In Zhang’s p≥5, essentially-surjective residual-image setting, prove likewise the G_K[n]-invariants of T_𝔭A_g/ϖ^M vanish for n∈𝒩 and M≥1, using the residual representation and the generalized-dihedral tower, then induction by multiplication by ϖ (Zhang §3.7, pp.212–213). The coefficient extension may be ramified; its residue field does not determine its integer ring. The trivial rank-two representation has an invariant space of dimension 2 and is excluded; at p=5 a full residual image contains 2·id, whose fixed-vector equation x=2x forces x=0. This statement is not implied by residual irreducibility for arbitrary field extensions.

([gross](#references), Lemma4.3, statement p.241 and proof p.242; Howard Lemma1.7.1 proof p.20.)

*Needs:* [Dihedral action on the tower](#06-dihedral-action-on-the-tower); ArithmeticGaloisRepresentations §§6.2, 6.4–6.4a Weil pairing, determinant and images.

### 4.4 Descended Heegner derivative class

Under the proved torsion-invariant vanishing, inflation–restriction gives res:H¹_cont(K,E[p^m])≃H¹_cont(K[n],E[p^m])^𝒢_n for m≤M(n). Define c_m(n) as res⁻¹ of the Kummer class of ˜P_n. For GL₂-type T=T_𝔭A_g use the same restriction isomorphism with T/ϖ^M and the actual differentiated Kummer class of §3.1, for M≤M(n), using the separate invariant-vanishing branch of §4.3. Denote this descended class by c_M(n)∈H¹_cont(K,T/ϖ^M T). At conductor one the integral class is the T-Kummer class of y_K, including its actual trace and unit denominator. Without invariant vanishing, keep the H¹/H² kernel/cokernel terms and use the separate error-tolerant EulerSystemsAndKolyvaginSystems Layers 3–4 construction; there is no unrestricted unique inverse.

The required API is:

- The descended class is the unique class whose restriction is the invariant differentiated Kummer class z.
- Its actual restriction equals z.
- Any class with restriction z equals the descended class.
- A commuting coefficient/restriction square carries the descended class to the class obtained by descending the reduced differentiated Kummer class.

**Checks.**

- The zero invariant differentiated Kummer class descends to zero.
- For the trivial field extension, restriction is the identity and the descended class is the Kummer class itself.
- For the zero map ℤ→ℤ, 0 and 1 have the same image. An additive equivalence cannot have that underlying map, so unique descent fails.

- On ℤ², let χ(x,y)=(x+y,y). The inverse image of κ=(0,1) is (−1,1), since χ(−1,1)=(0,1); forward application gives (1,1) and χ(1,1)=(2,1).

([gross](#references), §4 pp.242–243; Howard Lemmas1.7.1–1.7.2 p.20; Zhang(3.21) p.213.)

*Needs:* [Differentiated point invariance](#42-differentiated-point-invariance); [Vanishing of ring-class torsion invariants](#43-vanishing-of-ring-class-torsion-invariants); [Heegner Kummer classes](#31-heegner-kummer-classes); EulerSystemsAndKolyvaginSystems §§3.1–3.8 Kolyvagin derivatives and descent; ArithmeticGaloisDuality §R02.2.2 The low-degree sequence and the transgression.

### 4.5 Explicit cocycle and divisibility criterion

Choose p^mQ=˜P_n over the separable closure. The class c_m(n) is represented by σQ−Q−(σ˜P_n−˜P_n)/p^m, where the last quotient is the uniquely specified K[n]-rational division term under torsion vanishing. Hence c_m(n)=0 iff ˜P_n∈p^mE(K[n]); its image d_m(n) in H¹(K,E)[p^m] vanishes iff ˜P_n∈p^mE(K[n])+E(K), with descent interpreted through the actual restriction map.

([gross](#references), Explicit cocycle (4.6) and Proposition4.7, printed p.242; Howard Lemma1.7.2 p.20.)

*Needs:* [Descended Heegner derivative class](#44-descended-heegner-derivative-class); [Vanishing of ring-class torsion invariants](#43-vanishing-of-ring-class-torsion-invariants); [Heegner Kummer classes](#31-heegner-kummer-classes).

### 4.6 Bottom class is the trace Kummer class

At n=1, D_1=1 and the sum over 𝒢_1 gives `y_K=Tr_{K[1]/K}P_1.` Thus c_m(1)=δ_m(y_K) and the integral bottom class κ_1=δ_T(y_K), while d_m(1)=0. This is not δ(P_1) over K unless P_1 already descends.

([gross](#references), Definition(4.1), printed p.241, and note after Proposition4.7 p.242; Howard §1.7 p.20; Zhang(3.22) p.213.)

*Needs:* [Descended Heegner derivative class](#44-descended-heegner-derivative-class); [Heegner conductor coefficient ideal](#41-heegner-conductor-coefficient-ideal); [Heegner Kummer classes](#31-heegner-kummer-classes).

### 4.7 Generator change and intrinsic tensor coefficient

After tensoring with `G(n)=⊗_{ℓ|n}Gal(K[ℓ]/K[1]),` the Heegner derivative class has the prescribed EulerSystemsAndKolyvaginSystems Layer 3 generator-change transformation law; changing σ_ℓ to σ_ℓ^u changes the derivative class by the inverse unit factor modulo I_n and the cyclic tensor generator by the compensating factor. State compatibility with lift/coset choices separately. Do not assert raw scalar classes are generator-independent.

([howard](#references), Theorem1.7.5 pp.20–21; Gross §4 p.242.)

*Needs:* [Descended Heegner derivative class](#44-descended-heegner-derivative-class); EulerSystemsAndKolyvaginSystems §§3.1–3.8 Kolyvagin derivatives and descent; [Ring-class tower and finite Galois quotients](#05-ring-class-tower-and-finite-galois-quotients).

### 4.8 Coefficient reduction and auxiliary-prime restriction

For m′≤m≤M(n), reduction E[p^m]→E[p^m′] takes c_m(n) to c_m′(n) under the exact chosen division/Kummer conventions. For T_𝔭A_g use the reductions T/ϖ^M→T/ϖ^M′ for M′≤M≤M(n). If v_ϖ(p)=e, a p^m reduction requires M(n)≥em. Restricting the permitted auxiliary-prime set restricts the same family; adding primes extends the family only when the conductor/norm/reduction hypotheses and tensor factors are proved for them. No map removing a prime factor of n is assumed without the local system relation.

([zhang](#references), §3.7 pp.211–213; Howard §1.7 pp.19–21.)

*Needs:* [Descended Heegner derivative class](#44-descended-heegner-derivative-class); [Heegner conductor coefficient ideal](#41-heegner-conductor-coefficient-ideal); EulerSystemsAndKolyvaginSystems §§3.1–3.8 Kolyvagin derivatives and descent; EulerSystemsAndKolyvaginSystems §2.9 Anticyclotomic Euler systems over ring class fields.

### 4.9 Parity of the Heegner derivative class

For odd p and the clean classical branch, if ε is the Fricke eigenvalue of the eigenquotient, τc_m(n)=ε(−1)^ν(n)c_m(n); equivalently using the global root number w=−ε, this is w(−1)^(ν(n)+1). The torsion term from the basepoint/Fricke relation is removed only after its prime-to-p proof. At p=2 this formula does not yield an integral direct-sum eigenspace decomposition.

([gross](#references), Proposition5.4 pp.243–244; Zhang(3.24) p.213.)

*Needs:* [Parametrization choice, degree and torsion](#16-parametrization-choice-degree-and-torsion); [Descended Heegner derivative class](#44-descended-heegner-derivative-class); EulerSystemsAndKolyvaginSystems §§3.1–3.8 Kolyvagin derivatives and descent; [Archimedean Tate correction](#36-archimedean-tate-correction).


### 4.10 Heegner classes on the common residual representation

For Zhang’s data satisfying all three clauses of Hypothesis ♥, fix for each m∈𝒩′⁺ a level-raised form g_m and its Hecke-normalized point map. Let 𝕋_m act on J(X_m), let I be the eigenform kernel, A⁰_gm=J(X_m)/I J(X_m), and let 𝔪 be the kernel of 𝕋_m→k₀. Import the G_ℚ-equivariant multiplicity-one identifications J(X_m)[𝔪]≃V≃A⁰_gm[𝔭_m,0] of Zhang Lemma 3.3 from the level-raising contract. Construct c(n,m)∈H¹(K,V) from the actual Hecke-maximal-ideal Kummer class of the differentiated normalized point on A⁰_gm, using §§3.1 and 4.2–4.4 on that Hecke component and the imported identifications. This constructs the arithmetic class; an isomorphism of coefficient representations alone is not a class constructor (Zhang §3.9, (3.28)–(3.30), pp.214–215).

Prove that after extending k₀ to the residue field k of O_𝔭m the class equals the reduction c₁(n) of the O_𝔭m construction on the marked quotient; at m=1 this identifies the two original systems. This is a comparison of actual Kummer maps and normalized point maps, not descent of an arbitrary k-valued cohomology class. Zhang’s derivative convention through ℓ+1 and the supplier convention through ℓ differ by (ℓ+1)·1, so they give the same reduced classes by §4.1. Restriction, corestriction and every localization commute with the coefficient identifications; the scalar-extension comparison carries the finite and transverse conditions, including the local normalization factors used in Layer 6. Fix the isomorphisms and cyclic generators throughout. Replacing a marked identification by u times it multiplies the class and its localizations by u, not by 1; replacing the point map by a 𝔭-divisible map kills its residual classes and is excluded from the normalized construction.

The arithmetic comparison API is:

- The common k₀ class maps to the actual residue-coefficient class, with its fixed quotient, denominator and generator choices.
- Localization and scalar extension commute with this construction at every place; the norm and conjugation identities descend through the same marked maps.
- At m=1 the comparison recovers the residual system of §4.4; the higher-conductor and level-changing classes use the same normalization.

**Checks.**

- For k=k₀=𝔽₅, the scalar-extension map is the identity and sends the residual coefficient 1 to 1. Multiplication of a marking by 2 gives 2, so it changes the actual class even though it preserves its nonvanishing.
- For k₀=𝔽₅ and k=𝔽₂₅=𝔽₅[t]/(t²−2), the scalar class 1 extends to 1, whereas t∉𝔽₅ cannot descend as a scalar class on its own. A common residual representation is insufficient without the arithmetic comparison.
- In R=ℤ₅[ϖ], ϖ²=5, a class represented by ϖ in a free R-module reduces to 0 modulo ϖ, whereas 1 reduces to 1. A nonzero integral class or a ramified coefficient extension does not ensure residual nonvanishing.

*Needs:* [Heegner Kummer classes](#31-heegner-kummer-classes); [Differentiated point invariance](#42-differentiated-point-invariance); [Vanishing of ring-class torsion invariants](#43-vanishing-of-ring-class-torsion-invariants); [Descended Heegner derivative class](#44-descended-heegner-derivative-class); [Coefficient reduction and auxiliary-prime restriction](#48-coefficient-reduction-and-auxiliary-prime-restriction); [Quaternionic CM reduction and specialization](#27-quaternionic-cm-reduction-and-specialization); gap:zhang-level-raising for the coefficient identifications; SelmerIwasawaCohomology §2.12a abelian Kummer; EulerSystemsAndKolyvaginSystems §§3.1–3.8 for the single generic derivative construction.

### Examples

For p=5, a_19=10 and a_149=25, the conductor ideals are (5) and (25), so the two-prime ideal is (5). A mod-5 derivative class is defined at that support; reduction modulo 25 is not supplied by it. For a cyclic factor C₃ with generator s, D=s+2s² gives (s−1)D=2−s−s²=3−(1+s+s²), fixing the derivative sign (§§4.1–4.2).

### Dependencies

This layer uses the earlier internal targets specified in each *Needs:* sentence, the pinned algebraic APIs, and ArithmeticGaloisRepresentations, EulerSystemsAndKolyvaginSystems.

## Layer 5: Corrected local relations and arithmetic descent hypotheses

The raw derivative relation contains Howard's local correction automorphism. Construct that automorphism on the actual finite local coefficient module and verify its finite/singular comparison. A global correction needs the G_ℚ change-of-group action and its localization square: a local module automorphism alone does not define an action on global cocycles. The global compatibility is the named construction and localization target in §5.2. Verify Howard's H.0–H.5 and distinguish the clean arithmetic branch from local error terms; a Tamagawa defect is not erased by choosing a convenient Selmer carrier.

### 5.1 Transverse condition of the descended class

For ℓ|n an inert auxiliary prime under Howard’s odd-p clean hypotheses, the localization of c(n) restricts to zero over the specified totally ramified local ring-class extension K[n]_λ/K_λ. Thus it lies in the transverse condition used by EulerSystemsAndKolyvaginSystems Layer 1. Away from n it lies in the propagated finite local condition established in Layer 3. The p-odd identity `Σ_{i=1}^{ℓ}i=ℓ(ℓ+1)/2` enters the transverse proof and cannot be copied integrally at p=2.

([howard](#references), Lemma1.7.3 and proof, pp.20–21.)

*Needs:* [Explicit cocycle and divisibility criterion](#45-explicit-cocycle-and-divisibility-criterion); [Heegner reduction congruence](#26-heegner-reduction-congruence); [Component obstruction at bad places](#33-component-obstruction-at-bad-places); EulerSystemsAndKolyvaginSystems Layer 1 Auxiliary primes and finite–singular comparison.

### 5.2 Heegner finite–singular correction automorphism

At inert ℓ, define Howard’s automorphism χ_ℓ on T/I_ℓT through local reduction, projection to the p-primary subgroup, p^−M(a_ℓ−(ℓ+1)Fr_ℓ), and the canonical torsion lift. The valuation/cyclic Frobenius-eigenspace calculation proves it is invertible. With all chosen cyclic generators retained, χ_ℓ(κ_n(Fr_λ))=κ_nℓ(σ_ℓ) is the actual Heegner finite–singular relation. This is an arithmetic correction to EulerSystemsAndKolyvaginSystems Layer 1’s generic comparison, not an assertion that raw classes already form a strong system.

([howard](#references), §1.3 change of group, pp.8–9; Proposition1.7.4 and Theorem1.7.5, preprint p.21; published pp.1457–1458.)

*Needs:* [Transverse condition of the descended class](#51-transverse-condition-of-the-descended-class); [Heegner reduction congruence](#26-heegner-reduction-congruence); [Heegner conductor coefficient ideal](#41-heegner-conductor-coefficient-ideal); EulerSystemsAndKolyvaginSystems Layer 1 Auxiliary primes and finite–singular comparison. ArithmeticGaloisDuality §R02.2, continuous Galois change of group; EulerSystemsAndKolyvaginSystems §5.2, the conjugation action on self-dual triples.


Construct the global correction on H¹(K,T/I_nT) by the actual G_ℚ change-of-group action attached to E/ℚ, with localization into the product of conjugate local cohomology groups. Prove the finite–singular localization square with the cyclic tensor action included: conjugation also inverts a tame generator, so its action on finite and transverse coordinates must be computed separately. The correction must preserve the propagated Selmer conditions used in §5.5. A local coefficient matrix is not asserted to act on global cocycles by postcomposition. Its API is:

- Localization agrees with the specified finite–singular correction.
- Corrections at distinct auxiliary primes commute.
- Cyclic generator change agrees with the compensating tensor coefficient.

**Checks.**

- An identity correction leaves the descended class unchanged.
- If the correction is negation, the corrected scalar class has the opposite sign; the inverse map is used before tensoring.
- A non-G_K-linear local matrix cannot act on global cocycles by postcomposition; the actual global change-of-group map and localization square are required.
- Over 𝔽₅, on a coefficient vector fixed by Fr_ℓ with ℓ≡−1 modulo 5, conjugation fixes its finite unramified evaluation but negates its transverse evaluation, because it inverts the tame generator. Conjugation also negates the cyclic tensor generator, so the transverse tensor has two minus signs and is fixed. The finite and transverse squares therefore require their separate actions.

### 5.3 Corrected Heegner Kolyvagin system

For the actual descended Heegner family κ_n, construct commuting global cohomology automorphisms χ_ℓ inducing the specified local Howard correction. Let `χ_n=∏_{ℓ|n}χ_ℓ.` Define κ′_n=χ_n⁻¹(κ_n)⊗σ_n in the cyclic tensor target. Then κ′ satisfies the strong EulerSystemsAndKolyvaginSystems Layers 1 and 3 edge relation and κ′_1=κ_1, so κ′ is a Kolyvagin system for the Selmer triple (T,F,𝓛) in the sense of EulerSystemsAndKolyvaginSystems §5.2 Howard’s self-dual Selmer triples and hypotheses H.0–H.5 (Howard Definition1.2.3 and Theorem1.7.5). A local non-G_K-linear coefficient automorphism alone cannot be postcomposed with global cocycles; a legitimate change-of-group action and its localization comparison must be supplied.

The required API is:

- κ′=χ⁻¹κ for the proved global additive automorphism χ; the cyclic tensor is retained in the supplied target.
- κ′ is evaluation of the inverse of χ at κ.
- χ(κ′)=κ.
- For commuting χ,ψ, correction by their product equals successive correction by ψ then χ.

**Checks.**

- At the empty conductor χ_1=id, so the bottom class is unchanged.
- The zero class remains zero under correction.
- For χ equal to negation on ℤ and κ=3, the corrected class is −3.

- On ℤ², let χ(x,y)=(x+y,y). The inverse image of κ=(0,1) is (−1,1), since χ(−1,1)=(0,1); forward application gives (1,1) and χ(1,1)=(2,1).

([howard](#references), Theorem1.7.5 pp.20–21 and published p.1458.)

*Needs:* [Heegner finite–singular correction automorphism](#52-heegner-finitesingular-correction-automorphism); [Generator change and intrinsic tensor coefficient](#47-generator-change-and-intrinsic-tensor-coefficient); EulerSystemsAndKolyvaginSystems §§3.1–3.8 Kolyvagin derivatives and descent; EulerSystemsAndKolyvaginSystems §5.2 Howard’s self-dual Selmer triples and hypotheses H.0–H.5.

### 5.4 Tate coefficient and big-image hypotheses

Under Howard TheoremA’s full G_K→GL₂(Z_p) surjectivity, p odd and p∤DN, T=T_pE is free rank two (H0), T/pT is absolutely irreducible (H1), and the auxiliary extension F/Q containing K used in H2 trivializes T and has H¹(F(μ_p∞)/K,T/pT)=0. The central scalar subgroup of order p−1 kills this cohomology. Full Tate-image surjectivity is stronger than residual irreducibility or residual surjectivity and is stated separately. H.0–H.2 are those of the hypothesis record EulerSystemsAndKolyvaginSystems §5.2 Howard’s self-dual Selmer triples and hypotheses H.0–H.5.

([howard](#references), H.0–H.2 pp.8–9, Theorem1.6.5 proof pp.18–19.)

*Needs:* [Vanishing of ring-class torsion invariants](#43-vanishing-of-ring-class-torsion-invariants); EllipticCurves Layer 2, “Torsion, the Weil pairing, and the Tate module”; ArithmeticGaloisDuality R02.2; EulerSystemsAndKolyvaginSystems §5.2 Howard’s self-dual Selmer triples and hypotheses H.0–H.5.


**Checks.**

- Full GL₂(ℤ_p) image implies the required residual irreducibility and nontrivial coinvariant test element.
- The trivial rank-two representation has two-dimensional invariants and fails the irreducibility hypothesis.
- A CM Tate representation over its endomorphism field is character-split and cannot satisfy the full GL₂ hypothesis; it uses Layer 7’s separate descent.

### 5.5 Cartesian, self-dual and conjugation local conditions

For the same actual T, verify H3 cartesian propagation at every quotient of the DVR, H4 the symmetric twisted Weil pairing (s,t)=e(s,τt) and exact orthogonality at conjugate places, and H5 extension of the residual representation to G_Q with one-dimensional τ± eigenspaces, G_Q-stability of local conditions and the required pairing/conjugation identity. Use the rational finite local conditions and their exact integral/torsion propagation; the hypothesis record H.0–H.5 is EulerSystemsAndKolyvaginSystems §5.2 Howard’s self-dual Selmer triples and hypotheses H.0–H.5, with the abstract theorem consumed from that supplier.

([howard](#references), H.3–H.5 pp.8–9, Theorem1.6.5 proof pp.18–19.)

*Needs:* [Tate coefficient and big-image hypotheses](#54-tate-coefficient-and-big-image-hypotheses); [Kummer condition at the coefficient prime](#34-kummer-condition-at-the-coefficient-prime); [Saturated integral Kummer comparison](#35-saturated-integral-kummer-comparison); EulerSystemsAndKolyvaginSystems §5.2 Howard’s self-dual Selmer triples and hypotheses H.0–H.5; SelmerIwasawaCohomology §§2.13–2.20 Dual Selmer structures, local duality and Poitou–Tate; SelmerIwasawaCohomology §2.6 From V to T and W; saturation; SelmerIwasawaCohomology §§2.13–2.17, duality and integral local duality.


**Checks.**

- At an unramified auxiliary prime the finite and transverse conditions are self-dual under the specified pairing.
- At a bad prime with a nonzero p-component defect the propagated integral condition need not equal the rational unramified lattice.
- At p=2 the projectors (1±τ)/2 need not be integral; the odd-p self-dual argument cannot erase that correction.


### 5.7 Heegner class detection by auxiliary primes

Use EulerSystemsAndKolyvaginSystems §1.6 with L=K(E[p]) and a finite 𝔽_p-Selmer subspace S: its evaluation pairing identifies Gal(L_S/L) with Hom_𝔽p(S,E[p]) under Gross’s full residual-image hypotheses. Set M=L_S and let I be the subgroup fixing the Kummer field generated by a pth division point of the actual y_K. For τ acting on Gal(M/L), the square (τh)² detects the positive component used by Gross. Chebotarev primes whose Frobenius is the prescribed class of τh are inert auxiliary primes, avoid any specified finite set, and their localizations detect the corresponding evaluation annihilator. To detect a second independent class, use the correctly formed composite and the proved disjointness of its Kummer field.

([gross](#references), Propositions9.5–9.6 and Claims10.1/10.3, pp.251–254.)

*Needs:* EulerSystemsAndKolyvaginSystems §1.6, the residual Kummer-field evaluation pairing; EulerSystemsAndKolyvaginSystems Layer 1 Auxiliary primes and finite–singular comparison; Chebotarev Layer 10, “Dirichlet-density Chebotarev”.

### 5.8 Arithmetic local error lengths

For the actual Heegner Tate representation, compare EulerSystemsAndKolyvaginSystems Layer 4’s restriction/invariant/local-condition errors with p-primary local torsion, the p-part of the Néron component group, and the index of the integral finite/ordinary lattice. Record each finite kernel/cokernel as a separate length or annihilator constant. Equality with an error-free theorem requires the relevant quantities to vanish, not just the global residual image hypothesis.

([howard](#references), §1.1 pp.5–8; Gross Proposition6.2 pp.244–247.)

*Needs:* [Component obstruction at bad places](#33-component-obstruction-at-bad-places); [Kummer condition at the coefficient prime](#34-kummer-condition-at-the-coefficient-prime); [Saturated integral Kummer comparison](#35-saturated-integral-kummer-comparison); EulerSystemsAndKolyvaginSystems §§4.13, 4.18–4.19 All-prime descent and uniform errors; NeronModelsAndSemistableAbelianVarieties §§1.2, 2.2, 2.6; NeronModelsAndSemistableAbelianVarieties Layer 2 special fibres and component groups; SelmerIwasawaCohomology §2.15 Finite against unramified classes at bad primes.

### 5.9 Tamagawa and local torsion obstruction examples

For a split Tate curve over a local field of residue characteristic ℓ≠p with parameter q, its component group has order v(q); choose v(q)=p to get a nonzero p-component defect. If the same local field contains μ_p, the Tate uniformization supplies nonzero local E[p] even with a prime-to-p component order (for example v(q)=1). These distinct examples must fail the corresponding error-free local hypotheses. Neither local phenomenon follows or disappears from a global residual-irreducibility label.

([zhang](#references), §6.3 pp.228–229, local monodromy/Tamagawa description.)

*Needs:* EllipticCurves Layer 4, “Elliptic curves over local fields”; [Arithmetic local error lengths](#58-arithmetic-local-error-lengths).


### Examples

A split Tate curve with parameter of valuation 5 has component order 5. Over a field containing μ₅, valuation 1 instead gives component order 1 but still supplies local 5-torsion. The component and local-torsion errors are therefore separate. For the shear χ(x,y)=(x+y,y), correction of (0,1) is χ⁻¹(0,1)=(−1,1), fixing the inverse convention (§§5.3, 5.8–5.9).

### Dependencies

This layer uses the earlier internal targets specified in each *Needs:* sentence, the pinned algebraic APIs, and EllipticCurves, EulerSystemsAndKolyvaginSystems, NeronModelsAndSemistableAbelianVarieties.

## Layer 6: Finite descent, residual support and indivisibility

There are two related but distinct endpoints. Howard and Gross give the clean elliptic rank-one conclusions, with an index inequality unless primitivity is established. Zhang works over the residue field of a GL₂-type newform, using level raising, residual local reciprocity, rank lowering, special values and an independent period identity. Vanishing order and base locus organize the residual induction; they do not replace the actual Heegner relations. Prove the independent period and cyclotomic rank-zero inputs before the final indivisibility theorem.

### 6.1 Howard’s Heegner rank-one theorem

Assume E/Q conductor N, imaginary quadratic K discriminant D≠−3,−4 with all N-primes split, p odd, p,D,N pairwise coprime, and full Tate representation G_K→GL₂(Z_p) surjective. If the actual bottom Heegner Kummer class κ_1≠0, the compact Selmer group is free rank one and the discrete Selmer group is Q_p/Z_p⊕M⊕M for a finite Z_p-module M with length M≤length(H¹_F(K,T_pE)/Z_pκ_1). This is Howard TheoremA after the actual arithmetic H0–H5 checks and corrected system construction; the abstract self-dual theorem is EulerSystemsAndKolyvaginSystems §5.10 Howard’s bound for self-dual Kolyvagin systems over a discrete valuation ring (Howard Theorem1.6.1).

([howard](#references), TheoremA pp.1–2, Theorem1.6.5 pp.18–19.)

*Needs:* [Corrected Heegner Kolyvagin system](#53-corrected-heegner-kolyvagin-system); [Tate coefficient and big-image hypotheses](#54-tate-coefficient-and-big-image-hypotheses); [Cartesian, self-dual and conjugation local conditions](#55-cartesian-self-dual-and-conjugation-local-conditions); [Saturated integral Kummer comparison](#35-saturated-integral-kummer-comparison); EulerSystemsAndKolyvaginSystems §5.10 Howard’s bound for self-dual Kolyvagin systems over a discrete valuation ring.

### 6.2 Opposite Selmer eigenspace vanishing

Let E/ℚ be non-CM of conductor N, let K have D_K≠−3,−4 with every N-prime split, and let p be odd with Gal(ℚ(E[p])/ℚ)=GL₂(𝔽_p) and y_K∉pE(K), for the fixed cusp-normalized trace. Then the ε-opposite Selmer eigenspace is zero. Choose a prime using the actual Kummer field M and positive component outside I. Its d(ℓ) is locally nonzero and supported only at λ; global reciprocity forces every Selmer class in that eigenspace to localize to zero. The Kummer-field annihilator calculation then forces the global eigenspace to vanish.

([gross](#references), Proposition8.2 pp.249–250; Claim10.1 pp.252–253.)

*Needs:* [Heegner class detection by auxiliary primes](#57-heegner-class-detection-by-auxiliary-primes); [Parity of the Heegner derivative class](#49-parity-of-the-heegner-derivative-class); EulerSystemsAndKolyvaginSystems Layer 1 Auxiliary primes and finite–singular comparison; SelmerIwasawaCohomology §§2.13–2.20 Dual Selmer structures, local duality and Poitou–Tate; [Component obstruction at bad places](#33-component-obstruction-at-bad-places); [Explicit cocycle and divisibility criterion](#45-explicit-cocycle-and-divisibility-criterion); [Heegner reduction congruence](#26-heegner-reduction-congruence).

### 6.3 Same Selmer eigenspace generation

For E,K,p and the nonzero trace Kummer class under the full residual-image hypotheses of §6.2, the remaining Selmer eigenspace equals 𝔽_p·δ(y_K). If a second independent class existed, choose the first auxiliary prime with nonzero local Heegner derivative and form its Kummer extension L′. Prove L′ is disjoint from the Selmer field over L in the relevant character, then choose a second simultaneous Frobenius in the composite. The finite/singular relation and reciprocity force incompatible localizations, so the second class cannot exist.

([gross](#references), Claim10.3 and proof, pp.253–254.)

*Needs:* [Opposite Selmer eigenspace vanishing](#62-opposite-selmer-eigenspace-vanishing); [Heegner class detection by auxiliary primes](#57-heegner-class-detection-by-auxiliary-primes); [Parity of the Heegner derivative class](#49-parity-of-the-heegner-derivative-class); EulerSystemsAndKolyvaginSystems Layer 1 Auxiliary primes and finite–singular comparison; SelmerIwasawaCohomology §§2.13–2.20 Dual Selmer structures, local duality and Poitou–Tate; [Explicit cocycle and divisibility criterion](#45-explicit-cocycle-and-divisibility-criterion); [Bottom class is the trace Kummer class](#46-bottom-class-is-the-trace-kummer-class).

### 6.4 Gross’s clean mod-p descent

Assume E/ℚ is non-CM of conductor N, K has D_K≠−3,−4 with all N-primes split, the cusp-normalized trace y_K is fixed, p is odd, Q(E[p])/Q has full GL₂(F_p) group, and y_K∉pE(K). Then Sel_p(E/K) is the cyclic F_p-space generated by δ(y_K), rank E(K)=1 and Sha(E/K)[p]=0. This clean theorem requires neither p∤N nor full p-adic surjectivity as an extra hypothesis; do not replace its hypothesis table with Howard’s.

([gross](#references), Propositions2.1/2.3 pp.237–238, Claims10.1/10.3 pp.252–254.)

*Needs:* [Heegner class detection by auxiliary primes](#57-heegner-class-detection-by-auxiliary-primes); [Bottom class is the trace Kummer class](#46-bottom-class-is-the-trace-kummer-class); [Component obstruction at bad places](#33-component-obstruction-at-bad-places); [Opposite Selmer eigenspace vanishing](#62-opposite-selmer-eigenspace-vanishing); [Same Selmer eigenspace generation](#63-same-selmer-eigenspace-generation); EllipticCurves Layer 7, “Selmer groups and Sha”; EllipticCurves Layer 6, “The Mordell–Weil theorem”.

### 6.5 Sha square-index bound

Under the hypotheses of §6.1 with non-torsion y_K, the finite p-primary Sha group is the paired finite part of the discrete Selmer group. Thus length_Zp Sha[p∞]≤2·length_Zp(E(K)⊗Z_p/Z_py_K), after proving the exact integral Kummer-lattice identification. Equivalently its order divides the p-part of the square of the corresponding finite index. If a local or parametrization defect is present, insert its proved error term before this comparison.

([howard](#references), Introduction, finite/p-adic Kummer exact sequences and TheoremA, PDF pp.1–2.)

*Needs:* [Howard’s Heegner rank-one theorem](#61-howards-heegner-rank-one-theorem); [Saturated integral Kummer comparison](#35-saturated-integral-kummer-comparison); [Arithmetic local error lengths](#58-arithmetic-local-error-lengths).

### 6.6 Primitivity and sharpness comparison

A nonzero κ_1 yields an upper bound, not equality. Residual primitivity of the actual corrected system, when both the Selmer triple and its Tate dual satisfy H.0–H.5, p≥5 and the allowed prime set contains L_s for some s≥1, gives the corresponding equality of finite length and corrected index (Zanarella Theorem2.3.6). Scaling the parametrization/system by p preserves non-torsion but increases the leading-class index, so cannot preserve an unsupported sharpness assertion. Zhang’s indivisibility conclusion proves a stronger property only under its enumerated hypotheses.

([howard](#references), TheoremA, PDF pp.1–2 (upper bound, not a primitivity equality); [zhang](#references), Theorem9.3 p.243; §10 pp.245–246; [zanarella](#references), Theorem2.3.6, with Definition2.3.2 and Proposition2.3.3, arXiv v1 pp.19–20.)

*Needs:* [Howard’s Heegner rank-one theorem](#61-howards-heegner-rank-one-theorem); [Parametrization choice, degree and torsion](#16-parametrization-choice-degree-and-torsion); EulerSystemsAndKolyvaginSystems §§5.2, 5.10–5.13 Self-dual hypotheses, bound, rigidity and length; EulerSystemsAndKolyvaginSystems §5.10 Howard’s bound for self-dual Kolyvagin systems over a discrete valuation ring; EulerSystemsAndKolyvaginSystems §§5.1, 5.12 Divisibility indices and profile.

### 6.7 Zhang’s Heegner congruence after level raising

Let g,K,p satisfy Zhang’s Notations and Hypothesis♥, with m∈𝒩′⁺ and distinct admissible q₁,q₂∤m. Fix the residual V over k₀, matched optimal embeddings and derivative generators. Then loc_q₁ c(n,m) lies in H¹(K_q₁,k₀) and loc_q₂ c(n,mq₁q₂) in H¹(K_q₂,k₀(1)); under fixed identifications with k₀ the two are equal up to a fixed nonzero scalar. The generic level-raising, definite/indefinite Jacquet–Langlands, multiplicity-one and Ihara statements are imported.

([zhang](#references), Theorem4.3 and proof, pp.218–221; Lemma3.3 p.215; [zhang](#references), §2, Theorem2.1 and proof, pp.203–204; (4.7)–(4.9), pp.218–219.)

*Needs:* [Heegner classes on the common residual representation](#410-heegner-classes-on-the-common-residual-representation); [Quaternionic CM reduction and specialization](#27-quaternionic-cm-reduction-and-specialization); [Descended Heegner derivative class](#44-descended-heegner-derivative-class); SerreWeightAndLevelOptimisation §§1.1–1.3 Level-changing algebra and cohomology; §2.4 Diamond’s level-raising criterion; gap:zhang-level-raising; GL2AutomorphicRepresentationsAndTransfer R17.3/global-jl; SerreWeightAndLevelOptimisation §2.4 Diamond’s level-raising criterion; GL2AutomorphicRepresentationsAndTransfer R17.3/multiplicity-one; HilbertModularVarietiesAndShimuraCurves R18.3.

### 6.8 Heegner rank lowering through an admissible prime

Under Zhang Hypothesis♥, local Selmer conditions for g and its admissible level-raised g′ have k₀-rational structures agreeing away from q. At q they are the finite k₀ line and the singular k₀(1) line respectively. If loc_q on the rational residual Selmer group is nonzero, it is surjective and the raised Selmer group is its kernel, so its dimension decreases by one. Hypothesis♥(3) requires H¹(Q_ℓ,V)=V^GQℓ=0 at ℓ²|N+; for elliptic E and p≥5 the additive-reduction argument verifies this. Do not apply the ℓ≠p Euler characteristic formula at ℓ=p.

([zhang](#references), Lemma5.1, Theorem5.2, Proposition5.4, pp.222–225.)

*Needs:* [Zhang’s Heegner congruence after level raising](#67-zhangs-heegner-congruence-after-level-raising); [Kummer condition at the coefficient prime](#34-kummer-condition-at-the-coefficient-prime); SelmerIwasawaCohomology §§2.13–2.20 Dual Selmer structures, local duality and Poitou–Tate; EulerSystemsAndKolyvaginSystems Layer 1 Auxiliary primes and finite–singular comparison.

### 6.9 Auxiliary rank-zero formula over K

For a weight-two newform g and its GL₂-type A_g/Q with coefficient prime 𝔭|p≥3, K as in Zhang’s Notations with p∤D_K, good ordinary p, residual image containing SL₂(F_p), and a residually ramified ℓ||N, L(g/K,1)≠0 iff Sel_𝔭∞(A_g/K) is finite. When finite, v_𝔭(L(g/K,1)/Ω_g^can)=length_O𝔭 `Sel_𝔭∞(A_g/K)+Σ_{ℓ|N}t_g(ℓ).` This is over A_g/K, not E/Q. It is derived from the rank-zero formula over Q for g and for its quadratic twist g_K (Skinner TheoremB) and the GL₂-type period comparison. That formula follows, by control at the trivial character, from the ordinary main conjecture in its Skinner–Urban form with Kato’s divisibility. These inputs need residual irreducibility and the residually ramified ℓ||N, and no image containing SL₂(Z_p).

([zhang](#references), Theorem7.1 and proof, pp.231–232; [skinner](#references), Introduction, TheoremB, arXiv v1 p.2; §2.5, discussion after Theorem2.5.2, pp.15–16; §3.2, pp.20–21.)

*Needs:* ModularIwasawaMainConjectures §§1.3, 1.7 Skinner–Urban and multiplicative reduction; gap:gl2-integral-rank-zero; KatoEulerSystems §§6.6, 7.4, 7.7 Elliptic lattice, ordinary divisibility and control; KatoEulerSystems §7.4 Elliptic ordinary and multiplicative divisibility; gap:gl2-integral-rank-zero; SelmerIwasawaCohomology Layer 4 Finite conditions and arithmetic applications; GrossZagierAndArithmeticHeights Layer 0 Normalization and character conventions.

### 6.10 Jochnowitz unit criterion

For g as in Zhang’s Notations satisfying Hypothesis♥, with N− squarefree and ν(N−) even, and an admissible q, the Heegner bottom class is locally nonzero at q iff L^alg(g′/K,1) is a 𝔭′-adic unit. Here g′ is the chosen raised form, Ω_g′^can=〈g′,g′〉_Pet/η_g′(Nq), ξ_g′ is the norm of the integral primitive definite eigenfunction, η_g′,N+,N−q=η_g′(Nq)/ξ_g′, and L^alg=L/Ω^can·η_ratio⁻¹. Its integrality/unit status is proved by the explicit Waldspurger/Gross formula, not built into a definition.

([zhang](#references), §6.1–6.4, pp.226–231, Corollary6.2 and Theorem6.5.)

*Needs:* [Zhang’s Heegner congruence after level raising](#67-zhangs-heegner-congruence-after-level-raising); GrossZagierAndArithmeticHeights Layer 5 Coherent theta lifting and central values; GL2AutomorphicRepresentationsAndTransfer R17.3/global-jl; GL2AutomorphicRepresentationsAndTransfer R17.3/multiplicity-one; HilbertModularVarietiesAndShimuraCurves R18.3; SerreWeightAndLevelOptimisation §§1.1–1.3 Level-changing algebra and cohomology; §2.4 Diamond’s level-raising criterion; gap:zhang-level-raising.

### 6.11 Ribet–Takahashi period and Tamagawa comparison

For g of weight2 and trivial nebentypus, p≥5 with p∤ND_K and surjective ρ_g,𝔭:G_Q→GL₂(k₀), K as in Zhang’s Notations, N⁻ squarefree of odd prime count, and all three clauses of Hypothesis♥, let η_g(N) be the full-level Hecke congruence ideal generator and ξ_g(N⁺,N⁻) the pairing norm of a primitive integral definite quaternionic eigenfunction. The period ratio is η_g,N⁺,N⁻=η_g(N)/ξ_g(N⁺,N⁻), not the raw congruence ideal. Then `v_𝔭(η_g,N⁺,N⁻)=Σ_{ℓ|N⁻}t_g(ℓ),` where t_g(ℓ)=length_O𝔭 Φ(A_g/K_ℓ)_𝔭. Prove this independent period identity before applying the rank-zero and Jochnowitz arguments; its proof uses the stated congruence-module and component-group comparisons and does not use Zhang’s final indivisibility theorem. K_ℓ is the unramified quadratic extension of Q_ℓ, since ℓ|N⁻ is inert in K, so t_g(ℓ) is the length of the geometric component group and not of its Q_ℓ-rational points. For nonsquarefree N require Ram(ρ)≠∅ and either a ramified ℓ||N⁻ or at least two primes ℓ||N⁺, as in ♥(2). The last clause does not itself assert residual ramification of both primes. At split additive ℓ²|N⁺, ♥(3) and finite-residue cohomology eliminate the rational component factor; decomposition-invariant vanishing is not inertia-invariant vanishing.

([zhang](#references), Theorem6.4 and proof, pp.229–230; §7.2 p.233; [pollack-weston](#references), §§6.2–6.5, preprint pp.18–21: Theorem6.2, Propositions6.3–6.7 and Theorem6.8.)

*Needs:* NeronModelsAndSemistableAbelianVarieties §§4.3–4.6; GrossZagierAndArithmeticHeights Layer 3 Hodge classes, realizations and differential constants.

### 6.12 Heegner-system vanishing order

For the actual residual Heegner family κ={c(n):n∈𝒩}, define ν(κ)=min{#prime divisors of n:n∈𝒩,c(n)≠0}, valued in ℕ∪{∞}, with ν(0)=∞. The count is of distinct primes in the squarefree conductor, not multiplicity or number of nonzero classes. This is Zhang’s finite-residual support invariant, distinguished from the p-adic divisibility sequence M_r and its M∞.

Use the actual residual Heegner system and its localization maps.

The required API is:

- The infimum of the distinct-prime count of a conductor n∈𝒩 with c(n)≠0, with empty infimum ∞.
- It is sInf{v:ℕ∞:∃n∈𝒩,c(n)≠0 and v=#prime divisors(n)}.
- If 1∈𝒩 and c(1)≠0, ν(κ)=0.
- Families with the same zero/nonzero support on 𝒩 have the same vanishing order.

**Checks.**

- The empty conductor-index set has vanishing order ∞.
- A nonzero conductor-one class has vanishing order zero.
- A family supported only at squarefree conductor 6 has vanishing order two.

([zhang](#references), Definition8.3, published p.236, PDF46; Lemma8.4 and proof pp.236–239.)

*Needs:* [Heegner classes on the common residual representation](#410-heegner-classes-on-the-common-residual-representation); [Descended Heegner derivative class](#44-descended-heegner-derivative-class); EulerSystemsAndKolyvaginSystems Layer 1 Auxiliary primes and finite–singular comparison; `Nat.primeFactorsList` (Mathlib).

### 6.13 Heegner-system base locus

For the actual family and localization maps, B(κ) is the set of primes ℓ∤D_KNp such that loc_ℓc(n)=0 for every n∈𝒩. These are arbitrary good primes, not only Kolyvagin primes. The dependent local cohomology carriers may vary with ℓ. This locus determines exactly which local conditions are relaxed in Zhang Lemma8.4.

Use the actual residual Heegner system and its localization maps.

The required API is:

- The good primes outside D_KNp with all actual Heegner-class localizations zero.
- ℓ∈B iff ℓ is prime, ℓ∤D_KNp, and every n∈𝒩 has loc_ℓc(n)=0.
- If the localizations of two families agree at every good prime and conductor in 𝒩, their base loci agree.
- The zero family has every prime outside D_KNp in its base locus.

**Checks.**

- For the zero class family, membership is exactly primality and prime-to-D_KNp.
- One nonzero localization at a conductor n∈𝒩 excludes that prime from the locus.
- The coefficient prime p is never in the locus; in particular 5 is excluded when p=5 even if all classes vanish.

([zhang](#references), Definition8.3, published p.236, PDF46; Lemma8.4 and proof pp.236–239.)

*Needs:* [Heegner classes on the common residual representation](#410-heegner-classes-on-the-common-residual-representation); [Descended Heegner derivative class](#44-descended-heegner-derivative-class); EulerSystemsAndKolyvaginSystems Layer 1 Auxiliary primes and finite–singular comparison; `Nat.primeFactorsList` (Mathlib).


### 6.15 Residual Heegner reciprocity

Let g be a weight-two newform of trivial nebentypus, K imaginary quadratic with (D_K,N)=1, N=N⁺N⁻ with N⁻ squarefree of even prime count, and p≥5, p∤ND_K, good ordinary for g. Let k₀ be the finite field generated by the residual Hecke eigenvalues, V its two-dimensional representation, with ρ:G_Q→GL₂(k₀) surjective and A_g[𝔭]≃V⊗k₀k; impose all three clauses of Hypothesis♥. The actual k₀-rational derivative classes c(n) satisfy c(n)_v∈H¹_fin(K_v,V) for v∤n, c(n)_ℓ∈H¹_tr(K_ℓ,V) for ℓ|n, and c(nℓ)_ℓ=ψ_ℓ(c(n)_ℓ) when ℓ∤n, where ψ_ℓ:H¹_fin≃H¹_tr is the normalized finite/transverse comparison. Conjugation acts on c(n) by ε_n=w_g(−1)^(ν(n)+1), where w_g is Zhang’s root number convention. All bad places and v|p use the actual Kummer condition; the relation is not inferred from Howard’s elliptic full-Tate-image correction.

([zhang](#references), §8.1, equation(8.1), printed p.235; equation(3.24), printed p.213.)

*Needs:* [Heegner classes on the common residual representation](#410-heegner-classes-on-the-common-residual-representation); EulerSystemsAndKolyvaginSystems §1.16, residual local pairing; [Zhang’s Heegner congruence after level raising](#67-zhangs-heegner-congruence-after-level-raising); [Quaternionic CM reduction and specialization](#27-quaternionic-cm-reduction-and-specialization); [Descended Heegner derivative class](#44-descended-heegner-derivative-class); EulerSystemsAndKolyvaginSystems §§3.1–3.8 Kolyvagin derivatives and descent.


### 6.18 Triangular Heegner Selmer basis

Let g be a weight-two newform with trivial nebentypus, K imaginary quadratic with (D_K,N)=1, N=N⁺N⁻ with N⁻ squarefree of even prime count, and p≥5 good ordinary with p∤ND_K. Let k₀ be the residual eigenvalue field, V its two-dimensional representation with ρ:G_ℚ→GL₂(k₀) surjective, and A_g[𝔭]≃V⊗k₀k. Impose all three clauses of Hypothesis ♥ and assume the actual residual Heegner system κ_g is nonzero. Let ν=min{ν(n):c(n)≠0}, ε_ν=w_g(−1)^(ν+1) and B(κ) its base locus of vanishing localizations away from DKNp. The ε_ν Selmer eigenspace has dimension ν+1 and a triangular basis of ν+1 actual c(n_i), detected at selected 2ν+1 auxiliary primes. The opposite eigenspace has dimension ≤ν. Relaxing at the base locus does not enlarge the first eigenspace and preserves that opposite bound.

([zhang](#references), Lemma8.4 and proof, pp.236–239.)

*Needs:* [Heegner classes on the common residual representation](#410-heegner-classes-on-the-common-residual-representation); [Zhang’s Heegner congruence after level raising](#67-zhangs-heegner-congruence-after-level-raising); EulerSystemsAndKolyvaginSystems Layer 1 Auxiliary primes and finite–singular comparison; [Heegner-system vanishing order](#612-heegner-system-vanishing-order); [Heegner-system base locus](#613-heegner-system-base-locus); SelmerIwasawaCohomology §§2.13–2.20 Dual Selmer structures, local duality and Poitou–Tate; [Residual Heegner reciprocity](#615-residual-heegner-reciprocity); EulerSystemsAndKolyvaginSystems §1.16(a), simultaneous residual prime detection; EulerSystemsAndKolyvaginSystems §1.16(b), classes with prescribed ramification.

### 6.19 Zhang’s Heegner indivisibility theorem

Assume E/Q conductor N, K imaginary quadratic with gcd(D_K,N)=1, N− squarefree with even number of prime factors, full residual GL₂(F_p) image, p≥5 good ordinary and p∤D_KN. Hypothesis♠ requires residual ramification at every ℓ||N+ and every ℓ|N− with ℓ≡±1 mod p; if N is nonsquarefree require a nonempty Ram set and either a ramified ℓ||N− or at least two factors ℓ||N+. For the (ℤ,p)-optimal quotient and p-integral Hecke normalization specified in Conventions, c_1(n)≠0 for some squarefree Kolyvagin conductor n, so M∞=0. A p-divisible rescaling of this family has a different integral divisibility profile. For the auxiliary GL₂-type forms use the stronger Hypothesis♥, including the additive-prime local invariant vanishing.

**Checks.**

- At p=5 a normalized residual class of value 1 remains nonzero, whereas scaling the entire point map by 5 makes every residual class zero. The latter family cannot satisfy the same indivisibility conclusion.
- Rescaling by the unit 2 carries that value to 2≠0 in 𝔽₅ and preserves residual nonvanishing. A denominator of 3 is also a unit and has inverse 2 modulo 5.
- A quotient with Tate image not contained in 5T is primitive at 5; postcomposing it with multiplication by 5 puts its image in 5T and fails the normalization hypothesis.

([zhang](#references), Theorems1.1,9.1–9.3 and proofs, pp.195,240–243; §3.7, (3.20), p.211.)

*Needs:* [Heegner rank lowering through an admissible prime](#68-heegner-rank-lowering-through-an-admissible-prime); [Auxiliary rank-zero formula over K](#69-auxiliary-rank-zero-formula-over-k); [Jochnowitz unit criterion](#610-jochnowitz-unit-criterion); [Ribet–Takahashi period and Tamagawa comparison](#611-ribettakahashi-period-and-tamagawa-comparison); [Triangular Heegner Selmer basis](#618-triangular-heegner-selmer-basis).


### Examples

If the free bottom index has p-valuation 3, Howard’s bound allows paired finite length at most 6. A primitive system gives the corresponding equality; multiplying the point family by p changes the bottom index to valuation 4 without changing Sha. For a residual system of vanishing order ν=1, the triangular-basis conclusion gives preferred dimension 2, opposite dimension at most 1 and 3 detecting primes (§§6.1, 6.5–6.6, 6.18).

### Dependencies

This layer uses the earlier internal targets specified in each *Needs:* sentence, the pinned algebraic APIs, and EllipticCurves, EulerSystemsAndKolyvaginSystems, GL2AutomorphicRepresentationsAndTransfer, GrossZagierAndArithmeticHeights, HilbertModularVarietiesAndShimuraCurves, KatoEulerSystems, ModularIwasawaMainConjectures, NeronModelsAndSemistableAbelianVarieties, SerreWeightAndLevelOptimisation.

## Layer 7: Exceptional primes, CM and RM descent

A non-torsion trace and open-image inputs remove all but finitely many primary components. The remaining primes require integral image and evaluation bounds, component errors and a two-prime descent that works without dividing by two. In the RM context fixed above, keep C₀ for point divisibility, C₁ for components, C₂ for homothety/restriction, C₃ for matrix evaluation and C₆ for polarization degree. For the trivial character C₅=0. A uniform exponent together with finite Selmer at that exponent proves primary finiteness; then almost-all vanishing proves full finiteness. The classical square-index cardinality estimate has its own additional theorem input.

### 7.1 Prime divisibility of the non-torsion Heegner point

For non-torsion y_K∈E(K), Mordell–Weil finite generation implies y_K∉pE(K) for every prime outside a finite set. This is proved before assuming rank one or a finite Heegner index: project to the free Mordell–Weil quotient and use a nonzero coordinate. Once rank one has been proved, the index of Z·y_K in the free quotient is finite; it is distinct from an index in E(K) that includes rational torsion.

More generally, for the RM point y the same finite-generation argument over O_L makes its divisibility depth finite at each coefficient prime and zero at almost every coefficient prime, without assuming rank one.

([gross](#references), §2 pp.237–238; §1 pp.236–237.)

*Needs:* HeightsRationalPointsAndObstructions §1.7 “Mordell–Weil” for the RM statement; EllipticCurves Layer 6, “The Mordell–Weil theorem”.

### 7.2 Non-CM open-image application

For non-CM E/Q, import Serre’s open-image theorem to conclude that Q(E[p])/Q has full GL₂(F_p) image for all but finitely many p, and apply it to the actual Heegner setting. More generally obtain the required uniform cohomological restriction/invariant bounds from the open adelic/Tate image over a number field, retaining the cyclotomic determinant and base-field index. For the RM quotients use the scalar-image theorem of gap:abelian-scalar-image and the rational/integral commutant generation of FaltingsFinitenessAndIsogenyTheorems R28.4.5 and R28.6.7; full GL₂ image is not required there.

([gross](#references), §2 p.237; §12 pp.254–256.)

*Needs:* [Prime divisibility of the non-torsion Heegner point](#71-prime-divisibility-of-the-non-torsion-heegner-point); FaltingsFinitenessAndIsogenyTheorems R28.4.5–R28.4.6 and R28.6.7; gap:elliptic-adelic-open-image; gap:abelian-scalar-image; ArithmeticGaloisRepresentations §§6.2, 6.4–6.4a Weil pairing, determinant and images.

**Checks.**

- The standard SL₂(ℤ_p) action has scalar commutant, but its determinant image is {1}; it has infinite index in GL₂(ℤ_p). A commutant identity cannot substitute for adelic openness.
- The full GL₂(ℤ_p) image has matrix span M₂(ℤ_p), so its matrix error is zero.
- A CM curve over its endomorphism field has two character lines after coefficient extension and uses the separate CM branch rather than Serre’s non-CM theorem.

### 7.3 Integral Tate image errors

In the integral RM context above, for each coefficient prime 𝔭 of O_L, T=T_𝔭A is free of rank two over O_𝔭. For H_M=K(A[𝔭^M]), there are C₂(𝔭),C₃(𝔭)≥0 independent of M such that restriction H¹(K,A[𝔭^M])→H¹(H_M,A[𝔭^M]) has kernel killed by 𝔭^C₂ and the image of O_𝔭[G_K] in End_O𝔭(T) contains 𝔭^C₃ End_O𝔭(T). Both constants vanish for all but finitely many 𝔭. First prove the no-CM/self-twist criterion for the supplied GL₂-type quotient: the semisimple coefficient representation V has End_(L_𝔭[G_K])(V)=L_𝔭 and is absolutely irreducible when A does not acquire CM over K (Nekovář Proposition 6.2.1 with H=K). This is an O_L-linear centralizer calculation and does not assert End_K(A)=O_L. The rational double-centralizer theorem gives the full matrix algebra and a finite C₃ at each 𝔭; the integral comparison and the fixed coefficient-order denominators make C₃=0 almost everywhere. The scalar u_p in gap:abelian-scalar-image gives C₂=v_𝔭(u_p−1) by the central-scalar cohomology argument, uniformly in M.

([nekovar](#references), §§6.1–6.2, pp.35–37, Propositions6.1.2,6.2.1–6.2.2; locators use the 53-page author preprint, not published pagination.)

*Needs:* FaltingsFinitenessAndIsogenyTheorems R28.4.5–R28.4.6 and R28.6.7; gap:abelian-scalar-image; ArithmeticGaloisRepresentations §§6.2, 6.4–6.4a Weil pairing, determinant and images; ComplexMultiplicationAndExplicitReciprocity CM.4; ArithmeticGaloisDuality R02.2; [Parametrization choice, degree and torsion](#16-parametrization-choice-degree-and-torsion).

**Checks.**

- For central scalar u=−1, u−1=−2 has valuation zero at p=3 and valuation one at p=2; the restriction-kernel bound retains the dyadic factor.
- If the generated matrix algebra is M₂(O_𝔭), C₃=0. The scalar algebra alone cannot contain ϖ^cE₁₂ for any finite c, so it fails the required matrix assertion.
- At M=0 the torsion coefficient is zero and restriction has zero kernel; this boundary alone supplies no uniform bound for positive M.

### 7.4 Integral CM prime detection

In the integral RM context above, let ρ∈G_F be the chosen complex conjugation, and let Z⊂A_K,f× be the local stabilizer subgroup of the CM point in the central quotient of §0.7. Define the finite positive stabilizer index u₀=[K×∩A_F,f×Z:F×] and M₀=v_𝔭(u₀). For M≫0 with 𝔭^M principal, and a finite O_𝔭/𝔭^M-submodule W₀ of H¹(K,A[𝔭^M]), the actual finite Kummer extension over H_M has an evaluation map whose kernel loss is bounded by C₂ and whose evaluation cokernel is killed by 𝔭^C₃. For ρ-stable W₀, conjugation-compatible detection uses integral 1±ρ and factors2,4,16, with loss C₂+C₃+4v_𝔭(2). It supplies inert good primes in S₁(M), excluding any fixed finite set, with the prescribed detections. S₁(M) requires Frobenius conjugate to ρ in K(x)(A[𝔭^(M+M₀)])/F, with M₀ as just defined, hence a_ℓ≡0 and Nℓ+1≡0 mod𝔭^(M+M₀).

The stabilizer and admissible-prime API is:

- The integer u₀ is the index of the actual global stabilizer after the central quotient; at a new inert prime the cyclic conductor degree is (Nℓ+1)/u₀.
- M₀ is the valuation of this integer in O_𝔭; the auxiliary Frobenius depth is M+M₀ and includes coefficient ramification.
- The set S₁(M) consists of inert good primes unramified in the specified finite extension with arithmetic Frobenius conjugate to ρ, with every fixed finite excluded set retained.

**Checks.**

- At u₀=1, M₀=0 and the first conductor degree is Nℓ+1, so no artificial unit denominator occurs.
- At u₀=2 and an unramified dyadic coefficient prime, M₀=1; Nℓ+1=8 gives cyclic degree 4. Dropping u₀ would incorrectly give degree 8 and one extra coefficient level.
- If v_𝔭(2)=2, the same u₀=2 has M₀=2, not 1; an O_𝔭-normalized valuation cannot be replaced by its rational-prime valuation.

([nekovar](#references), §4.1 and Proposition4.8(i), pp.22,24–25; §§5.1–5.2 pp.27–28; §§6.3–6.5 pp.37–41; locators use the 53-page author preprint, not published pagination.)

*Needs:* [Integral Tate image errors](#73-integral-tate-image-errors); EulerSystemsAndKolyvaginSystems §§4.13, 4.18–4.19 All-prime descent and uniform errors; Chebotarev Layer 10, “Dirichlet-density Chebotarev”; [Relative CM conductor tower](#07-relative-cm-conductor-tower).

### 7.5 Arithmetic derivative denominators at exceptional primes

In the integral RM context above, for each 𝔭 and each M≫0 with 𝔭^M principal, the actual CM tower supplies integral c(n)∈H¹(K(x),A[𝔭^M]) without requiring vanishing of torsion invariants. At v∤n its image in H¹(K(x)_v,A)[𝔭^M] is an unramified component-group class, killed by 𝔭^C₁,v where C₁,v kills the geometric 𝔭-primary Néron component group. With C₁=max_v C₁,v, κ_n=𝔭^C₁ cor_K(x)/K c(n) satisfies the actual finite Kummer conditions outside n, κ₁=𝔭^C₁δ(y). For ℓ∣n its singular localization is −Φ_ℓ(Fr(ℓ) loc_fin κ_(n/ℓ)). Here Φ_ℓ is the imported finite–singular isomorphism from the unramified subgroup of H¹(K_λ,A[𝔭^M]) to its quotient by that subgroup, normalized by ev_(σ_ℓ)Φ_ℓ=ev_(Fr_λ) for the fixed tame generator σ_ℓ. The source’s divided-Frobenius calculation identifies it with the geometric Kummer comparison and gives Φ_ℓFr(ℓ)=−Fr(ℓ)Φ_ℓ. The notation n/ℓ is a conductor index, never division of a cohomology class by ℓ. C₁ is independent of M,n and zero for almost all 𝔭; cusp/Hodge and quotient denominators are fixed in ι_A. For classical E use its given modular quotient, absorbing the fixed cusp annihilator and isogeny degree. C₂,C₃ bound evaluation errors, not an inverse of restriction.

([nekovar](#references), §1.19 pp.14–15; §§4.8–4.13 pp.24–27; §§5.8–5.12 pp.29–30; §§5.15–5.18 pp.31–33; §7.2.1 p.44; locators use the 53-page author preprint, not published pagination.)

*Needs:* [Differentiated point invariance](#42-differentiated-point-invariance); [Jacobian basepoint and Hodge denominators](#14-jacobian-basepoint-and-hodge-denominators); [Parametrization choice, degree and torsion](#16-parametrization-choice-degree-and-torsion); [Relative CM conductor tower](#07-relative-cm-conductor-tower); [Quaternionic CM reduction and specialization](#27-quaternionic-cm-reduction-and-specialization); [Integral CM prime detection](#74-integral-cm-prime-detection); EulerSystemsAndKolyvaginSystems §§3.1–3.8 Kolyvagin derivatives and descent; NeronModelsAndSemistableAbelianVarieties §§1.2, 2.2, 2.6; ArithmeticGaloisDuality R02.2.

### 7.6 Dyadic integral conjugation descent

In the integral RM context above, the integral two-prime descent applies at every coefficient prime, including 𝔭|2. By HeightsRationalPointsAndObstructions §1.7, A(K) is finitely generated. Thus its torsion-free O_L-quotient is a finite lattice and the nonzero image of y has finite depth C₀=max{c:y∈A(K)_tors+𝔭^cA(K)}, zero at almost every 𝔭. Fix an F-polarization λ_A:A→A∨ and write C₆=v_𝔭(degλ_A), and C₁,C₂,C₃ as above; C₅=v_𝔭[K:K]=0 in this trivial-character part. For M≫0, 2²¹𝔭^(2C₀+2C₁+4C₂+4C₃+C₅+C₆) annihilates Sel(A/K,𝔭^M)/O_𝔭κ₁. Thus B=2C₀+2C₁+4C₂+4C₃+C₆+21v_𝔭(2) is independent of M. Integral (1±ρ) is retained; no decomposition using (1±ρ)/2 is made. All archimedean places of K are complex, so their local H¹ is zero. Any comparison back to a real place of F uses the fixed Tate correction killed by2, as specified in Layer 3, rather than an odd-prime invariant argument.

([nekovar](#references), §5.19 pp.33–34; Proposition7.2.3 pp.44–45; §§7.4–7.5 pp.45–47; locators use the 53-page author preprint, not published pagination.)

*Needs:* HeightsRationalPointsAndObstructions §1.7 “Mordell–Weil”; [Arithmetic derivative denominators at exceptional primes](#75-arithmetic-derivative-denominators-at-exceptional-primes); [Integral CM prime detection](#74-integral-cm-prime-detection); EulerSystemsAndKolyvaginSystems §§4.13, 4.18–4.19 All-prime descent and uniform errors; SelmerIwasawaCohomology §§2.13–2.20 Dual Selmer structures, local duality and Poitou–Tate; [Archimedean Tate correction](#36-archimedean-tate-correction); ArithmeticGaloisDuality R02.4.

**Checks.**

- In the lattice ℤ² with y=(12,18), C₀(2)=min(2,1)=1, C₀(3)=min(1,2)=1, and C₀(p)=0 for every other prime. No rank-one assumption is used.
- In the non-finitely-generated group ℚ, y=1 lies in p^cℚ for every c; a finite maximum C₀ cannot be defined.
- With C₀=C₁=C₂=C₃=C₆=0, B=0 at an odd coefficient prime and B=21v_𝔭(2) at a dyadic one. If v_𝔭(2)=2, the dyadic bound is 42, not 21.

### 7.7 Exceptional primary Sha exponent bound

In the integral RM context above, for each 𝔭 the finite-level Selmer quotient by κ₁ is killed uniformly by 𝔭^B, with B=2C₀+2C₁+4C₂+4C₃+C₆+21v_𝔭2. Since κ₁ lies in the Kummer image, Sha(A/K)[𝔭^M] is killed by 𝔭^B for every sufficiently large principal M, hence the entire 𝔭-primary group is killed by 𝔭^B. Finite-level Selmer finiteness at this fixed bound makes the primary group finite. The cofinal principal exponents are sufficient; separate finiteness at each M without a uniform B is insufficient.

([nekovar](#references), §3.5 p.19; §7.1.2 p.43; Theorem7.3 and proof pp.45–47; locators use the 53-page author preprint, not published pagination.)

*Needs:* [Dyadic integral conjugation descent](#76-dyadic-integral-conjugation-descent); EulerSystemsAndKolyvaginSystems §§4.13, 4.18–4.19 All-prime descent and uniform errors; SelmerIwasawaCohomology §2.12a, `abelianSelmerGroup_finite` and abelian descent; ArithmeticGaloisDuality R02.2.

### 7.8 CM and Heegner fields

Let E/Q have CM by an imaginary quadratic field M, conductor N, and let K be a classical Heegner field in which every prime dividing N splits. Then M≠K, M∩K=Q, and E does not acquire its CM endomorphisms over K. Over KM the coefficient-extension Tate representation splits into the two conjugate CM characters; G_K exchanges them through Gal(KM/K), so the rational representation over K is absolutely irreducible. This verifies Nekovář’s no-CM condition for the trivial character and the matrix-algebra hypothesis of integral descent, although its residual image need not be full GL₂.

([nekovar](#references), §3.2 pp.18–19; Proposition6.2.1 pp.35–36 (CM/self-twist/irreducibility dictionary); locators use the 53-page author preprint, not published pagination.)

*Needs:* ComplexMultiplicationAndExplicitReciprocity CM.4; ArithmeticGaloisRepresentations §3.5 Induction and the conductor–discriminant formula; §6.1 The Tate module; [Integral Tate image errors](#73-integral-tate-image-errors).

### 7.9 CM character descent and error bounds

For a classical CM E/Q, K as in the CM/Heegner-field theorem, and non-torsion bottom Heegner point, the two conjugate CM Tate characters over KM verify the integral matrix-algebra and homothety bounds over K. The explicit cocycle classes and the integral two-prime descent give the same uniform exponent B at all rational primes, including 2. C₀,C₁,C₂,C₃,C₆ and v_p2 are zero outside a finite set, so Sha(E/K)[p∞]=0 there. This branch uses the semilinear CM character representation, not Serre’s non-CM GL₂ surjectivity.

([nekovar](#references), Theorem3.2 pp.18–19; §§6.1–6.2 pp.35–37; Theorem7.3 and §7.5 pp.45–47; locators use the 53-page author preprint, not published pagination.)

*Needs:* [CM and Heegner fields](#78-cm-and-heegner-fields); [Integral Tate image errors](#73-integral-tate-image-errors); [Arithmetic derivative denominators at exceptional primes](#75-arithmetic-derivative-denominators-at-exceptional-primes); [Dyadic integral conjugation descent](#76-dyadic-integral-conjugation-descent); ComplexMultiplicationAndExplicitReciprocity CM.4; EulerSystemsAndKolyvaginSystems §§4.13, 4.18–4.19 All-prime descent and uniform errors.

### 7.10 Almost-all primary Sha vanishing

For the classical non-CM non-torsion Heegner setting, outside a finite set of primes the Gross clean theorem gives Sha(E/K)[p]=0. Since Sha is torsion, this implies Sha(E/K)[p∞]=0: any nonzero p-primary element would yield nonzero p-torsion after taking a suitable p-power multiple. This does not require proving finite p-primary groups first. For CM E use the separate CM-character branch: the uniform integral constants vanish outside a finite set and the finite-level Kummer quotient then forces Sha[p∞]=0. For the specified RM quotients the same reasoning applies at coefficient primes 𝔭; there are finitely many exceptional coefficient primes, not a tacit residual-surjectivity assumption.

([gross](#references), §2 pp.237–238 and Proposition2.1; [nekovar](#references), §3.5.2 p.19; §§6.1–6.2 pp.35–37; §7.4 p.45; locators use the 53-page author preprint, not published pagination.)

*Needs:* HeightsRationalPointsAndObstructions §1.7 “Mordell–Weil”; [Non-CM open-image application](#72-non-cm-open-image-application); [Gross’s clean mod-p descent](#64-grosss-clean-mod-p-descent); EllipticCurves Layer 7, “Selmer groups and Sha”; [CM character descent and error bounds](#79-cm-character-descent-and-error-bounds); [Exceptional primary Sha exponent bound](#77-exceptional-primary-sha-exponent-bound).

### 7.11 Classical full Sha finiteness

Let E/Q have a fixed modular quotient X₀(N)→E, K imaginary quadratic with D_K≠−3,−4 and all N-primes split, and y_K=Tr_K[1]/K P₁ of infinite order. Then rank E(K)=1 and the entire Sha(E/K) is finite, including CM E and p=2. This conditional non-torsion theorem includes CM curves and the dyadic primary group; the statistics low-analytic-rank theorem is used only within its own supplied hypotheses. The uniform integral Selmer bound gives rank1: the non-torsion Kummer line has finite-index quotient at any coefficient prime; it also gives finite exceptional primary groups and almost-all primary vanishing. The quantitative square-index order theorem is stated separately and is not inferred from this exponent argument.

([nekovar](#references), Theorem3.2 pp.18–19; §7.4 p.45; §7.5 pp.45–47; locators use the 53-page author preprint, not published pagination; [gross](#references), Theorem1.3 pp.236–237 (quoted classical endpoint).)

*Needs:* [Almost-all primary Sha vanishing](#710-almost-all-primary-sha-vanishing); [Exceptional primary Sha exponent bound](#77-exceptional-primary-sha-exponent-bound); [CM and Heegner fields](#78-cm-and-heegner-fields); EllipticCurves Layer 7, “Selmer groups and Sha”; EllipticCurves Layer 6, “The Mordell–Weil theorem”.

### 7.12 Admissible RM Kolyvagin–Logachev application

In the integral RM context above, A(K)/O_Ly is finite, rank_Z A(K)=[L:Q]=dim A, and the entire Sha(A/K) is finite. This general totally real/RM target is distinct from ArithmeticStatisticsPartVI’s elliptic nontrivial-character multiplicity-one application. It is the trivial-character specialization of Nekovář3.2 and includes the specified quaternionic/RM quotients, with field, ramification, central quotient, maximal endomorphism order, Hecke map and integral Hodge normalization stated above. An analytic rank-d conclusion additionally requires a supplier height formula proving this particular y is non-torsion from ord_s=1 L(A/K,s)=d; analytic rank alone is not an input to descent.

([nekovar](#references), §§3.1–3.2 pp.18–19; §7.1 pp.43–44; §§7.3–7.5 pp.45–47; locators use the 53-page author preprint, not published pagination.)

*Needs:* HeightsRationalPointsAndObstructions §1.7 “Mordell–Weil”; [Integral Tate image errors](#73-integral-tate-image-errors); [Arithmetic derivative denominators at exceptional primes](#75-arithmetic-derivative-denominators-at-exceptional-primes); [Exceptional primary Sha exponent bound](#77-exceptional-primary-sha-exponent-bound); [Almost-all primary Sha vanishing](#710-almost-all-primary-sha-vanishing); EulerSystemsAndKolyvaginSystems §§4.13, 4.18–4.19 All-prime descent and uniform errors; HilbertModularVarietiesAndShimuraCurves R18.1; HilbertModularVarietiesAndShimuraCurves R18.4; GrossZagierAndArithmeticHeights §8.11 The Yuan–Zhang–Zhang Gross–Zagier formula; SelmerIwasawaCohomology §2.12a, abelian Kummer/Selmer/Sha and `abelianSelmerGroup_finite`.

### 7.13 Classical square-index bound

In the classical setting of the full-finiteness theorem, put O=End_overlineQ(E), Q_O=O⊗Q, embedded in overlineQ through the chosen CM type when O≠Z. Let B(E) consist of odd primes ℓ∤disc(O) such that the O_ℓ-linear representation G_Q_O→Aut_Oℓ(T_ℓE) is surjective. There is a positive integer d_E independent of K with v_ℓ(d_E)=0 for ℓ∈B(E) and #Sha(E/K) dividing d_E I_K², where I_K=[E(K):Zy_K] includes rational torsion and is defined after rank1 is proved. For non-CM E, Q_O=Q and Aut_Oℓ=GL₂(Z_ℓ); for CM E use the linear Cartan action over Q_O, not full GL₂ over Q. B(E) is a full Tate-image criterion and is not silently replaced by a residual-image criterion at the small primes. Gross writes the related error bound as t_E/K I_K²; no explicit value or optimality of either constant is asserted.

([gross](#references), Theorem1.3, p.236; [kolyvagin-structure](#references), TheoremA, p.95; introduction pp.94–97.)

*Needs:* [Classical full Sha finiteness](#711-classical-full-sha-finiteness); [Arithmetic derivative denominators at exceptional primes](#75-arithmetic-derivative-denominators-at-exceptional-primes); [CM character descent and error bounds](#79-cm-character-descent-and-error-bounds); gap:classical-uniform-square-index.


**Checks.**

- For I_K=5 and d_E=1, the order must divide 25. The groups (ℤ/5)^r all have exponent 5, but r=3 has order 125, so an exponent bound cannot imply this order bound.
- At ℓ∈B(E), v_ℓ(d_E)=0 gives v_ℓ(#Sha)≤2v_ℓ(I_K); index prime to ℓ forces zero ℓ-primary group.
- A CM elliptic curve uses the Cartan image over its endomorphism field; imposing full GL₂ over ℚ would exclude the CM branch.

### Examples

In ℤ², the point (20,30) has divisibility depth 1 at 2 and 5 and depth 0 at 3. With all other constants zero, the integral exponent B is 2 at 5 and 23 at an unramified dyadic coefficient prime. The exponent does not give the cardinality: (ℤ/5)³ has exponent 5 and order 125 (§§7.1, 7.6–7.7, 7.13).

### Dependencies

This layer uses the earlier internal targets specified in each *Needs:* sentence, the pinned algebraic APIs, and ArithmeticGaloisRepresentations, ComplexMultiplicationAndExplicitReciprocity, EllipticCurves, EulerSystemsAndKolyvaginSystems, FaltingsFinitenessAndIsogenyTheorems, GrossZagierAndArithmeticHeights, HilbertModularVarietiesAndShimuraCurves, NeronModelsAndSemistableAbelianVarieties.

## Layer 8: Anticyclotomic families, nonvanishing and refined descent

Start with the Euler factor, ordinary stabilization and a simultaneous compact norm family. Construct its Kummer class and derivative system before any main-conjecture equality. The general-F geometric nonvanishing branch uses exact primitive character strata and quaternionic distribution; the classical higher-point theorem is imported as specified in Scope and ownership. Height-one descent then gives Howard's divisibility, with a distinct weaker-torsion localized branch. The later logarithm, control and determinant statements are conditional implications from explicitly named main conjectures. At split primes use crystalline algebraic-Hecke characters for the BDP calculation; the Castella–Sano determinant argument instead allows continuous near-identity characters at any unramified p. These are separate specialization routes.

### 8.1 Heegner initial Euler factor

For every permitted n, in ℤ_p[G(n)] with G(n)=Gal(K[n]/K), define Φ=(p+1)²−a_p² if p is inert; if p splits define Φ=(p−a_pσ+σ²)(p−a_pσ*+σ*²), with σ,σ* the specified Artin elements. The augmentation is (p+1−a_p)² in the split case, not necessarily a unit. Keep the finite ring-class group, its Artin action and the initial unit index; it differs from Howard’s first-step degree group Δ=(O_K/pO_K)×/(ℤ/pℤ)×.

The required API is:

- Inert Φ=(p+1)²−a_p².
- Split Φ is the product of the two Artin quadratic factors, not its augmentation.
- Augmentation of the split factor is (p+1−a_p)²; inert augmentation is unchanged.
- A coefficient-ring map and compatible finite ring-class group map carry Φ to the corresponding factor.

**Checks.**

- For p=5,a_p=1 and σ=σ*=1, Φ=25, a nonunit in ℤ_5.
- For p=5,a_p=1, inert Φ=35, distinct from the split augmentation25.
- Augmentation sends the split polynomial to (p+1−a_p)²; it is distinct from coefficient content.
- In ℤ₅[C₃] with s³=1 and s≠1, p=5 and a_p=1 give Φ=27−s−s²; Artin inversion exchanges s and s² and gives the same polynomial. Its coefficient content has valuation zero while Φ₀=25 has valuation two. Expanding with s³=1 gives the identity over ℤ[C₃], hence also after coefficient extension.

([howard](#references), §2.3, before Lemma 2.3.2; PDF pp.28–29.)

*Needs:* [Ring-class tower and finite Galois quotients](#05-ring-class-tower-and-finite-galois-quotients); `MonoidAlgebra.single` (Mathlib).

### 8.2 Ordinary stabilization of Heegner points

For good ordinary reduction, p∤a_p, so `hensels_lemma` at the nonzero simple residue root of X²−a_pX+p gives its unique unit root α_p∈ℤ_p×; put β_p=p/α_p. For k≥1 put P[p^k]_α=P[p^k]−α_p⁻¹P[p^(k−1)] and scale by α_p⁻k. At k=0 use u_K⁻¹(1−α_p⁻¹σ)(1−α_p⁻¹σ*)P[1] in the split case and u_K⁻¹(1−α_p⁻²)P[1] in the inert case. Trace to K_k with the actual smallest d(k) such that K_k⊂K[p^d(k)], including p-primary class-number shifts.

This CGLS application also assumes (disc) and E(K)[p]=0.

The required API is:

- At k≥1 the scaled point is α_p⁻k(P[p^k]−α_p⁻¹P[p^(k−1)]).
- An equivariant ℤ_p-linear map commutes with stabilization.
- A unit rescaling of all raw points rescales every stabilized point by that unit.
- The conductor-zero value uses its separate split/inert correction with u_K.

**Checks.**

- All raw points zero give every stabilized point zero.
- Over ℚ with unit 2 and raw P_1=4,P_0=2, the k=1 stabilized value is 3/2, not 2 or 3; this is an algebraic normalization example, not an arithmetic unit-root assertion.
- At initial level the prescribed Euler-corrected P[1] is used; the positive-level recurrence is not evaluated at a nonexistent predecessor.

([cgls](#references), Remark 4.1.3; PDF pp.28.)

*Needs:* [Heegner initial Euler factor](#81-heegner-initial-euler-factor); [Repeated-conductor predecessor relation](#24-repeated-conductor-predecessor-relation); [Split and ramified first-step relations](#23-split-and-ramified-first-step-relations); `hensels_lemma` (Mathlib), applied to X²−a_pX+p at the simple unit residue root; `PadicInt` (Mathlib).

### 8.3 Norm compatibility of stabilized Heegner points

The stabilized points traced to the anticyclotomic layers satisfy Cor_(K_(k+1)/K_k)y_(k+1)=y_k. The first trace uses the initial correction in §8.2; a shift d(k) is required when p divides h_K. This construction does not assert Howard Theorem B under the weakened class-number hypothesis.

This CGLS application also assumes (disc) and E(K)[p]=0. Use the actual linear trace maps on the common ambient point-completion and the compatibly included raw points. The unit root α satisfies α²−a_pα+p=0; at positive level cor[k+1](raw[k+2])=a_p raw[k+1]−raw[k] and cor[k+1](raw[k+1])=p raw[k+1]. At the first step cor[0](raw[1])−α⁻¹cor[0](raw[0])=α·initial, with initial the separately corrected point. Identify anticyclotomic traces using the actual d(k).

([cgls](#references), Remark 4.1.3 and proof of Theorem 4.1.1; PDF pp.27–28.)

*Needs:* [Ordinary stabilization of Heegner points](#82-ordinary-stabilization-of-heegner-points); [Norm, reciprocity and level compatibility](#08-norm-reciprocity-and-level-compatibility).

### 8.4 Finite solvability of the Heegner norm constraints

Under (disc), for the actual compact inverse-limit groups L[n] generated by the fixed ordinary Heegner conductor family, prove simultaneous finite solvability: every finite collection of bottom equations π[n]q[n]=Φ[n]P[n] and auxiliary equations tr[j]q[target j]=a[j]q[source j] has a simultaneous solution. Use Howard’s common free presentation with its conductor transition maps; in the weak-torsion construction retain the CGLS class-number shifts. This finite-solvability assertion is proved from the actual Heegner recurrences, rather than assumed from compactness. The closed-equation and product-compactness results then give the family in §8.5.

([howard](#references), Lemmas 2.3.2–2.3.3, pp.29–30; [cgls](#references), Theorem 4.1.1 and proof, pp.27–28.)

*Needs:* [Heegner initial Euler factor](#81-heegner-initial-euler-factor); [Norm compatibility of stabilized Heegner points](#83-norm-compatibility-of-stabilized-heegner-points); [Inert Heegner norm relation](#22-inert-heegner-norm-relation); PadicMeasuresIwasawaAlgebras §1.7.

**Checks.**

- For one bottom equation with π=id and Φ=5 on ℤ/7, the required value is q=5, rather than the raw point 1.
- For π=0 and bottom value 1 on ℤ/7 even the one-equation family is insoluble; compactness cannot repair it.
- With π=id, bottom value 1, tr=id and auxiliary scalar 0 on the same ℤ/7 coordinate, the bottom and auxiliary equations have no simultaneous solution, although each alone is solvable.

### 8.5 Howard universal-norm Heegner family

Under the ordinary Heegner conditions and E(K)[p]=0, construct Q[n] in lim_k H_k[n], the inverse limit of the ℤ_p[Gal(K_k[n]/K)]-modules generated by P[n] and P_j[n]. Its level-zero projection is ΦP[n], and Cor_(K∞[nℓ]/K∞[n])Q[nℓ]=a_ℓQ[n] for every permitted auxiliary ℓ. Choices arise from compactness, not uniqueness. Howard proves this under full G_K image and p∤h_K; CGLS Theorem 4.1.1 gives the weaker construction with the actual class-number conductor shifts, without extending Howard’s divisibility theorem. The construction takes these fixed maps and scalars together with finite solvability; its APIs use the same data. For actual level projections pr[n,k] and transitions cor[n,k], require cor[n,k]∘pr[n,k+1]=pr[n,k]. Differences between two choices with these same bottom and auxiliary constraints have zero bottom projection and obey tr[j](Q[target j]−Q′[target j])=a[j](Q[source j]−Q′[source j]).

This CGLS application also assumes (disc) and E(K)[p]=0. The conductor index I and permitted auxiliary-edge index J, their source/target maps, actual compact Hausdorff inverse-limit groups L[n], initial groups P[n], continuous bottom projections π[n], Artin-factor actions Φ[n], points P[n], continuous auxiliary traces tr[j], and scalars a[j] are fixed before choosing the family. Every finite list of bottom and auxiliary constraints has a simultaneous solution, as established by the common free-presentation argument; no uniqueness or surjectivity of arbitrary projections is assumed.

The required API is:

- For the fixed data and the finite-solvability witness used by the construction, π[n](Q[n])=Φ[n]P[n].
- For each edge j of the supplied permitted-edge index, the fixed trace tr[j] sends Q[target j] to a[j]Q[source j].
- For the actual supplied level projections and transitions, assume cor[n,k]∘pr[n,k+1]=pr[n,k]; then cor[n,k](pr[n,k+1](Q[n]))=pr[n,k](Q[n]).
- For two families satisfying the same bottom and fixed auxiliary constraints, their difference has zero bottom projection and satisfies the same homogeneous auxiliary trace relations; it need not be zero.

**Checks.**

- On the finite compact group ℤ/7, with one conductor, no auxiliary edges, π=id, Φ=5·id and initial point 1, the chosen bottom is 5 rather than 1; finite solvability (§8.4) is witnessed by the constant family 5.
- For a fixed permitted auxiliary edge j with a[j]=0, and the same finite-solvability input used by the construction, tr[j](Q[target j])=0.
- With one conductor and one self-edge on the finite compact group ℤ/2, bottom projection zero, prescribed bottom zero, trace id and scalar 1, the distinct families 0 and 1 satisfy both constraints, and their difference satisfies both homogeneous laws.
- On ℤ/7 with π=0 and prescribed bottom 1, even the singleton bottom constraint has no solution, so the finite-solvability hypothesis of §8.4 fails.
- On ℤ/7 with π=id, prescribed bottom 1, a self-edge with trace id and scalar 0, the singleton bottom and auxiliary constraints cannot be solved simultaneously.

([howard](#references), Lemmas2.3.2–2.3.3; PDF pp.29–30; [cgls](#references), Theorem 4.1.1, proof and class-number-shift/local-condition adaptation; PDF pp.27–28.)

*Needs:* [Finite solvability of the Heegner norm constraints](#84-finite-solvability-of-the-heegner-norm-constraints); [Heegner initial Euler factor](#81-heegner-initial-euler-factor); [Inert Heegner norm relation](#22-inert-heegner-norm-relation); PadicMeasuresIwasawaAlgebras §1.7 Comparison with the completed group algebra; PadicMeasuresIwasawaAlgebras Layer 5 determinants, specialization and exactness.

### 8.6 Anticyclotomic Heegner class

Apply the integral Kummer map to the stabilized norm-compatible points and the imported Iwasawa–Shapiro comparison to obtain y∞∈H¹_Iw(K∞/K,T)=H¹_cont(K,T⊗Λ(tautological inverse)). The actual tower class lies in the specified ordinary Selmer structure. Its projection to level k is the Kummer class of y_k. There is no assertion that each character specialization is nonzero.

This CGLS application also assumes (disc) and E(K)[p]=0.

The required API is:

- Under Iwasawa–Shapiro, level k equals the Kummer class of y_k.
- An equivariant quotient or scalar transport commutes with the class construction.
- Changing the tower by a finite initial norm gives the imported corestriction comparison, with its degree/factor.
- The identically zero compatible point family has zero class.

**Checks.**

- Conductor one specializes to the corrected trace over its ring-class field, not an assumed K-rational raw point.
- A p-isogeny acts by the actual lattice map; a nonunit scalar can change the integral index.
- In the supplied two-coordinate cohomology model, the image of (1,0) under the identity Iwasawa comparison is nonzero, but its second-coordinate specialization is zero. This separates nonvanishing of a class from nonvanishing of every projection.

([cgls](#references), Theorem 4.1.1 and Remark 4.1.3; PDF pp.27–28.)

*Needs:* [Norm compatibility of stabilized Heegner points](#83-norm-compatibility-of-stabilized-heegner-points); [Heegner Kummer classes](#31-heegner-kummer-classes); SelmerIwasawaCohomology §3.1 “Iwasawa cohomology”; SelmerIwasawaCohomology §3.2 Shapiro’s lemma for Iwasawa cohomology.

### 8.6a Primitive integral families and scalar corrections

In the classical ordinary split branch let E₀ be the optimal quotient of J₀(N), π₀:X₀(N)→E₀ its cusp-normalized optimal map and d=1. Let E• and η:E₀→E• be the distinguished curve and specified étale isogeny identifying T_pE• with the image of integral étale cohomology in the f-eigenspace; put π•=η∘π₀. These are different integral lattices, and η is not assumed to induce an isomorphism on Tate modules. Use the source class on T_pE₀ for the optimal-quotient formulation and the source class on T_pE• for the distinguished-lattice logarithm formulation. Fix Néron differentials and the corresponding BDP periods. Retain π₀*ω₀=c₀·2πif(z)dz and η*ω•=u_ηω₀; in this good odd-p setting the cited normalization has c₀,u_η∈ℤ_p×. For any other curve E choose a fixed ℚ-isogeny f from the relevant source curve to E and use the exact integral lattice comparisons below; changing the curve alone does not justify cancelling those factors (BCGS §1.2.2, pp.10–11; BCK Remark 1.2, p.1628; CGS §4.1, pp.17–18).

For either specified source lattice construct the ordinary family from that map and prove compatibility with its Kummer class, stabilization and regulator. A family on this same lattice obtained by multiplying the point map by a nonzero scalar a∈ℤ_p, including its clearing integer, has y∞=a y∞,src. Prove that its logarithm is a times the source logarithm and that, for the non-torsion source class, `char(S/Λy∞)=(a)char(S/Λy∞,src)`. Consequently, when the source main conjecture holds, the formula for this family is `(a)²char(X_tors)=char(S/Λy∞)²`. The uncorrected integral equality applies when a is a unit. For a general isogeny the finite lattice kernel/cokernel factors in §§8.35–8.37 are retained before making this scalar comparison; no p-isogeny is declared a scalar unit.

For this isogeny let f_S:S_src→S be the map on compact ordinary Selmer modules and f_X:X→X_src its contravariant map on discrete Selmer duals. Once S_src and S are torsion-free of rank one, f_S is injective. Put C_S=coker(f_S), K_X=ker(f_X on torsion) and C_X=coker(f_X on torsion); these are finitely generated torsion Λ-modules. For y∞=a f_S(y∞,src), a≠0, prove the exact transport formula

    char(K_X) char(S/Λy∞)² = (a)² char(C_X) char(C_S)² char(X_tors).

Here the source equality is the only main-conjecture input: the two exact sequences give char(S/Λy∞)=(a)char(C_S)char(S_src/Λy∞,src) and char(X_tors)char(C_X)=char(X_src,tors)char(K_X). This states the result for every fixed isogenous curve and scalar multiple, without identifying distinct lattices. In the surjective residual branch a primitive isogeny f from E₀ has degree prime to p and induces integral Selmer isomorphisms; prove this by factoring out scalar multiplication from the isogeny and observing that a remaining rational cyclic p-isogeny would give a G_ℚ-stable line in E₀[p]. The uncorrected integral Heegner equality on E then applies to f(P_c,src) and its unit multiples. In the Eisenstein branch use the distinguished source lattice; for a different curve keep the displayed transport factors unless their cancellation is proved.

The X₁(N) realization uses the optimal π₁:X₁(N)→E₁ and its specified étale map to the distinguished curve. The BCGS and Wüthrich distinguished-curve conventions can differ by a 2-power isogeny (BCGS §1.2.2, p.10); compare those actual maps through that isogeny. Its degree is a p-unit for odd p, so this convention change induces integral Tate/Selmer isomorphisms, unlike a p-isogeny.

The normalization API is:

- The specified optimal and distinguished quotient maps determine the actual conductor families and Tate lattices, and the fixed étale isogeny transports the points and Kummer classes.
- On a fixed lattice, multiplication of the entire point map by a gives multiplication of its ordinary class and regulator image by a; the two Selmer maps of a fixed isogeny have the source and target just specified and give the exact transport formula.
- For a≠0, the exact sequence from Λy∞,src/Λa y∞,src≃Λ/(a) gives the displayed characteristic-ideal factor; the ideals agree without correction for a∈ℤ_p×.

**Checks.**

- In S=ℤ₅⟦T⟧ with y∞,src=5², the source quotient has characteristic ideal (5²); for a=5 the quotient has ideal (5³), and its square changes from (5⁴) to (5⁶). The correction (a)² has valuation 2.
- For a=2 at p=5, (2)=(1) and both quotient ideals are (5²); the residual value 1 becomes 2≠0. For a=0 the quotient is S of rank one and has no torsion characteristic ideal, so a≠0 is essential.
- For f=[5] on a fixed curve, f_S is multiplication by 5 on the Selmer line, so char(C_S)=(5); the endomorphism of X_tors has char(K_X)=char(C_X), giving the correction (5²) from the transport formula. The lattice map ℤ₅²→ℤ₅² with matrix diag(5,1) has cokernel ℤ/5 and determinant 5. An étale isogeny with unit differential need not induce an integral Tate-lattice isomorphism; its lattice defect cannot be discarded from the comparison.

*Needs:* [Heegner point family](#15-heegner-point-family); [Parametrization choice, degree and torsion](#16-parametrization-choice-degree-and-torsion); EllipticCurveModularity R29.5; KatoEulerSystems §6.6 Elliptic local lattice and Kato period for the distinguished curve; GrossZagierAndArithmeticHeights Layer 3 differential constants; PadicMeasuresIwasawaAlgebras Layer 4 characteristic ideals. [Anticyclotomic Heegner class](#86-anticyclotomic-heegner-class); SelmerIwasawaCohomology §§2.5, 2.8, 2.10 and 2.12a for the coefficient, ordinary, dual and isogeny maps. The regulator application uses the family logarithm of §8.35; its scalar-linearity law has the same normalization.


### 8.7 Primitive CM character stratum

For the imported relative ring-class tower G∞ with finite torsion G₀, define P(n,χ₀) as the finite-order characters of G(n) restricting to χ₀ on G₀ and not factoring through G(n−1). The character satisfies χ₀ω=1 on the embedded A_F×. Conductor is the largest F-ideal in the order, and primitivity is exact level, not merely conductor dividing P^n. Small n before G₀ embeds are excluded.

This target also assumes F totally real, K/F CM, P a finite prime; n is large enough to identify G₀ in G(n).

The required API is:

- Membership is fixed torsion restriction together with failure to factor through G(n−1).
- Every member restricts to χ₀ on G₀.
- Every pullback from G(n−1) is excluded.
- Compatible isomorphisms of tower quotients and torsion subgroups identify the strata.

**Checks.**

- When the preceding-level quotient map is the identity, the primitive stratum is empty.
- A character with the wrong restriction to G₀ is excluded even if it is primitive.
- For G(n)=C₂, preceding quotient1, trivial torsion subgroup and identity character C₂→C₂, the character belongs to the exact-level stratum.

([cornut-vatsal](#references), §1.1, equations(3)–(4), and Lemma 2.8; PDF pp.3–6,23.)

*Needs:* [Relative CM conductor tower](#07-relative-cm-conductor-tower); [Norm, reciprocity and level compatibility](#08-norm-reciprocity-and-level-compatibility).

### 8.8 Generic CM root-number parity

For cuspidal parallel-weight-two π over F with finite-order everywhere-unramified central character ω, and prime-to-P conductor N′ coprime to D_(K/F), let S be all real places and the finite inert Q≠P for which ord_Q(N) is odd. For sufficiently ramified compatible ring-class χ, ε(π,χ)=(-1)^|S|. The source’s S_χ equals S at every level if P∤N or P splits in K. Even |S| is definite and odd |S| indefinite.

This target also assumes π cuspidal parallel weight two; ω finite-order everywhere unramified; N′ and D_(K/F) coprime.

([cornut-vatsal](#references), §1.1, Lemma 1.1 and definitions of S,Sχ; PDF pp.4–5.)

*Needs:* [Primitive CM character stratum](#87-primitive-cm-character-stratum); GrossZagierAndArithmeticHeights Layer 4 Local toric functionals and test vectors.


**Checks.**

- For F=ℚ with no additional inert odd-exponent conductor prime, S has one real place and the generic sign is −1.
- Adding one allowed inert odd-exponent conductor prime changes the sign to +1; omitting the real place gives the wrong parity in both cases.
- If P divides N and is nonsplit, equality of the eventual S and Sχ is asserted only at sufficiently ramified level, not at every small conductor.

### 8.9 Joint distribution of CM reductions

Let F be totally real, K/F CM, and B/F a quaternion algebra split by K and at P, with a fixed K-embedding. Choose a nonempty finite collection 𝒮 of finite sets S of finite places v≠P with B_v split, K_v a field, and |S|+|Ram_f(B)|+[F:ℚ] even; fix the source’s totally definite B_S and compatible local embeddings. Let R⊂Gal(K^ab/K) be nonempty finite and pairwise distinct modulo P-rational elements rec_K(λ), characterized by λ_P∈K×·F_P×. Form the actual simultaneous Red:CM→X(𝒮,R) and component map C with fibre probability measures μ_z. For compact-open G⊂Gal(K^ab/K) with probability Haar dg, a P-isogeny class ℋ, and continuous f:X(𝒮,R)→ℂ, the difference ∫_G f(Red(gx))dg−∫_G∫_(C⁻¹(gx̄))f dμ_(gx̄)dg tends to zero as x escapes compact subsets of ℋ. Here x̄=C(Red(x)); prohibited components are retained.

This target also assumes B split by K and at P; each auxiliary set satisfies S1–S3 and excludes P, as specified in the statement. R is nonempty and pairwise P-irrational; G is compact open. Transport the source’s geometric Artin convention to arithmetic Artin by inversion, as in §0.8, including the arguments of Red and C.

([cv-dynamics](#references), Theorem 2.9; §§2.5 and2.7; PDF pp.11–12,24–35.)

*Needs:* [Relative CM conductor tower](#07-relative-cm-conductor-tower); GrossZagierAndArithmeticHeights §§0a.3–0a.4 Optimal embeddings and quaternionic CM points, levels and canonical-model descent; HilbertModularVarietiesAndShimuraCurves R18.1; HilbertModularVarietiesAndShimuraCurves R18.2; `gap:cm-local-dynamics`.

### 8.10 Surjectivity onto CM reduction fibres

At fixed finite level and with the joint CM distribution hypotheses, Red(Gx) equals the fibre C⁻¹(Gx̄) for every x outside a finite subset of its P-isogeny class. The right side retains the component map C and does not assert independent reductions in forbidden components.

([cv-dynamics](#references), Corollary 2.10; PDF pp.12.)

*Needs:* [Joint distribution of CM reductions](#89-joint-distribution-of-cm-reductions).

### 8.11 Definite primitive-character toric nonvanishing

For the definite quaternion algebra and CV(H1),(H2), a nonzero P-new vector θ in the Jacquet–Langlands representation of a nonexceptional pair (π,K), and a good CM point x at large conductor, some χ∈P(n,χ₀) has Σ_(σ∈G(n))χ(σ)θ(σx)≠0. Nonexceptionality is π≇π⊗η_(K/F); it cannot be suppressed.

This target also assumes Definite parity, CV(H1),(H2), nonexceptional π, P-new θ, admissible χ₀ and good CM points.

([cornut-vatsal](#references), Proposition 5.6; Corollary 5.7; Proposition 5.8; Lemma 5.9; Theorem 5.10; PDF pp.55–59 (Theorem 5.10 pp.58–59).)

*Needs:* [Surjectivity onto CM reduction fibres](#810-surjectivity-onto-cm-reduction-fibres); [Primitive CM character stratum](#87-primitive-cm-character-stratum); [Distribution at nonmaximal local level](#25-distribution-at-nonmaximal-local-level); GL2AutomorphicRepresentationsAndTransfer R17.3; HilbertModularVarietiesAndShimuraCurves R18.3; HilbertModularVarietiesAndShimuraCurves R18.4.

### 8.12 Cornut–Vatsal definite nonvanishing

With F,K,π,ω,P,N′,D as in §8.8, |S| even and (π,K) nonexceptional, for every sufficiently large n there exists χ∈P(n,χ₀) with L(π,χ,1/2)≠0. This is existence within each fixed-torsion conductor stratum; it is not nonvanishing of all characters.

([cornut-vatsal](#references), Theorem 1.4 and §5; PDF pp.6,50–59.)

*Needs:* [Definite primitive-character toric nonvanishing](#811-definite-primitive-character-toric-nonvanishing); [Generic CM root-number parity](#88-generic-cm-root-number-parity); GrossZagierAndArithmeticHeights Layer 5 Coherent theta lifting and central values.

### 8.13 Unit comparison of Heegner normalizations

For the same fixed quotient, clearing integer and Tate lattice, Howard’s universal-norm bottom class κ₁^Hg and the ordinary stabilized class κ∞ generate the same Λ-submodule. In the non-torsion setting they therefore differ by a Λ-unit. At level zero, let pr_K denote projection to H¹(K,T_pE) and κ₀=pr_K(κ∞). The explicit identities are pr_K(κ₁^Hg)=u_Kα_p²(β_p−1)²κ₀ when p splits and pr_K(κ₁^Hg)=u_Kα_p²(β_p²−1)κ₀ when p is inert. These constants compare the level-zero projections; no exact scalar between the full Λ-classes is specified. Since β_p∈pℤ_p and u_K is a p-unit in the allowed discriminants, both constants are units. This comparison does not make Φ a unit and does not compare a family with a nonunit multiple of its point map; the latter correction is §8.6a.

This CGLS application also assumes (disc) and E(K)[p]=0.

([cgls](#references), Remark 4.1.3; PDF pp.28.)

*Needs:* [Heegner initial Euler factor](#81-heegner-initial-euler-factor); [Ordinary stabilization of Heegner points](#82-ordinary-stabilization-of-heegner-points); [Howard universal-norm Heegner family](#85-howard-universal-norm-heegner-family); [Anticyclotomic Heegner class](#86-anticyclotomic-heegner-class); `PadicInt.isUnit_iff` (Mathlib).

**Checks.**

- In the coefficient test p=5, u_K=1, α_p=2 and β_p=5/2, the split constant is 4·(3/2)²=9≡4 modulo 5 and the inert constant is 4·(25/4−1)=21≡1 modulo 5; each is a unit. These test the scalar formulas without asserting that this chosen α_p comes from an elliptic curve.
- In Λ=ℤ₅⟦T⟧, the elements 1 and 1+T generate the same line and have equal level-zero values 1, but their full ratio is 1+T. A level-zero scalar alone does not determine the full ratio.
- The elements 1 and 5 have level-zero values 1 and 5 and generate distinct integral lines Λ and 5Λ. This excludes applying the unit-line comparison to a nonunit rescaling of the fixed family.

### 8.14 Crystalline characters near the identity

Choose a topological generator γ∈Γ, a non-torsion p-adic unit u generating the prescribed subgroup, and h with γ^h equal to its Artin image. Let ξ_n(γ)=u^n have infinity type (hn,−hn). For m≥1 define α_m=ξ_(p−1)p^(m−1); these are nontrivial crystalline anticyclotomic characters congruent to1 modulo p^m and approach1. Retain h and the chosen embeddings. No finite-order character is substituted for these crystalline twists.

This target also assumes E(K)[p]=0. p splits as v v̄ in K.

The required API is:

- α_m(γ)=u^((p−1)p^(m−1)), with its chosen Artin/infinity-type h.
- α_(m+1)=α_m^p for m≥1.
- α_m≡1 modulo p^m, by the unit-power congruence.
- For non-torsion u, α_m is nontrivial for every m≥1; its limit is1, which is not a member.

**Checks.**

- For p=5,m=1 the exponent is4, not1 or5.
- For p=5,m=2 the exponent is20, exactly five times the first exponent.
- If the supplied character has order dividing p−1, α_1 is trivial; non-torsion and arithmetic construction hypotheses are essential.

([bcgs](#references), Definition 1.2.2; PDF pp.10–11.)

*Needs:* PadicMeasuresIwasawaAlgebras §1.6 Moments and characters of unit measures; §1.7 Comparison with the completed group algebra; PadicHodgeTheory §3.5 Crystalline and semistable classification, on rank-one characters of ℚ_p; [Norm, reciprocity and level compatibility](#08-norm-reciprocity-and-level-compatibility); `PadicInt` (Mathlib).

### 8.15 Heegner divisibility profile

For the actual finite Heegner derivative system define M_r=min_(ν(n)=r) ind(κ_n), with values in ℕ∪{∞}; ind is the largest allowed p-divisibility in the coefficient module, and ind(0)=∞. Set M∞=inf_r M_r. Prime restrictions, coefficient ideals I_n and p-optimal parametrization are part of the data. M_0 is the bottom Heegner index and need not equal M∞.

This target also assumes E(K)[p]=0.

The required API is:

- M_r is the infimum of the supplied actual indices at ν(n)=r.
- At r=0 the only conductor is1, so M₀=ind κ₁.
- M_r=∞ iff every permitted class at level r is zero, with empty strata giving∞.
- Common p^t-rescaling adds t to indices when coefficient depth allows it; truncation at the quotient depth is retained.

**Checks.**

- The zero system has M_r=∞ for every r and M∞=∞.
- A system with indices3 at conductor1 and1 at one-prime support has M₀=3 and M∞≤1.
- For indices2 and5 in one stratum the minimum is2; neither their sum nor maximum is the divisibility index.

([bcgs](#references), Introduction definitions of M_r,M∞; §2.2; PDF pp.2–3,17–20.)

*Needs:* [Heegner conductor coefficient ideal](#41-heegner-conductor-coefficient-ideal); EulerSystemsAndKolyvaginSystems §§4.13, 4.18–4.19 All-prime descent and uniform errors; `Submodule.span` (Mathlib).

### 8.16 Optimal and distinguished lattice comparison

For E₀ optimal on X₀(N), E₁ optimal on X₁(N), and the distinguished E_• with T_f identified integrally with T_pE_•, the prescribed isogeny E₀→E_• is étale at odd p. For crystalline α as in BCGS Lemma 1.2.3 with L_BDP(α⁻¹)≠0 and α sufficiently near1, I_•(α)C_•(α)=I₀(α)C₀(α), where I is the bottom-class index and C the finite-cokernel local index modulo torsion. Neither factor is individually asserted equal under arbitrary isogeny.

This target also assumes E(K)[p]=0. p splits as v v̄ in K. α is crystalline at both primes above p and comes from a Hecke character of infinity type (n,−n), with n≥0 and n divisible by p−1, as in BCGS Theorem 1.2.1 and Lemma 1.2.3. Assume L_BDP(α⁻¹)≠0; for the displayed near-identity formulas take α≡1 modulo p^m with m sufficiently large.

([bcgs](#references), §1.2.2 and Lemma 1.2.5; PDF pp.12; [wuthrich](#references), Theorem 4, published p.384 (PDF p.4), proof pp.386–387.)

*Needs:* [Anticyclotomic Heegner class](#86-anticyclotomic-heegner-class); KatoEulerSystems §§6.6, 7.4, 7.7 Elliptic lattice, ordinary divisibility and control; GrossZagierAndArithmeticHeights §9.10 Compatibility with isogenies, differentials and characters; [Crystalline characters near the identity](#814-crystalline-characters-near-the-identity).

### 8.17 Tamagawa factors near the identity

For α≡1 modulo p^m the twisted local Tamagawa p-factor c_w^(p)(α) is congruent to the untwisted c_w^(p) modulo p^m. For m greater than the total relevant valuations this gives equality of the product of p-parts. Keep w|N over K; under the Heegner hypothesis its untwisted product is the square of the rational Tamagawa p-part.

This target also assumes E(K)[p]=0.

([bcgs](#references), Lemma 1.2.8; PDF pp.14.)

*Needs:* [Component obstruction at bad places](#33-component-obstruction-at-bad-places); NeronModelsAndSemistableAbelianVarieties §§1.2, 2.2, 2.6; PadicMeasuresIwasawaAlgebras §1.6 Moments and characters of unit measures; §1.7 Comparison with the completed group algebra.

### 8.18 Arithmetic strict ordinary Selmer complex comparison

For CS coefficients X=T⊗Λ and twists T_α, instantiate the imported Selmer complex as the mapping fibre `Cone(RΓ(O_K,S,X) → ⊕_(v|p)RΓ(K_v,X/X_v⁺) ⊕ ⊕_(v|N)Cone(RΓ_ur(K_v,X) → RΓ(K_v,X)))[−1]`, with the inner local cones unshifted. Write G for global cochains and L for that local target. The exact sequence `H⁰(G) → H⁰(L) → H¹(SelmerComplex) → ker(H¹(G) → H¹(L)) → 0` retains the H⁰ error. For compact X=T⊗Λ and T_α prove `H⁰(K_v,X/X_v⁺)=0` at v|p: for T_α the ordinary quotient is torsion-free, its unramified unit-root eigenvalue to residue degree f is different from 1 by the Hasse bound, and a sufficiently small twist cannot cancel it; a nontrivial inertia character also forces zero invariants. For T⊗Λ use the same local character with the inverse tautological action: some local Galois element acts by multiplication with a scalar in Λ different from 1, and Λ is a domain. Discrete quotients need not have this vanishing. At v|N, inflation is an isomorphism on H⁰ and injective on H¹, by inflation–restriction; these two facts give H⁰ of the inner cone zero. Thus H⁰(L)=0, and H¹ is the strict ordinary Selmer lattice S; its H² is related by Poitou–Tate to the all-p ordinary discrete dual X_Gr(A). This identifies the all-p ordinary discrete dual X_Gr(A), distinct from BCS’s (0,empty) Greenberg module; its rank-one property is proved by the arithmetic descent of §8.31 before the determinant comparison of §8.38.

This target also assumes E(K)[p]=0. p unramified in K.

([cs](#references), §3.2, equations (3.6)–(3.8), Theorem 3.2.1; PDF pp.13–14.)

*Needs:* [Anticyclotomic Heegner class](#86-anticyclotomic-heegner-class); SelmerIwasawaCohomology §§3.3, 3.9–3.10 Descent and control; local and derived specialization; SelmerIwasawaCohomology §2.19 Poitou–Tate for Selmer groups and §§2.21–2.22 mapping fibre and H⁰ correction; ArithmeticGaloisDuality D7; ModularIwasawaMainConjectures §§0.5–0.10 The three cyclotomic formulations.


Define the strict ordinary complex by the displayed mapping fibre. Its API is:

- The H⁰ error exact sequence is the one displayed above.
- For the specified compact coefficients and sufficiently near-one twists, H⁰(L)=0.
- After that vanishing, H¹ is the kernel of the global-to-local H¹ map.
- Specialization retains the derived local error terms.

**Checks.**

- With G=0 and L=R in degree zero, the fibre is R[−1], so H¹=R; the unshifted cone has H⁰=R and fails this convention.
- For G→0 with G in degree one the fibre is G and H¹ is unchanged; shifting the local cones again would change this.
- If the local ordinary quotient has nonzero H⁰, coker(H⁰(G)→H⁰(L)) survives in H¹ of the fibre; it cannot be discarded for discrete coefficients.

### 8.19 Ordinary local specialization defect

For near-trivial nontrivial α, the local finite/ordinary comparison at v|p contributes the p-part of #Ẽ(𝔽_v), identified with the corresponding H⁰(K_v,A_v⁻(α±)). Set L_p=∏_(v|p)#Ẽ(𝔽_v). Write Φ₀=aug(Φ). For split p, Φ₀=(p+1−a_p)²=L_p and v_p(Φ₀)=2v_p(#Ẽ(𝔽_p)); for inert p, Φ₀=(p+1)²−a_p²=L_p=#Ẽ(𝔽_(p²)). The valuation here is scalar: the coefficient content of Φ in a nontrivial group ring can differ. Retain both signs of the twist.

This target also assumes E(K)[p]=0. p unramified in K; α sufficiently near1.

([cs](#references), Lemma 3.3.3 and proof of TheoremC; PDF pp.16–17.)

*Needs:* [Heegner initial Euler factor](#81-heegner-initial-euler-factor); ArithmeticGaloisDuality R02.4; NeronModelsAndSemistableAbelianVarieties §§5.0a–5.0c; PadicMeasuresIwasawaAlgebras §1.6 Moments and characters of unit measures; §1.7 Comparison with the completed group algebra.


### 8.20 Finite torsion in the relative ring-class tower

For the CV relative CM tower K[P^∞]/K and an abelian variety A/K, A(K[P^∞])_tors is finite. Choose two good-reduction places of K above distinct residue characteristics and primes Q≠P of F that do not split in K. CV Lemma 2.7 bounds their local extension degrees in the tower; prime-to-residue-characteristic reduction injectivity at these two places bounds all torsion. This is a statement about this tower, not torsion over every abelian extension.

This target also assumes F totally real, K/F CM, P a fixed finite prime, and the relative ring-class tower and its reciprocity identification of Layer 0. A/K an abelian variety; choose two distinct residue characteristics away from P and the bad reduction set.

([cornut-vatsal](#references), Lemma 2.7 and proof of Proposition 4.4, PDF pp.22,38; used again before Corollary 4.18.)

*Needs:* [Relative CM conductor tower](#07-relative-cm-conductor-tower); [Ring-class tower and finite Galois quotients](#05-ring-class-tower-and-finite-galois-quotients); NeronModelsAndSemistableAbelianVarieties §§5.0a–5.0c; Chebotarev Layer 10, “Dirichlet-density Chebotarev”.

### 8.21 Indefinite primitive-character Heegner nonvanishing

In CV §4, require (H1) an Eichler order at P in a split B_P, (H2) maximal split level at primes Q≠P ramifying in K, a P-new nonzero ω-isotypic quotient α:J_H→A, and good CM points x of conductor P^n. For n sufficiently large and fixed admissible χ₀, some χ∈P(n,χ₀) has e_χα(x)≠0 in the Mordell–Weil space tensored with the character field. Weighted traces are non-torsion, not merely nonzero torsion points.

This target also assumes CV(H1),(H2), P-new quotient and good CM point; χ₀ω=1 on A_F×.

([cornut-vatsal](#references), Theorem 4.1; Theorem 4.10; Lemmas4.12–4.15 and Proposition 4.17; PDF pp.37,41–49.)

*Needs:* [Surjectivity onto CM reduction fibres](#810-surjectivity-onto-cm-reduction-fibres); [Primitive CM character stratum](#87-primitive-cm-character-stratum); [Distribution at nonmaximal local level](#25-distribution-at-nonmaximal-local-level); HilbertModularVarietiesAndShimuraCurves R18.4; [Finite torsion in the relative ring-class tower](#820-finite-torsion-in-the-relative-ring-class-tower).

### 8.22 Cornut–Vatsal indefinite nonvanishing

Under the same initial CV data, assume |S| odd, ω=1, and N,D_(K/F),P pairwise coprime. For every sufficiently large n there exists χ∈P(n,χ₀) such that L′(π,χ,1/2)≠0. Use the geometric character-point theorem and the precise generalized Gross–Zagier identity. The definite branch has a separate theorem.

This target also assumes ω=1; N,D,P pairwise coprime; |S| odd; χ₀ compatible with central character.

([cornut-vatsal](#references), Theorem 1.5 and §4; PDF pp.7,37–49.)

*Needs:* [Indefinite primitive-character Heegner nonvanishing](#821-indefinite-primitive-character-heegner-nonvanishing); [Generic CM root-number parity](#88-generic-cm-root-number-parity); GrossZagierAndArithmeticHeights §8.11 The Yuan–Zhang–Zhang Gross–Zagier formula.


### 8.24 Non-torsion Λ-adic bottom class

For the actual ordinary Heegner family y∞ under E(K)[p]=0, Λy∞ is free of rank one and y∞ is not Λ-torsion. CGLS gives this nonzero family with the actual class-number conductor shifts. No completed main conjecture, full integral image or p∤h_K assumption is used for this assertion.

This target also assumes E(K)[p]=0.

([cgls](#references), Theorem 4.1.1 and Remark 4.1.3; PDF pp.27–28.)

*Needs:* [Anticyclotomic Heegner class](#86-anticyclotomic-heegner-class); ArithmeticStatisticsPartVI, “Anticyclotomic character nonvanishing”; [Parametrization choice, degree and torsion](#16-parametrization-choice-degree-and-torsion); [CM and Heegner fields](#78-cm-and-heegner-fields) for the CM case; PadicMeasuresIwasawaAlgebras Layer 4 Weierstrass theory and module structure.

### 8.25 Continuous anticyclotomic characters near one

For odd p and a chosen topological generator γ of Γ≃ℤ_p, define the continuous near-identity character by α_r(γ^z)=((1+p)^(p^r))^z for z∈ℤ_p and r≥0. Continuous p-adic exponentiation gives a nontrivial ℤ_p-valued unit character. Prove the depth identity: v_p(α_r(γ)−1)=r+1, and the limit assertion: α_r tends to 1. This construction is valid for both split and inert unramified p. It supplies the nontrivial continuous twists in Castella–Sano §3.4, pp.17–18; the crystalline algebraic-Hecke construction is used only by the split BDP/logarithm branch.

*Needs:* the Γ≃ℤ_p coordinate; PadicMeasuresIwasawaAlgebras §§1.6–1.7; the p-adic unit group and continuous exponentiation.


Define the character by continuous binomial exponentiation with the chosen γ-coordinate. Its API is:

- Evaluation on γ^z is ((1+p)^(p^r))^z for every z∈ℤ_p.
- It is a continuous homomorphism Γ→ℤ_p×, with α_(r+1)=α_r^p.
- Its depth is v_p(α_r(γ)−1)=r+1; every α_r is nontrivial.
- The characters converge to the trivial character as r tends to infinity.

**Checks.**

- For p=3 and r=0, γ maps to 4, a nontrivial element of 1+3ℤ₃.
- For general odd p the valuation of (1+p)^(p^r)−1 is r+1; thus r≥m−1 enforces congruence modulo p^m.
- The limit character is trivial and is excluded from nonzero-specialization claims; no crystallinity at an inert prime is asserted.

### 8.26 Nonzero bottom classes near the identity

There is a neighbourhood of1 such that every nontrivial α in it has κ^Heeg_1(α)≠0. This follows from a non-Λ-torsion family and the finite zero set of a nonzero one-variable series. The specialization at α=1 is not included: its nonvanishing is equivalent to the appropriate analytic-rank-one condition.

This target also assumes E(K)[p]=0.

([bcgs](#references), Theorem 1.1.6; PDF pp.10.)

*Needs:* [Non-torsion Λ-adic bottom class](#824-non-torsion-λ-adic-bottom-class); PadicMeasuresIwasawaAlgebras Layer 4 Weierstrass theory and module structure; [Anticyclotomic Heegner class](#86-anticyclotomic-heegner-class); PadicMeasuresIwasawaAlgebras §1.6 Moments and characters of unit measures; §1.7 Comparison with the completed group algebra.

### 8.27 Λ-adic Heegner derivative class

For each squarefree allowed n, apply the imported derivative operator to Q[n] (or the normalized ordinary family), sum the finite ring-class torsion orbit, and descend its invariant Kummer class through the actual restriction isomorphism. Obtain κ^Λ_n in the generic Λ-adic Kolyvagin-system coefficient. Preserve the cyclic-Galois tensor and the finite/singular correction maps; the bottom is the specified Heegner Λ-line.

This target also assumes E(K)[p]=0.

The required API is:

- Restriction recovers the invariant differentiated Kummer class.
- Changing a cyclic generator transforms the class together with the specified tensor factor.
- Coefficient reduction commutes with the class when the quotient ideals are ordered correctly.
- At empty auxiliary support, use the actual universal-norm Heegner bottom class.

**Checks.**

- The empty derivative acts as identity before the actual restriction inverse.
- A zero point family gives zero derivative class.
- The zero map ℤ→ℤ has the two preimages 0 and 1; this excludes the restriction equivalence needed for descent.

- On ℤ², let χ(x,y)=(x+y,y). The inverse image of κ=(0,1) is (−1,1), since χ(−1,1)=(0,1); forward application gives (1,1) and χ(1,1)=(2,1). With derivative equal to the identity this is also the descended derivative value.

([howard](#references), §2.3, construction following Lemma 2.3.3; PDF pp.30; [cgls](#references), Theorem 4.1.1, proof and class-number-shift/local-condition adaptation; PDF pp.27–28.)

*Needs:* [Howard universal-norm Heegner family](#85-howard-universal-norm-heegner-family); [Anticyclotomic Heegner class](#86-anticyclotomic-heegner-class); [Descended Heegner derivative class](#44-descended-heegner-derivative-class); [Generator change and intrinsic tensor coefficient](#47-generator-change-and-intrinsic-tensor-coefficient); EulerSystemsAndKolyvaginSystems §§3.1–3.8 Kolyvagin derivatives and descent; EulerSystemsAndKolyvaginSystems §§8.28, 8.31 Self-dual Λ-adic bounds; [Howard universal-norm Heegner family](#85-howard-universal-norm-heegner-family).


### 8.28 Λ-adic Heegner local conditions

The constructed derivative classes satisfy the transverse condition at ℓ|n, unramified condition away from pNn, and the prescribed propagated condition at bad primes. At v|p the image lies in the ordinary Fil⁺ condition. The proof treats finite decomposition at bad primes and finite ordinary-reduction torsion; it does not replace integral Kummer conditions by rational ones.

This target also assumes Howard’s clean image hypothesis for the direct proof; weaker local verification uses the exact CGLS Theorem 4.1.1 adaptation.

([howard](#references), Lemma 2.3.4; PDF pp.30–32; [cgls](#references), Theorem 4.1.1, proof and class-number-shift/local-condition adaptation; PDF pp.27–28.)

*Needs:* [Λ-adic Heegner derivative class](#827-λ-adic-heegner-derivative-class); [Transverse condition of the descended class](#51-transverse-condition-of-the-descended-class); SelmerIwasawaCohomology §3.5 Universal norms are unramified away from p; SelmerIwasawaCohomology §2.8 Greenberg’s local condition and §4.12 Finite versus ordinary local conditions with explicit exceptional terms; ArithmeticGaloisDuality R02.4; [Anticyclotomic Heegner class](#86-anticyclotomic-heegner-class); [Λ-adic Heegner derivative class](#827-λ-adic-heegner-derivative-class).

### 8.29 Λ-adic finite/singular Heegner compatibility

The corrected Λ-adic derivative system satisfies the generic finite/singular comparison at each allowed ℓ. Its arithmetic reduction congruence and the local χ_ℓ identification must commute with localization through the actual Galois change-of-group action. A merely local matrix is not a global G_K-equivariant coefficient endomorphism.

([howard](#references), Lemmas2.3.5–2.3.6; PDF pp.32–34; [cgls](#references), Theorem 4.1.1, proof and class-number-shift/local-condition adaptation; PDF pp.27–28.)

*Needs:* [Λ-adic Heegner derivative class](#827-λ-adic-heegner-derivative-class); [Λ-adic Heegner local conditions](#828-λ-adic-heegner-local-conditions); [Heegner finite–singular correction automorphism](#52-heegner-finitesingular-correction-automorphism); [Corrected Heegner Kolyvagin system](#53-corrected-heegner-kolyvagin-system); EulerSystemsAndKolyvaginSystems §§3.1–3.8 Kolyvagin derivatives and descent; [Λ-adic Heegner derivative class](#827-λ-adic-heegner-derivative-class); [Howard universal-norm Heegner family](#85-howard-universal-norm-heegner-family).

### 8.30 Howard’s anticyclotomic divisibility theorem

Under Howard’s TheoremA hypotheses, p odd good ordinary, p∤h_K, p,N,D_K pairwise coprime and G_K→GL₂(ℤ_p) surjective, S=H¹_FΛ(K,T⊗Λ) is Λ-torsion-free of rank one, and its discrete dual X is pseudo-isomorphic to Λ⊕M⊕M for a finitely generated torsion Λ-module M with char(M)=char(M)^ι. Moreover char(M) divides char(S/H), H the actual Heegner Λ-line. Equality and integral primitivity are not conclusions.

This target also assumes G_K→GL₂(ℤ_p) surjective; p∤h_K; p,D_K,N pairwise coprime.

([howard](#references), TheoremB; Proposition 2.1.3; Lemma 2.2.7–Theorem 2.2.10; PDF pp.2–3,23,25–28.)

*Needs:* [Non-torsion Λ-adic bottom class](#824-non-torsion-λ-adic-bottom-class); [Λ-adic finite/singular Heegner compatibility](#829-λ-adic-finitesingular-heegner-compatibility); [Unit comparison of Heegner normalizations](#813-unit-comparison-of-heegner-normalizations); EulerSystemsAndKolyvaginSystems §§8.28, 8.31 Self-dual Λ-adic bounds; SelmerIwasawaCohomology §§3.3, 3.9–3.10 Descent and control; local and derived specialization; PadicMeasuresIwasawaAlgebras Layer 4 Weierstrass theory and module structure.

### 8.31 Weaker torsion hypothesis and localized bound

Under (disc), ordinary Heegner conditions and E(K)[p]=0, the CGLS Heegner family exists and the rank-one paired-torsion bound holds over Λ[1/p,1/(γ−1)]. The augmentation inversion can be removed under the source’s extra corank-one condition. The BCS/CGS error-controlled bounds supply stronger assertions in their stated branches; class-number retention alone does not do so.

This CGLS application also assumes (disc) and E(K)[p]=0.

([cgls](#references), Theorems4.1.1–4.1.2; PDF pp.27–28.)

*Needs:* [Anticyclotomic Heegner class](#86-anticyclotomic-heegner-class); [Non-torsion Λ-adic bottom class](#824-non-torsion-λ-adic-bottom-class); [Λ-adic Heegner local conditions](#828-λ-adic-heegner-local-conditions); EulerSystemsAndKolyvaginSystems §§8.28, 8.31 Self-dual Λ-adic bounds.


**Checks.**

- For K=ℚ(√−3), D_K=−3 is odd but fails (disc), including at p=5, where p∤D_K and u_K=3 is a unit. The missing source hypothesis is distinct from invertibility of the unit index.
- For K=ℚ(√−7), D_K=−7 and u_K=1 satisfy (disc) and this unit obstruction is absent.
- Inverting γ−1 removes the augmentation support, whereas inverting p removes p-content; neither localization is an integral equality in Λ.
### 8.32 Heegner specialization with the initial factor

If α≡1 modulo p^m and M(n)≥m, then κ^Λ_n(α)≡C_pκ_n^Heeg modulo p^m. Here C_p=(α_p−1)²(β_p−1)² for split p and C_p=Φ₀=(p+1)²−a_p² for inert p, in the prescribed normalization. The reduction exists because I_n⊂p^mℤ_p. C_p can be a nonunit; at split p its valuation is twice v_p(#Ẽ(𝔽_p)).

This target also assumes E(K)[p]=0. α is an anticyclotomic twist sufficiently close to1; M(n)≥m.

([bcgs](#references), Lemma 1.1.5 (split-prime branch); PDF pp.9; [cs](#references), Lemma 3.1.1 and equation (3.5), both unramified splitting types; PDF pp.12–13.)

*Needs:* [Λ-adic Heegner derivative class](#827-λ-adic-heegner-derivative-class); [Unit comparison of Heegner normalizations](#813-unit-comparison-of-heegner-normalizations); [Coefficient reduction and auxiliary-prime restriction](#48-coefficient-reduction-and-auxiliary-prime-restriction); [Howard universal-norm Heegner family](#85-howard-universal-norm-heegner-family); [Λ-adic Heegner derivative class](#827-λ-adic-heegner-derivative-class); PadicMeasuresIwasawaAlgebras §1.6 Moments and characters of unit measures; §1.7 Comparison with the completed group algebra.

### 8.33 Uniform arithmetic Kolyvagin error bound

There exist M and E depending only on T_pE such that, for α≡1 modulo p^m with m≥M and a collection κ̃_n∈H¹(K,T_α/I_nT_α) on a permitted prime set containing every sufficiently deep L_e, with κ̃₁≠0 and one fixed t≥0 for which {p^tκ̃_n}_n is an ordinary Kolyvagin system, H¹_Ford(K,T_α) has ℤ_p-rank one and the discrete ordinary Selmer group H¹_Ford(K,W_α⁻¹) is ℚ_p/ℤ_p⊕M_α⊕M_α, with length M_α≤ind(κ̃₁)+E. The constants are independent of m, the prime set and t. The divided collection itself need not be an integral Kolyvagin system. Under the source’s surjectivity hypothesis E=0.

This target also assumes E(K)[p]=0. The allowed prime set contains L_e for all sufficiently large e. The collection has nonzero bottom class and one common multiple p^tκ̃ satisfying every Kolyvagin-system relation, with t independent of n.

([bcgs](#references), Theorem 1.3.1 and its cited CGS proof; PDF pp.15.)

*Needs:* [Λ-adic Heegner local conditions](#828-λ-adic-heegner-local-conditions); [Λ-adic finite/singular Heegner compatibility](#829-λ-adic-finitesingular-heegner-compatibility); EulerSystemsAndKolyvaginSystems §§4.13, 4.18–4.19 All-prime descent and uniform errors; [Continuous anticyclotomic characters near one](#825-continuous-anticyclotomic-characters-near-one).

### 8.34 Weak-torsion Heegner bound at the augmentation prime

Under (disc), (Heeg), good ordinary odd p prime to ND_K and E(K)[p]=0, apply the uniform-error descent to the actual Heegner system of §§8.27–8.29, with its non-torsion bottom class from §8.24. Then S has Λ-rank one and X is pseudo-isomorphic to Λ⊕M⊕M for a finitely generated torsion Λ-module M with `char_Λ(M)` dividing `char_Λ(S/Λy∞)` in Λ[1/p]. Equivalently `char_Λ(X_tors) ⊃ char_Λ(S/Λy∞)²` there. This includes the height-one prime (γ−1); neither residual irreducibility nor a corank-one or analytic-rank hypothesis is imposed. In the split Eisenstein application the ordinary system is exactly the CGLS system with its class-number shifts and fixed source normalization.

Use §8.33 with characters approaching augmentation and an error constant independent of their distance from 1; this bounds the augmentation length just as at the other height-one primes. A bound whose error grows with that distance would only give §8.31’s localization. This target is the arithmetic application of CGS Theorems 6.5.1–6.5.2, §6.5, pp.29–30, rather than an invocation of a completed Heegner main conjecture.

**Checks.**

- In A=ℤ₅⟦T⟧[1/5], take M=A/(T²) and a rank-one Heegner quotient Q=A/(T³). At (T) the lengths are 2≤3, and the paired inequality is 4≤6, giving (T⁴)⊃(T⁶).
- With M=A/(T⁴) and Q=A/(T³), the inequality is 4≤3 and fails; inverting T makes both ideals the unit ideal and conceals this failure. Thus §8.31 alone cannot supply this target.
- Over 𝔽₅, diag(2,3) has a reducible two-dimensional representation with zero invariant space: (2−1)x=0 and (3−1)y=0 force x=y=0. This distinguishes the invariant-vanishing hypothesis from residual irreducibility without asserting a global elliptic realization of this matrix.

*Needs:* [Λ-adic Heegner derivative class](#827-λ-adic-heegner-derivative-class); [Λ-adic Heegner local conditions](#828-λ-adic-heegner-local-conditions); [Λ-adic finite/singular Heegner compatibility](#829-λ-adic-finitesingular-heegner-compatibility); [Non-torsion Λ-adic bottom class](#824-non-torsion-λ-adic-bottom-class); [Uniform arithmetic Kolyvagin error bound](#833-uniform-arithmetic-kolyvagin-error-bound); SelmerIwasawaCohomology §§3.3, 3.9–3.10 specialization and control; PadicMeasuresIwasawaAlgebras Layer 4 characteristic ideals. No finite-system nonvanishing theorem is an input.

### 8.35 Near-trivial logarithm index formula

With E_• and crystalline α as in BCGS Lemma 1.2.3 sufficiently close to1, L_BDP(α⁻¹)≠0 and κ_1^•(α)≠0, let t_α=length_(ℤ_p^ur)(ℤ_p^ur/L_BDP(α⁻¹)), q_•=#H⁰(ℚ_p,E_•[p∞]), I_•=#(S_α/ℤ_pκ_1^•(α)), and C_•=#coker(loc_v) modulo torsion. Then p^tα q_•=I_•C_•. Use the source’s coefficient extension and square-root BDP normalization.

This target also assumes E(K)[p]=0. p splits as v v̄ in K. α is crystalline at both primes above p and comes from a Hecke character of infinity type (n,−n), with n≥0 and n divisible by p−1, as in BCGS Theorem 1.2.1 and Lemma 1.2.3. Assume L_BDP(α⁻¹)≠0; for the displayed near-identity formulas take α≡1 modulo p^m with m sufficiently large.

([bcgs](#references), Lemma 1.2.3; PDF pp.11–12.)

*Needs:* [Uniform arithmetic Kolyvagin error bound](#833-uniform-arithmetic-kolyvagin-error-bound); [Nonzero bottom classes near the identity](#826-nonzero-bottom-classes-near-the-identity); [Optimal and distinguished lattice comparison](#816-optimal-and-distinguished-lattice-comparison); GrossZagierAndArithmeticHeights §9.20 Bloch–Kato logarithm of the Heegner Kummer class; gap:integral-family-logarithm; PadicHodgeRegulators §§1.3, 1.9–1.10 Bloch–Kato logarithms and §§8.17–8.22 Perrin–Riou regulators; SelmerIwasawaCohomology §3.6 Semilocal cohomology and descent of local classes; [Crystalline characters near the identity](#814-crystalline-characters-near-the-identity).

### 8.36 Twisted anticyclotomic control formula

For m≫0, crystalline α=α_m and L_BDP(α⁻¹)≠0, prove that the strict-at-v, unrestricted-at-v̄ Greenberg dual is Λ-torsion. Let F_E generate its characteristic ideal, q_E=#H⁰(ℚ_p,E[p∞]), C_α the finite cokernel cardinality of localization from S_α to H¹(K_v,Fil⁺_vT_α)/tors, and c_w^(p)(α⁻¹)=#H¹_ur(K_w,W_α⁻¹). With Sha(W_α⁻¹/K)=H¹_Ford(K,W_α⁻¹)/H¹_Ford(K,W_α⁻¹)_div, prove finiteness of these factors and the identity #(ℤ_p/F_E(α⁻¹))=#Sha(W_α⁻¹/K)·C_α²·∏_(w|N)c_w^(p)(α⁻¹)·q_E². The finite Sha is the source’s propagated Selmer quotient. The formula is integral and uses all K-primes over N and the finite/torsion local cokernel.

Prove this arithmetic evaluation from the supplied condition-change and specialization sequences. Nonvanishing of the specialized Heegner bottom and §8.33 give ordinary Selmer corank one; complex conjugation supplies the inverse twist. Local Tate duality gives local ordinary corank one, and the integral family logarithm of §8.35 makes localization nonzero on the compact rank-one lattice. Its discrete divisible map is therefore onto. The condition-change sequence then gives #H¹_FGr(K,W_α⁻¹)=#Sha(W_α⁻¹/K)·C_α². Evaluate the specialization errors: the bad-prime terms give ∏_(w|N)c_w^(p)(α⁻¹), and the two ordinary H⁰ errors give q_E². Twisting the Iwasawa action identifies the resulting Euler characteristic with #(ℤ_p/F_E(α⁻¹)). These are targets here for the actual Heegner local conditions; the generic error sequences alone do not evaluate these factors (BCGS Theorem 1.2.7, proof, pp.13–14).

This target also assumes E(K)[p]=0. p splits as v v̄ in K. α is crystalline at both primes above p and comes from a Hecke character of infinity type (n,−n), with n≥0 and n divisible by p−1, as in BCGS Theorem 1.2.1 and Lemma 1.2.3. Assume L_BDP(α⁻¹)≠0; for the displayed near-identity formulas take α≡1 modulo p^m with m sufficiently large.

([bcgs](#references), Theorem 1.2.7 (JSW control theorem as used there); PDF pp.13–14.)

*Needs:* [Uniform arithmetic Kolyvagin error bound](#833-uniform-arithmetic-kolyvagin-error-bound); [Crystalline characters near the identity](#814-crystalline-characters-near-the-identity); [Nonzero bottom classes near the identity](#826-nonzero-bottom-classes-near-the-identity); SelmerIwasawaCohomology §§3.3, 3.9–3.11 local error cones, derived specialization and restriction-control sequences; SelmerIwasawaCohomology §2.19 Poitou–Tate for Selmer groups and §§2.21–2.23 mapping fibre, H⁰ correction and condition-change triangles; [Near-trivial logarithm index formula](#835-near-trivial-logarithm-index-formula).

**Checks.**

- With p=5, #Sha=5², C_α=5, two rational bad primes split in K with local p-parts 5 and 25 at each of their two K-primes, and q_E=5, the formula gives valuation 2+2+2(1+2)+2=12, hence cardinality 5¹². Counting each rational bad prime only once gives valuation 9 and loses three powers of 5.
- If Sha, the cokernel and all local factors are trivial, the cardinality is 1; finite groups of order 1 contribute length zero, not one.
- Changing C_α from 1 to 5 multiplies the right side by 25. Replacing the square by a single cokernel factor would multiply it by only 5.

### 8.37 Integral main conjecture and twisted index square

Assume the integral anticyclotomic Greenberg main conjecture in Λ^ur with the BCGS square-root convention. For crystalline α_m sufficiently close to1 with L_BDP(α_m⁻¹)≠0, the p-optimal curve satisfies I₀(α)²=#Sha(W_α⁻¹/K)·∏_(w|N)c_w^(p)(α⁻¹)·q₀⁴. A rational main conjecture supplies only a bounded p-power error; it does not supply this exact equality.

This target also assumes E(K)[p]=0. p splits as v v̄ in K. Integral anticyclotomic Greenberg main conjecture and the p-optimal lattice. α is crystalline at both primes above p and comes from a Hecke character of infinity type (n,−n), with n≥0 and n divisible by p−1, as in BCGS Theorem 1.2.1 and Lemma 1.2.3. Assume L_BDP(α⁻¹)≠0; for the displayed near-identity formulas take α≡1 modulo p^m with m sufficiently large.

([bcgs](#references), Corollary 1.2.12; Remark 1.2.11; PDF pp.14.)

*Needs:* [Near-trivial logarithm index formula](#835-near-trivial-logarithm-index-formula); [Twisted anticyclotomic control formula](#836-twisted-anticyclotomic-control-formula); [Tamagawa factors near the identity](#817-tamagawa-factors-near-the-identity); [Optimal and distinguished lattice comparison](#816-optimal-and-distinguished-lattice-comparison); ModularIwasawaMainConjectures §§0.5–0.10 The three cyclotomic formulations; [Crystalline characters near the identity](#814-crystalline-characters-near-the-identity).

### 8.38 Determinantal Heegner element

For the strict ordinary complex of §8.18 under (Heeg), (disc), good ordinary unramified p and E(K)[p]=0, prove its perfectness over Λ and torsion-freeness of S. Apply §8.31 to the actual system of §§8.27–8.29 with the non-torsion bottom of §8.24 to obtain rank one: localization at p and γ−1 preserves the rank over Q(Λ), even though it can lose height-one lengths. Only then obtain from Poitou–Tate duality the canonical rational isomorphism Q(Λ)⊗det_Λ⁻¹ RΓ̃_f(K,T⊗Λ) ≃ Q(Λ)⊗(S⊗_Λ S^ι). Define z̃∞ as the inverse image of y∞⊗y∞ under this isomorphism. The main conjecture asserts z̃∞ generates the integral determinant lattice, not merely its rationalization.

This target also assumes E(K)[p]=0. p unramified in K; the source’s rational determinant comparison.

The required API is:

- The rational determinant map sends z̃∞ to y∞⊗y∞ with the second factor ι-twisted.
- It is the unique rational determinant preimage of that Heegner tensor.
- Rescaling y∞ by a multiplies z̃∞ by a·ι(a), not merely a.
- Compatible derived base change and determinant comparison carry z̃∞ to the tensor of the specialized bottom classes.

**Checks.**

- In S=Λ² a nonzero line Λ(1,0) gives rank at least one, but rank S=2; the nonzero bottom alone cannot supply the rank-one hypothesis of the determinant map.
- For the rank-one module Λ, localization at p and γ−1 still has rank one over Q(Λ), although Λ/(γ−1) becomes zero; rank descent needs no augmentation length equality.
- With identity involution and y rescaled by p, the element scales by p².
- Under the identity tensor comparison over ℤ with trivial involution and y=5, the Heegner tensor y⊗y has coefficient 25 under ℤ⊗ℤ≃ℤ. It is nonzero rationally and a nonunit integrally; choosing a rational basis cannot erase its integral index 25.

- For a=γ of infinite order in Γ, ι(γ)=γ⁻¹, so simultaneous Heegner rescaling multiplies z̃∞ by γγ⁻¹=1. A square would give γ²≠1, including at p=2.

([cs](#references), Conjecture 3.2.2 and preceding determinant isomorphism; PDF pp.13–14.)

*Needs:* [Weaker torsion hypothesis and localized bound](#831-weaker-torsion-hypothesis-and-localized-bound); [Arithmetic strict ordinary Selmer complex comparison](#818-arithmetic-strict-ordinary-selmer-complex-comparison); [Non-torsion Λ-adic bottom class](#824-non-torsion-λ-adic-bottom-class); ModularIwasawaMainConjectures §§0.5–0.10 The three cyclotomic formulations; PadicMeasuresIwasawaAlgebras Layer 5 determinants, specialization and exactness.


### 8.39 Heegner determinant and characteristic ideals

The assertion that z̃∞ is an integral determinant basis is equivalent to char_Λ(S/Λy∞)·char_Λ(S/Λy∞)^ι=char_Λ(X_Gr(A)_tors) for the CS all-p ordinary dual. Writing a square requires the source’s ι-invariance; rational equality cannot certify an integral basis.

This target also assumes E(K)[p]=0.

([cs](#references), Proposition 3.2.3; PDF pp.14.)

*Needs:* [Determinantal Heegner element](#838-determinantal-heegner-element); [Arithmetic strict ordinary Selmer complex comparison](#818-arithmetic-strict-ordinary-selmer-complex-comparison); PadicMeasuresIwasawaAlgebras Layer 4 Weierstrass theory and module structure; PadicMeasuresIwasawaAlgebras Layer 5 determinants, specialization and exactness; [Determinantal Heegner element](#838-determinantal-heegner-element).

### 8.40 Specialized Heegner determinant lattice

For a continuous α:Γ→ℤ_p× with α≡1 modulo p^m, m≫0 and κ₁,Λ^Heeg(α)≠0, apply §8.33 to the specialization of the actual system of §§8.27–8.29. Complex conjugation transports its nonzero bottom and ordinary conditions to α⁻¹. The two rank bounds, together with torsion-freeness, prove that both S_(α±1) are free of rank one. The resulting specialized rational determinant map to S_α⊗S_α⁻¹ sends the integral determinant lattice, up to a ℤ_p-unit, to L_p²·Tam_E²·#X_BK(T_α*/K) times that tensor lattice. Here X_BK is the finite quotient of the propagated Selmer group in CS; for a general twist it need not be the Bloch–Kato group. Tam_E=∏_(ℓ|N)c_ℓ over ℚ.

This target also assumes E(K)[p]=0. p unramified in K; α continuous with α≡1 modulo p^m; κ₁,Λ^Heeg(α)≠0; m sufficiently large.

([cs](#references), Proposition 3.3.2; PDF pp.14–15.)

*Needs:* [Uniform arithmetic Kolyvagin error bound](#833-uniform-arithmetic-kolyvagin-error-bound); [Λ-adic Heegner derivative class](#827-λ-adic-heegner-derivative-class); [Λ-adic Heegner local conditions](#828-λ-adic-heegner-local-conditions); [Λ-adic finite/singular Heegner compatibility](#829-λ-adic-finitesingular-heegner-compatibility); [Arithmetic strict ordinary Selmer complex comparison](#818-arithmetic-strict-ordinary-selmer-complex-comparison); [Determinantal Heegner element](#838-determinantal-heegner-element); [Ordinary local specialization defect](#819-ordinary-local-specialization-defect); [Tamagawa factors near the identity](#817-tamagawa-factors-near-the-identity); SelmerIwasawaCohomology §§3.3, 3.9–3.10 Descent and control; local and derived specialization; ArithmeticGaloisDuality R02.4; PadicMeasuresIwasawaAlgebras Layer 5 determinants, specialization and exactness; [Determinantal Heegner element](#838-determinantal-heegner-element); PadicMeasuresIwasawaAlgebras §1.6 Moments and characters of unit measures; §1.7 Comparison with the completed group algebra.


**Checks.**

- For Λ=ℤ₅⟦T⟧, α(γ)=1+5^m has α⁻¹(γ)=(1+5^m)⁻¹≡1 modulo 5^m and α·α⁻¹=1. Conjugation exchanges these two specialization parameters, rather than using α twice.
- The nonzero vector (1,0) in ℤ₅² has rank-one span inside a rank-two lattice; a nonzero specialized bottom alone cannot prove that the ambient Selmer lattice has rank one.
- If the two Selmer lattices are ℤ₅ and the correction product is 5⁴, the determinant lattice maps to 5⁴ℤ₅ inside ℤ₅⊗ℤ₅≃ℤ₅, of index 625. Rationalizing makes 5⁴ invertible and cannot detect this integral index.

### 8.41 Exact paired Selmer length for a Heegner system

For p≥3, a surjective residual representation and the generic self-dual rank-one hypotheses, the specialized actual anticyclotomic Heegner system over a coefficient DVR R finite over ℤ_p with κ₁≠0 gives length_R Sha(W_(α⁻¹)/K)=2(M₀(α)−M∞(α)), where the profile is that of the system on T_α. Conjugation identifies the α and α⁻¹ finite quotients and hence their lengths. No near-triviality is needed in the generic theorem; near-trivial α is used in the arithmetic application. The deep-prime restriction and rigidity hypotheses remain explicit. BCGS states Theorem 2.2.2 for p≥3 through Proposition 2.2.1, but its proof invokes Lemma 2.2.4, stated only for p>3. The p=3 rigidity input is the explicit supplier contract `gap:self-dual-rigidity-three`; the p>3 lemma alone does not supply it.

This target also assumes E(K)[p]=0. Residual G_Q representation surjective; R a coefficient DVR finite over ℤ_p; the source’s self-dual/cartesian hypotheses and κ₁≠0. At p=3 use `gap:self-dual-rigidity-three`; at p>3 use BCGS Lemma 2.2.4.

([bcgs](#references), Proposition 2.2.1; Theorem 2.2.2; Lemma 2.2.4; PDF pp.17–19.)

*Needs:* `gap:self-dual-rigidity-three`; [Heegner divisibility profile](#815-heegner-divisibility-profile); [Λ-adic Heegner derivative class](#827-λ-adic-heegner-derivative-class); [Λ-adic Heegner local conditions](#828-λ-adic-heegner-local-conditions); [Λ-adic finite/singular Heegner compatibility](#829-λ-adic-finitesingular-heegner-compatibility); EulerSystemsAndKolyvaginSystems §§4.13, 4.18–4.19 All-prime descent and uniform errors.

### 8.42 BCGS nonvanishing from the main conjecture

Under (Heeg),(disc),(tor), p odd good ordinary and split in K, the rational anticyclotomic main conjecture (indeed its required lower divisibility after inverting p) implies κ_n^Heeg≠0 for some squarefree n of allowed Kolyvagin primes. No analytic-rank-one hypothesis is made and κ₁ may vanish.

This target also assumes E(K)[p]=0. p splits as v v̄ in K. Rational anticyclotomic main conjecture, kept as a theorem hypothesis.

([bcgs](#references), TheoremA and §2.1; PDF pp.2,15–16.)

*Needs:* [Heegner specialization with the initial factor](#832-heegner-specialization-with-the-initial-factor); [Nonzero bottom classes near the identity](#826-nonzero-bottom-classes-near-the-identity); [Near-trivial logarithm index formula](#835-near-trivial-logarithm-index-formula); [Twisted anticyclotomic control formula](#836-twisted-anticyclotomic-control-formula); [Tamagawa factors near the identity](#817-tamagawa-factors-near-the-identity); [Uniform arithmetic Kolyvagin error bound](#833-uniform-arithmetic-kolyvagin-error-bound); [Heegner divisibility profile](#815-heegner-divisibility-profile).

### 8.43 BCGS refined divisibility from the integral conjecture

Assume p>3, surjective residual G_Q→GL₂(𝔽_p), good ordinary p split in K, (Heeg),(disc),(tor), a p-optimal parametrization, and the integral anticyclotomic main conjecture. Then M∞ of the finite Heegner system is finite and equals Σ_(ℓ|N)v_p(c_ℓ(E/ℚ)). This is half the sum over K-primes; it is neither M₀ nor the order of Sha.

This target also assumes E(K)[p]=0. p splits as v v̄ in K. p>3; residual surjectivity; p-optimal parametrization; integral main conjecture.

([bcgs](#references), TheoremB and §2.2; PDF pp.3,17–20.)

*Needs:* [BCGS nonvanishing from the main conjecture](#842-bcgs-nonvanishing-from-the-main-conjecture); [Integral main conjecture and twisted index square](#837-integral-main-conjecture-and-twisted-index-square); [Exact paired Selmer length for a Heegner system](#841-exact-paired-selmer-length-for-a-heegner-system); [Heegner specialization with the initial factor](#832-heegner-specialization-with-the-initial-factor); [Tamagawa factors near the identity](#817-tamagawa-factors-near-the-identity); [Heegner divisibility profile](#815-heegner-divisibility-profile).

### 8.44 Twisted index square from the determinant conjecture

If z̃∞ generates the integral Selmer determinant and α is sufficiently close to1 but nontrivial, then the square of the Heegner bottom index equals L_p² Tam_E² #X_BK(T_α*/K), up to a ℤ_p-unit (equivalently as p-valuations). The transported Φ comparison and unit normalization remain explicit.

This target also assumes E(K)[p]=0. Integral determinantal main conjecture; p unramified in K.

([cs](#references), Corollary 3.3.4; PDF pp.16.)

*Needs:* [Specialized Heegner determinant lattice](#840-specialized-heegner-determinant-lattice); [Determinantal Heegner element](#838-determinantal-heegner-element); [Nonzero bottom classes near the identity](#826-nonzero-bottom-classes-near-the-identity); [Heegner specialization with the initial factor](#832-heegner-specialization-with-the-initial-factor).

### 8.45 Castella–Sano refined conjecture equivalence

For p>3, residual G_Q surjectivity, good ordinary p unramified in K, (Heeg),(disc), and a parametrization whose Manin constant is prime to p, M∞=v_p(Tam_E) holds if and only if the integral determinantal Heegner main conjecture of CS3.2.2 holds. The theorem permits inert p; it does not prove that conjecture at inert p.

This target also assumes E(K)[p]=0. p>3; residual G_Q surjectivity; p unramified in K; p∤Manin constant.

([cs](#references), TheoremC; §3.4 proof; PDF pp.4–5,16–17.)

*Needs:* [Continuous anticyclotomic characters near one](#825-continuous-anticyclotomic-characters-near-one); [Twisted index square from the determinant conjecture](#844-twisted-index-square-from-the-determinant-conjecture); [Heegner determinant and characteristic ideals](#839-heegner-determinant-and-characteristic-ideals); [Exact paired Selmer length for a Heegner system](#841-exact-paired-selmer-length-for-a-heegner-system); [Heegner specialization with the initial factor](#832-heegner-specialization-with-the-initial-factor); [Ordinary local specialization defect](#819-ordinary-local-specialization-defect); [Uniform arithmetic Kolyvagin error bound](#833-uniform-arithmetic-kolyvagin-error-bound); [Heegner divisibility profile](#815-heegner-divisibility-profile); PadicMeasuresIwasawaAlgebras Layer 4 Weierstrass theory and module structure.


### Examples

In ℤ₅[C₃], p=5 and a_p=1 give Φ=27−s−s² of unit coefficient content and augmentation 25. Hence the scalar local factor has valuation 2 although coefficient content has valuation 0. With trivial involution, bottom lattice index 5³ and stable system divisibility 1, the exact paired length is 2(3−1)=4. Rescaling y∞ by γ changes its determinant tensor by γ·ι(γ)=1 (§§8.1, 8.19, 8.38, 8.41).

### Dependencies

This layer uses the earlier internal targets specified in each *Needs:* sentence, the pinned algebraic APIs, and EulerSystemsAndKolyvaginSystems, GL2AutomorphicRepresentationsAndTransfer, GrossZagierAndArithmeticHeights, HilbertModularVarietiesAndShimuraCurves, KatoEulerSystems, ModularIwasawaMainConjectures, NeronModelsAndSemistableAbelianVarieties, PadicHodgeRegulators, PadicMeasuresIwasawaAlgebras.

## Layer 8b: Split-prime anticyclotomic equalities and applications

Reconcile BDP conventions and local conditions first. The Euler-system bound gives one divisibility; the BCS auxiliary-field, congruence and μ argument gives the other. Rational equality needs residual irreducibility, while the integral branch uses the stronger image and lattice hypotheses. The independent early Eisenstein equality is a separate supplied branch. Only after the appropriate equality has been proved may the conditional BCGS and Castella–Sano implications from Layer 8 be applied as unconditional split-prime results.

### 8b.1 BDP square-root convention comparison

After the same coefficient extension and primitive/imprimitive local normalizations, the single-power anticyclotomic function of CGS and BCS generates the same ideal as (L_BDP^BCGS)² in Λ^ur. The CGS comparison is used in its odd-prime Eisenstein setting; the BCS comparison is used in its stated irreducible setting. Period/unit conventions are compared as ideals, not by arbitrary exact equality of functions. All nonunit Euler factors in changes of local condition remain visible.

([bcgs](#references), Theorem 1.2.1 and Conjecture 1.2.10; PDF pp.10,14; [bcs](#references), Conjecture 1.2.1, following Remark 1.2.3, and Theorem 1.2.4; PDF pp.3; [cgs](#references), Theorem C and Greenberg reformulation, pp.3–4.)

*Needs:* GrossZagierAndArithmeticHeights §9.14 Normalization of the toric root and its square; GrossZagierAndArithmeticHeights §9.22 Dictionary between Skinner’s function and BDP/Brooks functions; gap:integral-family-logarithm. The independent primitive toric μ input is required only by the BCS reverse-divisibility route in §8b.5.

### 8b.2 Anticyclotomic main-conjecture comparison

In the classical N⁻=1 split ordinary setting with (disc), p>3 and H⁰(G_K,E[p])=0, use the source-normalized family and integral lattice of §8.6a and the BDP function with its matched Néron periods, retaining the fixed-isogeny factors of §8.6a when changing lattices. For these objects the integral Heegner-index divisibility char(X_tors) ⊃ char(S/Λy∞)² is equivalent to the corresponding Greenberg/BDP divisibility char(X_(0,empty))Λ^ur ⊃ (L_BDP²), with the reverse divisibilities also equivalent (BCK Theorem 5.2). Retain the coefficient extension, finite local cokernels, ι and nonunit Euler factors. This comparison does not itself prove either divisibility. On the same lattice, if y∞=a y∞,src with a≠0, its logarithm is aL_BDP; the comparison uses that scaled function, or retains (a)² explicitly when using the source BDP function. It never pairs a rescaled Heegner line with an unchanged BDP normalization. Separately, CGLS Proposition 4.2.1 proves the analogous comparison after inverting p under E(K)[p]=0 for odd p. For p=3 and surjective residual G_ℚ image, the integral comparison is required by gap:surjective-three-integral-comparison from the integral family reciprocity law and the two finite-cokernel Poitou–Tate sequences; these retain the height-one (3) length as well as the other height-one lengths. General weak-torsion p=3 does not follow from this surjective branch.

This target also assumes E(K)[p]=0. p splits as v v̄ in K. The BCK integral statement has p>3; the additional surjective p=3 branch uses its supplier contract; for the rational CGLS variant p is odd and both characteristic ideals are extended to Λ⊗ℚ_p.

([cgls](#references), Proposition 4.2.1 (rational comparison); PDF pp.28–29; [bck](#references), Theorem 5.2 and proof, published pp.1646–1647; standing p>3 and §5 split-prime hypotheses; PDF pp.20–21.)

*Needs:* [Primitive integral families and scalar corrections](#86a-primitive-integral-families-and-scalar-corrections); gap:surjective-three-integral-comparison for the surjective p=3 branch; [Anticyclotomic Heegner class](#86-anticyclotomic-heegner-class); [Λ-adic Heegner local conditions](#828-λ-adic-heegner-local-conditions); [Near-trivial logarithm index formula](#835-near-trivial-logarithm-index-formula); [BDP square-root convention comparison](#8b1-bdp-square-root-convention-comparison); SelmerIwasawaCohomology §2.3 Change of local conditions; SelmerIwasawaCohomology §2.19 Poitou–Tate for Selmer groups and §§2.21–2.22 mapping fibre and H⁰ correction; PadicHodgeRegulators §§1.3, 1.9–1.10 Bloch–Kato logarithms and §§8.17–8.22 Perrin–Riou regulators; gap:integral-family-logarithm; ModularIwasawaMainConjectures §§0.5–0.10 The three cyclotomic formulations.


**Checks.**

- In Λ=ℤ₃⟦T⟧, (3) and (1) differ, with respective height-one (3) lengths 1 and 0; both become (1) in Λ[1/3]. Rational comparison cannot establish the integral assertion.
- A unit change of periods has zero length at (3) and every other height-one prime; rescaling the Heegner line by 3 adds 2 to the square-index valuation, and its squared logarithm also gains valuation 2. Keeping the source BDP function instead requires the explicit factor (3²).
- The residual-surjective p=3 branch matches the contract’s image hypothesis; E(K)[3]=0 alone does not.
### 8b.3 Auxiliary quadratic fields for BCS descent

For the BCS irreducible branch, choose the auxiliary real quadratic F with p inert, D_F odd and every D_F-prime split in K; for ℓ|N choose ℓ inert in F when ℓ≡−1 modulo p and split otherwise. Retain irreducibility after restricting to G_(FK) and G_(F(ζ_p)), the p=5 exceptional real field exclusion and finite discriminant avoidance. These are the precise hypotheses used by the Hilbert/quartic-CM supplier.

This target also assumes E(K)[p]=0. p splits as v v̄ in K. p>3; E[p] irreducible over G_Q; the source’s auxiliary-field and Fujiwara(H1)–(H3) assumptions.

([bcs](#references), Proposition 5.2.1; Lemma 5.2.3; PDF pp.9–11.)

*Needs:* Chebotarev Layer 10, “Dirichlet-density Chebotarev”; AutomorphicCongruences L5w.1, L5w.3, L5w.10 Fujiwara, primitive periods and Hilbert-family divisibility.

### 8b.4 Heegner Euler-system divisibility for BCS

Under p odd ordinary, (Heeg),(disc) and E[p] irreducible over G_K, the actual Heegner family gives rank one and char(X_tors) ⊃ char(S/Λy∞)² after inverting p. In the split case the equivalent Greenberg/BDP bound holds. Under residual G_Q surjectivity the bounds are integral, including p=3; in that split-prime case use the surjective p=3 comparison contract of §8b.2, rather than its p>3 BCK statement. This is the weak-hypothesis CGS/BCS bound, not Howard B with its hypotheses silently removed.

This target also assumes E[p] irreducible over G_K; integral branch additionally has G_Q residual surjectivity.

([bcs](#references), Theorem 4.2.1 (whose citation CGS Theorem 5.5.2 is the earlier numbering of Theorem 6.5.2 of the cited CGS version); PDF pp.8–9.)

*Needs:* [Weak-torsion Heegner bound at the augmentation prime](#834-weak-torsion-heegner-bound-at-the-augmentation-prime); [Anticyclotomic Heegner class](#86-anticyclotomic-heegner-class); [Non-torsion Λ-adic bottom class](#824-non-torsion-λ-adic-bottom-class); [Λ-adic finite/singular Heegner compatibility](#829-λ-adic-finitesingular-heegner-compatibility); [Uniform arithmetic Kolyvagin error bound](#833-uniform-arithmetic-kolyvagin-error-bound); EulerSystemsAndKolyvaginSystems §§8.28, 8.31 Self-dual Λ-adic bounds; [Anticyclotomic main-conjecture comparison](#8b2-anticyclotomic-main-conjecture-comparison).

### 8b.5 BCS anticyclotomic reverse divisibility

For the chosen auxiliary F, the imported Wan/Fujiwara quartic-CM theorem, shared two-variable restriction/factorization, and anticyclotomic projection imply the reverse product divisibility for E/K and E^F/K against their BDP functions. Specialize the Greenberg local conditions exactly as in BCS §5, and obtain individual reverse divisibilities by combining the opposite Euler-system bounds and cancelling nonzero factors. Integral cancellation uses μ=0 and the source’s period/regulator hypotheses.

This target also assumes E(K)[p]=0. p splits as v v̄ in K. p>3; irreducible residual G_Q representation; all auxiliary-field and period hypotheses of the suppliers.

([bcs](#references), §5.1–§5.3; Proposition 5.2.1; proof of Theorems1.2.2/1.2.4; PDF pp.9–11.)

*Needs:* [Primitive integral families and scalar corrections](#86a-primitive-integral-families-and-scalar-corrections); [Auxiliary quadratic fields for BCS descent](#8b3-auxiliary-quadratic-fields-for-bcs-descent); [Heegner Euler-system divisibility for BCS](#8b4-heegner-euler-system-divisibility-for-bcs); [Anticyclotomic main-conjecture comparison](#8b2-anticyclotomic-main-conjecture-comparison); [BDP square-root convention comparison](#8b1-bdp-square-root-convention-comparison); AutomorphicCongruences L5a.1–L5a.3 Anticyclotomic four-term comparison, restriction and factorization; AutomorphicCongruences L5w.1, L5w.3, L5w.10 Fujiwara, primitive periods and Hilbert-family divisibility; `gap:primitive-toric-mu`; PadicMeasuresIwasawaAlgebras Layer 4 Weierstrass theory and module structure.

### 8b.6 Rational Heegner-point main conjecture

For p>3 good ordinary, (disc),(Heeg),(spl), and E[p] irreducible over G_Q, S and X have Λ-rank one and char_Λ(X_tors)=char_Λ(S/Λy∞)² in Λ[1/p]. No analytic-rank condition, p∤h_K assumption or residual surjectivity is added; integrality is a different branch.

This target also assumes E(K)[p]=0. p splits as v v̄ in K. p>3; E[p] irreducible over G_Q.

([bcs](#references), Theorem 1.2.2(a); PDF pp.3.)

*Needs:* [Primitive integral families and scalar corrections](#86a-primitive-integral-families-and-scalar-corrections); [BCS anticyclotomic reverse divisibility](#8b5-bcs-anticyclotomic-reverse-divisibility); [Heegner Euler-system divisibility for BCS](#8b4-heegner-euler-system-divisibility-for-bcs); [Unit comparison of Heegner normalizations](#813-unit-comparison-of-heegner-normalizations).

### 8b.7 Integral Heegner-point main conjecture

For the same ordinary split setting with p>3 and residual G_Q→GL₂(𝔽_p) surjective, choose a primitive ℚ-isogeny f:E₀→E of degree prime to p as in §8.6a and take y∞ to be the family of f∘π₀, with d=1 and matched Néron/BDP periods. The degree-prime-to-p isogeny gives integral Selmer isomorphisms and the normalization comparison is a unit on this actual lattice. Then S and X have Λ-rank one and char_Λ(X_tors)=char_Λ(S/Λy∞)² integrally in Λ. The uncorrected equality is also valid after a proved unit change of this family on the same lattice. For its nonzero scalar multiple a y∞ the assertion is instead `(a)²char_Λ(X_tors)=char_Λ(S/Λa y∞)²`; finite isogeny lattice corrections are retained as in §8.6a. The integral period, μ and generic descent hypotheses are those verified in the BCS supplier chain.

This target also assumes E(K)[p]=0. p splits as v v̄ in K. p>3; residual G_Q representation surjective.

([bcs](#references), Theorem 1.2.2(b); PDF pp.3.)

*Needs:* [Primitive integral families and scalar corrections](#86a-primitive-integral-families-and-scalar-corrections); [BCS anticyclotomic reverse divisibility](#8b5-bcs-anticyclotomic-reverse-divisibility); [Heegner Euler-system divisibility for BCS](#8b4-heegner-euler-system-divisibility-for-bcs); [Unit comparison of Heegner normalizations](#813-unit-comparison-of-heegner-normalizations).

### 8b.8 Rational Greenberg–BDP main conjecture

Under the rational Heegner main-conjecture hypotheses, X_(0,empty) is Λ-torsion and char_Λ(X_(0,empty))Λ^ur=(L_BDP²) in Λ^ur[1/p], where L_BDP is BCGS’s square-root function. This torsion module is not CS’s all-p ordinary rank-one dual.

This target also assumes E(K)[p]=0. p splits as v v̄ in K. p>3; residual irreducibility over G_Q.

([bcs](#references), Theorem 1.2.4(a); PDF pp.3.)

*Needs:* [Primitive integral families and scalar corrections](#86a-primitive-integral-families-and-scalar-corrections); [Rational Heegner-point main conjecture](#8b6-rational-heegner-point-main-conjecture); [Anticyclotomic main-conjecture comparison](#8b2-anticyclotomic-main-conjecture-comparison); [BDP square-root convention comparison](#8b1-bdp-square-root-convention-comparison).

### 8b.9 Integral Greenberg–BDP main conjecture

Under the integral Heegner main-conjecture hypotheses, X_(0,empty) is Λ-torsion and char_Λ(X_(0,empty))Λ^ur=(L_BDP²) integrally. The coefficient ring Λ^ur and p-primary content are retained.

This target also assumes E(K)[p]=0. p splits as v v̄ in K. p>3; residual G_Q surjectivity.

([bcs](#references), Theorem 1.2.4(b); PDF pp.3.)

*Needs:* [Primitive integral families and scalar corrections](#86a-primitive-integral-families-and-scalar-corrections); [Integral Heegner-point main conjecture](#8b7-integral-heegner-point-main-conjecture); [Anticyclotomic main-conjecture comparison](#8b2-anticyclotomic-main-conjecture-comparison); [BDP square-root convention comparison](#8b1-bdp-square-root-convention-comparison).

### 8b.10 Eisenstein anticyclotomic theorem interface

For CGS Theorem C, E/ℚ has a rational p-isogeny with kernel character φ, p∤2N, K satisfies (disc),(Heeg),(spl), and φ|_(G_p)≠1,ω. On the distinguished source curve use precisely CGS’s class, lattice and matched Néron/BDP periods of §8.6a through the integral family reciprocity comparison. For every other fixed E in its isogeny class, use the chosen isogeny and the exact Heegner transport factors of §8.6a; only a proved cancellation of those factors yields an uncorrected equality on that lattice. Its integral Heegner/Greenberg equality for these objects supplies BCGS Theorem 1.2.13(i). Combine the Heegner augmentation-prime bound of §8.34 with the independent CGS elliptic-unit/Katz argument and the integral family reciprocity comparison, retaining the lattice and local-character hypotheses. For a nonzero scalar multiple a of this fixed family, the Heegner equality acquires (a)² on char(X_tors); the fixed BDP function is not rescaled silently. Use CGS Theorem C and its Greenberg reformulation directly for every odd p, including p=3, before applying BCGS finite-system nonvanishing. The excluded local characters are outside this theorem, not outside the library.

This target also assumes E(K)[p]=0. p splits as v v̄ in K. A rational p-isogeny with kernel character φ and φ|G_p≠1,ω; p∤2N and (disc),(Heeg),(spl). No analytic-rank-one (Sel) hypothesis is added.

([bcgs](#references), Theorem 1.2.13(i), citing CGS TheoremsA/C; PDF pp.14; [cgs](#references), Theorem C and ensuing Greenberg reformulation, author copy pp.3–4; PDF pp.3–4.)

*Needs:* [Weak-torsion Heegner bound at the augmentation prime](#834-weak-torsion-heegner-bound-at-the-augmentation-prime); [Primitive integral families and scalar corrections](#86a-primitive-integral-families-and-scalar-corrections); `gap:eisenstein-elliptic-unit-inputs`; gap:integral-family-logarithm; [Anticyclotomic Heegner class](#86-anticyclotomic-heegner-class); GrossZagierAndArithmeticHeights §§9.14, 9.20, 9.22, for the integral single-power/square-root comparison with the fixed lattice, coefficient extension, Néron periods, regulator cokernel and primitive Euler factors. CGS Theorem C and its Greenberg reformulation supply this branch; neither the p>3 BCK comparison nor gap:primitive-toric-mu is an input.

### 8b.11 Split-prime Kolyvagin nonvanishing branches

BCGS finite-system nonvanishing is unconditional in each specified main-conjecture branch: (i) the supplied CGS Eisenstein local-character branch; (ii) p>3 and residual G_Q irreducibility; (iii) p>3 and residual surjectivity. In each case apply the conditional TheoremA with the exact branch hypotheses. No p=3 irreducible branch is inferred from BCS.

This target also assumes E(K)[p]=0. p splits as v v̄ in K.

([bcgs](#references), Theorem 1.2.13 and TheoremA; PDF pp.2,14–16.)

*Needs:* [BCGS nonvanishing from the main conjecture](#842-bcgs-nonvanishing-from-the-main-conjecture); [Rational Greenberg–BDP main conjecture](#8b8-rational-greenbergbdp-main-conjecture); [Integral Greenberg–BDP main conjecture](#8b9-integral-greenbergbdp-main-conjecture); [Eisenstein anticyclotomic theorem interface](#8b10-eisenstein-anticyclotomic-theorem-interface).

### 8b.12 Split-prime refined Kolyvagin divisibility

For p>3 residual G_Q surjective, ordinary split Heegner setting and p-optimal parametrization, M∞=Σ_(ℓ|N)v_p(c_ℓ(E/ℚ)). The integral BCS theorem discharges the conditional TheoremB; rational irreducibility alone does not discharge it.

This target also assumes E(K)[p]=0. p splits as v v̄ in K. p>3; residual surjectivity; p-optimal parametrization.

([bcgs](#references), TheoremB and Theorem 1.2.13(iii); PDF pp.3,14–15,19–20.)

*Needs:* [BCGS refined divisibility from the integral conjecture](#843-bcgs-refined-divisibility-from-the-integral-conjecture); [Integral Greenberg–BDP main conjecture](#8b9-integral-greenbergbdp-main-conjecture).

### 8b.13 Split determinantal Heegner main conjecture

In the CS TheoremC setting with p split in K, the integral BCS Heegner main conjecture and determinant/characteristic comparison show z̃∞ generates its integral Selmer determinant. Consequently the refined finite Heegner index equals v_p(Tam_E). For inert p the main-conjecture hypothesis is still unproved by this chain.

This target also assumes E(K)[p]=0. p splits as v v̄ in K. p>3; residual surjectivity; p∤Manin constant.

([cs](#references), TheoremC; Proposition 3.2.3; PDF pp.4–5,14.)

*Needs:* [Primitive integral families and scalar corrections](#86a-primitive-integral-families-and-scalar-corrections); [Integral Heegner-point main conjecture](#8b7-integral-heegner-point-main-conjecture); [Heegner determinant and characteristic ideals](#839-heegner-determinant-and-characteristic-ideals); [Castella–Sano refined conjecture equivalence](#845-castellasano-refined-conjecture-equivalence).


### Examples

The ideals (3) and (1) in ℤ₃⟦T⟧ have height-one (3) lengths 1 and 0; both extend to the unit ideal after inverting 3. Thus the odd-prime rational comparison alone cannot supply the integral surjective p=3 comparison. In a split p>3 surjective branch with Tamagawa p-parts 5 and 25 at two rational bad primes, the refined p=5 formula gives M∞=1+2=3, while the product over K has valuation 6 (§§8b.2, 8b.7, 8b.12).

### Dependencies

This layer uses the earlier internal targets specified in each *Needs:* sentence, the pinned algebraic APIs, and AutomorphicCongruences, EulerSystemsAndKolyvaginSystems, GrossZagierAndArithmeticHeights, ModularIwasawaMainConjectures, PadicHodgeRegulators, PadicMeasuresIwasawaAlgebras.


## Downstream consumers

The finite-system rank and Sha theorems and the anticyclotomic Heegner line supply arithmetic applications of the earlier modularity, height and Selmer theories. Later BSD arguments may consume these results with their exact local, period and lattice hypotheses; they do not supply inputs back to this construction.

## References

Locators refer to the editions below. A preprint page is its printed PDF page, not the pagination of a later journal edition. BCGS locators use arXiv:2312.09301v2; the author collation has the same cited numbering. Howard locators use arXiv:1202.6340v1 unless published pagination is explicitly given. Castella–Sano is cited as a preprint. For the classical square-index theorem, the theorem statement and its original proof source are distinguished.

- **gross**: Benedict H. Gross, *[Kolyvagin’s work on modular elliptic curves](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf)*. L-functions and Arithmetic, LMS Lecture Note Series 153 (1991), pp.235–256; scanned published article.

- **howard**: Benjamin Howard, *[The Heegner point Kolyvagin system](https://arxiv.org/pdf/1202.6340v1)*. arXiv:1202.6340v1, 28 February 2012; Compositio Math.140 (2004),1439–1472.


- **khayutin**: Ilya Khayutin, *[Joint equidistribution of CM points](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n1-p04-s.pdf)*. Annals of Mathematics189 (2019),145–276, version of record.

- **cornut-vatsal**: Christophe Cornut; Vinayak Vatsal, *[Nontriviality of Rankin–Selberg L-functions and CM points](https://personal.math.ubc.ca/~vatsal/research/part1.pdf)*. Author preprint, 1 April 2005; published LMS Lecture Notes320 (2007),121–186.

- **zhang**: Wei Zhang, *[Selmer groups and the indivisibility of Heegner points](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf)*. Cambridge Journal of Mathematics2(2) (2014),191–253, version of record.

- **nekovar**: Jan Nekovář, *[The Euler system method for CM points on Shimura curves](https://web.archive.org/web/20221115094729id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf)*. Author preprint, 23 May 2007, 53 PDF pages; published in L-functions and Galois representations, LMS Lecture Note Series 320 (2007), pp.471–547, DOI10.1017/CBO9780511721267.014.

- **pollack-weston**: Robert Pollack; Tom Weston, *[On anticyclotomic μ-invariants of modular forms](https://arxiv.org/pdf/math/0610694v1)*. arXiv:math/0610694v1, 23 October 2006; locators use preprint pagination.

- **kolyvagin-structure**: V. A. Kolyvagin, *[On the structure of Shafarevich–Tate groups](https://www.wstein.org/papers/bib/kolyvagin-structure_of_sha.pdf)*. Algebraic Geometry, Lecture Notes in Mathematics1479 (1991), pp.94–121; scanned published article.

- **skinner**: Christopher Skinner, *[Multiplicative reduction and the cyclotomic main conjecture for GL₂](https://arxiv.org/pdf/1407.1093v1)*. arXiv:1407.1093v1, 4 July 2014; published Pacific J. Math.283 (2016),171–200; locators use the arXiv pagination.

- **zanarella**: Murilo Zanarella, *[On Howard’s main conjecture and the Heegner point Kolyvagin system](https://arxiv.org/pdf/1908.09197v1)*. arXiv:1908.09197v1, 24 August 2019; locators use the arXiv pagination.

- **cornut**: Christophe Cornut, *[Mazur’s conjecture on higher Heegner points](https://webusers.imj-prg.fr/~christophe.cornut/papers/mcinv.pdf)*. Invent. Math.148 (2002),495–523; author manuscript.


- **cv-dynamics**: Christophe Cornut; Vinayak Vatsal, *[CM points and quaternion algebras](https://webusers.imj-prg.fr/~christophe.cornut/papers/part2.pdf)*. Author manuscript, 3 April 2005; Documenta Math.10 (2005),263–309.

- **bcgs**: Ashay Burungale; Francesc Castella; Giada Grossi; Christopher Skinner, *[Non-vanishing of Kolyvagin systems and Iwasawa theory](https://arxiv.org/pdf/2312.09301v2)*. arXiv:2312.09301v2, January 2026; published CJM14(2) (2026),285–348.


- **bcs**: Ashay Burungale; Francesc Castella; Christopher Skinner, *[Base change and Iwasawa main conjectures for GL2](https://arxiv.org/pdf/2405.00270v2)*. arXiv:2405.00270v2, March 2025; theorem numbering belongs to v2.

- **cgls**: Francesc Castella; Giada Grossi; Jaehoon Lee; Christopher Skinner, *[On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://web.math.ucsb.edu/~castella/Eisenstein.pdf)*. Invent. Math.227 (2022),517–580; author copy.

- **cs**: Francesc Castella; Takamichi Sano, *[On refined nonvanishing conjectures by Kurihara and Kolyvagin](https://web.math.ucsb.edu/~castella/Kurihara.pdf)*. Author manuscript dated 20 January 2026, arXiv:2601.14504v1.

- **wuthrich**: Christian Wüthrich, *[On the integrality of modular symbols and Kato’s Euler system for elliptic curves](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-19/12.pdf)*. Documenta Math.19 (2014),381–402, published PDF.

- **bck**: Ashay Burungale, Francesc Castella, Chan-Ho Kim, *[A proof of Perrin-Riou’s Heegner point main conjecture](https://web.math.ucsb.edu/~castella/PRconj-print.pdf)*. Published author-served copy, Algebra & Number Theory15(7) (2021),1627–1653, DOI10.2140/ant.2021.15.1627.

- **cgs**: Francesc Castella, Giada Grossi, Christopher Skinner, *[Mazur’s main conjecture at Eisenstein primes](https://web.math.ucsb.edu/~castella/Mazur.pdf)*. Author-served copy linked to Math. Ann.393(2) (2025),2451–2506; not certified as publisher PDF.
