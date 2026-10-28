# Roadmap: admissible pairs, p-adic Hodge structures and bi-analytic Ax–Lindemann

**Summary.** Build the neutral Tannakian theory of admissible pairs and p-adic Hodge structures, first over a complete algebraically closed field and then over locally spatial diamonds. The two lattices in their de Rham comparison give two period structures on one infinite-level moduli space. Assuming the arbitrary-field full-rank de Rham criterion specified in the supplier contracts, the main result identifies the opposite analytic closure of an irreducible analytic set with an opposite-special subvariety (Hodge–Tate special for a Hodge analytic set, and Hodge special for a Hodge–Tate analytic set), subject to the empty-intersection convention in the general case. For minuscule type the three special notions agree, so the closure is special in the two rigid towers. A second end theorem gives Hodge–Tate period-image density without a basicness assumption. The construction also supplies the two-lattice CM criterion, neutral period domains for connected linear groups, and applications to variations and basic Shimura uniformizations.

## Scope and ownership

This roadmap owns the two-lattice theory of goodness, neutral admissible pairs and neutral p-adic Hodge structures, their connected Tannakian groups, the extension of period-domain geometry to connected linear groups, Hodge and Hodge–Tate line loci, and bi-analytic Ax–Lindemann. Its end results are HKII Theorem 9.1.3, p. 55 (HKII line 2481), Theorem A, p. 6 (HKII line 268), and Theorem B, p. 11 (HKII line 501). The two-lattice CM theorem is HKI Theorem B, p. 5 (HKI line 204).

The fixed Fargues–Fontaine curve belongs to AdicSpaces Layer 6; general bundles, tensor constructions and descent belong to AlgebraicVectorBundles L0A–L0C and L2A–L2B. RelativeFarguesFontaine §§4.10–4.12, 6.6–6.9 and 7.0–7.6 own relative period completions, modifications and tensor gluing. VectorBundlesAndIsocrystals VB0–VB2 and VB4 own full slope classification and relative constant-slope local triviality. VStackSheavesAndLisseCategories §VS4.0 owns the reductive bundle-stack, Newton-geometry and full-automorphism constructions (BunGeometry, BunNewtonGeometry and BunAutomorphisms). BunGAndNewtonStrata §§0.5, 2.3, 3.4 and 3.7 expose their reductive interfaces; its additional Newton classification and arithmetic theory remain there. Here the group-valued extensions concern arbitrary connected linear groups; reductive constructions are imported without a second definition or proof target. The classical complex period domains of HodgeStructures are a different object.

GeometricSatakeAndFusion GS0 owns the reductive Grassmannian and Schubert geometry. HeckeStacksAndLocalShtukas §§HS2.12 and HS2.15 owns reductive nonemptiness, classical period points and connectedness. The non-reductive statements here add the unipotent and Levi analysis. DiamondsAndVStacks D2, D4–D6 owns general sites, local systems, descent and seminormal diamondification. The definitions in Layer 4 specialize those carriers to two period lattices and retain the field of definition; they introduce no new site or general bundle-descent theorem. PerfectoidSpaces §§P4.15.6 and P6.11 owns strong closed quotients; PerfectoidQuotients does not supply a second such quotient.

PadicHodgeTheory §§5.5, 7.1 and 7.4 owns perfect-residue-field period functors, associated filtered-connection lattices, their position and uniqueness, and change of coefficient site. In §4.6, M0 is the trivial-filtration specialization of that associated-lattice functor; its construction and horizontal full faithfulness are imported. This roadmap proves the two-lattice essential-image and trace-exactness statements. MotivesAndAlgebraicCycles §§6.1–6.3 and 6.8 owns abstract neutral reconstruction, the subquotient/subobject criteria, connectedness recognition and tensor-Isom torsors. Only their application to the new categories belongs here; canonical reduction to the reconstructed subgroup is requested from MotivesAndAlgebraicCycles (gap:tannakian-canonical-reduction).

ReductiveGroups Layers 1–3, 5, 6A and 7 owns representations, Lie theory, subgroups, quotients, the unipotent radical and parabolic Levi decomposition. HodgeTateAndCanonicalSubgroups §2.14 owns splitting and type of exact tensor filtrations, their stabilizers and flag schemes, including for finite-type affine groups; AdicSpacesPartII R1.3 owns their analytification. HodgeTateAndCanonicalSubgroups §5.1 owns the ordinary Igusa tower and finite étale formal models, and AlgebraicModularFormsAndSerreWeights R15.3, The Igusa interpretation, owns full finite-level unit monodromy. Layer 6A supplies the characteristic-zero Levi complement and equivariant vector-layer central series. The adjoint-kernel and observable-quotient refinements have the extension contracts below. AInfCohomology §§AI.2.2–AI.2.3 owns BKF modules, their valid operations, its crystalline-rigidified variant and finite-free Fargues classification; its extension supplies rational rigidified modifications. FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4 owns finite-height Breuil–Kisin modules, which are a distinct category. The comparison in §2.7 consumes the BKF equivalence and is independent of Ax–Lindemann.

At the library pins, Mathlib already provides one-dimensional isocrystals and their classification, the absolute de Rham completion, and the Baire theorems listed below. Tau Ceti already reconstructs points of a known Hopf algebra from tensor automorphisms, supplies finite-subcomodule exhaustion, and realizes closed subgroups with finitely generated defining ideals as exterior-line stabilizers with their subgroup characters. These are used directly. Its Frobenius orbit space is topological and does not supply the sheafed curve or the period moduli used here. General Galois theory, rigid Zariski geometry and six operations retain the owners in the contracts; their lemmas are not repackaged as new theorems.

## Conventions

Fix a prime p. A p-adic field is complete, discretely valued, of characteristic zero, with perfect residue field of characteristic p; it is strict when that residue field is algebraically closed. Thus Q_p-breve is strict, and a finite extension of Q_p-breve is permitted. C is a complete algebraically closed extension of Q_p. Write k_C for its residue field and choose the compatible embedding C0=W(k_C)[1/p] into C. C0bar, Q_p-bar and Q_p-breve-bar mean algebraic closures inside C, and a bar does not mean completion. This is the field convention of HK II §1.6, pp. 12–13, and HK I §5.4, pp. 43–45.

Groups are connected linear algebraic groups over Q_p unless a different coefficient field is specified. A subgroup datum includes its closed embedding and the element identifying its isocrystal with the ambient one. A G-object is an exact tensor functor out of finite-dimensional algebraic representations. A G-Hodge structure or G-admissible pair over C is moreover required to have its rational fibre functor (V on HS(C), V_et on AdmPair(C)) isomorphic over Q_p to the standard fibre functor of Rep_Qp G (HKI, arXiv v2, §2.1.1, p. 11, §4.4, p. 36, and §5.2, p. 42; HKI line 512, HKI line 1673, HKI line 1965); the families of §§6.3 and 7.1 impose the same condition at every geometric point. The isomorphism is required to exist; a chosen one (an étale fibre trivialization) is additional framing data. The condition is not automatic: the unit object twisted by a nontrivial G-torsor over Q_p is an exact tensor functor whose values are sums of unit objects, yet its G-isocrystal violates §2.6 (see the PGL_2 Check there). It is not imposed on G-isocrystals or on bilatticed G-torsors over a complete DVR with algebraically closed residue field, whose underlying torsors are trivial (Steinberg over Q_p-breve, Hensel over the DVR). Tensor functors are linear over their indicated field. Tensor-generated categories include subquotients. All small sites and categories are placed in fixed compatible universes; the existing Tau Ceti reconstruction is used with its prescribed universe lift. A family base is nonempty and locally spatial wherever a faithful fibre functor is asserted. Neutral families have the fixed rational datum in their definition; they are distinct from variations with étale monodromy.

For the abstract bilattice statements let R be a complete DVR, K its fraction field, k its residue field and t a nonzero nonunit uniformizer. In particular R is a nonfield domain; the zero ring is excluded. These bilattice definitions also apply in equal characteristic, for example F₂[[t]]. For group and filtration statements in characteristic zero, fix a coefficient field in R, identify its image in the residue field, and make any necessary algebraically closed residue-field or cocharacter-splitting extension explicitly. A ramification-index-e extension multiplies elementary-divisor exponents by e. In the period setting use the invertible ideal Fil^1 B_dR+ intrinsically; a local generator ξ is used only in a local calculation. Fil^i B_dR denotes its i-th fractional power inside B_dR, including negative i.

The elementary divisors are defined by L2=⊕ R `t^{a_j}e_j` for an L1-basis. Therefore the first trace filtration has jumps −a_j. The two BB filtrations have opposite cocharacter types. The following rank-one calculation fixes every sign used in the build:

| Datum for the Tate object Q_p(n) | Value |
| --- | --- |
| Frobenius on its isocrystal | p^(−n)·σ |
| Isocrystal Newton slope | −n |
| Slope of the unmodified isocrystal bundle E(W) | n |
| Étale lattice in the isocrystal frame | Fil^n B_dR |
| De Rham lattice in the étale frame | Fil^(−n) B_dR |
| Hodge weight | −2n |

In general the Hodge weight is twice the isocrystal slope, while the isocrystal-to-bundle functor reverses slope. The pure weight-w modification has bundle slope −w/2. A basic vector admissible pair can have several isocrystal slopes, provided its lattice respects that grading. For a G-isocrystal, G-basicness requires the Newton homomorphism to be central in G. The centrality condition is retained in the G-Hodge invariant and represented-domain assertions. For example, a direct sum of two Tate objects is basic as a vector pair even though its diagonal Newton homomorphism need not be central in an artificially enlarged ambient GL group. See HK I Definition 4.2.1, pp. 32–33 (HKI line 1544), Theorem 5.1.6, pp. 41–42 (HKI line 1925), and HKII §6.2, pp. 36–37 (HKII line 1661).

Write Gr_[mu] for the good cell of lattice type [mu]. Its first BB map lands in Fl_[mu^-1]. The admissible condition is [b]∈B(G,[mu^-1]). The Hodge domain X_[mu] sits in Gr_[mu^-1], and its flag is Fl_[mu]. Hodge specialness uses adjoint weights ≤1; Hodge–Tate specialness uses weights ≥−1. Specialness uses both. For a non-reductive group, minuscule means the two-sided adjoint-weight bound. A reductive group's symmetric root weights make the two one-sided conditions equivalent. For a general connected linear group they differ.

Analytic closures in Layer 11 are intersections of containing level pullbacks. The intersection of an empty family is the whole ambient space. In the non-minuscule case no finite-union or topology-closure property is added to that definition. “Bi-analytic” includes the irreducibility and locally closed conditions stated there; an arbitrary finite union of special subvarieties is not automatically one bi-analytic set in this sense.

The arbitrary-field type theorem in Layer 6 requires an independent full-rank de Rham criterion. The cited Liu–Zhu theorem is over a finite extension of Q_p; resolving the source addresses singularities but not that field restriction. The supplier criterion is an independent mathematical input. Layer 6 type constancy and downstream uses of it are conditional on that input; fixed-type Grassmannian geometry cannot supply its own type hypothesis.

## Exact supplier contracts

All imported statements retain their supplier's hypotheses. General local coefficient fields and equal characteristic in the curve suppliers are specialized here only for the p-adic period setting; the abstract DVR bilattice results retain their own generality. Every gap below is an independent supplier obligation, not a hypothesis silently inferred from a fixed-type period cell.

### From Mathlib

