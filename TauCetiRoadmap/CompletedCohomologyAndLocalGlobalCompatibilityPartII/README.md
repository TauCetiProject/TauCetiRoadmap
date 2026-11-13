# Roadmap: completed cohomology and local–global compatibility, part II: patched modules and density in local deformation rings

**Summary.** Build arithmetic component detection for the general GL_d(F) patched module and deduce faithfulness of its unrestricted framed local deformation action. From this obtain Zariski density of crystalline lifts with regular weights varying, potentially crystabelline lifts with one regular weight fixed, and unramified degree-d induced supercuspidal lifts with that weight fixed. Further endpoints are benign density, density for every prescribed inertial type with varying regular weights, and fixed-weight minimal-stratum density. Crystalline and benign density hold at every prime through a local route; local faithfulness and the other densities use the patched module and assume p∤2d.

## Scope and ownership

This is Part II of CompletedCohomologyAndLocalGlobalCompatibility. The parent stops at construction of M∞, type-specialised testing and support on a union of components (§§5.1–5.3). This continuation owns the local component-detection argument, local faithfulness and the BIP density applications. General patching, fixed-centre projectivity and local–global compatibility remain with the parent §5.1–§5.2. Its §5.2a owns benign points and their open dense loci on crystalline components; these are imported, without a second construction here. Crystalline and benign density are proved at every prime by the local route of BIPD, through the parent's framed trianguline geometry and the rigid generic fibre of AdicSpacesPartIII §R2.9; the patched argument is a second route for p∤2d. PadicLocalLanglandsForGL2Qp §3.6a proves benign crystalline density in the framed space of two-dimensional representations of G_ℚ_p; §§5.2 and 6.1 here are the statements for arbitrary F and d.

Capture and algebraic capture belong with the parent §5.3, whose support argument already uses them. Their precise missing supplier interfaces are gap:capture-formalism and gap:algebraic-capture. Reduced O-flat faithful quotients for smooth tests on proper open subgroups of K extend the parent's type-specialised modules of §5.2 and are gap:smooth-test-quotients. The growth of coinvariants along a uniform power filtration is CompletedCohomologyPartII §5.8; grade, canonical dimension and global dimension of Iwasawa algebras are NoncommutativeAndEquivariantIwasawa §§F.1, 0.11, and the domain property for torsion-free groups is gap:torsion-free-iwasawa-domain at its §0.11. Layer 3 owns the continuous testing-module extension, smooth-family capture, fixed-centre detection, and the density of algebraic functions among locally analytic functions on the p-adic points of a smooth affine scheme and of algebraic matrix coefficients on a compact open subgroup of a split reductive group (§3.4); the one-variable Amice basis is PadicFunctionalAnalysis §4.4 and the algebraic Peter–Weyl decomposition ReductiveGroups §10D. SmoothRepresentationsOfLocalGroups §SR.5.2 already owns simple strata, simple characters and maximal distinguished cuspidal types; the three specific finite-coefficient families needed here are supplier gaps at that section. ReductiveGroups Layers 6 and 10B supply rational representations over the split coefficient field and complete reducibility. ArithmeticGaloisRepresentations §1.3 supplies continuous induction from open subgroups of profinite groups, with both Frobenius reciprocities and duality. PadicLocalLanglandsForGL2Qp §0.1 supplies the locally analytic function spaces of p-adic manifolds and analytic-vector density for general compact p-adic analytic groups, and CompletedCohomologyPartII §F.1 supplies the admissible Banach duality.

The completed group algebra and compact-module action are already in the pinned Tau Ceti. Kernel, annihilator and spectrum-closure facts are already in pinned Mathlib and are imported. The O-flatness, dimension and component-pair theorems for completed tensor products of coefficient rings are stated by LocalGaloisDeformationRings §F.0.1 and DeformationAndDerivedPatchingAlgebra §4.6; §2.1 applies them and adds only the determinant-torsion indexing. Eigenvariety companion/classicality routes of Ding, Newton–Thorne and Breuil–Hellmann–Schraen, and Pan’s modular-curve geometric route, lie outside this roadmap.

## Conventions

Fix F/ℚ_p finite, d≥1, a finite coefficient field L/ℚ_p with integers O, uniformizer ϖ and finite residue field k, and continuous ρ̄:G_F→GL_d(k). Enlarge L finitely to contain all embeddings of F and to make residual Jordan–Hölder factors absolutely irreducible; L then contains the values of every character of the torsion subgroup of F^×, in particular of every χ:μ_p∞(F)→O^×. The patched module M∞ is built over this O, and no later coefficient extension changes it. A fixed test or type may require a further finite coefficient extension; fields of definition in an infinite capturing family vary by member, using the coefficient-descent contract below. Write R=R□_ρ̄, X□=Spec R, G=GL_d(F), K=GL_d(O_F), and Z for its scalar centre. Let F₀ be the maximal unramified subfield, f=[F₀:ℚ_p] and q=p^f>1. Each family is indexed by a set of isomorphism classes in fixed universes. Compact modules are Hausdorff pseudo-compact modules, inverse limits of finite discrete modules, with continuous linear group actions. Their products carry product topology. Patching assertions retain p∤2d; crystalline and benign density (§§5.2, 6.1) and the simple-stratum definition hold at every prime.

An arithmetic point is a closed point of Spec R[1/p] mapped into Spec R. Its residue field is finite over L; the corresponding continuous local map R→O′ is then viewed in L′ for a finite L′/L. Density refers to the scheme spectrum Spec R, including the special fibre. Write (Spf R)^rig for the rigid generic fibre of AdicSpacesPartIII §R2.9, whose points are the arithmetic points. Crystalline and benign points are Zariski dense there as well, which is how §§5.2 and 6.1 are proved at every prime; fixed-weight density is not asserted in the rigid generic fibre (BIP Remark 6.10, p. 50, BIP lines 2495–2502). A subset of (Spf R)^rig is Zariski dense when the smallest Zariski-closed analytic subset containing it is the whole space; IYE Definition 5.8 (IYE lines 1012–1016) uses this closure. BIPD use instead the vanishing of every global rigid function that is zero on the subset (BIPD p. 1, BIPD lines 31–32). On a quasi-Stein space the function form implies the closed-set form, because a Zariski-closed analytic subset is the common zero locus of the global sections of its coherent ideal (quasi-Stein Theorem A, AdicSpacesPartIII §R3.4); the converse holds on a reduced space, where a function vanishing at every point is zero, and fails without reducedness. The rigid densities of §§5.2 and 6.1 are stated in the closed-set form; their passage to Spec R goes through the reduced Jacobson ring R□[1/p] (§5.2) and uses neither implication.

Use HT(ε)=−1 and decreasing regular labelled weights `k_{σ,1}>⋯>k_{σ,d}`. Put `a_{σ,i}=k_{σ,i}−(d−i)`. The algebraic factor πalg(k)=L_a^d⊗L has highest weight `−a_{σ,d+1−i}`. Use `r_p(π)=rec_p(π⊗|det|^{(1−d)/2})` and geometric Artin, sending a uniformizer to geometric Frobenius (CEGGPS §1.8, pp. 12–14, CEGGPS lines 460–535). ClassFieldTheory §2.6 and Layer 7 use arithmetic Artin and its inverse for geometric reciprocity. PadicHodgeTheory §3.6’s character convention is transported by this inversion. DPS Remark 5.14, p. 38, BIPD and IYE have HT(ε)=+1 and are sign-converted before comparison. The suppliers PadicHodgeTheory §§3.3–3.6 (PadicHodgeTheory §3.2) and LocalGaloisDeformationRings §§3.1, 3.4, 3.9 (its Conventions) also use HT(ε)=+1. A labelled weight k here is the supplier's labelled weight `(−k_{σ,d}>⋯>−k_{σ,1})`; Σ_k, the crystalline loci `R□,k_cr` and the fixed-type rings are the supplier objects for that negated tuple. A crystalline character with `ψ(Art_geom u)=∏_σ σ(u)^{n_σ}` on O_F× has labelled weights `−n_σ` here and `n_σ` for those suppliers, whose criterion `ψ(Art_arith u)=∏_σ σ(u)^{−h_σ}` (PadicHodgeTheory §3.6) gives `h_σ=n_σ`.

Write A^d=Hom_cont,O(A,O) for the Schikhof dual, with the compact/lattice topology of CompletedCohomologyPartII §§F.1, 3.2; use its biduality only for O-torsion-free modules. V* is the finite-dimensional contragredient. Π(M)=Hom_cont,O(M,L) has supremum norm and action (g·f)(m)=f(g⁻¹m). A central action δ⁻¹ on M gives δ on Π(M). The finite-Iwasawa/admissible-Banach equivalence is used on finite regular summands, with no assumption that M∞ itself is finite over O[[K]].

**Checks.**

- For d=2, k=(2,0) gives a=(1,0) and πalg highest weight (0,−1); k=(1,0) gives (0,0). The first pair distinguishes the dual from the undualised weight (1,0).
- For d=2, F=ℚ_5, ψ=1 and u=2, δ=(εψ)∘Art_geom has δ(2)=2; arithmetic Artin gives 1/2. For δ⁻¹ on M, (2·f)(m)=f(2⁻¹·m)=2f(m), pinning the contragredient sign as well.
- For d=1 and the trivial smooth character, r_p has twist exponent 0. For d=2 it is −1/2: on diag(ϖ_F,1) the twist factor is q^(1/2), whereas exponent +1/2 gives q^(−1/2). The factor is evaluated after the coefficient choice in CEGGPS §1.8; the normalized r_p is independent of that auxiliary choice.
- For d=2 and F=ℚ_p, the weight k=(1,0) here (a=(0,0), trivial algebraic factor) is the supplier pair {0,−1} of PadicHodgeTheory and LocalGaloisDeformationRings. Reading a supplier's (1,0) unconverted as a weight here would give k=(0,−1), a=(−1,−1) and the algebraic factor det, of highest weight (1,1). For ε itself, ε(Art_geom u)=u gives n=1: weight −1 here, +1 for those suppliers.
- For A=O[[x]]/(x²), (Spf A)^rig has the single point of A[1/p]=L[x]/(x²), which is Zariski dense in the closed-set form; the function x vanishes at that point and is not zero, so the function form needs reducedness.

## Exact supplier contracts

### From Mathlib

The following declarations are used at the pinned Mathlib revision.

- `Module.annihilator`, `Module.mem_annihilator`, `Module.comap_annihilator`, and `Module.annihilator_eq_bot` in `Mathlib/RingTheory/Ideal/Maps.lean`, lines 869, 871, 895, 901, supply annihilators, contraction and faithful actions. Contraction requires the algebra and scalar tower; the last equivalence requires a ring and an additive group.
- `LinearMap.ker` and `LinearMap.mem_ker` in `Mathlib/Algebra/Module/Submodule/Ker.lean`, lines 59–64, and `FaithfulSMul` in `Mathlib/Algebra/Group/Action/Faithful.lean`, line 47, supply the kernel and faithful-action vocabulary.
- `Submodule.mem_iInf` in `Mathlib/Algebra/Module/Submodule/Lattice.lean`, line 238, membership in an intersection of submodules, supplies the common kernel of §3.1.
- `PrimeSpectrum.zeroLocus`, `PrimeSpectrum.vanishingIdeal`, and `PrimeSpectrum.zeroLocus_eq_univ_iff` in `Mathlib/RingTheory/Spectrum/Prime/Basic.lean`, lines 137, 157, 302, and `PrimeSpectrum.zeroLocus_vanishingIdeal_eq_closure` in `Mathlib/RingTheory/Spectrum/Prime/Topology.lean`, line 159, supply the closed-set comparison. The vanishing ideal is the intersection of the primes, so nilpotents are invisible and zero vanishing ideal requires the arithmetic reducedness argument.
- `Algebra.FormallySmooth.iff_split_injection` in `Mathlib/RingTheory/Smooth/Basic.lean`, line 290: for a formally smooth algebra P and a surjection P→A with kernel I, A is formally smooth exactly when the conormal map I/I²→A⊗_P Ω_P is split injective. With P a polynomial ring over ℚ_p this is the Jacobian criterion used in §3.4.
- `HasStrictFDerivAt.toOpenPartialHomeomorph` in `Mathlib/Analysis/Calculus/InverseFunctionTheorem/FDeriv.lean`, line 118 (inverse function theorem over a nontrivially normed field, for a complete source space), and `OpenPartialHomeomorph.hasFPowerSeriesAt_symm` in `Mathlib/Analysis/Analytic/Inverse.lean`, line 657 (the inverse of such a local homeomorphism with a power series and invertible linear term has a power series). Over ℚ_p they give the analytic inverse function theorem used in §3.4.

### From Tau Ceti

The following declarations are used at the pinned Tau Ceti revision. Use `TauCeti.completedGroupAlgebra` in `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean`, line 145, and `TauCeti.IsCompactModule.completedGroupAlgebraModule` in the adjacent `Module.lean`, line 322, as the carrier and action for compact O[[H]]-modules. The latter takes the compact-module witness, compact topological coefficient ring and continuous commuting H-action; it supplies the completed action, rather than compact projectivity or the fixed-centre category. PadicMeasuresIwasawaAlgebras §1.7 uses this same carrier.


### From TauCetiRoadmap.CompletedCohomologyAndLocalGlobalCompatibility

§5.1, §5.2, §5.2a, §5.3. General GL_d(F) patched rings and M∞, projectivity of M∞ among pseudo-compact Λ[[K]]-modules, locally algebraic testing quotients, local–global compatibility, benign loci on every crystalline component, the framed trianguline variety and support as a union of components; the fixed-centre specialisation with its central sign requires gap:fixed-centre-specialisation, capture requires gap:capture-formalism and gap:algebraic-capture, reduced O-flat quotients for smooth tests on open subgroups of K require gap:smooth-test-quotients, and the local crystalline geometry at every prime requires gap:crystalline-closure-components and gap:local-benign-crystalline-points.

The benign predicate and componentwise open density are exactly the “Benign points and tangent spanning” paragraph of §5.2a (EP Definition 6.8 and Proposition 6.9, p. 368; NAK Lemma 4.2, pp. 120–122). The parent §5.1 retains its own suitable adequate CM globalisation contracts.

The capture contract is the two gaps below: gap:capture-formalism, the formal properties of capture in the compact continuous category, including tensor stability with a nonzero finite-dimensional W, which applies in particular to every nonzero smooth K-type (EP Corollary 3.2, p. 351, EP lines 618–621); and gap:algebraic-capture, capture by algebraic representations. The passage from O[[H]] to every projective uses gap:projective-products.

