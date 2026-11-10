# Roadmap: gl₂ modularity lifting, part ii — minimal defect-one R = T

**Summary.** Build the arithmetic defect-one applications of balanced-module patching: torsion weight-one local–global compatibility over ℚ, minimal weight-one R = T with and without vexing coefficient types, finite-image consequences over complete local coefficient rings, scalar-Frobenius Jacobian multiplicity, and conditional minimal PGL₂ homology R = T over imaginary quadratic fields. The inputs are geometric modular forms, exact local/global deformation conditions, integral Hecke representations and the balanced patching theorem. The Bianchi statements retain the all-level Galois-representation hypothesis and the exact stabilizer and principal-type contracts, including p = 3. The scalar multiplicity statement retains its variable-determinant comparison contract.

## Scope and ownership

GL2ModularityLifting §§1–4 develops the defect-zero arithmetic deformation-to-Hecke comparison. This Part II begins with the arithmetic modules of defect one; it owns their level specializations, doubling arguments, coefficient bundles and resulting minimal theorems. Its full scope includes all three weight-one Frobenius patterns, all rational vexing primes, all Bianchi S/P/M/H types and the odd prime 3. Over F the Bianchi datum excludes vexing primes: residual ramification at x with N(x) ≡ −1 mod p, absolutely irreducible residual decomposition action and reducible residual inertia action (CG18, Theorem 1.3(4), p. 302; cg18 lines 232–233). The weight-one theory over ℚ includes them through Layers 5–6. The Bianchi datum also excludes nontrivial quadratic twists of ramified unipotent inertia, which are neither S nor semisimple P. Sections 7.2–7.4, 8.2 and 9.3 identify the additional mathematical inputs for the general scalar, principal-type and 3-primary statements; their restrictions are visible in each consequence. Conjecture A in §8.4 is an explicit arithmetic hypothesis, rather than a theorem promised here.

The following objects retain their single earlier owner. DeformationAndDerivedPatchingAlgebra §§5.1–5.5 supplies the balanced predicate, square presentations, Tor defect identity and balanced patching, and §3.9 supplies canonical modules and type. LocalGaloisDeformationRings §§6.7, 6.18, 7.5 supplies the scalar ordinary eigenvalue ring, its type-three calculation and the local doubling/unramified-ideal equality; §§2.1–2.5, 2.19 and 4.1 supply local deformation conditions. GlobalGaloisDeformations §§3.3–3.7, 5.1–5.8, 6.2–6.8 supplies global representability, numerical presentations and auxiliary-prime selection. PotentialModularityAndCompatibleSystems §8.8 owns O-finiteness of the fixed-character scalar ordinary ring and its eigenvalue-adjoined version, including p = 3 and the exceptional nonadequate images. This roadmap specializes those theories, without another generic deformation or patching carrier.

AlgebraicModularFormsAndSerreWeights Layers 1–3 owns Katz forms, Hodge and cusp geometry, small-level descent, q-expansions, normalized Hecke operators, Hasse, theta and twisted coherent duality. IntegralHeckeAndGaloisDeterminants §§1.3, 2.1–2.2 owns determinant reconstruction and represented Hecke images. AlgebraicModularFormsAndSerreWeights §6.4 owns the classical Artin attachment, AutomorphicGaloisRepresentations §2.10 its normalization comparison, and AutomorphicGaloisRepresentations §§4.1–4.6, 5.1, 6.8–6.12 high-weight Galois attachments. GL2AutomorphicRepresentationsAndTransfer §§R16.2.11, R16.3.9, R16.4, R16.6 owns the conductor-minimal CDT type and local/global multiplicity dictionary; gap:vexing-norm-twist-selector requests its norm-twist extension for every vexing prime. SerreWeightAndLevelOptimisation §§3.4, 3.10–3.13 owns field-valued weight-one unramifiedness, the Gross sequence, known multiplicity one, scalar lower bounds and the minimal Katz witness. The new weight-one result is over the entire torsion Hecke image, and the new scalar result is the multiplicity-two upper bound. Full-boundary vanishing is supplied by AlgebraicModularFormsAndSerreWeights §2.16, Eisenstein boundary eigensystems; the construction and injectivity of the finite-coefficient Hasse double are supplied by §3.8, Weight-one Tₚ with torsion coefficients. The arithmetic matrix and localized ordinary-image assertions here differ by computing the action on the selected residual double. SerreWeightAndLevelOptimisation §3.14 owns both individual ordinary-projection injections at fine tame level, including finite coefficients; §1.3 transports these through the harmless-prime comparison, so no second projection-injectivity target is included here. The generic twisted Φ/Ψ identity remains with AlgebraicModularFormsAndSerreWeights §3.12; the weight-one module/rank specialization is the target here.

ClassicalSerreModularity R27.5/hypothesis-H-and-theorem-9-1 owns qualitative modularity of every S-type residual representation. Its section Arithmetic interfaces for the theorem statements owns the rational Frobenius and unramifiedness interfaces on the algebraic integers. The signature-only specialization here uses the same Mathlib inertia and Frobenius, with no new arithmetic-place carrier. IntegralHeckeAndGaloisDeterminants §1.6 owns Cayley–Hamilton recognition of isotypic modules; ModularCurvesPartII §17.2 owns the good-reduction Eichler–Shimura relation.

ArithmeticLocallySymmetricSpaces §§ALS.0–ALS.6 owns the arithmetic quotient, local systems, groupoid homology comparisons, compactification, Hecke, duality and finite-cover descent. In particular §ALS.0.10 owns the congruence subgroups and diamond levels, §ALS.4.10 the Eisenstein predicate, and §ALS.4.12(b) ordinary/Borel–Moore comparison under its stated neatness and Galois-type hypotheses; gap:non-neat-bianchi-boundary specifies the non-neat specialization needed here. AutomorphyLiftingBeyondTaylorWiles §3.5 owns selected-root cohomology comparison; §9.2 here owns its homological translation. Here the PGL₂ imaginary-quadratic specialization chooses the exact minimal levels and residual ideals. ClassFieldTheory Layers 7 and 11–12 supplies reciprocity and ray-class finiteness. ModularityAndLanglandsExtensions §1.5 owns CG18 Lemma 4.14, reducedness of R[1/p] for the universal deformation ring R whose finitely many Q̄ₚ-points all have finite image; §§4.5 and 6.5 keep its variant for the fixed-determinant minimal quotient R_min, which differs only in that the finiteness hypotheses are verified for R_min rather than for R. Mathlib's matrix characteristic polynomial, Cayley–Hamilton and two-by-two determinant, and Tau Ceti's coefficient-sum augmentation, are already in the library; only the arithmetic correspondence identities are targets here. The analytic modular-form carriers are imported, not used in place of torsion Katz forms. General GLₙ complex patching and nonminimal lifting belong to their own extensions and are not prerequisites of this minimal theory.

## Conventions

Throughout O is the integers of a finite extension K/ℚₚ, with a chosen uniformizer π and finite residue field k of characteristic p ≥ 3. Rings and modules are unital; O and k are nonzero. A finite module means a finitely generated module; finite cardinality is stated separately. All complete Noetherian local O-algebras have the specified residue identification with k, and maps are continuous local O-algebra maps inducing that identification. The finite residue field and finite coefficient extension are essential to finiteness of torsion ideals and universal representation images. Equal-characteristic DVRs and infinite residue fields do not meet these hypotheses. Coefficient extensions may be enlarged finitely to split residual roots and tame characters. No assumption of O-flatness is imposed on a weight-one or Bianchi Hecke image or its patched arithmetic module.

Fix separable closures and compatible embeddings for decomposition groups. Frobenius is arithmetic; the cyclotomic character ε sends good Frobenius at x to the residue cardinality. The unramified character λ(u) sends arithmetic Frobenius to u. Geometric local reciprocity has the inverse normalization: on a uniformizer its value is inverse arithmetic Frobenius. Thus if φ(Frob) = 2 over 𝔽₇, φ(Art_geom(ϖ)) = 4, and 2·4 = 1. In the Bianchi decomposition φε ⊕ φ⁻¹ the selected U eigenvalue from geometric reciprocity is φ(Frob)⁻¹; at residual norm one it selects the other arithmetic eigenline. This conversion is retained in every diamond/inertia comparison.

Matrices act on columns; the first column is the image of the first summand. Weights n are integers unless a high-weight range is specified. A good weight-n Hecke operator satisfies aⱼ(Tₓf) = aₓⱼ(f) + xⁿ⁻¹⟨x⟩aⱼ/ₓ(f), with the last term defined to be zero unless x divides j. A positive prime x invertible in O is the only source of 1/x; no formula divides by p in torsion coefficients. For weight one the Frobenius polynomial is X² − TₓX + ⟨x⟩. For Bianchi trivial-central-character coefficients it is X² − TₓX + N(x). All q-series and local power-series rings are formal and complete; finite diamond group algebras remain finite group algebras (CG22, pp. 855–856).

For weight one fix odd absolutely irreducible continuous ρ̄:G_ℚ→GL₂(k), unramified at p, of prime-to-p Artin conductor N. Local residual reducibility is tested over k̄. In the normalized minimal problem, at a ramified reducible decomposition group impose ρ̄ᴵ ≠ 0; genuinely minimal lifts retain the specified inertial type or invariant direct summand, not merely its dimension. The determinant of the normalized minimal problem is the Teichmüller lift of det ρ̄. More precisely, minimal outside Q means: fixed Teichmüller determinant; unramified outside S(ρ̄)∪Q, hence at p; reduction identifies the full inertial image at each vexing prime; and at a nonvexing ramified prime with reducible residual decomposition representation, the inertia invariants are a rank-one direct summand over the coefficient ring. The other local cases use the specified minimal-condition classification (CG18, Definition 3.1, pp. 310–311; cg18 line 584). A conductor-level Katz/descent module is distinguished from the fine Γ₁(r) proof model. The fixed admissible r is not a Taylor–Wiles variable. A repeated r-root leaves two old copies in one local factor; all final conductor rank statements use the comparison algebra omitting Uᵣ.

For the headline signatures, O is presented as a characteristic-zero complete DVR finite over ℤₚ, with a local scalar map. This is the same coefficient class as the integers of a finite extension of ℚₚ. For a complete Noetherian local O-algebra A, the residue identifications O/m_O ≃ k and A/m_A ≃ k commute with the scalar map. The following transparent predicates specialize native carriers; their representability and comparison theory belongs to gap:rational-minimal-conditions (CG18 §3.1, Definition 3.1, pp. 310–311; cg18 lines 569–595).

Use G_ℚ = Aut_ℚ(ℚ̄) with its Krull topology, and primes Q of the integral closure of ℤ in ℚ̄ above (ℓ). The predicate `IsUnramifiedAt` is the signature-only specialization of ClassicalSerreModularity's interface: for every prime Q with Q lying over (ℓ), Mathlib's `Ideal.inertia` lies in the representation kernel. At a prime ℓ, lying over (ℓ) is equivalent to containing ℓ, the supplier's formulation. Its API consists of the following facts.

- At every prime Q above (ℓ), each inertia element acts as the identity.
- Conjugating Q and the local action preserves this condition.
- Every coefficient homomorphism preserves trivial inertia action.

**Checks.**

- The trivial representation sends every inertia element to I₂ and is unramified at every prime.
- The inertial matrix diag(ζₚ,1), with ζₚ ≠ 1, differs from I₂ and is ramified, although its reduction is I₂.
- At ℓ = 1 a prime Q cannot lie over the unit ideal: it would contain 1. The universal condition is vacuous; arithmetic statements quantify only over primes.

Arithmetic Frobenius uses Mathlib's `IsArithFrobAt` on ℤ, g and Q, with Q prime above (ℓ). Thus g acts on the residue field by a ↦ a^ℓ. The imported interface fixes the arithmetic direction, allows the inertia coset and makes the unramified trace independent of the representative.

**Checks.**

- In 𝔽₂₇ = 𝔽₃[t]/(t³−t−1), arithmetic Frobenius sends t to t³ = t+1; its inverse sends t to t⁹ = t+2. This distinguishes the two directions.
- Multiplying an arithmetic Frobenius by inertia leaves its residue action a³ and its trace under an unramified representation unchanged.
- An element moving Q to another prime fails Frobenius membership: Mathlib's Frobenius predicate forces membership in the stabilizer of Q.

Define `twist` for a unit-valued character η and a two-dimensional representation ρ by g ↦ η(g)ρ(g), using scalar matrices. Its source is G_ℚ and its target is GL₂(A). Reduction of η uses the specified residue identification. Finite order means that η has finite image, and continuity of η means continuity of its value in the maximal-ideal-adic topology on A.

Its API has the following laws.

- The trivial character gives ρ; successive character twists multiply their characters, and twisting by the inverse recovers ρ.
- At g the trace becomes η(g)tr ρ(g), and the determinant becomes η(g)²det ρ(g).
- Reduction commutes with twisting. If both images are finite of sizes a and b, the twisted image has size at most ab.

**Checks.**

- For diag(2,3) and η(g) = 2 over 𝔽₇, the twist is diag(4,6), with trace 3 = 2·5 and determinant 3 = 2²·6. Using just one power of η in the determinant would give 5.
- Twisting by 1 gives diag(2,3); twisting the preceding diag(4,6) by 4 recovers diag(2,3), since 2·4 = 1.
- At p = 3 with k = 𝔽₃ let ψ be the cubic character of conductor 7, residually 1. If ρ₀ is normalized minimal and unramified at 7, then ρ = ρ₀⊗ψ² has (det ρ)² = ψ² ≠ 1, while η = ψ gives ηρ = ρ₀ because ψ³ = 1. The twist-general headlines accept this datum although normalized minimality of ρ fails.

Define `IsAdicallyContinuous` by continuity of each of the four matrix entries into the maximal-ideal-adic topology of the coefficient ring. Its API consists of the following comparisons.

- The source topology is the native Krull topology on G_ℚ.
- Entrywise continuity agrees with continuity for the matrix subspace topology on GL₂(A), with A adic.
- Over a field, the maximal-ideal-adic topology is discrete, giving the usual discrete continuity condition.

**Checks.**

- A constant representation has four constant continuous entries.
- For a field the maximal ideal is 0, so its powers are 0 and the adic topology is discrete; continuity forces an open kernel for a representation into a finite field.
- For A = O[ε]/ε², m_A = (π,ε) and m_A² = (π²,πε); the ε direction is detected by the topology. An indiscrete topology would lose this condition.

Define `IsReducibleOn` for a residual representation and a subgroup H by the existence, after extension to k̄, of an H-invariant submodule of dimension one. Its API consists of the following facts.

- The invariant line is tested after extension to k̄ on the specified subgroup H.
- Conjugating the representation by an invertible matrix preserves the predicate.
- The trivial subgroup always satisfies the predicate, since every line is invariant.

**Checks.**

- For diagonal matrices the line k̄e₁ has dimension one and is invariant.
- The standard two-dimensional representation of S₃ over 𝔽₅ has no invariant line over k̄: a 3-cycle has two eigenlines and a transposition exchanges them. Thus absolute reducibility fails.
- For H = 1 every line is invariant, whereas the 0 and whole submodules have dimensions 0 and 2 and cannot witness this predicate.

Define `inertiaInvariants` as the intersection of the kernels of ρ(g)−I₂ for g in the ideal inertia group of Q, using matrix linear maps. This is the specialization of Mathlib’s `Representation.invariants` to the restricted matrix action. Its API consists of the following facts.

- Membership means that every element of the specified inertia group fixes the vector.
- Conjugating the prime and action transports this submodule by the corresponding matrix.
- The natural inclusion has source the fixed submodule and target A² and is injective.
- Coefficient change gives a map from the scalar extension of the fixed submodule to the new fixed submodule; an isomorphism requires the stated base-change hypotheses.

**Checks.**

- Trivial inertia gives the whole rank-two module, since every ρ(g)−I₂ is zero.
- Inertia diag(u,1) with u−1 a unit gives exactly Ae₂, a rank-one direct summand.
- Over A = ℤ/9 with generator diag(4,1), the fixed module is 3Ae₁ ⊕ Ae₂ because 3a = 0. It is not a free rank-one direct summand; reducing an invariant-space dimension cannot replace the defining submodule.

Define `IsWeightOneResidual` by p ≥ 3, adic continuity, absolute irreducibility, unramifiedness at p and oddness, together with nonzero inertia invariants at every ramified absolutely reducible decomposition group. Oddness is determinant −1 on complex conjugation, identified through an embedding ℚ̄ → ℂ. Its API fixes the following standing hypotheses (CG18 §3.1, pp. 310–311; cg18 lines 569–578).

- The representation is continuous, odd, absolutely irreducible and unramified at p ≥ 3.
- At each ramified reducible decomposition group, the actual inertia-invariant submodule is nonzero.
- Scalar, repeated nonscalar and distinct-root Frobenius matrices at p all remain admissible; no distinguished-root assumption is imposed.

**Checks.**

- At p = 3 complex conjugation diag(1,−1) has determinant −1 = 2 ≠ 1, fixing the odd parity.
- A diagonal global representation has an invariant line, so it fails absolute irreducibility even if its determinant on conjugation is −1.
- A ramified scalar inertial character χ ≠ 1 has invariant subspace 0 and fails the ramified-reducible hypothesis; p = 2 also fails the explicit lower bound.

Define `IsMinimalLift` by reduction to the specified residual representation; determinant values whose (|k|−1)-st powers are 1; no ramification outside the residual ramification set; injectivity of reduction on the full inertial image at vexing places; and a rank-one direct summand of inertia invariants at ramified reducible decomposition groups. Here vexing means ℓ ≡ −1 mod p, absolutely irreducible residual decomposition action and reducible residual inertia action. A rank-one invariant submodule is expressed by an A-linear equivalence with A and an actual complementary submodule. Since |k|−1 is prime to p, Hensel uniqueness identifies the determinant with the Teichmüller lift. The last condition is disjoint from the vexing case. Its API is CG18 Definition 3.1 with Q empty (cg18 lines 584–595).

- Reduction is the specified residual representation through the chosen residue identification.
- In the complete local coefficient category with finite residue field k of characteristic p, the determinant is the unique lift of its residual character whose values have order dividing |k|−1.
- The lift is unramified at every prime where the residual representation is unramified.
- At a vexing prime, reduction identifies the full lifted and residual inertial images.
- At a ramified reducible decomposition group, the fixed submodule is free of rank one with an actual complement in A².
- Strictly equivalent lifts satisfy the same conditions, with the fixed line and its complement transported by conjugation.

**Checks.**

- For k = 𝔽₃ the determinant exponent is 2. In ℤ/9, the lift 4 of residual determinant 1 has 4² = 7 ≠ 1 and is rejected; the Teichmüller lift 1 has square 1.
- For residual χ̄ ⊕ 1 with nontrivial prime-to-p χ̄, the lift Teich(χ̄)ψ ⊕ 1 with ψ of order p still fixes exactly the second line, but ψ^(|k|−1) ≠ 1; the determinant condition rejects it.
- At a vexing place any new inertial element mapping to I₂ violates injectivity on the inertial image; the full residual inertial image itself has an injective identity reduction. At an unramified place any nonidentity inertial image violates unramifiedness.

Write Hᵢ(X,L) = Hom_O(Hⁱ(X,(Ω¹⊗L∨)_(K/O)),K/O), for i = 0,1, with compact topology and transposed Hecke action. Its underlying module is H¹⁻ⁱ(X,L); its Hecke comparison includes the stated adjoint. The root-Fricke twisted cohomological map Φ satisfies ΦTₓ = x¹⁻ⁿTₓ∨Φ. For its dual Ψ the equivalent identity is Tₓ,hom Ψ = x¹⁻ⁿ ΨTₓ,sections. Weight one makes the scalar one. Untwisted type duality sends σ to σ* and the residual Hecke ideal to its inverse-diamond adjoint.

For Bianchi theory F is imaginary quadratic, p is unramified in F, det ρ̄ = ε̄ and ρ̄ restricted to G_(F(ζₚ)) is absolutely irreducible. Finite flat at v|p means finite flat over O_(Fᵥ), including every Artinian coefficient quotient; it does not mean a group scheme over the coefficient ring O. Ordinary means conjugate to [[εχ₁,*],[0,χ₂]] with χ₁ and χ₂ unramified on every Artinian quotient; determinant ε forces χ₁χ₂ = 1. A stable rank-one direct summand gives the filtration. Finite-flat residual data has precedence over an ordinary condition. Unipotent inertia means conjugate into [[1,*],[0,1]] (CG18 §5.1, pp. 368–370; cg18 line 2889). Homology at non-neat level means arithmetic group/orbifold homology with stabilizers retained. Spaces, coefficients, chains and finite products are formed in a fixed universe large enough for the chosen arithmetic groups; no universe-dependent cardinal cutoff enters the mathematics.

## Exact supplier contracts

The following are precise interfaces used in the Needs lines. The labels beginning gap: specify additional hypotheses at the named supplier interfaces. They do not assert that the cited sections prove those hypotheses. Their full statements below are retained wherever a consequence uses them; Conjecture A and H₃(3) remain explicit assumptions. The legacy identifiers R15.1, R15.2 and R15.3 refer to AlgebraicModularFormsAndSerreWeights Layers 1, 2 and 3, as mapped in that roadmap’s Scope and ownership.

### From Mathlib

Use `Representation.invariants` and `Representation.mem_invariants` in `Mathlib/RepresentationTheory/Invariants.lean` for fixed submodules; the concrete inertia-kernel intersection in the signatures is their specialization to the restricted matrix action, rather than a new invariant theory. Use `Ideal.inertia` in `Mathlib/RingTheory/Ideal/Defs.lean` and `IsArithFrobAt` in `Mathlib/RingTheory/Frobenius.lean` on the algebraic integers with the action of Aut_ℚ(ℚ̄). The latter forces stabilization of a prime Q and the arithmetic residue-field action; `IsArithFrobAt.mul_inv_mem_inertia` makes two choices equal modulo inertia. Use `Matrix.GeneralLinearGroup.scalar` and `Matrix.GeneralLinearGroup.scalar_commute` in `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean` for the scalar character twist. Use `Matrix.charpoly` and `Matrix.aeval_self_charpoly` in `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`, and `Matrix.det_fin_two` in `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean`, for finite matrices over a commutative ring. Their input includes the unit x whenever an arithmetic matrix contains 1/x. Use `groupHomology.indIso` in `Mathlib/RepresentationTheory/Homological/GroupHomology/Shapiro.lean`: for a commutative coefficient ring, subgroup and representation in a common universe, it identifies homology of induced coefficients with subgroup homology. It does not assert geometric amplitude or boundary vanishing. `ModularForm` and `CuspForm` in `Mathlib/NumberTheory/ModularForms/Basic.lean` are holomorphic complex slash-invariant functions with the specified condition at every cusp; these definitions include neither integral Katz coefficients nor a Hecke action.

### From Tau Ceti

Use `TauCeti.MonoidAlgebra.augmentation` and `TauCeti.MonoidAlgebra.augmentation_single` in `TauCeti/Algebra/MonoidAlgebra/Augmentation.lean`. For a ring O and monoid Δ the map O[Δ]→O sums coefficients and sends every group basis element to one. For Δ = C₃, the element [g] has augmentation 1 although its coefficient at the identity is 0. The ring structure requires no commutativity of Δ; the Taylor–Wiles groups here are abelian p-groups.

Use `HeckeRing.GL2.Newform` in `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean`: for nonzero level N and integer weight k it bundles a nonzero Γ₁(N) cusp form, nebentypus χ, good-index Hecke eigenvalues, membership in the new subspace and first q-coefficient 1. Use `HeckeRing.GL2.IsEigenformAwayFromLevel` in `TauCeti/NumberTheory/ModularForms/Eigenform.lean` for simultaneous classical Hecke eigen-equations away from N; this predicate alone does not require nonzeroness. Use `HeckeRing.GL2.Newform.eq_of_forall_prime_eigenvalue_eq` in `TauCeti/NumberTheory/ModularForms/Newforms/StrongMultiplicityOne.lean`: two newforms at the same nonzero level and integer weight, with equal nebentypus and equal eigenvalues at every prime coprime to N, are equal. These supply the classical uniqueness steps of §§4.3–4.4 and 6.4; the geometric/classical dictionary and Artin attachment have their separate suppliers.

Use `NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet` and `NumberField.Chebotarev.infinite_frobeniusPrimeSet` in `TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.lean` for finite Galois extensions of number fields and a conjugacy class. They give its Frobenius set density |C|/|G| and infinitely many such primes. Section 0.1 applies this to the compositum of the residual fixed field and ℚ(ζₚ).

### From TauCetiRoadmap.ClassicalSerreModularity

The section Arithmetic interfaces for the theorem statements supplies the rational Galois group, the algebraic integers, and the arithmetic Frobenius and unramifiedness interfaces. Its `Suggested.lean` names these `TauCetiRoadmap.ClassicalSerreModularity.GQ`, `TauCetiRoadmap.ClassicalSerreModularity.IntBar`, `TauCetiRoadmap.ClassicalSerreModularity.IsFrobAt` and `TauCetiRoadmap.ClassicalSerreModularity.IsUnramifiedAt`. These use Aut_ℚ(ℚ̄), algebraic integers, prime ideals containing the rational prime and Mathlib inertia/Frobenius. The local signature specialization writes lying over (ℓ) instead of containing ℓ; these agree for prime ℓ. No module from that roadmap is imported into the acceptance test.