Use Mathlib at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`.

- `WittVector.Isocrystal`, `WittVector.IsocrystalHom` and `WittVector.IsocrystalEquiv` in `Mathlib/RingTheory/WittVector/Isocrystal.lean`, lines 113, 132 and 138, give modules with a Frobenius-semilinear automorphism and Frobenius-compatible maps. The class itself imposes no finite-dimensionality; finite-dimensional objects are selected explicitly.
- `WittVector.StandardOneDimIsocrystal` and `WittVector.StandardOneDimIsocrystal.frobenius_apply`, in that file, lines 157 and 172, use Frobenius p^m σ. `WittVector.isocrystal_classification`, line 180, requires an algebraically closed characteristic-p field and finrank = 1. Full Dieudonné–Manin classification comes from VectorBundlesAndIsocrystals VB0.
- `dense_iInter_of_isOpen` and `nonempty_interior_of_iUnion_of_closed` in `Mathlib/Topology/Baire/Lemmas.lean`, lines 141 and 256, require a Baire space and a countable index type; the second requires a nonempty space and a closed cover. `BaireSpace.of_completelyPseudoMetrizable` in `Mathlib/Topology/Baire/CompleteMetrizable.lean`, line 25, supplies the complete-metrizable instance.
- The absolute `BDeRhamPlus` completion in `Mathlib/RingTheory/Perfectoid/BDeRham.lean`, line 75, is the adic completion of p-localized Witt vectors of the pretilt at the kernel of Fontaine θ. Its signature requires a commutative p-adically complete ring with p noninvertible and p prime; it does not require a perfectoid instance and does not itself assert a geometric DVR. If p = 0 in the input it is the zero ring. It supplies a native completion carrier. Its geometric DVR hypotheses and the relative coefficient sheaves are consumed through PadicHodgeTheory and RelativeFarguesFontaine; an absolute ring is not a relative period-local-system category.

### From Tau Ceti

Use Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The declaration `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor` in `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean`, line 138, identifies a known commutative Hopf algebra's points with tensor automorphisms of scalar extension of finite comodules. It assumes a field, a commutative Hopf algebra and the indicated universe lift. The abstract-category reconstruction consumed here is MotivesAndAlgebraicCycles §§6.1–6.3.

- `TauCeti.Subcomodule.exists_finite_subcomodule_mem` and `TauCeti.Subcomodule.iUnion_finiteSubcomodules_eq_univ` in `TauCeti/Algebra/Coalgebra/Subcomodule/Finite.lean`, lines 144 and 292, apply to a comodule over a coalgebra free as a module over a commutative semiring. Over a field, they give containment in finite-dimensional subcomodules and exhaustion by them. For the regular comodule Q_p[G], finite algebra generation gives a countable spanning set of monomials; finite sums of subcomodules containing its successive elements give an increasing countable exhaustion.
- `TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer` in `TauCeti/Algebra/AlgebraicGroup/Representation/ExteriorStabilizer/Character.lean`, line 101, assumes a field, a commutative Hopf algebra and a Hopf ideal finitely generated as an ideal. It supplies a line in an exterior power of a finite regular subcomodule, its unique subgroup character and the scheme-theoretic stabilizer equality over every commutative value algebra. For finite-type G the defining ideal is finitely generated by noetherianity; no reducedness or algebraic-closure hypothesis is added to this library input.

### From TauCetiRoadmap.RelativeFarguesFontaine

Use completed single-leg period rings, intrinsic Cartier fractional powers, meromorphic modifications, exact tensor gluing, change of structure group and positive-ring descent. The torsor-local-triviality theorem in §7.6 is reductive; extension to connected linear groups in Layers 1 and 5 uses their unipotent series.

Consumed sections: RelativeFarguesFontaine §4.10; RelativeFarguesFontaine §4.11; RelativeFarguesFontaine §4.12; RelativeFarguesFontaine §6.9; RelativeFarguesFontaine §7.2; RelativeFarguesFontaine §7.4; RelativeFarguesFontaine §7.6; RelativeFarguesFontaine §§6.6–6.8; RelativeFarguesFontaine §§6.6–6.9 and 7.6.

What RelativeFarguesFontaine must provide (gap:localized-period-module-descent): For an affine perfectoid untilt with degree-one divisor, identify v-locally finite free B_D-sheaves with finite projective B_D(S)-modules, including effective descent and compatibility with B_D+ restriction and tensor operations.

### From TauCetiRoadmap.ReductiveGroups

Use representations/comodules and faithful embeddings from Layer 1, Lie algebras and adjoint representations from Layer 2, subgroup schemes and fppf quotients with their representability hypotheses from Layer 3, the unipotent radical from Layer 5, the general characteristic-zero Levi complement and equivariant vector-layer series from Layer 6A, and parabolic Levi decomposition from Layer 7.

Consumed sections: ReductiveGroups Layers 1–3, 5, 6A and 7; Layer 6A item 1 supplies the equivariant central series.

What ReductiveGroups must provide (gap:adjoint-kernel-and-orbit-differential): Prove ker(Ad) = Z(G) for connected characteristic-zero linear groups and the image and kernel formulas for differentials of their flag-orbit maps.

What ReductiveGroups must provide (gap:observable-subgroup-embedding): Prove that a closed subgroup realized as a vector stabilizer is observable and has a representable quasi-affine homogeneous quotient, and distinguish this conclusion from the stronger affine-quotient hypothesis.

### From TauCetiRoadmap.HodgeTateAndCanonicalSubgroups

Use §2.14's fpqc-local splitting of exact tensor filtrations of fibre functors on Rep_k G for finite-type affine G, the cocharacter type, the filtration stabilizer P_mu and the flag scheme G/P_mu with base change. Over a characteristic-zero field the splitting torsor is under a split unipotent group and has a rational point. P_mu need not be parabolic when G is non-reductive.

Use §5.1 at F=Q for the ordinary elliptic Igusa tower, its finite étale formal models, transition maps and tautological dual-canonical-subgroup trivializations. Retain all primes, including p=2 and 3.

Consumed sections: HodgeTateAndCanonicalSubgroups §2.14; HodgeTateAndCanonicalSubgroups §5.1.

### From TauCetiRoadmap.AlgebraicModularFormsAndSerreWeights

Use R15.3, The Igusa interpretation (anchor target-igusa-interpretation-of-hasse-and-theta), for the full finite-level unit monodromy of the ordinary elliptic tower. Retain auxiliary rigidifying level before effective stabilizer quotients and the small primes. Surjectivity at every finite level gives surjectivity onto Z_p× by compactness of the profinite monodromy image.

Consumed sections: AlgebraicModularFormsAndSerreWeights R15.3 / target-igusa-interpretation-of-hasse-and-theta.

### From TauCetiRoadmap.AdicSpacesPartII

Use R1.3’s analytification functor on schemes locally of finite type over a complete nontrivially valued rank-one field, with its morphisms and base-change comparison. Applied to the supplied finite-type flag schemes, it gives the rigid flag varieties used in Layer 5.

Consumed sections: AdicSpacesPartII R1.3 / analytification-functor.

### From TauCetiRoadmap.PadicPeriodRings

Use §2's completion of an algebraic closure of any complete discretely valued characteristic-zero field K0 with perfect residue field of characteristic p, its continuous Galois action and `tateSen_H0`: C^G_K0=K0 and H⁰(G_K0,C(m))=0 for every nonzero integer m. Use §4.1's de Rham action, cyclotomic uniformizer and graded twists, and §4.3's fixed coefficient embedding K0→B_dR+ reducing to K0→C.

Consumed sections: PadicPeriodRings §2; PadicPeriodRings §4.1; PadicPeriodRings §4.3.

### From TauCetiRoadmap.VStackSheavesAndLisseCategories

Use §VS4.0's reductive BunGeometry, BunNewtonGeometry and BunAutomorphisms: the bundle v-stack with tensor/torsor descent, Newton strata and their full automorphism v-groups. Basic strata have constant rational-point automorphism groups; nonbasic strata retain the connected automorphism kernel. The connected-linear-group extensions use these reductive inputs.

Consumed sections: VStackSheavesAndLisseCategories §VS4.0 / bundle-stack-geometry.

### From TauCetiRoadmap.BunGAndNewtonStrata

Use the reductive G-isocrystal and torsor dictionaries, Newton and Kottwitz invariants, basicness, sigma-centralizers, the bundle v-stack and the full automorphism diamond. No nonbasic automorphism group is replaced by its rational constant subgroup.

Consumed sections: BunGAndNewtonStrata BG0 / g-isocrystals-and-B-of-G; BunGAndNewtonStrata BG0 / g-torsors-three-descriptions; BunGAndNewtonStrata BG1 §1.13 / sigma-centralizer-J-b; BunGAndNewtonStrata BG1 / admissible-finiteness-and-basic; BunGAndNewtonStrata BG1 / newton-and-kottwitz-maps; BunGAndNewtonStrata BG1 / torus-norm-description; BunGAndNewtonStrata BG2:uniformization / beauville-laszlo-surjectivity; BunGAndNewtonStrata BG2:uniformization / bun-g-as-v-stack; BunGAndNewtonStrata BG3 / full-automorphism-v-group; BunGAndNewtonStrata BG3 / semistable-locus-and-basic-strata.

### From TauCetiRoadmap.VectorBundlesAndIsocrystals

Use finite-dimensional slope decompositions, reversal of Newton slope by the isocrystal-to-bundle functor, full bundle classification, fixed-slope abelianness, Hom/Ext computations and relative slope-zero local systems and constant-slope local triviality.

Consumed sections: VectorBundlesAndIsocrystals VB0 / dieudonne-manin-isocrystals; VectorBundlesAndIsocrystals VB0 / tensor-and-dual-slopes; VectorBundlesAndIsocrystals VB1 / cohomology-of-twists; VectorBundlesAndIsocrystals VB1 / isocrystal-to-bundle-functor; VectorBundlesAndIsocrystals VB2:classification / dieudonne-manin-classification-of-bundles; VectorBundlesAndIsocrystals VB2:classification / fixed-slope-abelian-category; VectorBundlesAndIsocrystals VB2:classification / hom-and-ext-calculus; VectorBundlesAndIsocrystals VB4 / relative-HN-filtration-and-proetale-splitting; VectorBundlesAndIsocrystals VB4 / slope-zero-local-systems.

### From TauCetiRoadmap.ReductiveGroupsPartII

Use RG2.0 point topologies, congruence neighbourhoods and smooth openness, and RG2.1 Steinberg triviality with the supplier’s coefficient-field hypotheses.

Consumed sections: ReductiveGroupsPartII RG2.0 / congruence-neighbourhood-basis; ReductiveGroupsPartII RG2.0 / points-topological-group; ReductiveGroupsPartII RG2.0 / scheme-point-topology; ReductiveGroupsPartII RG2.0 / smooth-morphism-open-map; ReductiveGroupsPartII RG2.1 / steinberg-quasi-split.

### From TauCetiRoadmap.MotivesAndAlgebraicCycles

Use §§6.1–6.3’s neutral recognition, finite-type generation, subquotient/subobject criteria and characteristic-zero connectedness recognition, and §6.8’s affine tensor-Isom torsor with scalar extension, effective descent and commuting actions. A rational section is additional data.

Consumed sections: MotivesAndAlgebraicCycles §6.3; MotivesAndAlgebraicCycles §6.8; MotivesAndAlgebraicCycles §§6.1–6.2; MotivesAndAlgebraicCycles §§6.1–6.3 and 6.8.

What MotivesAndAlgebraicCycles must provide (gap:tannakian-canonical-reduction): Supply canonical reduction of a tensor-generated neutral object to its reconstructed closed subgroup, compatible with all tensor constructions, quotient tensor functors and scalar extension.

### From TauCetiRoadmap.DiamondsAndVStacks

Use D3.10’s locally profinite torsor level spaces and inverse-limit identification over perfectoid bases, D3.6’s morphism classes and D3.9’s descent of separated étale morphisms to diamond targets, together with the specified covering, v-descent, locally spatial and small-stack constructions, locally closed generalizing subdiamonds, profinite products with universally closed projection, and seminormal rigid full faithfulness over a complete nonarchimedean extension of Q_p, with their stated size and site hypotheses. For a profinite P in the chart universe and a locally spatial S, D5.10 identifies |P̲ × S| with P × |S| and makes the projection quasicompact, separated and universally closed.

Consumed sections: DiamondsAndVStacks D3 / locally-profinite-torsors; DiamondsAndVStacks D3 / etale-and-quasi-pro-etale-morphisms-of-stacks; DiamondsAndVStacks D3 / v-local-nature-of-morphism-classes; DiamondsAndVStacks D1 / universally-open-std-cover; DiamondsAndVStacks D2 / small-pro-etale-site-and-v-site; DiamondsAndVStacks D2 / v-descent-of-functions; DiamondsAndVStacks D2 / vector-bundles-across-pro-etale-and-v-sites; DiamondsAndVStacks D4 / small-v-sheaves-and-small-v-stacks; DiamondsAndVStacks D4 / spaces-and-surjectivity-for-small-v-stacks; DiamondsAndVStacks D5 / locally-closed-generalizing-subdiamond; DiamondsAndVStacks D5 / spatial-diamond; DiamondsAndVStacks D5 / profinite-products-of-locally-spatial-diamonds; DiamondsAndVStacks D6 / etale-site-comparison; DiamondsAndVStacks D6 / gluing-and-the-diamond-functor; DiamondsAndVStacks D6 / seminormal-rigid-full-faithfulness.

### From TauCetiRoadmap.HeckeStacksAndLocalShtukas

Use classical admissible/weakly admissible comparison with integral Kottwitz equality in §HS2.12, and reductive arbitrary-type nonemptiness, finite-extension-valued admissible points and connectedness in §HS2.15; these do not assume the non-reductive results here.

Consumed sections: HeckeStacksAndLocalShtukas §HS2.12; HeckeStacksAndLocalShtukas §HS2.15.

### From TauCetiRoadmap.AInfCohomology

Use §§AI.2.2–AI.2.3’s BKF modules, valid tensor/dual operations, crystalline-rigidified variant and finite-free Fargues classification. Do not use abelianness of the unrigidified finitely presented category.

Consumed sections: AInfCohomology §AI.2.2; AInfCohomology §AI.2.2, “Operations in valid BKF subcategories”; AInfCohomology §AI.2.3; AInfCohomology §§AI.2.2–AI.2.3.

What AInfCohomology must provide (gap:rational-rigidified-bkf-modifications): Supply the tensor equivalence between rational rigidified BKF modules and modifications (E₁,E₂,α,β) with E₁ trivial and β a slope-filtration splitting, preserving both realizations.

### From TauCetiRoadmap.PadicHodgeTheory

Use §5.5’s perfect-residue period functors and tensor-torsor interpretation, §7.1’s associated-lattice functor, lattice-position uniqueness and horizontal full faithfulness, §7.4’s smooth rigid/diamond coefficient equivalence and §§2.2–2.3’s structural-period pushforwards. The finite-Q_p Liu–Zhu theorem does not establish the arbitrary-field criterion below.

Consumed sections: PadicHodgeTheory §5.5; PadicHodgeTheory §7.1; PadicHodgeTheory §7.1, lattice-position uniqueness; PadicHodgeTheory §7.4; PadicHodgeTheory §§2.2–2.3; PadicHodgeTheory §§7.1 and 7.4.

What PadicHodgeTheory must provide (gap:strict-field-serre-openness): Prove Serre openness for every Hodge–Tate representation over a strict p-adic field in its connected algebraic envelope, with the hypotheses of HKI Corollary 5.5.3.

What PadicHodgeTheory must provide (gap:arbitrary-field-full-rank-de-rham): For smooth rigid X over any complete discretely valued L/Q_p with perfect residue field and a Q_p-local system T, prove that a full-rank constant flat bundle E = ν_*(T ⊗ OB_dR) with invertible horizontal comparison determines a unique exhaustive locally split Griffiths-transversal filtration whose associated lattice is T ⊗ B_dR+, compatibly with tensor operations and pullback, independently of admissible-pair type constancy.

### From TauCetiRoadmap.AdicSpacesPartV

AdicSpacesPartV continues AdicSpacesPartII with the Zariski geometry of rigid spaces: Zariski closed subsets and dimension, irreducible components, singular strata, classical and weakly Shilov points, resolution, and the analytic manifold of classical points. Rigid spaces are over a complete field K with a nontrivial rank-one valuation. Each consumed target is assumed with the following hypotheses and conclusion.

- RZ.0 / local-dimension: dim_x X is the least Krull dimension of an affinoid neighbourhood of x; for Zariski closed Z, dim_z Z is computed on Z_red. RZ.0 / proper-image-zariski-closed: a proper morphism sends |Y| and every Zariski closed subset of Y to Zariski closed subsets.
- RZ.1 / irreducibility-criterion: a nonempty X is irreducible iff the only Zariski closed subset containing a nonempty open is X; then every proper Zariski closed subset is nowhere dense. RZ.1 / full-dimensional-closed-subset: in irreducible X a Zariski closed Z with dim_z Z=dim X at one z equals X; in smooth M a connected Zariski closed Y with dim_y Y=dim_y M at one y is the connected component of M through y.
- RZ.2 / singular-stratification: for K of characteristic zero and reduced Y of finite dimension, iterated singular loci strictly drop dimension and give finitely many smooth locally closed strata. RZ.2 / rank-loci: for a morphism of smooth rigid spaces the loci of differential rank ≥r are Zariski open; on connected source the maximal-rank locus has nowhere dense complement.
- RZ.3 / rigid-analytic-point: a point over Spd L given by Spd L′→S with L′/L finite, up to the evident equivalence. RZ.3 / classical-points-rigid-analytic-points: for a rigid Y over L these classes correspond bijectively to classical points, and those with source Spd L′ to Y(L′). RZ.3 / gauss-point-in-closure: if the residue field of L is infinite, a closed subset containing the L-points of an open polydisc neighbourhood contains its Gauss point; the conclusion fails for finite residue field.
- RZ.4 / weakly-shilov-point: a point that is Shilov in some affinoid open; such points have rank one and meet every nonempty affinoid open. RZ.4 / weakly-shilov-avoid-nowhere-dense: a nowhere dense Zariski closed subset contains no weakly Shilov point (BhattHansen, Corollary 2.10; BhattHansen line 346).
- RZ.5 / resolution-consequences: for L/Q_p complete and S reduced, the resolution S̃→S is proper and surjective with S̃ smooth, an isomorphism over the dense smooth locus, a v-cover after diamondification, and S̃ is connected when S is irreducible.
- RZ.6 / manifold-of-classical-points: for V smooth of pure dimension m over a complete nonarchimedean F, V(F) is an F-analytic manifold of dimension m and morphisms induce analytic maps with differential df. RZ.6 / constant-rank-theorem: in characteristic zero, an analytic map of constant rank k near a is, in suitable charts, the inclusion of the first k coordinates. RZ.6 / smooth-morphism-submersion: in characteristic zero, a smooth morphism of smooth rigid spaces is a submersion on F-points; orbit maps G(F)→(G/H)(F) are submersions. RZ.6 / subfield-identity-theorem: for complete characteristic-zero fields E⊆C with E closed and the restricted norm, and a smooth algebraic group G over E, an analytic function near 1 in G(C) vanishing on an open subgroup of G(E) vanishes near 1.

Consumed sections: AdicSpacesPartV RZ.0 / local-dimension; AdicSpacesPartV RZ.0 / proper-image-zariski-closed; AdicSpacesPartV RZ.1 / full-dimensional-closed-subset; AdicSpacesPartV RZ.1 / irreducibility-criterion; AdicSpacesPartV RZ.2 / rank-loci; AdicSpacesPartV RZ.2 / singular-stratification; AdicSpacesPartV RZ.3 / classical-points-rigid-analytic-points; AdicSpacesPartV RZ.3 / gauss-point-in-closure; AdicSpacesPartV RZ.3 / rigid-analytic-point; AdicSpacesPartV RZ.4 / weakly-shilov-avoid-nowhere-dense; AdicSpacesPartV RZ.4 / weakly-shilov-point; AdicSpacesPartV RZ.5 / resolution-consequences; AdicSpacesPartV RZ.6 / constant-rank-theorem; AdicSpacesPartV RZ.6 / manifold-of-classical-points; AdicSpacesPartV RZ.6 / smooth-morphism-submersion; AdicSpacesPartV RZ.6 / subfield-identity-theorem.

### From TauCetiRoadmap.PerfectoidSpaces

Use §P4.15.6’s surjective universal perfectoid quotient and its completed integral model, plus ring and zero/unit ideal conventions, and §P6.11’s strong closedness comparison. This makes successive closed perfectoid zero loci closed in the original affinoid.

Consumed sections: PerfectoidSpaces §P4.15.6, completed integral quotient and its plus ring; PerfectoidSpaces §§P4.15.6 and P6.11.

### From TauCetiRoadmap.GeometricSatakeAndFusion

Use reductive loop quotients, Schubert bounds, local spatiality, open-cell stabilizers, smooth truncated positive loops and action truncation. No minuscule hypothesis is imposed on the general Schubert theory.

Consumed sections: GeometricSatakeAndFusion GS0:Schubert-smoothness / open-cell-stabilizer-and-smoothness; GeometricSatakeAndFusion GS0:Schubert-smoothness / truncated-positive-loops; GeometricSatakeAndFusion GS0:Schubert-smoothness / truncation-of-the-loop-action; GeometricSatakeAndFusion GS0:loop-geometry / grassmannian; GeometricSatakeAndFusion GS0:loop-geometry / schubert-bounds-and-properness.

### From TauCetiRoadmap.DiamondSixOperations

Use lower-shriek base change and projection formula in §S2.4, Verdier duality in §S3.2 and smooth twisted pullback in §§S4.2–S4.3. Structure maps in §6.7 are separated, compactifiable and locally of finite target dimension, with ℓ ≠ p.

Consumed sections: DiamondSixOperations §S2.4; DiamondSixOperations §S3.2; DiamondSixOperations §S4.2; DiamondSixOperations §S4.3.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

Use §12.5’s Gross–Hopkins and Hodge–Tate period morphisms and §12.11’s basic infinite-level EL duality, with its group-action and inverse-transpose conventions for the classical Lubin–Tate/Drinfeld comparison.

Consumed sections: EndoscopicTransferAndUnitaryTraceComparison §12.11; EndoscopicTransferAndUnitaryTraceComparison §12.5.

### From TauCetiRoadmap.IgusaVarietiesAndTorsionConcentration

Layer IG.1 supplies Igusa moduli and their group actions. Import the ordinary elliptic tower and its finite étale formal models from HodgeTateAndCanonicalSubgroups §5.1, and full finite-level unit monodromy from AlgebraicModularFormsAndSerreWeights R15.3, The Igusa interpretation. The remaining extension compares these supplied objects with crystalline frames.

Consumed sections: IgusaVarietiesAndTorsionConcentration Layer IG.1.

What IgusaVarietiesAndTorsionConcentration must provide (gap:ordinary-katz-igusa-monodromy): Compare the supplied ordinary elliptic Igusa tower and its full unit monodromy with the integral frame reduction of the rational crystalline-frame torsor, preserving the unit-root crystalline trivialization, Tate normalization and special/generic-fibre transition.

### From TauCetiRoadmap.PerfectoidShimuraVarieties

Use the Hodge-type open perfectoid tower over C in §2.2 and its Hodge–Tate period map in §§3.1 and 3.5, preserving level maps and equivariance. The separate uniformization gap is an explicit hypothesis of §12.4.

Consumed sections: PerfectoidShimuraVarieties §2.2; PerfectoidShimuraVarieties §§3.1 and 3.5.

What PerfectoidShimuraVarieties must provide (gap:basic-hodge-type-uniformization): Supply basic Hodge-type uniformization over the completed maximal unramified reflex field, retaining the diagonal discrete arithmetic quotient and compatibility with both local period maps.

### From TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurves

Use the arithmetic component quotient §R18.5.7, Čerednik–Drinfeld uniformization §R18.5.15, actual Drinfeld module/level comparison §R18.5.20 and compatible all-level uniformization §R18.5.21. Retain neatness, arithmetic stabilizers and the central-twisted descent datum.

Consumed sections: HilbertModularVarietiesAndShimuraCurves §R18.5.15; HilbertModularVarietiesAndShimuraCurves §R18.5.20; HilbertModularVarietiesAndShimuraCurves §R18.5.21; HilbertModularVarietiesAndShimuraCurves §R18.5.7.

### From TauCetiRoadmap.AdicSpaces

AdicSpaces Layer 6 supplies the fixed Fargues–Fontaine curve, with the sheafed-curve structure required for its bundles. Relative period modifications and constant-slope assertions use the RelativeFarguesFontaine and VectorBundlesAndIsocrystals contracts.

### From TauCetiRoadmap.AlgebraicVectorBundles

AlgebraicVectorBundles L0A–L0C and L2A–L2B supplies ordinary bundle tensor, finite locally free sheaf and geometric bundle comparisons. Period descent is the RelativeFarguesFontaine contract.

## How to read the build

Layer 0 fixes bilattice types, with specialization before the exactness criterion. Layer 1 treats connected-linear-group basic bundles; Layers 2–3 give pointwise categories, arithmetic openness and CM. Layers 4–5 establish relative trace and Grassmannian geometry. Layer 6 constructs neutral families and admissible domains; its type theorem and every use of it assume the independent arbitrary-field de Rham supplier criterion. Layers 7–8 construct Hodge domains and line/subgroup loci. Layer 9 adds both frames and proves basic duality before deducing Hodge-domain connectedness. Layer 10 provides generic classical points, Layer 11 proves the two Ax–Lindemann forms and period-image density, and Layer 12 applies them to variations and arithmetic quotients. [Suggested.lean](Suggested.lean) records which headline signatures cannot be expressed on the pinned carriers; the complete mathematical specification is this README.

## Layer 0: Bilattices, trace filtrations and goodness

Define pointwise lattices and the two trace filtrations, their opposed types and Tate twists. Prove exactness criteria for goodness, adjoint-weight recovery and specialization dominance, retaining the additive-group counterexample.

### 0.1 Lattices and bilattices

For a complete discrete valuation ring R with fraction field K, uniformizer t and residue field k, a lattice in a finite-dimensional K-space V is a finite free R-submodule spanning V. A bilattice is (V,L1,L2); morphisms are K-linear maps preserving both lattices. A morphism f is strict when f(Li)=f(V)∩Li′ for i=1,2. A complex is exact when its underlying K-vector-space complex and both R-lattice complexes are exact; equivalently it is exact on K-spaces and all arrows are strict. Tensor products and duals use this exact structure. Define decreasing trace filtration trFil^i(L1/tL1)=image((t^i L2)∩L1→L1/tL1). The elementary-divisor type is the multiset of a_j with L2=⊕R `t^{a_j}e_j` for a basis of L1.

(HKI, arXiv v2, Definition 3.2.1 and Lemma 3.2.3, p. 24; §3.1, pp. 19–23; HKI line 1106, HKI line 1109, HKI line 1131).

The interface consists of the following operations and laws.

- A pair of finite free spanning R-submodules of V determines a bilattice.
- Short exactness is tested on both lattice sequences; tensoring with any bilattice and dualizing preserve these short exact sequences because all lattices are finite free.
- trFil^i is the indicated image subspace of L1/tL1 and decreases with i.
- A bilattice isomorphism preserves elementary-divisor type. A complete-DVR extension of ramification index e multiplies every elementary divisor by e; in particular an index-one extension preserves type.
- Exchanging L1 and L2 negates the elementary-divisor multiset.

Use elementary divisors over the complete DVR. Define the intersection before taking its image; quotienting L2 alone gives the wrong trace filtration.

The consuming constructions use this interface as follows. §4.4: Defines both Bialynicki–Birula filtrations and their relative types. §5.1: Records relative position of a modification.

**Checks.**

- For L1=R and L2=t^aR, trFil^i=k exactly when i≤−a; it is zero when i>−a.
- For L1=L2 of positive rank, the only filtration jump is zero and every elementary divisor is zero. At rank zero both the jump set and the elementary-divisor list are empty. Under t=u^e the rank-one type a becomes e*a; invariance is asserted only for ramification index one.
- Over k((t)), L2=R e1+R(e2+t^-1e1) and L1=R^2 have type {−1,1}; the induced lattices on the subline k((t))e1 and quotient both have type {0}.
- Multiplication by t on (K,R,R) is an underlying K-isomorphism but is not strict: tR differs from K∩R=R, and its lattice cokernel is R/tR. Thus underlying-vector-space exactness alone is insufficient.

**Acceptance.** Checks distinguish the filtration from the lattice and are invariant under a change of uniformizer.

*Needs:* RelativeFarguesFontaine §4.10; RelativeFarguesFontaine §4.11; RelativeFarguesFontaine §4.12.

### 0.2 Good G-bilattices

Let R be a complete DVR of characteristic zero with algebraically closed residue field k and a coefficient section k→R, and let K=Frac(R). For a connected linear algebraic G/k and a bilatticed G(K)-torsor (an exact tensor functor Rep_k G→bilattices), call it good of type [mu] when, after trivializing the first lattice, the second lies in G(R)t^muG(R). For finite exhaustive separated decreasing filtrations, a filtration-preserving f is strict when f(F^j V)=f(V)∩F^j V′ for every integer j. Filtered exactness means exactness at every filtration step, equivalently exactness of the associated graded complex. Filtered G-functors are exact tensor functors to these filtered k-spaces; their type is the conjugacy class of a splitting cocharacter, using HodgeTateAndCanonicalSubgroups §2.14. The algebraically closed residue field makes the lattice torsors trivial over R and splits the cocharacters. For a non-algebraically-closed residue field the double-coset test is used only after the explicit algebraically closed extension, not as a test on an untrivialized torsor over R.

(HKI, arXiv v2, Definition 3.1.1 and the exact structures following it, p. 20, and §3.2, Definition 3.2.5, pp. 23–25; HKI line 936, HKI line 944, HKI line 1151, HKI line 1168).

The interface consists of the following operations and laws.

- Goodness and [mu] are independent of a trivialization and of a splitting field.
- A homomorphism G→H sends a good object of type [mu] to a good object of induced type.
- For type [mu], BB1 has type [mu^-1] and BB2 has type [mu].
- The G-structure is retained as tensor data; an arbitrary faithful vector representation alone is not a definition of goodness.

Use the torsor/representation dictionary and the imported splitting and type theorem for exact tensor filtrations. Form the cocharacter double coset, checking independence of trivialization.

The consuming constructions use this interface as follows. §0.4: Relates actual group-valued relative position to exactness. §§5.1 and 6.4: Define fixed-type cells and family types.

**Checks.**

- The bilattice (K^n,R^n,t^muR^n) is good with exactly its declared cocharacter type.
- For G_a embedded unipotently in GL_2, the lattice with off-diagonal t^-1 is not good: G_a has only the zero cocharacter. At filtration step zero the ambient trace is k e1 and its image in the quotient is 0, whereas the quotient trace is k. The underlying exact extension therefore fails filtered exactness.
- For a split torus every bilattice is good, and type is its cocharacter tuple, without Weyl-group identifications beyond that torus.
- Over Q_p[[t]], the torsor of a quaternion division algebra for PGL_2 has Brauer invariant 1/2 and cannot be trivialized. Taking both lattice torsors equal gives an exact trivial trace filtration but no double-coset presentation over Q_p[[t]]. After extending to Q_p-bar[[t]], its invariant is zero and its type is zero. This is why the residue-field hypothesis is explicit.

- For G=G_m⋉G_a with mu of weight −1 on Lie G_a, the filtration stabilizer P_mu is G_m and G/P_mu is A¹. For mu^-1 the stabilizer is all G and the flag is a point. A reductive-only flag construction would miss the affine-line case.

**Acceptance.** Check the G_a lattice non-example and both opposing type conventions.

*Needs:* §0.1; ReductiveGroups Layer 1; HodgeTateAndCanonicalSubgroups §2.14.

### 0.3 Specialization dominance

Write G=M⋉U over an algebraically closed characteristic-zero field. For a bilattice with Levi type [mu_M], let [mu] be its induced G-cocharacter class. In every representation rho, rho([mu]) is dominated by the actual vector-bilattice type, with equal determinant degree. Equality in one closed faithful representation is equivalent to goodness of type [mu]. This is a comparison of types, not semicontinuity of all non-reductive cells in families.

(HKI, arXiv v2, Theorem 3.5.1, pp. 30–31; HKI line 1413).

Conjugate the Levi lattice to standard form. Order unipotent weight factors and use exterior-power lattice bounds for dominance. Equality in a faithful representation forces the residual weight factors to be integral in the required coordinates.

**Acceptance.** In the G_a extension, the Levi type is (0,0) while the actual GL_2 type is (1,−1); this fixes the dominance orientation.

*Needs:* §0.2; ReductiveGroups Layers 5 and 6A.

### 0.4 Exactness criterion for goodness

Let R be a complete characteristic-zero DVR with algebraically closed residue field k, coefficient section k→R and fraction field K, and let G/k be connected linear. For a bilatticed G(K)-torsor, the following are equivalent: it is good; BB1 is an exact filtered G-functor; BB2 is an exact filtered G-functor. For good type [mu], these functors have types [mu^-1] and [mu]. The BB functors preserve tensor products and duals but are not exact on arbitrary bilattices.

(HKI, arXiv v2, Theorem 3.2.6, p. 25, with proof on pp. 30–31 using Theorem 3.5.1; HKI line 1176).

A good cocharacter double coset gives two split exact filtered tensor functors. Conversely split an exact trace filtration by a cocharacter and pass to the reductive Levi quotient. Use specialization dominance to compare the induced Levi type with every representation type. Exactness forces equality in a faithful representation, hence goodness. Exchange the two lattices to obtain the second criterion.

**Acceptance.** The G_a example fails exactness on its defining extension, rather than contradicting tensor compatibility.

*Needs:* §0.2; §0.3; HodgeTateAndCanonicalSubgroups §2.14.

### 0.5 Recovery from a filtration

Let R be a complete characteristic-zero DVR with fraction field K, algebraically closed residue field C, uniformizer t and a coefficient section C→R. For connected linear G/C and a cocharacter mu, the pointwise BB map on the good type-[mu] cell is bijective if all Ad(mu)-weights are ≤1.

For the fixed-point assertion put kGamma=C^Gamma, where Gamma acts on R preserving its maximal ideal. Require the restriction of the coefficient section to kGamma→R to be fixed pointwise by Gamma, a connected linear G/kGamma and a kGamma-defined class [mu], and gamma(t)=chi(gamma)t for a character chi:Gamma→kGamma×. For every nonzero integer m assume C(chi^m)^Gamma=0, where gamma acts on this twisted coefficient space by c↦chi(gamma)^m gamma(c). Then the Gamma-fixed good type-[mu] lattices are exactly the canonical lattices of kGamma-rational flags in Fl_[mu^-1].

In the p-adic application take K0 complete discretely valued of characteristic zero with perfect residue field of characteristic p, C the completed algebraic closure of K0, R=B_dR+(C), and Gamma=Gal(K0bar/K0). PadicPeriodRings §2 gives C^Gamma=K0 and the vanishing of every nonzero cyclotomic twist; §§4.1 and 4.3 give gamma(t)=chi_cyc(gamma)t and the fixed embedding K0→R. No action of this Galois group on a larger arbitrary C is presumed.

(HKI, arXiv v2, Proposition 3.1.7 and Example 3.1.10, pp. 22–23; HKI line 1043, HKI line 1083). The fixed-point assertion uses the twisted-invariant hypothesis above: infinite-order scaling in Proposition 3.1.7(2) alone does not suffice (HKI line 1047).

For the weight bound compute positive-loop weight coordinates and their truncation degrees. For fixed points first descend the trace flag to kGamma and form its canonical lattice using its tensor splitting. Compare an invariant lift with that lattice through successive congruence quotients; every nonzero lifting parameter lies in a nonzero t-degree twisted coefficient space, whose invariants vanish. Completeness then gives equality. This avoids the unsupported coefficient-descent step in the source proof at HKI line 1065.

**Checks.**

- For G=GL_2 and mu=(2,0), the lattices ⟨t²e1,e2+c t e1⟩, c∈C, have the same trace flag but are distinct for distinct c. The adjoint weight 2 leaves a nontrivial BB fibre; for type (1,0) no such parameter remains.
- Let C be an algebraic closure of Q(u), extend u↦2u to an automorphism gamma of C, put R=C[[t]] and gamma(t)=2t, and write kGamma=C^gamma. The invariant lattice ⟨e1,e2+u t^-1 e1⟩ has type (−1,1), trace flag C² for i≤−1, Ce1 for i=0,1 and zero for i≥2. That flag is kGamma-rational, but its canonical lattice ⟨t^-1 e1,t e2⟩ differs: t^-1 e1 is absent from the original lattice. The nonzero invariant u in C(chi^-1) excludes this example from the theorem.
- If Gamma acts trivially on C and chi has infinite order, C(chi^m)^Gamma=0 for m≠0: some gamma has chi(gamma)^m≠1. For K0=Q_p, including p=2 and 3, Tate–Sen instead gives H⁰(G_K0,C(m))=0 for m≠0 and H⁰(G_K0,C)=Q_p. The canonical Tate lattice t^aR is invariant and its trace jump is −a.

**Acceptance.** The fixed coefficient section and twisted-invariant vanishing are required for fixed-lattice recovery.

*Needs:* §0.4; HodgeTateAndCanonicalSubgroups §2.14; PadicPeriodRings §2; PadicPeriodRings §4.1; PadicPeriodRings §4.3; RelativeFarguesFontaine §4.10; RelativeFarguesFontaine §4.11; RelativeFarguesFontaine §4.12.

### Examples

Take L1=R² and L2=R e1+R(e2+t^(−1)e1). The determinant valuation is zero, but the smallest entry valuation is −1, so the elementary divisors are −1 and 1. On the subline K e1 and the quotient K²/K e1 the induced lattice pairs both have type zero. At filtration index zero, the ambient trace image is k e1; its image in the quotient is zero, whereas the quotient's own trace filtration is k. This computes the failure of exactness on the unipotent extension. The G_a cocharacter is zero, so this bilattice is outside its good cell. (HK I Examples 3.1.4 and 3.1.11, pp. 20–23, and Theorem 3.5.1, pp. 30–31; HKI line 970)

For L2=t^aR the condition t^(i+a)R∩R maps nontrivially to k precisely when i+a≤0. Swapping lattices negates a; replacing t by u^e multiplies it by e. Thus the trace jump is −a, and a ramified base change changes the normalization of type. The opposite type negates every adjoint weight, exchanging the two one-sided bounds.

### Dependencies

- PadicPeriodRings §§2, 4.1 and 4.3.
- HodgeTateAndCanonicalSubgroups §2.14.
- RelativeFarguesFontaine §4.10.
- RelativeFarguesFontaine §4.11.
- RelativeFarguesFontaine §4.12.
- ReductiveGroups Layer 1.
- ReductiveGroups Layers 5 and 6A.

## Layer 1: Non-reductive isocrystals and basic bundles

Extend G-isocrystals and B(G) along a Levi quotient, define basicness in G and the sigma-centralizer, and prove the basic-stratum theorem and basic twisting for Bun_G. Import the reductive theory; do not classify arbitrary non-reductive bundle strata.

### 1.1 G-isocrystals and basic classes

For connected linear G/Q_p, a G-isocrystal is an exact tensor functor Rep_Qp G→Isoc(Q_p-breve). Its isomorphism classes form B(G), equivalently sigma-conjugacy classes in G(Q_p-breve). Define its Newton homomorphism nu:D→G over Q_p-breve and call it basic when nu is central in G. Define B(G,[mu]) by the inverse image of B(M,[mu_M]) for the reductive Levi quotient M=G/R_uG.

(HKII, arXiv v2, §4.1 and Remark 4.1.1, p. 26; HKII line 1173, HKII line 1191; HKI, arXiv v2, §2.2.3, pp. 14–15; HKI line 636).

The interface consists of the following operations and laws.

- b defines the functor with Frobenius rho(b) sigma in every representation rho.
- b and b′ define isomorphic functors iff b′=g b sigma(g)^-1.
- b is basic iff the isocrystal Ad(b) is isoclinic of slope zero, using ker(Ad)=Z(G) (gap:adjoint-kernel-and-orbit-differential).
- A homomorphism sends G-isocrystals to H-isocrystals, with transported Newton grading; basicness is asserted only when the transported grading is central.

Use Steinberg for the reductive quotient and successive split vector-group quotients for the unipotent radical. Identify the representation functor of b with Frobenius rho(b) sigma. Obtain Newton grading representationwise from Dieudonné–Manin.

The consuming constructions use this interface as follows. §§2.1–2.2: Matches Hodge weights and admissible invariants. §6.5: Labels the source bundle of modifications.

**Checks.**

- Every torus class is basic, although its Newton slope can be nonzero.
- For the upper triangular Borel of GL_2, diag(p,1) is basic in the diagonal Levi but not in the Borel: its adjoint unipotent direction has nonzero slope.
- The identity class is basic in any connected G; its representation functor has only slope zero.

**Acceptance.** Basicness must be tested in G, not merely its Levi quotient.

*Needs:* BunGAndNewtonStrata BG0 / g-isocrystals-and-B-of-G; BunGAndNewtonStrata BG1 §1.13 / sigma-centralizer-J-b; BunGAndNewtonStrata BG0 / g-torsors-three-descriptions; BunGAndNewtonStrata BG1 / newton-and-kottwitz-maps; BunGAndNewtonStrata BG1 / admissible-finiteness-and-basic; BunGAndNewtonStrata BG1 / torus-norm-description; VectorBundlesAndIsocrystals VB0 / dieudonne-manin-isocrystals; VectorBundlesAndIsocrystals VB0 / tensor-and-dual-slopes; ReductiveGroupsPartII RG2.1 / steinberg-quasi-split; ReductiveGroups Layers 5 and 6A; ReductiveGroups Layer 2; `WittVector.Isocrystal`; `WittVector.StandardOneDimIsocrystal`; `WittVector.isocrystal_classification`.

### 1.2 Levi invariance of B(G)

For a characteristic-zero connected linear group G with Levi M, B(M)→B(G) and B(G)→B(M) are inverse bijections; the induced B(G,[mu]) is independent of the Levi splitting. Basicness in G implies basicness in M, but the converse can fail and B(G,[mu]) need not contain a G-basic class.

(HKII, arXiv v2, §4.1 and Remark 4.1.1, p. 26; HKII line 1191; HKI, arXiv v2, §2.2.3, pp. 14–15; HKI line 636).

Use semisimplicity of isocrystals to split the unipotent filtration of each tensor functor. Compare two splittings by the unipotent conjugacy of Levis. Transport the reductive Kottwitz condition.

**Acceptance.** Levi invariance concerns isocrystal classes; non-reductive bundle classification requires the basic-stratum hypothesis.

*Needs:* §1.1.

### 1.3 Sigma-centralizer and inner form

For a G-isocrystal W_b, construct the linear algebraic Q_p-group G_b=Aut^tensor(W_b); its Q_p-points are {g∈G(Q_p-breve):g b=b sigma(g)}. If b is G-basic, the Newton grading is central, G_b is an inner form of G, and its Q_p-breve-points identify with those of G with twisted Frobenius Int(b)∘sigma.

(HKII, arXiv v2, §4.1, equation (4.1.1.1), p. 26; §4.2, pp. 28–29; HKII line 1199, HKII line 1205).

The interface consists of the following operations and laws.

- G_b(Q_p) is exactly the indicated sigma-centralizer.
- Changing b by g b sigma(g)^-1 transports G_b by conjugation with g.
- For basic b, descent on G(Q_p-breve) is sigma_b=Int(b)∘sigma.
- For each coefficient algebra, points represent tensor automorphisms of W_b after scalar extension.

Represent the tensor automorphism functor using a tensor generator. Identify its rational points by Frobenius compatibility. In the basic case use centrality to descend the inner twist.

The consuming constructions use this interface as follows. §1.5: Identifies automorphisms of E_b. §9.6: Provides the second rational group action.

**Checks.**

- G_1=G, with untwisted descent.
- For an isoclinic simple GL_n-isocrystal, G_b(Q_p) is the multiplicative group of its endomorphism division algebra.
- For GL_2 and b=diag(p,1), the sigma-centralizer is not an inner form of GL_2; its reductive shape is the slope-preserving Levi.

**Acceptance.** The inner-form assertion has a basicness hypothesis.

*Needs:* §1.1; BunGAndNewtonStrata BG0 / g-isocrystals-and-B-of-G; BunGAndNewtonStrata BG1 §1.13 / sigma-centralizer-J-b; BunGAndNewtonStrata BG0 / g-torsors-three-descriptions; MotivesAndAlgebraicCycles §§6.1–6.2; MotivesAndAlgebraicCycles §6.8.

### 1.4 Bundles for connected linear groups

For a characteristic-p perfectoid S, Bun_G(S) is the groupoid of exact tensor functors Rep_Qp G→Bun(FF_S), with tensor isomorphisms as arrows. Form its v-stack by effective bundle/torsor descent. A G-isocrystal b supplies E_b. The basic b-substack is the full substack whose geometric fibres have class [b]; its automorphism v-group is computed separately.

(HKII, arXiv v2, §4.2, pp. 26–27; HKII line 1206).

The interface consists of the following operations and laws.

- The isocrystal-to-bundle functor applied representationwise produces E_b.
- Bun_G and E_b commute with perfectoid base change.
- G→M induces Bun_G→Bun_M.
- The automorphism sheaf is tensor automorphisms of E_b, not defined to be the constant group G_b(Q_p).

Extend the reductive torsor dictionary along vector-group successive quotients. Apply effective descent representationwise, preserving tensor exactness. Define geometric fibre conditions without assuming that B(G) classifies all bundles.

The consuming constructions use this interface as follows. Layer 1 §1.5: Identifies precisely the locus where the automorphism sheaf is constant. §6.5: Tests whether a modified bundle lies in the trivial stratum.

**Checks.**

- Bun_1 is terminal.
- For reductive G this is the imported BG2 stack, with its tensor/torsor comparison.
- For a Borel, bundles can have nontrivial negative-degree unipotent extensions; their classification is not obtained from the bijection B(G)≅B(M).

**Acceptance.** Nonbasic bundle forms and automorphism kernels are not discarded.

*Needs:* §1.1; DiamondsAndVStacks D4 / small-v-sheaves-and-small-v-stacks; DiamondsAndVStacks D4 / spaces-and-surjectivity-for-small-v-stacks; VectorBundlesAndIsocrystals VB1 / isocrystal-to-bundle-functor; VectorBundlesAndIsocrystals VB1 / cohomology-of-twists; BunGAndNewtonStrata BG2:uniformization / bun-g-as-v-stack; BunGAndNewtonStrata BG2:uniformization / beauville-laszlo-surjectivity; VStackSheavesAndLisseCategories §VS4.0 / bundle-stack-geometry.

### 1.5 Basic-stratum theorem

For connected linear G and a G-basic b, Aut(E_b)=the constant v-group G_b(Q_p), and [*/G_b(Q_p)]→Bun_G is an open immersion with image Bun_G^[b]. Moreover Bun_G^[b]=`Bun_G x_{Bun_M} Bun_M^[b_M]`. In particular the trivial stratum is the inverse image of the trivial Levi stratum. The assertion is not extended to arbitrary nonbasic b.

(HKII, arXiv v2, Theorem 4.2.2, pp. 27–28; HKII line 1249).

Twist the vector-group quotients of U by E_b. Basicness makes their isocrystals slope zero. Kill their H^1 locally in the pro-étale topology and identify automorphisms by H^0. Induct through the derived series and use openness of the reductive basic stratum.

**Acceptance.** The Borel example at nonbasic b must fail the claimed extension.

*Needs:* §1.4; §1.3; §1.2; BunGAndNewtonStrata BG3 / semistable-locus-and-basic-strata; BunGAndNewtonStrata BG3 / full-automorphism-v-group; VectorBundlesAndIsocrystals VB1 / isocrystal-to-bundle-functor; VectorBundlesAndIsocrystals VB1 / cohomology-of-twists; VStackSheavesAndLisseCategories §VS4.0 / bundle-stack-geometry.

### 1.6 Basic twisting of bundle stacks

For basic b define F_b(E)=Isom^tensor(E_b,E), a G_b-bundle, giving an equivalence Bun_G≃`Bun_{G_b}`. It sends E_b to E_1 and E_1 to `E_{b^-1}`, where b^-1 is interpreted in G_b(Q_p-breve) with sigma_b. Transfer modifications by twisting their two bundles and their isomorphism away from the divisor.

(HKII, arXiv v2, §4.2 and Lemma 4.2.3, pp. 28–29; HKII line 1307, HKII line 1312).

The interface consists of the following operations and laws.

- Twisting back by the inverse bitorsor is quasi-inverse to F_b.
- F_b(E_b)≅E_1.
- F_b(E_1)≅`E_{b^-1}` for sigma_b.
- F_b carries an isomorphism off the untilt divisor to the corresponding twisted isomorphism.

Use tensor-Isom torsors for the inner twist. Check the two distinguished bundles using sigma_b. Apply patching to the twisted modification.

The consuming constructions use this interface as follows. Layer 9 §9.6: Invert and twist a modification to exchange its two period maps.

**Checks.**

- F_1 is naturally the identity equivalence.
- For G_m and b=p^n, twisting subtracts n from isocrystal slopes.
- Twisting by b and then the inverse inner-twist datum recovers each original bundle and modification.

**Acceptance.** Check that inversion changes the Frobenius as well as the element.

*Needs:* §1.5; RelativeFarguesFontaine §7.2; RelativeFarguesFontaine §7.4.

### Examples

For the upper triangular Borel H of GL_2, the diagonal b=diag(p,1) has a basic class in its diagonal Levi, since every torus class is basic. On Lie R_uH, however, its adjoint Frobenius has a nonzero slope. Consequently it is not H-basic. This is the witness that the bijection B(H)≅B(M) does not identify their basic subsets or classify all H-bundles. At b=1 the unipotent slope is zero, so the pro-étale H¹-vanishing gives the trivial basic stratum. (HK II §4.1 and Theorem 4.2.2, pp. 26–28; HKII line 1191)

For the basic slope-zero matrix b = [[1,1],[0,1]] and x = diag(2,1), both fixed by coefficient Frobenius, σ_b(x) = [[2,−1],[0,1]]. Both b^(−1)σ_b(x) and σ(x)b^(−1) equal [[2,−2],[0,1]]; conjugation in the inverse order gives [[2,1],[0,1]] instead. The inner twist is σ_b(x)=bσ(x)b^(−1). Hence b^(−1)σ_b(x)=σ(x)b^(−1). The same identity changes the inverse modification's Frobenius frame. For b = 1 the twist is σ; for a torus conjugation is trivial, so the twist is again σ.

### Dependencies

- VStackSheavesAndLisseCategories §VS4.0 / bundle-stack-geometry.
- BunGAndNewtonStrata BG0 / g-isocrystals-and-B-of-G.
- BunGAndNewtonStrata BG1 §1.13 / sigma-centralizer-J-b.
- BunGAndNewtonStrata BG0 / g-torsors-three-descriptions.
- BunGAndNewtonStrata BG1 / newton-and-kottwitz-maps.
- BunGAndNewtonStrata BG1 / admissible-finiteness-and-basic.
- BunGAndNewtonStrata BG1 / torus-norm-description.
- VectorBundlesAndIsocrystals VB0 / dieudonne-manin-isocrystals.
- VectorBundlesAndIsocrystals VB0 / tensor-and-dual-slopes.
- ReductiveGroupsPartII RG2.1 / steinberg-quasi-split.
- ReductiveGroups Layers 5 and 6A.
- ReductiveGroups Layer 2.
- `WittVector.Isocrystal`.
- `WittVector.StandardOneDimIsocrystal`.
- `WittVector.isocrystal_classification`.
- MotivesAndAlgebraicCycles §§6.1–6.2.
- MotivesAndAlgebraicCycles §6.8.
- DiamondsAndVStacks D4 / small-v-sheaves-and-small-v-stacks.
- DiamondsAndVStacks D4 / spaces-and-surjectivity-for-small-v-stacks.
- VectorBundlesAndIsocrystals VB1 / isocrystal-to-bundle-functor.
- VectorBundlesAndIsocrystals VB1 / cohomology-of-twists.
- BunGAndNewtonStrata BG2:uniformization / bun-g-as-v-stack.
- BunGAndNewtonStrata BG2:uniformization / beauville-laszlo-surjectivity.
- BunGAndNewtonStrata BG3 / semistable-locus-and-basic-strata.
- BunGAndNewtonStrata BG3 / full-automorphism-v-group.
- RelativeFarguesFontaine §7.2.
- RelativeFarguesFontaine §7.4.

## Layer 2: Pointwise Hodge structures and admissible pairs

Construct pointwise p-adic Hodge structures and admissible pairs, prove neutral Tannakian and connectedness theorems, identify basic pairs with Hodge structures, and construct realizations, Mumford–Tate and motivic Galois groups, and prescribed invariants.

### 2.1 Pointwise p-adic Hodge structures

For algebraically closed complete C/Q_p, a pure p-adic Hodge structure of weight w∈Q is a finite-dimensional Q_p-space V and B_dR+-lattice L⊂V⊗B_dR whose modification of the trivial bundle is semistable of slope −w/2 (equivalently a sum of O(−w/2)). A general object is a finite Q-graded collection of pure objects; arrows preserve grading and lattice. Adopt HK’s modification orientation so Q_p(n), with lattice Fil^-n B_dR, has weight −2n.

(HKI, arXiv v2, §4.2, Definition 4.2.1, pp. 32–33; HKI line 1544).

The interface consists of the following operations and laws.

- The weight-w summand modifies to a semistable bundle of slope −w/2.
- Q_p(n) has lattice Fil^-n and weight −2n.
- Tensor weights add, dual weights negate, and the underlying Q_p-space forgetful functor preserves both.
- Morphisms are graded Q_p-linear maps preserving the B_dR+-lattices.

Build the modified bundle using imported patching. Impose its stated slope on each graded piece. Define tensor and dual by weight addition and negation, using the bundle slope calculus.

The consuming constructions use this interface as follows. §7.1: Defines the geometric fibres of neutral Hodge structures. Layer 2 §2.4: Matches basic isocrystal gradings with weights.

**Checks.**

- Q_p(1) has weight −2 and lattice Fil^-1, while its dual has weight 2 and lattice Fil^1.
- The zero space with its zero lattice is the zero object in every weight and in the graded category.
- A modification with two distinct bundle slopes is not pure, even if its rank and total degree have the expected average.

**Acceptance.** Audit the slope sign against the Tate example before implementing any comparison.

*Needs:* §0.1; VectorBundlesAndIsocrystals VB2:classification / dieudonne-manin-classification-of-bundles; VectorBundlesAndIsocrystals VB2:classification / fixed-slope-abelian-category; VectorBundlesAndIsocrystals VB2:classification / hom-and-ext-calculus; RelativeFarguesFontaine §§6.6–6.8; RelativeFarguesFontaine §6.9.

### 2.2 Pointwise admissible pairs

An admissible pair over C is a finite-dimensional isocrystal W/Q_p-breve together with a B_dR+-lattice L_et⊂W⊗B_dR such that the modified bundle `E(W)_{L_et}` is semistable of slope zero. It is basic when L_et respects the isocrystal slope grading of W. Morphisms are isocrystal maps preserving L_et. Define V_et=H^0(`E(W)_{L_et}`), the comparison c_dR:V_et⊗B_dR≅W⊗B_dR, and L_dR=c_dR^-1(W⊗B_dR+).

(HKI, arXiv v2, §5.1, Definition 5.1.1 and equations (5.1.1.1)–(5.1.1.2), pp. 39–40; HKI line 1841, HKI line 1862, HKI line 1865).

The interface consists of the following operations and laws.

- V_et is finite dimensional and V_et⊗O_FF→`E(W)_{L_et}` is an isomorphism.
- c_dR identifies V_et⊗B_dR+ with L_et.
- The de Rham lattice is c_dR^-1(W⊗B_dR+).
- Basicness is compatibility of L_et with the entire slope grading, rather than isoclinicity of W.

Patch the original isocrystal bundle using L_et. Slope-zero classification trivializes the modification and yields the comparison via evaluation. Pull back the standard de Rham lattice.

The consuming constructions use this interface as follows. §3.1: Recognizes pairs defined by filtered isocrystals. §6.1: Defines geometric fibres of families and both realizations.

**Checks.**

- W=Q_p-breve with Frobenius sigma and L_et=B_dR+ is the trivial pair; both lattices coincide.
- A modification O(1)⊕O(−1) has degree zero but does not define an admissible pair.
- The Tate pair corresponding to Q_p(n) has isocrystal slope −n, and its transported L_dR is Fil^-n in the chosen étale basis.

**Acceptance.** Admissible means slope zero of the modified bundle, not merely its degree.

*Needs:* §1.1; VectorBundlesAndIsocrystals VB2:classification / dieudonne-manin-classification-of-bundles; VectorBundlesAndIsocrystals VB2:classification / fixed-slope-abelian-category; VectorBundlesAndIsocrystals VB2:classification / hom-and-ext-calculus; RelativeFarguesFontaine §§6.6–6.8; RelativeFarguesFontaine §6.9.

### 2.3 Pointwise Tannakian theorems

HS(C) and AdmPair(C) are Q_p-linear neutral Tannakian categories under the underlying V and V_et fibre functors. Their Tannakian fundamental groups are connected. The isocrystal fibre functor on admissible pairs is exact and faithful after extension to Q_p-breve. The full basic subcategory is tensor stable.

(HKI, arXiv v2, Lemmas 4.3.1–4.3.2 and Theorem 4.3.5, pp. 34–36; Theorem 5.1.6, pp. 40–42; HKI line 1604, HKI line 1613, HKI line 1646, HKI line 1925).

Compute saturated kernels and images in a fixed slope using degree inequalities. Prove exactness and End(1)=Q_p, then apply neutral reconstruction. Show an object with finite tensor monodromy is trivial, using the modification and the constant isocrystal, so the group has no nontrivial finite quotient.

**Acceptance.** Do not infer connectedness from neutrality alone.

*Needs:* §2.1; §2.2; MotivesAndAlgebraicCycles §§6.1–6.3 and 6.8; VectorBundlesAndIsocrystals VB2:classification / dieudonne-manin-classification-of-bundles; VectorBundlesAndIsocrystals VB2:classification / fixed-slope-abelian-category; VectorBundlesAndIsocrystals VB2:classification / hom-and-ext-calculus; MotivesAndAlgebraicCycles §§6.1–6.2; MotivesAndAlgebraicCycles §6.8; MotivesAndAlgebraicCycles §6.3.

### 2.4 Basic pairs and Hodge structures

Étale realization gives a tensor equivalence between basic admissible pairs and Q-graded p-adic Hodge structures. The slope-nu piece of W corresponds to the weight-2nu piece of V_et with L_dR. Inverse construction recovers the slope-graded isocrystal from the modified pure bundles, together with L_et.

(HKI, arXiv v2, Theorem 5.1.6 and proof, pp. 41–42; Definition 4.2.1, pp. 32–33; HKI line 1925, HKI line 1544).

The interface consists of the following operations and laws.

- A basic pair maps to (V_et,L_dR) with weight 2nu on its slope-nu summand.
- A graded Hodge structure supplies the unique slope-graded basic pair up to canonical isomorphism.
- Both composites are tensor naturally isomorphic to the identity.
- The slope −n Tate isocrystal maps to Q_p(n) of weight −2n.

Use the slope grading respected by L_et to grade the étale realization. Apply the pure bundle classification on each graded summand and invert the comparison. Check tensor, dual, and the Tate convention.

The consuming constructions use this interface as follows. §7.3: Transfers the admissible moduli description to Hodge structures. Layer 9 §9.6: Relates motivic and Mumford–Tate groups.

**Checks.**

- The trivial pair goes to weight zero Q_p with standard lattice.
- The direct sum of slope 0 and slope −1 basic Tate pairs becomes weights 0 and −2, not a pure object of average weight.
- A pair whose L_et mixes its isocrystal slope summands does not enter this equivalence’s basic subcategory.

**Acceptance.** The weight is twice the isocrystal slope; the bundle functor reverses that slope.

*Needs:* §2.3.

### 2.5 Mumford–Tate and motivic Galois groups

For a G-Hodge structure or G-admissible pair over C, whose rational fibre functor is isomorphic to the standard one by the Conventions, choose such an isomorphism (an étale fibre trivialization) and define MT or MG as tensor automorphisms of the fibre functor on the full tensor subcategory generated by the object, including subquotients. This is a closed connected subgroup of G; changing the trivialization by g∈G(Q_p) conjugates it by g. Import its canonical reduction of structure group (gap:tannakian-canonical-reduction) and characterize it by all tensor constructions and their Hodge/Tate lines, including nontrivial characters; weight-zero tensors alone need not suffice.

(HKI, arXiv v2, §4.4, pp. 36–37; Theorems 4.5.1 and 5.3.1, pp. 38, 43; HKI line 1663, HKI line 1762, HKI line 2013).

The interface consists of the following operations and laws.

- The group embeds as a closed subgroup of G and is unchanged by replacing a tensor generator.
- A subgroup supports the object iff all its defining Chevalley lines become Hodge/Tate lines of the required weights.
- After a compatible fibre identification, the canonical group is contained in every subgroup supporting a reduction; extension of that canonical reduction gives the original G-object.
- Under the basic-pair equivalence MG identifies with MT via the same étale fibre functor.

Restrict the fibre functor to the generated tensor subcategory. Apply reconstruction and the Chevalley line criterion. Apply the imported canonical reduction and transport the chosen fibre trivialization through its tensor-isomorphism torsor.

The consuming constructions use this interface as follows. Layer 6 §6.3: Extends the group and reduction to connected families. §10.1: Detects failure of full motivic Galois group by Hodge lines.

**Checks.**

- The group of a sum of unit objects is trivial.
- A nonzero Tate generator has group G_m, detected by its nonzero weight rather than only invariant vectors.
- A nonzero admissible extension of the unit by itself has group G_a, with a nontrivial unipotent action [[1,u],[0,1]]; declaring every group reductive would incorrectly give a split extension. The defining line is stable for every u, while e2 is fixed only at u=0.

**Acceptance.** The reduction is minimal among subgroups supporting the full object, not only its individual representation fibres.

*Needs:* §2.3; MotivesAndAlgebraicCycles §§6.1–6.3 and 6.8; ReductiveGroups Layer 3; `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`; MotivesAndAlgebraicCycles §§6.1–6.2; MotivesAndAlgebraicCycles §6.8; `TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer`.

### 2.6 Invariants and existence

Both directions concern G-objects whose rational fibre functor is isomorphic to the standard one, as in the Conventions. For a good G-Hodge structure of type [mu] whose weight homomorphism is central in G (in particular after reduction to its Mumford–Tate group), its associated G-isocrystal is the unique basic class in B(G,[mu^-1]); its Newton homomorphism is half the weight homomorphism. For a good G-admissible pair the type and isocrystal class satisfy [b]∈B(G,[mu^-1]). Conversely every [b] in this set admits a G-admissible pair of that type over C, and one defined by a filtration over a suitable finite extension of Q_p-breve([mu]). A G-basic class must exist for the Hodge-structure assertion.

(HKI, arXiv v2, Theorems 4.4.4, 5.2.4, pp. 37, 43; Example 5.4.6, p. 45; HKI line 1730, HKI line 2000, HKI line 2109).

Read the Newton homomorphism from the weight grading. Use the reductive admissibility condition and Levi reduction for necessity; the standard rational fibre functor makes the modified G-bundle the trivial one, which is what fixes the Kottwitz invariant. Use imported reductive rigid-point existence and lift along the unipotent filtration; at the resulting finite field of definition apply §0.5 over its completed algebraic closure, then extend the canonical lattice to C. The admissible points so obtained modify E_b to the trivial G-bundle, so their étale fibre functor is the standard one.

**Checks.**

- For G=G_m and the Tate object Q_p(1) with its standard character, the lattice type is mu=1, the isocrystal is p^(−1)σ so b=p^(−1) with Kottwitz invariant −1=mu^-1, and the weight −2 is twice the Newton slope −1.
- The unit G-object with the standard fibre functor has type 0 and G-isocrystal [1], the unique basic class of B(G,[0]).
- Let G=PGL_2 and let P be the PGL_2-torsor of the quaternion division algebra over Q_p, so P(Q_p) is empty. Composing the twisted fibre functor of P with the unit embedding into AdmPair(C) gives an exact tensor functor whose values are sums of unit objects: equal lattices, type 0, weight 0. Its G-isocrystal is the image of b=[[0,p],[1,0]]: b²=p·1, so the projective Newton point is 0, while v_p(det b)=1 is odd, so the Kottwitz invariant is 1 in π_1(PGL_2)=Z/2. As B(PGL_2,[0])={[1]}, the conclusion fails for this functor; it is excluded because its étale fibre functor is not the standard one.

**Acceptance.** Keep [mu^-1] in B(G,−), rather than silently reversing the lattice convention. Keep the standard-rational-fibre condition: triviality of every associated vector bundle does not trivialize the G-bundle.

*Needs:* §0.4; §1.1; §2.4; BunGAndNewtonStrata BG1 / newton-and-kottwitz-maps; BunGAndNewtonStrata BG1 / admissible-finiteness-and-basic; BunGAndNewtonStrata BG1 / torus-norm-description; HeckeStacksAndLocalShtukas §HS2.15; HeckeStacksAndLocalShtukas §HS2.12; §0.5.

### 2.7 Rigidified BKF comparison

The category AdmPair(C) is tensor equivalent to the isogeny category of rigidified Breuil–Kisin–Fargues modules. Under the imported modification description, (W,L_et) maps to (`E(W)_{L_et}`,E(W),alpha_can,beta_can), with first bundle trivial, alpha the identification away from infinity and beta the splitting of the slope grading of E(W).

(HKI, arXiv v2, Theorem 5.1.6 and proof, pp. 41–42; HKI line 1925).

Import the rigidified-module/modification equivalence from its owner. Use classification of the second bundle with its splitting to recover W. Recover L_et from the first, trivialized modification and check the two composites.

**Acceptance.** Rigidification is retained: deleting beta changes the category.

*Needs:* §2.3; AInfCohomology §AI.2.2; AInfCohomology §AI.2.2, “Operations in valid BKF subcategories”; AInfCohomology §AI.2.3; AInfCohomology §§AI.2.2–AI.2.3.

### Examples

Set n=1 in the Tate table. W has Frobenius p^(−1)σ, E(W) has slope 1, and L_et=Fil^1 modifies that bundle to slope zero. Transporting W⊗B_dR+ through the comparison yields L_dR=Fil^(−1). The corresponding Hodge structure therefore has weight −2. The direct sum with the unit pair has two weights, 0 and −2, and is basic but not pure. This checks the direction of the basic-pair equivalence and its compatibility with `WittVector.StandardOneDimIsocrystal`. (HKI Definition 4.2.1, pp. 32–33, and Theorem 5.1.6, pp. 41–42; HKI line 1544 and HKI line 1925)

A rank-two modification O(1)⊕O(−1) has total degree zero and fails admissibility. A nonzero Tate generator has Tannakian group G_m, whereas a sum of unit generators has trivial group: testing only weight-zero invariant vectors cannot distinguish all required character data. The rigidified BKF comparison keeps the splitting β of the slope grading; deleting it changes the input category.

### Dependencies

- `TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer`.
- Layer 0.
- VectorBundlesAndIsocrystals VB2:classification / dieudonne-manin-classification-of-bundles.
- VectorBundlesAndIsocrystals VB2:classification / fixed-slope-abelian-category.
- VectorBundlesAndIsocrystals VB2:classification / hom-and-ext-calculus.
- RelativeFarguesFontaine §§6.6–6.8.
- RelativeFarguesFontaine §6.9.
- Layer 1.
- MotivesAndAlgebraicCycles §§6.1–6.3 and 6.8.
- MotivesAndAlgebraicCycles §§6.1–6.2.
- MotivesAndAlgebraicCycles §6.8.
- MotivesAndAlgebraicCycles §6.3.
- ReductiveGroups Layer 3.
- `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`.
- BunGAndNewtonStrata BG1 / newton-and-kottwitz-maps.
- BunGAndNewtonStrata BG1 / admissible-finiteness-and-basic.
- BunGAndNewtonStrata BG1 / torus-norm-description.
- HeckeStacksAndLocalShtukas §HS2.15.
- HeckeStacksAndLocalShtukas §HS2.12.
- AInfCohomology §AI.2.2.
- AInfCohomology §AI.2.2, “Operations in valid BKF subcategories”.
- AInfCohomology §AI.2.3.
- AInfCohomology §§AI.2.2–AI.2.3.

## Layer 3: Good reduction, Galois images and CM points

Define filtration-defined good reduction and C0-analytic pairs; prove goodness, the crystalline realization theorem, openness in the motivic Galois group and the two-lattice CM criterion, with the slope-filtered nonbasic refinement.

### 3.1 Good reduction and analytic lattices

Let C0=W(k_C)[1/p] inside C and let C0bar denote its algebraic closure inside C. An admissible pair has good reduction over a strict p-adic K⊂C if its lattice is the canonical lattice sum_i Fil^i B_dR·F^-i(W_K) of a K-filtration. Call a pair C0bar-analytic if it has good reduction over some finite K/C0. For a lattice in V⊗B_dR, analytic over a subfield means that it is the canonical lattice of a filtration over that subfield, with its specified rational structure. CM means that its connected MT/MG group is a torus.

(HKI, arXiv v2, §5.4, Definition 5.4.1, pp. 43–44, and Theorem 5.4.4, pp. 44–45; §5.7, pp. 49–50; HKI line 2030, HKI line 2098, HKI line 2293).

The interface consists of the following operations and laws.

- The finite sum of Fil^i B_dR times F^-i W_K is a full B_dR+-lattice.
- Its trace Hodge filtration is F on W_K after extension to C.
- Good reduction is preserved by finite extension of the strict field of definition.
- A C0bar-analytic G-admissible pair is good; if its defining filtration has splitting cocharacter class [lambda], its lattice type is [lambda^-1].

Construct the canonical lattice from a finite filtration. Keep W_K and V_K as distinct rational structures. Check descent and scalar extension using the trace-filtration splitting.

The consuming constructions use this interface as follows. Layer 3 §3.2: Supplies the Galois-stable lattice. Layer 11 §11.4: Uses openness at a classical point after making its residue field strict.

**Checks.**

- Every Tate pair is filtration-defined over Q_p-breve. For Q_p(1), the filtration jumps at −1, L_et=Fil^1 and the lattice type is +1, the inverse of the filtration type.
- Among extensions of the unit pair by itself parametrized by B_dR/B_dR+, only the zero extension is C0bar-analytic.
- Being analytic for L_et relative to W does not by itself imply that L_dR is analytic relative to V_et.

**Acceptance.** Analyticity is stronger than coordinates of a reduced flag alone for an arbitrary non-good lattice.

*Needs:* §2.2; §2.5; §0.5.

### 3.2 Crystalline realization of good reduction

For strict p-adic K and C=completed algebraic closure of K, étale realization lifts to a fully faithful tensor functor AdmPair_good-red(K)→Rep_Qp Gal(Kbar/K). Its essential image is contained in the crystalline representations and is stable under subobjects. The B_cris invariants recover the filtered isocrystal and the B_dR comparison recovers the lattice. No non-strict-field version is asserted here.

(HKI, arXiv v2, Theorem 5.5.1, pp. 45–46; HKI line 2137).

Use the Galois-stability of the canonical lattice to act on H^0 of the modification. Take B_cris invariants, recover W by slope classification over the strict field and recover L_et by the comparison. Apply dimension inequalities to a stable subspace and its quotient.

**Acceptance.** Full faithfulness and subobject stability both enter the identification of the algebraic Galois envelope.

*Needs:* §3.1; §2.3; PadicHodgeTheory §5.5.

### 3.3 Open Galois image

For a G-admissible pair with good reduction over a strict p-adic field K and a chosen étale fibre trivialization, compute the realization over the completed algebraic closure of K. Its continuous Galois representation has image open in MG(Q_p). Its Zariski closure equals MG. For a classical point initially defined over a non-strict discretely valued field F, base change to the completion of its maximal unramified extension F′; the restricted inertia image is open in the same geometric MG and supplies an open subgroup orbit contained in the original Galois orbit.

(HKI, arXiv v2, Corollary 5.5.3, pp. 46–47; HK II proof of Theorem 9.1.3, pp. 57–58; HKII line 2577; HKI line 2167).

Identify the algebraic Galois envelope using full faithfulness and subobjects. Apply Serre’s Hodge–Tate openness criterion in that envelope (gap:strict-field-serre-openness). For F′ retain the same geometric pair and MG, then use inclusion of its Galois group into the original decomposition group.

**Acceptance.** Use containment of an open subgroup orbit, not equality with the entire Galois orbit.

*Needs:* §3.2; §2.5; PadicHodgeTheory §5.5; ReductiveGroupsPartII RG2.0 / scheme-point-topology; ReductiveGroupsPartII RG2.0 / points-topological-group; ReductiveGroupsPartII RG2.0 / congruence-neighbourhood-basis; ReductiveGroupsPartII RG2.0 / smooth-morphism-open-map.

### 3.4 Two-lattice CM criterion

Write C0=W(k_C)[1/p] and let C0bar be its algebraic closure inside C. For a basic admissible pair over C, having both its étale lattice (relative to W) and its de Rham lattice (relative to V_et) defined by filtrations over finite extensions of C0 is equivalent to having CM. In the CM case the étale lattice can be defined over Q_p-breve-bar and the de Rham lattice over Q_p-bar. Equivalently a good-reduction p-adic Hodge structure has C0bar-analytic de Rham lattice exactly when it has CM. For a C0bar-analytic admissible pair without basicness, if its de Rham lattice is also C0bar-analytic, the slope filtration lifts to subpairs and its graded subpairs have CM; the original extension need not split or have CM.

(HKI, arXiv v2, Theorem B, p. 5, and Corollary C, p. 8; §6.2, pp. 52–54; Theorem 6.3.2, pp. 54–55; Proposition 5.7.1, p. 49; HKI line 204, HKI line 347, HKI line 2400, HKI line 2490, HKI line 2293).

Reduce the CM direction to a torus; its flag varieties are points, so the character/cocharacter lattice description makes both filtrations algebraic over the stated smaller fields. For the converse choose a common finite extension K/C0 over which both lattices are filtration-defined. The Galois image preserves the K-rational de Rham lattice (HKI Lemma 5.5.4, p. 47; HKI line 2174). Its elements are tensor automorphisms of the fully faithful realization Rep MG→HS(C), hence are central: full faithfulness identifies them with automorphisms of the identity on Rep MG, whose representation components commute with MG (HKI Lemma 2.1.5, p. 13; HKI line 586). Zariski density from §3.3 makes MG commutative. A connected commutative characteristic-zero linear group is a torus times a vector group; the absence of nonzero C0bar-analytic self-extensions of the unit excludes the vector factor (HKI Example 5.4.5, p. 45, and §6.2, p. 52; HKI line 2101, HKI line 2424). In the nonbasic case use the lifted slope filtration and apply the basic statement to each graded part.

**Checks.**

- Sums of unit objects have trivial MG, a rank-zero torus; a nonzero Tate generator has MG=G_m. Both have the two canonical rational lattices.
- The unit self-extension with parameter t^-1 modulo B_dR+ has MG=G_a and only the zero cocharacter, which is central. Its nonzero parameter prevents C0bar-analyticity, so central cocharacters alone cannot establish the conclusion.
- On the standard representation of G_a, [[1,u],[0,1]] commutes with every [[1,v],[0,1]], but u≠0 still gives a nontrivial unit self-extension. The analytic-extension vanishing, in addition to commutativity, is what eliminates this factor.

**Acceptance.** The nonbasic refinement yields CM graded pieces, not a semisimplicity or splitting assertion.

*Needs:* §3.1; §3.3; §2.4; §2.5.

### Examples

The unit and every Tate pair have canonical lattices over Q_p-breve. In contrast, an extension of the unit by itself with nonzero parameter in B_dR/B_dR+ has the unipotent off-diagonal bilattice from Layer 0 and cannot be filtration-defined over C0bar: its G_a type would have to be zero and good. Thus analyticity of the flag alone cannot replace analyticity of the lattice. (HK I §5.4, Theorem 5.4.4 and Example 5.4.5, pp. 44–45; HKI line 2098)

For a CM object reduce its structure group to its torus. A torus flag variety for a specified cocharacter is a point, so the étale flag descends over a finite extension of Q_p-breve and the de Rham flag over a finite extension of Q_p. This proves the CM direction without a classification of all CM objects. The converse uses the open motivic Galois image and the field of definition of the other filtration. In a nonbasic object the argument applies to the slope-graded pieces and does not split the extension. (HK I Proposition 5.7.1, p. 49, and §6.2–Theorem 6.3.2, pp. 52–55; HKI line 2293)

### Dependencies

- Layer 2.
- Layer 0.
- PadicHodgeTheory §5.5.
- ReductiveGroupsPartII RG2.0 / scheme-point-topology.
- ReductiveGroupsPartII RG2.0 / points-topological-group.
- ReductiveGroupsPartII RG2.0 / congruence-neighbourhood-basis.
- ReductiveGroupsPartII RG2.0 / smooth-morphism-open-map.

## Layer 4: Relative local systems and trace filtrations

Define rigid analytic subdiamonds, coefficient and G-local systems, integral loci, latticed and bilatticed families, types and goodness. Establish the relative trace-exactness theorem and the smooth rigid filtered-flat-bundle comparison including its essential-image descent.

### 4.1 Rigid analytic subdiamonds

Fix a complete nonarchimedean extension L/Q_p, with its nontrivial rank-one valuation. Use the rigid analytic points supplied by AdicSpacesPartV RZ.3 (finite-extension-valued points over L). A rigid analytic diamond is one isomorphic over Spd L to S^diamond for a seminormal rigid analytic L-variety S. A rigid analytic subdiamond is a locally closed subdiamond represented in this way; a closed rigid analytic subdiamond also has closed immersion into the ambient diamond. These notions retain the field of definition.

(HKII, arXiv v2, Definition 2.2.1 and Lemma 2.2.3, pp. 15–16; HKII line 691, HKII line 711).

The interface consists of the following operations and laws.

- A seminormal rigid variety and its locally closed rigid subspaces supply rigid analytic diamonds and subdiamonds.
- Finite field extension transports a rigid analytic point and all represented subdiamonds.
- A closed rigid analytic subdiamond of S^diamond gives a Zariski closed subset of S.
- Morphisms between represented seminormal rigid diamonds over Spd L are the unique corresponding rigid morphisms.

Use seminormal full faithfulness to transport rigid morphisms and closed subspaces. Compare underlying spaces using diamondification.

The consuming constructions use this interface as follows. Layer 5 §5.5: Makes the BB comparison a statement about actual rigid maps. §11.1: Specifies the subobjects used in analytic closure intersections.

**Checks.**

- The diamond of a rigid disc is rigid analytic, and a finite-extension-valued closed point is a rigid analytic point.
- A general geometric C-point with transcendental coordinate in a disc is not automatically a rigid analytic point over L.
- Over F₂((u)), the map T↦T² on the seminormal closed disc becomes an isomorphism after diamondification, but has no rigid analytic inverse: f(T)²=T would force 2·ord_T(f)=1. This excludes equal characteristic from the full-faithfulness assertion.
- The cusp L⟨u²,u³⟩ and its seminormalization L⟨u⟩ have the same diamond in characteristic zero, while u is absent from the cusp ring. A criterion using only underlying topological spaces would miss the required seminormal representative.

**Acceptance.** Do not identify every geometric point with a rigid analytic point.

*Needs:* DiamondsAndVStacks D4 / small-v-sheaves-and-small-v-stacks; DiamondsAndVStacks D4 / spaces-and-surjectivity-for-small-v-stacks; DiamondsAndVStacks D6 / gluing-and-the-diamond-functor; DiamondsAndVStacks D6 / etale-site-comparison; DiamondsAndVStacks D6 / seminormal-rigid-full-faithfulness; AdicSpacesPartV RZ.3 / rigid-analytic-point; AdicSpacesPartV RZ.3 / classical-points-rigid-analytic-points; AdicSpacesPartV RZ.3 / gauss-point-in-closure; DiamondsAndVStacks D5 / locally-closed-generalizing-subdiamond.

### 4.2 Coefficient and group local systems

For a locally spatial diamond Y, a Λ-local system (Λ a complete Huber ring) is a sheaf on Y_v which is v-locally finite free over the sheaf of continuous Λ-valued functions. For B=O, B_dR+ or B_dR use finite locally free sheaves of B-modules on Y_v. For a complete Huber Q_p-algebra Λ, a G-local system is an exact tensor functor Rep_Qp G→Loc_Λ(Y) that is v-locally isomorphic to ω_std⊗Λ; on these, the tensor-frame sheaf Isom^tensor(ω_std⊗Λ,−) is a G(Λ)-torsor and gives an equivalence with G(Λ)-torsors. For Λ=Q_p the condition forces every geometric fibre functor to be the standard one, and an exact tensor functor need not satisfy it; the equivalence with torsors at HKII line 808 needs this condition, as the PGL_2 Check below shows. An O-local system is an analytic vector bundle exactly when it is étale-locally trivial as an O-local system; every O-local system on a perfectoid space has this property, whereas a general rigid variety has additional O-local systems. The pro-étale description of Q_p-local systems is used only under its proved comparison hypotheses.

(HKII, arXiv v2, §2.3, pp. 16–18, Definition 2.3.4 and Remark 2.3.5; §2.4, p. 18; HKII line 728, HKII line 794, HKII line 807, HKII line 820).

The interface consists of the following operations and laws.

- Pullback preserves these local systems and tensor operations.
- On an affinoid perfectoid S, B-local systems identify with finite projective B(S)-modules for B=O, B_dR+ or B_dR. The B_dR case requires the localized-period module-descent extension specified in the supplier contracts.
- G(Lambda)-torsors recover the constant-coefficient tensor functors by associated representations.
- On a perfectoid space O-local systems are vector bundles. On a rigid variety the essential image of analytic vector bundles consists exactly of the étale-trivializable O-local systems.

Use v-descent for finite projective modules and continuous coefficient functions. Construct tensor frames v-locally and apply the tensor-isomorphism torsor theorem. For Q_p use the stated pro-étale comparison; for O use the étale-trivializability criterion, rather than identifying all rigid v-local systems with analytic bundles. For the affinoid B_dR+ comparison use the existing completed-period bundle v-descent. For B_dR use the explicitly requested localized-period finite-projective descent extension; O-module descent alone does not prove this case.

The consuming constructions use this interface as follows. Layer 4 §4.4: Carries the two period lattices. Layer 6 §6.1: Supplies the étale realization of a family.

**Checks.**

- The trivial rank-n coefficient system is Lambda^n; its full linear frame group is GL_n(Lambda). For the trivial G-system its tensor-frame group is G(Lambda), and at n=0 the linear frame group is the trivial group.
- A nontrivial finite étale rank-one local system retains its monodromy and is not identified with the constant system by its fibres.
- An invertible analytic sheaf gives the corresponding O-local system under the vector-bundle equivalence.
- On Spa L for a p-adic field L, O(1) is an O-local system but not an analytic line bundle: no finite étale extension kills its nonzero cyclotomic Tate weight.
- For G=PGL_2, Λ=Q_p and Y=Spd C, let P be the torsor of the quaternion division algebra over Q_p. The constant functor given by the P-twisted fibre functor is exact and tensor, but its frame sheaf has sections over a perfectoid T only as continuous maps |T|→P(Q_p), and P(Q_p) is empty. It is therefore not a G(Q_p)-local system in the sense above. After extension of scalars to O the same functor is trivialized, because P has C-points.

**Acceptance.** Local freeness and its topology are part of the object; a sheaf with merely finite-dimensional fibres is insufficient.

*Needs:* DiamondsAndVStacks D1 / universally-open-std-cover; DiamondsAndVStacks D2 / small-pro-etale-site-and-v-site; DiamondsAndVStacks D2 / v-descent-of-functions; DiamondsAndVStacks D2 / vector-bundles-across-pro-etale-and-v-sites; DiamondsAndVStacks D5 / spatial-diamond; MotivesAndAlgebraicCycles §§6.1–6.2; MotivesAndAlgebraicCycles §6.8; RelativeFarguesFontaine §4.10; RelativeFarguesFontaine §7.6; RelativeFarguesFontaine §§6.6–6.9 and 7.6.

### 4.3 Closed integrality locus

Let L be a p-adic field, S an affinoid perfectoid space over L, X an affine finite-type L-scheme, and x∈X(B_dR(S)). The subset of |S| where every geometric specialization of x lies in X(B_dR+) is Zariski closed. Integrality is functorial under morphisms of affine finite-type L-schemes. Zariski closedness is transitive for the associated closed perfectoid subspaces.

(HKII, arXiv v2, Lemma 2.3.2 and Remark 2.3.3, p. 17; HKII line 771, HKII line 786).

Choose a closed immersion X→A^n_L and test its finitely many coordinates. Bound their denominators locally and successively kill negative filtration coefficients; each obstruction is a section of a Tate-twisted O-line and has a Zariski closed zero locus. For transitivity identify a closed perfectoid subspace with its strong closed quotient. Surjectivity of the quotient map lifts defining ideals, so successive zero loci are cut out by one ideal upstairs.

**Acceptance.** The bound is finite for each coordinate; no globally preferred generator t is imposed.

*Needs:* §4.2; PerfectoidSpaces §P4.15.6, completed integral quotient and its plus ring; PerfectoidSpaces §§P4.15.6 and P6.11; RelativeFarguesFontaine §4.10; RelativeFarguesFontaine §4.11; RelativeFarguesFontaine §4.12.

### 4.4 Relative bilattices and their type

A bilatticed B_dR-local system on Y is (V,L1,L2), with V a B_dR-local system and Li B_dR+-local systems identified with lattices in V. A latticed B_dR+-local system is equivalently (L1,L2⊂L1[1/Fil^1]); the datum is not merely a G(B_dR+)-local system with one lattice. Define trace filtrations by image of Fil^i B_dR·L2∩L1 in L1/Fil^1L1, and type pointwise by elementary divisors. A filtered O-local system uses locally direct summands and a pointwise-locally-constant rank function. Strictness and exactness are the sheaf versions of §§0.1–0.2: test both lattice sequences for bilattices, and every filtration step for filtered systems.

(HKII, arXiv v2, §3.1, pp. 20–22, equations (3.1.0.1), (3.1.1.1), Example 3.1.1, Lemma 3.1.2; HKII line 948, HKII line 961, HKII line 980, HKII line 997).

The interface consists of the following operations and laws.

- Lattices and trace filtrations commute with permitted base changes once local splitting/constant type is established.
- Swapping L1,L2 negates type, and gr1^i≅gr2^-i(i) with the intrinsic Tate twist.
- Locally constant type gives trace filtrations by local direct summands.
- Trace filtration is compatible with tensor and dual; it is not asserted exact for arbitrary bilattices.

Sheafify intersection and image and compare on strictly totally disconnected presentations. Identify geometric fibres with pointwise bilattices. For locally constant type prove the trace terms locally split and compute the two graded pieces.

The consuming constructions use this interface as follows. Layer 4 §4.5: Extends the point exactness criterion. Layer 4 §4.6: Recognizes the essential image of filtered flat bundles.

**Checks.**

- For L2=Fil^a B_dR inside L1=B_dR+, the first trace jump is −a and the second is a, with the stated twist.
- On the rigid unit disc over C_p with coordinate z and a fixed ξ from B_dR+(C_p), L1=(B_dR+)^2 and L2=<e1,e2+(z/xi)e1> has type (1,−1) at z≠0 and (0,0) at z=0.
- The graded-piece isomorphism for a rank-one nonzero jump requires the Tate twist; identifying the untwisted graded pieces is not canonical.

**Acceptance.** Type need not be locally constant in an arbitrary family.

*Needs:* §4.2; §0.1; RelativeFarguesFontaine §4.10; RelativeFarguesFontaine §4.11; RelativeFarguesFontaine §4.12.

### 4.5 Relative goodness and trace exactness

A bilatticed G-local system is good of locally constant type [mu] iff BB1 is a filtered G(O)-local system of type [mu^-1], iff BB2 is one of type [mu]. This is HK II Theorem 3.2.1. For reductive G, type satisfies the usual Schubert semicontinuity; no such general assertion is made for non-reductive G.

(HKII, arXiv v2, Theorem 3.2.1 and Remark 3.2.2, pp. 22–23; HKII line 1033, HKII line 1048).

Apply the point criterion on geometric points. Use constant ranks and finite-projective descent to lift the split filtered structure. Recover the G(B_dR+) double coset locally, keeping its cocharacter/reflex-field descent.

**Acceptance.** The disc family and G_a example rule out assuming arbitrary G-families have locally constant good type.

*Needs:* §4.4; §0.2; §0.4; HodgeTateAndCanonicalSubgroups §2.14.

### 4.6 The trivial-filtration lattice functor

For smooth rigid X over a p-adic field L, write M0(E,∇) for PadicHodgeTheory §7.1’s associated B_dR+-local system specialized to the trivial filtration. Use its horizontal full faithfulness and residual comparison M0(E)⊗O≅v^*E, whose pushforward recovers E with its connection. For a Griffiths-transversal filtration F on E define M(E,F)⊂M0(E)[1/Fil^1] by the filtered de Rham horizontal-section construction, giving the associated latticed object.

(HKII, arXiv v2, §3.3, Theorem 3.3.1(1)–(2), pp. 23–24; Example 3.3.2, p. 25; HKII line 1080, HKII line 1154; Scholze, Theorem 7.6 and its proof, pp. 42–45; Scholze line 1936).

The interface consists of the following operations and laws.

- M0(E,∇)=M(E,∇,F_trivial).
- The canonical horizontal structural comparison reduces to M0(E)⊗O≅v^*E; its pushforward recovers E and its connection, naturally in horizontal maps.
- A map between M0 lattices comes uniquely from a horizontal map of flat bundles.
- M sends Griffiths-transversal filtered maps to lattice-preserving maps and respects tensor and dual.

Apply PadicHodgeTheory §§7.1 and 7.4 to both associated lattices. Compare their intersection and image after reduction, using the supplied lattice-position uniqueness and tensor compatibility; the horizontal-section and Poincaré constructions remain with that supplier.

The consuming constructions use this interface as follows. Layer 4 §4.7: Recognizes lattices whose filtration descends to X_et. §12.1: Attaches period data to de Rham local systems.

**Checks.**

- At X=Spa K this is the canonical lattice of a K-filtration on the finite-dimensional vector space.
- The unit flat bundle with its trivial filtration gives B_dR+ as both lattices.
- A filtration concentrated in degree a gives the canonical lattice Fil^-a B_dR times M0, not Fil^a.

**Acceptance.** M0 takes a flat bundle as input; it forgets any pre-existing filtration.

*Needs:* §4.2; PadicHodgeTheory §7.1; PadicHodgeTheory §7.1, lattice-position uniqueness; PadicHodgeTheory §7.4.

### 4.7 Smooth rigid lattice–filtration comparison

For smooth rigid X over a p-adic field L, the functor (E,∇,F)↦(M0(E),M(E,F)) is fully faithful on Griffiths-transversal filtered flat bundles. Its essential image is exactly the latticed objects whose first lattice is M0 of a flat bundle and whose trace filtration has locally direct-summand terms (equivalently locally constant type). The recovered filtration is on X_et, not only on its pro-étale cover.

(HKII, arXiv v2, Theorem 3.3.1(3), pp. 24–25; Proposition 5.0.3(4), p. 31; HKII line 1094, HKII line 1411).

Use the residual comparison M0(E)⊗O≅v^*E. On an analytic open U trivializing E, the trace direct summands define U^diamond→Flag, not merely a map from a pro-étale chart. Apply seminormal rigid full faithfulness to U and its overlap opens; uniqueness glues the analytic filtration on E. The Faltings-extension boundary, or induction on the filtration spread as in HK II §3.3, identifies vanishing of the lattice lifting obstruction with Griffiths transversality. Apply the associated-lattice position and uniqueness theorem to recover the original second lattice; horizontal full faithfulness gives the morphism assertion.

**Acceptance.** Smoothness is required here. Singular applications use Layer 5 §5.5 and resolution instead.

*Needs:* §4.6; §4.5; DiamondsAndVStacks D6 / gluing-and-the-diamond-functor; DiamondsAndVStacks D6 / etale-site-comparison; DiamondsAndVStacks D6 / seminormal-rigid-full-faithfulness; PadicHodgeTheory §7.1; PadicHodgeTheory §7.1, lattice-position uniqueness; PadicHodgeTheory §7.4.

### Examples

Over the rigid disc Spa(C_p⟨z⟩), fix a generator ξ of Fil^1 B_dR+(C_p) and choose a v-local lift of z to the period sheaf. The generator is pulled back from C_p; this construction does not descend over an arbitrary discretely valued base field. Put L1=(B_dR+)² and L2=⟨e1,e2+(z/ξ)e1⟩. At a geometric point with z≠0, the determinant has valuation zero and one entry has valuation −1, giving type (1,−1). At z=0 both lattices agree. On the cover adjoining all p-power roots of z, two lifted coordinates differ by a cyclotomic factor ε with ε − 1 divisible by ξ. Their off-diagonal coefficients therefore differ integrally and define the same lattice, giving descent (HKII Example 3.1.1, p. 21; HKII line 961). It is a family of lattices with a type jump; a fibrewise flag is not automatically a filtered local system by direct summands.

For a flat line with its filtration concentrated in degree a, the canonical second lattice is Fil^(−a) times the first. For the trivial filtration M0 has equal lattices. Forgetting the original filtration before forming M0 is essential: using M(E,F) as M0 would erase the distinction that the relative comparison theorem recovers. (HK II Theorem 3.3.1, pp. 23–25; HKII line 1080)

### Dependencies

- HodgeTateAndCanonicalSubgroups §2.14.
- DiamondsAndVStacks D4 / small-v-sheaves-and-small-v-stacks.
- DiamondsAndVStacks D4 / spaces-and-surjectivity-for-small-v-stacks.
- DiamondsAndVStacks D6 / gluing-and-the-diamond-functor.
- DiamondsAndVStacks D6 / etale-site-comparison.
- DiamondsAndVStacks D6 / seminormal-rigid-full-faithfulness.
- AdicSpacesPartV RZ.3 / rigid-analytic-point.
- AdicSpacesPartV RZ.3 / classical-points-rigid-analytic-points.
- AdicSpacesPartV RZ.3 / gauss-point-in-closure.
- DiamondsAndVStacks D5 / locally-closed-generalizing-subdiamond.
- DiamondsAndVStacks D1 / universally-open-std-cover.
- DiamondsAndVStacks D2 / small-pro-etale-site-and-v-site.
- DiamondsAndVStacks D2 / v-descent-of-functions.
- DiamondsAndVStacks D2 / vector-bundles-across-pro-etale-and-v-sites.
- DiamondsAndVStacks D5 / spatial-diamond.
- MotivesAndAlgebraicCycles §§6.1–6.2.
- MotivesAndAlgebraicCycles §6.8.
- RelativeFarguesFontaine §4.10.
- RelativeFarguesFontaine §7.6.
- RelativeFarguesFontaine §§6.6–6.9 and 7.6.
- PerfectoidSpaces §P4.15.6, completed integral quotient and its plus ring.
- PerfectoidSpaces §§P4.15.6 and P6.11.
- RelativeFarguesFontaine §4.11.
- RelativeFarguesFontaine §4.12.
- Layer 0.
- PadicHodgeTheory §7.1.
- PadicHodgeTheory §7.1, lattice-position uniqueness.
- PadicHodgeTheory §7.4.

## Layer 5: Grassmannians for connected linear groups

Extend the reductive B_dR+ Grassmannian by Levi and unipotent coordinates. Prove subgroup immersion criteria, relative-position closedness, the rigid-source and Griffiths-transversality theorem, and the exact adjoint-weight bound for the BB isomorphism.

### 5.1 Non-reductive de Rham Grassmannians

Let L be a p-adic field and G/L a connected linear group; for G/Q_p use G_L. The Grassmannian Gr_G/Spd L is the étale sheaf quotient G(B_dR)/G(B_dR+) on Perfd_L, equivalently G(B_dR+)-torsors with a trivialization after inverting Fil^1. It is a v-sheaf. The rigid flag variety Fl_G/Spa L parametrizes filtrations of the standard fibre functor and is the analytification of the flag schemes supplied by HodgeTateAndCanonicalSubgroups §2.14. For a cocharacter class [mu] with reflex field L([mu]), both Gr_[mu] and Fl_[mu^-1] are over that reflex base; the former is the good lattice locus of type [mu], and BB:Gr_[mu]→Fl_[mu^-1]^diamond is the first trace-filtration map. The type components of Fl_G are clopen after the appropriate reflex base change. For any extension L′/L of p-adic fields, Gr_(G_L′)=Gr_G ×_(Spd L) Spd L′ and the flag spaces have the analogous base-change comparison.

(HKII, arXiv v2, Definition 5.0.1 and Proposition 5.0.3, pp. 29–31; HKII line 1347, HKII line 1395).

The interface consists of the following operations and laws.

- On a strictly totally disconnected chart the quotient agrees with actual G(B_dR)/G(B_dR+) cosets.
- The lattice and torsor-with-trivialization presentations are naturally equivalent.
- BB is G(B_dR+)-equivariant through reduction G(B_dR+)→G(O).
- G→M sends Gr_[mu] into Gr_[mu_M] and commutes with BB.

Use tensor torsors and effective coefficient-module descent. Extend the reductive quotient description through the unipotent derived series. On geometric points use the good double-coset condition and descend the trace flag.

The consuming constructions use this interface as follows. Layer 6 §6.5: Realizes moduli of modified pairs. Layer 5 §5.5: Identifies which rigid maps land in a good cell.

**Checks.**

- For reductive G this agrees with the one-leg Grassmannian supplied by GS0.
- For G_m/L each integer type a has cell Spd L and flag Spa L; after any p-adic extension L′/L that cell is Spd L′. BB has one geometric point on either side.
- Gr_Ga=B_dR/B_dR+ has nonzero geometric points, while its only good cocharacter cell is the zero point.

**Acceptance.** A non-reductive Grassmannian need not be the union of its good cocharacter cells.

*Needs:* §4.5; §1.4; GeometricSatakeAndFusion GS0:loop-geometry / grassmannian; GeometricSatakeAndFusion GS0:loop-geometry / schubert-bounds-and-properness; DiamondsAndVStacks D6 / gluing-and-the-diamond-functor; DiamondsAndVStacks D6 / etale-site-comparison; DiamondsAndVStacks D6 / seminormal-rigid-full-faithfulness; HodgeTateAndCanonicalSubgroups §2.14; AdicSpacesPartII R1.3 / analytification-functor.

### 5.2 Subgroup immersion criterion

For a closed embedding H→G of connected linear groups, Gr_H→Gr_G is a monomorphism. It is locally closed if G/H is quasi-affine, and closed if G/H is affine. Prove these statements by integral loci in an observable embedding, not by assuming every faithful representation gives a closed Grassmannian embedding.

(HKII, arXiv v2, Lemma 5.1.1, pp. 33–34; HKII line 1495).

Express a reduction to H as an integral section of the homogeneous-space model. For a Chevalley line Q_p v with H-character chi, let G×G_m act by (g,z)·v=z rho(g)v. Its vector stabilizer is the graph h↦(h,chi(h)^-1), since z chi(h)=1. Use the observable-quotient supplier contract for this graph. Apply the closed-integrality lemma for affine quotients, and its open restriction for quasi-affine ones.

**Acceptance.** The affineness and quasi-affineness hypotheses are kept distinct.

*Needs:* §5.1; §4.3; ReductiveGroups Layer 3; `TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer`.

### 5.3 Grassmannian geometry and Schubert loci

For connected linear G/L, with L a p-adic field, Gr_G is separated and partially proper over Spd L and an increasing union of closed locally spatial diamonds. For a cocharacter class [mu] with reflex extension L([mu])/L, Gr_[mu] is a locally closed locally spatial subdiamond of Gr_G ×_(Spd L) Spd L([mu]), partially proper over Spd L([mu]); it is closed in that base change if [mu_M] is minuscule for the reductive Levi quotient M. For any [mu], Gr_[mu] is closed in `Gr_G x_{Gr_M} Gr_[mu_M]`, with the fibre product taken over Spd L([mu]).

(HKII, arXiv v2, Theorem 5.0.4(1)–(3), pp. 31–32; §§5.1–5.2, pp. 33–34; HKII line 1419).

Embed G observably into GL(V)×G_m and import reductive bounded diamonds. Use Levi-cell local closedness. In its Levi preimage cut out the required cell by the faithful-representation dominance bound of specialization. Apply the valuative criterion for partial properness with the same embeddings.

**Checks.**

- For G_m and an integer type, the cell is Spd L, so it is locally spatial, partially proper and closed of dimension zero.
- For GL_2 and type (1,0), the cell is the projective-line flag diamond, closed and proper over its reflex base.
- For GL_2 and type (2,0), the boundary type (1,1) is in its Schubert closure. The cell is locally closed and partially proper, but is not closed in the whole Grassmannian.

**Acceptance.** Do not strengthen local closedness to closedness for an arbitrary cocharacter.

*Needs:* §5.1; §5.2; §0.3; GeometricSatakeAndFusion GS0:loop-geometry / grassmannian; GeometricSatakeAndFusion GS0:loop-geometry / schubert-bounds-and-properness; `TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer`.

### 5.4 Faithful-representation cutout

Fix a Levi G=M⋉U and a closed faithful rho:G→GL(V). In `Gr_G x_{Gr_M} Gr_[mu_M]`, the cell Gr_[mu] is exactly the inverse image under rho of the closed Schubert bound Gr_GL(V),≤rho(mu). Thus Gr_[mu]=(`Gr_G x_{Gr_M} Gr_[mu_M]`)∩rho^-1(Gr_≤rho(mu)). The order is the usual reductive dominance order with matching determinant/Kottwitz invariant.

(HKII, arXiv v2, Proposition 5.2.1, equation (5.2.1.1), p. 34; HKII line 1555).

Specialization puts every actual representation type above the induced Levi type. The imposed upper bound forces equality. Faithfulness then forces goodness, proving the functorial equality on geometric points and the represented closed subdiamond.

**Acceptance.** Both the Levi-type condition and the representation bound are necessary.

*Needs:* §0.3; §5.1; GeometricSatakeAndFusion GS0:loop-geometry / grassmannian; GeometricSatakeAndFusion GS0:loop-geometry / schubert-bounds-and-properness.

### 5.5 Rigid sources and Griffiths transversality

Let L be p-adic, G/L connected linear, and [mu] a cocharacter class with reflex field L([mu]). For a seminormal rigid S over L([mu]) and a map S^diamond→Gr_G ×_(Spd L) Spd L([mu]) whose Levi projection lands in Gr_[mu_M], the map factors through Gr_[mu]. BB identifies such maps with filtrations of type [mu^-1] on the trivial G-bundle whose restriction to the smooth locus is Griffiths transversal for the trivial connection. For smooth S the condition holds everywhere. Every rigid analytic point of Gr_G is good. No claim is made that all geometric points are good.

(HKII, arXiv v2, Theorem 5.0.4(4), p. 31; §5.3, pp. 34–35; HKII line 1430, HKII line 1566).

At a classical point pass to the completed algebraic closure of its residue field and use §0.5 with Tate–Sen vanishing to recover the canonical lattice; extend it to larger geometric fields only afterwards. The closed cutout and density give the factorization. On a resolution use the smooth comparison of Layer 4. Descend the flag and its canonical lattice along the resolution and its fibre product by seminormal full faithfulness.

**Acceptance.** This handles the application of the smooth theorem on a singular base.

*Needs:* §5.3; §4.7; §0.5; DiamondsAndVStacks D6 / gluing-and-the-diamond-functor; DiamondsAndVStacks D6 / etale-site-comparison; DiamondsAndVStacks D6 / seminormal-rigid-full-faithfulness; AdicSpacesPartV RZ.5 / resolution-consequences.

### 5.6 Adjoint-weight BB criterion

BB:Gr_[mu]→Fl_[mu^-1]^diamond is an isomorphism iff all weights of Ad∘mu on Lie G are ≤1. If any weight exceeds 1, BB has no section over any nonempty open subdiamond of the flag variety. For reductive G this condition is equivalent to minuscule [mu]; for non-reductive G it is a one-sided bound. In particular every rigid analytic map into Gr_Ga is zero, although Gr_Ga has many geometric points.

(HKII, arXiv v2, Theorem 5.0.4(5), pp. 32, 35; Example 5.0.5, p. 32; HKII line 1438, HKII line 1458).

Compute the congruence stabilizer of t^mu in each adjoint weight. For the bounded case identify the quotient with the flag. For the converse a hypothetical section yields a filtration with impossible Griffiths-transverse differential in a weight >1 direction.

**Acceptance.** Replacing ≤1 by |weight|≤1 for general G loses legitimate one-sided examples.

*Needs:* §5.5; §0.5; §5.1; ReductiveGroups Layer 2.

### Examples

For G_a in its standard unipotent two-dimensional representation, Gr_Ga(C)=B_dR(C)/B_dR+(C), so ξ^(−1) is a geometric point. There is only the zero cocharacter; its good cell and flag variety are points. Every map from a rigid analytic diamond into Gr_Ga is zero. Thus neither exhaustion by good cells nor rigid analyticity of the entire Grassmannian follows from its many geometric points. (HK II Example 5.0.5, p. 32; HKII line 1458)

On a reductive GL_2 cell of type (1,0), adjoint weights are −1,0,1 and BB identifies the cell with the appropriate projective-line flag. A non-reductive type can instead have adjoint weights 0,1,−2: BB for that type is an isomorphism, while BB for its inverse fails. The inverse has a weight 2 and admits no local section over any nonempty flag open. The mirabolic example in §9.4 distinguishes these cases. (HK II Theorem 5.0.4(5), pp. 32, 35, and Example 8.4.4, p. 53.)

### Dependencies

- AdicSpacesPartII R1.3 / analytification-functor.
- HodgeTateAndCanonicalSubgroups §2.14.
- `TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer`.
- Layer 4.
- Layer 1.
- GeometricSatakeAndFusion GS0:loop-geometry / grassmannian.
- GeometricSatakeAndFusion GS0:loop-geometry / schubert-bounds-and-properness.
- DiamondsAndVStacks D6 / gluing-and-the-diamond-functor.
- DiamondsAndVStacks D6 / etale-site-comparison.
- DiamondsAndVStacks D6 / seminormal-rigid-full-faithfulness.
- ReductiveGroups Layer 3.
- Layer 0.
- AdicSpacesPartV RZ.5 / resolution-consequences.
- ReductiveGroups Layer 2.

## Layer 6: Neutral families and admissible loci

Construct neutral families, prove their Tannakian structure and connected motivic groups, and represent nonempty geometrically connected admissible loci. The arbitrary-field constant-good-type theorem has the explicit independent de Rham criterion specified in the supplier contract.

### 6.1 Neutral admissible pairs in families

For a nonempty locally spatial Y/Spd Q_p-breve, a neutral admissible pair is a fixed finite-dimensional isocrystal W together with a B_dR+-lattice L_et⊂W⊗B_dR whose geometric fibres are admissible. W is globally constant, including on disconnected Y. Morphisms are fixed isocrystal maps preserving the lattice. Define omega_et by the slope-zero bundle/local-system equivalence, c_dR by modification, omega_Isoc=W, and L_dR=c_dR^-1(W⊗B_dR+).

(HKII, arXiv v2, Definition 7.1.1, p. 39; equations (7.1.3.1)–(7.1.3.5), pp. 40–41; HKII line 1793, HKII line 1846).

The interface consists of the following operations and laws.

- omega_et is a pro-étale Q_p-local system with fibre V_et of the pointwise pair.
- omega_Isoc is the specified fixed W and is faithful on morphisms.
- c_dR sends omega_et⊗B_dR+ onto L_et and L_dR onto W⊗B_dR+.
- All three realizations and both lattices commute with pullback of the locally spatial base.

Patch on FF_Y, apply the family slope-zero equivalence and compare off the divisor. Recover the two lattices using the same comparison isomorphism.

The consuming constructions use this interface as follows. Layer 6 §6.2: Proves the family category has fibre functors. Layer 9 §9.1: Adds trivializations of both fixed realizations.

**Checks.**

- On Spd C the definition and every realization agree with Layer 2.
- A family with genuine isocrystal monodromy is outside the neutral category even if each geometric fibre is an admissible pair.
- On Y=Spd C ⊔ Spd C a morphism is still one fixed isocrystal map; two independently chosen fibre maps need not define a morphism.

**Acceptance.** Do not replace the fixed isocrystal by an arbitrary isocrystal local system.

*Needs:* §2.2; §4.2; §4.4; VectorBundlesAndIsocrystals VB4 / slope-zero-local-systems; VectorBundlesAndIsocrystals VB4 / relative-HN-filtration-and-proetale-splitting.

### 6.2 Family Tannakian theorem

For nonempty locally spatial Y/Spd Q_p-breve, neutral admissible pairs form a Q_p-linear neutral Tannakian category; evaluation of omega_et at any geometric y is an exact faithful fibre functor. The underlying isocrystal functor is exact and faithful. Prove kernels, images and cokernels as families, using local triviality of constant-slope bundles rather than inferring it from pointwise rank alone. This is HK II Theorem 7.1.2.

(HKII, arXiv v2, Theorem 7.1.2 and Remark 7.1.3, p. 40; HKII line 1808, HKII line 1835).

Take isocrystal kernels and intersect the lattice. Use exactness in each point category and the relative constant-slope/local-system theorem to show the lattices are locally free of the required ranks. Check End(1)=Q_p; a single fibre detects a fixed isocrystal map.

**Acceptance.** The evaluation remains faithful even for disconnected Y because the isocrystal maps are fixed.

*Needs:* §6.1; §2.3; MotivesAndAlgebraicCycles §§6.1–6.3 and 6.8; VectorBundlesAndIsocrystals VB4 / slope-zero-local-systems; VectorBundlesAndIsocrystals VB4 / relative-HN-filtration-and-proetale-splitting; MotivesAndAlgebraicCycles §§6.1–6.2; MotivesAndAlgebraicCycles §6.8; MotivesAndAlgebraicCycles §6.3.

### 6.3 G-families and canonical reduction

A neutral G-admissible pair is an exact tensor functor A:Rep_Qp G→AdmPair^neutral(Y) such that, at every geometric y, omega_y∘A is isomorphic to the standard fibre functor. These isomorphisms are required to exist, not chosen as part of the object. With a chosen geometric fibre trivialization define H=MG(A,y)≤G from its generated tensor subcategory and apply the imported canonical reduction (gap:tannakian-canonical-reduction). H is connected. The isocrystal tensor functor of its canonical H-reduction is globally fixed and is isomorphic to W_bH for some b_H∈H(Q_p-breve), without a connectedness hypothesis. If Y is connected, its étale fibre functors all have the standard H-form, so the reduction is neutral. With g sending f(b_H) to b by sigma-conjugation, the classifying map factors through the H-admissible locus. For disconnected Y this assertion is made componentwise, not with one universal neutral reduction.

(HKII, arXiv v2, Definition 7.2.1, p. 41; Lemma 7.5.1, pp. 46–47, with the connected-base hypothesis; HKII line 1869, HKII line 2117).

The interface consists of the following operations and laws.

- MG is a closed connected subgroup, well-defined up to conjugacy before choosing a fibre trivialization.
- The H-reduction induces the original G-family and is tensor-generated by it.
- On any Y, choose b_H and g with g f(b_H) sigma(g)^−1=b for the fixed H-isocrystal tensor functor; connectedness is needed for the étale neutral form, not for b_H.
- The factorized classifying map pulls the universal H-pair back to the canonical reduction.

A finite tensor quotient is trivial at every geometric point by the pointwise connectedness theorem. Its constant isocrystal maps then preserve the lattices globally, proving connectedness of MG. The H-isocrystal functor is fixed globally. Steinberg triviality over Q_p-breve gives b_H and a sigma-conjugating g, independently of connectedness of Y. The form of the étale H-fibre functor lies in ker(H^1(Q_p,H)→H^1(Q_p,G)). A continuous H-torsor has locally constant fibre form; on connected Y the form is fixed by its standard value at y. Use this neutrality and g to obtain the H-admissible factorization. On a disconnected base another component can have a different étale form.

The consuming constructions use this interface as follows. §8.4: Selects the subgroup responsible for a special locus. §11.5: Reduces the period-image argument to full generic group.

**Checks.**

- A constant family has its pointwise MG and its pointwise canonical reduction on every connected base.
- A nontrivial finite group cannot be the MG of a neutral family; neutrality alone would not establish this.
- For a norm-one quadratic torus H⊂SL_2, ker(H^1(Q_p,H)→H^1(Q_p,SL_2)) is nontrivial. Different connected components can have different étale H-fibre forms while the isocrystal functor remains globally fixed; one selected fibre cannot neutralize them all.

**Acceptance.** Connectedness of MG and neutrality of the reduction are separate obligations.

*Needs:* §6.2; §2.5; §1.1; MotivesAndAlgebraicCycles §§6.1–6.3 and 6.8; MotivesAndAlgebraicCycles §§6.1–6.2; MotivesAndAlgebraicCycles §6.8.

### 6.4 Good type over rigid bases

Assume the arbitrary-field full-rank de Rham criterion in the PadicHodgeTheory supplier contract. Let S be a geometrically connected seminormal rigid analytic variety over a p-adic L⊇Q_p-breve, and let A be a neutral G-admissible pair on S^diamond. Then its bilatticed G-local system is good and has a single type [mu], with [mu] defined over L. For connected S not geometrically connected, pass to its finite field of constants and apply the statement componentwise. For a connected seminormal S whose classifying map has fixed ambient type, the canonical motivic reduction also has a fixed subgroup type after the appropriate reflex-field extension.

(HKII, arXiv v2, Definition 7.2.2 and Theorem 7.2.3, pp. 41–42; Lemma 7.5.1(2), p. 47; HKII line 1890, HKII line 1904, HKII line 2123; LiuZhu, Theorem 1.3, pp. 2–3, and Theorem 3.9, pp. 24–28; LiuZhu line 89, LiuZhu line 1154).

Descend the Q_p-local system to the étale site and resolve the seminormal rigid source; the resolution is a proper surjective v-cover. On the smooth source the de Rham comparison identifies L_et⊗OB_dR with W_L⊗OB_dR for the constant flat bundle W_L. Invoke the explicitly requested full-rank de Rham criterion over arbitrary p-adic L; this criterion is a recorded supplier gap, not an application of finite-field Liu–Zhu rigidity. That criterion gives the associated locally split Griffiths-transversal filtration, hence goodness and locally constant type. Geometric connectedness and Galois descent make its conjugacy class single and L-defined. Use §5.5 only after the Levi type is known: it lifts that type to G. Uniqueness on analytic trivializations and seminormal full faithfulness descend the filtration from the resolution. Apply the same argument to the canonical motivic subgroup after the connected-base neutral reduction. General rigid sources factor through their seminormalizations at the diamond level.

**Acceptance.** Do not apply Liu–Zhu’s finite-Q_p-field rigidity theorem directly over an arbitrary strict field or singular S. The arbitrary-field full-rank criterion is an explicit independent hypothesis. A fixed-type Grassmannian theorem cannot establish its own type hypothesis.

*Needs:* §6.3; §5.5; §4.5; AdicSpacesPartV RZ.5 / resolution-consequences; DiamondsAndVStacks D6 / gluing-and-the-diamond-functor; DiamondsAndVStacks D6 / etale-site-comparison; DiamondsAndVStacks D6 / seminormal-rigid-full-faithfulness; PadicHodgeTheory §§7.1 and 7.4; PadicHodgeTheory §§2.2–2.3; PadicHodgeTheory §7.4.

### 6.5 b-rigidified admissible loci

For b∈G(Q_p-breve), a b-rigidification of a neutral G-pair is a tensor identification of its isocrystal functor with W_b. Define `Gr_G^{b-adm}` as the sub-v-sheaf of Gr_G over Spd Q_p-breve whose modification of E_b lies in the trivial bundle stratum. Define `Gr_[mu]^{b-adm}` by intersection with the good cell over the composite reflex field Q_p-breve([mu]). It represents b-rigidified neutral G-pairs, with universal étale realization and de Rham lattice.

(HKII, arXiv v2, Definition 7.3.1 and Proposition 7.3.2, pp. 42–43; HKII line 1944, HKII line 1962).

The interface consists of the following operations and laws.

- Maps Y→`Gr_G^{b-adm}` are b-rigidified neutral G-pairs on Y.
- `Gr_G^{b-adm}` is open in Gr_G over Spd Q_p-breve.
- Pulling the universal pair back gives the represented pair and its two realizations.
- The fixed-type locus is the fibrewise intersection with Gr_[mu], not a redefinition of the whole admissible functor.

Apply patching to the universal lattice on E_b. Pull back the open trivial bundle stratum. Recover a b-rigidified pair from its lattice and prove the representing equivalence functorially.

The consuming constructions use this interface as follows. Layer 8 §8.3: Defines closed special subdiamonds. Layer 9 §9.1: Adds a global étale trivialization.

**Checks.**

- The standard lattice for b=1 gives the trivial pair.
- For G_m with incompatible slope and lattice degree, the modification is not slope zero and the point is excluded.
- Changing the b-rigidification acts by G_b(Q_p); the representing point includes this choice rather than quotienting it away.

**Acceptance.** The entire admissible locus may contain points outside every good type cell for non-reductive G.

*Needs:* §5.1; §6.1; §1.5; RelativeFarguesFontaine §7.2; RelativeFarguesFontaine §7.4.

### 6.6 Non-emptiness and rigid points

For connected linear G and a cocharacter class [mu], `Gr_[mu]^{b-adm}` is nonempty iff [b]∈B(G,[mu^-1]); in that case it contains a rigid analytic point over a finite extension of Q_p-breve([mu]).

(HKII, arXiv v2, Proposition 7.3.3, p. 43; HKII line 1968).

Necessity follows by projecting a modification to the reductive Levi quotient. Import the reductive non-emptiness and rigid-point theorem. Lift a Levi point through a Levi splitting to G.

**Acceptance.** Rigid-point existence refers to the admissible locus, not merely the ambient cell.

*Needs:* §6.5; §1.2; §2.6; HeckeStacksAndLocalShtukas §HS2.15; HeckeStacksAndLocalShtukas §HS2.12.

### 6.7 Cohomologically smooth connected products

Let C/Q_p be complete algebraically closed, let ℓ≠p, and let X and Y be nonempty connected locally spatial diamonds which are ℓ-cohomologically smooth over Spd C. Then X×_(Spd C)Y is connected. Cohomological smoothness includes separatedness, compactifiability and local finiteness of dim.trg for the structure maps.

(HKII, arXiv v2, Lemma 7.3.5, pp. 44–45; HKII line 2028).

For the structure map f of a nonempty connected factor, Rf_!Rf^!F_ℓ is concentrated in nonpositive degrees and its degree zero is F_ℓ, dual to H^0 of the constant sheaf. Use smooth twisted pullback and the lower-shriek base-change/projection identities to obtain the Künneth formula for these dualizing complexes on the product. Its degree-zero group is F_ℓ⊗F_ℓ=F_ℓ. Verdier duality gives H^0(X×Y,F_ℓ)=F_ℓ, which characterizes connectedness. The shriek identities apply without quasicompactness.

**Acceptance.** Nonemptiness is explicit; products of arbitrary diamonds are not declared connected.

*Needs:* DiamondSixOperations §S3.2; DiamondSixOperations §S4.2; DiamondSixOperations §S4.3; DiamondSixOperations §S2.4.

### 6.8 Geometric connectedness of admissible loci

If [b]∈B(G,[mu^-1]), the nonempty diamond `Gr_[mu]^{b-adm}` is geometrically connected. After writing G=M⋉U and moving b into M, U(B_dR+) preserves the admissible locus, its action on this cell factors through U(B_dR+/Fil^m) for m above the relevant adjoint weights, and the product of that truncated loop diamond with the Levi admissible locus maps surjectively on underlying spaces onto the G-locus.

(HKII, arXiv v2, Proposition 7.3.4, pp. 43–44; HKII line 1985).

Use the pullback description of the trivial stratum to check U-invariance. Compute the finite congruence truncation and topological surjectivity. Import reductive connectedness and apply the connected-product result. Descend connectedness along the topologically surjective map.

**Acceptance.** The hypothesis excludes the empty locus; connected is used in the nonempty sense here.

*Needs:* §6.6; §6.7; §1.5; GeometricSatakeAndFusion GS0:Schubert-smoothness / open-cell-stabilizer-and-smoothness; GeometricSatakeAndFusion GS0:Schubert-smoothness / truncated-positive-loops; GeometricSatakeAndFusion GS0:Schubert-smoothness / truncation-of-the-loop-action; HeckeStacksAndLocalShtukas §HS2.15; HeckeStacksAndLocalShtukas §HS2.12.

### Examples

A torus has one compatible b-class for a fixed cocharacter. Its fixed-type admissible locus is a point over the composite reflex field and is geometrically connected; choosing a b with the wrong Kottwitz invariant makes it empty. Nonemptiness must therefore precede the connectedness assertion. For a general G=M⋉U, a sufficiently high truncated positive-loop U-diamond is connected and cohomologically smooth. Its product with the corresponding reductive admissible locus covers the G-locus on underlying spaces. Apply the product lemma with both factors cohomologically smooth. (HK II Propositions 7.3.3–7.3.4 and Lemma 7.3.5, pp. 43–45; HKII line 1968)

On a disconnected base the defining W of a neutral pair remains one globally fixed isocrystal. Evaluation of the fixed isocrystal maps at one geometric fibre is still faithful, but a canonical subgroup reduction need not admit one neutral form across all components. Connectedness is required at that reduction step. The globally fixed H-isocrystal admits b_H on every base; the possible variation between components lies in the étale fibre form. On a geometrically connected rigid base, constancy of Levi type requires the independent full-rank de Rham criterion in the supplier contracts. Only after that step does the rigid-source theorem lift it to one good G-type. A general rigid source is handled by seminormalization at the diamond level. (HK II Definition 7.1.1 and Lemma 7.5.1, pp. 39, 46–47; HKII line 1793)

### Dependencies

- Layer 2.
- Layer 4.
- VectorBundlesAndIsocrystals VB4 / slope-zero-local-systems.
- VectorBundlesAndIsocrystals VB4 / relative-HN-filtration-and-proetale-splitting.
- MotivesAndAlgebraicCycles §§6.1–6.3 and 6.8.
- MotivesAndAlgebraicCycles §§6.1–6.2.
- MotivesAndAlgebraicCycles §6.8.
- MotivesAndAlgebraicCycles §6.3.
- Layer 1.
- Layer 5.
- AdicSpacesPartV RZ.5 / resolution-consequences.
- DiamondsAndVStacks D6 / gluing-and-the-diamond-functor.
- DiamondsAndVStacks D6 / etale-site-comparison.
- DiamondsAndVStacks D6 / seminormal-rigid-full-faithfulness.
- PadicHodgeTheory §§7.1 and 7.4.
- PadicHodgeTheory §§2.2–2.3.
- PadicHodgeTheory §7.4.
- RelativeFarguesFontaine §7.2.
- RelativeFarguesFontaine §7.4.
- HeckeStacksAndLocalShtukas §HS2.15.
- HeckeStacksAndLocalShtukas §HS2.12.
- DiamondSixOperations §S3.2.
- DiamondSixOperations §S4.2.
- DiamondSixOperations §S4.3.
- DiamondSixOperations §S2.4.
- GeometricSatakeAndFusion GS0:Schubert-smoothness / open-cell-stabilizer-and-smoothness.
- GeometricSatakeAndFusion GS0:Schubert-smoothness / truncated-positive-loops.
- GeometricSatakeAndFusion GS0:Schubert-smoothness / truncation-of-the-loop-action.

## Layer 7: Neutral Hodge structures and period domains

Construct neutral Hodge structures in families and their Mumford–Tate groups, represent fixed type by the nonempty open domain X_mu, and prove closedness and rigid-Zariski closedness of Hodge–Tate loci and special Hodge domains.

### 7.1 Neutral Hodge structures in families

For nonempty locally spatial Y/Spd Q_p-breve, a neutral p-adic Hodge structure is a fixed finite Q-graded Q_p-space V and a B_dR+-lattice L_dR in V⊗B_dR, compatible with grading and having pointwise Hodge-structure fibres of the prescribed weights. Morphisms are fixed graded Q_p-linear maps preserving L_dR. A G-structure is an exact tensor functor into this category; its MT group at y is defined from the generated tensor subcategory. For a G-structure require its fixed étale tensor functor to be isomorphic to the standard fibre functor. A choice of that isomorphism is the additional trivialization used by the represented domain.

(HKII, arXiv v2, Definition 6.0.1, Example 6.0.2 and Definition 6.1.1, pp. 35–36; HKII line 1619, HKII line 1628, HKII line 1643).

The interface consists of the following operations and laws.

- Pullback retains the fixed graded V and pulls back only its lattice.
- A geometric fibre is exactly the pointwise HS object of Layer 2.
- The tensor-generated Mumford–Tate group is a closed subgroup in a chosen G-fibre trivialization.
- A basic neutral admissible family with a chosen global constant étale frame gives a neutral Hodge family. Conversely a Hodge family gives a neutral admissible family only when its associated constant-slope bundle has globally constant isocrystal realization with a chosen frame. Fibrewise isocrystal classification supplies no such global frame; its obstruction is the corresponding G_b(Q_p)-frame torsor.

Use pointwise purity to obtain constant-slope modified families. Apply the relative local-triviality theorem to kernels and images. Form tensor and dual using weight addition.

The consuming constructions use this interface as follows. Layer 7 §7.3: Defines the represented Hodge objects on the trivial étale fibre. Layer 7 §7.4: Makes Hodge lines a condition on one fixed rational line.

**Checks.**

- The constant graded unit with L_dR=B_dR+ has weight zero.
- The constant Tate structure has weight −2n and L_dR=Fil^-n, matching Layer 2.
- A weight-zero rank-one local system with order-two monodromy −1 has pure unit fibres but no fixed global V-frame. It is a variation, and fails the neutral Hodge-family definition; the constant local system has monodromy 1.
- A nontrivial G_b(Q_p)-frame torsor of a constant-slope bundle prevents a global neutral admissible inverse, even though every geometric Hodge fibre has a basic admissible inverse.

**Acceptance.** Fixed grading and fixed V distinguish neutral objects from arbitrary variations.

*Needs:* §2.1; §4.4; §2.5; VectorBundlesAndIsocrystals VB4 / slope-zero-local-systems; VectorBundlesAndIsocrystals VB4 / relative-HN-filtration-and-proetale-splitting.

### 7.2 Tannakian structure of Hodge families

Neutral p-adic Hodge structures on a nonempty locally spatial Y form a neutral Tannakian category with the fixed V forgetful functor. Its fundamental group is connected. Prove abelianness using relative constant-slope local triviality of modified bundles, then apply the pointwise finite-quotient argument to the fixed V maps.

(HKII, arXiv v2, Paragraph after Example 6.0.2, p. 36; HK I Theorem 4.3.5, pp. 35–36; HKI line 1646; HKII line 1630).

Construct graded kernels and images; the constant-slope theorem makes their lattices locally free. Check exactness of the V functor. A finite tensor quotient trivial on every fibre is trivial globally because its rational vector maps are fixed.

**Acceptance.** Fibrewise finite freeness is not used as a substitute for a family theorem.

*Needs:* §7.1; §2.3; MotivesAndAlgebraicCycles §§6.1–6.3 and 6.8; VectorBundlesAndIsocrystals VB4 / slope-zero-local-systems; VectorBundlesAndIsocrystals VB4 / relative-HN-filtration-and-proetale-splitting; MotivesAndAlgebraicCycles §§6.1–6.2; MotivesAndAlgebraicCycles §6.8; MotivesAndAlgebraicCycles §6.3.

### 7.3 The Hodge period domain

Fix a connected linear G and [mu] for which B(G,[mu^-1]) has a G-basic class. Let X_[mu]⊂Gr_[mu^-1] be the open locus where the modified trivial bundle is basic. Its universal neutral G-Hodge structure has weight homomorphism 2nu and type [mu] in the Hodge convention. It represents neutral G-Hodge structures on the fixed trivial étale fibre functor of this type with central weight homomorphism in G. The space is nonempty. Its geometric connectedness is proved in Layer 9 after basic duality.

(HKII, arXiv v2, §6.2, Lemma 6.2.1 and Proposition 6.2.3, pp. 36–37; HKII line 1661, HKII line 1667, HKII line 1681).

The interface consists of the following operations and laws.

- X_[mu] is open in Gr_[mu^-1].
- Maps to X_[mu] classify neutral G-Hodge structures of this type with central weight homomorphism and the specified étale tensor identification.
- On each representation the weight is twice the central Newton grading.
- A geometric point is a lattice whose modified trivial bundle has the unique G-basic class prescribed by [mu].

Pull back the open basic stratum along the modification map. Use the unique G-basic class and its central Newton grading to define the universal Hodge object. Use pointwise existence for nonemptiness; prove geometric connectedness in Layer 9.

The consuming constructions use this interface as follows. Layer 7 §7.6: Provides domains for subgroup Hodge structures. Layer 9 §9.2: Is the target of the second period map.

**Checks.**

- For a torus and a specified type, X_[mu] is the corresponding single cocharacter point over the correct reflex field.
- For the upper triangular Borel in GL_2 and inverse invariant (1,0), every compatible Levi Newton grading is diag(1,0), which is noncentral in the Borel. There is no G-basic class and no nonempty domain of this central-weight type.
- A slope −n Tate basic class produces weight −2n, not −n.

**Acceptance.** Use 2nu for the weight homomorphism and nu for the slope homomorphism.

*Needs:* §7.1; §7.2; §1.5; §2.6; §5.1.

### 7.4 Hodge–Tate loci of lines

For a neutral Hodge family (V,L_dR) and a rational line ell⊂`V_{2n}`, define HT(ell) by ell⊗Fil^n B_dR⊂L_dR. It is the locus where ell is a Hodge substructure of weight 2n, equivalently where MT fixes the line. For a G-family use every representation and every such even-weight line; a line mixing weights does not define this condition.

(HKII, arXiv v2, Definition 6.3.1 and Lemma 6.3.2, pp. 37–38; HKII line 1710, HKII line 1721).

The interface consists of the following operations and laws.

- HT(ell) is a closed subdiamond of Y.
- At a geometric point, membership is equivalent to the corresponding MT group stabilizing ell.
- The locus pulls back under a map of bases with the fixed V data.
- The locus depends on the line, not its choice of nonzero rational generator.

Express the inclusion as an integral morphism of lattices and apply the integrality lemma. A rank-one pure Hodge structure of weight 2n is the Tate object Q_p(−n), giving the stabilizer interpretation.

The consuming constructions use this interface as follows. Layer 7 §7.6: Cuts out subgroup period domains by Chevalley lines. §11.5: Recognizes the opposite-special closure under basic duality.

**Checks.**

- For V=Q_p(−n) and its standard lattice Fil^n, HT(V) is the whole base.
- For a rank-one lattice Fil^a, the condition Fil^n⊂Fil^a holds exactly for n≥a; reversing the inequality changes the locus.
- At n=0 the inclusion is the ordinary integral-line condition; it is not the condition that every vector in a larger graded space be integral.

**Acceptance.** All integral n, including negative n, require Fil^n B_dR, not an unqualified B_dR+.

*Needs:* §7.1; §2.5; §4.3.

### 7.5 Rigid closedness of Hodge–Tate loci

For a neutral G-Hodge structure of fixed good type on a seminormal rigid S, every HT(ell) is a rigid Zariski closed subdiamond of S^diamond. Use BB to turn the lattice inclusion into a closed incidence condition on a rigid flag variety; the rigid-source theorem handles singular S through resolution and seminormal descent.

(HKII, arXiv v2, Lemma 6.3.3, p. 38, using the rigid-source formulation of Theorem 5.0.4(4), p. 31; HKII line 1731, HKII line 1430).

Translate the rank-one lattice inclusion to the appropriate trace-filtration incidence condition. Pull back the closed flag incidence variety. For singular S work on a resolution and descend the map and closed subspace.

**Acceptance.** No application of Theorem 3.3.1 to a singular S is hidden in the argument.

*Needs:* §7.4; §5.5; DiamondsAndVStacks D6 / gluing-and-the-diamond-functor; DiamondsAndVStacks D6 / etale-site-comparison; DiamondsAndVStacks D6 / seminormal-rigid-full-faithfulness.

### 7.6 Special Hodge subvarieties

For connected H≤G and type [mu_H] inducing [mu_G], with a basic class for H whose image in B(G) is the ambient G-basic class, the map X_[mu_H]→X_[mu_G] is the subgroup period map. If [mu_H] is minuscule on the Levi quotient, its image is closed, as detected by a Chevalley line in a single even weight. A special subvariety of X_[mu_G] is such an image with all adjoint H-weights of mu_H ≥−1; equivalently the corresponding subgroup Hodge domain is rigid analytic via BB on the inverse type.

(HKII, arXiv v2, §6.4, Proposition 6.4.1 and Definition 6.4.2, p. 39; HKII line 1765, HKII line 1786).

The interface consists of the following operations and laws.

- Compatible inclusions of groups and cocharacter classes induce the domain maps.
- Levi-minuscule subgroup type gives the closed image via the defining Hodge line.
- The lower adjoint bound ≥−1 on mu_H is the upper BB bound ≤1 on mu_H^-1.
- The restricted universal Hodge structure admits the indicated H-reduction.

Choose a Chevalley line; centrality of the basic Newton grading makes it lie in one weight. Rank-one purity makes that weight even. Cut out the subgroup domain by its Hodge–Tate locus and apply the Levi-minuscule condition; for the one-sided bound use BB for [mu_H^-1].

The consuming constructions use this interface as follows. Layer 9 §9.4: Defines the Hodge–Tate side of special subvarieties at infinite level.

**Checks.**

- A torus domain gives a zero-dimensional special Hodge subvariety.
- A subgroup type with adjoint weight −2 fails the ≥−1 Hodge-domain bound, even if it satisfies an unrelated upper bound.
- When the ambient type itself satisfies ≥−1, the identity inclusion yields the whole domain as a special subvariety.

**Acceptance.** Do not assume without proof that a defining Chevalley line has even weight.

*Needs:* §7.3; §7.4; §7.5; §5.6; §5.2; ReductiveGroups Layer 3; `TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer`.

### Examples

For V=Q_p(−n) of weight 2n the lattice is Fil^n, and its rational line satisfies the Hodge–Tate inclusion everywhere. At n=−1 this is Fil^(−1), a fractional lattice. For n=−1, replacing Fil^(−1) by B_dR+ weakens the inclusion: it would accept the lattice Fil^0, although Fil^(−1) is not contained in Fil^0. It does not reject the valid equality at Fil^(−1). At a general rank-one lattice Fil^a, the underlying ideal containment Fil^n⊂Fil^a is equivalent to n≥a. (HK II Definition 6.3.1, pp. 37–38; HKII line 1710)

In a subgroup construction, centrality of the basic Newton homomorphism puts a Chevalley defining line into one weight space. Rank-one purity forces that weight to be even. These are the reasons the line locus applies; neither is an extra guess about a representation. For the full ambient domain, nonemptiness comes from pointwise existence. Its geometric connectedness is the consequence of duality in Layer 9, which avoids using it to prove that same duality. (HK II Proposition 6.4.1, p. 39, and Theorem 8.5.1, p. 54; HKII line 1765, HKII line 2412)

A Hodge family need not carry a global isocrystal frame. Its constant-slope bundle can have a nontrivial G_b(Q_p)-frame torsor even though each geometric fibre corresponds to a basic admissible pair. A neutral admissible inverse therefore requires a globally constant isocrystal realization and its chosen frame, in addition to the étale frame used for the forward construction.

### Dependencies

- `TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer`.
- Layer 2.
- Layer 4.
- VectorBundlesAndIsocrystals VB4 / slope-zero-local-systems.
- VectorBundlesAndIsocrystals VB4 / relative-HN-filtration-and-proetale-splitting.
- MotivesAndAlgebraicCycles §§6.1–6.3 and 6.8.
- MotivesAndAlgebraicCycles §§6.1–6.2.
- MotivesAndAlgebraicCycles §6.8.
- MotivesAndAlgebraicCycles §6.3.
- Layer 1.
- Layer 5.
- DiamondsAndVStacks D6 / gluing-and-the-diamond-functor.
- DiamondsAndVStacks D6 / etale-site-comparison.
- DiamondsAndVStacks D6 / seminormal-rigid-full-faithfulness.
- ReductiveGroups Layer 3.

## Layer 8: Hodge loci and special admissible subspaces

Define Hodge loci and functorial maps, prove closedness of subgroup admissible loci using the neutral component of the tensor-Isom torsor kernel, and define special subdiamonds and rigid special subvarieties. Compute torus, Lubin–Tate and parabolic boundary examples.

### 8.1 Hodge loci of sub-isocrystal lines

For a b-rigidified family with isocrystal W and a rank-one sub-isocrystal ell≅Q_p-breve(n), define Hdg(ell) by ell⊗Fil^n B_dR⊂L_et. This is a closed subdiamond. Changing b by sigma-conjugation transports ell and the locus. On a seminormal rigid base of fixed type it is rigid Zariski closed, by BB and closed flag incidence. It detects whether MG stabilizes the line in the isocrystal realization.

(HKII, arXiv v2, Definition 7.4.1, Remark 7.4.2, Lemmas 7.4.3–7.4.4, pp. 45–46; HKII line 2065, HKII line 2081, HKII line 2086, HKII line 2087).

The interface consists of the following operations and laws.

- Hdg(ell) is represented by a closed subdiamond, and by a closed rigid subspace on fixed-type seminormal rigid bases.
- g:b→b′ carries Hdg(ell) to Hdg(g ell).
- A geometric point lies in Hdg(ell) iff the isocrystal-realized MG fixes ell.
- The same fixed line condition commutes with pullback of the family.

Translate line inclusion to the integral-locus condition. At geometric points invoke rank-one admissibility to identify the stabilized subobject. For rigid bases use the trace flag and resolution descent.

The consuming constructions use this interface as follows. Layer 8 §8.3: Defines the full Hodge locus of a Chevalley line. §10.1: Detects failure of the generic group by a proper line condition.

**Checks.**

- For the Tate pair of index n, ell has Frobenius p^-n and L_et=Fil^n, so its Hodge line locus is the entire base.
- Sigma-conjugating b without also moving ell need not preserve the named locus; moving both does.
- For n=−1, the intended inclusion Fil^(−1)⊂Fil^0 is false, but the replacement B_dR+⊂Fil^0 is true. The replacement therefore admits a false positive; the valid matching Tate lattice Fil^(−1) satisfies the original equality.

**Acceptance.** Hodge and Hodge–Tate loci use their respective rational structures and lattices.

*Needs:* §6.1; §6.3; §4.3; §5.5.

### 8.2 Functoriality of admissible loci

For f:H→G, b_H,b_G and g∈G(Q_p-breve) with g f(b_H) sigma(g)^-1=b_G, define `Gr_H^{b_H-adm}`→`Gr_G^{b_G-adm}` by L↦g f_*L. It pulls the universal G-pair back to extension of structure group of the universal H-pair, sends [mu_H] to its induced G-type, and is compatible with composition and changes of g.

(HKII, arXiv v2, §7.5, equation (7.5.0.1), p. 46; HKII line 2104).

The interface consists of the following operations and laws.

- The represented lattice map is exactly g f_*L.
- Composition uses the product g2 f2(g1) and agrees with extension of tensor functors.
- Pullback of the G-universal pair is f_* of the H-universal pair with the g-rigidification.
- A good H-type maps to its induced good G-type.

Extend the lattice and modified bundle along f. Use g to identify the source isocrystal with W_bG. Check functoriality on the representing moduli problem.

The consuming constructions use this interface as follows. Layer 8 §8.4: Embeds subgroup spaces. Layer 9 §9.3: Lifts the map after adding étale trivializations.

**Checks.**

- For f=id and g=1 this is the identity map.
- For an inner-conjugate embedding, the lattice is moved by the specified g, including its isocrystal rigidification.
- An ordinary conjugacy relation g f(b_H) g^-1=b_G is insufficient unless sigma(g)=g.

**Acceptance.** The conjugating element belongs to G(Q_p-breve), not to the coefficient field alone.

*Needs:* §6.5; §6.3; §1.3.

### 8.3 Closed subgroup admissible loci

For a closed inclusion H≤G and compatible b-data, `Gr_H^{b_H-adm}`→`Gr_G^{b_G-adm}` is a closed immersion. A Chevalley line ell for H has Hdg(ell) decomposed into open-and-closed pieces indexed by ker(H^1(Q_p,H)→H^1(Q_p,G)); the neutral piece is the indicated H-admissible locus after the chosen isocrystal rigidification. In general it is only one piece of Hdg(ell), and the whole preimage of the G-admissible locus in Gr_H is not H-admissibility.

(HKII, arXiv v2, Proposition 7.5.2 and Remark 7.5.3, pp. 47–48, with the tensor-torsor kernel specified; HKII line 2132, HKII line 2135).

Use the Chevalley line to obtain a reduction on its closed Hodge locus. Classify fibre-functor forms by the indicated H^1 kernel. The form is locally constant, so its neutral component is clopen and hence closed within the Hodge locus. Identify this neutral component with the represented H-admissible functor.

**Acceptance.** An SL_2/anisotropic-torus test rules out replacing the neutral piece by the entire Hodge locus.

*Needs:* §8.2; §8.1; §5.2; MotivesAndAlgebraicCycles §§6.1–6.3 and 6.8; ReductiveGroups Layer 3; MotivesAndAlgebraicCycles §§6.1–6.2; MotivesAndAlgebraicCycles §6.8; `TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer`.

### 8.4 Special admissible subspaces

A special subdiamond of `Gr_G^{b-adm}` is the image of `Gr_H^{b_H-adm}` under compatible closed connected subgroup data and sigma-conjugation. A special subvariety in a fixed G-type cell is the image of a nonempty `Gr_[mu_H]^{b_H-adm}` with [b_H]∈B(H,[mu_H^-1]), inducing the ambient type and satisfying all weights of Ad_H mu_H≤1. This image is a closed geometrically connected rigid analytic subdiamond of the entire admissible locus.

(HKII, arXiv v2, Definitions 7.5.4 and 7.5.6, Lemma 7.5.5, p. 48; HKII line 2166, HKII line 2169, HKII line 2182).

The interface consists of the following operations and laws.

- The full special subdiamond is closed in `Gr_G^{b-adm}`.
- The upper-bound special subvariety is represented by an open rigid subspace of Fl_[mu_H^-1].
- The Kottwitz-membership condition makes the subvariety nonempty and geometrically connected.
- Changing g acts through the ambient G_b(Q_p)-action and transports the special space.

Use closed subgroup admissibility. The upper adjoint bound implies Levi-minuscule type and identifies the cell with a flag variety. Intersect its closed cell with the open admissible locus and apply connectedness.

The consuming constructions use this interface as follows. Layer 9 §9.4: Defines Hodge-special subvarieties by lifting these spaces. §11.5: Identifies the closures obtained from an analytic subset.

**Checks.**

- A torus datum gives a special point with both adjoint bounds vacuous.
- Incompatible b_H and mu_H give an empty locus and cannot supply a nonempty special subvariety.
- A subgroup type with an adjoint weight 2 is not declared a rigid Hodge-special subvariety by this definition.

**Acceptance.** A special cell without the upper bound need not be closed in the ambient fixed-type cell.

*Needs:* §8.3; §6.8; §5.6; §5.3.

### 8.5 Torus and Lubin–Tate special points

For a torus T, a specified cocharacter class over Q_p-breve gives a single admissible point over its composite reflex field when its Kottwitz invariant matches b; over C the cocharacters are indexed separately, while before that base change use their Galois orbits. In the height-two Lubin–Tate case a quadratic extension F/Q_p embedded in the quaternion division algebra D gives the special period points P^1(F), moved by G_b(Q_p)=D×. These are local special points, without a global CM algebraicity condition.

(HKII, arXiv v2, Example 7.5.7 and Remark 7.5.8, pp. 48–49; HKII line 2189, HKII line 2204).

Use the torus Kottwitz formula and trivial adjoint representation. For height two identify maximal tori in the quaternionic inner form and their period flags through the tower comparison. Track the field/reflex base in each indexing set.

**Checks.**

- For T=G_m and type a, the matching isocrystal has slope −a and its cell is a single admissible point; a different slope gives the empty locus.
- A fixed height-two special point with endomorphisms F has stabilizer F× in D×. Its orbit D×/F× has Q_p-dimension 4−2=2, agreeing with the Q_p-dimension 2 of P^1(F).
- Both ramified and unramified quadratic F/Q_p are allowed, also at p=2; neither requires a global CM field or a global algebraicity condition.

**Acceptance.** Avoid counting inertia conjugates twice over Q_p-breve([mu]).

*Needs:* §8.4; BunGAndNewtonStrata BG1 / newton-and-kottwitz-maps; BunGAndNewtonStrata BG1 / admissible-finiteness-and-basic; BunGAndNewtonStrata BG1 / torus-norm-description; EndoscopicTransferAndUnitaryTraceComparison §12.11; EndoscopicTransferAndUnitaryTraceComparison §12.5.

### 8.6 Borel and parabolic boundary examples

Work over C_p for the disc families and put R = B_dR+(C) at geometric points. Let H be the upper triangular Borel of G=GL_2, and let mu_G(t)=diag(t^-1,1). Write L_[a:c]=R^2+R xi^-1(a e1+c e2). For b=diag(p,1), G-admissibility means a≠0, whereas H-admissibility in the full preimage means c=0. Thus a c≠0 gives an ambient-admissible point that is not subgroup-admissible. With b=diag(1,p) and the H-type mu_H(z)=diag(1,z^-1), which induces [mu_G], the H-cell <e1,xi^-1(e2+x e1)> is A^1 and maps isomorphically to the G-admissible part P^1 minus [e1]; both loci are H-admissible there. Separately, for G=GL_3 and H stabilizing the span of e1,e2, the family <e1,e2+(z/xi)e1,e3+(1/xi)e1> has constant G-type (1,0,−1); its GL_2×GL_1 Levi type is (1,−1;0) for z≠0 and (0,0;0) at z=0. Therefore a subgroup cell can fail to be closed in an ambient fixed-type cell, and subgroup Schubert decompositions need not be intersections with ambient cells.

(HKII, arXiv v2, Remark 7.5.3, p. 47; Example 7.5.10, pp. 49–50; HKII line 2135, HKII line 2230).

Compute elementary divisors and induced Levi lattices in the displayed bases. Separate G-triviality of the modified bundle from the H-fibre-functor neutrality condition. Compare the nonzero-z locus with its limit at zero.

**Acceptance.** The Borel’s b is diag(1,p) and its type is (0,−1) for the A^1 assertion; the reversed diagonal describes a different example.

*Needs:* §8.4; §5.4; §4.4.

### Examples

Let H be the upper triangular Borel in GL_2 and L_[a:c]=R²+R ξ^(−1)(a e1+c e2), with type diag(t^(−1),1). For b=diag(p,1), the e1 subline, whose isocrystal slope is 1 and bundle slope is −1, forces a≠0 for ambient admissibility. H-admissibility additionally requires the e1 subpair to be admissible, which forces c=0. Thus the point [1:1] is ambient-admissible and fails subgroup admissibility. For b=diag(1,p) and H-type mu_H=(0,−1), the cell ⟨e1,ξ^(−1)(e2+x e1)⟩ is A¹, maps to P¹ minus [e1], and is H-admissible throughout. These are different diagonal data. (HK II Remark 7.5.3, p. 47, with the specified diagonal and neutrality condition; HKII line 2135)

Over Spa(C_p⟨z⟩), the GL_3 parabolic stabilizing ⟨e1,e2⟩ gives another boundary. For ⟨e1,e2+(z/ξ)e1,e3+(1/ξ)e1⟩ the ambient type is (1,0,−1) throughout. At z≠0 its Levi type is (1,−1;0); at zero its Levi type is trivial. All these points are b=1 admissible by their filtration with unit admissible graded pieces. The punctured-disc subgroup cell is therefore not closed inside the ambient fixed-type intersection. (HK II Example 7.5.10, pp. 49–50; HKII line 2230)

For the neutral-piece issue take the norm-one torus T of an unramified quadratic E/Q_p inside SL_2. Here H¹(Q_p,T)=Q_p×/N(E×) has a nontrivial class represented by an element of odd valuation, while H¹(Q_p,SL_2) is trivial. An odd cocharacter gives that nonneutral T-fibre-functor form inside a neutral ambient SL_2 object. Consequently the full Chevalley-line Hodge locus can contain a nonneutral piece. Only its neutral piece represents the specified T-admissible functor. This is the tensor-torsor interpretation of Proposition 7.5.2, p. 47.

### Dependencies

- `TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer`.
- Layer 6.
- Layer 4.
- Layer 5.
- Layer 1.
- MotivesAndAlgebraicCycles §§6.1–6.3 and 6.8.
- ReductiveGroups Layer 3.
- MotivesAndAlgebraicCycles §§6.1–6.2.
- MotivesAndAlgebraicCycles §6.8.
- BunGAndNewtonStrata BG1 / newton-and-kottwitz-maps.
- BunGAndNewtonStrata BG1 / admissible-finiteness-and-basic.
- BunGAndNewtonStrata BG1 / torus-norm-description.
- EndoscopicTransferAndUnitaryTraceComparison §12.11.
- EndoscopicTransferAndUnitaryTraceComparison §12.5.

## Layer 9: Infinite-level spaces and basic duality

Represent pairs with both isocrystal and étale trivializations, describe modifications and period torsors, define the three kinds of special subvariety, and prove basic duality and connectedness of the Hodge domains without a circular dependency.

### 9.1 Infinite-level admissible moduli

M_b(Y) is the sheaf of neutral G-admissible pairs with a b-rigidification of their isocrystal realization and an étale trivialization omega_et≅omega_std. Equivalently it classifies modifications E_b⇢E_1 at the untilt, with both bundles fixed and the isomorphism away from the divisor retained. The good type-[mu] part is `M_{b,[mu]}`. The two trivialization groups act through G_b(Q_p) and G(Q_p), and the actions commute.

(HKII, arXiv v2, §§8.1–8.2, pp. 50–51; HKII line 2262, HKII line 2275).

The interface consists of the following operations and laws.

- M_b is the G(Q_p)-torsor of étale tensor frames of the universal pair on `Gr_G^{b-adm}`.
- The moduli functor equals modifications E_b⇢E_1 with both ends fixed.
- Changes of isocrystal and étale frames give commuting G_b(Q_p) and G(Q_p) actions.
- `M_{b,[mu]}` is the pullback of `Gr_[mu]^{b-adm}`.

Apply the represented b-rigidified moduli functor and take its étale frame torsor. Use patching to recover the modification with fixed ends. Check the two commuting changes of trivialization.

The consuming constructions use this interface as follows. Layer 9 §9.2: Defines both lattice period maps and finite levels. Layer 11 §11.1: Supplies the two tower structures.

**Checks.**

- M_1 for the trivial group is the base point.
- For compatible G_m data the lattice period targets are points, while the étale frame fibre is Q_p×. At K=Z_p××I the quotient fibre is Q_p×/Z_p×=Z, with valuation as its discrete coordinate.
- Two different étale trivializations of the same b-rigidified pair are distinct M_b-points.

**Acceptance.** A modification includes its isomorphism off infinity; retaining only the two bundles loses the moduli.

*Needs:* §6.5; §6.1; §1.3; RelativeFarguesFontaine §7.2; RelativeFarguesFontaine §7.4; DiamondsAndVStacks D3 / locally-profinite-torsors.

### 9.2 The two period maps

On `M_{b,[mu]}`, pi_Let sends a modification to L_et∈`Gr_[mu]^{b-adm}`; it is a G(Q_p)-torsor. pi_LdR records L_dR in the Grassmannian of the trivial étale fibre. If b is basic, its image is X_[mu] and pi_LdR is a G_b(Q_p)-torsor. Their BB composites are the Hodge map to Fl_[mu^-1] and the Hodge–Tate map to Fl_[mu]. After choosing a p-adic reflex base L and C its completed algebraic closure, put I=Gal(Lbar/L). After perfectoid pullback, apply DiamondsAndVStacks D3.10 (locally-profinite-torsors) to the G(Q_p)×I-torsor M_C over the L-admissible cell, and, for basic b, to its G_b(Q_p)×I-torsor over X_[mu],L. By D3.6 and D3.9 the compact-open quotients M_C/K are separated étale over the respective lattice targets; M_C is their inverse limit, as checked after the same pullback.

(HKII, arXiv v2, §8.3, equations (8.3.0.1)–(8.3.0.2), pp. 51–52; Lemma 8.3.1, p. 52; §1.1, p. 5; HKII line 2290, HKII line 2304, HKII line 2328).

The interface consists of the following operations and laws.

- BB∘pi_Let lands in Fl_[mu^-1], with the Hodge rational structure W_b.
- BB∘pi_LdR lands in Fl_[mu], with the étale rational structure.
- The two torsor groups are G(Q_p) for pi_Let and G_b(Q_p) for pi_LdR when b is basic.
- The imported compact-open quotient diagrams recover the respective pro-étale tower and its limit.

Read L_et and L_dR from the same comparison c_dR. Identify the frame fibres as the corresponding rational-point torsors. In the basic case transfer the slope grading and apply the Hodge moduli interpretation. Apply the imported level-space and inverse-limit theorem to the pullback of the torsor to each perfectoid space over the lattice target. The quotient v-sheaves M_C/K are separated étale over the target because these classes are v-local on the target (DiamondsAndVStacks D3.6 and D3.9); the inverse-limit identification is checked after the same pullback. Compact open subgroups are cofinal among open subgroups of these locally profinite groups.

The consuming constructions use this interface as follows. Layer 9 §9.4: Compares specialness under each period structure. Layer 11 §11.4: Works at finite level étale over the appropriate lattice target.

**Checks.**

- For G=G_m, b=1, mu=0 and L=Q_p-breve, the target Spd L is not perfectoid. For K=Z_p××I the level quotient is Z×Spd L, and its pullback to Spd C is the discrete union of copies of Spd C indexed by Z. This is separated étale, so D3.9 descends that property; D3.10 alone cannot be applied directly to Spd L.
- For a diagonal type (a1,…,an), the two flags have opposing cocharacter classes.
- Without basicness pi_LdR is not asserted to be a G_b(Q_p)-torsor onto a Hodge domain.
- For reductive minuscule data, BB identifies the lattice targets with the usual open flag period domains and gives the two familiar analytic towers.

**Acceptance.** The second torsor structure has a basicness hypothesis.

*Needs:* §9.1; §7.3; §2.4; §1.5; §5.6; ReductiveGroupsPartII RG2.0 / scheme-point-topology; ReductiveGroupsPartII RG2.0 / points-topological-group; ReductiveGroupsPartII RG2.0 / congruence-neighbourhood-basis; ReductiveGroupsPartII RG2.0 / smooth-morphism-open-map; DiamondsAndVStacks D3 / locally-profinite-torsors; DiamondsAndVStacks D3 / etale-and-quasi-pro-etale-morphisms-of-stacks; DiamondsAndVStacks D3 / v-local-nature-of-morphism-classes.

### 9.3 Functoriality at infinite level

For compatible (f:H→G,b_H,b_G,g) as in Layer 8, extend the pair and its étale frame along f and transport its isocrystal frame by g. This gives M_bH^H→M_bG^G, preserves the induced type, and commutes with both lattice period maps and their flag maps. For closed subgroup data use the resulting embedded images and their geometric connected components.

(HKII, arXiv v2, §8.4, p. 52; HKII line 2338).

The interface consists of the following operations and laws.

- The maps compose with the same sigma-conjugating product as in Layer 8.
- Both period squares commute, including their BB composites.
- Actions transport under f and the induced f_b on inner forms.
- Compatible closed subgroup data induce the subgroup moduli image used to define infinite-level special spaces.

Apply extension of structure group to the represented pair with both frames. Compare each frame change with the two commuting rational group actions. Check the maps on the modification description.

The consuming constructions use this interface as follows. Layer 9 §9.4: Embeds the subgroup moduli whose components are special.

**Checks.**

- Identity subgroup data give the identity moduli map.
- A torus source has zero-dimensional period domains but can retain nontrivial frame torsors.
- A change of isocrystal frame acts through the induced inner-form map, not through an unmodified copy of H(Q_p).

**Acceptance.** The isocrystal conjugation uses Q_p-breve-points; the étale frame uses Q_p-points.

*Needs:* §9.1; §9.2; §8.2.

### 9.4 Hodge and Hodge–Tate special subvarieties

For M=`M_{b,[mu]}`, compatible connected H≤G, a class [mu_H] inducing [mu], and an H-basic [b_H]∈B(H,[mu_H^-1]), take a geometric connected component of the image of `M^H_{b_H,[mu_H]}` in M_C. It is Hodge special if all Ad_H(mu_H)-weights are ≤1, and, when the ambient b is G-basic and b_H is H-basic, Hodge–Tate special if all are ≥−1. It is special if all lie in [−1,1]. Require the source data and embedding, rather than defining these adjectives by the conclusion of Ax–Lindemann.

(HKII, arXiv v2, Definition 8.4.1, pp. 52–53; HKII line 2353).

The interface consists of the following operations and laws.

- The upper bound ≤1 identifies the Hodge-special class.
- When the ambient b is G-basic (and with the H-basic subgroup datum), the lower bound ≥−1 identifies the Hodge–Tate-special class.
- Special subgroup data satisfy both bounds.
- The rational group actions and compatible subgroup conjugations transport these subvarieties.

Use the two subgroup period descriptions to identify their respective rigid special bases. Take geometric connected components of the full subgroup moduli image. Track which one-sided bound belongs to which period structure.

The consuming constructions use this interface as follows. Layer 9 §9.5: Tests whether both special notions are realized by one canonical subgroup. §11.5: Gives the algebraic description of the analytic closures.

**Checks.**

- Torus subgroup data satisfy all three notions.
- For any cubic extension E/Q_p and the mirabolic subgroup of Res_E/Qp GL_2, the type with jumps (1,1,−2) in Example 8.4.4 supplies a Hodge-special component that is not Hodge–Tate special. This also holds for a totally ramified cubic extension: the adjoint weights remain 0,1,−2 and the torus coinvariant is 1+1−2=0, matching b=1.
- The GL_4 minuscule example in HK II 1.1.4 admits non-reductive special subgroup data; specialness must not require H reductive.

**Acceptance.** The three classes can differ even for reductive ambient G.

*Needs:* §9.3; §8.4; §7.6.

### 9.5 Comparison of the three special notions

Assume b is basic. A closed connected subdiamond of M_C is special iff it is both Hodge special and Hodge–Tate special. Use the connected motivic/Mumford–Tate group of its restricted universal object to choose a common subgroup. If the ambient [mu] is minuscule, all three notions agree for every subgroup datum. Independently, for a reductive subgroup H the upper, lower and two-sided adjoint-weight conditions are equivalent, by symmetry of its root weights. In general a Hodge-special subvariety need not be Hodge–Tate special, as in the mirabolic example.

(HKII, arXiv v2, Lemma 8.4.2, Remark 8.4.3 and Example 8.4.4, p. 53; HKII line 2366, HKII line 2375, HKII line 2386).

One direction follows from the simultaneous bounds. For the converse reduce to the canonical group of the restricted object; its adjoint weights inherit both bounds from the two descriptions. For minuscule ambient type no symmetry is used: the inclusion Lie H→Lie G is equivariant for mu_H and its induced mu, so every Ad_H(mu_H)-weight is an Ad_G(mu)-weight and inherits the two-sided bound (HKII line 2378). For reductive H, symmetry of its root weights identifies the upper, lower and two-sided conditions.

**Checks.**

- For GL_2 with mu=diag(t,1), the weights on Lie GL_2 are −1,0,0,1. On the upper Borel they are 0,0,1: an asymmetric multiset, so symmetry cannot be invoked, yet it lies in [−1,1] as inheritance predicts.
- In the cubic mirabolic example of §9.4 the ambient weights include 2 and −2, so the ambient type is not minuscule, and the subgroup weights 0,1,−2 satisfy only the upper bound.

**Acceptance.** Connected components and basicness are explicit.

*Needs:* §9.4; §6.3; §2.4.

### 9.6 Basic duality

For G-basic b, inversion of the modification followed by the inner twist gives an isomorphism `M^G_{b,[mu]}`≅`M^{G_b}_{b^-1,[mu^-1]}`, after the compatible coefficient/reflex base change. It exchanges pi_Let with pi_LdR, G(Q_p) with G_b(Q_p), and Hodge special with Hodge–Tate special, while preserving special subvarieties. The inverse construction recovers the original frames and modification.

(HKII, arXiv v2, Theorem 8.5.1, p. 54; HKII line 2412).

Invert E_b⇢E_1 to obtain E_1⇢E_b. Apply F_b so its ends become E_b^-1 and E_1. Invert the comparison matrix and swap the two lattices; transport group actions through the twist. Negating all adjoint weights exchanges the two inequalities.

**Acceptance.** The comparison matrix is inverted; a transpose requires extra duality choices and is not the construction.

*Needs:* §1.6; §9.2; §9.4.

### 9.7 Geometric connectedness of Hodge domains

The nonempty Hodge domain X_[mu] of Layer 7 is geometrically connected. Under basic duality its period-base presentation is the b^-1-admissible locus of G_b for the inverse cocharacter; apply Layer 6 geometric connectedness to that locus. The proof uses only the non-reductive admissible connectedness, not connectedness of X as an input to duality.

(HKII, arXiv v2, Proposition 6.2.3, p. 37; Theorem 8.5.1, p. 54; HKII line 1681, HKII line 2412).

Descend basic duality along the rational-point torsor identified in Layer 9. Identify the resulting base with the inverse-type inner-form admissible locus. Apply Layer 6 after algebraically closed base change.

**Acceptance.** The dependency order prevents the forward reference in the source from becoming a formalization cycle.

*Needs:* §9.6; §6.8; §7.3.

### Examples

Let E/Q_p be cubic, G=Res_(E/Q_p) GL_2 and H=E×⋉E its mirabolic subgroup. After splitting over C take μ_H with multiplicative weights (1,1,−2); use b_H=b=1. On Lie H the weights are 0,1,−2. They satisfy the upper bound and violate the lower bound. The corresponding component is Hodge special and fails Hodge–Tate specialness. Its inverse type has the opposite behavior. (HK II Example 8.4.4, p. 53; HKII line 2386)

Conversely, in GL_4 of minuscule type diag(t,t,1,1), every compatible subgroup inherits adjoint weights in [−1,1]. A parabolic with Levi GL_2×GL_2, one jump in each block, can support nontrivial extensions of two height-two formal groups, so special subgroup data can be non-reductive. Minuscule ambient type suffices for agreement of all three notions. (HK II Example 1.1.4 and Remark 8.4.3, pp. 5–6, 53; HKII line 260)

For the basic slope-zero matrix b = [[1,1],[0,1]] and x = diag(2,1), both fixed by coefficient Frobenius, σ_b(x) = [[2,−1],[0,1]]. Both b^(−1)σ_b(x) and σ(x)b^(−1) equal [[2,−2],[0,1]]; conjugation in the inverse order gives [[2,1],[0,1]] instead. For G_m and b=p^n the inner twist is trivial and duality changes n to −n and μ to μ^(−1). For a noncommutative group the same inversion also changes σ to Int(b)∘σ. Interchanging only the lattice exponents would miss the second rational group and its torsor. (HK II Lemma 4.2.3 and Theorem 8.5.1, pp. 28–29, 54; HKII line 1312)

### Dependencies

- DiamondsAndVStacks D3 / locally-profinite-torsors.
- DiamondsAndVStacks D3 / etale-and-quasi-pro-etale-morphisms-of-stacks.
- DiamondsAndVStacks D3 / v-local-nature-of-morphism-classes.
- Layer 6.
- Layer 1.
- RelativeFarguesFontaine §7.2.
- RelativeFarguesFontaine §7.4.
- Layer 7.
- Layer 2.
- Layer 5.
- ReductiveGroupsPartII RG2.0 / scheme-point-topology.
- ReductiveGroupsPartII RG2.0 / points-topological-group.
- ReductiveGroupsPartII RG2.0 / congruence-neighbourhood-basis.
- ReductiveGroupsPartII RG2.0 / smooth-morphism-open-map.
- Layer 8.

## Layer 10: Hodge-generic points and exceptional loci

Define the exceptional and generic loci for the full family group, prove countable closedness, and combine weakly Shilov avoidance with Baire category and resolution to obtain dense generic classical points on irreducible rigid bases.

### 10.1 Hodge-exceptional and generic loci

For a b-rigidified neutral family on connected Y with full family group G, the exceptional locus is the union of Hdg(ell) over all lines in all algebraic representations that are not Hodge on all of Y; the generic locus is its complement. Meeting the generic locus forces a connected subfamily to have full group G. At a single point genericity is equivalent to equality of its group with the family group. The converse for an arbitrary subfamily is not asserted.

(HKII, arXiv v2, Definition 9.3.2 and Lemma 9.3.3, p. 59; HKII line 2645, HKII line 2652).

The interface consists of the following operations and laws.

- Generic points are exactly those outside every non-global Hodge line locus.
- At y, genericity iff MG_y equals the family group after the chosen fibre identification.
- A connected subfamily meeting the generic locus has full generic group.
- A change of b-rigidification transports the exceptional and generic subsets.

Use Chevalley lines to detect a proper connected subgroup. Separate lines Hodge everywhere from exceptional ones. For the forward direction restrict a non-global Hodge condition to the subfamily.

The consuming constructions use this interface as follows. Layer 10 §10.3: Identifies the set whose classical points must be dense. Layer 11 §11.4: Supplies a classical point with full open Galois image.

**Checks.**

- For a constant family the generic locus is all of Y relative to its actual pointwise group.
- Choose two CM points with distinct conjugate tori generating GL_2 and take their disconnected two-point subdiamond. Its joint tensor group is GL_2, although both points are exceptional for the ambient family.
- For a one-point subfamily, the full-group criterion is equivalent to genericity.

**Acceptance.** An arbitrary subfamily can have full group while lying in a union of distinct proper Hodge loci; the two-point disconnected example shows why the converse is false.

*Needs:* §8.1; §6.3; ReductiveGroups Layer 1; `TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer`.

### 10.2 Countable closedness of the exceptional locus

For a b-rigidified neutral G-family on a locally spatial base with full group G, its exceptional locus is a countable union of closed subsets. Over a fixed-type rigid base, individual proper Hodge line loci are proper rigid Zariski closed. The countably many closed pieces in the first assertion need not themselves be single Hodge loci.

(HKII, arXiv v2, Proposition 9.3.4, pp. 59–60; HKII line 2663).

Choose an increasing countable exhaustion V_i of the regular representation using its countable monomial spanning set and finite-subcomodule containment. The pinned exterior-line theorem places every closed subgroup stabilizer in some exterior power of some V_i; the pairs (i,n) form a countable set. Parameterize rank-one sub-isocrystals in finite-dimensional rational projective spaces. In each rational projective parameter space the non-global lines form an open subset. Its countable compact-open exhaustion gives profinite parameter sets in the chart universe. DiamondsAndVStacks D5.10 identifies the product topology and makes each parameter projection universally closed, so the closed incidence subdiamond has closed image. Take the countable union over all bounds and representations.

**Checks.**

- For the trivial group, no line has a proper Hodge locus: the exceptional set is empty, a countable union of empty closed sets.
- For G_m, Q_p[G_m]=Q_p[x,x^-1] is exhausted by the spans of x^j with −i≤j≤i. Exterior degree zero gives the unit line and its stabilizer is the whole group; higher exterior powers detect proper subgroups.
- For a two-dimensional rational parameter space, P^1(Q_p) is uncountable but compact and has a countable clopen basis. A finite two-point parameter set gives the union of two closed Hodge loci as its closed incidence image. Replacing the compact parameter by the discrete set N can give the nonclosed image {p^n:n≥1} in the closed disc, whose closure contains 0.

**Acceptance.** Countability of Q_p-points is not used: those point sets are uncountable.

*Needs:* §10.1; §8.1; §4.3; ReductiveGroups Layer 1; ReductiveGroupsPartII RG2.0 / scheme-point-topology; ReductiveGroupsPartII RG2.0 / points-topological-group; ReductiveGroupsPartII RG2.0 / congruence-neighbourhood-basis; ReductiveGroupsPartII RG2.0 / smooth-morphism-open-map; `TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer`; `TauCeti.Subcomodule.exists_finite_subcomodule_mem`; `TauCeti.Subcomodule.iUnion_finiteSubcomodules_eq_univ`; DiamondsAndVStacks D5 / profinite-products-of-locally-spatial-diamonds.

### 10.3 Dense Hodge-generic classical points

Assume the arbitrary-field full-rank de Rham criterion in the PadicHodgeTheory supplier contract. For a smooth connected rigid S over p-adic L⊇Q_p-breve and a b-rigidified neutral family with its actual full group, every weakly Shilov point is Hodge generic and generic classical points are dense. For any irreducible rigid Z/L with such a family, generic classical points are dense in |Z|. Geometric irreducibility is unnecessary for this latter lemma; pass to the finite constant field to fix type and take a connected resolution.

(HKII, arXiv v2, Lemmas 9.3.1 and 9.3.5, pp. 58, 60; Proposition 9.3.4, pp. 59–60; HKII line 2637, HKII line 2710, HKII line 2663; BhattHansen, Definitions 2.4–2.5 and Corollary 2.10, pp. 7–8; BhattHansen line 310, BhattHansen line 314, BhattHansen line 346).

Each proper Hodge locus is analytic and nowhere dense, hence avoids weakly Shilov points. On a classical field-valued disc apply Baire to the countable closed exceptional pieces. If a piece contained an open classical disc, closedness plus infinite residue would put its Gauss point in that piece, contradicting Shilov avoidance. Resolve irreducible Z, retain connectedness, and push the dense classical generic points down.

**Acceptance.** Only infinite residue is used by the Gauss-point step; L⊇Q_p-breve supplies it.

*Needs:* §10.2; §6.4; AdicSpacesPartV RZ.1 / irreducibility-criterion; AdicSpacesPartV RZ.1 / full-dimensional-closed-subset; AdicSpacesPartV RZ.3 / rigid-analytic-point; AdicSpacesPartV RZ.3 / classical-points-rigid-analytic-points; AdicSpacesPartV RZ.3 / gauss-point-in-closure; AdicSpacesPartV RZ.4 / weakly-shilov-point; AdicSpacesPartV RZ.4 / weakly-shilov-avoid-nowhere-dense; AdicSpacesPartV RZ.5 / resolution-consequences; `dense_iInter_of_isOpen`; `nonempty_interior_of_iUnion_of_closed`.

### Examples

Two distinct CM points can have conjugate torus groups whose generated group is GL_2. Their disconnected union has joint tensor group GL_2, although each point is exceptional relative to a full GL_2 family. This disproves the converse “full subfamily group implies meeting the generic locus” without making a claim about connected subfamilies. At a single point the equivalence with full group holds. (HK II Definition 9.3.2 and the forward direction of Lemma 9.3.3, p. 59; HKII line 2645)

The Baire argument uses countably many closed incidence images; the individual line loci can be uncountable. A weakly Shilov point avoids each proper analytic Hodge locus, hence every exceptional point is excluded there. If one closed incidence image contained an open disc of classical field-points, the infinite-residue Gauss-point criterion would force it to contain a weakly Shilov point, a contradiction. Then Baire gives generic classical points. Over a finite residue field of size q, the topological closure of the rational subset |x^q−x|≤|π| contains all integral field-points of the unit disc and misses its Gauss point: the rational neighborhood |π|≤|x^q−x|² of that Gauss point is disjoint from the subset. Thus the infinite-residue condition matters; here L contains Q_p-breve. (HK II Lemmas 9.3.1, 9.3.5, pp. 58, 60–61; HKII line 2710)

### Dependencies

- DiamondsAndVStacks D5 / profinite-products-of-locally-spatial-diamonds.
- `TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer`.
- `TauCeti.Subcomodule.exists_finite_subcomodule_mem`.
- `TauCeti.Subcomodule.iUnion_finiteSubcomodules_eq_univ`.
- Layer 8.
- Layer 6.
- ReductiveGroups Layer 1.
- Layer 4.
- ReductiveGroupsPartII RG2.0 / scheme-point-topology.
- ReductiveGroupsPartII RG2.0 / points-topological-group.
- ReductiveGroupsPartII RG2.0 / congruence-neighbourhood-basis.
- ReductiveGroupsPartII RG2.0 / smooth-morphism-open-map.
- AdicSpacesPartV RZ.1 / irreducibility-criterion.
- AdicSpacesPartV RZ.1 / full-dimensional-closed-subset.
- AdicSpacesPartV RZ.3 / rigid-analytic-point.
- AdicSpacesPartV RZ.3 / classical-points-rigid-analytic-points.
- AdicSpacesPartV RZ.3 / gauss-point-in-closure.
- AdicSpacesPartV RZ.4 / weakly-shilov-point.
- AdicSpacesPartV RZ.4 / weakly-shilov-avoid-nowhere-dense.
- AdicSpacesPartV RZ.5 / resolution-consequences.
- `dense_iInter_of_isOpen`.
- `nonempty_interior_of_iUnion_of_closed`.

## Layer 11: Bi-analytic Ax–Lindemann and period-image density

Define the two analytic closures through compact level quotients, prove special analytic closedness and the generic-point orbit/submersion argument, establish Theorem 9.1.3 and its minuscule Theorem A, and prove Theorem B without assuming basicness. Record the nonbasic Serre–Tate counterexample.

### 11.1 Analytic Zariski closures

Let G be connected linear, [b] a G-basic class in B(G,[mu^-1]), M=`M_{b,[mu]}`, L/Q_p-breve([mu]) p-adic, C=completed algebraic closure of L and I=Gal(Lbar/L). The action of a level subgroup K on scalars is through its projection to I, so C^K means the fixed field of that projection. For A⊂|M_C| define its Hodge analytic closure as the intersection of inverse images of all closed rigid analytic subdiamonds of M_C/K containing A, for compact open K≤G(Q_p)×I, defined over C^K. Use K≤G_b(Q_p)×I for the Hodge–Tate closure. An irreducible analytic set of either kind is a connected component of the preimage of an irreducible locally closed rigid analytic subdiamond at a level of that kind. A bi-analytic subdiamond is locally closed and irreducible analytic in both senses. An empty defining intersection equals all of |M_C|. The analytic closure of the empty subset is empty, because an empty closed rigid analytic container exists at every level.

(HKII, arXiv v2, Definition 9.1.1 and Remark 9.1.2, p. 55; HKII line 2458, HKII line 2470).

The interface consists of the following operations and laws.

- A is contained in each of its analytic closures.
- Its closure is contained in every qualifying level-pullback that contains A.
- If no qualifying closed rigid analytic subdiamond contains A, its analytic closure is the whole ambient space.
- Basic duality exchanges the two defining index systems and their closures.

Use the compact level presentations and keep the induced finite-extension field C^K. Define intersections of subsets/sub-v-sheaves using their universal property. Retain connected components in the irreducible analytic convention.

The consuming constructions use this interface as follows. Layer 11 §11.5: States exactly the opposite analytic closure of an irreducible analytic set. Layer 12 §12.5: Transports the two structures through local uniformization charts.

**Checks.**

- Take G=G_m, b=1 and mu=0, so M_C=Q_p× as a constant diamond over Spd C. At K_n=(1+p^n Z_p)×I, n≥2, the quotient is a discrete union of rigid points over L=C^K_n. The closure of {1} is {1}, since the pullbacks of its quotient points intersect in ∩_n(1+p^n Z_p)={1}.
- In the same tower, the closure of {1,p} is {1,p}: at each level use the union of the two closed rigid points whose pullbacks are (1+p^n Z_p)∪p(1+p^n Z_p). Their valuations 0 and 1 distinguish the two components.
- For m≥2, the closure of 1+p^m Z_p is that whole infinite compact open subset, already the pullback of one closed rigid point at level m. Both structures give these values, including at p=2; the level points are defined over L, whereas a C-point with transcendental coordinate in a positive-dimensional rigid chart would not be an L-rigid point.

**Acceptance.** For nonminuscule data these are defined intersections; no unproved finite-union closure topology is assumed.

*Needs:* §9.2; §4.1; ReductiveGroupsPartII RG2.0 / scheme-point-topology; ReductiveGroupsPartII RG2.0 / points-topological-group; ReductiveGroupsPartII RG2.0 / congruence-neighbourhood-basis; ReductiveGroupsPartII RG2.0 / smooth-morphism-open-map.

### 11.2 Analytic closedness of special subvarieties

Under the assumptions of §11.1, every Hodge-special subvariety is Hodge analytically Zariski closed and an irreducible Hodge analytic set. Every Hodge–Tate-special subvariety has the corresponding two Hodge–Tate properties. Thus a special subvariety is closed and irreducible analytic for both structures.

(HKII, arXiv v2, Theorem 9.1.3(1), p. 55; proof, pp. 56–57; HKII line 2484, HKII line 2508).

Realize a subgroup’s full locus by closed Hodge-line conditions at finite levels. Choose compact open level and component to recover the given connected special subvariety as an intersection of such pullbacks. Apply duality for the opposite structure.

**Acceptance.** Use the inner-form subgroup H_bH on the Hodge–Tate level side.

*Needs:* §11.1; §9.4; §8.4; §7.6; §9.6.

### 11.3 Connected-component formula for closure

For a connected lifted irreducible Hodge analytic set Ztilde, if the index family for its Hodge–Tate closure is nonempty, that closure equals the intersection of the connected components of level-pullbacks containing Ztilde. The rigid targets may be restricted to connected ones; after canonical motivic reduction H, use levels K′_b=(g H_bH(Q_p) g^-1×I)∩K_b, not H(Q_p) on this inner-form side.

(HKII, arXiv v2, Proof of Theorem 9.1.3, equation (9.2.0.1), pp. 56–57, with the inner-form level correction; HKII line 2541).

Use connectedness of Ztilde to select its component in each pullback. Refine levels and impose the Hodge–Tate line equations defining the canonical reduction. Intersect over the cofinal compatible component systems.

**Acceptance.** State the nonempty-index hypothesis separately from the empty-intersection case.

*Needs:* §11.1; §6.3; §11.2.

### 11.4 Generic-point period submersion

Assume the arbitrary-field full-rank de Rham criterion in the PadicHodgeTheory supplier contract. After replacing a connected rigid family by its canonical full motivic group, let a connected closed rigid target Y at an opposite analytic level contain the image of its lifted family. A Hodge-generic classical point yields an orbit K0·y⊂Y(C) for some compact open K0≤G(Q_p). After translating the lift and shrinking K0, choose a smooth locally closed stratum V⊂Y containing this orbit on which the flag-map differential has constant rank. That rank equals dim Fl_[mu]. Griffiths transversality then forces all Ad(mu)-weights ≥−1; BB for the inverse type is an isomorphism, and Y is the connected component of that finite-level ambient space containing y.

(HKII, arXiv v2, Proof of Theorem 9.1.3, pp. 57–58; HKII line 2574).

Pass to the strict completed maximal unramified extension of the residue field of the generic classical point and use an open inertia orbit contained in the original orbit. Descend through strata of strictly decreasing dimension until rank is constant on a stratum meeting that orbit openly. Constant rank produces a transverse vanishing coordinate if rank is deficient. Pull it back along the G(C)-orbit map, which is submersive by gap:adjoint-kernel-and-orbit-differential; its vanishing on K0 contradicts the identity theorem across Q_p. Surjectivity and Griffiths transversality give the adjoint bound, then the full-dimensional closed-subspace criterion gives the component equality.

**Acceptance.** This proves submersion at the translated lift in the selected smooth stratum; it does not claim smoothness at every original point.

*Needs:* §10.3; §3.3; §6.3; §11.3; §5.5; §5.6; AdicSpacesPartV RZ.0 / proper-image-zariski-closed; AdicSpacesPartV RZ.0 / local-dimension; AdicSpacesPartV RZ.2 / singular-stratification; AdicSpacesPartV RZ.2 / rank-loci; AdicSpacesPartV RZ.6 / manifold-of-classical-points; AdicSpacesPartV RZ.6 / constant-rank-theorem; AdicSpacesPartV RZ.6 / smooth-morphism-submersion; AdicSpacesPartV RZ.6 / subfield-identity-theorem; ReductiveGroups Layer 2; AdicSpacesPartV RZ.1 / irreducibility-criterion; AdicSpacesPartV RZ.1 / full-dimensional-closed-subset.

### 11.5 Bi-analytic Ax–Lindemann theorem

Assume the arbitrary-field full-rank de Rham criterion in the PadicHodgeTheory supplier contract. Let G/Q_p be connected linear, [mu] a cocharacter class admitting a G-basic [b]∈B(G,[mu^-1]), choose b and let M=`M_{b,[mu]}`. Let L/Q_p-breve([mu]) be p-adic and C=completed algebraic closure of L. Hodge (respectively Hodge–Tate) special subvarieties are closed irreducible analytic sets in their respective structures. The Hodge–Tate analytic closure of an irreducible Hodge analytic set is a Hodge–Tate-special subvariety whenever its defining family of containing closed rigid analytic subdiamonds is nonempty; if that family is empty the closure is all M_C. Interchanging Hodge and Hodge–Tate gives the second assertion. Consequently the closed bi-analytic subdiamonds, with the irreducibility convention in §11.1, are exactly the special subvarieties.

(HKII, arXiv v2, Theorem 9.1.3, p. 55; proof, pp. 56–58; HKII line 2481).

Reduce the lifted analytic set to its connected canonical motivic group H and its fixed type. In the nonempty-index case apply the submersion argument to every containing connected rigid level target. Each target contains the same component of M^H, whose lower adjoint bound now makes it Hodge–Tate special. Its special analytic closedness identifies the intersection with that component. Use basic duality for the reversed statement and both bounds for the bi-analytic consequence.

**Checks.**

- In the cubic mirabolic example of §9.4, the inverse type has weights 0,−1,2. Its component is Hodge–Tate special but is not special, since 2>1. It is closed Hodge–Tate analytic, so its Hodge–Tate closure is itself. Thus closure in that structure does not impose the upper bound.
- For GL_2 of type (1,0), the adjoint weights are −1,0,1 and the opposite-special closure is special.
- If there is no containing rigid target at any opposite level, the intersection is M_C, including every component when M_C is disconnected.

**Acceptance.** The empty-index clause and the basicness hypothesis are part of the theorem.

*Needs:* §11.2; §11.3; §11.4; §9.6; §9.5.

### 11.6 Minuscule Ax–Lindemann theorem

Assume the arbitrary-field full-rank de Rham criterion in the PadicHodgeTheory supplier contract. For connected linear G/Q_p and [mu] whose adjoint weights all lie in [−1,1], basic [b]∈B(G,[mu^-1]), L as above and C its completed algebraic closure, the opposite analytic closure of any irreducible Hodge or Hodge–Tate analytic set is special. The two analytic closures are the inverse-limit Zariski closures in the corresponding rigid towers. For an algebraic Z′⊂Fl_[mu],L([mu]) defined over L([mu]), an irreducible component Z of Z′_C∩X_[mu], and a connected component Ztilde of pi_HT^-1(Z), its image’s rigid Zariski closure in a Hodge finite level is a finite-level special subvariety. The zero-dimensional case agrees with the two-lattice CM criterion.

(HKII, arXiv v2, Theorem A, Example 1.1.5 and Remark 1.1.6, p. 6; Definition 1.1.2, p. 5; HKII line 268, HKII line 272, HKII line 279, HKII line 222).

Use BB isomorphisms on both sides of minuscule data. Finite-level spaces are rigid, so the empty-index exception is absent. Identify the two topology-based closures with Layer 11’s intersections and apply the theorem. Pull back an algebraic flag condition to obtain the stated corollary.

**Checks.**

- With reflex field E and c∈L([mu]) outside E, the point [1:c] in a projective-line flag is the zero set of X1−c X0 over L([mu]); it has no E-model as that embedded point. The algebraic-input assertion allows it whenever its intersection with the domain is nonempty.
- The GL_4 type diag(t,t,1,1) has adjoint weights −1,0,1, including on its parabolic subgroup with Levi GL_2×GL_2. Specialness therefore does not force the subgroup to be reductive.
- For a torus flag, dimension zero and both adjoint bounds are vacuous; the closure assertion agrees with the two-lattice CM criterion.

**Acceptance.** Special subgroup data may be non-reductive. For non-reductive ambient G the minuscule convention is the stated two-sided adjoint-weight bound.

*Needs:* §11.5; §9.2; §3.4; §9.5.

### 11.7 Hodge–Tate period-image density

Assume the arbitrary-field full-rank de Rham criterion in the PadicHodgeTheory supplier contract. Let Z be a geometrically irreducible rigid analytic variety over a strict p-adic L and A=(W,L_et) a neutral admissible pair on Z^diamond. Its generic motivic Galois group G is connected and its G-structure is good of a single lattice type [mu] defined over L. Put C=completed algebraic closure of L. For a geometric connected component Ztilde of the associated G(Q_p)-torsor on Z_C^diamond, the image pi_HT(Ztilde) is rigid Zariski dense in every connected open of Fl_[mu],L([mu])^diamond that it meets. Basicness is not required.

(HKII, arXiv v2, Theorem B, p. 11; proof, p. 58; HKII line 501, HKII line 2632).

Obtain the group and type by canonical reduction and the rigid-base theorem. Choose a Hodge-generic classical point. Apply the same orbit/constant-rank argument, using gap:adjoint-kernel-and-orbit-differential, directly to a closed rigid analytic condition in the flag target, without using duality. Propagate the resulting open flag image within each connected open by the rigid identity theorem.

**Acceptance.** This proof shares the orbit argument, not the basicness-dependent infinite-level duality.

*Needs:* §6.3; §6.4; §10.3; §3.3; §5.5; AdicSpacesPartV RZ.2 / singular-stratification; AdicSpacesPartV RZ.2 / rank-loci; AdicSpacesPartV RZ.6 / manifold-of-classical-points; AdicSpacesPartV RZ.6 / constant-rank-theorem; AdicSpacesPartV RZ.6 / smooth-morphism-submersion; AdicSpacesPartV RZ.6 / subfield-identity-theorem.

### 11.8 Nonbasic Serre–Tate boundary

For the upper triangular Borel of GL_2 use b=diag(1,p) and mu(z)=diag(1,z^-1), in the Tate-twisted ordinary extension normalization. Its admissible Hodge cell is A¹ with lattices ⟨e1,xi^-1(e2+x e1)⟩, and its Hodge–Tate flag variety is a point. The Serre–Tate deformation chart lies in this ordinary family. Its canonical torus lift is proper although their Hodge–Tate flag images agree, so a condition on that flag cannot isolate the lift. Thus the basic hypothesis cannot be omitted from the closedness assertion by extending Hodge–Tate closed conditions solely through that flag.

(HKII, arXiv v2, Remark 9.1.4, p. 56; HKII line 2499). The diagonals at HKII line 2503 are reversed for the stated upper-triangular convention; the data above agree with the A¹ computation in §8.6.

Compute the slope filtration and the fixed Hodge–Tate flag in this ordinary extension family. Identify the torus lift as a proper special subvariety and compare its image with the whole family’s identical flag.

**Checks.**

- On E12, Ad(mu) has weight +1. Thus Fl_[mu^-1]=B/T=A¹ while Fl_[mu] is a point; the Newton root slope is −1, so b is not B-basic.
- The lattices at x=0 and x=1 differ: xi^-1 e2 belongs to the first and not the second. Their Hodge flags are [0:1] and [1:1], whereas both Hodge–Tate flags are the unique point. The x=0 lattice is the diagonal-torus lift.
- For b=diag(p,1) and mu(z)=diag(z^-1,1), the upper-root weight is −1 and the good B-Hodge cell is a point, as in §8.6. These opposite data cannot describe the positive-dimensional ordinary deformation chart.

**Acceptance.** The ordinary datum has the A¹ Hodge direction and the constant Hodge–Tate flag.

*Needs:* §9.4; §9.2; §11.5.

### Examples

If the family of opposite-level closed rigid targets containing A is empty, its intersection is all M_C. Even if M_C is disconnected, this is the defined closure; no connected special component is selected in that case. If the family is nonempty, the orbit argument after canonical motivic reduction supplies a single opposite-special component contained in every such target. Since that component is itself opposite analytically closed, it is exactly the intersection. Enlarging A shrinks the family of qualifying containers, so it enlarges the intersection. (HK II Definition 9.1.1, Remark 9.1.2 and Theorem 9.1.3, p. 55; HKII line 2458)

For an irreducible rigid source choose a generic classical point after resolution and passage to its constant field. If its field F is not strict, replace it by the completion F′ of its maximal unramified extension. Restriction to inertia yields an open subgroup in the same motivic group; its orbit is contained in the original orbit. A translate of the lift meets a smooth maximal-rank stratum, after shrinking the compact group. Rank deficiency would produce a transverse coordinate vanishing on that open rational group orbit; pullback along the submersive group orbit map (gap:adjoint-kernel-and-orbit-differential) contradicts the identity theorem. Griffiths transversality then gives the lower adjoint bound and the full-dimensional closed-subspace criterion gives the desired component. (HK II proof of Theorem 9.1.3, pp. 57–58, using HK I Corollary 5.5.3; HKI line 2167, HKII line 2574)

For the upper Borel with b=diag(1,p) and mu=(0,−1), the nonbasic ordinary Serre–Tate family has Hodge cell A¹ and Hodge–Tate period image a point. Its canonical torus lift is proper, but its flag image is identical to that of the whole family. A condition on that image cannot cut out the lift. This witnesses the basicness hypothesis in Ax–Lindemann. Theorem B retains its geometrically irreducible rigid-base and actual generic-group hypotheses, and works directly in the flag target without duality. This does not assert that the entire nonbasic infinite-level Serre–Tate space satisfies those hypotheses. (HK II Remark 9.1.4, p. 56, and proof of Theorem B, p. 58; HKII line 2499)

### Dependencies

- Layer 9.
- Layer 4.
- ReductiveGroupsPartII RG2.0 / scheme-point-topology.
- ReductiveGroupsPartII RG2.0 / points-topological-group.
- ReductiveGroupsPartII RG2.0 / congruence-neighbourhood-basis.
- ReductiveGroupsPartII RG2.0 / smooth-morphism-open-map.
- Layer 8.
- Layer 7.
- Layer 6.
- Layer 10.
- Layer 3.
- Layer 5.
- AdicSpacesPartV RZ.0 / proper-image-zariski-closed.
- AdicSpacesPartV RZ.0 / local-dimension.
- AdicSpacesPartV RZ.2 / singular-stratification.
- AdicSpacesPartV RZ.2 / rank-loci.
- AdicSpacesPartV RZ.6 / manifold-of-classical-points.
- AdicSpacesPartV RZ.6 / constant-rank-theorem.
- AdicSpacesPartV RZ.6 / smooth-morphism-submersion.
- AdicSpacesPartV RZ.6 / subfield-identity-theorem.
- ReductiveGroups Layer 2.
- AdicSpacesPartV RZ.1 / irreducibility-criterion.
- AdicSpacesPartV RZ.1 / full-dimensional-closed-subset.

## Layer 12: Variations and Shimura applications

Define variations and de Rham torsors, construct the crystalline-frame cover and its period map, compute the Katz–Igusa obstruction to rigid refinement, and transport the theorem to basic Hodge-type loci under a precise uniformization hypothesis and to products of Shimura curves.

### 12.1 Variations of p-adic Hodge structure

For smooth rigid S/L, a variation of p-adic Hodge structure is a finite Q-graded de Rham Q_p-local system L=⊕L_lambda for which each fibre (L_lambda,M0,lambda) is a weight-lambda p-adic Hodge structure. Here M0 is the lattice from the trivial filtration on the associated flat bundle, while the original local system determines the étale rational structure. A G-variation is an exact tensor functor Rep_Qp G into this category. A pro-étale K-torsor for open K≤G(Q_p) is de Rham if its associated representation local systems are de Rham, equivalently for one closed faithful representation.

(HKII, arXiv v2, Definition 10.1.1 and §10.1, pp. 62–63; HKII line 2839).

The interface consists of the following operations and laws.

- The second lattice is M0 of the underlying flat bundle with trivial filtration.
- Pullback preserves the graded de Rham system and its weight conditions.
- Tensor G-variations are independent of a chosen closed faithful representation for the de Rham test.
- Each geometric fibre gives the pointwise HS object with the stated weight.

Use the de Rham comparison functor representationwise. Form M0 after forgetting the Hodge filtration of the flat bundle. Impose the pure bundle condition on each graded fibre.

The consuming constructions use this interface as follows. Layer 12 §12.2: Constructs the basic de Rham bundle whose frame torsor trivializes the isocrystal side.

**Checks.**

- The trivial de Rham local system in weight zero is a variation.
- The Tate local system has weight −2n with its de Rham comparison lattice.
- A nontrivial quadratic finite étale rank-one character has de Rham weight zero and monodromy image {1,−1}, whereas the neutral unit has image {1}. Equal geometric unit fibres do not identify these two families. Other finite orders are allowed: at p=7, a primitive cube root ζ₃ lies in Q₇, and the unramified character sending arithmetic Frobenius to ζ₃ has weight zero and image μ₃ of order 3. Finite étale pullback trivializes each finite character, giving its weight-zero de Rham filtration.

**Acceptance.** The Q_p-local system is allowed to have monodromy here; this is a distinct family notion from the neutral category.

*Needs:* §4.6; §2.1; §4.2; PadicHodgeTheory §7.1; PadicHodgeTheory §7.1, lattice-position uniqueness; PadicHodgeTheory §7.4.

### 12.2 Crystalline-frame cover and period map

Let Stilde→S be a de Rham K-torsor for open K≤G(Q_p). Modify its slope-zero G-bundle by M0 to obtain E_dR. Assume E_dR lies in a fixed basic stratum [b]. Pull back the universal G_b(Q_p)-torsor on that stratum to obtain Stilde^cris→S. Its tautological frame gives a neutralized good b-admissible pair; its étale-frame K-reduction defines a map Stilde^cris→`M_{b,[mu]}`/K as in (10.1.1.1). The field/type is taken on each fixed-type component.

(HKII, arXiv v2, §10.1 and equation (10.1.1.1), p. 63; HKII line 2860, HKII line 2869).

The interface consists of the following operations and laws.

- Stilde^cris is the pullback of [*/G_b(Q_p)]’s universal torsor along E_dR.
- The tautological frame supplies the neutral good b-pair.
- The map to M_b,mu/K pulls the universal pair and étale K-reduction back to the original data.
- Changing K compatibly gives the transition maps between period targets.

Modify with the trivial-filtration lattice and classify the resulting basic bundle. Pull back the tensor-Isom frame torsor. Use its frame to identify the fixed isocrystal and the original K-torsor to lift the lattice period map to the K-level quotient.

The consuming constructions use this interface as follows. Layer 12 §12.4: Uniformization supplies a discrete reduction of this frame cover in the basic Shimura case.

**Checks.**

- For a globally framed constant basic de Rham bundle the frame cover is its trivial G_b(Q_p)-torsor.
- In the ordinary rank-one Katz–Igusa case the integral frame reduction has fibre Z_p× and infinite Z_p× monodromy; the full rational frame cover has fibre Q_p×, with valuation components indexed by Z.
- If E_dR is not basic, the constant G_b(Q_p)-frame-torsor construction does not apply unchanged.

**Acceptance.** The frame cover is a pro-étale torsor; this construction makes no general rigid representability assertion.

*Needs:* §12.1; §1.5; §9.2; §4.5; HodgeTateAndCanonicalSubgroups §5.1; AlgebraicModularFormsAndSerreWeights R15.3 / target-igusa-interpretation-of-hasse-and-theta; IgusaVarietiesAndTorsionConcentration Layer IG.1 (gap:ordinary-katz-igusa-monodromy).

### 12.3 Katz–Igusa obstruction

On the ordinary locus of a connected finite-level modular curve without p-level, the Katz–Igusa Z_p×-tower trivializing the chosen integral unit-root datum is the integral frame reduction of the rational crystalline-frame torsor for the associated rank-one de Rham system. If I denotes this tower, the full cover is I ×_(Z_p×) Q_p×, with rational frame valuation components indexed by Z. Its surjective infinite Z_p× monodromy prevents refinement by a rigid analytic de Jong cover of the asserted kind; its inverse-limit adic realization is not locally of finite type over the base field: its geometric frame fibre Z_p× is infinite profinite and nondiscrete, whereas a zero-dimensional rigid fibre locally of finite type is discrete.

(HKII, arXiv v2, §10.1, p. 64; HKII line 2882).

Import the ordinary elliptic formal tower and generic fibre from HodgeTateAndCanonicalSubgroups §5.1, and full finite-level unit monodromy from AlgebraicModularFormsAndSerreWeights R15.3, The Igusa interpretation. Compactness gives surjective Z_p× monodromy. Use the comparison requested from IgusaVarietiesAndTorsionConcentration (gap:ordinary-katz-igusa-monodromy) to identify its integral frames with the unit-root crystalline trivialization in the matching covariant or dual Tate normalization; extension of structure group then gives the full rational cover. A reduction to a rigid de Jong covering forces the corresponding compact fibre monodromy to have finite orbits, contradicting the infinite transitive Z_p× action. The obstruction is local finite type, not merely failure of quasicompactness.

**Checks.**

- For F=Q and m≥1, the finite-level fibres are (Z/p^m)× of size p^(m−1)·(p−1); at p=2 and m=1,2,3 the degrees are 1,2,4. At level zero, reduction modulo 1 has the trivial unit group of order 1 and lies outside this positive-level formula. The degree-one first level does not make the inverse tower finite.
- At p=2 the element −1 is 1 modulo 2 and 3 modulo 4; full monodromy includes this order-two element, as well as the deeper principal units. Replacing Z_2× by 1+4Z_2 would lose it.
- Extending integral frames from Z_p× to Q_p× yields components indexed by v_p in Z. Each component retains the infinite profinite frame fibre; at p=2 the finite-level degrees above grow without bound, whereas a zero-dimensional rigid fibre locally of finite type is discrete.

**Acceptance.** The infinite monodromy obstructs the stated rigid de Jong refinement; rational extension of frames preserves that obstruction in each valuation component.

*Needs:* §12.2; HodgeTateAndCanonicalSubgroups §5.1; AlgebraicModularFormsAndSerreWeights R15.3 / target-igusa-interpretation-of-hasse-and-theta; IgusaVarietiesAndTorsionConcentration Layer IG.1 (gap:ordinary-katz-igusa-monodromy).

### 12.4 Conditional basic Hodge-type application

Assume the arbitrary-field full-rank de Rham criterion in the PadicHodgeTheory supplier contract. For a Hodge-type Shimura datum, neat prime-to-p level, and basic locus S after completion at p and then the maximal unramified base, assume the precise basic uniformization with its period-map compatibility: each relevant component is a diagonal arithmetic quotient of `M_{b,[mu]}`/K_p by a discrete subgroup Gamma≤G_b(Q_p). Then S is étale-locally uniformized by the finite-level local space, after base change to C its infinite-level torsor has the same local Hodge–Tate period diagram, and the minuscule bi-analytic Ax–Lindemann theorem transports through these charts.

(HKII, arXiv v2, §10.1, pp. 64–65 and footnote 7, p. 64; HKII line 2892, HKII line 2920).

Import the basic uniformization contract, including the discrete diagonal quotient. HKII footnote 7 attributes the underlying uniformization input to Daniels–van Hoften–Kim–Zhang (HKII line 2920, with the authors identified at HKII line 3010); their result is used through the supplier contract, not as a separate source here. Identify both period diagrams and the discrete reduction of the frame cover. Apply Layer 11 on the charts and descend the resulting special-image description.

**Acceptance.** The application is conditional on the named uniformization input; a product with Gamma is not its quotient.

*Needs:* §12.2; §11.6; PerfectoidShimuraVarieties §2.2; PerfectoidShimuraVarieties §§3.1 and 3.5.

### 12.5 Products of Shimura curves

Assume the arbitrary-field full-rank de Rham criterion in the PadicHodgeTheory supplier contract. Let D/Q be a quaternion algebra split at infinity and ramified at p, with neat level away from p and maximal local level; let B be the quaternion algebra over Q ramified at infinity, split at p, and ramified at exactly the same finite places as D away from p. For a product of n associated curves over Q_p-breve, each chosen component has a Čerednik–Drinfeld presentation Omega^n/Gamma, with Gamma the product of the arithmetic component stabilizers. After base change to C, at infinite level the local product M of Drinfeld spaces and the global perfectoid tower have compatible Hodge–Tate maps and differ by the corresponding arithmetic quotient. Locally in the analytic topology this is the local period diagram. Thus the opposite analytic closure of a lifted irreducible analytic set is the transported image of the appropriate local special subvariety.

(HKII, arXiv v2, §10.2, pp. 64–66, diagram p. 65; HKII line 2916, HKII line 2931, HKII line 2934).

Apply the supplied Čerednik–Drinfeld theorem separately to each factor, tracking determinant components and their stabilizers. Form the product diagram and the compatible perfectoid inverse levels. Proper discontinuity makes the finite-level uniformization analytic-locally an isomorphism. Transport Layer 11 through that diagram; the comparison with Chambert-Loir–Loeser in HKII §10.2 concerns a different pair of algebraic structures (HKII line 2919, with the authors identified at HKII line 3003). This is comparison context, not an input to this implication.

**Checks.**

- If Ram(D)={p,ell} with ell≠p prime, then Ram(B)={infinity,ell}. At p and infinity the invariants change from (1/2,0) to (0,1/2); at ell both are 1/2.
- A quaternion algebra with ramification {infinity,ell,q,r}, for distinct additional primes q,r, also is definite and split at p but fails the required invariants at q and r. It is excluded from this uniformization.
- For n=0,1,2 factors the local dimensions are 0,1,2. For n=2 and Gamma=Gamma1×Gamma2, the quotient is (Omega/Gamma1)×(Omega/Gamma2), retaining both component stabilizers.

**Acceptance.** The local invariants determine B at every place; retain the arithmetic quotient at every level.

*Needs:* §12.4; §11.6; EndoscopicTransferAndUnitaryTraceComparison §12.11; EndoscopicTransferAndUnitaryTraceComparison §12.5; HilbertModularVarietiesAndShimuraCurves §R18.5.7; HilbertModularVarietiesAndShimuraCurves §R18.5.15; HilbertModularVarietiesAndShimuraCurves §R18.5.21; HilbertModularVarietiesAndShimuraCurves §R18.5.20; PerfectoidShimuraVarieties §2.2; PerfectoidShimuraVarieties §§3.1 and 3.5.

### Examples

For a variation the original graded de Rham local system can have nontrivial étale monodromy. M0 is formed from its associated flat bundle after forgetting the filtration. If the resulting bundle has fixed basic class b, its crystalline-frame cover is a G_b(Q_p)-torsor, and the original K-frame data gives the K-level period map. This is a frame construction; it makes no general potential-unramifiedness assertion. Using the ordinary tower from HodgeTateAndCanonicalSubgroups §5.1, the full unit monodromy from AlgebraicModularFormsAndSerreWeights R15.3, The Igusa interpretation, and their crystalline-frame comparison requested from IgusaVarietiesAndTorsionConcentration (gap:ordinary-katz-igusa-monodromy), the tower on the ordinary modular locus has infinite Z_p× monodromy and gives the obstruction to a rigid analytic de Jong refinement described in HK II §10.1, pp. 63–64.

For a quaternion algebra D/Q split at infinity and ramified at p, its inner form B is ramified at infinity, split at p, and ramified at exactly the same finite places as D away from p. A chosen product component of the associated Shimura curves has a Čerednik–Drinfeld presentation Ω^n/Γ with the actual arithmetic component stabilizers. After base change to C, the local Drinfeld product, its two period maps and the global infinite tower are compared through this quotient. In a general Hodge-type basic locus the analogous step is conditional on the explicit basic uniformization contract, including the diagonal arithmetic quotient. Local special points concern the Q_p-structure of the p-divisible group and need not be global motivic CM points. (HK II §10.1–§10.2, pp. 64–66; HKII line 2892)

### Dependencies

- Layer 4.
- Layer 2.
- PadicHodgeTheory §7.1.
- PadicHodgeTheory §7.1, lattice-position uniqueness.
- PadicHodgeTheory §7.4.
- Layer 1.
- Layer 9.
- Layer 6.
- HodgeTateAndCanonicalSubgroups §5.1.
- AlgebraicModularFormsAndSerreWeights R15.3 / target-igusa-interpretation-of-hasse-and-theta.
- IgusaVarietiesAndTorsionConcentration Layer IG.1 (gap:ordinary-katz-igusa-monodromy).
- Layer 11.
- PerfectoidShimuraVarieties §2.2.
- PerfectoidShimuraVarieties §§3.1 and 3.5.
- EndoscopicTransferAndUnitaryTraceComparison §12.11.
- EndoscopicTransferAndUnitaryTraceComparison §12.5.
- HilbertModularVarietiesAndShimuraCurves §R18.5.7.
- HilbertModularVarietiesAndShimuraCurves §R18.5.15.
- HilbertModularVarietiesAndShimuraCurves §R18.5.21.
- HilbertModularVarietiesAndShimuraCurves §R18.5.20.

## Downstream consumers

The period-moduli interface supplies non-reductive refinements for local-shtuka and Shimura applications. The BKF comparison consumes the AInfCohomology contract; it supplies no reverse foundational dependency to that owner. The CM criterion and Ax–Lindemann use the same two rational lattice structures. Arithmetic applications transport the local theorem only after the uniformization and period-compatibility hypotheses in Layer 12 are supplied. No earlier supplier depends on a result of this roadmap.

## References

- HKI: Sean Howe and Christian Klevdal, [Admissible pairs and p-adic Hodge structures I: Transcendence of the de Rham lattice](https://arxiv.org/pdf/2308.11065v2), arXiv v2 (2025). All HKI locators use this version; Theorem B is at HKI line 204 and Theorem 5.1.6 at HKI line 1925.
- HKII: Sean Howe and Christian Klevdal, [Admissible pairs and p-adic Hodge structures II: The bi-analytic Ax–Lindemann theorem](https://arxiv.org/pdf/2308.11064v2), arXiv v2 (2025). All HKII locators use this version; Theorem A is at HKII line 268, Theorem B at HKII line 501 and Theorem 9.1.3 at HKII line 2481. The published paper, DOI 10.1007/s00222-025-01400-6, has different numbering.
- Scholze: Peter Scholze, [p-adic Hodge theory for rigid-analytic varieties](https://arxiv.org/pdf/1205.3463v2), arXiv v2 (2012), Theorem 7.6 and proof, pp. 42–45 (Scholze line 1936).
- LiuZhu: Ruochuan Liu and Xinwen Zhu, [Rigidity and a Riemann–Hilbert correspondence for p-adic local systems](https://arxiv.org/pdf/1602.06282v3), arXiv v3 (2016), Theorems 1.3 and 3.9, pp. 2–3, 24–28 (LiuZhu line 89 and LiuZhu line 1154). Its finite-extension-of-Q_p base is retained (LiuZhu line 86).
- BhattHansen: Bhargav Bhatt and David Hansen, [The six functors for Zariski-constructible sheaves in rigid geometry](https://arxiv.org/pdf/2101.09759v2), arXiv v2 (2021), Definitions 2.4–2.5 and Corollary 2.10, pp. 7–8. Weakly Shilov points use Definition 2.5 (BhattHansen line 314); avoidance of a nowhere dense closed set is Corollary 2.10 (BhattHansen line 346).