What CompletedCohomologyAndLocalGlobalCompatibility must provide (gap:fixed-centre-specialisation): Let Λ_Z act on M∞ by the transpose of its action on the Pontryagin dual of M∞, on which O[Z]⊂Λ_Z acts through the group, so that the element c∈Z of Λ_Z acts on M∞ as the group element c⁻¹; this action agrees with the action through `Λ_Z→R□_ρ̄→R∞`, `c↦(ε^{d(d−1)/2}det ρ^univ)(Art_F c)`, with geometric Art_F. Then for every continuous O-algebra map x_Z:Λ_Z→O, the group Z acts on `M∞⊗̂_{Λ_Z,x_Z}O` by `c↦x_Z(c)⁻¹` and on its Pontryagin dual by `c↦x_Z(c)`, and `M∞⊗̂_{Λ_Z,x_Z}O` is a nonzero projective object of the category of compact O[[K]]-modules on which Z∩K acts by `c↦x_Z(c)⁻¹`. Supplier section: §5.1. CEGGPS §4.22, p. 67, Proposition 4.23 and Corollary 4.26, pp. 68–70 (CEGGPS lines 2749–2765, 2774–2775, 2867–2884); BIP Lemma 6.6, p. 48 (BIP lines 2396–2412). The paragraph before CEGGPS Corollary 4.26 (CEGGPS lines 2867–2875) labels the compact category by ξ=x_Z and its smooth dual by ξ⁻¹; the transposition of CEGGPS §4.22 puts ξ⁻¹ on the compact side, as BIP Lemma 6.6 states.

What CompletedCohomologyAndLocalGlobalCompatibility must provide (gap:capture-formalism): For a compact group H with an open pro-p subgroup and a family (V_i) of finite-dimensional continuous L-representations of H, capture of a compact O[[H]]-module M is equivalent to the vanishing of the common kernel of all continuous H-maps M→V_i*; captured modules are O-torsion free; for O-torsion-free M, capture is equivalent to density of the evaluation map ⊕_i Hom_H(V_i,Π(M))⊗V_i→Π(M); a product is captured exactly when every factor is; capture of O[[H]] is equivalent to capture of every projective; a family of representations over finite extensions L_i of L captures M exactly when the family obtained by any further finite extension of each L_i does; and if (V_i) captures every projective and W≠0 is a finite-dimensional continuous representation, then (V_i⊗W) captures every projective. Supplier section: §5.3. EP Definition 2.1, Lemmas 2.2–2.5, 2.8 and 2.9, pp. 342–344, and Lemmas 2.14–2.17, pp. 346–347 (EP lines 266–319, 325–345, 404–442); W=0 is excluded as in the Check of §3.1, since EP Lemmas 2.6 and 2.9 fail for W=0. The vanishing of an endomorphism killed by every test (EP Lemma 2.7) follows from the first clause and is proved in §3.1.

What CompletedCohomologyAndLocalGlobalCompatibility must provide (gap:algebraic-capture): For an affine finite-type group scheme 𝐆 over ℤ_p whose generic fibre over L is split connected reductive, the irreducible rational representations of 𝐆_L, viewed on 𝐆(ℤ_p)⊂𝐆(L), capture every projective compact O[[𝐆(ℤ_p)]]-module. Supplier section: §5.3. EP Proposition 3.1, p. 351 (EP lines 612–617).

What CompletedCohomologyAndLocalGlobalCompatibility must provide (gap:smooth-test-quotients): For every compact open subgroup H of K, every irreducible algebraic ξ of `(Res_{F/ℚ_p}GL_d)_L` with K-stable lattice ξ° and every finite-dimensional smooth representation V of H over L with H-stable O-lattice Θ, the quotient of R∞ acting faithfully on M∞,H(ξ°⊗Θ) is reduced and O-flat, and at every closed point of its generic fibre, with image x in Spec R□_ρ̄[1/p], ρ_x is potentially semistable with the labelled Hodge–Tate weights attached to ξ in §1.1, `WD(ρ_x)|_{I_F}≅r_p(π)|_{I_F}` for some irreducible smooth π with Hom_H(V,π)≠0, and WD(ρ_x) has N=0 whenever every such π has N=0 on r_p(π). Supplier section: §5.2. EP proof of Theorem 5.3, p. 365 (EP lines 1204–1209), which takes this from part 1 of CEGGPS Lemma 4.17; CEGGPS Lemmas 4.17(1) and 4.18, pp. 62–66 (CEGGPS lines 2596–2615, 2650–2660); by the induction comparison of §3.2 the statement is the parent's §5.2(1) for the K-representation ξ⊗Ind_H^K V in place of a K-type σ(τ).

What CompletedCohomologyAndLocalGlobalCompatibility must provide (gap:crystalline-closure-components): For every finite F/ℚ_p, every prime p and every residual ρ̄, the Zariski closure of the regular crystalline points in the rigid generic fibre (Spf R□_ρ̄)^rig is a union of irreducible components, proved on the framed trianguline variety at benign points. Supplier section: §5.2a. IYE Proposition 5.10, pp. 26–27 (IYE lines 1023–1087), stated there under IYE’s standing assumption that ρ̄ is trivial (IYE line 224); its proof applies to every ρ̄ with absolutely irreducible Jordan–Hölder factors, as BIPD Theorem 3.3, p. 8, and the proof of BIPD Theorem 4.2, p. 10, use it (BIPD lines 349–354, 439); its inputs are the accumulation of crystalline points at benign points of the trianguline variety (IYE Proposition 5.9, line 1020) and gap:local-benign-crystalline-points.

What CompletedCohomologyAndLocalGlobalCompatibility must provide (gap:local-benign-crystalline-points): For every finite F/ℚ_p, every prime p, every residual ρ̄ and every regular labelled Hodge type k, every admissible open neighbourhood of every point of the framed crystalline rigid generic fibre (Spf R□,k_cr)^rig contains a point that is benign in the sense of §5.2a. Supplier section: §5.2a. NAK Lemma 4.2, pp. 120–122 (NAK lines 1356–1418), whose proof is local on the framed crystalline space and imposes no condition on p; used in this form in IYE line 1033 and BIPD lines 436–437.

### From TauCetiRoadmap.PadicHodgeTheory

§3.3, §3.4, §3.5, §3.6. Crystalline, potentially semistable and Weil–Deligne functors, coefficient change, labelled characters, and the crystalline-character lift matching both the residual character and the values on the torsion of G_F^ab, including its unramified factor. Its labelled weights use HT(ε)=+1 and arithmetic Artin; both are converted by the dictionary of the Conventions.

### From TauCetiRoadmap.LocalGaloisDeformationRings

§F.0.1, §1.1, §1.19, §3.1, §3.4, §3.9. From §F.0.1: the completed coefficient product ⊗̂_O of O-flat coefficient rings, its O-flatness and dimension formula, equal absolute dimension 1+Σd_i of every minimal-prime quotient when each factor is equidimensional, and the identification of its minimal components with tuples of factor components when every factor component is geometrically integral, compatibly with coefficient extension (BIP Lemma 6.3 and proof). From the other sections: the framed local point functor, character ring, Hodge and inertial types, reduced O-flat potentially crystalline quotients and equidimensional fixed-type generic fibres; unrestricted components require gap:framed-ring-components. Its Hodge types use HT(ε)=+1, so a weight k here is its type of negated weights, by the dictionary of the Conventions.

What LocalGaloisDeformationRings must provide (gap:framed-ring-components): For every finite F/ℚ_p and residual ρ̄, R□ is reduced, O-flat and equidimensional, and after finite coefficient extension its minimal-prime quotients are exactly the determinant-torsion rings R□,χ, each a geometrically integral normal domain. Supplier section: §1.1. BIP Corollary 3.38, p. 25 (BIP lines 1290–1301), and Corollaries 4.19, 4.21–4.22, pp. 39–40; geometric integrality in the proof of Lemma 6.3, p. 47 (BIP lines 1996, 2011, 2020, 2354–2359).

### From TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra

§1.12, §4.4, §4.6, §4.7. Completed tensor products, Jacobson generic fibres with finite closed-point residue extensions, the dimension dim A+dim B−1 of a completed tensor of reduced equidimensional O-flat factors with its component pairs under geometric integrality (§4.6), and reduced O-flat quotients detected by integral points (§4.7). Reducedness of the completed tensor and the existence of a geometric splitting extension are declared gaps.

What DeformationAndDerivedPatchingAlgebra must provide (gap:completed-tensor-reduced-equidimensional): For complete Noetherian local O-flat reduced factors with residue k and geometrically reduced generic fibres, their completed tensor over O is reduced; its O-flatness, equidimensionality and dimension dim A+dim B−1 are the statements of LocalGaloisDeformationRings §F.0.1 and DeformationAndDerivedPatchingAlgebra §4.6. Supplier section: §4.6. CEGGPS Corollary A.2, p. 83; HP Appendix A Lemma A.1, pp. 48–50; BIP proof of Lemma 6.3, p. 47 (CEGGPS lines 3322–3324; HP lines 2684–2685; BIP lines 2351–2353).

What DeformationAndDerivedPatchingAlgebra must provide (gap:geometric-component-splitting): For a complete Noetherian local O-flat algebra with residue k, a finite coefficient extension makes every minimal-prime quotient geometrically integral, meaning a domain after every further finite coefficient extension. Supplier section: §4.6. HP Appendix A Lemmas A.3–A.5, pp. 49–50; BIP proof of Lemma 6.3, p. 47 (HP lines 2711–2752; BIP lines 2354–2356).

### From TauCetiRoadmap.CompletedCohomologyPartII

§F.1, §F.2, §F.4, §3.2, §5.8. Schikhof duality, compact balanced tensors, qualified torsion-free biduality, admissible Banach–finite Iwasawa module anti-equivalence and locally ℚ_p-analytic vectors; from §5.8, for a torsion-free uniform U of dimension d>0 and a nonzero finitely generated k[[U]]-module N of canonical dimension δ, `dim_k N_{U^{p^r}}` is bounded above and below by positive multiples of `[U:U^{p^r}]^{δ/d}` (stated there for the invariants of the Pontryagin dual, which are dual to these coinvariants), for this power filtration only.

### From TauCetiRoadmap.NoncommutativeAndEquivariantIwasawa

§F.1, §0.11. Noetherianity of O[[H]] and k[[H]] for compact p-adic analytic H, the grade `j_R(N)=min{i : Ext^i_R(N,R)≠0}` over R=O[[H]] or k[[H]], with value +∞ on the zero module, and invariance of grade under restriction to an open subgroup (§F.1); for H without elements of order p and of dimension d, global dimension d of k[[H]] and d+1 of O[[H]], and canonical dimension `δ_R(N)=gldim(R)−j_R(N)` (§0.11). The domain property requires gap:torsion-free-iwasawa-domain.

What NoncommutativeAndEquivariantIwasawa must provide (gap:torsion-free-iwasawa-domain): For every torsion-free compact p-adic analytic group H and the integers O and residue field k of every finite extension of ℚ_p, the completed group algebras O[[H]] and k[[H]] have no zero divisors. Supplier section: §0.11. Ardakov–Brown §4.3, Theorem, p. 10 (AB lines 382–390), for ℤ_p and 𝔽_p coefficients: a torsion-free such H is pro-p, so these algebras are scalar local and noetherian, they are semiprime (AB §4.2, Theorem, p. 10, AB lines 368–373) and of finite global dimension (§0.11), and Walker's theorem applies; used for O and k in EP §2.5, p. 349 (EP lines 540–541).

### From TauCetiRoadmap.PadicLocalLanglandsForGL2Qp

§0.1. The general compact p-adic analytic group theorem that analytic vectors are dense in an admissible Banach representation, and the space LA(X,L) of locally ℚ_p-analytic functions on a locally ℚ_p-analytic manifold X with its locally convex topology from the Banach radius stages, restriction, analytic pullback, gluing over disjoint open covers, finite products and the analytic tensor comparison; only these general foundations are used, in §3.4.

### From TauCetiRoadmap.ClassFieldTheory

§2.6, Layer 7, Layer 9. Arithmetic Artin reciprocity, its geometric inverse, units and the torsion-free abelian Galois quotient, and Weil groups.

### From TauCetiRoadmap.ReductiveGroups

Layer 6, §10B, §10D. Complete reducibility in characteristic zero and rational simple representations of split reductive groups over L, with dominant highest weights and coefficient transport; from §10D, the algebraic Peter–Weyl decomposition `O(𝐆_L)=⊕_V V*⊗V`, `φ⊗v↦(g↦φ(gv))`, of the coordinate ring of a split connected reductive group in characteristic zero, used in §3.4.

### From TauCetiRoadmap.PadicFunctionalAnalysis

§4.3, §4.4. The analytic stages LA_h(ℤ_p,E) of functions analytic on the balls of radius p^(−h), polynomial density in each stage (§4.3), and Amice's orthonormal basis `⌊n/p^h⌋!·binom(x,n)` of each stage (§4.4); used for the several-variable polynomial density in §3.4.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

§SR.2.1, §SR.3.1, §SR.3.2, §SR.5.2. Smooth induction, Bernstein theory, shared Weil–Deligne objects, the classical GL_d correspondence of *classical-llc-normalization* (normalized there by arithmetic reciprocity; the gaps below state their Langlands clauses through the geometric normalization r_p of the Conventions), and maximal distinguished cuspidal types built from simple strata and simple characters; the three finite-coefficient type extensions are declared separately.

What SmoothRepresentationsOfLocalGroups must provide (gap:crystalline-inertial-types): For every inertial type τ, provide the nonzero finite-dimensional smooth K-type σ(τ), its finite coefficient model, and occurrence in an irreducible smooth π exactly when `r_p(π)|_{I_F}≅τ` and N=0 on r_p(π). Supplier section: §SR.5.2. CEGGPS Theorem 3.7, p. 41, and §3.13, pp. 48–49 (CEGGPS lines 1651–1663, 1950–1952).

What SmoothRepresentationsOfLocalGroups must provide (gap:principal-series-types): For n₀>d with the Iwahori-type subgroup `I_{n₀}` (unipotent upper triangular modulo `𝔭_F^{n₀}`) torsion free, every n with n−d+1≥n₀, and every tuple χ=(χ_1,…,χ_d) of smooth characters of `U_F^{n₀}` with χ_i of conductor n−i+1, the representation `Vχ=Ind_{T^{n₀}J_{n+1}}^{I_{n₀}}χ`, defined over a finite extension of L, is irreducible of dimension `[I_{n₀}:T^{n₀}J_{n+1}]`, is fixed by the congruence subgroup `K_{n+1}` and has no nonzero K_n-invariants, satisfies Vχ≇Vχ′ for χ≠χ′, and has `Hom_{I_{n₀}}(Vχ,π)≠0` for an irreducible smooth π exactly when π is an irreducible principal series `Ind_B^G ψ` with `ψ|_{T^{n₀}}=χ`. Supplier section: §SR.5.2. EP §3.3, Lemma 3.6, Proposition 3.7, Lemma 3.9 and proof of Lemma 3.10, pp. 352–354 (EP lines 657–746).

What SmoothRepresentationsOfLocalGroups must provide (gap:minimal-stratum-types): For an embedded degree-d extension E/F containing an element minimal over F, the hereditary order 𝔄 of the chain (𝔭_E^i) and integers m≥1 and n>2m, and for each α∈E minimal over F with v_E(α)=−n, the set C(m,α) of simple characters of `H^{m+1}(α)`, the representation η(θ) of `J^{m+1}(α)` and `V(α,θ)=Ind_{J^{m+1}(α)}^{U^{m+1}(𝔄)}η(θ)`, defined over a finite extension of L, satisfy: V(α,θ) is irreducible, fixed by `U^{n+1}(𝔄)`, without nonzero U^n(𝔄)-invariants, of dimension `[U^{m+1}(𝔄):J^{m+1}(α)]·dim η(θ)` with `(dim η(θ))²=[J^{m+1}(α):H^{m+1}(α)]`; `|C(m,α)|=[U_E^{m+1}:U_E^{[n/2]+1}]`; the number of isomorphism classes of such V(α,θ) at depth n lies between two positive constant multiples of q_E^n, independent of n, at every depth n for which a minimal element of valuation −n exists, and is zero at every other depth; and `Hom_{U^{m+1}(𝔄)}(V(α,θ),π)≠0` for an irreducible smooth π exactly when `π≅c-Ind_{E^×J^0(α)}^G Λ` for an irreducible Λ whose restriction to `H^{m+1}(α)` is a multiple of θ, which for tame E/F is equivalent to r_p(π) being `Ind_{W_E}^{W_F}ψ` with `ψ|U_E^{m+1}=θ|U_E^{m+1}`. Supplier section: §SR.5.2. EP Definition 3.17, p. 355, Lemma 3.18, pp. 355–356, and Proposition 3.19, p. 356, Lemmas 3.20–3.24, pp. 356–357, and Proposition 3.25, p. 358 (EP lines 783–916), with the count of Proposition 3.25 restricted to the depths at which a minimal element exists.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