Target R27.5/hypothesis-H-and-theorem-9-1 supplies qualitative modularity for every continuous odd absolutely irreducible rational residual representation (S-type), without a pre-existing modularity witness. Section 0.2 first applies this theorem and then SerreWeightAndLevelOptimisation §3.13 to obtain the conductor-level Katz weight-one witness; qualitative modularity alone does not specify its weight or level.

### From TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra

Sections 5.1 and 5.5 supply the balanced defect d = dimₖ Tor₀ − dimₖ Tor₁, its square-presentation equivalence, and balanced patching for p ≥ 3, q ≥ 1, Sₐ = O[(ℤ/pᵃ)ᵠ] and A∞ = O[[z₁,…,z_(q−1)]]. The assumptions are finite balanced Hₐ, specified augmentation quotient H, a local surjection A∞→R at each level, scalar image containment and augmentation containment in the image of its kernel. Original arithmetic levels need not have transition maps: §§5.2–5.4 construct compatible finite cutoff data. The conclusion gives H free over R; for H ≠ 0 it gives R as A∞ modulo the q augmentation images. Sections 3.1 and 3.9 supply depth, regular parameters, canonical modules, type and type preservation under regular quotients and completed tensor products with complete intersections when at least one factor is O-flat. For a finite flat order its canonical module is Hom_O(T,O), with the Zₚ-dual version after coefficient trace. No tensor-product assertion drops the O-Tor-independence hypothesis. The nongraded Hilbert-series equality criterion is used only in its homogeneous associated-graded form (CG18, Lemmas 4.1–4.4, pp. 355–358; cg18 line 2363).

### From TauCetiRoadmap.AlgebraicModularFormsAndSerreWeights

R15.1's geometric forms, logarithmic Kodaira–Spencer and small-level descent supply ω, C and Ω¹ ≃ ω²(−C) on the fine models, with the genuine descent interpretation at conductor level. On Tate(t²), KS(ω_can²) = 2 dt/t, so replacing KS by half KS changes the fixed normalization. R15.2's integral geometric Hecke, torsion coherent Hecke and all-cusp q-expansion targets supply pullback, Hodge isogeny and trace for O, O/πᵐ and K/O. The two-character boundary calculation is retained on every cusp orbit. R15.3's Hasse, coefficient-linear U/V, weight-one Tₚ, theta and twisted-duality targets supply Hasse powers with q-expansion one and εⁿ⁻¹ = 1 on the chosen quotient, theta-kernel vanishing in weight one, and ΦTₓ = x¹⁻ⁿTₓ∨Φ under its relative duality/base-change assumptions. At n = 2 and x = 2, a section eigenvalue 2 corresponds under Ψ to homological eigenvalue 1, since 1 = 2⁻¹·2. This pins the dual direction; only n = 1 is used for untwisted weight-one rank equality.

The boundary supplier gives Hⁱ(ωⁿ(−C))_m ≃ Hⁱ(ωⁿ)_m for i = 0,1 on the fine models and their stated descended modules at an absolutely irreducible residual factor, for O, O/πᵐ and K/O coefficients; its weight-one case is CG18, Lemma 3.7(2), pp. 321–322 (cg18 line 1014). At any cusp type its residual trace is ψ₁(x)+xⁿ⁻¹ψ₂(x), with the prescribed product and finite-order residual characters (AlgebraicModularFormsAndSerreWeights §2.16). CG18 Remark 3.4 (p. 316; cg18 line 794) computes only the diamond orbit of ∞, where the trace is 1+χ(x)xⁿ⁻¹; its assertion that (ℤ/NQℤ)ˣ acts transitively on all cusps is not used, and the first Check below shows two cusp orbits.

**Checks.**

- At the cusp above infinity the character pair is (1,χ); above zero it is (χ,1). For n = 1 and χ(x) = −1 both traces equal 0, without a transitive diamond action on their union.
- For n = 2, x = 2 and trivial characters the trace is 1+2 = 3, not 2; the associated residual representation is reducible and its localization at an absolutely irreducible factor is zero.
- For all i > 0 a finite cusp divisor has no coherent Hⁱ; this does not imply that the surrounding curve has no H¹.

The Hasse supplier gives ψ(f,g) = φ(f)+(φTₚ−Uₚφ)(g) with second expansion ⟨p⟩Vₚg, and injectivity over every O/πᵐ. Its all-cusp coefficient description determines both columns; it commutes with away-p Hecke, diamonds, actual level maps and finite coefficient reductions. At m = 1 it is Hasse multiplication in the first column. For a fixed high-weight target, compatible Hasse choices with equal all-cusp expansions modulo πᵐ give the same map by the q-expansion principle; maps into different weights are compared only through their stated expansion or weight-change comparisons. A sufficiently divisible high weight accommodates the ramification of O, rather than identifying π with p (CG18, proof of Theorem 3.11, pp. 327–328; cg18 line 1230).

**Checks.**

- If a₁(g) = 1, the second column has coefficient 0 at qʲ when p does not divide j, and coefficient ⟨p⟩ at qᵖ. The first column has the expansion of f.
- At p = 3 and m = 1 the construction is defined even though p = 0 in k. It uses no 1/p; theta is applied to the characteristic-p socle.
- Over ℤ/9, theta(V₃(q)) = 3q³ ≠ 0; over 𝔽₃ it is 0. Applying theta to all torsion coefficients instead of the socle would give a false proof of injectivity.

What AlgebraicModularFormsAndSerreWeights must provide (gap:conductor-rigidified-descent): Provide coherent conductor-level descent through common fine rigidifications with Hodge coefficients and finite and K/O coefficients.

What AlgebraicModularFormsAndSerreWeights must provide (gap:diamond-cover-cartan-leray): Provide Hecke-compatible Cartan–Leray descent and its Pontryagin-dual Tor edge maps for compactified p-power diamond covers with Hodge coefficients over finite quotients and K/O.

What AlgebraicModularFormsAndSerreWeights must provide (gap:minimal-torsion-bad-hecke): Provide the integral bad-prime U action on the conductor-minimal Hasse subquotient, compatible with invariant-line Frobenius and the zero-invariant newvector case, over every finite coefficient quotient.

### From TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants

Sections 2.1–2.2 provide represented algebra images, annihilator quotients and finite local factors for the specified module or complex, allowing finite O-torsion and complete finite-image limits. Image-to-image quotient maps are used; tensoring an image is not presumed to commute with nonflat coefficient change. Section 1.6, Cayley–Hamilton recognition of isotypic modules, supplies the matrix-unit module consequence for an A[G]-module annihilated by the Cayley–Hamilton ideal of a split residually absolutely irreducible determinant. Section 1.3 supplies henselian reconstruction from a whole degree-two determinant law with a specified split absolutely irreducible residual representation. Geometric trace data, continuity and every local minimality condition must be proved for the actual arithmetic image before reconstruction applies. The arithmetic specializations of these images are §§0.2, 2.4 and 8.3.

### From TauCetiRoadmap.ModularCurvesPartII

Section 17.2 supplies the good-reduction Eichler–Shimura relation F²−T_ℓF+ℓ⟨ℓ⟩ = 0 on the Jacobian and on prime-to-ℓ torsion for arithmetic Frobenius at ℓ away from the level. It retains the diamond term at Γ₁ level. Section 7.4 uses this geometric relation with the separately requested full-ideal Cayley–Hamilton annihilation.

### From TauCetiRoadmap.LocalGaloisDeformationRings

Sections 2.1–2.5 and 2.19 supply the away-p minimal and unipotent local conditions and conductor-minimal complete-intersection calculations; §4.1 supplies Artinian finite-flat conditions over an unramified p-adic field. Sections 6.7, 6.18 and 7.5 supply the scalar ordinary ring with chosen eigenvalue, its normal O-flat Cohen–Macaulay type-three property of relative dimension four, and the equality of its relative-module annihilator and the unramified ideal. The local relative module is the quotient by the image submodule, not a ring quotient by a subring. After normalizing a residual scalar c, the eigenvalue maps to c⁻¹Uₚ; c is a unit. The special-fibre parameter quotient k[x,y,z]/(x,y,z)² has length 4 and socle dimension 3. The source's unrestricted away-p ring is not used at a norm −1 ramified Steinberg place where it has additional nonminimal components.

What LocalGaloisDeformationRings must provide (gap:scalar-variable-determinant): Provide the conductor-at-most-one local deformation family with variable p-primary inertial determinant over its diamond algebra at a ramified unramified-character self-extension of norm one, and its matching local types for the global type-three comparison.

What LocalGaloisDeformationRings must provide (gap:rational-minimal-conditions): Provide the CG18 Definition 3.1 local minimal deformation conditions over ℚ, including invariant-direct-summand minimality on every Artinian coefficient quotient.

What LocalGaloisDeformationRings must provide (gap:bianchi-local-types): Provide the absolute Bianchi S/P/M/H conditions with finite-flat precedence on every Artinian quotient, including the conductor-compatible Steinberg quotient at norm −1.

### From TauCetiRoadmap.GlobalGaloisDeformations

Sections 3.3–3.7 supply fixed-determinant global condition quotients, their tangent/obstruction comparison and framed presentations. Sections 5.1–5.8 supply auxiliary data and Chebotarev selection under their stated residual-image hypotheses; §§6.2–6.8 supply trace-generation, inertia/diamond maps and augmentation specialization. In this roadmap the exact specializations are CG18 Definition 3.1 and Propositions 3.2–3.3, 5.1–5.2: the rational tangent equality and imaginary-quadratic inequality have the dual module ad⁰ρ̄(1), and the latter includes the complex-place term −3. Once the dual Selmer group is killed the coefficient source has q−1 variables, not q. No stronger residual-image condition is silently substituted for the source's cyclotomic absolute irreducibility.

What GlobalGaloisDeformations must provide (gap:taylor-wiles-sets): Provide CG18 Propositions 3.3 and 5.2 auxiliary sets of exactly q dual-Selmer-killing distinct-root primes for these unramified-at-p rational and imaginary-quadratic problems, including p=3 under the cyclotomic absolute-irreducibility hypothesis.

What GlobalGaloisDeformations must provide (gap:defect-one-presentations): Provide the CG18 Propositions 3.2 and 5.1 tangent equality or inequality and q−1-variable presentations for the CG18 Definition 3.1 minimal problem over ℚ unramified at p and the CG18 §5.1 minimal problem over imaginary quadratic F, with the dual adjoint Tate twist and diamond augmentation quotient.

### From TauCetiRoadmap.AutomorphicGaloisRepresentations

Section 2.10 compares the finite-image arithmetic Artin representation supplied by AlgebraicModularFormsAndSerreWeights §6.4 with the cohomological normalization, retaining its trace and determinant. Sections 3.7, 4.1–4.6 and 6.12 supply Carayol/local compatibility, conductor and ordinary/flat condition quotients with their coefficient hypotheses. Sections 5.1 and 6.8–6.9 supply the ordinary lattice and whole-image determinant/reconstruction. Their ordinary quotient has arithmetic Frobenius Uₚ, and the subcharacter is εⁿ⁻¹λ(⟨p⟩/Uₚ). For instance with εⁿ⁻¹ = 1, Uₚ = 2 and ⟨p⟩ = 6 over 𝔽₇, the two characters have Frobenius values 2 and 3, trace 5 and determinant 6. The high-weight input is used before weight-one unramifiedness, so Tₚ descent does not depend circularly on the final theorem.

What AutomorphicGaloisRepresentations must provide (gap:integral-ordinary-hasse): Provide the high-weight p-anaemic arithmetic Hecke representation and chosen ordinary triangular characters on the finite Hasse subquotients, with the unramified quotient eigenvalue and exact minimal/type conditions over the whole image including nilpotents.

### From TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer

Sections R16.2.11 and R16.3.9 supply the full CDT lattice and minimal inertial selector for Wσ* only when a(θ/θ^σ) = a(θ). No twist-minimality at an irreducible decomposition group is a standing hypothesis here; the extension in gap:vexing-norm-twist-selector supplies the remaining norm twists. Sections R16.2.7, R16.4 and R16.6.5 supply local newvectors, global multiplicity one and contragredients with their actual finite-level dimensions; §R16.6.6 supplies the characteristic-zero primitive weight-one dictionary at exact conductor. Its k = 1 parameter is 1 ⊕ sgn, with no negative symmetric-power coefficient. The Bianchi dictionary uses the degree-one cohomology at infinity and the actual finite type multiplicity. A representation occurring once with two finite-level invariant vectors contributes dimension two.

What GL2AutomorphicRepresentationsAndTransfer must provide (gap:vexing-norm-twist-selector): Provide the norm-twist extension of the conductor-minimal CDT full-compact selector for every vexing character θ=θ₀(λ∘Norm), with a(θ₀/θ₀^σ)=a(θ₀), a stable integral lattice for the inflation of Θ(θ₀) tensored by λ∘det on GL₂(Z/x^n Z) with n=max(a(θ₀),a(λ)), the contragredient section convention, and multiplicity one exactly for the fixed minimal inertia type.

What GL2AutomorphicRepresentationsAndTransfer must provide (gap:principal-local-selectors): Provide the half-conductor ψ(a/d) selector for ψ²≠1 and the quadratic ψ∘det spherical selector for ψ²=1, with integral lattices and exact prime-to-p diamond multiplicities at the Bianchi P/M/H levels.

What GL2AutomorphicRepresentationsAndTransfer must provide (gap:bianchi-classical-dictionary): Provide the coefficient-field-compatible Bianchi degree-one cuspidal homology dictionary at the exact finite type spaces with arithmetic Frobenius and bad local-factor normalizations, retaining each local invariant-space dimension.

### From TauCetiRoadmap.SerreWeightAndLevelOptimisation

Sections 3.4 and 3.13 supply field-valued Katz weight-one unramifiedness for p > 2, including repeated roots, and, for an already modular residual representation unramified at p, a conductor-level Katz weight-one witness and its proper ideal. The modularity input comes from ClassicalSerreModularity R27.5/hypothesis-H-and-theorem-9-1. These are residual inputs, not the torsion-Hecke-valued conclusion. Sections 3.10–3.12 supply the ordinary connected/étale Tate sequence, the known nonexceptional multiplicity-one cases and the scalar lower bound. The connected Tate module is free rank one over the full Hecke algebra; its étale partner is its Zₚ-dual. Freeness of the middle module over a non-Gorenstein Hecke algebra is not assumed. The full residual ideal includes Uₚ.

Section 3.14 supplies injectivity of each individual ordinary projection of Hasse multiplication on fine tame level L ≥ 5 with p∤L and distinct nonzero residual roots α,β. On the whole localized weight-one module, Tₚ−(α+β) and ⟨p⟩−αβ are nilpotent. For O/πᵐ, choose a Hasse power of weight h with all-cusp expansion 1, pʰ = 0 and the stated cyclotomic-power congruences; the target has weight h+1. Apply this theorem to the fine proof model of §0.1, then use §1.3 for its conductor descent. No injection of the entire doubled source into one ordinary factor is asserted (CG20, Lemma 8.14, pp. 865–866; cg20 line 2540).

What SerreWeightAndLevelOptimisation must provide (gap:jacobian-residual-isotypy): Provide annihilation of J₁(N*)[p^∞]_m by the Cayley–Hamilton ideal of its Hecke-valued determinant at the full conductor-minimal non-Eisenstein ideal m, compatibly with the good-reduction Eichler–Shimura relation of ModularCurvesPartII §17.2.

What SerreWeightAndLevelOptimisation must provide (gap:carayol-diamond-quotient): Provide the Carayol diamond-quotient comparison with p≠3 and the Q(√−3)-induction exclusion.

### From TauCetiRoadmap.PotentialModularityAndCompatibleSystems

Section 8.8, The Calegari–Geraghty finiteness application, supplies O-finiteness of R_φ for the odd absolutely irreducible modular rational scalar residual datum of §7.1, twist-minimal away from p, and of its Frobenius-eigenvalue-adjoined ring. It includes p = 3 and the exceptional nonadequate images. The conductor-compatible fixed-character quotients remain O-finite. This input supplies no generic Hecke identification or variable-determinant global type calculation.

### From TauCetiRoadmap.GL2ModularityLifting

Sections 3.7 and 4.1–4.2 supply the defect-zero component-support and generic/integral comparison machinery. Section 7.2 requires its precise weight-two scalar, eigenvalue-adorned conductor specialization: each character-restricted Hecke image has its own determinant and matching local rings. Finiteness, parameter count and generic component support are separate inputs. A reduced generic comparison cannot identify integral orders without the stated O-flatness and generator argument.

What GL2ModularityLifting must provide (gap:scalar-conductor-comparison): Provide the conductor-specific global ordinary eigenvalue-adorned weight-two deformation presentation, its numerical relation bound and generic-fibre Hecke component comparison for each character φ, with the unipotent quotient at ramified Steinberg primes x ≡ −1 mod p and the minimal conditions of LocalGaloisDeformationRings §§2.1–2.5, 2.19 at the other primes away from p, including the matching variable-inertial-determinant presentation and component comparison in the nonharmless self-extension case.

What GL2ModularityLifting must provide (gap:scalar-variable-global-type): For p ≥ 3 and an odd absolutely irreducible modular rational residual representation, unramified at p with scalar Frobenius and twist-minimal away from p, prove that the matching ordinary eigenvalue-adorned global quotient for the conductor-at-most-one variable-inertial-determinant family at every nonharmless norm-one ramified unramified-character self-extension is finite flat Cohen–Macaulay of type three under full support on its specified characteristic-zero automorphic components, including verification of the O-Tor-independent local Cohen–Macaulay factors and the numerical relation bound making the global relations, framing parameters and π a system of parameters.

The local family remains gap:scalar-variable-determinant at LocalGaloisDeformationRings §§2.19, 6.18. The global type-three deliverable is separate from both that local construction and gap:scalar-conductor-comparison; the variable-determinant consequences in §§7.2–7.5 assume all three.

### From TauCetiRoadmap.ArithmeticLocallySymmetricSpaces

ALS.0.10 supplies the projective congruence subgroups and intermediate diamond levels. ALS.4.10 specifies the CG18 Eisenstein condition on PGL₂ Hecke ideals; ALS.4.12(b) states the localized ordinary/Borel–Moore comparison with finite O[Δ]-coefficients under neatness and ♠; its extension to the actual non-neat levels is gap:non-neat-bianchi-boundary. ALS.0–ALS.1 supplies the PGL₂ quotient, finite arithmetic-lattice components, stabilizers, local coefficients and groupoid chains. ALS.2 and ALS.4 supplies Borel–Serre compactification, boundary and its Eisenstein characters. ALS.3 supplies normalized transfer/conjugation/pushforward Hecke, including its component permutation and coefficient compatibility. ALS.5a.2–ALS.5a.6 supplies oriented ordinary/compact-support duality on its stated coefficient domain; ALS.5b.5–ALS.5b.8 supplies the characteristic-zero cuspidal cohomological comparison. ALS.6.1–ALS.6.3 supplies finite-cover groupoid descent. Apply its cohomological spectral sequence to K/O-valued dual coefficients and then exact Pontryagin duality: the result is Tor_i^(O[Δ])(H_j(Y_Δ,O),O) ⇒ H_(i+j)(Y₀,O). If localized H₀ vanishes, its degree-two edge is H₂(Y_Δ,O)_Δ → H₂(Y₀,O) → Tor₁^(O[Δ])(H₁(Y_Δ,O),O) → 0. This derived consequence needs no extra duality or edge-map supplier contract. For p ≥ 5 the relevant finite stabilizer orders are prime to p; for p = 3 localized control of the order-three contribution is required. At a point with stabilizer C₃, Hᵢ(C₃,𝔽₃) has dimension one in every degree, including i = 3; its coarse point has H₃ = 0. This is the negative control for using a coarse noncompact three-manifold argument.

The p = 3 conclusions assume the named hypothesis H₃(3) stated in the following contract. CG18 Lemma 5.9(1) (p. 376; cg18 line 3236) asserts this localized vanishing for every p ≥ 3, but its proof (p. 377; cg18 line 3246) uses the unlocalized vanishing H₃(Y₀(Q),k) = 0 of a noncompact three-manifold, which is not available for stabilizer-retaining homology at p = 3 when an order-three stabilizer occurs (the C₃ negative control of the preceding paragraph). The localized statement is therefore assumed here as H₃(3), and the gap records the request for a theorem establishing it.

What ArithmeticLocallySymmetricSpaces must provide (gap:localized-three-primary-stabilizers): Establish hypothesis H₃(3): for p = 3 unramified in imaginary quadratic F, at every level Y₀(Q) and Y_Δ(Q) of ArithmeticLocallySymmetricSpaces ALS.0.10(iv) and every non-Eisenstein m associated to ρ̄ with ρ̄ restricted to G_(F(ζ₃)) absolutely irreducible, H₃(Y_?(Q),k)_m = 0, where ? is 0 or Δ.

What ArithmeticLocallySymmetricSpaces must provide (gap:non-neat-bianchi-boundary): For p ≥ 3 unramified in imaginary quadratic F, at the non-neat projective levels Y₀(Q), Y_Δ(Q) of ArithmeticLocallySymmetricSpaces ALS.0.10(iv), prove localized boundary homology vanishing in all degrees and the ordinary-to-Borel–Moore homology isomorphism for every p-power quotient Δ and finitely generated O[Δ]-module μ at a non-Eisenstein ideal associated to an absolutely irreducible residual representation, without a Hecke-valued Galois lift or the general hypothesis ♠.

What ArithmeticLocallySymmetricSpaces must provide (gap:integral-principal-types): Provide the integral Bianchi minimal principal-type coefficient model for the half-conductor or twisted spherical selectors, with arbitrary coefficient change, Hecke, diamond-cover descent and duality, on which the all-level Conjecture A hypothesis can be imposed.

### From TauCetiRoadmap.AutomorphyLiftingBeyondTaylorWiles

Section 3.5, Lemma 9.6, states the n = 2 selected-root cohomology comparison under B^gal, including its Hecke-valued lift clause (ii). The association of m to ρ̄ supplies only clause (i). Section 9.2 uses the residual-only extension requested below and transports it through universal coefficients and Pontryagin duality with the transposed Hecke action.

What AutomorphyLiftingBeyondTaylorWiles must provide (gap:selected-root-residual-only): Provide the n = 2 selected-root comparison of §3.5 for Taylor–Wiles sets with p > 2 and distinct residual roots assuming only the residual part (i) of B^gal, with no Hecke-valued lift from part (ii).

### From TauCetiRoadmap.ModularityAndLanglandsExtensions

Section 1.5 states CG18 Lemma 4.14: for a number field F, a finite field k of characteristic p, a finite set S of places not above p and an absolutely irreducible continuous ρ̄:G_(F,S)→GL₂(k) with universal deformation ring R, if R has only finitely many Q̄ₚ-points and each has finite image, then R[1/p] is reduced. Beyond the finiteness hypotheses and the Noetherian complete local structure of R, its proof uses only that traces generate R and that a self-extension of a finite-image characteristic-zero representation of G_(F,S) splits by class field theory. Both properties pass to every quotient of R: traces generate the quotient, and an E[ε]/ε²-point of the quotient, for E finite over ℚₚ, is such a point of R. Sections 4.5 and 6.5 apply the lemma in this form to the minimal quotient R_min of the universal ring of ρ̄ on G_(ℚ,S(ρ̄)), verifying the finiteness hypotheses for R_min. No finiteness of the Q̄ₚ-points of R itself is assumed: its non-minimal points are not controlled by R_min = T.

### From TauCetiRoadmap.ClassFieldTheory

Layer 7 supplies arithmetic and geometric Artin maps, norm/conductor compatibility and the uniformizer inversion convention. Layers 11–12 supply global reciprocity, ray-class finiteness and the norm-index/class-field correspondence. These imply in §§4.5 and 6.5 that a torsion-free abelian pro-p extension unramified at every p-adic place and outside finitely many other primes is trivial: the allowed local p-primary unit quotients and the class group are finite. Section 10.6 uses the full order h = pᵇ relation for ray-class splitting; the p-th-power test alone is insufficient for b > 1. The reciprocity witness 2 ↔ 4 over 𝔽₇ is retained at every use of a geometric local character.

## How to read the build

Layers 0–1 fix the conductor and fine-level modules, correspondence matrices, coherent descent and balancedness. Layers 2–3 construct doubling before proving unramifiedness in all three Frobenius cases. Layer 4 applies the supplied balanced theorem to obtain minimal R = T and finite image. Layers 5–6 construct the coefficient bundles independently at each level and repeat the arithmetic argument with contragredient types. Layer 7 gives the scalar Jacobian calculation through the exact type-three comparison. Layers 8–10 construct Bianchi minimal levels and the all-level Conjecture A contract, prove the localized homological inputs, and apply the same balanced engine with the actual local multiplicities. Each Needs line separates statement carriers from a proof route's inputs; no route forces unrelated prerequisites on a different proof.