§10.21, §10.26, §10.30. Supercuspidal parameters, full Weil–Deligne correspondence and its identification with the classical geometric normalization, transported to CEGGPS r_p.

### From TauCetiRoadmap.PadicMeasuresIwasawaAlgebras

Layer 1, §1.7. Continuous measures and the completed regular module on the pinned completed group algebra; the projective decomposition requires gap:projective-products.

What PadicMeasuresIwasawaAlgebras must provide (gap:projective-products): For a profinite group H with an open pro-p subgroup, every projective pseudo-compact O[[H]]-module is a product of indecomposable summands of the regular module, with the same statement in the fixed-central-character category using its completed regular quotient. Supplier section: Layer 1, §1.7. EP §2.1 and proof of Lemma 2.8, pp. 342–344, where the group is any profinite group with an open pro-p subgroup; BIP proof of Lemma 6.7, p. 49 (EP lines 261, 325–332; BIP lines 2435–2439). This is the generality of gap:capture-formalism, whose passage from O[[H]] to every projective uses it.

### From TauCetiRoadmap.ModularityAndLanglandsExtensions

§2.1. Potential diagonalizability, component criteria and coefficient transport; the universal crystalline lift requires gap:pd-crystalline-lift, and the regular crystalline lift with prescribed determinant requires gap:crystalline-lift-prescribed-determinant.

What ModularityAndLanglandsExtensions must provide (gap:pd-crystalline-lift): For every finite F/ℚ_p and continuous ρ̄:G_F→GL_d(k), after a finite coefficient extension there is a crystalline lift of regular labelled Hodge–Tate weights that is potentially diagonalizable. Supplier section: §2.1. EG Theorem 1.2.2, p. 3; Theorem 6.4.4(1), pp. 168–169 (EG lines 193, 6961–6965).

What ModularityAndLanglandsExtensions must provide (gap:crystalline-lift-prescribed-determinant): For every finite F/ℚ_p, every continuous ρ̄:G_F→GL_d(k) and every crystalline character ψ:G_F→O× lifting detρ̄, after a finite coefficient extension there is a crystalline lift of ρ̄ with regular labelled Hodge–Tate weights and determinant ψ. Supplier section: §2.1. BIPD Proposition 2.7, p. 7 (BIPD lines 281–313), by induction on Jordan–Hölder length from EG Theorem 6.3.2, p. 165 (EG lines 6816–6828), with the absolutely irreducible case BIPD Proposition 2.6 (BIPD line 243); no restriction on p or d.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

§1.3. Continuous induction from an open subgroup H of a profinite group Γ, for continuous representations on finite-dimensional vector spaces over a finite extension of ℚ_p: functions f with f(hx)=σ(h)f(x) under right translation, both Frobenius reciprocities, duality, the projection formula, and the homeomorphism with the finite product over a right transversal that identifies it with Mathlib's continuous coinduction. It applies to Γ=K=GL_d(O_F) and to nonsmooth continuous representations; §3.2 uses the same coset formula on the compact module M∞, where continuity is checked on the finitely many coordinates.

### From TauCetiRoadmap.AdicSpacesPartIII

§R2.9. Conrad's Berthelot-type generic-fibre functor on locally noetherian formal schemes over Spf O with finite-type reduction, which contains Spf R for every complete local Noetherian O-algebra R with residue field finite over k, and takes closed immersions to closed immersions; its point and component comparison requires gap:berthelot-points-components. From §R3.4: quasi-Stein spaces and Theorem A, global generation of coherent sheaves on them, used only to compare the two forms of rigid Zariski density in the Conventions.

What AdicSpacesPartIII must provide (gap:berthelot-points-components): For a complete local Noetherian O-algebra A with residue field finite over k, the points of (Spf A)^rig correspond bijectively to the maximal ideals of A[1/p], with canonical local maps inducing isomorphisms of completions, and when A is O-flat the irreducible components of (Spf A)^rig, with their reduced structures, are the images under the normalization map of the rigid generic fibres of the connected components of the normalization of Spf A. Supplier section: §R2.9. DEJ Lemma 7.1.9, p. 78 (DEJ lines 2553–2560); CON Theorem 2.3.1, pp. 500–501 (CON lines 1053–1070); applied in BIPD §3, p. 8, and Lemma 5.1, p. 11 (BIPD lines 329–339, 454–461).

## How to read the build

Layer 1 defines the arithmetic point sets and supplies the lift needed by the parent patching construction. Layer 2 separates determinant-torsion components and fixes the algebraic central character. Layer 3 imports capture, constructs continuous tests and proves fixed-centre detection and smooth-family capture. Layer 4 meets each local component and proves local faithfulness. Layer 5 proves crystalline density at every prime and converts capture into the patched densities. Layer 6 imports the parent benign loci and proves benign, prescribed-type and minimal-stratum density. Each gap named in a *Needs:* line is the exact additional theorem required of its named owner in Exact supplier contracts; a source citation alone does not supply it.


## Layer 1: Arithmetic points and patching inputs

The point predicates use general p-adic Hodge and Weil–Deligne carriers; the lift theorem enters through its named supplier gap.

### 1.1 Potentially semistable point sets

Let F/ℚ_p be finite, d≥1, L/ℚ_p a sufficiently large finite coefficient field with integers O and residue k, and ρ̄:G_F→GL_d(k) continuous, with absolutely irreducible Jordan–Hölder factors after the allowed coefficient enlargement. Put R=R□_ρ̄ and X=Spec R. Points mean kernels of O-algebra maps R→L′ for finite L′/L, equivalently closed points of Spec R[1/p], mapped into X. Label Hodge–Tate weights decreasingly, `k_{σ,1}>⋯>k_{σ,d}`; use HT(ε)=−1. Σcris consists of crystalline points of any regular labelled weight. Σ_k consists of potentially semistable points of the fixed regular weight k. Σprnc_k is its potentially crystabelline subset (crystalline after a finite abelian extension). Σspcd_k consists of those x∈Σ_k with N=0 and WD(ρ_x) irreducible, induced from a character of the Weil group of the unramified degree-d extension. Local Langlands uses CEGGPS `r_p(π)=rec_p(π⊗|det|^{(1−d)/2})`, with geometric Artin reciprocity. The algebraic test representation is πalg(ρ)=L_a^d⊗L for `a_{σ,i}=k_{σ,i}−(d−i)`; thus its highest weight is `−a_{σ,d+1−i}`. (BIP §6, p. 46, definitions preceding Theorem 6.1; CEGGPS §1.8, pp. 12–15; DPS Remark 5.14, p. 38; BIP lines 2286–2312; CEGGPS lines 460–535; DPS lines 1742–1765).

Use the local lifting-ring point functor, then define the subsets by the stated p-adic Hodge and Weil–Deligne conditions. Read weights through CEGGPS §1.8: the lattice L_a is dualised in πalg. Compare DPS Remark 5.14 only after reversing its HT(ε)=+1 convention. Factor out embeddings of residue fields: changing a field of definition preserves the underlying prime and the predicates.

The construction provides the following API.

- A finite coefficient extension carries each of the four sets to the corresponding base-changed set and preserves its point predicate.
- For x∈Σprnc_k, the Frobenius-semisimplified Weil–Deligne representation has N=0 and is a direct sum of characters of W_F. Under the normalized local Langlands correspondence its smooth representation has principal-series cuspidal support; the full induced principal series need not be irreducible.
- An irreducible induced Weil representation in Σspcd_k has N=0 and corresponds to a supercuspidal representation.
- The ordered weights k correspond to the dual of L_a, with `a_{σ,i}=k_{σ,i}−(d−i)`.
- Every arithmetic point avoids p and has residue field finite over L.

**Checks.**

- For d=1, regularity is vacuous; the unramified degree-one extension is F itself, so Σspcd_k=Σprnc_k=Σ_k.
- A semistable noncrystalline two-dimensional representation with N≠0 is in Σ_k for its regular weights but is in neither Σprnc_k nor Σspcd_k.
- For d=2 and weights (1,0) at each embedding, the test algebraic representation has highest weight (0,0).
- Two maps into finite extensions differing by a coefficient-field embedding define the same point and the same membership predicates.
- For d=2 and weights (2,0), a=(1,0) and the dual highest weight is (0,−1); using (1,0) would fail the dual convention.

*Needs:* LocalGaloisDeformationRings §1.1; PadicHodgeTheory §3.6; EndoscopicTransferAndUnitaryTraceComparison §§10.21, 10.26, 10.30; ClassFieldTheory Layer 7; ReductiveGroups Layers 6, 10B; PadicHodgeTheory §§3.3–3.5; LocalGaloisDeformationRings §3.1.

### 1.2 Potentially diagonalizable lift input

For every ρ̄ in the standing setup, use the crystalline regular potentially diagonalizable lift supplied by gap:pd-crystalline-lift after finite coefficient extension. For p∤2d this discharges the lift hypothesis in CompletedCohomologyAndLocalGlobalCompatibility §5.1, so its general patched-module construction applies to arbitrary ρ̄, subject to that section’s globalisation contracts. (EG Theorem 1.2.2, p. 3; Definition 6.4.2 and Theorem 6.4.4, pp. 168–169; BIP §6, p. 46, paragraph before Lemma 6.3; EG lines 193–200, 6961–6965; BIP lines 2329–2335).

Apply ModularityAndLanglandsExtensions §2.1 together with gap:pd-crystalline-lift, then import the parent §5.1 construction with its own globalisation hypotheses and suppliers. Finite coefficient extensions are faithfully flat, so the vanishing ideals of arithmetic point sets, and hence the densities, descend to O. Faithfulness (§4.2) is a statement about the module M∞ built over the coefficient ring of the Conventions; no coefficient extension of M∞ is used in proving it.

**Checks.**

- For d=1, a crystalline character is already diagonalizable: the direct-sum comparison has one summand.
- For a semisimple residual representation, CEGGPS Lemma 2.2 supplies regular induced-character lifts; this agrees with the universal lift contract.
- At p=d=3 the lift contract still applies, but p divides 2d=6: local faithfulness and the fixed-weight densities are outside their theorems, while §5.2 applies through its local route.

*Needs:* §1.1; ModularityAndLanglandsExtensions §2.1; gap:pd-crystalline-lift; CompletedCohomologyAndLocalGlobalCompatibility §5.1.

### Examples

In rank one, regularity is vacuous and Σspcd_k=Σprnc_k=Σ_k. A rank-two semistable noncrystalline Steinberg point has N≠0 and belongs to neither of the two potentially crystalline subsets.

### Dependencies

LocalGaloisDeformationRings §1.1; PadicHodgeTheory §3.6; EndoscopicTransferAndUnitaryTraceComparison §§10.21, 10.26, 10.30; ClassFieldTheory Layer 7; ReductiveGroups Layers 6, 10B; PadicHodgeTheory §§3.3–3.5; LocalGaloisDeformationRings §3.1; ModularityAndLanglandsExtensions §2.1; gap:pd-crystalline-lift; CompletedCohomologyAndLocalGlobalCompatibility §5.1.

## Layer 2: Components and central characters

Separate the selected local factor from all auxiliary factors. Geometric splitting is imposed before indexing components.

### 2.1 Patched deformation components

For the imported CEGGPS module and ring, R∞≅R□_ρ̄⊗̂_O A as R□_ρ̄-algebras, with A complete local noetherian, O-flat, reduced and equidimensional. Hence R∞ is reduced and O-flat. After finite coefficient enlargement making each A/𝔭 geometrically integral, its minimal primes are indexed bijectively by (χ,𝔭), where χ:μ_p∞(F)→O× and 𝔭∈Min(A). The associated component ring is R□,χ_ρ̄⊗̂_O A/𝔭; distinct pairs are distinct and contraction to R□_ρ̄ is its χ-component prime. Here R□,χ fixes the determinant on μ_p∞(F), not the whole determinant. The enlargement concerns the rings R∞⊗_O O′ only; M∞ is not changed, and the faithfulness argument of Layer 4 does not use it. (BIP Lemma 6.3, p. 47; Corollaries 4.19, 4.21–4.22 as supplier inputs; BIP lines 2339–2360; CEGGPS lines 3304–3324; HP lines 2680–2759).

Separate the selected p-place factor from the auxiliary local factors in the parent construction; absorb formally smooth variables in A. Apply LocalGaloisDeformationRings §F.0.1 and DeformationAndDerivedPatchingAlgebra §4.6 for O-flatness, dimension and component pairs, and gap:completed-tensor-reduced-equidimensional and gap:geometric-component-splitting for reducedness and the splitting extension, to the auxiliary Kisin rings. Import the BIP determinant-torsion component theorem from the local-ring owner. Geometric integrality identifies exactly the pairs of minimal primes under completed tensor product.

**Checks.**

- When A is geometrically integral there is one patched component over each χ.
- For A=O[[x]]/(x²−ϖ), A is a domain but after adjoining a root a²=ϖ it has two minimal primes (x−a) and (x+a); there are then two components over each χ.
- For A=O[[u,v]]/(uv), the two minimal-prime quotients O[[u]] and O[[v]] remain integral after coefficient extension, giving two components over each χ.
- Fixing χ does not fix the unramified determinant: in rank one over ℚ_p the unramified parameter remains a free variable.

*Needs:* §1.2; CompletedCohomologyAndLocalGlobalCompatibility §5.1; LocalGaloisDeformationRings §F.0.1; LocalGaloisDeformationRings §1.1; gap:framed-ring-components; LocalGaloisDeformationRings §3.4; DeformationAndDerivedPatchingAlgebra §1.12; DeformationAndDerivedPatchingAlgebra §4.6; gap:completed-tensor-reduced-equidimensional; gap:geometric-component-splitting.

### 2.2 Algebraic central character