## Layer 0: Weight-one levels and coherent homology

### 0.1 Weight-one level data

For p≥3, O the integers of a finite extension K/Q_p, uniformizer π and residue field k, fix odd absolutely irreducible continuous ρ̄:G_Q→GL₂(k), unramified at p, with prime-to-p Artin conductor N. A level datum consists of the conductor-level Katz/descent object X, a fixed auxiliary prime r≥5 away from Np with r≢1 mod p and residual Frobenius eigenvalue ratio different from r and r⁻¹, a finite set Q disjoint from Npr, chosen distinct residual roots α_x,β_x for x∈Q, and a p-power quotient Δ of ∏_(x∈Q)(Z/xZ)×. Write X₀(Q), X₁(Q), X_Δ(Q) for the corresponding imported curves over O. The prime r is removed only by the selected-oldform comparison; it is not a Taylor–Wiles variable. At each ramified x with ρ̄|D_x reducible require ρ̄^(I_x)≠0, the standing hypothesis of CG18 §3.1. At conductor level quotient Γ₁(N) by the p-primary diamond subgroup H_N; use its genuine Katz/descent object, not a coarse Hodge line without descent. The fine rigidified model has extra Γ₁(r) level, denoted X^(r). Statements at conductor level mean the module recovered from this model by the harmless-prime comparison (one or two old copies); the fine model and the conductor object are not identified.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

A proof route uses these inputs. Import the fine moduli and smooth compactification, Hodge bundle ω and reduced cusp divisor C from AlgebraicModularFormsAndSerreWeights §R15.1. Let L be the fixed field of ker ρ̄. Since L is unramified at p and ℚ(ζₚ)/ℚ is totally ramified at p, their intersection is ℚ. In Gal(Lℚ(ζₚ)/ℚ), choose the class (1,a) with a ≠ 1 in 𝔽ₚˣ. Tau Ceti's Chebotarev density theorem gives infinitely many primes in this class; discard those dividing 6Np. Then ρ̄(Frobᵣ) = I₂, its eigenvalue ratio is 1 and r mod p = a ≠ 1, so both forbidden ratios are avoided. Specialize the standard level functors and p-power diamond quotient; keep Q empty and Δ=1 valid. Use the AlgebraicModularFormsAndSerreWeights §R15.1 representability/descent contract and the Layer 1 harmless-prime comparison to transport conclusions to conductor level. A repeated auxiliary root gives two old copies; divide the defect inequality by two, rather than calling this a one-copy selected factor. (CG18, §3.1, pp. 310–312; §3.2.1, pp. 312–314; Remark 3.10, pp. 325–326; cg18 lines 575, 1153–1169.)

The construction has the following API.

- Return the conductor Katz/descent object X and its level variants, separately from the fine rigidified curves X^(r), X₀^(r)(Q), X₁^(r)(Q), X_Δ^(r)(Q), with finite maps, ω and C on the fine models.
- On the fine models, X_Δ^(r)(Q)→X₀^(r)(Q) has deck group Δ; specify the induced descent module at conductor level and retain any cusp stabilizers.
- For Q⊂Q′ and compatible Δ′→Δ, identify level-forgetting maps and the Hodge pullback on the fine models, compatibly with conductor descent.
- Compare two admissible fine rigidifications through a common refinement; the descended conductor module and its away-r Hecke action are independent of the proof model, with the stated one- or two-copy multiplicity.

**Checks.**

- Q=∅ and Δ=1 recover the conductor Katz/descent object; its fine proof model still has the separate rigidifying r-level.
- The coarse level-one curve at p=3 is not accepted as fine Hodge data without rigidification/descent.
- If ρ̄(Frob_r) has eigenvalue ratio r, reject r even when r∤Np.
- In the Chebotarev class (1,2) at p = 3, the residual eigenvalue ratio is 1 while r and r⁻¹ both equal 2 modulo 3, so the required inequalities hold. The cyclotomic value 1 would instead fail r ≢ 1.

*Needs:* AlgebraicModularFormsAndSerreWeights §R15.1 (geometric forms, small-level descent and logarithmic Kodaira–Spencer); GlobalGaloisDeformations §§5.1–5.8 (Taylor–Wiles selection); LocalGaloisDeformationRings §§2.1–2.5, 2.19 (minimal away-p conditions). gap:conductor-rigidified-descent. Tau Ceti `NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet`, `NumberField.Chebotarev.infinite_frobeniusPrimeSet`.

### 0.2 Weight-one arithmetic Hecke data

On H⁰(X₁(Q),(ωⁿ)_(K/O)) and its finite π^m-torsion use normalized operators with q-expansion a_j(T_x f)=a_(xj)(f)+x^(n−1)⟨x⟩a_(j/x)(f) for x∤NprQ. The arithmetic Hecke datum is the image of the polynomial algebra on these T_x, the diamonds, and U_x for x∈Q; its anaemic image omits U_x. At weight one let m_∅ be the residual ideal supplied by the minimal Katz eigenform and m_Q add U_x−α_x. Take finite π^m images and then the inverse limit. The resulting local images are finite O-algebras; flatness is not imposed.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

A proof route uses these inputs. Use the existing image/local-factor construction IntegralHeckeAndGaloisDeterminants §§2.1–2.2 rather than a new generic Hecke-algebra carrier. Apply ClassicalSerreModularity R27.5/hypothesis-H-and-theorem-9-1 to the standing S-type residual representation to obtain modularity. SerreWeightAndLevelOptimisation §3.13 then supplies its conductor-level Katz weight-one witness, making m_∅ proper (CG18, discussion after Corollary 1.5, p. 304; cg18 line 315). Prescribe roots only after adjoining U_x. Compare the torsion images with the action on the Pontryagin-dual finite module; transition maps preserve the chosen local factor. (CG18, §3.2.3–3.2.4, pp. 315–317, 321; §3.3, pp. 326–327; cg18 line 770.)

The construction has the following API.

- The algebra is the image of exactly the displayed away-level operators, diamonds and selected U_x.
- The residue map sends T_x to tr ρ̄(Frob_x), diamonds to det ρ̄, and U_x to α_x.
- Reduction and change of coefficient quotient commute with the represented action, using image-to-image surjections rather than flat base change.
- A map from the displayed abstract operator algebra into B factors uniquely through the represented image exactly when it kills the kernel of its action on the specified module; maps out of the image agree if they agree on the displayed generators.

**Checks.**

- The image acting on a nonzero O/π module may be killed by π; no O-flat instance follows.
- For the S₃ standard representation over 𝔽₅ from the splitting field of X³−2, a transposition has eigenvalues 1,−1 and determinant −1, and a 3-cycle has eigenvalues ζ₃,ζ₃⁻¹ whose lines are exchanged by a transposition. Thus it is odd and absolutely irreducible. The discriminant is −108, prime to 5, so it is unramified at 5. Qualitative Serre modularity supplies the first witness; §3.13 then optimizes it to conductor-level Katz weight one.
- At Q=∅ the anaemic and full auxiliary images agree; neither automatically contains T_p.
- For residual U-polynomial (X−1)(X−2) over F₅ the ideals U−1 and U−2 select different factors.
- For a coefficient calculation at j = 1, x = 2, n = 1, diamond 3, a₂ = 4 and a₀ = 1, the nondivisible-index contribution is zero and the output coefficient is 4. Unguarded natural division would add 3a₀ and give 7.

*Needs:* §0.1; IntegralHeckeAndGaloisDeterminants §§2.1–2.2 (images and local factors); AlgebraicModularFormsAndSerreWeights §§2.1, 2.5, 2.12 (integral q-expansions and coherent Hecke); ClassicalSerreModularity R27.5/hypothesis-H-and-theorem-9-1 (qualitative residual modularity); SerreWeightAndLevelOptimisation §3.13 (minimal Katz witness).


### 0.3 Dual coherent homology

For a finite locally free sheaf L on a smooth proper relative curve X/O put H_i(X,L)=Hom_O(Hⁱ(X,(Ω¹_(X/O)⊗L^∨)_(K/O)),K/O), with its compact O-module topology and transpose Hecke action. Serre duality identifies it with H^(1−i)(X,L), including torsion. Define pullback/trace maps by transposing the corresponding cohomological adjoints, not by an unexplained identification with sections.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

A proof route uses these inputs. Specialize the existing coherent duality to the divisible coefficient sequence K/O. Track contravariance of both the sheaf dual and Pontryagin dual in finite level maps. Use cohomological dimension one to identify degrees and preserve torsion. (CG18, §3.2.4, p. 322; §3.9.2, pp. 351–352; cg18 line 1029.)

The construction has the following API.

- H_i(X,L)≅H^(1−i)(X,L), for i=0,1, naturally in L with the specified adjoint convention.
- The homological map attached to a finite cover is dual to its cohomological pullback on Ω¹⊗L^∨.
- The action of a correspondence is the transpose of its adjoint, including its degree and diamond normalization.
- A map of coefficient sheaves gives the corresponding covariant homology map by double contravariance. For an exact finite-coefficient sequence retain the derived long exact sequence; do not assert arbitrary tensor base change for torsion homology.

**Checks.**

- For L=ω, H₀ is coherent H¹ and H₁ is coherent H⁰; swapping them is rejected.
- A π-torsion class in coherent H¹ remains visible in H₀; tensoring with K before dualizing loses it.
- The degree-one identity correspondence induces the identity on both degrees.

*Needs:* §0.1; AlgebraicModularFormsAndSerreWeights §3.12, Twisted duality and the supersingular boundary.

### 0.4 Weight-one Hecke duality

After a finite extension adjoining ζ_(NQ), use the supplied root-Fricke twisted isomorphism Φ:H¹(X,(ω^(2−n)(−C))_(K/O))≃Hom_O(H⁰(X,ωⁿ),K/O), with ΦTₓ = x¹⁻ⁿTₓ∨Φ and compatible diamonds. Its dual Ψ:H⁰(X,ωⁿ)≃H₁(X,ωⁿ) satisfies Tₓ,hom Ψ = x¹⁻ⁿ ΨTₓ,sections, equivalently ΨTₓ,sections = xⁿ⁻¹Tₓ,hom Ψ. At n = 1 this is Hecke-linear; boundary vanishing and duality give H₀(X,ω)_m≃H¹(X,ω)_m and equal generic O-ranks of H₀ and H₁. Untwisted type coefficients use the contragredient convention of Layer 6.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

A proof route uses these inputs. Use the exact AlgebraicModularFormsAndSerreWeights §3.12 twisted-duality statement, not bare Serre duality as a Hecke-linear map. At weight one the scalar x^(1−n) is one; eliminate the cusp twist only after localization. Descend the rank equality from a finite coefficient extension. (CG18, §3.2.4, pp. 322–323; §3.8, p. 340; cg18 line 1029.)

**Checks.**

- At n=1 the good-prime Hecke scalar is one; at n>1 retain x^(1−n) and do not infer an untwisted Hecke-linear map.
- For n = 2, x = 2 and section eigenvalue 2, the homological eigenvalue is 1: 1 = (1/2)·2; the inverse placement would demand 2 = 1/2.
- For generic ranks zero and zero the rank equality is 0 = 0, while a nonzero π-torsion H₀ remains possible; equality of generic ranks does not erase it.

*Needs:* §0.3; AlgebraicModularFormsAndSerreWeights §2.16 (Eisenstein boundary eigensystems); AlgebraicModularFormsAndSerreWeights §3.12, Twisted duality and the supersingular boundary.

### Examples

At p = 3 and conductor 13, the coarse genus-zero quotient does not determine the weight-two Katz section module. The stack/descent section space is nonzero; genus zero gives zero ordinary holomorphic differentials, and the differential comparison requires the cusp ideal and correct Hodge descent (CG18, Remark 3.10, pp. 325–326; cg18 line 1183). A nonzero module killed by π remains an admissible coherent Hecke module.

### Dependencies

Tau Ceti `NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet`, `NumberField.Chebotarev.infinite_frobeniusPrimeSet`; AlgebraicModularFormsAndSerreWeights §R15.1 (geometric forms, small-level descent and logarithmic Kodaira–Spencer); GlobalGaloisDeformations §§5.1–5.8 (Taylor–Wiles selection); LocalGaloisDeformationRings §§2.1–2.5, 2.19 (minimal away-p conditions); IntegralHeckeAndGaloisDeterminants §§2.1–2.2 (images and local factors); AlgebraicModularFormsAndSerreWeights §§2.1, 2.5, 2.12 (integral q-expansions and coherent Hecke); ClassicalSerreModularity R27.5/hypothesis-H-and-theorem-9-1 (qualitative residual modularity); SerreWeightAndLevelOptimisation §3.13 (minimal Katz witness); AlgebraicModularFormsAndSerreWeights §3.12, Twisted duality and the supersingular boundary. Earlier internal targets are specified individually in the Needs lines.

## Layer 1: Degeneracy, descent and balancedness

### 1.1 Normalized weight-one degeneracy maps

For a base level L prime to p and x∤Lp, work on an imported fine model (or its genuine Katz/descent object) X and the degeneracy maps π₁,π₂:X₀(x)→X. Put V_x=φ₁₂π₂*, ψ(f,g)=π₁*f+V_xg and ψ^∨=(trπ₁,trπ₁W_x)/x. In column coordinates on the source, ψ^∨ψ=[[x⁻¹(x+1),T_x],[T_x,(x+1)⟨x⟩]], and U_x acts as [[T_x,x⟨x⟩],[−x⁻¹,0]]. These are identities of the imported geometric correspondences on weight-one sections.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

A proof route uses these inputs. Allow x=r when removing the rigidifying prime: in that application the base is level N, not level Nr. Make the correspondence calculation on a common fine refinement and descend it through R15.1. Define pullback using the universal isogeny and trace using the finite map; normalize both maps consistently. Compute U_xπ₁*=π₁*T_x−x⁻¹V_x and U_xV_x=x⟨x⟩π₁*. Prove π₁*trπ₁W_x=xU_x+W_x directly by summing the cyclic subgroups in the moduli correspondence. No cancellation of a possibly noninjective π₁* is used. (CG18, Lemma 3.5, pp. 318–320; Lemma 3.6, p. 321; cg18 line 870.)

The construction has the following API.

- Return ψ with its ordered coordinates (π₁*,V_x).
- The trace pairing in these coordinates is exactly the displayed 2×2 matrix.
- U_x intertwines ψ with the displayed column matrix; its characteristic polynomial is X²−T_xX+⟨x⟩.
- The linear degeneracy map is determined by its two columns π₁* and V_x; coefficient maps preserve both columns and their trace adjoints, with x retained as a unit.

**Checks.**

- For x=1 in the coefficient ring, the U-matrix is [[T,d],[−1,0]], whose determinant is d.
- For x=2,T=0,d=3 over Q the upper-right entry is 6 and lower-left −1/2, excluding the transposed formula.
- If α=xβ, the specialized pairing determinant is zero; the construction alone does not assert ψ invertible.

*Needs:* §0.2; §0.3; AlgebraicModularFormsAndSerreWeights §§2.1, 2.5, 2.12 (integral q-expansions and coherent Hecke); AlgebraicModularFormsAndSerreWeights §R15.1 (geometric forms, small-level descent and logarithmic Kodaira–Spencer); Mathlib `Matrix.det_fin_two`, `Matrix.charpoly`, `Matrix.aeval_self_charpoly`. gap:conductor-rigidified-descent.

### 1.2 Selected-root oldform comparison

Suppose x≡1 mod p and ρ̄(Frob_x) has distinct eigenvalues α,β. Localizing at the ideal extending m_∅ with U_x−α gives H⁰(X,(ω)_(K/O))_(m_∅)≅H⁰(X₀(x),(ω)_(K/O))_m. Iteration gives the same result for Q. The localized anaemic Hecke image surjects onto the selected U-image. The full oldspace before selecting α has two copies, not one.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

A proof route uses these inputs. The pairing determinant reduces to −(α−β)², a unit, so ψ splits off the two-copy oldspace. Use the correspondence identity for W_x to show a nonzero complementary localized quotient would force a forbidden Frobenius ratio. Select one Hensel root of U_x; compare finite π^m-torsion lengths before passing to K/O. (CG18, Lemma 3.5, pp. 317–320; cg18 line 856.)

**Checks.**

- For residual roots 1 and 2 over F₅ with x≡1, selecting U_x−1 yields one copy, while the unselected oldspace has two.
- Over 𝔽₅ with x = 1, α = 1 and β = 2, the pairing determinant is 4·2 − 3² = 4 = −(1−2)², a unit.
- Over 𝔽₅ with α = β = 1 and x = 1, that determinant is 0; distinct-root selection is unavailable, so a two-copy assertion cannot be replaced by one.

*Needs:* §1.1; AlgebraicModularFormsAndSerreWeights §2.16 (Eisenstein boundary eigensystems).

### 1.3 Harmless-prime oldform multiplicity

Let x∤Lp for the base level L, with residual Frobenius eigenvalues α,β satisfying α/β∉{x,x⁻¹}. As modules for the away-x Hecke algebra, the U_x=α local factor at level X₀(x) is one copy of the base weight-one module if α≠β and two copies if α=β. The repeated-root factor need not have scalar U_x action and is not a pair of idempotent factors. To remove r from a fine Γ₁(r) model of conductor N, take L=N and x=r, first taking invariants under the full r-diamond group (of order r−1, a unit in O) to reach Γ₀(r). The conductor object and its comparison are supplied by genuine small-level descent.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

A proof route uses these inputs. The determinant is x⁻¹(α−xβ)(β−xα), hence invertible under the stated ratio condition. Eliminate the complement using W_x and the same forbidden-ratio argument. Separate the two residual roots only when their difference is invertible. For x=r use exact prime-to-p diamond invariants and the AlgebraicModularFormsAndSerreWeights §R15.1 common-fine-refinement descent; the hypothesis x∤Lp now permits the required comparison. If the repeated-root comparison gives two old copies, transport balancedness by additivity of d_S under direct sums and divide the resulting inequality by two. Rank and freeness conclusions concern the conductor module; the auxiliary U_r is omitted from that comparison algebra. (CG18, Lemma 3.6, pp. 320–321; cg18 line 974.)

**Checks.**

- Allow a repeated residual root at a harmless x≢1 and recover two old copies in its single local factor.
- Over 𝔽₅ take x = 2, α = β = 1. The determinant is 2⁻¹(1−2)² = 3, while U = [[2,2],[2,0]] has (U−1)² = 0 and U−1 ≠ 0; its one local factor contains two old copies.
- For x = 2, α = 2, β = 1 over 𝔽₅, α = xβ and the pairing determinant is 0; an auxiliary prime away from Np alone is insufficient.

*Needs:* §1.1; AlgebraicModularFormsAndSerreWeights §R15.1 (geometric forms, small-level descent and logarithmic Kodaira–Spencer). gap:conductor-rigidified-descent.

### 1.4 Coherent diamond-cover descent

For S=O[Δ] and M=H₀(X_Δ(Q),ω)_m the homological Hochschild–Serre spectral sequence is Tor_i^S(H_j(X_Δ(Q),ω)_m,O)⇒H_(i+j)(X₀(Q),ω)_m. In particular M_Δ≅H₀(X₀(Q),ω)_m, and H₁(X_Δ(Q),ω)_(m,Δ)→H₁(X₀(Q),ω)_m→Tor₁^S(M,O)→0 is exact. The maps commute with away-level Hecke and the chosen U_x.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

A proof route uses these inputs. Use AlgebraicModularFormsAndSerreWeights §R15.1 coherent descent for the actual compactified finite étale diamond cover and Hodge sheaf, with its equivariant cohomology action and compatible degeneracy correspondences. This is a coherent Cartan–Leray statement on modular curves, not a specialization of topological local-system homology. Dualize the first-quadrant cohomological descent sequence with exact Pontryagin duality. Extract total degrees zero and one; do not replace the displayed right-exact segment by a short exact sequence. (CG18, Proof of Proposition 3.8, pp. 323–324; cg18 line 1082.)

**Checks.**

- The low-degree segment ends in Tor₁→0; do not assert injectivity at its left endpoint. At Δ=1 the Tor term vanishes.
- At Δ = 1, S = O, Tor₁ over S with O is zero, and augmentation coinvariants are the original module; the edge segment ends with 0.
- For the toy coefficient module k over O[Cₚ] with trivial action, Tor₁ with O is k and cannot be discarded merely because the cover is finite; this tests the edge term, not an assertion that k is the arithmetic module.

*Needs:* §0.3; §1.1; AlgebraicModularFormsAndSerreWeights §R15.1 (geometric forms, small-level descent and logarithmic Kodaira–Spencer). gap:diamond-cover-cartan-leray.

### 1.5 Balanced coherent homology

For the preceding M, d_S(M)=dim_k Tor₀^S(M,k)−dim_k Tor₁^S(M,k)≥0. Equivalently the imported balanced predicate holds. After using M_Δ and O-base change, d_S(M)=rank_O M_Δ−dim_k(Tor₁^S(M,O)/π); this formula and nonnegativity hold even when M has π-torsion.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

A proof route uses these inputs. H₁(X₀(Q),ω)_m is O-torsion-free: dualize divisibility of H¹((Ω¹⊗ω⁻¹)_(K/O)), which follows from H²=0 on a curve. Use the right-exact low-degree sequence to bound the k-dimension of Tor₁/π by rank H₁ at base level. Apply the weight-one generic rank equality and the imported defect/base-change formula. (CG18, Proposition 3.8, pp. 323–325; cg18 line 1065.)

**Checks.**

- A module killed by π is allowed: cancel its equal minimal-generator and O-torsion contributions before applying the Tor₁ bound.
- For Δ = 1 and M = O/π, the generator and relation dimensions are 1 and 1, so d = 0; the rank/Tor formula gives 0−0 = 0.
- For M = Sʳ, Tor₁ = 0 and M_Δ = Oʳ, so d = r; for M = 0 it is 0. These exclude a definition using the sum of Betti numbers.

*Needs:* §1.4; §0.4; DeformationAndDerivedPatchingAlgebra §5.1 (balanced presentations); DeformationAndDerivedPatchingAlgebra §5.1 (Tor defect identity).

### Examples

Over 𝔽₅, x = 1 and roots 1,2 give the pairing determinant 4 and one selected old copy. At x = 2 and repeated roots 1,1 the determinant is 3 and the single repeated-root local factor has two copies. Additivity gives d(M⊕M) = 2d(M), so balancedness of the two-copy auxiliary model descends to M.

### Dependencies

Mathlib `Matrix.charpoly`, `Matrix.aeval_self_charpoly` and `Matrix.det_fin_two`; AlgebraicModularFormsAndSerreWeights §§2.1, 2.5, 2.12 (integral q-expansions and coherent Hecke); AlgebraicModularFormsAndSerreWeights §R15.1 (geometric forms, small-level descent and logarithmic Kodaira–Spencer); DeformationAndDerivedPatchingAlgebra §5.1 (balanced presentations). Earlier internal targets are specified individually in the Needs lines.

## Layer 2: Hasse doubling and ordinary projections


### 2.1 Arithmetic Uₚ action on the supplied double

Use the injective Hasse double ψ from AlgebraicModularFormsAndSerreWeights §3.8, Weight-one Tₚ with torsion coefficients, on the finite weight-one module M at the prescribed away-p residual factor. In its ordered column basis (φ, φTₚ−Uₚφ), prove Uₚψ = ψ·[[Tₚ,⟨p⟩],[−1,0]]. Thus Uₚ²−TₚUₚ+⟨p⟩ = 0 on the image and Uₚ+⟨p⟩Uₚ⁻¹ acts there as diagonal Tₚ. If α,β are the residual arithmetic-Frobenius roots at p, the diamond reduces to αβ and a lift of (X−α)(X−β) acts nilpotently. Since det Uₚ is the unit diamond, zero is excluded from the eigenvalues of this double.

O is the integers of a finite extension K/ℚₚ with p ≥ 3; M has coefficients O/πᵐ, m ≥ 1, with the standing weight-one residual hypotheses. The high weight makes its Hasse expansion one and εⁿ⁻¹ = 1 modulo πᵐ. The source and target of ψ are the actual finite weight-one direct square and high-weight section space supplied by the geometric-form roadmap.

A proof route computes both columns using the supplied U/V coefficient formulas, then applies Cayley–Hamilton to the arithmetic matrix. The field-valued Katz Frobenius polynomial from SerreWeightAndLevelOptimisation §3.4 identifies the residual roots; Artinianity gives nilpotence on the localized image. This does not use the torsion-Hecke unramifiedness theorem of Layer 3. (CG18, proof of Theorem 3.11, p. 328; cg18 line 1265.)

**Checks.**

- The printed matrix [[Tₚ,1],[−⟨p⟩,0]] equals the column-action matrix here exactly when ⟨p⟩ = 1. At Tₚ = 0 and ⟨p⟩ = 3 over ℚ, our matrix sends (0,1) to (3,0), while the printed matrix sends it to (1,0); at ⟨p⟩ = 1 the two matrices coincide.
- With T = 0 and diamond 3 over ℚ, U = [[0,3],[−1,0]] sends (1,0) to (0,−1) and (0,1) to (3,0); U² = −3I. Interchanging the off-diagonal entries gives the wrong columns.
- For T = 3 and diamond 2 over 𝔽₅ the roots are 1 and 2; det U = 2 is a unit, so zero is not an ordinary eigenvalue.