Let ψ:G_F→O× be a crystalline lift of detρ̄ and `xψ:R_{detρ̄}→O` the corresponding point of the character ring `R_{detρ̄}` of LocalGaloisDeformationRings §1.19. On `Mψ=M∞⊗̂_{R_{detρ̄},xψ}O`, the group Z acts by `δ^{-1}`, where `δ=(ε^{d(d−1)/2}ψ)∘Art_F` for geometric Art_F, and Mψ is nonzero and projective among compact O[[K]]-modules on which Z∩K acts by `δ^{-1}`. Here twisting by `ε^{d(d−1)/2}` identifies `R_{detρ̄}` with the parent's central algebra Λ_Z of §5.1, the deformation ring of the character `ε^{d(d−1)/2}detρ̄` viewed on Z through Art_F (CEGGPS §4.22, p. 67, CEGGPS lines 2749–2758), and xψ with the point `x_Z:Λ_Z→O` with `x_Z(c)=δ(c)` for c∈Z, so `Mψ=M∞⊗̂_{Λ_Z,x_Z}O`. The Λ_Z-module structure of M∞ is the transpose of the action of Λ_Z on the Pontryagin dual of M∞, on which O[Z]⊂Λ_Z acts through the group (CEGGPS lines 2759–2765): the element c of Λ_Z acts on M∞ as the group element c⁻¹. Hence the group Z acts on Mψ by δ⁻¹ and on its Pontryagin dual and on Π(Mψ) by δ, as in the proof of BIP Lemma 6.6 (BIP lines 2409–2410). The parent §5.1 labels this specialisation as having compact central character `ξ=x_Z` and smooth-dual character ξ⁻¹, the labels printed before CEGGPS Corollary 4.26 (CEGGPS lines 2867–2875); by the transposition the group acts on the compact module by `x_Z⁻¹` and on its dual by x_Z. The statement consumed here, with this sign, is gap:fixed-centre-specialisation at x_Z: Mψ is nonzero and projective in the category with group character δ⁻¹. CEGGPS obtain it from the projectivity of M∞ among pseudo-compact Λ[[K]]-modules, since maps out of the specialisation in the fixed-character category are the Λ[[K]]-maps out of M∞ into objects of that category, and from topological Nakayama (CEGGPS Proposition 4.23 and Corollary 4.26 with proof, pp. 68–70, CEGGPS lines 2774–2775, 2876–2884). The restriction `δ|_{Z∩K}`, identified on O_F×, is the evaluation of an algebraic character θ of `(Res_{F/ℚ_p}G_m)_L`. The sign of θ is obtained by converting the arithmetic reciprocity convention of PadicHodgeTheory §3.6 to geometric reciprocity. (BIP Lemma 6.6, p. 48; CEGGPS §4.22 and Corollary 4.26, pp. 67–70; BIP lines 2396–2412).

Use gap:fixed-centre-specialisation at x_Z through the dictionary above; do not reconstruct the fixed-centre module. The product `ε^{d(d−1)/2}ψ` is crystalline. Apply the rank-one crystalline classification to its restriction through the geometric Artin map, obtained by inversion from the supplied arithmetic map. The algebraic exponents determine θ. Keep the inverse on Mψ and δ on its contragredient Banach dual.

**Checks.**

- For d=1 and ψ=1, the exponent d(d−1)/2 is 0, so δ=1.
- For d=2, F=ℚ_5, ψ=1 and u=2, geometric Artin gives δ(2)=2; arithmetic Artin would give 1/2.
- With δ(2)=2, the compact central action is 1/2 and the contragredient action on a functional is 2, since (2·f)(m)=f(2⁻¹·m)=2f(m).
- For d=1, F=ℚ_5 and ψ unramified with ψ(Art_F 5)=[2], the Teichmüller lift of 2, δ=ψ∘Art_F and x_Z(5)=[2], while the group element 5 acts on Mψ by [2]⁻¹=[3], since [2][3]=[6]=[1]. Reading x_Z as the group character on the compact module would give [2]; the transposition is what separates the two.

*Needs:* CompletedCohomologyAndLocalGlobalCompatibility §5.1; gap:fixed-centre-specialisation; LocalGaloisDeformationRings §1.19; PadicHodgeTheory §3.6; ClassFieldTheory Layer 7.

### Examples

For F=ℚ_p with p odd, μ_p∞(F)=1. A geometrically integral auxiliary ring therefore gives one patched component; adjoining √ϖ to the domain O[[x]]/(x²−ϖ) instead gives two auxiliary components.

### Dependencies

§1.2; CompletedCohomologyAndLocalGlobalCompatibility §5.1; LocalGaloisDeformationRings §F.0.1; LocalGaloisDeformationRings §1.1; gap:framed-ring-components; LocalGaloisDeformationRings §3.4; DeformationAndDerivedPatchingAlgebra §1.12; DeformationAndDerivedPatchingAlgebra §4.6; gap:completed-tensor-reduced-equidimensional; gap:geometric-component-splitting; ClassFieldTheory Layer 7; gap:fixed-centre-specialisation; LocalGaloisDeformationRings §1.19; PadicHodgeTheory §3.6.

## Layer 3: Capture and algebraic testing

Use the parent capture interface once. Continuous tests extend its locally algebraic tests; fixed-centre detection only needs one nonzero algebraic test.

### 3.1 Capture and scalar actions

Import capture and algebraic capture from CompletedCohomologyAndLocalGlobalCompatibility §5.3 via gap:capture-formalism and gap:algebraic-capture. For compact H with an open pro-p subgroup, a family (V_i) captures a compact pseudo-compact O[[H]]-module M precisely when the common kernel of all continuous equivariant maps M→V_i* is zero. Prove here that if (V_i) captures M, a continuous O[[H]]-endomorphism φ of M with f∘φ=0 for every continuous H-map f:M→V_i* and every i is zero (EP Lemma 2.7, p. 344, EP lines 320–324). In particular, if a commuting scalar kills every test, it kills M; when the R-action on M is faithful it is zero. This scalar consequence is used on the actual M∞ testing modules. (EP Definition 2.1 and Lemmas 2.2–2.5, 2.7–2.8, pp. 342–344; EP lines 266–354, 612–621).

A vector in the image of an endomorphism killed by every testing map belongs to their common kernel, which is zero by the kernel characterisation of capture in gap:capture-formalism; so the endomorphism is zero. Apply this to scalar endomorphisms. Algebraically the same calculation uses Mathlib `Submodule.mem_iInf`, `LinearMap.mem_ker` and `Module.annihilator_eq_bot`; it is a consequence of the supplied kernel and annihilator APIs.

**Checks.**

- For H={1}, the trivial representation L captures M=O, since the inclusion O→L has zero kernel.
- The empty family captures M exactly when M=0; its common kernel is M.
- For M=O/ϖ≠0 all maps to every V_i* vanish, so even the family of all characteristic-zero representations fails to capture M.
- For a cyclic group H of order prime to p and a nontrivial O-valued character χ, the trivial representation alone does not capture the rank-one compact module O(χ).
- For R=ℤ/4 acting on M=ℤ/2, the nonzero scalar 2 kills M; only zero action, rather than zero scalar, follows without faithfulness.
- For H={1}, the family {L} and M=O⊕O/ϖ, which is not captured, the endomorphism φ(a,b)=(0, a mod ϖ) is nonzero while f∘φ=0 for every f:M→L, since f kills the torsion summand; the endomorphism statement needs capture.
- For H={1}, M=O and W=0, the tensor test family has common kernel O≠0; W≠0 is required in tensor stability.

*Needs:* CompletedCohomologyAndLocalGlobalCompatibility §5.3; gap:capture-formalism; gap:algebraic-capture; gap:projective-products; CompletedCohomologyPartII §§F.1, 3.2; Mathlib `LinearMap.ker`, `LinearMap.mem_ker`, `Submodule.mem_iInf`, `FaithfulSMul`, `Module.annihilator_eq_bot`.

### 3.2 Patched testing modules

For a compact open H⊆K, finite-dimensional continuous H-representation V over L and H-stable O-lattice Θ, extend the parent testing construction to M∞,H(Θ)=(Hom_cont,O[[H]](M∞,Θ^d))^d, using Schikhof duals. This is a finite R∞-module. Its rational version M∞,H(V)=M∞,H(Θ)[1/p] is canonically independent of Θ. It is contravariantly tested against V* and its continuous L-linear dual is Hom_H(V,Π(M∞)); scalar actions are by precomposition. For σ=πalg(k)⊗σ(τ) at H=K this is the existing parent type-specialised module, not a new type-theory object. (BIP §6, p. 48, paragraphs after Lemma 6.6; EP proof of Proposition 2.11, p. 345; Theorem 5.3 and proof, p. 365; CEGGPS §1.8, p. 15; Lemma 4.18, pp. 65–66; BIP lines 2413–2421; EP lines 369–377, 1202–1209).

Restrict the finite R∞[[K]] presentation to H, which has finite index, so it remains finite over R∞[[H]]. The right action on Θ is v·g=g⁻¹v. Identify the displayed double dual with the completed balanced tensor `Θ⊗̂_{O[[H]]}M∞`. A finite presentation makes it a quotient of finitely many copies of R∞⊗_OΘ, proving finiteness. Compare commensurable lattices after inverting p and use torsion-free biduality for the Hom adjunction. Frobenius reciprocity and duality for continuous induction from the open subgroup H (ArithmeticGaloisRepresentations §1.3) compare H-tests with induced K-tests: a continuous H-map φ:M∞→V* gives the K-map m↦(x↦φ(xm)) into Ind_H^K V*≅(Ind_H^K V)*, continuous because the induced module carries the finite product topology over a transversal. Reduced O-flat faithful quotients come from arithmetic, not from finiteness: for algebraic and type-specialised K-tests from CompletedCohomologyAndLocalGlobalCompatibility §5.2, and for smooth tests on an open subgroup H from gap:smooth-test-quotients.

The construction provides the following API.

- Two stable lattices give canonically isomorphic rational testing modules, compatibly with third-lattice comparison.
- The continuous rational dual identifies with Hom_H(V,Π(M∞)), respecting R∞ actions.
- Finite direct sums of V give the corresponding direct sums of testing modules.
- A scalar a annihilates the rational testing module M∞,H(V) exactly when precomposition by a kills every continuous H-map M∞→V*.
- For finite-index H⊆K, testing V on H agrees with testing Ind_H^K V on K, by the finite-index Frobenius adjunction.
- For the finite integral test, nonzero characteristic-zero fibre at y is equivalent to a nonzero V-map into Π_y; coefficient extension to κ(y) is understood.
- At H=K and V=πalg(k)⊗σ(τ), this construction agrees canonically with CompletedCohomologyAndLocalGlobalCompatibility §5.2.

**Checks.**

- V=0 gives zero integral and rational testing modules.
- For the model M=O[[H]] and Θ=O with trivial action, the testing module is O via augmentation; its rational version is L.
- Replacing Θ by ϖΘ leaves the rational module unchanged, although the canonical integral lattice map is multiplication by ϖ.
- For the model M=O/ϖ and Θ=O with trivial H, the testing module is zero; it does not recover the nonzero torsion module.
- For M=O[[K]], [K:H]=n and dim_L V=r, Hom_H(M,V*) and Hom_K(M,(Ind_H^K V)*) both have L-dimension nr. Taking n=2 and r=1 gives 2 on both sides; forgetting cosets gives 1.
- For d=1, F=ℚ_5, K=ℤ_5^×, H=1+5ℤ_5 of index 4 and the continuous character χ(u)=u of H, which is nontrivial on every open subgroup and so not smooth, Ind_H^K χ has dimension 4 with the product topology of L⁴, and for M=O[[K]] both Hom_H(M,χ*) and Hom_K(M,(Ind_H^K χ)*) have dimension 4; smooth induction would not apply.
- For H=K the induction comparison is the identity, with n=1 and both dimensions r.
- For the model H=1, B=O[[x]] acting on M=B/(x²) and Θ=O: M is free of rank two over O=O[[H]], hence compact projective, and finite over B; its test is M itself by torsion-free biduality, and Ann_B(M)=(x²). The faithful testing quotient B/(x²) has x²=0 but x≠0, so finiteness and compact projectivity do not give reducedness; that comes only from the arithmetic theorems of the parent §5.2 and gap:smooth-test-quotients.

*Needs:* CompletedCohomologyAndLocalGlobalCompatibility §5.1; CompletedCohomologyAndLocalGlobalCompatibility §5.2; gap:smooth-test-quotients; CompletedCohomologyPartII §3.2; SmoothRepresentationsOfLocalGroups §SR.2.1; §3.1; ArithmeticGaloisRepresentations §1.3; CompletedCohomologyPartII §F.2.

### 3.3 Capture by smooth types

Use the type-theory supplier for the EP families: principal-series Vχ on a sufficiently small torsion-free Iwahori subgroup I_n0, and minimal-stratum V(α,θ) on `H=U^{m+1}(𝔄)` for an embedded degree-d extension E/F containing a minimal element, m sufficiently large that H is torsion free. In the principal family characters have pairwise separated conductors as in EP §3.3; in the supercuspidal family take all distinct isomorphism classes for all n>2m, v_E(α)=−n and θ∈C(m,α). Each family captures every compact projective over its H. Tensoring it with the nonzero fixed algebraic factor πalg(k)|_H preserves capture. Family members have finite fields of definition over L individually, interpreted through the imported coefficient-descent interface. The criterion behind these capture statements is stated here as well: for torsion-free compact p-adic analytic H with a filtration (H_n) as below, a closed H-stable subspace Π of C(H,L), with the translation action, satisfying `dim_L Π^{H_n}∼[H:H_n]` is all of C(H,L). (EP Lemma 2.22, pp. 349–350; EP §2.5, Proposition 2.23, pp. 349–350; §3.3, Proposition 3.11, p. 354; §3.4, Proposition 3.26, p. 358; EP lines 532–607, 657–748, 783–850, 917–928).