*Needs:* AlgebraicModularFormsAndSerreWeights §3.8 (Weight-one Tₚ with torsion coefficients); Mathlib `Matrix.charpoly`; Mathlib `Matrix.aeval_self_charpoly`; SerreWeightAndLevelOptimisation §3.4 (field-valued weight-one unramifiedness); AutomorphicGaloisRepresentations §§5.1, 6.12 (ordinary lattice and quotient conditions).

### 2.3 Ordinary high-weight image algebras

For a sufficiently large n as above, let T_n be the localized high-weight Hecke image generated by good-prime T_x, diamonds and the chosen Q-level U_x, omitting U_p. Thus it is p-anaemic; the smaller good-prime-only image is kept distinct. Let T̃_(n,α) be the ordinary factor after adjoining U_p and selecting α. Define A_n=im(T_n→T̃_(n,α)) and write T̃_n=T̃_(n,α). The injected finite weight-one Hasse subquotient induces a quotient map from A_n to its p-anaemic image A. Do not identify A_n with T_n without a kernel calculation. The weight-one operator T_p on forms need not a priori belong to A; initially write B=A[T_p] as an endomorphism algebra.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

A proof route uses these inputs. Import ordinary idempotents and Hecke-valued high-weight representations, then restrict the action to the selected factor. Form A_n as an algebra image; localizing the p-factor can kill other ordinary or nonordinary factors. Use the injected Hasse subquotient to identify its anaemic quotient and its compatible Galois trace functions. (CG18, §§3.4–3.6, pp. 329–333; cg18 line 1295.)

The construction has the following API.

- T_n maps to the selected T̃_n and A_n is its range, with a canonical surjection T_n↠A_n.
- The p-anaemic action A on the injected finite weight-one Hasse subquotient is a quotient of A_n, retaining the chosen Q-level U_x and diamonds but not assuming T_p∈A.
- The high-weight Galois representation over A_n specializes to all trace-compatible finite quotients, including nonreduced ones.
- The kernel of T_n→A_n is exactly the kernel of its action on the selected high-weight factor. Maps from T_n descend uniquely to A_n if and only if they kill that kernel; the finite quotient A can have a larger kernel.

**Checks.**

- For B=O×O with projection to the first factor, the image is O, not an injective copy of B.
- On the finite module O/π², multiplication by π is a nonzero image operator although it reduces to zero on the mod-π fibre; reduction of traces alone does not determine the finite-quotient image.
- If the selected factor is already the whole Hecke algebra, A_n equals that algebra through the range isomorphism.

*Needs:* AlgebraicModularFormsAndSerreWeights §3.8 (Weight-one Tₚ with torsion coefficients); IntegralHeckeAndGaloisDeterminants §§2.1–2.2 (images and local factors); AutomorphicGaloisRepresentations §§5.1, 6.12 (ordinary lattice and quotient conditions); AutomorphicGaloisRepresentations §§6.8–6.9, 6.12 (integral determinant and reconstruction); §2.1; SerreWeightAndLevelOptimisation §3.14 (individual ordinary projections on the fine model); §1.3 (conductor descent).

### 2.4 Quadratic Hecke doubling

Let M be the finite weight-one module, A its faithful p-anaemic image and B=A[T_p] its image after adjoining the already-defined weight-one operator T_p. On the full doubled space ψ(M²), the U_p-stable image is first B[U_p]≅B[X]/(X²−T_pX+⟨p⟩), finite free of rank two over B. In the repeated-root case this is the selected ordinary local factor; with distinct roots it is the whole two-factor algebra before projection. The high-weight Galois Frobenius trace then proves T_p∈A, so B=A and the quadratic algebra is free rank two over A. Only after that identification may one use this rank-two statement over the p-anaemic image. A single distinct-root factor has rank one.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

A proof route uses these inputs. Work first over B=A[T_p]. The column matrix gives U_p²−T_pU_p+⟨p⟩=0, and ⟨p⟩ is a unit. If a+bU_p with a,b∈B annihilates ψ(M²), the lower-left entry gives bM=0 and then aM=0. Since B is the image on M, it acts faithfully. This proves B[U_p]≅B[X]/(X²−T_pX+⟨p⟩) without assuming T_p∈A. Use the AutomorphicGaloisRepresentations §§5.1, 6.12 ordinary triangular description and the AutomorphicGaloisRepresentations §§6.8–6.9, 6.12 integral high-weight representation: its trace at a p-Frobenius lift maps to U_p+⟨p⟩U_p⁻¹=T_p on this finite quotient. The cyclotomic factor is trivial there by the chosen high weight (one may choose a lift with ε(Frob_p)=1). That trace comes from T_n and therefore lands in its image A. This uses ordinary local compatibility, not the later conclusion that the weight-one representation is unramified. Conclude B=A. Preserve the full doubled module for the rank-two argument; select distinct-root factors only afterwards, when each has rank one. (CG18, Lemma 3.16 and the following Frobenius-trace paragraph, pp. 332–333; cg18 line 1442.)

**Checks.**

- A selected distinct-root factor has rank one, so it must fail the repeated-root rank-two contract.
- The proof must establish B=A[T_p] first and T_p∈A by high-weight traces; using the Layer 3 weight-one unramifiedness theorem here would be circular.
- For A = 𝔽₅, T = 3 and diamond 2 the full quadratic algebra has dimension 2 and its U = 1 selected factor has dimension 1; the full image is required for rank two.
- For repeated root 1, 𝔽₅[X]/(X−1)² has dimension 2 with nonzero square-zero X−1, whereas its residue field has dimension 1. Reduced points alone lose the doubling direction.

*Needs:* §2.3; §2.1; AutomorphicGaloisRepresentations §§5.1, 6.12 (ordinary lattice and quotient conditions); AutomorphicGaloisRepresentations §§6.8–6.9, 6.12 (integral determinant and reconstruction).

### Examples

With T = 0 and diamond 3 the doubling matrix sends (1,0) to (0,−1), sends (0,1) to (3,0), and has square −3I. For p = 3 in characteristic 3, the second Hasse column of a form with a₁ = 1 and diamond 2 begins 2q³; its coefficient of q is 0. No division by p occurs.

### Dependencies

AlgebraicModularFormsAndSerreWeights §§3.1–3.4, 3.8, 3.12 (Hasse, theta and twisted duality); AlgebraicModularFormsAndSerreWeights §§2.1, 2.5, 2.12 (integral q-expansions and coherent Hecke); Mathlib `Matrix.charpoly`; Mathlib `Matrix.aeval_self_charpoly`; SerreWeightAndLevelOptimisation §3.4 (field-valued weight-one unramifiedness); SerreWeightAndLevelOptimisation §3.14 (individual ordinary-projection injectivity); AutomorphicGaloisRepresentations §§5.1, 6.12 (ordinary lattice and quotient conditions); IntegralHeckeAndGaloisDeterminants §§2.1–2.2 (images and local factors); AutomorphicGaloisRepresentations §§6.8–6.9, 6.12 (integral determinant and reconstruction). Earlier internal targets are specified individually in the Needs lines.

## Layer 3: Unramified Galois representations in weight one

### 3.1 Wiese doubled-representation criterion

Let R be a local ring, M and N finite free rank-two R-modules with a group action, and 0→N→M⊕M→L→0 an exact sequence split as R-modules, with all terms free rank two except the middle. If L/m_RL is indecomposable as a group module, then N,M,L are isomorphic as R[group]-modules. In particular, if L is unramified at p, so is M.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant. For the untyped Galois and R = T assertions the vexing set is empty. Auxiliary fine-level copies are compared with the conductor-level module as in Layer 0–Layer 1.

A proof route uses these inputs. Reduce the two coordinate maps N→M and M→L modulo m_R. If no coordinate induces an isomorphism, the two rank-one images force a decomposition of L/m_RL; exclude it. Lift an invertible coordinate by Nakayama, then split the sequence equivariantly and identify the other quotient. (CG18, Lemma 3.17, p. 333; cg18 line 1486.)

**Checks.**

- A decomposable residual quotient is outside the theorem; a nontrivial rank-two Jordan quotient meets the indecomposability requirement.
- For a cyclic generator acting by J = [[1,1],[0,1]] on k², the diagonal inclusion N→M² and difference quotient M²→L give a split underlying sequence with N = M = L, each of dimension 2; J−1 ≠ 0 and (J−1)² = 0.
- For the nonabelian group S₃ over 𝔽₅, take its irreducible two-dimensional standard module and the same diagonal/difference sequence; dimensions are 2→4→2 and both composites are zero. A proof cannot assume the acting group is abelian.

*Needs:* §2.4.

### 3.2 Global doubling ideal

In the scalar case, after twisting by the unique unramified λ(c⁻¹) with c²=⟨p⟩ and c≡α, view A_n and T̃_n as algebras over the imported scalar-residual local ring R†. Put J_glob=Ann_(R†)(T̃_n/A_n). Here the quotient is an R†-module, not a quotient ring. Its action factors through R†/J_glob. Compare this ideal with J_loc=Ann_(R†)(R̃†/R†).

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant. For the untyped Galois and R = T assertions the vexing set is empty. Auxiliary fine-level copies are compared with the conductor-level module as in Layer 0–Layer 1.

A proof route uses these inputs. Normalize the U_p eigenvalue by c so that the residual representation is trivial and the determinant is ε^(n−1) modulo the required finite coefficients. Form the quotient module and its annihilator. Use the local eigenvalue-ring action to compare annihilators without requiring R†→A_n injective. (CG18, Definition 3.25, p. 338; scalar normalization, pp. 334–335; cg18 line 1670.)

The construction has the following API.

- r∈J_glob iff rT̃_n⊂A_n.
- T̃_n/A_n is an R†/J_glob-module with the induced faithful action.
- The map R̃†⊗_(R†)A_n↠T̃_n implies J_loc⊂J_glob.
- J_glob is the largest ideal of R† annihilating the relative module T̃_n/A_n. An R† action on this module factors through R†/I exactly when I⊂J_glob.

**Checks.**

- If A_n=T̃_n, the annihilator is the unit ideal and the quotient action is zero.
- For A→A[X]/(monic quadratic) with basis 1,X, the relative quotient is free rank one, hence its annihilator in A is zero.
- A need not be an ideal of T̃; no ring multiplication is imposed on T̃/A.

*Needs:* §2.3; LocalGaloisDeformationRings §6.7 (ordinary eigenvalue ring); ClassFieldTheory Layer 7 (arithmetic and geometric local reciprocity).

### 3.3 Scalar local comparison

For the normalized scalar case there is a surjection A_n⊗̂_(R†)R̃†↠T̃_n carrying the local eigenvalue to normalized U_p. Therefore J_loc⊂J_glob. By the imported equality J_loc=I_unr, every quotient of A_n on which the ordinary algebra is doubled is unramified at p. On that quotient T_p=U_p+⟨p⟩U_p⁻¹ belongs to the anaemic algebra.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant. For the untyped Galois and R = T assertions the vexing set is empty. Auxiliary fine-level copies are compared with the conductor-level module as in Layer 0–Layer 1.

A proof route uses these inputs. Use the ordinary high-weight local triangular representation with the chosen Frobenius eigenvalue to define the map from R̃†. Show A_n and the eigenvalue U_p generate T̃_n; this proves surjectivity, not a tensor-product isomorphism. Apply the annihilator containment and I_unr=J_loc, then read the quadratic trace relation. (CG18, Lemma 3.24 and Definition 3.25, pp. 337–338; cg18 line 1662.)

**Checks.**

- An unramified normalized twist must preserve unramifiedness after undoing it, and the local eigenvalue maps to c⁻¹U_p.
- For a scalar c = 2 over 𝔽₇ and Uₚ = 6, the normalized eigenvalue is 2⁻¹·6 = 3; undoing an unramified scalar twist changes Frobenius, not inertia.
- For A⊂A[β]/β², the relative module is the free line Aβ with annihilator zero over A; passing to the reduced eigenvalue algebra A would instead annihilate the whole relative module.

*Needs:* §3.2; §2.4; LocalGaloisDeformationRings §7.5 (doubling and unramified ideals); AutomorphicGaloisRepresentations §§6.8–6.9, 6.12 (integral determinant and reconstruction); AutomorphicGaloisRepresentations §§5.1, 6.12 (ordinary lattice and quotient conditions).

### 3.4 Unramifiedness in the three Frobenius cases

For every finite weight-one Hecke quotient of Layer 0 the representation reconstructed from high-weight trace functions is unramified at p. If α≠β, the two ordinary factors give opposite unramified rank-one quotients and hence an unramified split representation. If α=β and ρ̄(Frob_p) is nonscalar, quadratic doubling gives an unramified indecomposable quotient and the Wiese criterion applies. If ρ̄(Frob_p) is scalar, use the normalized local doubling ideal. In all three cases T_p descends to the anaemic weight-one algebra.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant. For the untyped Galois and R = T assertions the vexing set is empty. Auxiliary fine-level copies are compared with the conductor-level module as in Layer 0–Layer 1.

A proof route uses these inputs. Construct compatible trace functions on the finite Hasse subquotients using high-weight representations and residual absolute irreducibility; reconstruct an actual representation over the whole image. For distinct roots apply both ordinary projections, not only their direct sum. At finite coefficients ε^(n−1)=1 makes both diagonal characters unramified. For repeated nonscalar Frobenius use the residual Jordan block for indecomposability. For scalar Frobenius use the local-comparison theorem. Compute the unramified Frobenius trace and pass to the finite coefficient quotient. (CG18, §3.5, pp. 331–332; §3.6, pp. 333–334; §3.7, p. 338; cg18 line 1384.)

**Checks.**

- Run the proof in each root pattern, including scalar Frobenius; no p-distinguished assumption can remain in the output.
- Over 𝔽₅ compare diag(1,2), [[1,1],[0,1]] and I. Their (trace,determinant) pairs are (3,2), (2,1), (2,1); the last two have equal polynomials but require different arguments.
- The scalar I has a two-dimensional eigenspace and the Jordan matrix has a one-dimensional eigenspace. A discriminant test returns zero in both cases and cannot select the scalar proof.

*Needs:* SerreWeightAndLevelOptimisation §3.14 (individual ordinary-projection injectivity on the fine model), with §1.3 for conductor descent; §2.4; §3.1; §3.3; AutomorphicGaloisRepresentations §§6.8–6.9, 6.12 (integral determinant and reconstruction); AutomorphicGaloisRepresentations §§5.1, 6.12 (ordinary lattice and quotient conditions).

### 3.5 Weight-one Hecke-valued Galois representation

Assume Q consists of primes x≡1 mod p, with ρ̄ unramified at x and distinct chosen roots. Over the finite local weight-one image T_Q,m there is a continuous lift ρ_Q of ρ̄ unramified outside NQ, with arithmetic-Frobenius trace T_x away from NpQ and trace T_p at p. There is a unique character η≡1 with η²=Teich(det ρ̄)/(detρ_Q); ρ_Q⊗η has fixed Teichmüller determinant and is minimal outside Q. At x∈Q it splits into two lifted eigenlines; on inertia the selected line is the diamond character and the other is its inverse after determinant normalization, with geometric-Artin/arithmetic-Frobenius conversion explicit. The diamond character belongs to the image of R_Q. A surjection onto the full U-image at auxiliary level requires the stated local compatibility, not traces alone.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant. For the untyped Galois and R = T assertions the vexing set is empty. Auxiliary fine-level copies are compared with the conductor-level module as in Layer 0–Layer 1.

A proof route uses these inputs. The preceding three cases and high-weight interpolation give compatible representations over all π^m quotients. Apply the unique square-root automorphism on characters valued in 1+m, using p odd, to normalize the determinant. Use Carayol-type away-p compatibility to verify the precise minimal local condition and diagonalize at Q by the distinct residual roots. Pass to the inverse limit and compare local reciprocity on units with the diamond action. (CG18, Theorem 3.11 and Remarks 3.12–3.13, pp. 326–327; proof, pp. 327–338; cg18 line 1178.)

**Checks.**

- At Q=∅ obtain unramifiedness at p and T_p descent. At nonempty Q retain Q-ramification and verify the diamond image without an unsupported full auxiliary surjection.
- For p = 3 a character value 1+3 in ℤ/9 has the unique square root congruent to 1 given by 7, since 7² = 4 modulo 9. At p = 2 the value 1 has roots 1 and 3 modulo 4, so the normalization is not unique.
- For determinant 6 and arithmetic roots 2,3 over 𝔽₇ the polynomial is X²−5X+6; replacing Frobenius by its inverse gives trace 2⁻¹+3⁻¹ = 4+5 = 2, which is different from 5.

*Needs:* §3.4; §2.3; LocalGaloisDeformationRings §§2.1–2.5, 2.19 (minimal away-p conditions); AutomorphicGaloisRepresentations §§3.7, 4.1–4.6, 6.12 (local compatibility); ClassFieldTheory Layer 7 (arithmetic and geometric local reciprocity); GlobalGaloisDeformations §§3.3–3.7 (condition quotients and presentations). gap:rational-minimal-conditions; gap:integral-ordinary-hasse.

### Examples

The matrices diag(1,2), [[1,1],[0,1]] and I over 𝔽₅ test distinct, repeated nonscalar and scalar Frobenius. The repeated cases share X²−2X+1 but have eigenspace dimensions 1 and 2. The normalized scalar c = 2, U = 6 over 𝔽₇ gives local eigenvalue 3; the arithmetic/geometric character values 2 and 4 remain inverse.

### Dependencies

LocalGaloisDeformationRings §6.7 (ordinary eigenvalue ring); ClassFieldTheory Layer 7 (arithmetic and geometric local reciprocity); LocalGaloisDeformationRings §7.5 (doubling and unramified ideals); AutomorphicGaloisRepresentations §§6.8–6.9, 6.12 (integral determinant and reconstruction); AutomorphicGaloisRepresentations §§5.1, 6.12 (ordinary lattice and quotient conditions); LocalGaloisDeformationRings §§2.1–2.5, 2.19 (minimal away-p conditions); AutomorphicGaloisRepresentations §§3.7, 4.1–4.6, 6.12 (local compatibility); GlobalGaloisDeformations §§3.3–3.7 (condition quotients and presentations). Earlier internal targets are specified individually in the Needs lines.

## Layer 4: Minimal weight-one R = T

### 4.1 Weight-one Taylor–Wiles system

Let q=dim_k H¹_dual(ad⁰ρ̄(1)) for the unramified-at-p minimal problem over Q, with q≥1. For every a≥1 choose Q_a of size q, x≡1 mod p^a, killing the dual Selmer group, and chosen roots. With S_a=O[(Z/p^aZ)^q] and A_∞=O[[z₁,…,z_(q−1)]], take H_a=H₀(X_(Δ_a)(Q_a),ω)_(m_a) and H=H₀(X,ω)_(m_∅). The system includes A_∞↠R_min, compatible A_∞ actions on H_a, H_a,Δ_a≅H, balancedness over S_a, and image(S_a)⊂image(A_∞) with augmentation mapping into the minimal kernel. The maps from A∞ at different original levels need not agree and no maps between unrelated Qₐ levels are assumed; the required compatibilities are at finite coefficient cutoffs and along actual level-forgetting maps.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant. For the untyped Galois and R = T assertions the vexing set is empty. Auxiliary fine-level copies are compared with the conductor-level module as in Layer 0–Layer 1.

A proof route uses these inputs. Import the CG18 Proposition 3.2/3.3 presentation and prime-selection contract from GlobalGaloisDeformations §§3.3–3.7, 5.1–5.8, 6.2–6.8, retaining ad⁰ρ̄(1) and the exact residual-image hypotheses. Use the selected residual eigenline at every Taylor–Wiles prime to define O[Δ_a]→R_(Q_a); killing its augmentation gives R_min. Use coherent descent and selected-root comparison for coinvariants and balancedness. Identify the algebra image condition on H_a through the diamond characters of ρ_(Q_a). (CG18, Theorem 3.26, pp. 339–340; Propositions 3.2–3.3, pp. 311–312; cg18 line 1706.)

The construction has the following API.

- For each a return Q_a, Δ_a, H_a and its commuting S_a and A_∞ actions.
- H_a⊗_(S_a)O≅H with its A_∞ action through R_min.
- The inertia/diamond map factors S_a→R_(Q_a), and augmentation specializes it to the minimal deformation ring.
- Record compatibility of the finite coefficient and diamond quotients with the A_∞ actions and selected residual roots; any system comparison used in patching must preserve the coinvariant identification with the same H.

**Checks.**

- For q=1, A_∞=O; inserting one power-series variable gives the defect-zero presentation and is rejected.
- Every group basis element of S_a maps to 1 under TauCeti.MonoidAlgebra.augmentation; augmentation is not coefficient extraction at the identity.
- A nonzero H killed by a power of π is admissible; requiring O-flat H excludes the main defect-one case.

*Needs:* §3.5; §1.2; §1.5; GlobalGaloisDeformations §§3.3–3.7 (condition quotients and presentations); GlobalGaloisDeformations §§5.1–5.8 (Taylor–Wiles selection); GlobalGaloisDeformations §§6.2–6.8 (trace rings and auxiliary specialization); Tau Ceti `TauCeti.MonoidAlgebra.augmentation`. gap:taylor-wiles-sets; gap:defect-one-presentations.

### 4.2 Minimal weight-one R = T

Assume the no-vexing minimal problem and the Katz witness of Layer 0. The map R_min→T_∅,m_∅ induced by the determinant-normalized representation is an isomorphism of complete local O-algebras; H₀(X,ω)_(m_∅) is a nonzero finite free R_min-module. Neither R_min nor T is required to be O-flat. Via the weight-one duality the same Hecke algebra acts on H¹(X,ω)_m.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant. For the untyped Galois and R = T assertions the vexing set is empty. Auxiliary fine-level copies are compared with the conductor-level module as in Layer 0–Layer 1.

A proof route uses these inputs. Apply the imported balanced-module patching theorem to H_a and A_∞. A positive-rank free module is faithful over R_min, while the Hecke algebra is its action image. Thus the surjective minimal map has zero kernel. Transport the result to coherent cohomology using the chosen Hecke-equivariant weight-one duality. (CG18, Theorem 3.26, pp. 339–340; Theorem 1.4, p. 303; cg18 line 1706.)

**Checks.**

- Permit a nonzero ring killed by π; freeness is over R_min, and the conclusion does not force O-flatness.
- The toy specialization R = T = k, H = k is free of rank one over R, although πH = 0. An O-flatness consequence would contradict this allowed algebraic shape.
- For nonzero R and H = Rʳ with r > 0, an element acting by zero kills each basis vector and is zero; for H = 0 every element acts by zero. Nonzeroness is needed for the faithful-image conclusion.

*Needs:* §4.1; DeformationAndDerivedPatchingAlgebra §5.5 (balanced patching); §0.4; §0.2.

### 4.3 No-vexing rank one including torsion

After removing the harmless rigidifying prime r and returning to the conductor-level Katz module, under the preceding no-vexing hypotheses, H₀(X,ω)_m is free of rank one over T_m, including when H₀[1/p]=0. In the torsion case the m-eigenspace in H⁰(X,ω_k(−C)) has k-dimension one. All bad U_x belong to the anaemic localized algebra: on the rank-one inertia-invariant line they are Frobenius scalars; if the invariant space is zero the minimal newvector operator is zero. This case split uses invariant dimensions, not merely the exponent of N.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant. For the untyped Galois and R = T assertions the vexing set is empty. Auxiliary fine-level copies are compared with the conductor-level module as in Layer 0–Layer 1.

A proof route uses these inputs. In characteristic zero use GL₂ global multiplicity one and exact conductor newvectors. For the torsion case recover U_x from the precise local representation and minimality; recover T_p from Layer 3. A simultaneous eigenform is determined by a₁ and all Hecke recursions. The q-expansion principle at the localized conductor level gives an eigenspace of dimension one; finish by Nakayama. (CG18, Final paragraph of §3.8, p. 340; cg18 line 1755.)

**Checks.**

- If the generic fibre is zero, use the dimension-one Katz eigenspace; a generic-fibre multiplicity argument cannot prove this case.
- For T = k[ε]/ε², its dual has a one-dimensional maximal-ideal eigenspace even though T has k-length 2. The normalized first q-coefficient tests the eigenspace, rather than total k-dimension.
- At an inertia-invariant line of dimension 1 the bad operator is its Frobenius scalar u; at invariant dimension 0 the corresponding minimal newvector operator is 0. The same conductor exponent need not choose this split.

*Needs:* §4.2; §3.5; AlgebraicModularFormsAndSerreWeights §§2.1, 2.5, 2.12 (integral q-expansions and coherent Hecke); GL2AutomorphicRepresentationsAndTransfer §§R16.2.7, R16.2.11, R16.3.9 (newvectors and CDT types); AutomorphicGaloisRepresentations §§3.7, 4.1–4.6, 6.12 (local compatibility); §1.3. gap:minimal-torsion-bad-hecke. Tau Ceti `HeckeRing.GL2.Newform`, `HeckeRing.GL2.IsEigenformAwayFromLevel` and `HeckeRing.GL2.Newform.eq_of_forall_prime_eigenvalue_eq` (classical forms and uniqueness).

### 4.4 Minimal weight-one modularity lifting

Assume the no-vexing and ramified-reducible invariant-line standing hypotheses. Let ρ:G_Q→GL₂(O′), with O′ the integers of a finite extension of ℚₚ and finite over O, be an odd continuous lift of an absolutely irreducible ρ̄ unramified at p, with fixed Teichmüller determinant, unramified at p and genuinely minimal at every other prime in the deformation condition of R_min. Then the no-vexing case of `minimal_weight_one_modularity` realizes ρ by a normalized weight-one newform f of some nonzero level L prime to p: for an embedding Frac(O′)→ℂ and every prime ℓ coprime to L, ρ is unramified at ℓ, the coefficient a_ℓ(f) is its arithmetic Frobenius trace and the nebentypus value is its determinant. In particular ρ has finite image. A lift with only dimρ^(I_x)=dimρ̄^(I_x)=1 is not accepted as minimal if its inertial character acquires new p-power ramification.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant. For the untyped Galois and R = T assertions the vexing set is empty. Auxiliary fine-level copies are compared with the conductor-level module as in Layer 0–Layer 1.

A proof route uses these inputs. The minimal lifting datum defines an O′-point of R_min=T_m. Interpret the corresponding generic-fibre Hecke system by the geometric/classical weight-one comparison. Apply the imported Deligne–Serre Artin representation and trace uniqueness. The same two Lean headlines include vexing primes using Layer 6; the untyped argument here assumes none. (CG18, Corollary 1.5, p. 304; §3.9.2, p. 354; cg18 line 303.)

**Checks.**

- Reject a lift with unchanged invariant dimension but new p-power inertial determinant; genuine minimality is necessary.
- At v ≡ 1 mod p take residual inertia χ̄ ⊕ 1 with nontrivial prime-to-p χ̄, and lift it to Teich(χ̄)ψ ⊕ 1 with ψ of order p. Both inertia-invariant spaces are lines, but the lifted determinant is Teich(χ̄)ψ rather than Teich(χ̄); the fixed determinant excludes this lift.
- For good Frobenius at p with matrix diag(2,3), the matching q-coefficient is 5 and the nebentypus is 6; p is prime to L, so the conclusion includes this prime. Replacing Frobenius by its inverse would give trace 5/6 and determinant 1/6.
- A finite-order character twist of a finite image of size a by a character of order b gives an image of size at most ab; undoing it preserves finiteness.

*Needs:* §4.2; AlgebraicModularFormsAndSerreWeights §6.4 and AutomorphicGaloisRepresentations §2.10 (weight-one Artin representations); GL2AutomorphicRepresentationsAndTransfer §§R16.6.5–R16.6.6 (conductor and weight-one comparisons); LocalGaloisDeformationRings §§2.1–2.5, 2.19 (minimal away-p conditions). gap:rational-minimal-conditions. Tau Ceti `HeckeRing.GL2.Newform`, `HeckeRing.GL2.IsEigenformAwayFromLevel` and `HeckeRing.GL2.Newform.eq_of_forall_prime_eigenvalue_eq` (classical forms and uniqueness).

### 4.5 Finite image over complete local coefficient rings

Under the no-vexing and ramified-reducible invariant-line hypotheses, for p≥3 and odd absolutely irreducible ρ̄ unramified at p, the no-vexing case of `minimal_lift_finite_image` says that every adically continuous lift satisfying `IsMinimalLift` to a complete Noetherian local O-algebra A with the specified common residue k has finite image. The argument must control the universal ring, including its π-torsion and nilpotents; finiteness of its characteristic-zero point images alone is insufficient.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant. For the untyped Galois and R = T assertions the vexing set is empty. Auxiliary fine-level copies are compared with the conductor-level module as in Layer 0–Layer 1.

A proof route uses these inputs. R_min is finite over O by R = T. There are finitely many characteristic-zero systems and their representations have finite image. These are the hypotheses of ModularityAndLanglandsExtensions §1.5 (CG18 Lemma 4.14) for the quotient R_min of the universal ring of ρ̄ on G_(ℚ,S(ρ̄)); in the quotient form of its supplier contract it gives that R_min[1/p] is reduced, with the class-field input of ClassFieldTheory Layers 11–12. Embed R_min modulo its finite π-torsion ideal in the product of its finitely many generic fields. The universal image there is finite; the kernel of the induced matrix map is a finite set because the torsion ideal is finite. Every A-valued minimal lift is a specialization of this finite universal image. (CG18, Corollary 1.6, p. 304; Lemma 4.14 and proof, pp. 366–368; cg18 line 2823.)

**Checks.**

- A finite set of generic-field images is not enough: the universal π-torsion matrix kernel must also be finite.
- If a finite O-algebra has torsion ideal of size s, at most s⁴ matrices can lie over a fixed two-by-two matrix in its torsion-free quotient; this bounds the universal-image kernel by a finite set.
- The ring O[ε]/ε² has finite-image scalar field specializations but admits the infinite subgroup {I+aεE₁₂ : a∈O}. Infinitesimal rigidity is therefore essential before deducing universal finite image.

*Needs:* §4.2; §4.4; GlobalGaloisDeformations §§3.3–3.7 (condition quotients and presentations); ModularityAndLanglandsExtensions §1.5 (CG18 Lemma 4.14, applied to the quotient R_min); ClassFieldTheory Layers 11–12 (ray-class reciprocity and finiteness).

### Examples

When q = 1, A∞ = O and the group algebra still has one augmentation variable. A purely π-torsion H may be nonzero and free over R_min even though H[1/p] = 0. A characteristic-zero modularity argument therefore cannot supply the torsion rank-one statement.

### Dependencies

Tau Ceti `HeckeRing.GL2.Newform`, `HeckeRing.GL2.IsEigenformAwayFromLevel` and `HeckeRing.GL2.Newform.eq_of_forall_prime_eigenvalue_eq` (classical forms and uniqueness); GlobalGaloisDeformations §§3.3–3.7 (condition quotients and presentations); GlobalGaloisDeformations §§5.1–5.8 (Taylor–Wiles selection); GlobalGaloisDeformations §§6.2–6.8 (trace rings and auxiliary specialization); Tau Ceti `TauCeti.MonoidAlgebra.augmentation`; DeformationAndDerivedPatchingAlgebra §5.5 (balanced patching); AlgebraicModularFormsAndSerreWeights §§2.1, 2.5, 2.12 (integral q-expansions and coherent Hecke); GL2AutomorphicRepresentationsAndTransfer §§R16.2.7, R16.2.11, R16.3.9 (newvectors and CDT types); AutomorphicGaloisRepresentations §§3.7, 4.1–4.6, 6.12 (local compatibility); AlgebraicModularFormsAndSerreWeights §6.4 and AutomorphicGaloisRepresentations §2.10 (weight-one Artin representations); GL2AutomorphicRepresentationsAndTransfer §§R16.6.5–R16.6.6 (conductor and weight-one comparisons); LocalGaloisDeformationRings §§2.1–2.5, 2.19 (minimal away-p conditions); ModularityAndLanglandsExtensions §1.5 (CG18 Lemma 4.14, applied to the quotient R_min); ClassFieldTheory Layers 11–12 (ray-class reciprocity and finiteness). Earlier internal targets are specified individually in the Needs lines.

## Layer 5: Vexing-prime coefficient bundles

### 5.1 Vexing-prime levels and coefficient datum

For ρ̄ as in Layer 0 let T be the primes x≠p with ρ̄|D_x absolutely irreducible, ρ̄|I_x reducible and x≡−1 mod p. Put c_x=a_x(ρ̄), even for x∈T. At x∈T, in the supplier’s reciprocity convention, write its fixed lifted inertial character as θ=θ₀(λ∘Norm) for the unramified quadratic E/ℚ_x, with θ₀ conductor-minimal under norm twists, a(θ₀/θ₀^σ)=a(θ₀)=m_x≥1, and λ a finite-order character of ℚ_x×. Put n_x=max(m_x,a(λ)), U_x=GL₂(Z_x), and V_x=ker(GL₂(Z_x)→GL₂(Z/x^n_x Z)); the type action factors through this specified quotient. Here n_x = c_x/2: the conductor of the minimal lift at x is 2·max(a(θ₀),a(λ)), so the conductor level is retained and the norm twist changes the coefficient representation. At each nonvexing ramified x use the upper-triangular conductor-level group with lower-right entry of p-power order for U_x=V_x; retain the source’s specializations at the other primes. Together with the fixed fine-level auxiliary prime form V◁U and G=U/V. The coefficient datum comes from gap:vexing-norm-twist-selector: inflate Θ(θ₀) to GL₂(Z/x^n_x Z) and tensor by λ∘det. Choose its stable integral section lattice W_(σ_x*) and put W_(σ_x)=W_(σ_x*)^∨. Then W_σ=⊗_(x∈T)W_(σ_x) is finite free over O with its G-action and contragredient W_(σ*). When a(θ/θ^σ)=a(θ), take λ=1 and θ₀=θ to recover the existing CDT branch.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

A proof route uses these inputs. Compute the vexing set from the local representation, not the norm congruence alone. Use GL2AutomorphicRepresentationsAndTransfer §§R16.2.11, R16.3.9 in their conductor-equality branch and gap:vexing-norm-twist-selector for its norm twists, keeping the normalization so minimal forms lie in the W_σ* isotypic part of sections upstairs. Twisting both the compact type and the ambient representation by λ∘det identifies their Hom spaces; the level n_x kills both actions. Assemble U,V and the same Q,Δ modifications at all levels; retain the nonvexing p-power diamond conditions at every ramified prime. (CG18, §3.9, pp. 341–343; §3.9.2, pp. 350, 354; cg18 line 1789.)

The construction has the following API.

- Return V◁U, G and the finite free G-representations W_σ and W_σ*.
- In characteristic zero Hom_G(W_σ*,sections upstairs) selects exactly the minimal local automorphic lifts, by GL2AutomorphicRepresentationsAndTransfer §§R16.2.11, R16.3.9 with gap:vexing-norm-twist-selector, with multiplicity one for the fixed minimal inertia type.
- For T=∅ the coefficient type and quotient G are trivial and recover the no-vexing datum.
- An isomorphism of the chosen integral G-lattices induces compatible coefficient-bundle isomorphisms. A mere characteristic-zero isomorphism does not identify two integral lattices.

**Checks.**

- An x≡−1 mod p with ρ̄|D_x reducible is not vexing.
- T=∅ gives the rank-one trivial lattice, not a missing coefficient space.
- At x = 5, p = 3 take θ₀ of order 8 on 𝔽₂₅× and λ of order 5 and conductor 2. For θ=θ₀(λ∘Norm), a(θ)=2, a(θ/θ^σ)=1 and a(Ind θ)=4. Orders 8 and 5 survive reduction in characteristic 3; local induction remains irreducible with reducible inertia and 5≡−1 mod 3. Here m_x=1, n_x=2. The inflation of Θ(θ₀) twisted by λ∘det on GL₂(Z/25) has Hom dimension 1 into Π₀⊗(λ∘det), since untwisting gives the original depth-zero selector. The restriction of the depth-zero type Θ(θ₀) to the nonsplit torus does not contain θ₀: its central and noncentral character-pairing contributions are 16 and −16, giving (16−20+4)/24 = 0. An untwisted depth-zero selector also has zero Hom into Π₀⊗(λ∘det): it is trivial on the first congruence subgroup, while λ∘det is nontrivial there. The determinant twist is essential (GL2AutomorphicRepresentationsAndTransfer §R16.3.9).
- For λ=1 and a(θ/θ^σ)=a(θ)=m_x, n_x=m_x and the original conductor-equality selector has multiplicity 1.
- A p-power ramified twist of the same residual supercuspidal representation is excluded unless its inertial type equals the fixed minimal lift.

*Needs:* §0.1; GL2AutomorphicRepresentationsAndTransfer §R16.2.11; GL2AutomorphicRepresentationsAndTransfer §§R16.2.7, R16.2.11, R16.3.9 (newvectors and CDT types); gap:vexing-norm-twist-selector; LocalGaloisDeformationRings §§2.1–2.5, 2.19 (minimal away-p conditions).

### 5.2 Vexing-prime coefficient bundles

For f:X_V→X_U and its G-action define L_σ=(f_*(O_(X_V)⊗_O W_σ))^G and L_σ^sub=(f_*(O_(X_V)(−C_V)⊗_O W_σ))^G, with invariants as sheaves. Define L_(σ,Q,Δ) and L_(σ,Q,Δ)^sub by the same pushforward formula on each corresponding cover. On the interior these are the usual descended vector bundles. No identity with the ordinary pullback of a compactified base bundle is built into the definition.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

A proof route uses these inputs. Use the finite morphism and its actual G-action to form the equivariant pushforward. Take invariants sheafwise and define the natural inclusion of the subcuspidal version. Repeat at auxiliary levels; compare on the open curves first, then extend using the cusp calculation of the next target. (CG18, §3.9.1, pp. 343–344; cg18 line 1925.)

The construction has the following API.

- For every open W⊂X_U, Γ(W,L_σ)=(Γ(f⁻¹W,O)⊗W_σ)^G, and similarly with the cusp ideal.
- On Y_U the bundle agrees with G-torsor descent of O_(Y_V)⊗W_σ.
- The cusp-ideal inclusion induces L_σ^sub↪L_σ and is an isomorphism away from C_U.
- A G-equivariant O-linear map W→W′ induces full and subcuspidal bundle maps, compatible with identity, composition and the cusp inclusion. After the local-freeness theorem these commute with arbitrary O-base change.

**Checks.**

- For G=1 and rank-one W, L=O_X and L^sub=O_X(−C).
- For inertia μ_e acting by q↦ζq, a χ_i eigenspace of functions is q^iO[[q^e]], with the inverse character paired in W.
- When q_base=q_cover^e, the compactified character extension need not equal naive pullback; do not infer such an isomorphism from agreement on the open curve.

*Needs:* §5.1; AlgebraicModularFormsAndSerreWeights §R15.1 (geometric forms, small-level descent and logarithmic Kodaira–Spencer).

### 5.3 Local freeness and coefficient base change

For every G-representation W finite free as an O-module in this construction, L_W and L_W^sub are finite locally free O_X-modules. For every O-algebra B, including nonflat B, their formation commutes with base change to B, and H⁰(X_B,L_W⊗ωⁿ)=(H⁰(X_(V,B),ωⁿ)⊗_O W)^G. The subcuspidal version uses the upstairs cusp divisor. No general exactness of G-invariants is asserted when p divides |G|.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

A proof route uses these inputs. On the open curve use finite étale torsor descent, which works without averaging by |G|. At a cusp use its inertia subgroup I, whose order e is prime to p, and completed local rings O[[q^e]]⊂O[[q]]. After a finite étale coefficient extension split W into I-characters; each invariant summand is q^iO[[q^e]]⊗W_(χ_i⁻¹). These free summands commute with arbitrary coefficient extension. Descend local freeness and base-change isomorphisms and identify global sections by the sheaf definition. (CG18, Lemma 3.27(1)–(2), pp. 345–347; cg18 line 2007.)

**Checks.**

- Base change to O/π must commute with the invariant-pushforward bundle even when p divides the global type-group order; use torsor and tame-cusp descent rather than averaging over that group.
- For tame e = 5 and character exponent i = 2, the invariant line is q²O[[q⁵]], free of rank 1, and reduction gives q²k[[q⁵]] of the same rank.
- For a free Cₚ-torsor the descent of its regular upstairs trivial line is a line downstairs, even when p divides |Cₚ|. On the unrelated trivial Cₚ-module k the group norm is multiplication by p = 0, so averaging would give the wrong descent.

*Needs:* §5.2; AlgebraicModularFormsAndSerreWeights §R15.1 (geometric forms, small-level descent and logarithmic Kodaira–Spencer).

### 5.4 Cusp duality for type bundles

The natural map L_(σ*)→L_σ^∨ is injective and is an isomorphism on the interior, but can fail at a cusp. It restricts to L_(σ*)^sub≅L_σ^∨(−C_U); equivalently (L_σ^sub)^∨(−C_U)≅L_(σ*). These identities hold after arbitrary O-base change and at every independently defined auxiliary level.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

A proof route uses these inputs. Use evaluation W⊗W*→O to define the natural comparison and torsor descent on the open curve. In a cusp character summand dualize q^iO[[q^e]] to q⁻ⁱO[[q^e]]. Multiplication by the downstairs cusp parameter q^e changes the exponent to e−i. Match these exponents with the subcuspidal invariants; reverse σ and σ* for the second identity. (CG18, Lemma 3.28 and proof, pp. 347–349; cg18 line 2116.)

**Checks.**

- At a ramified cusp the full dual comparison may be proper; the stated subcuspidal formula must still be an isomorphism.
- For e = 5 and i = 2, the dual full line is q⁻²O[[q⁵]] and its downstairs cusp twist is q³O[[q⁵]], exactly the contragredient subcuspidal line.
- For i = 0 the full line is O[[q⁵]] and the subcuspidal line is q⁵O[[q⁵]]. The downstairs cusp is q⁵, not the upstairs parameter q.

*Needs:* §5.3; §5.2.

### 5.5 High-weight vanishing with types

For n>1, H¹(X_U,ωⁿ⊗L_σ)=0 and H⁰(X_U,ωⁿ⊗L_σ)⊗O/π^m≅H⁰(X_(U,O/π^m),ωⁿ⊗L_σ). For L_σ^sub the same assertions hold for n>2. The n=1 boundary is not covered. These statements hold at the auxiliary levels as well.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

A proof route uses these inputs. Apply coherent duality and the cusp-corrected dual-bundle formulas. The dual spaces are cusp forms upstairs in nonpositive weight, which vanish in the stated ranges. Apply the coefficient exact sequence to deduce H⁰ base change. (CG18, Corollary 3.29 and proof, pp. 349–350; cg18 line 2163.)

**Checks.**

- n=1 is outside the vanishing statement, and n=2 is outside the subcuspidal statement; their torsion must remain admissible.
- At n = 2 the dual full-bundle obstruction has cusp weight 0 and vanishes; the dual subcuspidal obstruction has full weight 0 and may contain constants. Thus the subcuspidal threshold is strictly n > 2.
- For the zero coefficient lattice both groups are zero in every weight; that degenerate case cannot justify asserting weight-one vanishing for a nonzero lattice.
- With trivial boundary characters and x = 2 over characteristic zero, the normalized boundary traces in weights 0, 1, 2 are 3/2, 2, 3. This checks integer weight powers and does not extend the high-weight vanishing range to weight 0 or 1.

*Needs:* §5.4; §5.3; AlgebraicModularFormsAndSerreWeights §3.12, Twisted duality and the supersingular boundary.

### 5.6 Hecke correspondences with type coefficients

For the away-type correspondences at U,Q,Δ, construct T_x,U_y and diamond actions on ωⁿ⊗L_σ and on its subcuspidal version by equivariant pullback/isogeny/trace on X_V. Use the natural equivariant bundle identifications on the open correspondence and verify their extension at every cusp through the invariant pushforward model. With normalized trace, T_x^t=⟨x⁻¹⟩T_x and ⟨a⟩^t=⟨a⁻¹⟩ for a prime to the level. The factor 1/x occurs in both T_x and its transpose.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

A proof route uses these inputs. The correspondences commute with G, so act on invariant pushforward sections. Verify the maps at cusp formal neighborhoods and keep the separately defined coefficient bundles on both sides. Compute dual isogenies and trace to get the transpose normalization; descend finite-level actions. (CG18, §3.9.1, pp. 344–345; §3.9.2, pp. 351–353; cg18 line 1957.)

The construction has the following API.

- The normalized double-coset operators act on the invariant-pushforward sections and preserve L^sub.
- At each cusp and each component, the upstairs q-expansion formulas descend G-equivariantly.
- The trace-pairing adjoint of T_x is ⟨x⁻¹⟩T_x, including the same 1/x normalization.
- Equivariant maps of the integral type lattice intertwine the descended Hecke actions and their transpose pairings at every level and coefficient quotient.

**Checks.**

- For W=O with trivial G, recover the normalized operators of Layer 0.
- For diamond eigenvalue d = 2 over 𝔽₇, transposition sends it to d⁻¹ = 4, and a second transpose returns 2; here d² = 4 ≠ 1.
- An equality of q-expansions on one component is insufficient until the type group action transports it to all components.

*Needs:* §5.2; §5.3; §5.4; AlgebraicModularFormsAndSerreWeights §§2.1, 2.5, 2.12 (integral q-expansions and coherent Hecke).

### Examples

At tame cusp indices 5 and 7 put t = q⁵ = u⁷ and q = w⁷, u = w⁵ in the normalized common cover. An old character line pulls back to w⁷O[[u]], whereas the independently normalized line is w²O[[u]]; their ratio is u. Agreement off the cusp does not identify their compactified extensions (CG18, §3.9.1, pp. 344–345, comparison of invariant pushforwards; cg18 line 1957).

### Dependencies

GL2AutomorphicRepresentationsAndTransfer §R16.2.11; GL2AutomorphicRepresentationsAndTransfer §§R16.2.7, R16.2.11, R16.3.9 (newvectors and CDT types); gap:vexing-norm-twist-selector; LocalGaloisDeformationRings §§2.1–2.5, 2.19 (minimal away-p conditions); AlgebraicModularFormsAndSerreWeights §R15.1 (geometric forms, small-level descent and logarithmic Kodaira–Spencer); AlgebraicModularFormsAndSerreWeights §3.12, Twisted duality and the supersingular boundary; AlgebraicModularFormsAndSerreWeights §§2.1, 2.5, 2.12 (integral q-expansions and coherent Hecke). Earlier internal targets are specified individually in the Needs lines.

## Layer 6: Weight-one R = T with vexing primes

### 6.1 Boundary and degeneracy with types

At an absolutely irreducible residual ideal the cusp/full comparison and the selected-root auxiliary-level isomorphism hold with the weight-one coefficients ω⊗L_σ. At a Taylor–Wiles prime x the weight-one oldform identities of §1.1 hold on these coefficients: an operator W_x with W_x² = x⟨x⟩ and π₁*trπ₁W_x = xU_x + W_x, and U_x acting on the oldform pair by [[T_x,x⟨x⟩],[−x⁻¹,0]], whose characteristic polynomial is X²−T_xX+⟨x⟩. Nothing is asserted in weight n ≠ 1, where the Frobenius polynomial is X²−T_xX+xⁿ⁻¹⟨x⟩. The cusp-supported cokernels are Eisenstein because every eigensystem upstairs is a two-character sum, and tensoring with W_σ then taking G-invariants preserves this property.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

A proof route uses these inputs. Apply the correspondence identities on X_V before taking G-invariants. Compute cusp eigencharacters type by type; the type group does not act transitively on all cusps. Use finite π^m-torsion lengths and distinct-root localization exactly as in Layer 1. (CG18, Theorem 3.30, steps (1)–(2), pp. 350–351; cg18 line 2191.)

**Checks.**

- Use two different cusp types upstairs; neither the type group nor all diamonds may be assumed transitive on their union.
- At x = 1 in 𝔽₅ with roots 1,2, tensoring the oldform pairing with a rank-two type multiplies each one-dimensional eigenspace by that type: the scalar block A=[[2,3],[3,4]] has determinant 4, while the rank-four tensor matrix A⊗I₂=[[2,0,3,0],[0,2,0,3],[3,0,4,0],[0,3,0,4]] has determinant 4² = 1 in 𝔽₅. Both are units, and selecting one root retains one rank-two type copy.
- For two cusp orbits with character pairs (1,χ) and (χ,1), their n = 1 traces at χ(x) = −1 are both 0. Reducibility, not transitivity or an ordered-pair equality, eliminates them.
- For x = 2, T_x = 0 and ⟨x⟩ = 1 over ℚ the matrix [[0,2],[−1/2,0]] squares to −I = −⟨x⟩I, as the weight-one polynomial X²+1 requires. In weight two the polynomial X²+2 requires U_x² = −2I, so the weight-one matrix is not the weight-two oldform action; this is why the identities are stated in weight one only.

*Needs:* §5.6; §1.1; §1.2; AlgebraicModularFormsAndSerreWeights §2.16 (Eisenstein boundary eigensystems).

### 6.2 Balancedness with contragredient types

Define H_i(X,ω⊗L_(σ*)) using the dual coherent convention. Its coefficient dual is ω⊗L_σ^sub, by the cusp formula. On the non-Eisenstein m-part, coherent descent and boundary vanishing give balanced H₀ over O[Δ]. The needed generic rank equality compares the σ and σ* spaces at residual ideals m and m*, where m* sends T_x to trρ̄(Frob_x)/detρ̄(Frob_x) and diamonds to their inverses. It follows from contragredient automorphic representations, not a presumed self-duality of W_σ.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