Import the actual induced representations, hereditary-order filtration and simple-character intertwiners from the gap:minimal-stratum-types and gap:principal-series-types. Use EP Proposition 2.23 on the torsion-free compact p-adic analytic subgroup H: let (H_n) be a neighbourhood basis of open normal subgroups, with one uniform pro-p member H_n₀ such that for every integer j≥1 some H_n equals (H_n₀)^(p^j). For pairwise nonisomorphic smooth absolutely irreducible V_i, the growth `Σ_i(dim V_i^{H_n})²∼[H:H_n]` implies capture. Here ∼ means bounded above and below by positive constants, as used in EP. If dim H=0, compactness and torsion-freeness give H={1}; the positive lower growth bound forces Π=L=C(H,L), so this case uses no dimension quotient. For dim H>0 the criterion rests on three inputs. (a) Coinvariant growth: for a nonzero finitely generated k[[H_n₀]]-module N of canonical dimension δ, `dim_k N_{(H_n₀)^{p^j}}` lies between positive multiples of `[H_n₀:(H_n₀)^{p^j}]^{δ/dim H}` (EP Proposition 2.18, pp. 347–348, EP lines 463–519; CompletedCohomologyPartII §5.8); canonical dimension does not change between H and its open subgroups, by the finite-index grade invariance of NoncommutativeAndEquivariantIwasawa §F.1 and the global dimensions of its §0.11. (b) As H is torsion free, k[[H]] is a domain (gap:torsion-free-iwasawa-domain); a finitely generated N has canonical dimension dim H exactly when its grade is 0, that is Hom(N,k[[H]])≠0, so a cyclic module k[[H]]/I of canonical dimension dim H has I=0, a nonzero left ideal of a domain having zero right annihilator (EP Lemma 2.21, p. 349, EP lines 542–551). (c) For the closed-subspace criterion, the Schikhof dual Θ^d of the unit ball Θ of Π is an O-torsion-free cyclic quotient of O[[H]] (CompletedCohomologyPartII §F.1); `(Θ^d/ϖ)_{H_n}` is dual to `(Θ/ϖ)^{H_n}`, whose dimension is at least `dim_L Π^{H_n}` and at most [H:H_n]. By (a) Θ^d/ϖ has canonical dimension dim H, by (b) k[[H]]→Θ^d/ϖ is an isomorphism, and topological Nakayama with O-torsion-freeness gives Θ^d=O[[H]], so Π=C(H,L) (EP Lemma 2.22, EP lines 558–577). For the smallest quotient M of O[[H]] with the same tests, `Π(M)^{H_n}` contains `⊕ V_i⊗V_i^*` over the finitely many V_i fixed by H_n, so its dimension is at least `d(n)=Σ_i(dim V_i^{H_n})²`, and (c) gives M=O[[H]] (EP proof of Proposition 2.23, EP lines 586–607). Principal-series counts are EP Lemma 3.10 and Proposition 3.11. For the simple types take `H_n=U^{n+1}(𝔄)`; by Lemma 3.20 d(n) is the sum, over all depths n′≤n, of the squared dimensions of the classes of depth n′. Classes exist only at admissible depths, those n′ for which E contains a minimal element of valuation −n′; for e(E/F)>1 every n′ not prime to e(E/F) is excluded. Admissible depths have bounded gaps: if α₀ is minimal of valuation −n₀<0 (the inverse of a minimal element is minimal), then α₀^j is minimal of valuation −jn₀ for every j≥1 with j≡1 modulo e(E/F)(q_E−1) (EP Lemma 3.16, p. 355); for unramified E every depth is admissible, through `ϖ_F^{−n}ξ` with ξ a unit of generating residue. At an admissible depth n′ the classes of depth n′ contribute between positive multiples of `[H:U^{n′+1}(𝔄)]`, by Lemma 3.21 and the count of gap:minimal-stratum-types. Hence d(n) is at least the contribution of the largest admissible n′≤n, which lies a bounded distance below n, so that `[H:U^{n′+1}(𝔄)]` is at least a fixed positive fraction of `[H:U^{n+1}(𝔄)]`; and d(n)≤[H:H_n], since pairwise nonisomorphic absolutely irreducible representations of H/H_n have squared dimensions summing to at most its order. This gives `d(n)∼[H:H_n]`, the input of Proposition 3.26 (EP lines 917–928), whose proof uses the per-depth estimate of Proposition 3.25 at every depth. Apply nonzero tensor stability to πalg(k). Restriction of the parent projective module to finite-index H remains projective.

**Checks.**

- For the principal-series family, dim Vχ grows as q^(n d(d−1)/2) and the number of characters as q^(nd), so the sum of squared dimensions grows as q^(nd²), matching [I_n₀:K_n₊₁].
- For d=1 this becomes 1²·q^n=q^n; repeating just the trivial character cannot give the required q^n distinct classes.
- The algebraic tensor factor has positive dimension. Tensoring with 0 yields no detecting maps and is excluded.
- For F=ℚ_5, d=2 and E=ℚ_5(√5), e(E/F)=2: no element of even valuation is minimal, so there are no simple-type classes of even depth n>2m, whereas EP Proposition 3.25 as printed asserts about q_E^n>0 of them. The odd depths are admissible, with gap 2, and at even n the sum d(n) contains the contribution of depth n−1, at least a fixed positive fraction of `[H:U^{n+1}(𝔄)]` because `[U^n(𝔄):U^{n+1}(𝔄)]=#(𝔄/𝔓)` is constant.
- For H={1}, every H_n={1} and [H:H_n]=1. The subspace Π=L has invariant dimension 1 and satisfies the lower bound, whereas Π=0 has dimension 0 and fails it; no expression 0/0 is used.
- For H=ℤ_p, H_n=p^nℤ_p and Π the functions factoring through ℤ_p/p^jℤ_p for a fixed j, `dim_L Π^{H_n}=p^j` for n≥j while [H:H_n]=p^n; the closed-subspace criterion does not apply, and indeed Π≠C(H,L).
- For H=ℤ_p×ℤ/p, which has p-torsion, `k[[H]]≅k[[T]][s]/(s^p)` with s=σ−1 has zero divisors, and the cyclic module k[[H]]/(s)≅k[[T]] has canonical dimension 1=dim H, computed on the open subgroup ℤ_p, without being free: its k[[T]]-rank is 1, not a multiple of p. Torsion-freeness is needed in (b).
- For H=ℤ_p² and the cyclic k[[H]]-module k[[ℤ_p]] acted on through the second factor, the filtration p^nℤ_p⊕p^(2n)ℤ_p gives coinvariant dimension p^(2n) and index p^(3n), whereas the dimension-ratio prediction is p^(3n/2). An arbitrary anisotropic filtration cannot replace the specified power-compatible one (EP Remark 2.19, pp. 348–349, EP lines 520–529).

*Needs:* §3.1; gap:capture-formalism; SmoothRepresentationsOfLocalGroups §SR.2.1; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.2, SR.5.2; PadicMeasuresIwasawaAlgebras Layer 1; CompletedCohomologyPartII §§F.1, 5.8; NoncommutativeAndEquivariantIwasawa §§F.1, 0.11; gap:torsion-free-iwasawa-domain; gap:principal-series-types; gap:minimal-stratum-types.

### 3.4 Fixed-centre algebraic density

Two statements on algebraic functions come first. (a) Let X be a smooth affine ℚ_p-scheme of finite type, with X(ℚ_p) its locally ℚ_p-analytic manifold of points, and let U⊆X(ℚ_p) be open and closed. Then the restrictions to U of the elements of `Γ(X,O_X)⊗_{ℚ_p}L` form a dense subspace of LA(U,L), the locally ℚ_p-analytic L-valued functions on U with the locally convex topology of PadicLocalLanglandsForGL2Qp §0.1 (DPS Lemmas 7.2–7.3, Theorem 7.4 and Corollary 7.5, pp. 40–42, DPS lines 1847–1933). DPS assume in addition that X(ℚ_p) is Zariski dense in X; their density argument does not use that assumption, and it is not made here. (b) Let 𝐆/ℚ_p be connected reductive and split over L, and H⊆𝐆(ℚ_p) compact open, acting on LA(H,L) by left translation. The evaluation map `⊕_V Hom_H(V,LA(H,L))⊗V→LA(H,L)`, over the irreducible algebraic representations V of 𝐆_L restricted to H, has image the restrictions to H of the regular functions of 𝐆_L; by (a) for X=𝐆 and U=H its image is dense (DPS Corollary 7.6, p. 42, DPS lines 1934–1949, which also proves the map injective; injectivity is not used here).

Let 𝐆/ℚ_p be connected reductive and split over L, Z its centre and H⊆𝐆(ℚ_p) compact open. Let T≠0 be a finite-dimensional continuous L-representation of H whose central character restricts to δ:H∩Z(ℚ_p)→O×. Put Z_H=H∩Z(ℚ_p) and define `Cδ(H,L)={f∈C(H,L) : f(zh)=δ(z)^{-1}f(h) for all z∈Z_H, h∈H}`, a closed subspace of C(H,L) with the supremum norm and left translation `(g·f)(h)=f(g^{-1}h)`; thus z∈Z_H acts on it by δ(z). For H=K it is Π of the fixed-centre regular module `O[[K]]⊗̂_{O[[Z∩K]],δ^{-1}}O`, on which Z∩K acts by δ⁻¹, as used in §3.5 (DPS, paragraph before Corollary 7.8, p. 43, DPS lines 1981–1984; BIP proof of Lemma 6.7, BIP lines 2436–2439). If Π is an admissible unitary Banach representation that is a continuous H-equivariant direct summand of Cδ(H,L)^m, m≥1, then the images of Hom_H(T⊗ξ′,Π^la)⊗(T⊗ξ′), for ξ′ irreducible algebraic representations of (𝐆/Z)_L, span a dense subspace of Π^la. They also span a dense subspace of Π, using density of locally analytic vectors in an admissible Banach representation. All analytic vectors here are locally ℚ_p-analytic. (DPS Theorem 7.4 and Corollaries 7.5–7.8, pp. 41–43; BIP proof of Lemma 6.7, p. 49; DPS lines 1981–1997).