A proof route uses these inputs. Use the cusp duality to identify the actual coefficient sheaf occurring in homological descent. Track the adjoints T_x^t=⟨x⁻¹⟩T_x and inverse diamonds in the duality map. Over K apply automorphic contragredients to compare dimensions at m and m*. Use the same low-degree Tor bound as Layer 1 and the torsion-free degree-one group. (CG18, Theorem 3.30, step (3), pp. 351–353; cg18 line 2223.)

**Checks.**

- For a non-self-dual type, check the inverse-diamond residual ideal and use contragredients to compare dimensions.
- Over 𝔽₇ a diamond eigenvalue 2 becomes 4 under transpose. If the original trace is 5 and determinant 6, its dual trace is 5/6 = 2, not 5; the residual ideals must be transported.
- For equal generic ranks r = 2 and a one-dimensional Tor correction, the defect is 2−1 = 1. Pairing with the wrong type can change r and invalidate this estimate.

*Needs:* §6.1; §5.4; §1.4; DeformationAndDerivedPatchingAlgebra §5.1 (balanced presentations); AlgebraicModularFormsAndSerreWeights §3.12, Twisted duality and the supersingular boundary; GL2AutomorphicRepresentationsAndTransfer §R16.4 (global multiplicity and contragredients).

### 6.3 Galois representations with vexing coefficients

The weight-one local Hecke image acting on the Pontryagin dual of H⁰(X_U,(ω⊗L_σ)_(K/O))_m admits the same determinant-normalized ρ_Q as Layer 3, minimal at every vexing prime in the fixed norm-twisted CDT type of §5.1, using gap:vexing-norm-twist-selector. The high-weight Hasse subquotient has W_σ*-isotypic characteristic-zero automorphic lifts. The component argument and the norm-twisted CDT selector ensure the local type before descent; unramifiedness at p follows from the three-case doubling proof.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

A proof route uses these inputs. Embed type-coefficient weight-one torsion in the high-weight G-invariant space using Hasse multiplication and high-weight base change. Prove the q-expansion and doubling identities on every connected component upstairs: the product of the vexing GL₂ groups transports components and commutes with the p-operators. Use the exact minimal-type selector from GL2AutomorphicRepresentationsAndTransfer §§R16.2.11, R16.3.9 together with gap:vexing-norm-twist-selector, on the actual quotient of §5.1, then descend the high-weight Galois representation and its determinant-normalizing twist. The reference to Layer 3 is to its three-case proof with this coefficient system: re-establish doubling and ordinary projection on the type space using the preceding component argument; it does not apply a no-vexing theorem to a representation with vexing primes. (CG18, Theorem 3.30, step (4), pp. 353–354; cg18 line 2286.)

**Checks.**

- An equality of q-expansions on one connected component cannot be used before transporting it through the commuting type-group action.
- On two components interchanged by a type-group element, an equivariant p-operator that is zero on one component is zero on the other. Without equivariance the matrix diag(0,1) supplies a counterexample.
- For the x = 5, p = 3 datum of §5.1 the selected type is the inflated depth-zero lattice twisted by the order-five determinant character on GL₂(Z/25). Its minimal-inertia Hom dimension is 1 after untwisting; the untwisted depth-zero selector gives 0 and cannot supply the high-weight component used here.
- For the trivial type of rank 1, all three Frobenius matrices diag(1,2), [[1,1],[0,1]], I recover the untyped cases with traces 3,2,2 over 𝔽₅.

*Needs:* §5.1; §5.6; §5.5; §3.4; GL2AutomorphicRepresentationsAndTransfer §R16.2.11; GL2AutomorphicRepresentationsAndTransfer §§R16.2.7, R16.2.11, R16.3.9 (newvectors and CDT types); gap:vexing-norm-twist-selector; AutomorphicGaloisRepresentations §§6.8–6.9, 6.12 (integral determinant and reconstruction); AutomorphicGaloisRepresentations §§3.7, 4.1–4.6, 6.12 (local compatibility). gap:integral-ordinary-hasse; gap:rational-minimal-conditions.

### 6.4 Minimal weight-one R = T with vexing types

Let W_σ be normalized so that minimal lifts occur in the W_σ*-isotypic space of sections upstairs. Then R_min(ρ̄)≅T_m on H₀(X_U,ω⊗L_(σ*))_m, a nonzero finite free module over this ring. By duality with the inverse-diamond transpose, equivalently R_min(ρ̄)≅T_m on H¹(X_U,ω⊗L_σ)_m. In the homological formulation one must swap σ and σ* relative to the source’s Theorem 3.30. If the coherent module has nonzero generic fibre, its free rank is one; no assertion of torsion rank one with nontrivial type is made. The rank-one conclusion is at the intended conductor/type level after the harmless rigidifying prime has been removed; a fine auxiliary realization can have two old copies.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

A proof route uses these inputs. Repeat the arithmetic Taylor–Wiles construction on the independently defined type bundles using Layer 6 balancedness and Galois compatibility. Apply the existing balanced patching theorem; faithfulness of the Hecke image proves R = T. Transport across the explicitly twisted duality, with m* when needed, to the coherent H¹ formulation. For rank one use the characteristic-zero CDT selector and global multiplicity one; retain the nonzero-generic-fibre hypothesis. (CG18, Theorem 3.30, pp. 350–354; Theorem 1.4, p. 303; cg18 line 2191.)

**Checks.**

- When σ is not isomorphic to σ*, the homological carrier must use σ* at ρ̄, with the coherent H¹ output using the stated adjoint localization.
- For a character type with diamond value 2 over 𝔽₇, its contragredient has value 4, so using σ in place of σ* changes the actual homological eigenspace.
- If a finite free T-module has rank r and nonzero generic fibre, a one-dimensional exact type/newvector fibre forces r = 1. A purely torsion generic fibre has dimension 0 for every r and yields no such rank conclusion.

*Needs:* §6.2; §6.3; §4.1; DeformationAndDerivedPatchingAlgebra §5.5 (balanced patching); GL2AutomorphicRepresentationsAndTransfer §§R16.6.5–R16.6.6 (conductor and weight-one comparisons); GL2AutomorphicRepresentationsAndTransfer §R16.4 (global multiplicity and contragredients). Tau Ceti `HeckeRing.GL2.Newform`, `HeckeRing.GL2.IsEigenformAwayFromLevel` and `HeckeRing.GL2.Newform.eq_of_forall_prime_eigenvalue_eq` (classical forms and uniqueness).

### 6.5 Minimal lifting and finite image with types

For the same residual ρ̄, including nonempty vexing set, genuinely minimal lifts unramified at p over finite coefficient extensions are weight-one Artin representations. Every genuinely minimal lift to a complete Noetherian local O-algebra with residue k has finite image. All local minimality conditions and the fixed determinant are retained; dropping them is outside these statements. More generally first twist ρ̄ by a finite-order character unramified at p so that every ramified reducible local restriction has a nonzero inertia invariant; use its Teichmüller lift on ρ. Require genuine minimality for this twisted problem, normalize its determinant by the unique square root of the determinant quotient, and undo both finite-order twists after applying the theorem. The quotient character is finite by the global unramified-at-p class-field argument. This gives the minimal-up-to-finite-order-twist versions of Corollaries 1.5 and 1.6; the curve, conductor and residual ideal belong to the normalized twist.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. The untwisted residual representation is continuous, odd, absolutely irreducible and unramified at p. The nonzero ramified-reducible inertia invariants and Teichmüller determinant conditions are imposed on the normalized twist.

Precisely, `minimal_lift_finite_image` takes an odd absolutely irreducible adically continuous residual ρ̄ unramified at p, an adically continuous lift ρ to A, and a continuous finite-image character η:G_ℚ→Aˣ unramified at p. With η̄ its reduction, assume `IsWeightOneResidual` for η̄ρ̄ and `IsMinimalLift` for ηρ relative to η̄ρ̄. Then ρ has finite image. There is no invariant-line hypothesis on ρ̄ before twisting. For A = O, `minimal_weight_one_modularity` takes the same twist data and produces a normalized newform of some nonzero level L prime to p and an embedding Frac(O)→ℂ matching the original ρ's trace and determinant at every prime ℓ coprime to L, with ρ unramified there. The Frobenius clause quantifies over every prime Q of the algebraic integers lying over (ℓ) and every g satisfying Mathlib's arithmetic Frobenius predicate at Q. The normalized results are the case η = 1; nonempty vexing sets are included. A proof route uses these inputs. Replace the no-vexing R = T input in Layer 4 by the type-coefficient theorem. Apply the same generic-fibre Artin comparison, and obtain reducedness of the typed R_min[1/p] from ModularityAndLanglandsExtensions §1.5 (CG18 Lemma 4.14) in the quotient form of §4.5. The finite π-torsion kernel in the universal ring controls specializations to arbitrary complete local A. Use ray-class reciprocity to extend the prescribed finite prime-to-p local unit characters away from p to a finite-order global character unramified at p; enlarge coefficients if necessary. The determinant quotient has values in 1+m, is unramified at p and outside finitely many primes, so factors through a finite ray-class p-quotient. Twisting preserves finite image and the normalized minimal local problem; use the normalized conductor when invoking R = T. (CG18, Corollaries 1.5–1.6, p. 304; §3.9.2, p. 354; Lemma 4.14, pp. 366–368; cg18 line 2823.)

**Checks.**

- For p = 3 and k = 𝔽₃, ψ of order 3 and conductor 7 with ψ̄ = 1, take ρ = ρ₀⊗ψ² and η = ψ. Then ηρ = ρ₀ but (det ρ)² = ψ² ≠ 1; the normalized hypothesis on ρ alone would miss this lift.
- First apply the theorem to the normalized finite-order twist and its own conductor; undoing finite-order twists must preserve the finite-image conclusion.
- If a representation has image size a and the two finite twisting characters have orders b,c, undoing them gives image size at most abc; the finite-image property survives both operations.
- A ramified finite character changes the Artin conductor; even a one-dimensional unramified character of conductor 0 becomes one of positive conductor after a ramified twist. The minimal ring must belong to the normalized twist.

*Needs:* §6.4; §4.4; §4.5; AlgebraicModularFormsAndSerreWeights §6.4 and AutomorphicGaloisRepresentations §2.10 (weight-one Artin representations); ModularityAndLanglandsExtensions §1.5 (CG18 Lemma 4.14, applied to the quotient R_min); ClassFieldTheory Layers 11–12 (ray-class reciprocity and finiteness).

### Examples

For a diamond value 2 over 𝔽₇, the dual value is 4. A non-self-dual type must be paired with its contragredient, and the trace 5, determinant 6 pair dualizes to trace 2. At the trivial type these constructions give the no-vexing conductor module, including torsion.

### Dependencies

AlgebraicModularFormsAndSerreWeights §2.16 (Eisenstein boundary eigensystems); Tau Ceti `HeckeRing.GL2.Newform`, `HeckeRing.GL2.IsEigenformAwayFromLevel` and `HeckeRing.GL2.Newform.eq_of_forall_prime_eigenvalue_eq` (classical forms and uniqueness); DeformationAndDerivedPatchingAlgebra §5.1 (balanced presentations); AlgebraicModularFormsAndSerreWeights §3.12, Twisted duality and the supersingular boundary; GL2AutomorphicRepresentationsAndTransfer §R16.4 (global multiplicity and contragredients); GL2AutomorphicRepresentationsAndTransfer §R16.2.11; GL2AutomorphicRepresentationsAndTransfer §§R16.2.7, R16.2.11, R16.3.9 (newvectors and CDT types); gap:vexing-norm-twist-selector; AutomorphicGaloisRepresentations §§6.8–6.9, 6.12 (integral determinant and reconstruction); AutomorphicGaloisRepresentations §§3.7, 4.1–4.6, 6.12 (local compatibility); DeformationAndDerivedPatchingAlgebra §5.5 (balanced patching); GL2AutomorphicRepresentationsAndTransfer §§R16.6.5–R16.6.6 (conductor and weight-one comparisons); AlgebraicModularFormsAndSerreWeights §6.4 and AutomorphicGaloisRepresentations §2.10 (weight-one Artin representations); ModularityAndLanglandsExtensions §1.5 (CG18 Lemma 4.14, applied to the quotient R_min); ClassFieldTheory Layers 11–12 (ray-class reciprocity and finiteness). Earlier internal targets are specified individually in the Needs lines.

## Layer 7: Scalar Frobenius and Jacobian multiplicity

### 7.1 Multiplicity character datum

Fix p≥3 and an odd absolutely irreducible modular ρ̄ of Serre weight 2≤w≤p+1 whose prime-to-p conductor N is minimal among all local twists at every x≠p. Put N*=N for w=2 and N*=Np otherwise. Let T_m be the full Hecke algebra of J₁(N*), including U_p. For the scalar unramified-at-p case, let M be the conductor factor supported on harmless primes x≡1 mod p with ρ̄|D_x absolutely irreducible, and Φ the p-primary quotient of ∏_(x|M)(Z/xZ)×. After adjoining its character values, for φ∈Φ^∨ set χ_φ=ε·Teich(detρ̄·barε⁻¹)·φ; the ordinary weight-two spaces S_φ fix only this harmless diamond restriction.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.

A proof route uses these inputs. Use the weight-two realization and full Hecke algebra supplied by the modular-curve/Gross input. Separate harmless determinant characters from the complementary p-primary tame characters ψ. Since p is odd, φ↦φ² and ψ↦ψ² are automorphisms; normalize determinants by the unique ψ^(-1/2) twist. (CG18, Theorem 4.8 and proof, pp. 361–363; cg18 line 2586.)

The construction has the following API.

- Return N*, T_m and the Gross ordinary connected–étale sequence.
- Φ contains precisely the indicated p-primary tame determinant characters at harmless primes.
- Twisting by φ carries S₁ to S_(φ²); T_ℓ scales by φ(ℓ), diamonds by φ(d)², and conductor is preserved under the stated harmless hypothesis.
- The trivial character acts as the identity; twisting successively by φ and ψ equals twisting by φψ on the matched levels, and its inverse is twisting by φ⁻¹. These identities include the squared diamond character.

**Checks.**

- If w=2 then N*=N; if ρ̄ is unramified scalar at p, its weight-two realization uses Np.
- For a cyclic group of order 3, squaring permutes all three characters; the same assertion fails for order 2.
- A reducible nontrivial unramified-character self-extension at x≡1 mod p is not harmless and is not included in Φ.

*Needs:* SerreWeightAndLevelOptimisation §3.10 (ordinary Tate sequence); LocalGaloisDeformationRings §§2.1–2.5, 2.19 (minimal away-p conditions); GL2AutomorphicRepresentationsAndTransfer §§R16.2.7, R16.2.11, R16.3.9 (newvectors and CDT types).

### 7.2 Global scalar eigenvalue ring and type

In the scalar unramified-at-p setting, impose the additional restriction that no nonharmless x≡1 mod p has ρ̄|D_x a nontrivial ramified extension of an unramified character by itself. For each φ let R̃_φ be the global ordinary deformation ring with chosen Frobenius eigenvalue at p, determinant χ_φ, and the conductor-compatible local quotients away from p (in particular the unipotent/Steinberg quotient for ramified Steinberg residual type at x≡−1 mod p). Subject to the exact generic-fibre component comparison by gap:scalar-conductor-comparison (GL2ModularityLifting §§3.7, 4.1–4.2), R̃_φ is finite flat over O, Cohen–Macaulay of type three, and maps isomorphically to the matching T_(φ,m). For the unrestricted family retain every such self-extension prime and use gap:scalar-variable-determinant for its local family, gap:scalar-conductor-comparison for the matching presentation and component comparison, and gap:scalar-variable-global-type for the finite flat Cohen–Macaulay type-three global quotient. All unrestricted consequences in §§7.2–7.5 are conditional on this last integral deliverable as well as the two comparison inputs.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.

A proof route uses these inputs. For the fixed-character restricted problem import O-finiteness from PotentialModularityAndCompatibleSystems §8.8: pass from its eigenvalue-adjoined ring to the conductor-compatible quotient, including the norm −1 unipotent/Steinberg quotient. Import the conductor-specific presentation, numerical relation bound and generic-fibre support from gap:scalar-conductor-comparison. The following local-factor argument applies to this restricted problem; for the variable-determinant family use the separate integral conclusion of gap:scalar-variable-global-type. The completed tensor product of the type-three eigenvalue ring at p with the O-flat local complete intersections away from p is Cohen–Macaulay of type three. Retain O-Tor independence in this tensor-product step. Write B[[z₁,…,z_g]]↠R̃_φ^□ with r displayed relations and j framing parameters. The numerical relation bound and dimension comparison must give dim B+g=j+1+r. O-finiteness then makes these r relations, the j framing parameters and π a system of parameters. Their regularity in the Cohen–Macaulay source proves O-flatness of R̃_φ and preserves its canonical-module type. This asserts a regular sequence, not regularity of the quotient ring. The surjective map to the matching integral Hecke image is a generic-fibre isomorphism, hence injective by O-flatness. (CG18, Proof of Theorem 4.8, pp. 362–365; Lemma 4.11, pp. 364–365; cg18 line 2662.)

**Checks.**

- At a norm −1 ramified Steinberg prime use only the unipotent quotient; the unrestricted nonminimal component cannot enter the Hecke comparison.
- Let A=O·(1,1,1,1)+πO⁴. With x_i=πe_i for i=1,2,3, its O-basis is 1,x₁,x₂,x₃ and x_ix_j=δ_ijπx_i. Thus A/πA=k[x₁,x₂,x₃]/(x₁,x₂,x₃)² has length 4 and socle basis x₁,x₂,x₃, of dimension 3. In contrast B=O[t]/∏_(i=0)³(t−iπ) has O-basis 1,t,t²,t³ and B/πB=k[t]/t⁴, of length 4 and socle basis t³, of dimension 1. Both are local finite flat orders of rank 4 with generic fibre K⁴; generic comparison cannot distinguish their types.
- If the fixed-character ordinary ring has m O-generators, its monic quadratic eigenvalue adjunction has at most 2m. The images of these generators still generate after the norm −1 unipotent/Steinberg quotient. This supplies finiteness without a generic comparison and without a variable-determinant type conclusion.
- At a norm-one ramified self-extension, the inertial pairs (ψ,1) and (1,ψ⁻¹) have distinct determinants ψ and ψ⁻¹ but normalize to the same unordered pair (ψ¹ᐟ²,ψ⁻¹ᐟ²). The variable-determinant comparison cannot be replaced by an injective fixed-determinant twist.

*Needs:* §7.1; LocalGaloisDeformationRings §6.18 (normal Cohen–Macaulay type three); GlobalGaloisDeformations §§3.3–3.7 (condition quotients and presentations); LocalGaloisDeformationRings §§2.1–2.5, 2.19 (minimal away-p conditions); PotentialModularityAndCompatibleSystems §8.8 (fixed-character scalar ordinary finiteness); GL2ModularityLifting §§3.7, 4.1–4.2 (component support and integral comparison); DeformationAndDerivedPatchingAlgebra §§3.1, 3.9 (depth, canonical modules and type). gap:scalar-variable-determinant; gap:scalar-conductor-comparison; gap:scalar-variable-global-type.

### 7.3 Integral character-twisting identity

Under the restricted hypotheses of §7.2, or for the unrestricted family assuming gap:scalar-variable-global-type together with its local-family and component-comparison contracts, with the matching character-restricted Hecke algebras of that target, the full ordinary algebra satisfies T_m≅T_(1,m)⊗_O O[Φ] integrally. The map sends T_ℓ to T_ℓ⊗[ℓ] for good ℓ, the relevant bad U_x according to their conductor-newvector formulas, and ⟨d⟩ to ⟨d⟩⊗[d]². This assertion uses generation of the full integral image; an isomorphism after inverting p between torsion-free lattices alone does not prove it.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.

A proof route uses these inputs. Construct the map by the universal character twist and check every Hecke generator, including bad U and diamonds. Use squaring on Φ to recover 1⊗[d] from the diamond images and units in T₁; these elements generate O[Φ]. Untwist the good generators to recover T_ℓ⊗1; use bad-newvector formulas for the remaining generators. This proves surjectivity. Use the characteristic-zero character decomposition and integral torsion-freeness to prove injectivity. (CG18, Proof of Theorem 4.8, pp. 365–366; cg18 line 2772.)

**Checks.**

- For Φ=C₃ the diamond squares must recover every group basis element integrally; equality after inverting p is insufficient.
- In O[C₃], squares of 1,g,g² are 1,g²,g. Since the diamond scalar is a unit, every basis element is recovered integrally.
- The orders O×O and {(a,b)∈O² : a≡b mod π} have the same K-algebra K² and index |k| between them. Generic equality and torsion-freeness alone do not prove equality of integral Hecke orders.

*Needs:* §7.1; §7.2; gap:scalar-variable-global-type (unrestricted family); AlgebraicModularFormsAndSerreWeights §§2.1, 2.5, 2.12 (integral q-expansions and coherent Hecke); GL2AutomorphicRepresentationsAndTransfer §§R16.2.7, R16.2.11, R16.3.9 (newvectors and CDT types).

### 7.4 Scalar-Frobenius multiplicity two

Under the restricted scalar hypotheses of the type-three target, J₁(N*)[m]≅ρ̄⊕ρ̄ as k[G_Q]-modules. More generally this conclusion follows whenever the matching full localized ordinary Hecke algebra is finite flat Cohen–Macaulay of type three and the Gross sequence/isotypy hypotheses hold. The unrestricted scalar conclusion retains the nonharmless self-extension primes and assumes gap:scalar-variable-global-type, together with the local family of gap:scalar-variable-determinant and the matching component comparison of gap:scalar-conductor-comparison. Generic-fibre identification alone supplies no integral type.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.

A proof route uses these inputs. The group algebra O[Φ] is finite flat Gorenstein; tensoring preserves canonical-module type three. Hence Hom_Zp(T_m,Z_p)/m has residue dimension three. The Gross sequence gives dim_k G⁰[m]=3 and dim_k Gᵉ[m]=1, but m-torsion is only left exact. It yields 3≤dim_k G[m]≤4. Use the Cayley–Hamilton annihilation input of gap:jacobian-residual-isotypy (SerreWeightAndLevelOptimisation §§3.10–3.12), with the good-reduction relation of ModularCurvesPartII §17.2. Apply IntegralHeckeAndGaloisDeterminants §1.6, Cayley–Hamilton recognition of isotypic modules, after reduction to k: at this full non-Eisenstein Hecke ideal, J₁(N*)[m] is a direct sum of copies of the absolutely irreducible ρ̄. Reconstruction of one rank-two representation alone does not establish the needed annihilation. Its dimension is even, hence four and the multiplicity is two. Do not assert that the full Tate module is free of rank two over the non-Gorenstein Hecke algebra. (CG18, Theorem 4.8 and closing calculation, pp. 361–366; cg18 line 2801.)

**Checks.**

- Taking m-torsion yields only the interval 3≤dimension≤4; the evenness of ρ̄-isotypy must force dimension four.
- The Gross bounds give dimensions in {3,4}; a sum of two-dimensional residual constituents has even dimension, so the intersection {3,4}∩2ℤ is {4} and the multiplicity is 4/2 = 2.
- For a type-three local order the canonical module needs three generators; replacing it by a free line would give 1 and incorrectly impose a Gorenstein hypothesis.

*Needs:* §7.3; §7.2; gap:scalar-variable-global-type (unrestricted family); SerreWeightAndLevelOptimisation §3.10 (ordinary Tate sequence); DeformationAndDerivedPatchingAlgebra §§3.1, 3.9 (depth, canonical modules and type); AutomorphicGaloisRepresentations §§6.8–6.9, 6.12 (integral determinant and reconstruction); SerreWeightAndLevelOptimisation §§3.10–3.13 (Gross sequence, known multiplicities and minimal witness). gap:jacobian-residual-isotypy. IntegralHeckeAndGaloisDeterminants §1.6 (isotypic module recognition); ModularCurvesPartII §17.2 (Eichler–Shimura relation).

### 7.5 Diamond-quotient Jacobians

For the same conductor-minimal residual datum, let H be the kernel of the full residual diamond character at m on (ℤ/N*ℤ)ˣ, let X_H(N*) = X₁(N*)/H, and let J_H(N*) be its Jacobian with induced Hecke ideal m_H. Assume p≠3 and ρ̄ is not induced from a character of ℚ(√−3). Under gap:carayol-diamond-quotient, J_H(N*)[m_H] is a sum of r copies of ρ̄, with r equal to the full-level multiplicity: r = 2 in the unramified scalar case and r = 1 otherwise (CG18, Remark 4.12, p. 366; cg18 line 2807). Its scalar branch uses the same matched type-three input and gap:scalar-variable-global-type and the local-family/component-comparison contracts of §7.2.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.

A proof route uses these inputs. Import the Gross/Edixhoven/Buzzard/Wiese alternatives through the Serre-weight supplier with their exact residual and level hypotheses. For J_H use the separate diamond-quotient comparison and retain the exceptional-prime/induction exclusion. Apply the scalar multiplicity argument only when its local-global input is established. (CG18, Theorem 4.8 and Remark 4.9, p. 361; Remark 4.12, p. 366; cg18 line 2807.)

**Checks.**

- For the quotient-Jacobian comparison retain the p=3 and Q(√−3)-induction exclusions; do not infer that comparison solely from the full-level theorem.
- At nonscalar repeated Frobenius [[1,1],[0,1]], the discriminant is 0 but the known nonexceptional multiplicity is one; scalar I has the same polynomial and the type-three branch has multiplicity two.
- For p = 3 or induction from ℚ(√−3), the diamond-quotient comparison has a failed hypothesis; the full-level multiplicities 1 or 2 alone give no quotient multiplicity.

*Needs:* §7.1; §7.4; gap:scalar-variable-global-type (unrestricted scalar branch); SerreWeightAndLevelOptimisation §§3.10–3.13 (Gross sequence, known multiplicities and minimal witness). gap:carayol-diamond-quotient.

### Examples

The scalar local parameter quotient k[x,y,z]/(x,y,z)² has length 4 and type 3. The Gross sequence bounds residual dimension between 3 and 4; residual two-dimensional isotypy forces 4. For Φ = C₃, squared diamonds enumerate 1,g²,g and recover the full integral group algebra.

### Dependencies

IntegralHeckeAndGaloisDeterminants §1.6 (isotypic module recognition); ModularCurvesPartII §17.2 (Eichler–Shimura relation); SerreWeightAndLevelOptimisation §3.10 (ordinary Tate sequence); LocalGaloisDeformationRings §§2.1–2.5, 2.19 (minimal away-p conditions); GL2AutomorphicRepresentationsAndTransfer §§R16.2.7, R16.2.11, R16.3.9 (newvectors and CDT types); LocalGaloisDeformationRings §6.18 (normal Cohen–Macaulay type three); GlobalGaloisDeformations §§3.3–3.7 (condition quotients and presentations); PotentialModularityAndCompatibleSystems §8.8 (fixed-character scalar ordinary finiteness); GL2ModularityLifting §§3.7, 4.1–4.2 (component support and integral comparison); DeformationAndDerivedPatchingAlgebra §§3.1, 3.9 (depth, canonical modules and type); AlgebraicModularFormsAndSerreWeights §§2.1, 2.5, 2.12 (integral q-expansions and coherent Hecke); AutomorphicGaloisRepresentations §§6.8–6.9, 6.12 (integral determinant and reconstruction); SerreWeightAndLevelOptimisation §§3.10–3.13 (Gross sequence, known multiplicities and minimal witness). The unrestricted scalar branch also needs gap:scalar-variable-determinant, gap:scalar-conductor-comparison and gap:scalar-variable-global-type. Earlier internal targets are specified individually in the Needs lines.

## Layer 8: Bianchi deformation and Hecke data

### 8.1 Minimal Bianchi datum

Fix imaginary quadratic F and p≥3 unramified in F, with O,k as above. Let ρ̄:G_F→GL₂(k) be continuous, detρ̄=barε, and ρ̄|G_(F(ζ_p)) absolutely irreducible. At each v|p it is finite flat or ordinary; the minimal lifts are finite flat when ρ̄ is finite flat, and ordinary otherwise. Finite flat means a finite flat group scheme over O_(F_v), with the given Galois generic fibre. At x∤p where ρ̄ ramifies, after a sufficiently large coefficient extension require exactly the applicable S/P/M/H case: unipotent inertia S; reducible D_x and semisimple inertia ψ⊕ψ⁻¹ P; irreducible D_x, reducible inertia and N(x)≢−1 mod p M; or absolutely irreducible inertia H. Nontrivial quadratic-twisted unipotent inertia is excluded by the S/P/M/H hypothesis. For lifts impose unipotent inertia at S, Teich(ψ)⊕Teich(ψ)⁻¹ at P, the two fixed Teichmüller inertia characters at M, and reduction-isomorphic inertial image at H, together with the finite-flat/ordinary conditions above p. R_Q is the imported fixed-ε deformation ring, minimal outside Q, with Q disjoint from ramification and p.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. F is imaginary quadratic, p is unramified in F, detρ̄=barε and ρ̄|G_(F(ζ_p)) is absolutely irreducible; the local S/P/M/H and coefficient hypotheses of Layer 8 apply.

A proof route uses these inputs. Translate the local cases into the existing local deformation-condition interface. Impose the finite-flat precedence at v|p and the fixed cyclotomic determinant. Form the global deformation problem through GlobalGaloisDeformations §§3.3–3.7, retaining absolute local classification rather than reducibility over a too-small residue field. (CG18, §5.1, pp. 368–370; compare Theorem 1.3, p. 302; cg18 line 2880.)

The construction has the following API.

- Return the minimal local condition at each place and its tangent subspace L_(Q,x).
- Maps R_Q→A correspond to strict-equivalence classes of continuous fixed-ε lifts satisfying these local conditions on all Artinian quotients.
- At a Taylor–Wiles x, the selected eigenline inertia character defines O[Δ_Q]→R_Q; quotient by augmentation is R_min.
- Local coefficient maps carry strict-equivalence classes of lifts to lifts with the same fixed determinant and local conditions; the representing-ring equivalence is natural in every Artinian coefficient algebra.

**Checks.**

- A group scheme over the global coefficient ring O is not a substitute for a finite flat group scheme over O_(F_v).
- When ρ̄ is both flat and ordinary, an ordinary lift which is not finite flat is excluded from the minimal flat problem.
- Locally over ℤₚ, μₚ⊕ℤ/p is finite flat and ordinary, with inertia characters ε̄ and 1. The Kummer extension given by p is ordinary but fails finite flatness, while a unit Kummer class gives a finite-flat extension; ordinarity alone does not identify the local condition.
- A ramified inertia image χ⊗[[1,*],[0,1]] with χ nontrivial quadratic and nonzero extension is neither S nor semisimple P and is rejected.

*Needs:* GlobalGaloisDeformations §§3.3–3.7 (condition quotients and presentations); LocalGaloisDeformationRings §§2.1–2.5, 2.19 (minimal away-p conditions); LocalGaloisDeformationRings §4.1 (flat deformations). gap:bianchi-local-types.

### 8.2 Bianchi arithmetic levels and matched types

For G=Res_(F/Q)PGL₂ let Y(K)=G(Q)\G(A)/(K_∞⁰K), using orbifold/group homology on each arithmetic lattice component. Use the projective congruence subgroups of ArithmeticLocallySymmetricSpaces §ALS.0.10(ii). At Q take K_Q=Γ₁(v), L_Q=Γ₀(v); outside Q,Sp take maximal level; at v|p take maximal PGL₂(O_(F_v)) if ρ̄ is flat and Γ₀(v) otherwise; at S take Γ₀(v). For M,H retain Γ_p(v^(a(ρ̄_v))). At P the source’s Γ_p(v^(2a(ψ))) is not minimal-type matching: for ψ²≠1 use the Γ₀(v^(a(ψ))) character type ψ(a/d), and for ψ²=1 the twisted spherical type ψ∘det on PGL₂(O_(F_v)), by gap:principal-local-selectors. Denote by H_i^min the homology after a supplied integral minimal-type projector; the S-only case needs no P correction. At quadratic ψ the character ψ∘det descends to PGL₂ because ψ(a²) = 1 for every scalar a. For arbitrary principal types use the supplied integral coefficient model; a central idempotent is not assumed when its denominator is divisible by p.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. F is imaginary quadratic, p is unramified in F, detρ̄=barε and ρ̄|G_(F(ζ_p)) is absolutely irreducible; the local S/P/M/H and coefficient hypotheses of Layer 8 apply.

A proof route uses these inputs. Specialize the existing PGL₂ quotient and its finite arithmetic-lattice components, retaining stabilizers. Use ArithmeticLocallySymmetricSpaces §ALS.0.10(ii) for the projective congruence subgroups. At type P separate the source’s level from the matched local-type spaces. Their integral Hecke/cover/duality compatibility is by gap:integral-principal-types; do not silently replace one space by the other. (CG18, §§5.2–5.2.1, pp. 371–373; Theorem 1.3, p. 302; cg18 line 3020.)

The construction has the following API.

- π₀Y(K)=F×\A_(F,f)×/(A_(F,f)×²detK); Hecke operators may permute these components.
- Normal level inclusions give orbifold covers with their actual deck group; the coefficient homology is group homology even with stabilizers.
- The integral type projector, when supplied, commutes with the Q-cover and Hecke correspondences, and selects exactly the prescribed local deformation types in characteristic zero.
- For a supplied integral minimal-type model, specify the comparison with each characteristic-zero local selector and its actual dimension. No canonical integral projector is inferred from characteristic-zero type decomposition alone.

**Checks.**

- Multiplying a representative matrix by a unit does not change Γ₀,Γ₁ or Γ_p membership after normalizing its upper-left entry.
- At order-3 stabilizers with p=3, group homology can be nonzero above the manifold dimension; coarse-space homology is not substituted.
- For principal type ψ⊕ψ⁻¹ of a(ψ)=1 and ψ²≠1, Γ_p(v²) admits more than the minimal-type vectors; it is not identified with the matched type space.

*Needs:* §8.1; ArithmeticLocallySymmetricSpaces §§ALS.0.1–ALS.0.10 (quotients, stabilizers and levels); ArithmeticLocallySymmetricSpaces §ALS.1 (groupoid coefficients and universal coefficients); GL2AutomorphicRepresentationsAndTransfer §§R16.2.7, R16.2.11, R16.3.9 (newvectors and CDT types). gap:principal-local-selectors; gap:integral-principal-types.

### 8.3 Bianchi Hecke data and residual ideals

On H₁(Y₁(Q),O), or on a supplied H₁^min type summand, let T_Q^an be the finite O-image of T_α away from Q∪S∪{v|p}; let T_Q also include operators supported at Q and the relevant diamonds. A residual minimal modularity datum is the assertion that m_∅=(π,T_λ−trρ̄(Frob_λ)) is proper at Q=∅. Extend it by U_x−α_x at Q, using chosen uniformizers; the residual class of U_x is independent of the uniformizer only when the residual diamond character is trivial. Use the CG18 Eisenstein condition of ArithmeticLocallySymmetricSpaces §ALS.4.10: T_λ−2 belongs to the ideal for all but finitely many λ split completely in one fixed finite abelian extension of F.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. F is imaginary quadratic, p is unramified in F, detρ̄=barε and ρ̄|G_(F(ζ_p)) is absolutely irreducible; the local S/P/M/H and coefficient hypotheses of Layer 8 apply.

A proof route uses these inputs. Use the existing integral Hecke-image construction on the arithmetic homology, not a generic new algebra. For each prime away from the level fix the ideal Hecke operator; for a level prime record the uniformizer dependence through diamonds. Treat properness at minimal level as an input. Residual modularity at some higher level does not supply it. (CG18, Definition 5.4–5.5 and Remark 5.7, pp. 374–375; §5.4, pp. 378–379; cg18 line 3126.)

The construction has the following API.

- T_Q is the image of the displayed operators and includes the Q-diamond action needed for augmentation.
- The residue map sends T_λ to trρ̄(Frob_λ) and U_x to the selected α_x; properness is part of the modularity datum.
- Replacing π_x by uπ_x multiplies U_x by the diamond ⟨u⟩, hence preserves its residual eigenvalue exactly when that diamond is residually trivial.
- The represented Hecke image is the abstract operator algebra modulo the kernel of its action on the specified homology. A homomorphism descends exactly when it kills that kernel, and is determined by the displayed operators and diamonds.

**Checks.**

- T_λ on H₀ is degree times a component permutation; it is scalar degree only on preserved components.
- If the residual diamond at u equals c≠1, the residual U_(uπ) eigenvalue is cα, so uniformizer independence is rejected.
- If localized H₁ is nonzero and killed by π, its Hecke image is allowed to be a finite k-algebra.

*Needs:* ArithmeticLocallySymmetricSpaces §ALS.4.10 (Eisenstein ideals); §8.2; IntegralHeckeAndGaloisDeterminants §§2.1–2.2 (images and local factors); ArithmeticLocallySymmetricSpaces §ALS.3 (Hecke correspondences).

### 8.4 Conjecture A local–global contract

For every Q of Taylor–Wiles primes and every non-Eisenstein residual factor m_Q associated to ρ̄, ConjectureA(Q,m_Q) asserts an actual continuous ρ_m:G_F→GL₂(T_(Q,m_Q)) lifting ρ̄ with determinant ε, unramified outside SpQ and polynomial X²−T_λX+N(λ) at arithmetic Frobenius away from SpQ. At S inertia is unipotent; at P it is Teich(ψ)⊕Teich(ψ)⁻¹. At x∈Q the invertible T_a define, via geometric Artin reciprocity, a character φ_x residually unramified; when φ_x(Frob_x)≢±1, ρ_m|D_x has the two characters φ_xε and φ_x⁻¹ with the stated normalization. At v|p, ρ̄ finite flat implies ρ_m finite flat, and ρ̄ ordinary implies ρ_m ordinary, with flat precedence in the minimal problem. Require the remaining M,H minimality from the local classification, or explicitly supply it in the matched-type contract. The assumption for patching is this contract for every auxiliary Q, not only Q=∅.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. F is imaginary quadratic, p is unramified in F, detρ̄=barε and ρ̄|G_(F(ζ_p)) is absolutely irreducible; the local S/P/M/H and coefficient hypotheses of Layer 8 apply.

A proof route uses these inputs. Package this statement as a proposition about the particular image algebras; do not claim a proof or weaken to a representation modulo nilpotents. State the local character through the geometric Artin map, and convert the arithmetic Frobenius polynomial with its inverse convention. For matched type-P spaces require the same compatibility contract on those spaces; its availability is part of the integral principal-type contract. (CG18, Conjecture A(1)–(4), pp. 374–375; cg18 line 3139.)

The construction has the following API.

- Extract the actual continuous rank-two representation over the full localized image.
- Extract the selected inertial diamond character and the two-character local description when the residual eigenvalue is not ±1.
- The finite-flat and ordinary implications are conditioned on the residual representation; finite flat is over O_(F_v).
- Base change of a supplied representation to a finite local quotient retains the good-prime polynomials and the specified local identities; keep all Artinian finite-flat conditions. This does not supply the contract at a different auxiliary level Q.

**Checks.**

- A representation only over T/I for a nonzero nilpotent I does not satisfy this contract over T.
- A proof at Q=∅ alone supplies no contract at Q_a and cannot instantiate the patching theorem.
- If ρ̄ is not finite flat but is ordinary at v|p, the contract asks for ordinary compatibility and does not assert an unconditional flat lift.

*Needs:* §8.1; §8.3; ClassFieldTheory Layer 7 (arithmetic and geometric local reciprocity); LocalGaloisDeformationRings §§2.1–2.5, 2.19 (minimal away-p conditions). gap:integral-principal-types.

### 8.5 Conjectural Galois representation generates Hecke

Assume the Conjecture A contract and minimal residual modularity. For each Q with N(x)≡1 mod p and distinct residual roots α_x,β_x, α_xβ_x=1, there is a surjection R_Q↠T_(Q,m_Q) with the local diamond map agreeing with the selected eigenline inertia character. The corresponding arithmetic traces generate this full selected auxiliary image, not only the anaemic subalgebra.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. F is imaginary quadratic, p is unramified in F, detρ̄=barε and ρ̄|G_(F(ζ_p)) is absolutely irreducible; the local S/P/M/H and coefficient hypotheses of Layer 8 apply.

A proof route uses these inputs. Distinct roots with product one imply α_x≠±1, enabling Conjecture A(3). Use Hensel uniqueness to recover the chosen U_x root from the trace and local determinant. Recover the diamond characters by the local decomposition and reciprocity, then apply the global universal property and topological generation by traces. (CG18, Lemma 5.6, p. 375; §5.4, pp. 379–380; cg18 line 3173.)

**Checks.**

- At norm one with distinct residual roots and determinant one the selected α is not ±1, so the derivative needed by Hensel is invertible.
- Over 𝔽₇ with determinant 1 choose α = 2 and β = 4; the trace is 6 and the derivative 2α−6 = 5 is a unit. The other derivative is 2·4−6 = 2.
- For α = β = 1 the trace is 2 and derivative 2−2 = 0; Conjecture A’s distinct-root split cannot be invoked.

*Needs:* §8.4; GlobalGaloisDeformations §§3.3–3.7 (condition quotients and presentations).

### Examples

For residual norm one over 𝔽₇ choose roots 2,4 of X²−6X+1. Both Hensel derivatives 5 and 2 are nonzero, and neither root is ±1. Replacing a uniformizer by a unit of diamond value 3 changes a selected U value 2 to 6 unless the residual diamond is trivial. The geometric reciprocity value of an arithmetic character 2 is 4.

### Dependencies

GlobalGaloisDeformations §§3.3–3.7 (condition quotients and presentations); LocalGaloisDeformationRings §§2.1–2.5, 2.19 (minimal away-p conditions); LocalGaloisDeformationRings §4.1 (flat deformations); ArithmeticLocallySymmetricSpaces §§ALS.0.1–ALS.0.10 (quotients, stabilizers and levels); ArithmeticLocallySymmetricSpaces §ALS.4.10 (Eisenstein predicate); ArithmeticLocallySymmetricSpaces §ALS.1 (groupoid coefficients and universal coefficients); GL2AutomorphicRepresentationsAndTransfer §§R16.2.7, R16.2.11, R16.3.9 (newvectors and CDT types); IntegralHeckeAndGaloisDeterminants §§2.1–2.2 (images and local factors); ArithmeticLocallySymmetricSpaces §ALS.3 (Hecke correspondences); ClassFieldTheory Layer 7 (arithmetic and geometric local reciprocity). Earlier internal targets are specified individually in the Needs lines.

## Layer 9: Bianchi homology and balancedness

### 9.1 Bianchi diamond-cover datum

For Q as above use Δ_Q, its p-power quotient Δ and the intermediate orbifold cover Y_Δ(Q)→Y₀(Q) of ArithmeticLocallySymmetricSpaces §ALS.0.10(iv). Put S=O[Δ]. Every finite O[Δ]-module μ gives a local coefficient system on Y₀(Q), and Shapiro identifies H_i(Y₀(Q),S)≅H_i(Y_Δ(Q),O). The chosen Hecke ideal includes U_x−α_x and the residual trivial diamond conditions.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. F is imaginary quadratic, p is unramified in F, detρ̄=barε and ρ̄|G_(F(ζ_p)) is absolutely irreducible; the local S/P/M/H and coefficient hypotheses of Layer 8 apply. Integral amplitude is proved here for p≥5; at p=3 it assumes H₃(3) of gap:localized-three-primary-stabilizers. The rank comparison uses duality over K from ArithmeticLocallySymmetricSpaces §ALS.5a.6. A matched P-type summand needs the integral principal-type contract and all its Hecke/cover/duality compatibilities.

A proof route uses these inputs. Use the intermediate levels and deck action of ArithmeticLocallySymmetricSpaces §ALS.0.10(iv). Identify the regular local system with induced trivial coefficients on each arithmetic lattice. Apply the pinned group-homology Shapiro isomorphism, then assemble the Hecke-compatible component maps. A type projector requires the compatibility supplied in Layer 8. (CG18, §5.3.1, p. 376; cg18 line 3219.)

The construction has the following API.

- H_i(Y₀(Q),O[Δ])≅H_i(Y_Δ(Q),O), as S-modules with the same normalized Hecke action.
- Quotients Δ↠Δ′ induce the expected covering transfer maps and augmenting to Δ′=1 recovers base level.
- Under the Shapiro equivalence, the map to base level uses the coefficient-sum augmentation S→O: every deck basis element [δ] maps to 1, including in residue characteristic dividing |Δ|.

**Checks.**

- Δ=1 gives Y_Δ=Y₀ and the identity Shapiro comparison.
- For Δ=C₃, the regular O-module has rank three, even when p=3; it is not replaced by its rank-one coinvariants before descent.
- A normal lattice cover remains an orbifold cover with deck group Δ even when its map of coarse spaces is ramified.

*Needs:* ArithmeticLocallySymmetricSpaces §ALS.0.10 (levels and deck groups); §8.2; §8.3; ArithmeticLocallySymmetricSpaces §ALS.1 (groupoid coefficients and universal coefficients); ArithmeticLocallySymmetricSpaces §§ALS.6.1–ALS.6.3 (finite-cover descent); Mathlib `groupHomology.indIso`.

### 9.2 Bianchi selected-root comparison

At Taylor–Wiles primes Q with N(x)≡1 mod p and distinct residual roots, the ideal selecting U_x=α_x gives H₁(Y₀(Q),O)_m≅H₁(Y,O)_(m_∅), compatible with the anaemic Hecke action. The assertion is for the selected local factor and is valid on a supplied compatible minimal-type summand. It does not identify the entire two-copy oldspace with base level.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. F is imaginary quadratic, p is unramified in F, detρ̄=barε and ρ̄|G_(F(ζ_p)) is absolutely irreducible; the local S/P/M/H and coefficient hypotheses of Layer 8 apply. Integral amplitude is proved here for p≥5; at p=3 it assumes H₃(3) of gap:localized-three-primary-stabilizers. The rank comparison uses duality over K from ArithmeticLocallySymmetricSpaces §ALS.5a.6. A matched P-type summand needs the integral principal-type contract and all its Hecke/cover/duality compatibilities.

A proof route uses these inputs. Use universal coefficients and Pontryagin duality to translate the selected-root cohomology comparison of AutomorphyLiftingBeyondTaylorWiles §3.5 to H₁, with the transposed Hecke action and the corresponding dual residual ideal. The association of m to ρ̄ gives only the residual clause (i) of B^gal, so use gap:selected-root-residual-only rather than the stronger supplier statement; ArithmeticLocallySymmetricSpaces §ALS.3.14 supplies its two degeneracy correspondences. The complementary-newspace elimination belongs to that residual-only supplier contract. No Conjecture A hypothesis enters this comparison. (CG18, Lemma 5.8, p. 376; cg18 line 3205.)

**Checks.**

- Before root selection there are two oldform factors; after imposing U_x−α_x the comparison is with one minimal-level module.
- At residual norm 1 over 𝔽₇ with roots 2,4, the oldform determinant is −(2−4)² = 3, a unit, and the selected factor has one base copy.
- For roots 2,4 over 𝔽₇ the ALS degeneracy determinant is (1+1)²−6² = 3 = −(2−4)²; the complementary-summand argument also uses U_(x²)−1 ≡ 2²−1 = 3, a unit.
- At repeated roots 1,1 the same determinant is 0, so this comparison is outside its hypotheses; the whole oldspace cannot be silently selected.

*Needs:* §9.1; AutomorphyLiftingBeyondTaylorWiles §3.5 via gap:selected-root-residual-only (selected-root cohomology); ArithmeticLocallySymmetricSpaces §§ALS.1, ALS.3.14 (universal coefficients and degeneracy maps).

### 9.3 Localized Bianchi amplitude and boundary

Assume p ≥ 3, gap:non-neat-bianchi-boundary and hypothesis H₃(3) of gap:localized-three-primary-stabilizers when p = 3, the non-Eisenstein residual ideal of Layer 8 and finite μ over O[Δ]. Then H₀(Y₀(Q),μ)_m=H₃(Y₀(Q),μ)_m=0; the ordinary/Borel–Moore comparison uses gap:non-neat-bianchi-boundary at ArithmeticLocallySymmetricSpaces §ALS.4. If μ is O-flat, H₂(Y₀(Q),μ)_m is O-torsion-free. Retain the same assertions on a compatible direct minimal-type summand. For p=3 degree-three vanishing is hypothesis H₃(3); boundary vanishing for every p ≥ 3 is the separate non-neat boundary contract; the integral coefficient statements follow by filtration and completeness, without integral duality.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. F is imaginary quadratic, p is unramified in F, detρ̄=barε and ρ̄|G_(F(ζ_p)) is absolutely irreducible; the local S/P/M/H and coefficient hypotheses of Layer 8 apply. Integral amplitude is proved here for p≥5; at p=3 it assumes H₃(3) of gap:localized-three-primary-stabilizers. The rank comparison uses duality over K from ArithmeticLocallySymmetricSpaces §ALS.5a.6. A matched P-type summand needs the integral principal-type contract and all its Hecke/cover/duality compatibilities.

A proof route uses these inputs. For p≥5 finite stabilizers in these PGL₂ arithmetic lattices have order prime to p (possible torsion element orders are 1,2,3,4,6). Group homology may therefore be computed by the orbifold cellular chains over O. Noncompactness and dimension three give H₃ with residual coefficients zero. H₀ carries degree times a permutation of determinant components; its eigensystems are Eisenstein. Induct on finite coefficient quotients and then use completeness for μ. For boundary localization and ordinary/Borel–Moore comparison use gap:non-neat-bianchi-boundary at ArithmeticLocallySymmetricSpaces §ALS.4. Its torus-Levi argument uses class field theory, rather than a Hecke-valued Galois lift. The finite cusp-stabilizer torsion has order dividing |O_Fˣ|. At p = 3 the hypothesis that p is unramified excludes F = ℚ(√−3); the remaining unit orders 2 and 4 are invertible, so the boundary has no corresponding 3-primary obstruction (CG18, Lemma 5.9(3), pp. 376–377; cg18 lines 3254–3267). For O-flat μ, use the homology coefficient exact sequence and H₃(Y,μ/π)_m=0 to deduce H₂(Y,μ)_m[π]=0. (CG18, Lemma 5.9 and proof, pp. 376–377; cg18 line 3235.)