For (a), first take X=𝔸^n. By gluing over a disjoint cover of ℚ_p^n by compact open balls (PadicLocalLanglandsForGL2Qp §0.1), LA(ℚ_p^n,L) is the product of the spaces on the balls with the product topology, so it suffices to approximate on a finite union of balls; that union is open and closed in some `p^{−m}ℤ_p^n`, which an affine change of coordinates, preserving polynomials, moves onto ℤ_p^n. On ℤ_p^n the stage of functions analytic on every ball of radius `p^{−h}` is the completed tensor product of n one-variable stages (finite products and the analytic tensor comparison of PadicLocalLanglandsForGL2Qp §0.1), so the products of the one-variable Amice polynomials `⌊k/p^h⌋!·binom(x_i,k)` of PadicFunctionalAnalysis §4.4 form an orthonormal basis of it and polynomials are dense in every stage (Amice's theorem, DPS line 1900). Each stage maps continuously into LA, so polynomials are dense in LA(ℤ_p^n,L), and restriction to an open and closed subset is a continuous surjection (DPS Lemma 7.2), which carries dense subspaces to dense subspaces; with the product decomposition this gives density in LA(ℚ_p^n,L). For general X, fix a closed immersion X↪𝔸^n with ideal I. At x∈X(ℚ_p) the Jacobian criterion (Mathlib `Algebra.FormallySmooth.iff_split_injection` for the polynomial ring over ℚ_p) gives f_1,…,f_r∈I with linearly independent differentials at x which, by Nakayama, generate I on a Zariski neighbourhood of x; the analytic inverse function theorem (Mathlib `HasStrictFDerivAt.toOpenPartialHomeomorph` and `OpenPartialHomeomorph.hasFPowerSeriesAt_symm`) makes X(ℚ_p) near x a coordinate subspace in analytic coordinates, with an analytic retraction. Since every open cover of ℚ_p^n has a disjoint open refinement and X(ℚ_p) is closed, restriction LA(ℚ_p^n,L)→LA(X(ℚ_p),L) is a continuous surjection carrying polynomials onto the restrictions of Γ(X,O_X)⊗L (DPS proof of Theorem 7.4, DPS lines 1858–1870, 1912–1928); then restrict to U. For (b), an H-map φ:V→LA(H,L) is determined by ℓ=ev_1∘φ∈V*, through φ(v)(h)=ℓ(h⁻¹v), and every ℓ∈V* defines one; so the image is spanned by the functions h↦ℓ(h⁻¹v). The algebraic Peter–Weyl decomposition `O(𝐆_L)=⊕_V V*⊗V` of ReductiveGroups §10D, composed with the inversion of 𝐆_L, shows that these functions span O(𝐆_L), and H, an open subgroup, is open and closed in 𝐆(ℚ_p).

For the fixed-centre statement, apply (b) to 𝐆/Z, connected reductive and split over L, and to H/Z_H, identified with the compact open image of H in (𝐆/Z)(ℚ_p) (DPS proof of Corollary 7.8, DPS lines 1993–1997). Tensor by T*; the projection formula `Cδ(H,L)⊗T*≅C(H/(H∩Z),L)^{dim T}` removes the central character, and the locally analytic vectors of C(H/Z_H,L) under translation are LA(H/Z_H,L) (CompletedCohomologyPartII §F.4; DPS line 1961). Pass to the continuous direct summand. The closure W of the evaluation image in Π^la is the smallest closed subspace with Hom_H(T⊗ξ′,W)=Hom_H(T⊗ξ′,Π^la) for every ξ′; hence W⊗T* contains the evaluation image for Π^la⊗T* and the representations ξ′, which is dense by (b) on a direct summand of finitely many copies of LA(H/Z_H,L), so W=Π^la as T≠0 (DPS proofs of Corollaries 7.7–7.8, DPS lines 1961–1978, 1993–1997). The PadicLocalLanglandsForGL2Qp §0.1 analytic-vector-density theorem gives density in Π; this additional implication is explicit.

**Checks.**

- For the trivial reductive group 𝐆=H={1}, Π=L and T=L^r with r>0, evaluation Hom_L(T,L)⊗T→L sends e₁*⊗e₁ to 1, so its image is L. For T=0 it is 0.
- For 𝐆=𝔾_m over ℚ_5, H=Z_H=ℤ_5^×, δ(z)=z and T=δ, the quotient 𝐆/Z is trivial, so ξ′ is the trivial representation only. For Π=Cδ(H,L), the line of h↦h⁻¹, `Hom_H(T,Π)⊗T→Π` is an isomorphism of lines. The trivial representation Π=L is admissible and unitary but is not a summand of any Cδ(H,L)^m, since 2 acts on it by 1 and not by δ(2)=2; there `Hom_H(T,Π)=0` and the image is 0, not dense, so the direct-summand hypothesis cannot be dropped.
- In (a) for X=𝔸¹ and U=ℤ_p, the polynomials `1−x^{(p−1)p^n}` converge in LA(ℤ_p,L), already in the stage of functions analytic on the balls of radius p^(−1), to the indicator function of pℤ_p. On a ball a+pℤ_p with a a unit, x=a+pt gives `x^{p−1}=1+pg(t)` with g of Gauss norm at most 1, and `v_p(binom(p^n,k)p^k)≥n+1` for k≥1, so `x^{(p−1)p^n}−1` has Gauss norm at most p^(−n−1); on pℤ_p, `x^{(p−1)p^n}` has Gauss norm p^(−(p−1)p^n). No polynomial equals the indicator, which vanishes on the infinite set ℤ_p^× without being zero: (a) asserts density, not equality.
- In (a) for X the disjoint union of 𝔸¹ and Spec ℚ_p(√u), with u∈ℤ_p^× not a square in ℚ_p, X(ℚ_p)=ℚ_p is not Zariski dense in X, and the regular functions restrict onto L[x] on ℚ_p, which is dense by the case 𝔸¹. For X=Spec ℚ_p(√u) alone, X(ℚ_p) is empty and both sides are 0.
- In (b) for 𝐆=𝔾_m, H=ℤ_p^× and V the character z↦z^n, `Hom_H(V,LA(H,L))` is the line of maps v↦(h↦h^(−n)v), and the total image is L[h,h⁻¹] restricted to H. The map v↦(h↦h^n v) is not H-equivariant for n≠0: left translation by g multiplies h↦h^n by g^(−n), not by g^n. This pins the inverse in φ(v)(h)=ℓ(h⁻¹v).
- In (b) for 𝐆=GL₂ and H=GL₂(ℤ_p), the characters det^n alone give only functions of det, which lie in the closed subspace of functions invariant under right translation by SL₂(ℤ_p); the regular function h↦h₁₁ is not, as it takes the value 0 at the rotation (0,1;−1,0) of SL₂(ℤ_p) and 1 at the identity. All irreducible V are needed.
- For Π=0 the evaluation image and both target spaces are 0.
- If Z_H=1, then Cδ(H,L)=C(H,L) with its left translation action.
- For H=Z_H=ℤ_5^× and δ(z)=z, every f in Cδ(H,L) satisfies f(h)=h⁻¹f(1), so Cδ(H,L) is the line spanned by h↦h⁻¹, and (2·f)(h)=f(2⁻¹h)=2h⁻¹=2f(h): the central element 2 acts by δ(2)=2. The opposite condition f(zh)=δ(z)f(h) would give the line of h↦h, on which 2 acts by 1/2.
- For the same H and δ, the constant function 1 is not in Cδ(H,L), since 1≠2⁻¹·1 at z=2.

*Needs:* PadicLocalLanglandsForGL2Qp §0.1; PadicFunctionalAnalysis §§4.3–4.4; CompletedCohomologyPartII §F.4; CompletedCohomologyPartII §F.1; ReductiveGroups Layers 6, 10B, §10D; Mathlib `Algebra.FormallySmooth.iff_split_injection`, `HasStrictFDerivAt.toOpenPartialHomeomorph`, `OpenPartialHomeomorph.hasFPowerSeriesAt_symm`.

### 3.5 Algebraic detection of projectives

For K=GL_d(O_F), let θ be an algebraic character of `(Res_{F/ℚ_p}G_m)_L`, with evaluation δ on Z∩K. If M is a nonzero projective in the category of compact O[[K]]-modules on which Z∩K acts by `δ^{-1}`, then Hom_cont,K(M,ξ*)≠0 for some irreducible algebraic ξ of `(Res_{F/ℚ_p}GL_d)_L`. (BIP Lemma 6.7, p. 49; BIP lines 2432–2446).

A compact fixed-centre projective is a product of indecomposable projectives. A nonzero factor is a summand of the fixed-centre completed regular module; its Banach dual is a nonzero summand of Cδ(K,L). The highest-weight classification in ReductiveGroups §10B supplies an algebraic T of central character θ, allowing arbitrary integer exponents at each embedding. This is not restricted to determinant powers. Fixed-centre evaluation density supplies ξ′ with a nonzero map T⊗ξ′→Π(M). Complete reducibility over L supplies an irreducible summand ξ with a nonzero map. Schikhof duality converts this to the asserted map M→ξ*. For a product, compose with the projection to the detected factor.

The construction provides the following API.

- For θ(z)=∏_σ σ(z)^(n_σ), there is an irreducible rational representation with this central character: at σ use dominant weight (n_σ,0,…,0) if n_σ≥0, and (0,…,0,n_σ) if n_σ<0. Each weight sum is n_σ.

**Checks.**

- For d=1 the representation is the character θ itself.
- For d=2 a central exponent 1 is realized by the standard representation, highest weight (1,0); determinant powers have even exponent and miss it.
- For d=2 a central exponent −1 is realized by the dual standard representation, highest weight (0,−1); (−1,0) would not be dominant.

*Needs:* §3.1; §3.4; ReductiveGroups Layers 6, 10B; CompletedCohomologyPartII §3.2; gap:projective-products.

### Examples

For H={1} and M=O, the inclusion O→L detects M. The zero test and the empty family have common kernel O. For an index-two subgroup and a one-dimensional test, the induction comparison has dimension two on each side.

### Dependencies

CompletedCohomologyAndLocalGlobalCompatibility §5.3; gap:capture-formalism; gap:algebraic-capture; gap:projective-products; CompletedCohomologyPartII §§F.1, 3.2; Mathlib `LinearMap.ker`, `LinearMap.mem_ker`, `Submodule.mem_iInf`, `FaithfulSMul`, `Module.annihilator_eq_bot`; CompletedCohomologyAndLocalGlobalCompatibility §5.1; CompletedCohomologyAndLocalGlobalCompatibility §5.2; gap:smooth-test-quotients; CompletedCohomologyPartII §§3.2, 5.8; NoncommutativeAndEquivariantIwasawa §§F.1, 0.11; gap:torsion-free-iwasawa-domain; SmoothRepresentationsOfLocalGroups §SR.2.1; ArithmeticGaloisRepresentations §1.3; CompletedCohomologyPartII §F.2; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.2, SR.5.2; PadicMeasuresIwasawaAlgebras Layer 1; gap:principal-series-types; gap:minimal-stratum-types; PadicLocalLanglandsForGL2Qp §0.1; PadicFunctionalAnalysis §§4.3–4.4; CompletedCohomologyPartII §F.4; CompletedCohomologyPartII §F.1; ReductiveGroups Layers 6, 10B, §10D; Mathlib `Algebra.FormallySmooth.iff_split_injection`, `HasStrictFDerivAt.toOpenPartialHomeomorph`, `OpenPartialHomeomorph.hasFPowerSeriesAt_symm`.

## Layer 4: Faithfulness of the local deformation action

Select a supported patched component through a characteristic-zero point for every local determinant-torsion character, then contract to the reduced local ring.

### 4.1 Detection of local components

For every minimal prime 𝔭χ of R=R□_ρ̄, there is a minimal prime 𝔮 of R∞ with 𝔮∩R=𝔭χ and V(𝔮)⊆V(Ann_R∞M∞). More precisely, a crystalline determinant ψ restricting to χ on μ_p∞(F) and some algebraic ξ give a nonzero characteristic-zero fixed-ψ fibre of M∞(ξ); a point y of that fibre lies on such a component V(𝔮). No containment of the entire support of M∞(ξ) in one component is asserted. (BIP proof of Theorem 6.8, p. 49, BIP lines 2448–2461; EP Theorem 6.3, p. 366, EP lines 1257–1267, imported through the parent §5.3(1)).

For the chosen χ, import the crystalline-character lift of PadicHodgeTheory §3.6 to choose ψ lifting detρ̄ and realizing χ. The nonzero fixed-centre projective Mψ has an algebraic test ξ by Layer 3. Duality gives a nonzero fixed-ψ rational testing module. Its finite presentation over a characteristic-zero quotient of R∞ gives a closed point y. Every algebraic test is annihilated by Ann_R∞M∞, so y∈V(Ann M∞). The parent's support theorem, §5.3(1) (EP Theorem 6.3), makes this closed set a union of irreducible components of Spec R∞. Choose one such component through y. At y, p is invertible; distinct determinant-torsion characters have distinct values, so its χ-component is unique. Let 𝔭=𝔮∩R. As R∞ is O-flat, p∉𝔮, so R/𝔭 is an O-flat domain, and R∞/𝔮 is a quotient of `R∞/𝔭R∞≅(R/𝔭)⊗̂_O A` (DeformationAndDerivedPatchingAlgebra §1.12). R and A are equidimensional (gap:framed-ring-components, §2.1), so LocalGaloisDeformationRings §F.0.1 gives `dim R∞/𝔮=dim R+dim A−1` for the minimal prime 𝔮, while `dim (R/𝔭)⊗̂_O A=dim R/𝔭+dim A−1`; hence dim R/𝔭=dim R and 𝔭 is a minimal prime of R. Since L contains the values of every χ, `R[1/p]=∏_χ R□,χ[1/p]` with each R□,χ a domain (gap:framed-ring-components), so the image x of y contains exactly one minimal prime of R, that of its χ-component; as 𝔭⊆x, 𝔭=𝔭χ. The proof only requires this chosen component through y; it uses no coefficient extension of M∞ and no geometric integrality of the components of A.

**Checks.**

- In Spec L[x,y]/(xy), the union of the two axes is not contained in either axis. The point (1,0) lies only on (y), while (0,0) lies on both; choose a component through the point.
- For distinct χ and χ′ on μ_p(F), their values coincide modulo ϖ but are unequal in characteristic zero. A closed generic point therefore determines one χ, whereas a special-fibre point cannot.
- If A has two components and the supported components are (χ,𝔭₁) for every χ, all local components are met while the components (χ,𝔭₂) need not be.
- For R=O[[u]] and A=O[[x]]/(x(x−ϖ)), free of rank two over O with components O[[x]]/(x)≅O and O[[x]]/(x−ϖ)≅O, the ring R∞=O[[u,x]]/(x(x−ϖ)) has minimal primes (x) and (x−ϖ), with quotients O[[u]] of dimension 2=dim R+dim A−1, each contracting to the minimal prime 0 of R. The non-minimal prime (x,u) has quotient O of dimension 1 and contraction (u), with dim R/(u)=1<2: the dimension count applies only to minimal primes, whose quotients have the full dimension.

*Needs:* §2.1; §2.2; §3.5; §3.2; PadicHodgeTheory §3.6; CompletedCohomologyAndLocalGlobalCompatibility §5.3; LocalGaloisDeformationRings §F.0.1; gap:framed-ring-components; DeformationAndDerivedPatchingAlgebra §§1.12, 4.4, 4.7.

### 4.2 Faithfulness of the local deformation action

For p∤2d and arbitrary continuous ρ̄ in the standing setup, the structural action R□_ρ̄→End_cont,O[[K]](M∞) is injective; equivalently `Ann_{R□_ρ̄}M∞=0`. This asserts faithfulness of the local ring, not of R∞. (BIP Theorem 6.8 and Remark 6.9, pp. 49–50; BIP lines 2447–2461).

If a∈R kills M∞, its image lies in every minimal prime 𝔮 chosen by Layer 4 component detection. Contraction puts a in every minimal prime 𝔭χ of R. Their intersection is its nilradical. The local-ring supplier gives reducedness of R, hence a=0. Use the baseline annihilator criterion to express faithfulness. The statement concerns the module M∞ built over the coefficient ring O of the Conventions; no coefficient extension of M∞ is used.

**Checks.**

- For B=O[[x]]/(x²), the intersection of its minimal primes is (x)≠0, with x²=0; component detection alone cannot give a zero annihilator without reducedness.
- For a single geometrically integral auxiliary factor, the component pairs are just the χ, so this argument reaches every patched component.
- For two auxiliary components, selecting one over each χ gives full local coverage but only half of the patched component pairs.

*Needs:* §4.1; LocalGaloisDeformationRings §1.1; gap:framed-ring-components; Mathlib `Module.comap_annihilator`; Mathlib `Module.annihilator_eq_bot`.

### Examples

In L[x,y]/(xy), the axes are the two components. The whole support crosses both, but the point (1,0) selects (y); the proof uses that point, not a containment of the whole support in one axis.

### Dependencies

§2.1; §2.2; §3.5; §3.2; PadicHodgeTheory §3.6; CompletedCohomologyAndLocalGlobalCompatibility §5.3; LocalGaloisDeformationRings §F.0.1; DeformationAndDerivedPatchingAlgebra §§1.12, 4.4, 4.7; LocalGaloisDeformationRings §1.1; gap:framed-ring-components; Mathlib `Module.comap_annihilator`; Mathlib `Module.annihilator_eq_bot`.

## Layer 5: Three arithmetic density theorems

Crystalline density also has a local route at every prime through the rigid generic fibre. Otherwise work with finite testing modules over R∞ and their reduced O-flat faithful quotients. Capture detects scalar actions and local faithfulness detects the scalar in R.

### 5.1 Density from patched testing

Let R→R∞ be a continuous map of complete Noetherian local O-algebras with finite residue field with a continuous commuting action on the imported compact projective M∞, faithful over R. Let (V_i) capture M∞ on a fixed compact open H⊆K, and let N_i=M∞,H(Θ_i) be the finite integral tests. Suppose each B_i=R∞/Ann_R∞N_i is reduced and O-flat (the zero ring is allowed), and the image in Spec R of every closed point of Spec B_i[1/p] lies in a set Σ of arithmetic points. Then the vanishing ideal of Σ in R is zero and Σ is Zariski dense in Spec R. More generally, when the faithfulness assumption is dropped, its closure is V(Ann_R M∞) if, in addition, Σ⊆V(Ann_R M∞). (EP Lemmas 2.7, 2.10 and Proposition 2.11, pp. 344–345; Remark 2.13, pp. 345–346; BIP proof of Theorem 6.1, pp. 49–50; EP lines 320–399; BIP lines 2462–2476).

A scalar vanishing on Σ vanishes on every characteristic-zero closed point of B_i. Its generic fibre is Jacobson with finite residue extensions; reducedness and O-flatness give that the scalar is zero in B_i. Thus it kills N_i, hence kills every testing map by the dual-Hom comparison. By the endomorphism statement of §3.1, which uses capture, its endomorphism on M∞ is zero. Capture gives vanishingIdeal(Σ)⊆Ann_R M∞. If Σ⊆V(Ann_R M∞), the reverse inclusion also holds; in the faithful case both are zero. Baseline zero-locus/closure gives the conclusion. This argument takes finite tests over R∞; it never assumes that M∞ is finite over R[[H]]. Equivalently EP Proposition 2.11 may be applied to R∞/Ann M∞ and then contracted.

**Checks.**

- For B=O[[x]]/(x²), every characteristic-zero point sends x to 0 but x≠0; reducedness is needed for ideal equality.
- For B=O[[x]]/(ϖx), x≠0 vanishes in B[1/p]; O-flatness is needed even though B is reduced.
- For the zero testing module N_i=0, Ann N_i=R∞ and B_i=0, whose spectrum is empty and vanishing ideal is the whole zero ring.
- For R=O, M=O and the trivial test, the generic point has kernel 0 in O, so its closure is Spec O including (ϖ).

*Needs:* §3.1; §3.2; Mathlib `Module.mem_annihilator`; Mathlib `Module.comap_annihilator`; Mathlib `PrimeSpectrum.vanishingIdeal`; Mathlib `PrimeSpectrum.zeroLocus_vanishingIdeal_eq_closure`; DeformationAndDerivedPatchingAlgebra §§4.4, 4.6–4.7.

### 5.2 Density of crystalline points

For every prime p, every finite F/ℚ_p, every d≥1 and every ρ̄ in the standing setup, Σcris is Zariski dense in X□=Spec R□_ρ̄, and already in the rigid generic fibre (Spf R□_ρ̄)^rig. The labelled regular weights vary; coefficients are allowed finite extensions of L. (BIPD Theorem 3.3, p. 8, Lemma 5.1 and Corollary 5.2, p. 11; BIP Remark 6.10, p. 50; for p∤2d, BIP Theorem 6.1 and proof, pp. 46, 49–50, and CEGGPS Lemma 4.18, pp. 65–66; BIPD lines 349–354, 454–465; BIP lines 2311–2312, 2462–2476, 2495–2498).

Local route, every p. For each χ:μ_p∞(F)→O×, PadicHodgeTheory §3.6 gives a crystalline ψ lifting detρ̄ with ψ∘Art_F=χ on μ_p∞(F), and gap:crystalline-lift-prescribed-determinant gives a regular crystalline lift with determinant ψ (BIPD Corollary 2.8). As L contains the values of every χ (Conventions), R□[1/p] is the product of the R□,χ[1/p], each an O-flat normal domain by gap:framed-ring-components, so the normalization of R□ is ∏_χ R□,χ and, by gap:berthelot-points-components, the irreducible components of (Spf R□)^rig are the images of the generic fibres (Spf R□,χ)^rig; as Spf R□,χ→Spf R□ is a closed immersion, these images are the pairwise disjoint generic fibres themselves, and each contains a regular crystalline point. By gap:crystalline-closure-components the Zariski closure of these points is a union of components, hence everything. An element of R□[1/p] vanishing on Σcris then lies in every maximal ideal of the reduced Jacobson ring R□[1/p], so it is zero; as R□ is O-torsion free, the vanishing ideal of Σcris in R□ is zero (BIPD Lemma 5.1). Patched route, p∤2d. For every algebraic ξ, take the K-test M∞(ξ); these ξ capture the compact projective M∞. The parent crystalline specialisation theorem identifies its faithful quotient with a reduced O-flat union of components of the appropriate crystalline deformation ring, including the auxiliary factors. All characteristic-zero points map to Σcris. Apply Layer 5 testing density with Layer 4 faithfulness.

**Checks.**

- For d=1 this agrees with the algebraic-character interpolation from local class field theory.
- For p=2, d=1, F=ℚ_2 and trivial ρ̄, μ_2∞(ℚ_2)={±1} gives two components. The crystalline characters equal to x↦x^n on ℤ_2^× and to 1 at 2 lift the trivial character and take the value (−1)^n at −1, so even and odd n meet both components; the theorem applies although 2 divides 2d=2.
- For d=2, F=ℚ_2 and trivial ρ̄ the framed generic fibre again has two components, indexed by the value ±1 of the determinant at −1, and both contain regular crystalline points, as in PadicLocalLanglandsForGL2Qp §3.6a.
- For O=ℤ_5 and A=ℤ_5[[x,y]]/(y²−x³), the normalization is ℤ_5[[t]] with x=t², y=t³. The open unit disc (Spf ℤ_5[[t]])^rig maps bijectively onto the unique irreducible component of (Spf A)^rig, the cusp, but is not isomorphic to it: at the origin the completed local ring of A[1/p] has tangent dimension 2, that of the disc 1. Components are images of the normalized pieces, which for the normal component rings R□,χ are closed immersions.
- BIPD and IYE use HT(ε)=+1. Negating and reversing a labelled weight tuple sends (2,0) to (0,−2) and keeps strict inequalities, so both conventions define the same set Σcris; a non-regular tuple such as (1,1) stays non-regular.

*Needs:* For the local route at every p: §1.1; PadicHodgeTheory §3.6; ModularityAndLanglandsExtensions §2.1; gap:crystalline-lift-prescribed-determinant; LocalGaloisDeformationRings §1.1; gap:framed-ring-components; AdicSpacesPartIII §R2.9; gap:berthelot-points-components; CompletedCohomologyAndLocalGlobalCompatibility §5.2a; gap:crystalline-closure-components; DeformationAndDerivedPatchingAlgebra §4.4. For the patched route at p∤2d: §1.2; §4.2; §5.1; §3.1; CompletedCohomologyAndLocalGlobalCompatibility §5.2; LocalGaloisDeformationRings §3.4.

### 5.3 Density of principal-series points

For p∤2d and every fixed regular labelled Hodge–Tate weight k, the potentially crystabelline subset Σprnc_k is Zariski dense in X□. (BIP Theorem 6.1 and proof, pp. 46, 50; EP proof of Theorem 5.1, pp. 363–364; Theorem 5.3 and proof, p. 365; BIP lines 2477–2482; EP lines 1126–1164, 1202–1209).

Fix ξ=πalg(k) with the dual highest-weight convention in Layer 1. Restrict M∞ to the small Iwahori subgroup of EP §3.3. The principal-series smooth family, tensored with this fixed ξ, captures the restriction of M∞. By gap:smooth-test-quotients the faithful test quotients are reduced and O-flat, and each characteristic-zero point is potentially semistable of weight k with the inertial restriction of some irreducible π containing Vχ. Every such π is an irreducible principal series (gap:principal-series-types), whose parameter is a sum of characters with N=0; so the point has N=0 and becomes crystalline over the abelian extension trivialising these characters on inertia, that is, it is potentially crystabelline of weight k (EP proof of Theorem 5.3). The testing criterion and local faithfulness transfer the annihilator-supported statement to all X□.

**Checks.**

- For d=1 at fixed weight, smooth characters of increasing conductor vary while the algebraic factor stays fixed; for ℤ_p the available finite-order characters of order dividing p^n number p^n.
- Fixing weight and a single inertial type instead cuts out a generally proper potentially crystalline quotient.
- The conclusion concerns Spec R, whereas fixed-weight points need not be dense in the rigid generic fibre (BIP Remark 6.10, p. 50).
- For d=2 the K-representation inflated from the Steinberg representation of GL_2(k_F) occurs both in the Steinberg representation of G, with N≠0, and in every unramified irreducible principal series, whose invariants under the first congruence subgroup of K are 1⊕St as K-representations; so the N=0 clause of gap:smooth-test-quotients does not apply to it, and the contract allows semistable noncrystalline points in the support of such a test. For Vχ every π containing it is an irreducible principal series, so the clause applies.

*Needs:* §1.1; §1.2; §4.2; §5.1; §3.3; §3.2; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.2, SR.5.2; gap:smooth-test-quotients; gap:principal-series-types.

### 5.4 Density of supercuspidal points

For p∤2d and every fixed regular labelled weight k, Σspcd_k, with its unramified degree-d inducing extension and irreducible induced Weil representation, is Zariski dense in X□. (BIP Theorem 6.1, p. 46; proof, p. 50; EP Proposition 3.19, p. 356; Theorem 5.3 and proof, p. 365; BIP lines 2306–2312, 2477–2482; EP lines 824–843, 1202–1209).

Use E/F unramified of degree d and its EP §3.4 minimal-stratum family, tensored with the fixed ξ=πalg(k). Unramified E admits a minimal element. By gap:smooth-test-quotients the faithful test quotients are reduced and O-flat, and each characteristic-zero point is potentially semistable of weight k with the inertial restriction of some π containing V(α,θ), which is supercuspidal by EP Proposition 3.19 (gap:minimal-stratum-types). A Frobenius-semisimple Weil–Deligne representation with the inertial restriction of an irreducible parameter is irreducible with N=0, hence an unramified twist of that parameter; its representation is the corresponding unramified twist of π, which has the same restriction to K and so contains V(α,θ). For unramified E the corresponding Weil representation is irreducible character induction. Apply the capture criterion on the small hereditary-order subgroup, then contract by local faithfulness.

**Checks.**

- For d=1, E=F and the induction has dimension one; Σspcd_k=Σprnc_k=Σ_k.
- An unramified degree-d extension has e=1, so the tame part of EP Proposition 3.19 applies.
- For d=2 and E/F unramified quadratic with Frobenius conjugation c, a character ψ of W_E with ψ≠ψ∘c induces an irreducible two-dimensional Weil representation, whereas `ψ=χ∘N_{E/F}` induces χ⊕χη with η the unramified quadratic character of W_F; such a point with N=0 lies in Σprnc_k and not in Σspcd_k, so the irreducibility clause in the definition of Σspcd_k is not automatic.

*Needs:* §1.1; §1.2; §4.2; §5.1; §3.3; §3.2; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.2, SR.5.2; EndoscopicTransferAndUnitaryTraceComparison §§10.21, 10.30; gap:smooth-test-quotients; gap:minimal-stratum-types.

### Examples

A generic point with kernel 0 in O is dense in Spec O, despite omitting the special point (ϖ). This illustrates why the ambient scheme spectrum matters to fixed-weight density.

### Dependencies

§3.1; §3.2; Mathlib `Module.mem_annihilator`; Mathlib `Module.comap_annihilator`; Mathlib `PrimeSpectrum.vanishingIdeal`; Mathlib `PrimeSpectrum.zeroLocus_vanishingIdeal_eq_closure`; DeformationAndDerivedPatchingAlgebra §§4.4, 4.6–4.7; DeformationAndDerivedPatchingAlgebra §§4.4, 4.7; §1.1; PadicHodgeTheory §3.6; ModularityAndLanglandsExtensions §2.1; gap:crystalline-lift-prescribed-determinant; LocalGaloisDeformationRings §1.1; gap:framed-ring-components; AdicSpacesPartIII §R2.9; gap:berthelot-points-components; CompletedCohomologyAndLocalGlobalCompatibility §5.2a; gap:crystalline-closure-components; DeformationAndDerivedPatchingAlgebra §4.4; §1.2; §4.2; CompletedCohomologyAndLocalGlobalCompatibility §5.2; LocalGaloisDeformationRings §3.4; §3.3; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.2, SR.5.2; gap:smooth-test-quotients; gap:principal-series-types; EndoscopicTransferAndUnitaryTraceComparison §§10.21, 10.30; gap:minimal-stratum-types.

## Layer 6: Benign, prescribed-type and ramified variants

Use the parent §5.2a benign geometry, on patched quotients and, at every prime, on local crystalline loci. Prescribing inertia keeps all regular weights available; the minimal-stratum density fixes the weight and varies the supplied smooth types.

### 6.1 Density of benign points

For every prime p, benign crystalline points with regular labelled weights varying are Zariski dense in X□=Spec R□_ρ̄, and already in (Spf R□_ρ̄)^rig. (BIP Remark 6.2, p. 46; NAK Lemma 4.2, pp. 120–122; BIPD proof of Theorem 4.2, p. 10; for p∤2d, EP Proposition 6.9 and its use preceding Lemma 6.11, p. 368; BIP lines 2313–2316; NAK lines 1356–1418; BIPD lines 428–440; EP lines 1320–1336, 1348–1354).

Local route, every p. A regular crystalline point x of weight k lies on the closed crystalline locus (Spf R□,k_cr)^rig. By gap:local-benign-crystalline-points every admissible open neighbourhood of x there contains a benign point; a Zariski-closed analytic subset containing all benign points has admissible open complement, so it contains x. Hence the Zariski closure of the benign points contains Σcris, which is dense in (Spf R□)^rig by §5.2, and the passage to Spec R□ is that of §5.2. Patched route, p∤2d. For each algebraic test quotient, benign points are dense in every component of its characteristic-zero support by CompletedCohomologyAndLocalGlobalCompatibility §5.2a. A local scalar vanishing on all benign points therefore vanishes on every reduced integral test quotient. Algebraic capture and local faithfulness give zero vanishing ideal, exactly as in crystalline density.

**Checks.**

- In rank one all eigenvalue-pair and refinement conditions are vacuous, so benign crystalline points are precisely crystalline points.
- For rank two the eigenvalue ratio p^f is excluded: at f=1 and eigenvalues 1,p, the ratio is p. Regular weights alone do not imply benignness.
- For a zero algebraic test the support is empty; its benign locus contributes no points. For a nonempty test, openness is relative to each crystalline component.
- For p=2, d=1, F=ℚ_2 and trivial ρ̄, benign points are the crystalline points, and the characters x↦x^n of §5.2 with n even and odd meet both components; no prime restriction enters.

*Needs:* For the local route at every p: §5.2; LocalGaloisDeformationRings §3.4; gap:local-benign-crystalline-points; AdicSpacesPartIII §R2.9; gap:berthelot-points-components. For the patched route at p∤2d: CompletedCohomologyAndLocalGlobalCompatibility §§5.2, 5.2a; §3.1; §4.2; §5.1.

### 6.2 Prescribed inertial type tests

For every inertial type τ (a finite-image inertia representation extending to W_F), choose the nonzero smooth K-type W=σ(τ) with CEGGPS N=0 recognition and a finite coefficient model. For each irreducible algebraic ξ let `N_{ξ,τ}=M∞(ξ⊗W)`, using stable integral lattices for annihilators, and put Jτ=⋂_ξ Ann_R `N_{ξ,τ}` and Cτ=V(Jτ). Let Στ consist of potentially crystalline arithmetic points of type τ with arbitrary regular labelled weights, and Στ^patch be the images of closed generic points of the faithful test quotients. A zero representation W=0 is allowed only as a degenerate test of this construction, giving J=R and C=∅; it is never σ(τ). (BIP Remark 6.2, p. 46; CEGGPS Theorem 3.7, p. 41 and §3.13; EP Corollary 3.2, p. 351; BIP lines 2313–2314; CEGGPS lines 1651–1663; EP lines 618–621).

Use the parent §5.2 type-specialised modules and contract their annihilators to R. Their faithful quotients are reduced and O-flat, so the Jacobson and integral-point interfaces identify Jτ with the vanishing ideal of Στ^patch. The recognition theorem identifies those points as potentially crystalline of type τ. Since σ(τ)≠0, algebraic capture tensor σ(τ) captures M∞, and §4.2 gives Jτ=Ann_R M∞=0.

The construction provides the following API.

- Jτ is radical and p-saturated, since each faithful test quotient is reduced and O-flat.
- The type recognition theorem gives Στ^patch⊆Στ, including N=0.
- The vanishing ideal of Στ^patch equals Jτ.
- For every inertial type τ, Jτ=Ann_R M∞=0 and Cτ=X□.
- For a degenerate W=0, every test is zero, J=R and C=∅.
- Restricting the intersection to a single algebraic ξ gives its contracted testing support, which need not equal X□.

**Checks.**

- For W=0, Ann_R(0)=R, so J=R and V(J)=∅; this distinguishes zero test data from any inertial type.
- For trivial τ the construction contains all crystalline algebraic tests, and Jτ=0, Cτ=X□.
- For d=1 and F=ℚ_p, type trivial with weight zero forces unramified inertia, cutting out a proper locus; ranging over the weights instead gives Cτ=X□.
- For μ_p∞(F) cyclic of order p^a, a fixed rank-one type τ can be combined with algebraic powers σ(z)^n. As n runs modulo p^a, the restriction runs through all p^a determinant-torsion characters.

*Needs:* §3.2; §1.1; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.2, SR.5.2; CompletedCohomologyAndLocalGlobalCompatibility §5.2; Mathlib `Module.annihilator`; Mathlib `PrimeSpectrum.zeroLocus`; gap:crystalline-inertial-types; §3.1; §4.2.

### 6.3 Density for every prescribed inertial type

For p∤2d and every inertial type τ, the potentially crystalline points of type τ with regular labelled Hodge–Tate weights varying are Zariski dense in X□=Spec R□_ρ̄, allowing finite coefficient extensions. (BIP Remark 6.2, p. 46; EP Corollary 3.2, p. 351; BIP lines 2313–2314; EP lines 618–621; CEGGPS Theorem 3.7, p. 41).

CEGGPS Theorem 3.7 gives σ(τ)≠0. The algebraic capture and nonzero tensor stability supplied in §3.1 apply with W=σ(τ). Parent §5.2 gives reduced O-flat faithful type quotients and recognition of their characteristic-zero points. Apply §5.1 and §4.2 to get Jτ=0 and density on all X□.

**Checks.**

- For d=1 the algebraic powers at a fixed τ meet every μ_p∞(F)-component, as computed in §6.2.
- The degenerate W=0 family has no arithmetic points and J=R; it is excluded by σ(τ)≠0.
- Fixing both τ and a single weight gives a potentially crystalline quotient, generally proper; this theorem varies the weights.

*Needs:* §6.2; §3.1; §4.2; §5.1; CompletedCohomologyAndLocalGlobalCompatibility §5.2; gap:crystalline-inertial-types.

### 6.4 Minimal-stratum supercuspidal points

Fix an embedded extension E/F of degree d containing an element minimal over F. Write e=e(E/F), v_E normalized and ϖ_F a uniformizer. Minimal means gcd(e,v_E(α))=1 and the residue of `ϖ_F^{−v_E(α)}α^e` generates k_E/k_F. Choose an O_F-basis of O_E to identify its lattice with O_F^d. Let 𝔄 be the hereditary order of End_F(E) preserving the chain (𝔭_E^i). For regular weight k, `Σsc_{k,E}` consists of potentially semistable points of that weight whose local Langlands representation is supercuspidal and contains a simple stratum [𝔄,n,0,α] with F[α]=E and α minimal, v_E(α)=−n<0. Simple strata, simple characters and their occurrence are imported from the smooth-representation owner. For an integer m≥1 such that `U^{m+1}(𝔄)` is torsion free, the deep subset `Σsc_{k,E,m}` consists of the points of Σ_k whose local Langlands representation contains some V(α,θ) with α∈E minimal over F, v_E(α)=−n, n>2m, and θ∈C(m,α). The predicate `Σsc_{k,E}` also covers wild E/F outside the range of the density theorem in §6.5. (EP Definition 3.12 and Example 3.15, p. 354; Proposition 3.19, p. 356; §5.3, p. 363, and §5.4, p. 364; BIP Remark 6.2, p. 46; EP lines 753–843, 1116–1125, 1185–1190).

Apply the supplied minimal-stratum/type occurrence predicate to the local Langlands representation. The field embedding and lattice chain are specified up to conjugacy. The numerical minimality condition is the EP §3.4 input; it implies F[α]=E. The filtration and type constructors remain the supplier’s definitions; the chosen lattice puts `U^{m+1}(𝔄)` inside K. Use type recognition to see that such supercuspidal points have N=0. Character induction is available only under the extra tame hypothesis of EP Proposition 3.19.

The construction provides the following API.

- Changing the embedding E↪End_F(F^d) by conjugation gives the same point predicate.
- Every point of `Σsc_{k,E}`, hence of `Σsc_{k,E,m}`, is potentially crystalline, with N=0.
- Membership in `Σsc_{k,E,m}` is occurrence of some V(α,θ) with n>2m and θ∈C(m,α). Every point of `Σsc_{k,E,m}` lies in `Σsc_{k,E}`: by EP Proposition 3.19 its representation is supercuspidal and contains θ, which restricts to ψ_α on `U^{[n/2]+1}(𝔄)` and extends to a simple character of [𝔄,n,0,α] occurring in the same representation. The converse fails for strata with n≤2m.
- For tame E/F and fixed (α,θ), occurrence of V(α,θ) is equivalent to the character-induction description with `ψ|U_E^{m+1}=θ|U_E^{m+1}`; this describes `Σsc_{k,E,m}`, not all of `Σsc_{k,E}`, and no such equivalence is asserted for wild E.
- Finite coefficient extension does not change the underlying arithmetic point predicate.

**Checks.**

- For totally ramified E/F, a uniformizer α has v_E(α)=1 and gcd(e,1)=1, while k_E=k_F makes the residue-generation condition automatic. Its inverse has valuation −1 and is minimal as well.
- For E/F unramified of degree d, a unit ξ with generating residue gives α=ϖ_F^(−n)ξ: e=1, gcd(1,−n)=1 and the required residue is ξ̄.
- For F=ℚ_5, f(E/F)=2 and e(E/F)=6, the extension obtained from the unramified quadratic field and 5^(1/6) has degree 12. Sixth powers in 𝔽₂₅× form its subgroup of order 4, exactly 𝔽₅×, so it has no minimal element (EP Example 3.15).
- For F=ℚ_3, d=3 and E=ℚ_3(3^(1/3)), e=3 and a uniformizer is minimal. The definition uses simple strata here; p divides 2d=6, so §6.5 gives no density claim for this wild instance.
- For p=3, d=1, F=E=ℚ_3(ζ_3) and a weight-zero point whose character is trivial on U_F^2 and on ϖ and nontrivial on U_F^1, its restriction to U_F^1 is some ψ_α with v(α)=−1, so it contains the stratum with n=1 and lies in `Σsc_{k,E}`. The least permitted m is 1, since U_F^2 is torsion free while ζ_3∈U_F^1∖U_F^2; so every deep family has n≥3, and each such θ is nontrivial on U_F^n where the character is trivial: the point lies in no `Σsc_{k,E,m}`.

*Needs:* §1.1; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.2, SR.5.2; EndoscopicTransferAndUnitaryTraceComparison §§10.21, 10.30; gap:minimal-stratum-types.

### 6.5 Density with a minimal-stratum inducing extension

Assume p∤2d. For every fixed regular weight k and every degree-d extension E/F containing a minimal element, `Σsc_{k,E}` is Zariski dense in X□; already its deep subset `Σsc_{k,E,m}` is dense, for every m≥1 with `U^{m+1}(𝔄)` torsion free. Since d=e(E/F)·f(E/F) and p∤d, every such E/F is tamely ramified, so the points of `Σsc_{k,E,m}` are those of Σ_k whose WD representation is irreducible and isomorphic to `Ind_{W_E}^{W_F}ψ` with `ψ|U_E^{m+1}=θ|U_E^{m+1}` for some EP minimal α of valuation −n, n>2m, and θ∈C(m,α). Every totally ramified degree-d extension is included. (EP §3.4, pp. 354–358; Theorem 5.3 and proof, p. 365; BIP Remark 6.2, p. 46; EP lines 774–782, 824–843, 1202–1209; BIP lines 2315–2316).

Choose m as stated and the supplied V(α,θ) family. EP Lemma 3.16 supplies arbitrarily negative minimal elements from one such element, at depths with bounded gaps (§3.3). The family captures by §3.3 after tensoring with the nonzero fixed algebraic representation. gap:smooth-test-quotients gives reduced O-flat faithful quotients, whose characteristic-zero points, as in §5.4, have Weil–Deligne representation an unramified twist of the parameter of a supercuspidal π containing V(α,θ), and so themselves contain V(α,θ). EP Proposition 3.19, in its tame form with the displayed character restriction, then places these points in `Σsc_{k,E,m}`. Apply §5.1 and §4.2 to obtain density of `Σsc_{k,E,m}` in X□; density of `Σsc_{k,E}` follows from the inclusion of §6.4.

**Checks.**

- For p=5,d=2 and E=ℚ_5(√5), e(E/F)=2,f(E/F)=1 and p∤2d=4; the uniformizer is minimal and the tame induced-character description applies to the deep subset.
- For unramified E, e=1 and the tame part of EP Proposition 3.19 places `Σsc_{k,E,m}` inside Σspcd_k, so density of the deep subset gives §5.4 by inclusion. The sets differ: for d=1, an unramified character lies in Σspcd_k=Σ_k but contains no stratum with n>0, so it is not in `Σsc_{k,E}`.
- For the degree-12 extension over ℚ_5 in §6.4, 5∤24 but no minimal element exists; the minimal-element hypothesis is necessary.
- The shallow rank-one point of §6.4 (p=3, F=E=ℚ_3(ζ_3), 3∤2d=2) lies in `Σsc_{k,E}` and in no `Σsc_{k,E,m}`; the density of `Σsc_{k,E}` comes from that of `Σsc_{k,E,m}` by inclusion, not by equality of the two sets.

*Needs:* §6.4; §3.3; §4.2; §5.1; §1.2; §3.2; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.2, SR.5.2; gap:smooth-test-quotients; gap:minimal-stratum-types.

### Examples

At p=5,d=2, ℚ_5(√5) is tame and contains a minimal uniformizer. At p=3,d=3, ℚ_3(3^(1/3)) is wild and satisfies the definition in §6.4 but lies outside §6.5’s density range.

### Dependencies

§5.2; LocalGaloisDeformationRings §3.4; gap:local-benign-crystalline-points; AdicSpacesPartIII §R2.9; gap:berthelot-points-components; CompletedCohomologyAndLocalGlobalCompatibility §§5.2, 5.2a; §3.1; §4.2; §5.1; §3.2; §1.1; SmoothRepresentationsOfLocalGroups §§SR.3.1–SR.3.2, SR.5.2; CompletedCohomologyAndLocalGlobalCompatibility §5.2; Mathlib `Module.annihilator`; Mathlib `PrimeSpectrum.zeroLocus`; gap:crystalline-inertial-types; EndoscopicTransferAndUnitaryTraceComparison §§10.21, 10.30; gap:smooth-test-quotients; gap:minimal-stratum-types; §3.3; §1.2.

## Downstream consumers

The exported local faithfulness theorem is §4.2. The three BIP density endpoints are §§5.2–5.4; the benign, prescribed-type and minimal-stratum variants are §§6.1, 6.3 and 6.5. Consumers retain the scheme-spectrum topology, finite coefficient extensions and regular weights; §§5.2 and 6.1 hold at every prime, the other endpoints for p∤2d. Local faithfulness does not assert Ann_R∞M∞=0 when auxiliary components remain untested.

## Worked examples

The crystalline-character lift used in §§2.2 and 4.1 includes its unramified factor. In the proof of BIP Lemma 6.5, pp. 47–48, the algebraic-on-units character has value 1 on ϖ_F; torsion matching alone does not determine the residual unramified character (BIP lines 2384–2395). For F=ℚ_5 and κ unramified with κ(5)=[2], that construction gives 1 modulo 5 instead of 2. Multiplying by the unramified character taking 5 to [2] gives residual value 2 without changing the units. PadicHodgeTheory §3.6 supplies this corrected lift.

The component-through-a-point argument of §4.1 uses BIP Theorem 6.8, p. 49 (BIP lines 2455–2459). In Spec L[x,y]/(xy), the union of the two axes is contained in neither single axis. Select a component through a characteristic-zero point of the nonzero fixed-determinant test fibre; uniqueness of its χ-component gives the required contraction. The entire test support need not lie in that component.

The nonzero tensor hypothesis in §3.1 is required in EP Lemmas 2.6 and 2.9 and Corollary 3.2, pp. 343–344, 351 (EP lines 306–345, 618–621). For H={1}, M=O≠0 and W=0, the ordinary trivial representation captures O but its tensor with W has common kernel O. In Lemma 2.6 the premise for M⊗0=0 is vacuous. Positive lattice rank, rather than freeness alone, is needed to descend the quotient equality.

## References

Locators for BIP, EP, NAK, DEJ and CON use published pages; CEGGPS, DPS, ST, EG, HP, BIPD, IYE and AB use the specified preprint or author-copy pages. The versions and pagination are specified below.

- **BIP.** Gebhard Böckle, Ashwin Iyengar and Vytautas Paškūnas, [On local Galois deformation rings](https://doi.org/10.1017/fmp.2023.25), Forum of Mathematics, Pi 11 (2023), e30, pp. 1–54. Corollaries 4.19, 4.21–4.22, pp. 39–40; Theorem 6.1 and Remark 6.2, p. 46; Lemmas 6.3–6.7 and Theorem 6.8, pp. 47–49; Remarks 6.9–6.10, p. 50. The numbering agrees with arXiv:2110.01638v2, whose pages differ.
- **EP.** Matthew Emerton and Vytautas Paškūnas, [On the density of supercuspidal points of fixed regular weight in local deformation rings and global Hecke algebras](https://www.numdam.org/item/10.5802/jep.119.pdf), J. Éc. polytech. Math. 7 (2020), pp. 337–371. §§2–3, pp. 342–358; Proposition 3.19, p. 356; Theorem 5.1 and proof, pp. 363–364; §5.3, p. 363; §5.4, p. 364; Theorem 5.3 and proof, p. 365; Theorem 6.3, p. 366; Definition 6.8 and Proposition 6.9, p. 368.
- **CEGGPS.** Ana Caraiani, Matthew Emerton, Toby Gee, David Geraghty, Vytautas Paškūnas and Sug Woo Shin, [Patching and the p-adic local Langlands correspondence](https://arxiv.org/pdf/1310.0831v5), arXiv:1310.0831v5 (2016). §1.8, pp. 12–15; Theorem 3.7, p. 41; §3.13, pp. 48–49; Lemma 4.18, pp. 65–66; §4.22 and Corollary 4.26, pp. 67–70; Appendix A, pp. 82–84.
- **DPS.** Gabriel Dospinescu, Vytautas Paškūnas and Benjamin Schraen, [Infinitesimal characters in arithmetic families](https://arxiv.org/pdf/2012.01041v1), arXiv:2012.01041v1 (2020). Example 5.13 and Remark 5.14, p. 38; Lemmas 7.2–7.3, Theorem 7.4 and Corollaries 7.5–7.8, pp. 40–43.
- **EG.** Matthew Emerton and Toby Gee, [Moduli stacks of étale (phi, Gamma)-modules and the existence of crystalline lifts](https://www.math.uchicago.edu/~emerton/pdffiles/moduli.pdf), author copy of Annals of Mathematics Studies 215 (2023). Theorem 1.2.2, p. 3; Definition 6.4.2 and Theorem 6.4.4(1), pp. 168–169.
- **ST.** Peter Schneider and Jeremy Teitelbaum, [Banach space representations and Iwasawa theory](https://arxiv.org/pdf/math/0005066v1), arXiv:math/0005066v1 (2000). Lemma 2.1, Corollary 2.2 and Theorem 2.3, pp. 10–12. Used through CompletedCohomologyPartII §F.1.
- **NAK.** Kentaro Nakamura, [Zariski density of crystalline representations for any p-adic field](https://www.ms.u-tokyo.ac.jp/journal/pdf/jms210103.pdf), J. Math. Sci. Univ. Tokyo 21 (2014), pp. 79–127. Lemma 4.2, pp. 120–122, used through the parent §5.2a benign-locus theorem and gap:local-benign-crystalline-points.
- **HP.** Yongquan Hu and Vytautas Paškūnas, appendix by Jack Shotton, [On crystabelline deformation rings of Gal(Q̄_p/ℚ_p)](https://arxiv.org/pdf/1702.06019v2), arXiv:1702.06019v2 (2018). Appendix A, Lemmas A.1–A.5, pp. 48–50. These are the equidimensionality and splitting inputs cited in BIP Lemma 6.3.
- **BIPD.** Gebhard Böckle, Ashwin Iyengar and Vytautas Paškūnas, [Zariski density of crystalline points](https://arxiv.org/pdf/2206.06944v1), arXiv:2206.06944v1 (2022); published in Proc. Natl. Acad. Sci. USA 120 (2023). Propositions 2.6–2.7 and Corollary 2.8, pp. 6–7; Theorem 3.3, p. 8; proof of Theorem 4.2, p. 10; Lemma 5.1 and Corollary 5.2, p. 11. Cited in the arXiv numbering and pagination.
- **IYE.** Ashwin Iyengar, [Deformation theory of the trivial mod p Galois representation for GLₙ](https://arxiv.org/pdf/1904.05996v4), arXiv:1904.05996v4 (2021); published in Int. Math. Res. Not. IMRN (2020). Definition 5.8 and Propositions 5.9–5.10, pp. 26–27, stated for trivial ρ̄ (IYE line 224); BIPD applies the argument to every ρ̄.
- **DEJ.** A. J. de Jong, [Crystalline Dieudonné module theory via formal and rigid geometry](https://www.numdam.org/item/10.1007/BF02698637.pdf), Publ. Math. IHÉS 82 (1995), pp. 5–96. Lemma 7.1.9, p. 78.
- **CON.** Brian Conrad, [Irreducible components of rigid spaces](https://www.numdam.org/item/10.5802/aif.1681.pdf), Ann. Inst. Fourier 49 (1999), pp. 473–541. Theorem 2.3.1, pp. 500–501.
- **AB.** Konstantin Ardakov and Kenneth A. Brown, [Ring-theoretic properties of Iwasawa algebras: a survey](https://arxiv.org/pdf/math/0511345v1), arXiv:math/0511345v1 (2005). §4.2, Theorem, and §4.3, Theorem, p. 10: semiprimeness, and the domain property of the Iwasawa algebras of a compact p-adic analytic group exactly when it is torsion free; used through gap:torsion-free-iwasawa-domain.