**Checks.**

- At p=3 an order-three stabilizer is a counterexample to the unlocalized manifold argument; the p≥5 proof must not invoke it there.
- For a point with stabilizer C₃, dim H₃(C₃,𝔽₃) = 1 whereas the coarse point has H₃ = 0. This is a negative control for the p = 3 argument before localization.
- For F = ℚ(i) and p = 3, the cusp element diag(i,1) has projective order 4, which is invertible modulo 3. For F = ℚ(√−3), the discriminant is −3, so p = 3 is excluded by unramifiedness. Boundary torsion and interior order-three stabilizers therefore require different arguments.
- For a two-component space and a Hecke correspondence of degree 2 interchanging components, its H₀ matrix is [[0,2],[2,0]], with eigenvalues 2 and −2; replacing it by 2I loses the permutation.

*Needs:* §9.1; ArithmeticLocallySymmetricSpaces §§ALS.2, ALS.4.1–ALS.4.12 (compactification and boundary); ArithmeticLocallySymmetricSpaces §ALS.5a.6 (finite-level duality over K); ArithmeticLocallySymmetricSpaces §ALS.3 (Hecke correspondences). gap:localized-three-primary-stabilizers. gap:non-neat-bianchi-boundary.

### 9.4 Balanced Bianchi homology

Under p≥5 and the preceding level, coefficient and localization hypotheses, M=H₁(Y_Δ(Q),O)_m is a finite balanced S=O[Δ]-module. Explicitly, with r=rank_O M_Δ, d_S(M)=r−dim_k(Tor₁^S(M,O)/π)≥0. If p=3 the same implication holds under hypothesis H₃(3) of gap:localized-three-primary-stabilizers; the rank comparison uses only characteristic-zero duality.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. F is imaginary quadratic, p is unramified in F, detρ̄=barε and ρ̄|G_(F(ζ_p)) is absolutely irreducible; the local S/P/M/H and coefficient hypotheses of Layer 8 apply. Integral amplitude is proved here for p≥5; at p=3 it assumes H₃(3) of gap:localized-three-primary-stabilizers. The rank comparison uses duality over K from ArithmeticLocallySymmetricSpaces §ALS.5a.6. A matched P-type summand needs the integral principal-type contract and all its Hecke/cover/duality compatibilities.

A proof route uses these inputs. Hochschild–Serre gives Tor_i^S(H_j(Y_Δ,O)_m,O)⇒H_(i+j)(Y₀,O)_m. H₀=0 gives M_Δ≅H₁(Y₀,O)_m and H₂(Y_Δ,O)_(m,Δ)→H₂(Y₀,O)_m→Tor₁^S(M,O)→0. The preceding theorem makes H₂(Y₀,O)_m O-free. After tensoring with K, ArithmeticLocallySymmetricSpaces §ALS.5a.6 and gap:non-neat-bianchi-boundary give its rank equal to rank H₁(Y₀,O)_m; every finite neat-cover degree is invertible in K. Track the dual Hecke ideal: for PGL₂ the inverse correspondence differs only by the matching trivial-central-character normalization. Apply the low-degree Tor dimension formula from the imported balanced-module API; the right-exact segment bounds Tor₁/π by r. (CG18, Proposition 5.10, pp. 377–378; cg18 line 3268.)

**Checks.**

- At Δ=1 recover the O-module defect identity. At general Δ retain the right-exact Tor edge sequence and its H₂ rank bound.
- For Δ = 1 and M = Oʳ ⊕ kˢ, Tor₀ with k has dimension r+s and Tor₁ has dimension s, so d = r, matching r−0.
- For an H₂ rank bound r = 2 and Tor₁/π dimension 1 the defect is 1; if the edge map were incorrectly made injective it would assert extra information absent from the right-exact sequence.

*Needs:* §9.1; §9.3; DeformationAndDerivedPatchingAlgebra §5.1 (balanced presentations); ArithmeticLocallySymmetricSpaces §ALS.5a.6 (finite-level duality over K); ArithmeticLocallySymmetricSpaces §§ALS.6.1–ALS.6.3 (finite-cover descent); DeformationAndDerivedPatchingAlgebra §5.1 (Tor defect identity). gap:localized-three-primary-stabilizers. gap:non-neat-bianchi-boundary.

### Examples

The regular coefficient system O[C₃] has rank 3, its coinvariants have rank 1 and the augmentation of [g] is 1. At a C₃ stabilizer in characteristic 3, H₃ has dimension 1 even though a coarse point has H₃ = 0. Thus cover descent and localized stabilizer vanishing are distinct inputs.

### Dependencies

ArithmeticLocallySymmetricSpaces §§ALS.0.10, ALS.3.14, ALS.4 with gap:non-neat-bianchi-boundary; AutomorphyLiftingBeyondTaylorWiles §3.5 via gap:selected-root-residual-only; gap:localized-three-primary-stabilizers. ArithmeticLocallySymmetricSpaces §ALS.1 (groupoid coefficients and universal coefficients); ArithmeticLocallySymmetricSpaces §§ALS.6.1–ALS.6.3 (finite-cover descent); Mathlib `groupHomology.indIso`; ArithmeticLocallySymmetricSpaces §ALS.3 (Hecke correspondences); ArithmeticLocallySymmetricSpaces §§ALS.2, ALS.4.1–ALS.4.12 (compactification and boundary); ArithmeticLocallySymmetricSpaces §ALS.5a.6 (finite-level duality over K); DeformationAndDerivedPatchingAlgebra §5.1 (balanced presentations). Earlier internal targets are specified individually in the Needs lines.

## Layer 10: Conditional Bianchi R = T and lifting

### 10.1 Bianchi Taylor–Wiles system

For the Bianchi minimal datum, let q=dim_k H¹_∅(F,ad⁰ρ̄(1)), which is at least one. For each a≥1 choose Q_a with |Q_a|=q, norms 1 mod p^a and distinct residual roots, killing this dual Selmer group. With Δ_a=(Z/p^aZ)^q, S_a=O[Δ_a], A_∞=O[[z₁,…,z_(q−1)]], let H_a=H₁(Y_(Δ_a)(Q_a),O)_(m_a) and H=H₁(Y,O)_(m_∅). Assume Conjecture A for all Q_a, and either p ≥ 5, or p = 3 with hypothesis H₃(3) of gap:localized-three-primary-stabilizers. With compatible minimal-type summands when needed, this is a balanced patching system: H_a,Δ_a≅H, diamond images lie in the A_∞ image, and augmentation specializes R_(Q_a) to R_min. Distinct original prime sets need not be nested and no transition map between them is required; coefficient and deck quotient compatibilities apply to the maps that are actually defined.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. F is imaginary quadratic, p is unramified in F, detρ̄=barε and ρ̄|G_(F(ζ_p)) is absolutely irreducible; the local S/P/M/H and coefficient hypotheses of Layer 8 apply. Integral amplitude is proved here for p≥5; at p=3 it assumes H₃(3) of gap:localized-three-primary-stabilizers. The rank comparison uses duality over K from ArithmeticLocallySymmetricSpaces §ALS.5a.6. A matched P-type summand needs the integral principal-type contract and all its Hecke/cover/duality compatibilities.

A proof route uses these inputs. Import the imaginary-quadratic tangent bound dim t_(R_Q)≤dim dualSelmer−1+Σ_(x∈Q)dim H⁰(F_x,ad⁰ρ̄(1)) and the simultaneous prime-selection theorem from GlobalGaloisDeformations §§3.6–3.7, 5.1–5.8, 6.2–6.8. Choose the q−1-variable surjections onto R_(Q_a), then act on H_a through the Conjecture A surjections. Use localized H₀=0 and Hochschild–Serre for coinvariants, followed by the selected-root comparison. Use Conjecture A(3) and the geometric-Artin diamond comparison for the scalar-image and augmentation conditions. (CG18, Propositions 5.1–5.2, pp. 370–371; proof of Theorem 5.11, pp. 379–380; cg18 line 3333.)

The construction has the following API.

- Return Q_a, the surjection Δ_(Q_a)↠Δ_a, H_a and its commuting A_∞ and S_a actions.
- H_a⊗_(S_a)O≅H equivariantly, after localizing the chosen U-roots.
- The group-ring action is induced by the selected Galois inertial characters, and augmentation gives the fixed-determinant minimal problem.
- Keep finite-coefficient and deck-quotient transition maps compatible with the chosen U_x factors and A_∞ action; the base H is the same minimal-level module for every patching index.

**Checks.**

- The variable count uses the dual Selmer group of ad⁰ρ̄(1). Using H¹ of ad⁰ρ̄ instead changes q in general.
- q=0 is excluded by the tangent bound and existence of R_min; A_∞ is not assigned a negative number of variables.
- Coinvariants recover the selected H₁(Y₀(Q_a)) factor and then H; using the entire two-copy oldspace gives the wrong rank.

*Needs:* §8.5; §9.2; §9.4; GlobalGaloisDeformations §§3.3–3.7 (condition quotients and presentations); GlobalGaloisDeformations §§5.1–5.8 (Taylor–Wiles selection); GlobalGaloisDeformations §§6.2–6.8 (trace rings and auxiliary specialization); Tau Ceti `TauCeti.MonoidAlgebra.augmentation`. gap:taylor-wiles-sets; gap:defect-one-presentations. gap:localized-three-primary-stabilizers.

### 10.2 Conditional minimal Bianchi R = T

Assume the Bianchi minimal datum, proper residual minimal ideal, Conjecture A for every auxiliary Q and p≥5. At levels with no P primes, the map R_min→T_(m_∅) is an isomorphism and H₁(Y,O)_(m_∅) is nonzero finite free over it. The matched minimal-type version with P primes has the same conclusion provided its integral projector/Hecke/duality/Conjecture A package is supplied (the integral principal-type contract). For p = 3 the same implication assumes hypothesis H₃(3) of gap:localized-three-primary-stabilizers. O-flatness of H or T is not an assumption.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. F is imaginary quadratic, p is unramified in F, detρ̄=barε and ρ̄|G_(F(ζ_p)) is absolutely irreducible; the local S/P/M/H and coefficient hypotheses of Layer 8 apply. Integral amplitude is proved here for p≥5; at p=3 it assumes H₃(3) of gap:localized-three-primary-stabilizers. The rank comparison uses duality over K from ArithmeticLocallySymmetricSpaces §ALS.5a.6. A matched P-type summand needs the integral principal-type contract and all its Hecke/cover/duality compatibilities.

A proof route uses these inputs. Apply the balanced patching engine to the exact Bianchi system. Use the surjective deformation-to-Hecke map and positive-rank freeness to identify their faithful action images. Keep the coefficient-type and stabilizer hypotheses explicit in both the module and ring statements. (CG18, Theorem 5.11, pp. 379–380; Theorem 1.3, p. 302; cg18 line 3324.)

**Checks.**

- A proper minimal residual ideal with purely torsion H₁ remains admissible. Conjecture A must be assumed on every Taylor–Wiles level.
- The algebraic shape T = k, H = k² has nonzero free rank 2 over T and zero generic fibre; neither O-flatness nor rank one follows from balanced patching.
- For H = 0, its action image is the zero algebra and there is no proper residual maximal ideal with residue k; the properness hypothesis excludes the vacuous system.

*Needs:* §10.1; DeformationAndDerivedPatchingAlgebra §5.5 (balanced patching).

### 10.3 Dimension-zero Bianchi complete intersection

Under the hypotheses of the Bianchi R = T target, if the Krull dimension of T_m is 0, then T_m is a complete intersection. The patching presentation is T_m≅O[[z₁,…,z_(q−1)]]/(f₁,…,f_q); its regular ambient ring has dimension q and the ideal is m-primary, so f₁,…,f_q form a regular sequence. This does not say that every positive-dimensional T_m is a complete intersection.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. F is imaginary quadratic, p is unramified in F, detρ̄=barε and ρ̄|G_(F(ζ_p)) is absolutely irreducible; the local S/P/M/H and coefficient hypotheses of Layer 8 apply. Integral amplitude is proved here for p≥5; at p=3 it assumes H₃(3) of gap:localized-three-primary-stabilizers. The rank comparison uses duality over K from ArithmeticLocallySymmetricSpaces §ALS.5a.6. A matched P-type summand needs the integral principal-type contract and all its Hecke/cover/duality compatibilities.

A proof route uses these inputs. Keep the q augmentation equations in the conclusion of the balanced patching proof. Dimension zero makes them a parameter system in the q-dimensional regular local ambient ring. Apply DeformationAndDerivedPatchingAlgebra §§3.4–3.5: in a complete Cohen–Macaulay ambient ring, the dimension bound makes these equations a regular sequence, and a regular ambient ring gives a complete intersection. (CG18, Closing remarks after Theorem 5.11, p. 380; cg18 line 3372.)

**Checks.**

- When q=1 the ambient ring is O and the dimension-zero quotient has one parameter equation; the argument does not assert the positive-dimensional case.
- For q = 1 and f₁ = π², the ambient DVR O has dimension 1 and T = O/π² has dimension 0; one nonzero regular equation gives a complete intersection of O-length 2.
- For q = 1 and f₁ = 0 the quotient is O of dimension 1, so the parameter-system argument has a failed dimension hypothesis even though this particular quotient is itself regular.

*Needs:* §10.2; DeformationAndDerivedPatchingAlgebra §§3.4–3.5 (complete intersections and formal dimension criterion).

### 10.4 Bianchi generic rank with local multiplicities

If H₁(Y,O)_m[1/p]≠0 under the Bianchi R = T hypotheses, its free rank equals the contribution of the characteristic-zero automorphic representation at the actual chosen finite-level type spaces. In the S-only Γ₀ minimal-level situation each local factor is one-dimensional and the free rank is one. At Γ_p levels for P/M/H there can be a prime-to-p diamond orbit of several local vectors, so global automorphic multiplicity one does not imply module rank one. For matched types, rank one needs a separately verified one-dimensional type/newvector selector.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. F is imaginary quadratic, p is unramified in F, detρ̄=barε and ρ̄|G_(F(ζ_p)) is absolutely irreducible; the local S/P/M/H and coefficient hypotheses of Layer 8 apply. Integral amplitude is proved here for p≥5; at p=3 it assumes H₃(3) of gap:localized-three-primary-stabilizers. The rank comparison uses duality over K from ArithmeticLocallySymmetricSpaces §ALS.5a.6. A matched P-type summand needs the integral principal-type contract and all its Hecke/cover/duality compatibilities.

A proof route uses these inputs. Decompose characteristic-zero homology by cuspidal automorphic representations and the degree-one cohomology at infinity. Apply global multiplicity one, then retain dim π_f^K or its type-selected analogue rather than replacing it by one. Use the exact local invariant calculation at each place; Γ_p/Γ₁ retains prime-to-p diamond multiplicities. (CG18, Theorem 1.3, p. 302; remarks after Theorem 5.11, p. 380; cg18 line 3372.)

**Checks.**

- At a source’s M or H Γ_p level with a nontrivial prime-to-p diamond orbit, keep its invariant-space dimension instead of replacing it by one.
- For one automorphic representation of global multiplicity 1 with local invariant dimensions 2 and 3, its finite-level contribution is 1·2·3 = 6, not 1.
- At an S-only conductor-minimal Γ₀ level each local newvector dimension is 1; multiplying the local factors and the degree-one infinite contribution gives rank 1.

*Needs:* §10.2; GL2AutomorphicRepresentationsAndTransfer §§R16.2.7, R16.2.11, R16.3.9 (newvectors and CDT types); GL2AutomorphicRepresentationsAndTransfer §R16.4 (global multiplicity and contragredients); GL2AutomorphicRepresentationsAndTransfer §§R16.6.5–R16.6.6 (conductor and weight-one comparisons); ArithmeticLocallySymmetricSpaces §§ALS.5b.5–ALS.5b.8 (cuspidal comparison). gap:bianchi-classical-dictionary.

### 10.5 Minimal semistable Bianchi modularity lifting

Let p≥5 be unramified in imaginary quadratic F. Assume Conjecture A for all auxiliary levels. Let ρ:G_F→GL₂(O) be continuous, determinant ε, unramified outside finitely many places, semistable at every finite place (unipotent inertia away from p), and at each v|p finite flat or ordinary. Suppose ρ̄|G_(F(ζ_p)) is absolutely irreducible, ρ̄ occurs in mod-p homology at its minimal level N(ρ̄), and ρ satisfies the minimal local conditions including finite-flat precedence. Then ρ is associated to a regular algebraic cuspidal GL₂/F representation π with matching unramified local factors and L-function under the fixed normalization. At p = 3 the same lifting implication additionally assumes hypothesis H₃(3) of gap:localized-three-primary-stabilizers.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. F is imaginary quadratic, p is unramified in F, detρ̄=barε and ρ̄|G_(F(ζ_p)) is absolutely irreducible; the local S/P/M/H and coefficient hypotheses of Layer 8 apply. Integral amplitude is proved here for p≥5; at p=3 it assumes H₃(3) of gap:localized-three-primary-stabilizers. The rank comparison uses duality over K from ArithmeticLocallySymmetricSpaces §ALS.5a.6. A matched P-type summand needs the integral principal-type contract and all its Hecke/cover/duality compatibilities.

A proof route uses these inputs. The lift defines an O-point of the minimal deformation ring; semistability away from p uses only the S-type part of the local classification. R = T produces a characteristic-zero cuspidal Hecke class; non-Eisenstein localization and the automorphic/cohomological comparison exclude boundary classes. Compare the associated Galois representation with ρ by Frobenius density and residual absolute irreducibility; use local compatibility for the bad factors. (CG18, Theorem 1.2, p. 301; Theorem 1.3, p. 302; §5.4, pp. 378–380; cg18 line 3311.)

**Checks.**

- Residual modularity must occur at N(ρ̄), and an ordinary lift of a flat residual representation must satisfy the minimal flat condition.
- An ordinary lift of a finite-flat residual object which is not finite flat is excluded, even though it has an ordinary line; the finite-flat precedence is unchanged at the characteristic-zero point.
- An O-valued point of a purely π-torsion Hecke algebra is impossible because π is nonzero in O; a lift defining such a point forces a nonzero generic Hecke class.

*Needs:* §10.2; §8.1; GL2AutomorphicRepresentationsAndTransfer §§R16.6.5–R16.6.6 (conductor and weight-one comparisons); AutomorphicGaloisRepresentations §§3.7, 4.1–4.6, 6.12 (local compatibility); AutomorphicGaloisRepresentations §§5.1, 6.12 (ordinary lattice and quotient conditions).

### 10.6 GL/PGL class-group obstruction

PGL₂ removes the odd p-primary unramified central-character twists that would remain in the same residual GL₂ Hecke factor. If such twists are modeled by a cyclic C_p, their universal character algebra O[C_p] has O-rank p and cannot be the image of the scalar coefficient map O→O[C_p]. This algebraic obstruction explains the source’s expected GL example; no unconditional automorphic isomorphism T=O[C_p] is asserted. In a GL ray-class replacement, for a class a of order h=p^b with a^h=(α), at a prime x away from p and the supports of a and (α), splitting the order-h relation in the ray-class extension requires the h-th-power Kummer condition α^((N(x)−1)/h)≡1 at primes with h|N(x)−1, equivalently the corresponding splitting in F(α^(1/h),ζ_h). A p-th-power condition alone is insufficient when b>1.

O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k. F is imaginary quadratic, p is unramified in F, detρ̄=barε and ρ̄|G_(F(ζ_p)) is absolutely irreducible; the local S/P/M/H and coefficient hypotheses of Layer 8 apply. Integral amplitude is proved here for p≥5; at p=3 it assumes H₃(3) of gap:localized-three-primary-stabilizers. The rank comparison uses duality over K from ArithmeticLocallySymmetricSpaces §ALS.5a.6. A matched P-type summand needs the integral principal-type contract and all its Hecke/cover/duality compatibilities.

A proof route uses these inputs. The residual p-power characters are all trivial modulo π, so localization does not separate them. The PGL determinant-component quotient is modulo squares; p odd removes the p-primary central twisting contribution. For the GL ray-class comparison, compute the order-h lifting relation in the ray class extension; verify the required Kummer exponent is h and note that the source gives only a sketch of this alternative. (CG18, §5.5 and Remark 5.12, pp. 380–382; cg18 line 3377.)

**Checks.**

- For a class of order p², the p-th-power residue condition is insufficient; use the p²-th-power splitting criterion.
- For p = 3, h = 9 and residue group 𝔽₁₉× = ⟨g⟩, take α = g³. Then α⁶ = 1 but α² = g⁶ ≠ 1. The cubic test holds and the ninth-power test fails.
- For C₃, O[C₃] has O-rank 3 while scalar O has rank 1; the scalar coefficient map cannot be onto. For the trivial class group both ranks are 1.

*Needs:* §8.3; ClassFieldTheory Layers 11–12 (ray-class reciprocity and finiteness); ArithmeticLocallySymmetricSpaces §§ALS.0.1–ALS.0.9 (quotients and stabilizers).

### Examples

For q = 1 the dimension-zero presentation O/(π²) has one regular parameter equation and O-length 2. A nonzero generic Hecke fibre has rank equal to its actual finite local multiplicity: dimensions 2 and 3 contribute 6. In 𝔽₁₉×, α = g³ satisfies the cubic test α⁶ = 1 and fails the ninth-power test α² = g⁶ ≠ 1, so an order-9 ideal class needs the order-9 Kummer relation.

### Dependencies

GlobalGaloisDeformations §§3.3–3.7 (condition quotients and presentations); GlobalGaloisDeformations §§5.1–5.8 (Taylor–Wiles selection); GlobalGaloisDeformations §§6.2–6.8 (trace rings and auxiliary specialization); Tau Ceti `TauCeti.MonoidAlgebra.augmentation`; DeformationAndDerivedPatchingAlgebra §5.5 (balanced patching); DeformationAndDerivedPatchingAlgebra §§3.4–3.5 (complete intersections and formal dimension criterion); GL2AutomorphicRepresentationsAndTransfer §§R16.2.7, R16.2.11, R16.3.9 (newvectors and CDT types); GL2AutomorphicRepresentationsAndTransfer §R16.4 (global multiplicity and contragredients); GL2AutomorphicRepresentationsAndTransfer §§R16.6.5–R16.6.6 (conductor and weight-one comparisons); AutomorphicGaloisRepresentations §§3.7, 4.1–4.6, 6.12 (local compatibility); AutomorphicGaloisRepresentations §§5.1, 6.12 (ordinary lattice and quotient conditions); ClassFieldTheory Layers 11–12 (ray-class reciprocity and finiteness); ArithmeticLocallySymmetricSpaces §§ALS.0.1–ALS.0.9 (quotients and stabilizers). ArithmeticLocallySymmetricSpaces §§ALS.5b.5–ALS.5b.8 (cuspidal comparison). Earlier internal targets are specified individually in the Needs lines.

## Downstream consumers

The minimal weight-one theorem supplies finite-image and modularity consequences for deformation problems unramified at p; the coefficient-bundle theory supplies their exact vexing-type versions. The scalar theorem supplies the exceptional upper bound for the Jacobian multiplicity theory whose nonexceptional branch belongs to SerreWeightAndLevelOptimisation §§3.10–3.12. The Bianchi theorem supplies minimal, determinant-ε modularity lifting with torsion homology and the exact local multiplicity, rather than an assertion that every finite level has rank one. General positive-defect nonminimal lifting and arbitrary-rank complex patching consume these arithmetic examples without supplying any prerequisite here.

The mathematical contract is the README. Suggested.lean records which headline signatures can be expressed on the pinned carriers; the absent heavy arithmetic carriers are identified in its module docstring. The matrix, root, cusp and coefficient checks above are part of the mathematical specification, not substitute headline theorems.

## References

- **CG18.** Frank Calegari and David Geraghty, [Modularity lifting beyond the Taylor–Wiles method](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), Inventiones Mathematicae 211 (2018), 297–433. The published author copy fixes the numbering: §§3.1–3.9, pp. 310–354; §4.1, pp. 354–366; Lemma 4.14, pp. 366–368; §§5.1–5.5, pp. 368–382. Citations use cg18 and the line-numbered extraction of this edition. The source does not establish the variable-determinant scalar comparison, localized 3-primary stabilizer vanishing or integral principal-type model required by the corresponding general contracts.
- **CG20.** Frank Calegari and David Geraghty, [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Duke Mathematical Journal 169 (2020), 801–896. Lemma 8.14 and proof, published pp. 865–866, author-copy pp. 65–66, cg20 line 2540. This supplies the GL₂ individual ordinary-projection argument.
- **CG22.** Frank Calegari and David Geraghty, [Correction to: Modularity lifting beyond the Taylor–Wiles method](https://doi.org/10.1007/s00222-021-01095-5), Inventiones Mathematicae 227 (2022), 855–856. The formal-bracket correction is cited by its published locator; it does not supply the additional mathematical contracts.
