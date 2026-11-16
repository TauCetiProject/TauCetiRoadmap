# Roadmap: p-adic local Langlands for GL₂(ℚ_p), Part II: geometric realisation in the Drinfeld tower

**Summary.** PadicLocalLanglandsForGL2Qp builds the p-adic local Langlands correspondence for G = GL₂(ℚ_p). Its §6.9 identifies the analytic quotient Π^an/π with the strong dual of functions on a Drinfeld cover. It does this for a supercuspidal π with trivial central character, conditionally on a global nonzero map and global de Rham data. This Part II starts from that comparison and the correspondence. It discharges the global hypotheses and extends the comparison to every supercuspidal type on which p acts trivially. It refines the comparison by the P-finite Kirillov model, the embedded common dual and the homographic covariance of the coordinate operator. It then extracts the Galois and Banach multiplicities of the geometric p-adic étale cohomology of the Drinfeld tower, and factors the arithmetic completed cohomology at a fixed level over blocks and full Weil–Deligne type rings. The end theorems are:

- the Galois-socle theorem: for a supercuspidal type M of level at most n with p acting trivially on JL(M) (M ∈ ΦNᵖ_n of Conventions), the multiplicity of V_(M,ℒ) in H¹_ét(M^p_(n,C), L(1)) is Π(V_(M,ℒ))*⊗JL(M), with Π(V_(M,ℒ))* the Banach dual in the topology of compact convergence, and every absolutely irreducible V of dimension at least three has zero multiplicity (Dospinescu–Le Bras, Colmez–Dospinescu–Nizioł);
- the factorisation of the arithmetic completed cohomology H¹_ét(M^p_(n,ℚ̄_p), L(1)) for p > 3;
- the weighted realisation with its BGG row (§7.2) and its first-cover form on Teitelbaum's semistable model (§7.3), the description of the diag(p,1)-invariant functions on a Drinfeld cover by Iwasawa classes with exponential specialisations (§7.4), the infinitely primitivable functions (§7.5) and the filtered derived realisation of D_dR(V) (§7.6).

## Scope and ownership

This roadmap owns the following:

- the type and level bookkeeping of the p-central Drinfeld tower and the normalisation dictionary among the three sources;
- the P-finite Kirillov model with its infinitesimal action and duality, and the density of the compactly supported P-finite vectors in Π(V)^an for non-trianguline V at every prime;
- the embedded common dual E_π, the homographic covariance of the coordinate operator, the topological irreducibility of Π(π,0) and Colmez's weight change;
- the local analyticity of the strong duals of the functions, differentials and de Rham cohomology of the p-central tower, the smoothness of its compactly supported de Rham cohomology, the discharge of the global hypotheses of the base comparison, and the line-independent Kirillov embedding;
- the realisation for every supercuspidal type in the p-central sector, with the agreement of its de Rham identification with the Hyodo–Kato one at every level;
- the fixed-level reading of the multiplicity diagram of the tower, and the Galois and Banach multiplicity theorems of Layer 4;
- the arithmetic block decomposition and the interpolated factorisation;
- the consequences in Layer 7.

**PadicLocalLanglandsForGL2Qp** is the base roadmap. Its §§3.1–3.11 supply the correspondence V ↦ Π(V), the Montreal functor, D⊠ℙ¹ and the analytic vectors Π(V)^an. Its §4.1k supplies the P-algebraic Kirillov model of fixed weight and its §4.2a the line-independent G-action on N_rig⊠ℙ¹. Its §4.8 supplies the analytic Steinberg representation St^an, which §4.2 compares with the half-plane. Its §4.11 supplies the analytic quotient Π(V)^an/π, independent of the filtration. Its §§5.1–5.6, 5.8 and 5.12 supply blocks, projective envelopes, pseudodeformation rings, the universal family for absolutely irreducible residual representations and the full Weil–Deligne type rings R_(B,M) with the B-adic completion LL_B(M). Its §6.7 supplies Paškūnas–Tung finiteness. Its §6.9 supplies the Breuil–Strauch comparison in the following named pieces:

- the local Jacquet–Langlands correspondence JL in its division-algebra form, the multiplicity spaces X^ρ, and the unique continuous O(Ω)-module structure on Π(π,0)′_b with its coordinate operator ∂;
- the O(Ω)-linearity of every continuous G-map into O(Σ_n)^ρ, the surjectivity of the comparison map, the scalar-endomorphism theorem and the injectivity of the comparison map, the last through the weight-two model Π(π,2) and its two-copy smooth kernel;
- the function-dual comparison (O(Σ_n)^ρ)′_b ≅ Π^an/π, the de Rham comparison H¹_dR(Σ_n)^ρ ≅ M*_dR⊗π′_b and its filtration-preimage statement, under the hypothesis of a nonzero continuous G-map (Π^an/Π^lisse)′_b → O(Σ_n)^ρ and the global de Rham data (uniformisation and automorphic realisation) that §6.9 takes as explicit hypotheses.

Part II begins where §6.9 stops. It does not construct a second correspondence, a second analytic quotient, a second coordinate operator, a second O(Ω)-module structure or a second proof of surjectivity, injectivity or the de Rham comparison for trivial central character. The kept refinements say in one clause how they go beyond the base roadmap:

- §1.3 defines the compactly supported P-finite vectors of every representation of P, at every prime; on the supersingular Banach objects of the base §4.9, where p ≥ 5, they are the vectors of that section's compactly supported P-finite space killed by a power of some u(pⁿ)−1. §1.7 proves their density in Π(V)^an for non-trianguline V at every prime; the base §4.9 states density of its space for p ≥ 5.
- §1.7 identifies the restriction of the P-finite Kirillov model to π with the smooth Kirillov realisation of GL2AutomorphicRepresentationsAndTransfer R16.2.8, which it does not construct again.
- §2.1 proves equality of the embedded duals inside tN_rig⊠ℙ¹, with fixed-radius control. §4.11 of the base proves independence of the abstract quotient only.
- §2.2 proves the two-sided homographic covariance of ∂. §6.9 of the base constructs ∂ and the resolvents only.
- §2.3 proves topological irreducibility of Π(π,0), which the base does not state.
- §3.2 gives the Kirillov embedding of the u⁺-kernel, independent of the line, with its twisted coefficients.
- §3.3 removes the trivial-central-character hypothesis of §6.9.
- §4.1 reads the multiplicity diagram of ProetaleCohomologyOfPAdicCurvesAndTowers §7.5 at a fixed level on the p-central quotient over ℚ_p, with its G_ℚ_p-action; §4.9 reads the bounded-vector statement of that roadmap's §7.3 on the p-central quotient and on each M-multiplicity, and proves at a fixed level the vanishing of bounded functions in a supercuspidal sector that its §7.5 uses on the infinite-level tower.

The tower, its period maps, commuting actions, Weil descent and central quotients come from **EndoscopicTransferAndUnitaryTraceComparison** §§12.4, 12.5, 12.7, 12.14 and 12.19. Its ℓ ≠ p compact-support comparison and its infinite-level perfectoid covers are not used. The finite-level Stein coverings are the preimages of the balls of the Bruhat–Tits tree, as in DLB17 Proposition 3.1. **ProetaleCohomologyOfPAdicCurvesAndTowers** owns the p-adic geometry of the rank-two Drinfeld tower over every finite extension F of ℚ_p, and this roadmap uses it at F = ℚ_p without restating it: the connected components of the tower and the action of G×Ǧ×W_ℚ_p on them (its §7.1), the equivariant semistable models of every level (§7.2), the levelwise fundamental diagram with the étale classes as the G-bounded pro-étale classes (§7.3), the Hyodo–Kato and de Rham multiplicities H¹_HK(M_∞)[M] ≅ M̆⊗̂LL(M)* and H¹_dR(M_∞)[M] ≅ (C⊗M_dR)⊗̂LL(M)* (§7.4), the multiplicity form of the fundamental diagram (§7.5), the generalised Steinberg representations with their lattices and universal completions (§§0.3–0.4), and the de Rham, pro-étale and étale cohomology of the half-plane (§§6.2, 6.5 and 6.9 at d = 1). **ScholzeFunctorAndModpCohomologyOfTheLubinTateTower** §5.4 supplies the finite length of the mod p cohomology of the p-central tower at fixed level (CDN23 Théorème 4.1), and **LocallyAnalyticRepresentationsOfLocalGroups** §§0.3 and 0.5 the differentiated Lie algebra action and the distribution-module action on locally analytic representations, its §0.8 the criterion for null sequences over a spherically complete field (DLB17 Lemme 5.10), its §1.1 the abelian category of coadmissible D(G,L)-modules, and its §5.1 the locally analytic induction whose quotient by the constants is St^an. **LocallyAnalyticDistributions** §§0.0, 0.2 and 0.3 supply locally convex limits, strictness and the strong-dual comparison for analytic compact-type spaces. **LocallyAnalyticDistributionsPartII** §1.5 supplies the Banach radius algebras of distributions in ordered coordinates, and its §§2.2–2.3 supply their enveloping-algebra closures and Frommer's theorem, used in §3.1 for the local analyticity of the function duals of the tower. **PhiGammaModulesAndIwasawaCohomology** supplies three things: the unfiltered differential equation N_dR (§5.6a), the map from ψ-fixed vectors to the ψ-zero part (§2.4) and the all-level exponential-image theorem with its annular generation (§5.7). **PadicHodgeTheory** §§3.3, 4.4, 5.1–5.4 and 8.1 supply the period functors, D_dif, Berger's differential equation, Fontaine's recipe and the proper smooth de Rham comparison. **PadicDifferentialEquationsAndRigidCohomology** §§RD.1.73 and RD.2.43 supply the Robba residue pairing and its perfectness, from which §1.2 proves the surjectivity of ∂ on N_rig of a nontrianguline de Rham representation.

**GL2AutomorphicRepresentationsAndTransfer** R16.3 supplies the rank-two local parameters, R16.1.8 finite-order Hecke characters with a prescribed local component, R16.2.8 the smooth Kirillov realisation of a supercuspidal representation with L_∞-coefficients, R16.2.10 the projectivity of a complex supercuspidal representation in the category with a fixed central character, and R17.3 the global Jacquet–Langlands correspondence. **CompletedCohomologyAndLocalGlobalCompatibility** §6.4 supplies the globalisation of a supercuspidal π on a definite quaternion algebra with residual representation absolutely irreducible at p, its §4.9 the local–global compatibility for that algebra, its §2.7 the comparison of classical and p-adic quaternionic forms, and its §6.3 the supercuspidal case of the locally algebraic vectors of the base §4.2. **HilbertModularVarietiesAndShimuraCurves** supplies the Čerednik–Drinfeld uniformisation of the Shimura-curve tower (§§R18.5.16 and R18.5.21), the automorphic eigenspaces of the cohomology of the curves (§R18.4.25), their semistable period comparison (§R18.4.24a) and local–global compatibility at p (§R18.3.29). Teitelbaum's explicit model of the first cover is constructed in §7.3, as a model with the properties of ProetaleCohomologyOfPAdicCurvesAndTowers §7.2 at level one. **LocalGaloisDeformationRings** §3.8 compares R_(B,M) with deformation rings of fixed Weil–Deligne type. **SmoothRepresentationsOfLocalGroups** SR.0 and SR.2 supply the smooth categories and induction, and its SR.3a.1 the vanishing Jacquet module of a supercuspidal representation. **TropicalAndBerkovichArithmetic** §§2.16–2.17 supply the intrinsic nodes of an analytic curve and the extension of automorphisms to a normal formal model that preserve its component points, used in §7.3. Four inputs are supplier gaps, stated under *Exact supplier contracts*: the coefficient form of supercuspidal projectivity (GL2AutomorphicRepresentationsAndTransfer R16.2.10), the fixed-radius form of the divisibility step of the base §6.9, the tensor comparison for continuous Galois cohomology of C⊗V^∨ with Fréchet coefficients (PadicHodgeTheory §4.4), and the globalisation of a supercuspidal type by three forms with pairwise distinct period lines (CompletedCohomologyAndLocalGlobalCompatibility §6.4).

## Conventions

Let p be a prime, L/ℚ_p a finite extension, O = O_L with uniformiser ϖ and residue field k_L. Enlarge L whenever a splitting or absolute-irreducibility hypothesis needs it. Write G = GL₂(ℚ_p), Z for its centre, P for the mirabolic subgroup (∗ ∗; 0 1), B for the upper Borel subgroup, w = (0 1; 1 0), u(b) = (1 b; 0 1), and Γ = ℤ_p^× for the cyclotomic group. Write D for the quaternion division algebra over ℚ_p, O_D for its maximal order, ϖ_D for a uniformiser with ϖ_D² = pu for a unit u, and Ǧ = D^×. Let Ω = ℙ¹ ∖ ℙ¹(ℚ_p) be the Drinfeld half-plane over ℚ_p, with coordinate z, and let g = (a b; c d) act by z ↦ (az+b)/(cz+d).

**Levels.** Put K_D(0) = O_D^× and K_D(n) = 1+ϖ_D^nO_D for n ≥ 1. Colmez–Dospinescu–Nizioł (CDN20, CDN23) write M^p_n for the p-central quotient at level K_D(n), for n ≥ 0. For r ≥ 1, Dospinescu–Le Bras (DLB17) writes Σ_r for the model over ℚ_p of the quotient by p^ℤ of the cover of level 1+p^rO_D. Its Galois group over Σ₀ is O_D^×/(1+p^rO_D) (DLB17 lines 104–106). Since 1+p^rO_D = K_D(2r) for r ≥ 1, the DLB level r is the CDN level 2r; Σ₀ is M^p_0 at level K_D(0). EndoscopicTransferAndUnitaryTraceComparison §12.4 indexes positive levels by ϖ_E-power level m, which is ϖ_D-level 2m for E = ℚ_p; its level zero is read separately as K_D(0). For odd n ≥ 1, the cover of ϖ_D-level n is the quotient of the cover of ϖ_D-level 2m ≥ n by the finite group K_D(n)/K_D(2m), so every level is finite étale over level zero. The first cover of level 1+ϖ_DO_D is a different space from Σ_1. Σ₀ and M^p_0 are the same ℚ_p-space, the descent of the p^ℤ-quotient of the level-zero space by the same Weil descent datum. Geometrically Σ₀ consists of two copies of Ω, its two height classes, exchanged by ϖ_D, on which O_D^× acts trivially (DLB17 lines 114–116). The descent datum exchanges them as well: a Frobenius translates the height by ±1, while p translates it by 2 (CDN23 lines 220–229; EndoscopicTransferAndUnitaryTraceComparison §12.19). Since the map to Ω is equivariant for the descent datum and inertia fixes the height classes, Σ₀ → Ω is the base change of Spec ℚ_p² → Spec ℚ_p, where ℚ_p² is the unramified quadratic extension of ℚ_p. So Σ₀ is connected over ℚ_p and splits as Ω⊔Ω only over a field containing ℚ_p² (source correction E20).

**Actions and duals.** Groups act on functions by inverse pullback: (gf)(z) = f(g⁻¹z). With this convention the Lie algebra acts on O(Ω) by u⁺f = −f′, a⁺f = −zf′, a⁻f = zf′ and u⁻f = z²f′. This is the case k = 0 of DLB17 Lemme 3.5 (DLB17 line 759). The strong dual E′_b of a locally convex space E carries the topology of uniform convergence on bounded subsets. It is used for spaces of compact type (analytic vectors, smooth representations of countable dimension with their finest locally convex topology) and for the Fréchet spaces of functions, differentials and de Rham cohomology of the tower. For a Banach space W, write W* for its continuous dual with the topology of uniform convergence on compact subsets of W (CDN23, footnote 8, lines 182–184). Its bounded subsets are the norm-bounded ones (Banach–Steinhaus), on them this topology is that of pointwise convergence, which CDN20 §1.3.2 (lines 633–644) uses for the dual of St^cont, and the polar of the unit ball, the dual lattice of the Schikhof duality of the base roadmap §0.1, is compact. If Π is a Banach representation of G, then G acts continuously on Π*. It does not act continuously on the norm dual Π′_b in general (§4.2, Checks), so Π′_b is never used as a representation. On a space E of compact type every bounded subset lies and is bounded in one Banach stage (LocallyAnalyticDistributions §0.0), hence is relatively compact in the next, so compact convergence on E′ is the strong topology: CDN23's (Π^an)* and LL(M)* are (Π^an)′_b and LL(M)′_b. Both kinds of dual carry the action (gℓ)(v) = ℓ(g⁻¹v). In particular a central element acting on E by a scalar χ(z) acts on E′_b, and on E* when E is Banach, by χ(z)⁻¹.

**Multiplicity spaces.** For a topological G×Ǧ-representation X and a finite-dimensional smooth representation ρ of Ǧ, write X^ρ = Hom_Ǧ^cont(ρ, X), as in the base roadmap §6.9. For a type M, write X[M] = X^(JL(M)). The multiplicity X[M] and the isotypic summand X[M]⊗JL(M) are different spaces when dim JL(M) > 1.

**Hodge–Tate weights and twists.** The cyclotomic character χ has Hodge–Tate weight +1, as in the base roadmap. Thus D_dR(ℚ_p(1)) is spanned by t⁻¹⊗e₁ and lies in Fil⁻¹ but not in Fil⁰. A representation of weights {0,1} has Hodge filtration with jumps −1 and 0 on D_dR. Its line Fil⁰D_dR is the period line of the family. For a (φ,N,G_ℚ_p)-module M and k ∈ ℤ, M[k] is M with φ multiplied by p^k (CDN20 line 857). Hence D_pst(ℚ_p(1))[1] has φ = 1, since φ acts on D_cris(ℚ_p(1)) by p⁻¹. Reciprocity is the geometric normalisation of the base roadmap's Conventions: p corresponds to a geometric Frobenius.

**Types.** For a rank-two (φ,N,G_ℚ_p)-module M, CDN20 (lines 242–252) attaches WD(M), the smooth representation LL(M) and JL(M). M is supercuspidal when WD(M) is irreducible, and special when M = Sp⊗δ with N ≠ 0. ΦN denotes the special and supercuspidal M. ΦNᵖ denotes those on which p ∈ Z(Ǧ) acts trivially on JL(M). ΦNᵖ_n denotes those of level at most n, meaning JL(M) is trivial on K_D(n) (CDN23 lines 2343–2345). The p-central quotient only sees ΦNᵖ.

**Coefficients.** Over C = ℂ_p, use the Galois-invariant model with L⊗F coefficients before base change to C (CDN20, §2.1, line 749). The completed tensor product ⊗̂ is the completed projective tensor product of the base roadmap §0.1.

## Exact supplier contracts

### From Mathlib

`Suggested.lean` states no declarations. The following declarations of the pinned Mathlib are the carriers the G-bounded vectors of §4.8, the linear algebra of §§4.3 and 6.3 and the derived category of §7.6 rest on.

- `Bornology.IsVonNBounded` (Mathlib/Analysis/LocallyConvex/Bounded.lean): von Neumann boundedness, defined by absorption of every neighbourhood of zero over a seminormed ring. It assumes neither a Hausdorff topology nor local convexity.
- `NormedSpace.image_isVonNBounded_iff` (Mathlib/Analysis/LocallyConvex/Bounded.lean): over a nontrivially normed field, the image of a set under a map into a seminormed space is von Neumann bounded iff its norms are bounded by one real constant.
- `WithSeminorms.isVonNBounded_iff_seminorm_bounded` and `WithSeminorms.image_isVonNBounded_iff_seminorm_bounded` (Mathlib/Analysis/LocallyConvex/WithSeminorms.lean): for a topology given by a family of seminorms p_i over a nontrivially normed field, a set (resp. an image) is bounded iff for every i there is a bound r_i > 0 on p_i. The bound depends on i.
- `WithSeminorms.banach_steinhaus` (Mathlib/Analysis/LocallyConvex/Barrelled.lean): the uniform boundedness principle on a barrelled source.
- `Representation`, `Submodule`, `LinearMap`, `Module.finrank` and `Module.Basis`: linear representations, subspaces, partial operators, dimension and prescribed eigenbases.
- `DerivedCategory` (Mathlib/Algebra/Homology/DerivedCategory/Basic.lean): the derived category of an abelian category, the localisation of ℤ-indexed cochain complexes at the quasi-isomorphisms, given a chosen localisation (`HasDerivedCategory`). It has no boundedness condition; §7.6 uses the full subcategory of complexes with bounded cohomology.

### From Tau Ceti

Nothing is consumed from the pinned Tau Ceti. It has no carrier for the Drinfeld half-plane or its covers, p-adic Kirillov models, Robba rings, rigid analytic spaces, or locally analytic or Banach representations; its Drinfeld level structures concern elliptic curves and its Kirillov form concerns coadjoint orbits of Lie algebras. None of the headline theorems is statable at these pins; `Suggested.lean` names each one and what it lacks.

### From TauCetiRoadmap.PadicLocalLanglandsForGL2Qp

- §0.1: LA(X,L) and D(H,L), with strong duals, completed tensors and convolution. It also supplies coadmissible D(H,L)-modules and the anti-equivalence with admissible locally analytic representations. Further, it gives admissible unitary Banach representations with the analytic-vector functor Π ↦ Π^an, which is exact, has dense image and preserves admissibility.
- §0.2: the filtered (φ,N)-module carrier, weak admissibility and the semistable equivalence, which give the Colmez–Fontaine construction of V_(M,ℒ).
- §§1.1–1.4 and 1.6: the subgroups of G, the character dictionary, the Tate dual Ď, ψ and the treillis, and the trianguline representations of dimension two.
- §1.7: Colmez's classical correspondence M ↦ LL(M) in the geometric normalisation, with its rule LL(M⊗η) = LL(M)⊗(η∘det) for a smooth character η of ℚ_p^×, read on the Weil side through geometric reciprocity; §0.4(a) uses it to compare M(π) with the module M = D_pst(V)[1].
- §§2.5 and 2.7: universal unitary completions and the irreducible mod p representations.
- §§3.1–3.8 and 3.11: D⊠ℙ¹, the Montreal functor, its integral and mod p forms, Π(D) and the correspondence V ↦ Π(V), family stability, and the analytic vectors of Π(D).
- §§4.1–4.2: for a two-dimensional de Rham V with Hodge–Tate weights a < b, the smooth factor LL(V) = LL(D_pst(V)) of §1.7 and the algebraic factor Alg(V) = Sym^(b−a−1)⊗det^a, and Colmez's theorem that for absolutely irreducible such V the locally algebraic vectors Π(V)^alg are nonzero, depend only on D_pst(V) and (a, b), not on the filtration, and are LL(V)⊗Alg(V). When WD(V) is irreducible, §4.2(v) states this last identification under its supercuspidal comparison input, which the base roadmap assigns to CompletedCohomologyAndLocalGlobalCompatibility §6.3; §§2.4, 4.12 and 7.2 use it in that case and cite both.
- §4.1k: the almost de Rham Kirillov model of the compactly supported P-algebraic vectors of fixed weight.
- §4.2a: the filtration-independent G-action on N_rig⊠ℙ¹, which preserves tN_rig⊠ℙ¹ in weights {0,1}.
- §4.8: the locally analytic principal series of G with their special subrepresentations and the analytic Steinberg quotients St^an(δ₁,δ₂); §4.2 uses the case η₁ = χ, η₂ = 1, whose special subrepresentation is the constants and whose quotient is St^an = C^an(ℙ¹(ℚ_p), L)/L.
- §4.9: for p ≥ 5 and Banach objects whose constituents are supersingular, the compactly supported P-finite space, defined by finiteness under diag(ℤ_p^×,1) and the infinite-slope condition of §1.3 alone, and its Banach density.
- §4.11: the analytic quotient Π(V)^an/π, independent of the line.
- §§5.1–5.6: blocks B, projective envelopes P_B, E_B = End(P_B) with the evaluation Hom(P_B,M)⊗̂_(E_B)P_B → M, and the pseudodeformation ring R_B^(ps,δ) with the centre comparison.
- §5.8, its universal family for absolutely irreducible residual representations: for every prime p, p = 2 included, and absolutely irreducible ρ̄, the family Π^univ over the unrestricted universal deformation ring of ρ̄, with fibre Π(ρ_x(ε)) at a closed point x. The hypothesis p ≥ 3 of the projective-envelope comparison in the first part of §5.8 is not used.
- §5.12: the full Weil–Deligne type ring and the B-adic completion LL_B(M) of a G-stable lattice, with the ring R_(B,M) = End_G(LL_B(M)), a finite product of principal ideal domains, and the free rank-two family ρ_(B,M), all at weights {0,1}. That section indexes them by D_pst of the points, which is Colmez's module M° = M[−1] of a type M of Conventions (§0.4(a)); Layer 6 fixes the translation.
- §6.7: Paškūnas–Tung finiteness.
- §6.9: the local Jacquet–Langlands correspondence JL, the multiplicity spaces X^ρ, the O(Ω)-module structure on Π(π,0)′_b with its coordinate operator ∂, the O(Ω)-linearity of continuous G-maps into O(Σ_n)^ρ, the surjectivity and the injectivity of the comparison map, the scalar-endomorphism theorem, the function-dual comparison (O(Σ_n)^ρ)′_b ≅ Π^an/π, the de Rham comparison H¹_dR(Σ_n)^ρ ≅ M*_dR⊗π′_b with its filtration-preimage statement, and the hypothesis of a nonzero continuous G-map (Π^an/Π^lisse)′_b → O(Σ_n)^ρ. It also supplies Π(π,2) with its differential d and the two-copy smooth kernel Π(π,2)^(u⁺=0) ≅ π⊗M_dR(π). All of these are stated there for supercuspidal π with trivial central character. The O(Ω)-module structure is the unique continuous one for which a⁺−1 = u⁺∂, and §6.9 constructs the resolvents (∂−x)⁻¹ of ∂. The comparisons take the nonzero map and the global de Rham data of DLB17 §4 as explicit hypotheses; §3.1 proves both.

What PadicLocalLanglandsForGL2Qp must provide (gap:fixed-radius-divisibility): in §6.9, the vanishing of ∩_(j≥0)(u⁺)^j Π(π,0)′_b used for the injectivity of the comparison map in §6.9 must be proved inside one lattice of fixed admissible radius on both charts, not by t-divisibility in the full Robba ring (source correction E9).

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

§12.4 supplies the special O_D-module tower and its levels. §12.5 supplies the period maps and their equivariance, and §12.7 the commuting G×Ǧ×W_ℚ_p actions and the effective Weil descent. §12.14 supplies the central quotient and tensor sectors. There the diagonal centre acts trivially and the left Ǧ-character of a sector is the inverse of the central character of ρ. §12.19 supplies the arithmetic descent of the rank-two central quotient M^p_n to ℚ_p with its G′-action. Since every level is finite étale over level zero (Conventions), the preimages of the balls of the Bruhat–Tits tree under the period map and the retraction form an affinoid Stein covering of M^p_(n,C), as for Σ_r in DLB17 Proposition 3.1 and the paragraph after it (DLB17 lines 641–651).

### From TauCetiRoadmap.LocallyAnalyticDistributions

§0.0 supplies locally convex limits and completed projective tensor products. §0.2 supplies strict sequences and projective limits of finite-dimensional Mittag–Leffler cohomology. §0.3 supplies the strong-dual comparison for analytic compact-type spaces.

### From TauCetiRoadmap.LocallyAnalyticDistributionsPartII

§1.5 supplies, for a compact locally ℚ_p-analytic group H with a p-valuation ω and an ordered basis h₁, …, h_d satisfying its condition (HYP) ((H,ω) is p-saturated and ω(h_i)+ω(h_j) > p/(p−1) for i ≠ j), and for 1/p ≤ r < 1, the coordinate norms ‖·‖_r, the Banach radius algebras D_r(H,L) and D(H,L) = lim_r D_r(H,L), together with, for r ∈ p^ℚ ∩ (1/p,1), their identification with the radius algebras of the Fréchet–Stein structure of PadicLocalLanglandsForGL2Qp §0.1. Noetherianity of the stages is that of PadicLocalLanglandsForGL2Qp §0.1. Use it for H = G_i = 1+pⁱM₂(ℤ_p), with i ≥ 1 for p odd and i ≥ 2 for p = 2, the ordered basis 1+pⁱE₁₁, 1+pⁱE₁₂, 1+pⁱE₂₁, 1+pⁱE₂₂, and the p-valuation ω(g) = v_p(g−1)−i+1 for p odd and ω(g) = v_2(g−1)−i+2 for p = 2, where v_p(x) is the least valuation of the entries of x. These satisfy (HYP): the basis has ω = 1 for p odd, with 1+1 > p/(p−1), and ω = 2 for p = 2, with 2+2 > 2; and an element with ω > p/(p−1) lies in G_(i+1), the group of p-th powers of G_i. The unshifted v_p(g−1) is not saturated on G_i for p odd and i ≥ 2, nor for p = 2 and i ≥ 3: an element of G_i ∖ G_(i+1), such as 1+pⁱE₁₂, has value i > p/(p−1) and is not a p-th power. LocallyAnalyticDistributionsPartII §2.2 defines U_r(h,L) as the closure of U(h) in D_r(H,L) in its odd-prime uniform setting; §2.3 supplies the general ordered p-valued form of Frommer's theorem. For r ∈ p^ℚ with 1/p < r < 1 this closure consists of convergent ordered Lie series Σ_α d_αX^α with |d_α|·‖X^α‖_r → 0, and D_r(H,L) is finite free over U_r(h,L) with a basis in ℤ_p[H]. §3.1 uses this general p-valued form, including at p = 2, to extend the differentiable action with Lipschitz derivations to D_r(G_i,L) for r close to 1.

### From TauCetiRoadmap.ProetaleCohomologyOfPAdicCurvesAndTowers

All statements are used at F = ℚ_p, ϖ = p, so that M_n^ϖ there is the p-central quotient M^p_n here, and G′ = G/p^ℤ.

- §§0.3–0.4: the generalised Steinberg representations Sp_J(A), Sp^cont_J(Λ) and their duals. For GL₂(ℚ_p) and d = 1, Sp_1(L) = C^sm(ℙ¹(ℚ_p), L)/L is St^sm and Sp^cont_1(L) = C⁰(ℙ¹(ℚ_p), L)/L is St^cont. §0.4(c) gives that St^cont is the universal unitary completion of St^sm and that the G-bounded vectors of (St^sm)′ form (St^cont)*. That roadmap gives duals the weak topology, which on bounded subsets of (St^cont)* is the topology of compact convergence of Conventions.
- §6.2 at d = 1: H¹_dR(Ω) ≅ (St^sm)′ through the regulator μ ↦ ∫ dlog((z−x)/(z−x₀)) μ(x). §6.5 at d = 1: the strictly exact sequence 0 → O(Ω_C)/C → H¹_proét(Ω_C, ℚ_p(1)) → (St^sm_(ℚ_p))′ → 0 mapping to the de Rham sequence. §6.9 at d = 1: topological G×G_ℚ_p-isomorphisms H¹_ét(Ω_C, ℤ_p(1)) ≅ Sp_1(ℤ_p)^* and H¹_ét(Ω_C, 𝔽_p(1)) ≅ Sp_1(𝔽_p)^*, with G_ℚ_p acting trivially on the right and the duals carrying the weak topology, that is, pointwise convergence on Sp_1, and with H¹_ét(Ω_C, ℚ_p(1)) the G-bounded vectors of H¹_proét. The identification with ℤ/p^k-coefficients follows from the integral one, since Sp_1(ℤ_p) is free.
- §7.1: at finite level the geometric connected components of height zero are a torsor under (ℤ/p^m)^×, π₀ of the infinite-level tower is a principal homogeneous space under ℚ_p^×, and G, Ǧ and W_ℚ_p act on it through det, Nrd and reciprocity. Hence Ǧ acts on locally constant functions on M^p_(n,C) through characters factoring through Nrd.
- §7.2: for every n ≥ 0, a G×Ǧ×G_ℚ_p-equivariant semistable formal model of M^p_n over the integers of a finite extension, whose special-fibre components form finitely many G-orbits, each fixed by an open subgroup.
- §7.3: the levelwise fundamental diagram of M^p_(n,C), equivariant for G×Ǧ×W_ℚ_p; finiteness of π₀(M^p_(n,C)); and, for the full level M_(n,C), the injectivity of H¹_ét(M_(n,C), L(1)) → H¹_proét(M_(n,C), L(1)) with image the G-bounded vectors (CDN20 Proposition 2.12).
- §7.4: for supercuspidal M, H¹_HK(M_∞)[M] ≅ M̆⊗̂_L LL(M)* and H¹_dR(M_∞)[M] ≅ (C⊗M_dR)⊗̂_L LL(M)*, compatible with ι_HK, φ and W_ℚ_p.
- §7.5: for supercuspidal M of slope 1/2, the commutative diagram with exact rows 0 → O(M_∞)[M] → H¹_proét(M_∞, L(1))[M] → X⁺_st(M)⊗̂_L LL(M)* → 0 and 0 → O(M_∞)[M] → Ω¹(M_∞)[M] → (C⊗M_dR)⊗̂_L LL(M)* → 0, with vertical maps dlog and θ⊗id injective with closed image. Its integral form: passing to G-bounded vectors gives an injection H¹_ét(M_∞, L(1))[M] → X⁺_st(M)⊗̂_L (LL(M)^∧)*, with LL(M)^∧ the universal unitary completion of LL(M) and (LL(M)^∧)* its Banach dual of Conventions.

Here LL(M)* is the strong dual LL(M)′_b of this roadmap's notation, and the multiplicity spaces [M] of that roadmap are those of §0.2 here after extension of scalars from ℚ_p to L.

### From TauCetiRoadmap.ScholzeFunctorAndModpCohomologyOfTheLubinTateTower

§5.4, *Finite length of arithmetic Drinfeld cohomology* (CDN23 Théorème 4.1): for p > 2, n ≥ 0, K/ℚ_p finite and k ≥ 1, H¹_ét(M^p_(n,K), O_L/ϖ_L^k), with its profinite topology, is the compact dual of the smooth admissible G′-representation of finite length H¹_ét(M^p_(n,K), O_L/ϖ_L^k)^∨, and Hom^cont_(k_L[G′])(π^∨, H¹_ét(M^p_(n,ℂ_p), k_L)) is finite-dimensional for every smooth admissible k_L[G′]-module π with a central character. Layer 5 of this roadmap uses it for the twisted coefficients (O_L/p^k)(1) and for the invariants (H¹_ét(M^p_(n,C), (O_L/p^k)(1)))^(G_K): over a finite extension K′ of K containing μ_(p^k) the twist is trivial; the Hochschild–Serre sequence of G_K′ compares H¹_ét(M^p_(n,K′), −) with the G_K′-invariants of the geometric group up to the finite groups H¹(G_K′, H⁰) and H²(G_K′, H⁰), H⁰ being finite by ProetaleCohomologyOfPAdicCurvesAndTowers §7.3; and the G_K-invariants form a closed G′-submodule of the G_K′-invariants, whose Pontryagin dual is a quotient of a representation of finite length.

### From TauCetiRoadmap.LocallyAnalyticRepresentationsOfLocalGroups

§0.3, *The action of the enveloping algebra and its decomposition over embeddings*: for a locally ℚ_p-analytic representation V of G over L, the continuous differentiated action X·v = d/ds exp(sX)v at s = 0 is a Lie algebra homomorphism from gl₂(ℚ_p)⊗L to continuous endomorphisms and commutes with equivariant maps. §0.5, *Locally analytic representations are D(G, E)-modules*, supplies the separately continuous D(G,L)-action, agreeing on compact open subgroups with the distribution action of PadicLocalLanglandsForGL2Qp §0.1. §1.1, *Coadmissible modules over D(G, E) for non-compact G*, supplies the abelian full subcategory 𝒞_G of D(G,L)-modules coadmissible over D(H,L) for one, equivalently every, compact open H, closed under finite direct sums, kernels, cokernels and images; §7.6 takes its derived category. §0.8, *Weakly null sequences are null over a spherically complete field*: over a spherically complete coefficient field, a sequence in a Hausdorff locally convex space tends to 0 exactly when its image under every continuous linear form does; this is DLB17 Lemme 5.10, used in the Frobenius-reciprocity step of §3.1(a). §5.1, *Locally analytic parabolic induction*: the locally analytic induction (Ind_B^G 1)^an, of compact type and identified with C^an(ℙ¹(ℚ_p), L), with the constants as its unique closed one-dimensional subrepresentation; §4.2 uses its quotient St^an.

### From TauCetiRoadmap.PhiGammaModulesAndIwasawaCohomology

- §2.4: the map x ↦ (1−φ)x from ψ-fixed vectors to the ψ-zero part.
- §5.4: the analytic Iwasawa comparison.
- §5.6a: the unfiltered differential equation N_dR(V) = N_rig(V), with localisations L_n[[t]]⊗D_dR(V).
- §5.7: the all-level exponential-image criterion, which characterises tN_rig(V)^(ψ=1) by the exponential images at every cyclotomic level, together with the injectivity of 1−φ on it, the vanishing of the ψ-cokernels and the annular generation that follow from it. Their hypothesis is that D_rig(V) is geometrically nontrianguline after localisation for every finite coefficient extension.

### From TauCetiRoadmap.PadicHodgeTheory

§3.3 supplies Fontaine's functors and §4.4 the Sen and differential realisations D_dif^±. §§5.1–5.2 supply Berger's differential equation and filtered modules as Robba modifications. §§5.3–5.4 supply potentially semistable periods, Fontaine's recipe for WD(V) and the rank-two type normalisations, and §8.1 the proper smooth de Rham comparison.

What PadicHodgeTheory must provide (gap:continuous-galois-tensor-comparison): in §4.4, for every finite L/ℚ_p and finite-dimensional continuous L-representation V of G_ℚ_p, put X = C⊗_ℚ_p V^∨. Prove that continuous H¹(G_ℚ_p,X) is Hausdorff and finite-dimensional over L, and provide a strict continuous-cohomology model giving, for every Fréchet L-space F with trivial action, written as a countable inverse limit of Banach L-spaces, the natural topological isomorphism H¹(G_ℚ_p,X)⊗_L F ≅ H¹(G_ℚ_p,X⊗̂_L F), so that the inverse limit contributes no derived-limit term, natural in continuous linear maps F → F′. The Sen and differential realisations of §4.4 alone do not assert this cohomological comparison; it is the additional input used in CDN20 Proposition 2.4 (lines 844–853).

### From TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology

§RD.1.73 defines the Robba residue pairing coker ∂ × ker ∂^∨ → L. Its §RD.2.43 proves perfectness for differential modules with Frobenius structure: in the convention ∂ = t⁻¹∇, it identifies N_rig(V)/∂N_rig(V) with the L-dual of N_rig(V̌)^(∂=0). §1.2 uses only this identification, for the surjectivity half of DLB17 Proposition 6.4. The injectivity half rests on the polynomial injectivity of DLB17 Lemme 6.3, which is the first statement of §1.2 and is proved there; the application step of §RD.2.43 quotes that lemma and is not used.

### From TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer

- R16.3: rank-two local parameters, Steinberg monodromy and supercuspidal parameters.
- R16.1.8: a finite-order Hecke character of ℚ with prescribed finite-order components on the full groups ℚ_v^× at finitely many places, used to remove an unramified twist at p.
- R16.2.8: the smooth Kirillov realisation of a supercuspidal π of GL₂(ℚ_p) with trivial central character, defined over L, on the compactly supported locally constant functions φ: ℚ_p^× → L_∞ with φ(ax) = σ_a(φ(x)) for a ∈ ℤ_p^×, with u(b) acting by multiplication by ε(bx); §1.7 identifies the restriction of the P-finite Kirillov model to π with it.
- R16.2.10: for a nonarchimedean local field F and a smooth character ω of the centre, a supercuspidal complex representation of GL₂(F) with central character ω is projective in the category of smooth complex representations with central character ω.
- What GL2AutomorphicRepresentationsAndTransfer must provide (gap:cuspidal-projectivity-coefficients): in R16.2.10, the form with coefficients in a field of characteristic zero, which that section names as the input of the Drinfeld-tower application without stating it. For G = GL₂(ℚ_p), a field L of characteristic zero and a smooth character ζ: Z → L^×, a smooth absolutely irreducible supercuspidal L-representation with central character ζ is projective and injective in the category of smooth L-representations with central character ζ.
- R17.3: the global Jacquet–Langlands correspondence and strong multiplicity one.

### From TauCetiRoadmap.CompletedCohomologyAndLocalGlobalCompatibility

- §6.3: for a two-dimensional de Rham representation of G_ℚ_p with distinct Hodge–Tate weights that is potentially crystalline but not crystabelline, equivalently with irreducible Weil–Deligne representation, the global proof that its locally algebraic vectors are the algebraic factor tensored with the classical smooth factor, stated for Emerton's functor with the normalisation comparison to PadicLocalLanglandsForGL2Qp §1.7 given there. It is the supercuspidal comparison input of PadicLocalLanglandsForGL2Qp §4.2(v).
- §6.4: for a supercuspidal π whose central character is trivial on p up to twist and the definite algebra B̄ of discriminant ℓ ≠ p, a weight-two form f on B̄^* with π(f)_p ≅ π⊗ξ∘det, ξ unramified, and r̄_f|G_ℚ_p absolutely irreducible (DLB17 Théorème 5.5 with Lemme 5.6).
- What CompletedCohomologyAndLocalGlobalCompatibility must provide (gap:three-period-line-globalisation): in §6.4, for every supercuspidal π of GL₂(ℚ_p) over L whose central character is trivial on p, three weight-two forms on B̄^* for the definite quaternion algebra B̄ of §6.4, of possibly different tame levels and after a finite extension of L and twists by finite-order Hecke characters, each with p-component isomorphic to π and residual Galois representation absolutely irreducible on G_ℚ_p, whose p-adic Galois representations have pairwise non-isomorphic restrictions to G_ℚ_p. §6.4 as stated gives one such form; §3.3(iii) needs three, and distinct residual representations are not required.
- §4.9: Emerton's local–global compatibility C⁰(X)[𝔭] ≅ Π(𝔭)^(⊕m), m > 0, for a definite quaternion algebra split at p, with r̄|G_ℚ_p absolutely irreducible. Its §2.7 compares classical and p-adic quaternionic forms (DLB17 Lemme 4.7).

### From TauCetiRoadmap.LocalGaloisDeformationRings

- §3.8: the identification of R_(B,M) with the fixed-Weil–Deligne-type quotient of R_B^(ps,δ_M)[1/p], with its point criterion and its integral image R⁺_(B,M). That section indexes the ring by the Weil–Deligne representation of its points, which for a type M of Conventions is WD(M°), M° = M[−1] (Layer 6).

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

- SR.0 and SR.2: smooth categories, admissibility, compact induction and Frobenius reciprocity.
- SR.3a.1: cuspidality as the vanishing of the Jacquet module along the unipotent radical of the Borel subgroup, so that a supercuspidal π is spanned by the vectors (1 − u(b))v; §1.7 uses it.

### From TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurves

- §R18.5.21, the all-level Drinfeld tower uniformisation: for the indefinite algebra division at p and sufficiently small tame level, rigid isomorphisms between the Shimura curves of level 1+ϖ_D^nO_D at p and the quotients of the Drinfeld covers M_n by the definite partner, for every n ≥ 1, compatible in n, in the tame level and with the Weil descent. §R18.5.16 fixes the conventions over ℚ. These give DLB17 Théorème 4.8 and the input of DLB17 Théorème 5.7.
- §R18.4.25, the cohomological eigenspaces: the cuspidal Hecke eigenspaces of H¹ of a compact quaternionic curve with trivial coefficients are the automorphic representations with weight-two discrete series at the split real place, each with a two-dimensional multiplicity space, the degree-one relative Lie algebra cohomology of that discrete series.
- §R18.4.24a, the semistable comparison for quaternionic curves: for a proper regular strictly semistable model of a quaternionic curve, D_st of its étale H¹ is its Hyodo–Kato cohomology, with the de Rham filtration after extension of scalars.
- §R18.3.29(c), the local–global compatibility of quaternionic eigenforms: at p the arithmetic Galois representation ρ_f = ρ_π^∨ of a weight-two eigenform, the contragredient of its H¹ realisation ρ_π, is potentially semistable and its Weil–Deligne representation corresponds to the local component, in the arithmetic normalisation stated there. That roadmap's filtration-index convention is opposite to this one's: the weights it prints as {0,−1} for ρ_f are {0,1} under Conventions, and ρ_π has weights {0,−1} here.
- §R18.5.3, Drinfeld's formal model: the standard flat regular semistable formal model Ω̂ of Ω, with components indexed by the vertices of the tree, nodes xy = p indexed by its edges, and the extended action of G; §7.3 builds Teitelbaum's model of the first cover over it.

### From TauCetiRoadmap.TropicalAndBerkovichArithmetic

- §2.16: for a separated smooth analytic curve over a p-adic local field, the canonical analytic skeleton and its intrinsic nodes, among them every point of positive stable genus, and the fact that every triangulation contains the intrinsic nodes.
- §2.17: for a normal flat admissible formal curve over the integers of a p-adic local field, an automorphism of its analytic generic fibre that preserves the set of points reducing to generic points of components of the special fibre extends uniquely to the formal model. §7.3 applies both to Teitelbaum's model.

## How to read the build

Layer 0 fixes the types, levels, multiplicity spaces and the period-line parameter, and proves the normalisation dictionary among the base roadmap, DLB17 and CDN20. Layer 1 builds the differential equation of a fixed supercuspidal family and the P-finite Kirillov model with its infinitesimal action for every absolutely irreducible two-dimensional V. Layer 2 proves the embedded and covariant refinements of the base roadmap's analytic quotient and coordinate operator, and Colmez's weight change. Layer 3 proves the local analyticity of the function duals of the tower and the smoothness of its compactly supported de Rham cohomology, discharges the global hypotheses of the base §6.9, builds the line-independent Kirillov embedding, extends the realisation to every supercuspidal type in ΦNᵖ and identifies its de Rham isomorphism with the Hyodo–Kato one. Layer 4 reads the multiplicity diagram of ProetaleCohomologyOfPAdicCurvesAndTowers at a fixed level of the p-central quotient and computes the Galois and Banach multiplicities of p-adic étale cohomology of the tower. Layer 5 builds the integral arithmetic completion at fixed level and its block decomposition. Layer 6 interpolates the multiplicities over the type rings and proves the factorisation. Layer 7 proves the weighted, Iwasawa, primitive, original Breuil–Strauch and derived consequences and constructs the boundary sheaf.

## Layer 0: Types, levels and normalisations

The tower and the classical transfers are imported; this layer fixes the bookkeeping that every later statement uses.

### 0.1 Discrete-series types and the two level conventions

Define ΦN, ΦNᵖ and ΦNᵖ_n as in Conventions, using GL2AutomorphicRepresentationsAndTransfer R16.3 for the rank-two discrete-series parameters and the division-algebra Jacquet–Langlands correspondence of the base roadmap §6.9 for JL. A supercuspidal geometric M has rank two, N = 0 and slope 1/2. A special M is Sp⊗δ with N ≠ 0, and then JL(M) = δ∘Nrd. The DLB cover Σ_r is the CDN level 2r. The p-central quotient and its Weil descent are those of EndoscopicTransferAndUnitaryTraceComparison §§12.14 and 12.19 (CDN23 lines 2339–2349; DLB17 lines 104–106).

Its API:

- M has level at most n exactly when JL(M) factors through Ǧ/K_D(n). Level at most n implies level at most m for every m ≥ n, compatibly with pullback along the tower.
- If M ∉ ΦNᵖ, every JL(M)-multiplicity space of the p-central quotient vanishes, since p ∈ Z(Ǧ) acts trivially on that quotient. For special M = Sp⊗δ, M ∈ ΦNᵖ means δ(p)² = 1, since p ∈ Z(Ǧ) has reduced norm p². That the multiplicity spaces of M ∈ ΦNᵖ are nonzero at some level is a theorem of Layer 4 (§§4.2 and 4.14), not part of this definition.
- The DLB cover Σ_r is the CDN level 2r for r ≥ 1, with the same central sector; Σ₀ = M^p_0. The level-zero quotient Ǧ/K_D(0) is ℤ, and Ǧ/(p^ℤK_D(0)) is ℤ/2ℤ.

**Checks.**

- At n = 0, 1+O_D contains 0 = 1+(−1) and is not a subgroup of Ǧ; K_D(0) = O_D^× excludes zero. The first deck group K_D(0)/K_D(1) is 𝔽_(p²)^×, of order p²−1: 3 at p = 2 and 8 at p = 3. Thus it is not a p-group, whereas K_D(n)/K_D(n′) has p-power order for 1 ≤ n ≤ n′.
- At r = 1, 1+pO_D = 1+ϖ_D²O_D, which is strictly smaller than 1+ϖ_DO_D. Identifying DLB level r with CDN level r would put the first ϖ_D-cover in place of Σ_1.
- For special M = Sp⊗δ, JL(M) = δ∘Nrd is one-dimensional and N ≠ 0. A construction that requires a rank-two absolutely irreducible Galois family rejects it.
- Take a supercuspidal π₀ with trivial central character and the unramified character χ with χ(p) = 1+p, and let M be the type with LL(M) = π₀⊗χ∘det, that is M = M(π₀⊗χ∘det)[1] (§0.4(a)). Then JL(M) = JL(π₀)⊗χ∘Nrd, so p acts on JL(M) by χ(p²) = (1+p)² ≠ 1. Hence M has the level of π₀ but does not lie in ΦNᵖ, and every Ǧ-map from JL(M) into the p-central quotient vanishes.
- H⁰_ét(Σ₀⊗C, L) = L², one factor per height class, and G_K acts on it through Gal(ℚ_p²/ℚ_p), whose generator swaps the factors (Conventions). The G_K-invariants have dimension 1 for K = ℚ_p, 2 for K = ℚ_p² and 1 for a ramified quadratic K; in general the dimension is 2 exactly when the residue degree of K/ℚ_p is even. Two split copies of Ω over ℚ_p would give dimension 2 already for K = ℚ_p. The coefficients have characteristic zero, so the swap sends (1,−1) to (−1,1) ≠ (1,−1) also at p = 2.

*Needs:* GL2AutomorphicRepresentationsAndTransfer R16.3; PadicLocalLanglandsForGL2Qp §6.9 (Jacquet–Langlands); EndoscopicTransferAndUnitaryTraceComparison §§12.4, 12.14 and 12.19.

### 0.2 Type decomposition and multiplicity spaces

The base roadmap §6.9 defines X^ρ for one ρ, with its evaluation isomorphism ρ⊗X^ρ ≅ e_ρX. Here the decomposition is over all types. Let Z be a smooth L[Ǧ]-module on which p acts trivially and whose action factors through Ǧ/(p^ℤK_D(n)), and let L split all irreducible representations of this finite group. Prove that evaluation gives a Ǧ-equivariant isomorphism ⊕_(M ∈ ΦNᵖ_n) Z[M]⊗_L JL(M) → Z, where Ǧ acts trivially on Z[M]. For a topological G×Ǧ-representation the isomorphism is topological, each Z[M] carrying the subspace topology of Hom_L(JL(M), Z). Prove that a continuous equivariant map induces maps on every Z[M], compatibly with composition, and that the decomposition commutes with finite extension of L.

Prove also the level reading of multiplicities. Let M ∈ ΦNᵖ_n be supercuspidal and n′ ≥ n, and let H be one of O, Ω¹, H¹_dR, H¹_HK or H¹_proét(−, L(1)). Then pullback along M_n′ → M_n → M^p_n identifies H(M^p_(n,C))[M], H(M_(n,C))[M], H(M_(n′,C))[M] and the multiplicity on the infinite-level tower M_∞, where H(M_∞) is the colimit of the H(M_(m,C)) (CDN20 lines 100–108). The route: M_n′ → M_n is a finite étale Galois cover with group K_D(n)/K_D(n′), on which JL(M) is trivial, and taking invariants of a finite group is exact in characteristic zero; p^ℤ acts freely on M_n with quotient M^p_n, and since p acts trivially on JL(M), the Hochschild–Serre sequence of p^ℤ ≅ ℤ identifies the M-parts, its H¹(ℤ, H⁰) term being a quotient of a space of locally constant functions (in fact zero, Checks), whose M-part vanishes because Ǧ acts on π₀ through Nrd (ProetaleCohomologyOfPAdicCurvesAndTowers §7.1) and dim JL(M) ≥ 2. Source: CDN23 lines 2346–2349; DLB17, Théorème 1.2 (line 154) and the definition of σ^ρ before it (line 152).

Its API:

- Evaluation ⊕_M Z[M]⊗JL(M) → Z is a topological isomorphism. Only finitely many M have Z[M] ≠ 0.
- A continuous G×Ǧ-map Z → Z′ induces G-maps Z[M] → Z′[M] that respect identity and composition.
- On duals Ǧ acts by (dℓ)(v) = ℓ(d⁻¹v). A central element acting on Z[M] by a scalar acts on the dual by its inverse.
- Finite extension L′/L commutes with Z[M] and with the decomposition.
- For supercuspidal M ∈ ΦNᵖ_n, the M-multiplicities of functions, differentials and first cohomology of M^p_(n,C), of M_(n′,C) for n′ ≥ n and of M_∞ agree under pullback.

**Checks.**

- For Z = W⊗JL(M) with trivial Ǧ-action on W, Z[M] = W⊗End(JL(M)) = W, not W⊗JL(M). When dim JL(M) = 2 the second space has twice the dimension.
- For absolutely irreducible JL(M) ≇ JL(M′), Hom_Ǧ(JL(M), JL(M′)) = 0 over a splitting field. Taking the full isotypic projector in place of the multiplicity space would keep a nonscalar End(JL(M)) acting.
- If z ∈ Z(G) acts on E by χ(z), it acts on E′_b, and on E* for Banach E, by χ(z)⁻¹. Omitting the inverse in the dual action fails this computation.
- At full level zero the height components are indexed by ℤ, p shifts height by two, and H⁰ = ∏_(h∈ℤ)L has a nonzero Sp-multiplicity. Nevertheless H¹(p^ℤ,H⁰) = coker(T−1) = 0: choose f_0 = f_1 = 0 and solve f_(h+2)−f_h = a_h separately in the two parities. Every f_h is a finite signed sum of the a_h; if |a_h| ≤ C then |f_h| ≤ C by the ultrametric inequality. Nonzero H⁰ alone gives no obstruction to extending the supercuspidal level-reading statement. That statement does require the p-central condition: for the twist χ(p) = 1+p, the central-quotient multiplicity is zero while the full-tower multiplicity is nonzero.

*Needs:* §0.1; PadicLocalLanglandsForGL2Qp §6.9 (multiplicity spaces); SmoothRepresentationsOfLocalGroups SR.0; EndoscopicTransferAndUnitaryTraceComparison §§12.7 and 12.14; ProetaleCohomologyOfPAdicCurvesAndTowers §7.1.

### 0.3 The period-line parameter

For a supercuspidal M of slope 1/2 over L⊗ℚ_p^nr, put M_dR = (ℚ̄_p⊗_(ℚ_p^nr)M)^(G_ℚ_p), a two-dimensional L-space. Put X⁺_st(M) = (B⁺_cris⊗_(ℚ_p^nr)M)^(φ=p). For an L-line ℒ ⊂ M_dR, define V_(M,ℒ) as the kernel of the map X⁺_st(M) → C⊗(M_dR/ℒ) induced by θ. Prove the following (CDN20, §2.1.4, lines 879–885; Remarque 2.6 and Lemme 2.7, lines 889–913):

- V_(M,ℒ) is an absolutely irreducible two-dimensional representation of weights {0,1}, with D_pst(V_(M,ℒ)) ≅ M[−1].
- ℒ ↦ V_(M,ℒ) is a bijection from ℙ(M_dR)(L) onto the isomorphism classes of absolutely irreducible two-dimensional V of weights {0,1} with D_pst(V) ≅ M[−1].
- Every such line is weakly admissible, because WD(M) is irreducible. The construction therefore uses the base roadmap §0.2.
- Π_(M,ℒ) := Π(V_(M,ℒ)) is the base roadmap's correspondence applied to V_(M,ℒ).

Its API:

- V_(M,ℒ) is the θ-preimage of C⊗ℒ in X⁺_st(M); its dimension is two and it is absolutely irreducible.
- Hom_(G_ℚ_p)(V_(M,ℒ), X⁺_st(M)) is one-dimensional over L.
- A finite extension L′/L transports M, ℒ and V_(M,ℒ) compatibly.
- Distinct lines give non-isomorphic representations.

**Checks.**

- For fixed M and ℒ ≠ ℒ′, V_(M,ℒ) ≇ V_(M,ℒ′), although both have D_pst ≅ M[−1]. The unfiltered module does not determine V.
- C⊗V_(M,ℒ) ≅ (L⊗C) ⊕ (L⊗C)(1) (CDN20, Remarque 2.8, line 914), so the weights are {0,1}. A construction that returned a character would give a one-dimensional C-semilinear representation.
- The shift M[−1] is witnessed on ℚ_p(1): D_pst(ℚ_p(1)) has φ = p⁻¹, and its shift [1] has φ = 1. Dropping the shift would identify M with D_pst(V) and change every φ-eigenvalue by a factor p.

*Needs:* PadicLocalLanglandsForGL2Qp §§0.2 and 3.8; PadicHodgeTheory §§3.3 and 5.3–5.4.

### 0.4 The normalisation dictionary among the three sources

The base roadmap §6.9(i) parametrises V(π) by ℙ(M_dR(π)) through Π ↦ Fil⁰D_dR(V(Π)), where M(π) comes from the classical correspondence normalised à la Tate. DLB17 writes the de Rham comparison with M*_dR(π) and the orthogonal ℒ^⊥. CDN20 writes it with the geometric module M = D_pst(V)[1], with M_dR and ℒ. Prove the dictionary between them. Let π be supercuspidal with central character ζ and ζ(p) = 1, and let M be the CDN module with LL(M) = π. Then:

- (a) D_pst(V)[1] ≅ M for every V with Π(V) ∈ V(π). The base roadmap §6.9(i) has D_pst(V) ≅ M(π), so M ≅ M(π)[1]: the two modules have the same underlying semilinear G_ℚ_p-module, hence the same M_dR, and φ on M is p times φ on M(π). The classical correspondence of the base roadmap §1.7, which is Colmez's LL_p of COLMEZ19POIDS by the base §4.2, is applied to M(π) = M[−1], and that of CDN20 to M; both give π, so LL(M) = LL_p(M[−1]) for every type M of Conventions (CDN20 line 249).
- (b) Under the identification M_dR ≅ D_dR(V_(M,ℒ)) induced by (a), the line ℒ is Fil⁰D_dR(V_(M,ℒ)). The two parametrisations of V(π) therefore agree.
- (c) The canonical isomorphism M_dR ≅ M*_dR⊗∧²M_dR, v ↦ (w ↦ v∧w), sends ℒ to ℒ^⊥⊗∧²M_dR. When ζ is trivial, the trivialisation of ∧²M_dR fixed by det V = χ turns DLB17's preimage of ℒ^⊥⊗π′ into CDN's preimage of ℒ⊗π′. For nontrivial ζ, ∧²M_dR remains a line carrying the central character and is not trivialised.

Sources: DLB17 line 189 and Théorème 1.4 (DLB17 line 232); CDN20, lines 240–249 and §2.1.5 (lines 917–933); CDN23, Proposition 5.7, footnote 30 (line 2447). The determinant relation and the central character are preserved by each identification.

**Checks.**

- For a basis e₁, e₂ of M_dR and ℒ = Le₁, the map v ↦ (w ↦ v∧w) sends e₁ to the functional that kills e₁ and sends e₂ to e₁∧e₂. So ℒ goes to Le₂*⊗∧²M_dR = ℒ^⊥⊗∧²M_dR. Using ℒ itself in M*_dR would give the wrong preimage.
- Twisting by an unramified character μ with μ(p) = −1 changes ζ by μ² = 1 at p. It leaves the ℒ-dictionary unchanged and multiplies the φ-eigenvalues on M by −1.
- For V = V_(M,ℒ), Fil⁰D_dR(V) is one-dimensional and Fil¹D_dR(V) = 0, since the jumps are −1 and 0. Taking Fil¹ instead of Fil⁰ as the parameter would give the zero space.
- The shift in (a) is seen by central characters. Multiplying φ by p twists the Weil–Deligne representation by an unramified character, so by the twist rule of the base roadmap §1.7, LL_p(M) = LL_p(M(π)[1]) = π⊗(η∘det) for an unramified η with η(p) ∈ {p, p⁻¹}, the exponent being fixed by the reciprocity convention. For trivial ζ its central character is η², with η(p)² ∈ {p², p⁻²}, never 1. So applying the classical correspondence to M itself rather than to M[−1] gives a representation that is not π.

*Needs:* §§0.1 and 0.3; PadicLocalLanglandsForGL2Qp §§1.7, 4.2 and 6.9; CompletedCohomologyAndLocalGlobalCompatibility §6.3 (the supercuspidal case of the base §4.2); PadicHodgeTheory §5.4.

### Examples

For π with trivial central character and the basis (e₁, e₂) of M_dR(π), the lines Le₁ and Le₂ give two non-isomorphic Banach completions Π_(M,Le₁) and Π_(M,Le₂) with the same smooth vectors π. DLB17 locates them by Le₂* and Le₁* in M*_dR, while CDN locates them by Le₁ and Le₂ in M_dR. At p = 7, take the quadratic character ω of 𝔽₇^× extended by ω(7) = 1. A supercuspidal π with central character ω has M ∈ ΦNᵖ. It is not a twist of a representation with trivial central character, since the square of every character of μ₆ has order dividing 3.

### Dependencies

PadicLocalLanglandsForGL2Qp §§0.2, 1.7, 3.8, 4.2 and 6.9; CompletedCohomologyAndLocalGlobalCompatibility §6.3; GL2AutomorphicRepresentationsAndTransfer R16.3; EndoscopicTransferAndUnitaryTraceComparison §§12.4, 12.7, 12.14 and 12.19; SmoothRepresentationsOfLocalGroups SR.0; ProetaleCohomologyOfPAdicCurvesAndTowers §7.1; PadicHodgeTheory §§3.3 and 5.3–5.4.

## Layer 1: Differential equations and P-finite Kirillov models

In Layers 1–2 fix a smooth absolutely irreducible supercuspidal L-representation π of G with trivial central character, ρ = JL(π), and the family V(π) of absolutely irreducible admissible unitary Banach representations Π with Π^lisse ≅ π (base roadmap §6.9). By §0.4, V(π) = {Π_(M,ℒ) : ℒ ∈ ℙ(M_dR)} with V = V_(M,ℒ) absolutely irreducible, de Rham of weights {0,1}, with det V = χ, potentially crystalline and nontrianguline. The general function-space and P-finite definitions of §§1.3–1.4 are stated on their own carriers, the P-finite Kirillov model and infinitesimal action of §1.5, and the Kirillov duality and density of §1.7, for every absolutely irreducible two-dimensional V at every prime, and the weight change of §2.4 for every supercuspidal M, without these hypotheses; the family of π enters §1.5 only as a specialisation, and §1.7 only through its description of the smooth vectors.

### 1.1 The unfiltered equation of a supercuspidal family

PhiGammaModulesAndIwasawaCohomology §5.6a constructs N_rig(V) for each de Rham V, and the base roadmap §4.2a uses it for one M. Here prove the family statements. For V, V′ in the family of π there is an isomorphism N_rig(V) ≅ N_rig(V′), unique up to L^×, compatible with φ, Γ and ∂ = t⁻¹∇. Write N_rig(π) for the common object. For n large, N⁺_dif,n = L_n[[t]]⊗_L M_dR and D⁺_dif,n(V_(M,ℒ)) = tN⁺_dif,n + L_n[[t]]⊗ℒ. Hence tN_rig(π) ⊂ D_rig(V_(M,ℒ)) ⊂ N_rig(π), with the same radius qualification on each term. Prove these from the characterisation of N_rig by its localisations (DLB17, Exemple 6.5, lines 1288–1299, and Exemple 6.6 with Définition 6.7, lines 1335–1345) and from Fil⁰(L_n((t))⊗D_dR(V)) = Σ_i t⁻ⁱL_n[[t]]⊗Fil^iD_dR(V). These are the inclusions used in PhiGammaModulesAndIwasawaCohomology §5.7.

**Checks.**

- The quotient N⁺_dif,n/D⁺_dif,n is L_n⊗(M_dR/ℒ), killed by t. Two distinct lines give the same N⁺_dif,n but distinct D⁺_dif,n.
- For V = V_(M,ℒ), the filtration has Fil⁻¹ = M_dR, Fil⁰ = ℒ and Fil¹ = 0, so Σ_i t⁻ⁱFil^i = tN⁺ + L_n[[t]]ℒ. With jumps 0 and 1 instead, the same formula would give N⁺ + t⁻¹L_n[[t]]ℒ ⊃ N⁺, which is not contained in N⁺.
- For weights {0,k} with k ≥ 2, the same computation gives D⁺ ⊃ t^kN⁺, not tN⁺. The sandwich tN ⊂ D ⊂ N is a weight-{0,1} statement.

*Needs:* PhiGammaModulesAndIwasawaCohomology §5.6a; PadicHodgeTheory §§4.4 and 5.1–5.2; §0.3.

### 1.2 Polynomial injectivity and invertibility of the connection

Let V be absolutely irreducible, two-dimensional and nontrianguline. Prove that P(∇) is injective on D_rig(V) for every nonzero P ∈ L[X] (DLB17, Lemme 6.3, line 1250). The proof has two steps. First prove that the kernel X of P(∇) on D_rig(V) is finite-dimensional over L, by factoring P over a finite extension and bounding ker(∇−a) on each radius stage. Then use φ-stability of X: if X ≠ 0, φ has an eigenvector on D_rig(V) after a finite extension of L, which gives a rank-one (φ,Γ)-submodule and contradicts nontriangulinity. If moreover V is de Rham, prove that ∂ = t⁻¹∇ is bijective on N_rig(V) (DLB17 Proposition 6.4, line 1259). Injectivity: choose h with t^hN_rig(V) ⊂ D_rig(V); then (∇−h)(t^hx) = t^(h+1)∂x, ∇−h is injective on D_rig(V) by the first statement at P = X−h, and t is a non-zero-divisor, so ∂x = 0 forces x = 0. Surjectivity: V̌ is again absolutely irreducible, two-dimensional, de Rham and nontrianguline, so N_rig(V̌)^(∂=0) = 0 by the injectivity just proved, and the perfect residue pairing of PadicDifferentialEquationsAndRigidCohomology §RD.2.43 identifies N_rig(V)/∂N_rig(V) with the L-dual of that kernel. §RD.2.43 supplies the perfect pairing only; the polynomial injectivity its application step quotes is the first statement here. No continuity statement for ∂⁻¹ is asserted. The theorem does not apply to trianguline V.

**Checks.**

- For the rank-one trivial equation R with ∇ = t(1+T)d/dT, P(X) = X kills 1, so the nontrianguline hypothesis cannot be dropped.
- For V trianguline, D_rig(V) contains a rank-one submodule R(δ) with basis e, and ∇e = κ(δ)e, where κ(δ) is the weight of δ. So P(X) = X−κ(δ) kills e ≠ 0, and the injectivity fails.
- For V of weights {0,1}, take h = 1 with tN_rig ⊂ D_rig. Then (∇−1)(tx) = t²∂x, so injectivity of ∂ on N_rig follows from injectivity of ∇−1 on D_rig.

*Needs:* PadicLocalLanglandsForGL2Qp §1.6; PadicDifferentialEquationsAndRigidCohomology §§RD.1.73 and RD.2.43; §1.1.

### 1.3 P-finite vectors and infinite slope

For an L-linear representation Π of P on an L-vector space, define Π^P-fin to be the vectors v such that some power (u(p^n)−1)^k, n, k ≥ 1, kills v and the orbit of v under diag(ℤ_p^×,1) spans a finite-dimensional space. Call v of infinite slope when there are n, k ≥ 1 and m ∈ ℤ with (Σ_(i=0)^(p^n−1) u(i))^k diag(p^m,1)v = 0. Put Π_c^P-fin for the intersection (DLB17, Définition 7.4 and Remarque 7.5, lines 1473–1500). Both conditions use only the action of P and no topology, so the definition applies at every prime to every continuous L-representation of G restricted to P, in particular to a Banach representation Π(V), which is the domain of DLB17 Définition 7.4, and to a locally analytic one. On the Banach objects with supersingular constituents of the base roadmap §4.9, where p ≥ 5, Π_c^P-fin consists of the vectors of that section's compactly supported P-finite space, which is defined by finiteness under diag(ℤ_p^×,1) and the infinite-slope condition alone, that are killed by a power of some u(pⁿ)−1.

Its API is stated for a representation of P on a Hausdorff topological L-vector space with continuous orbit maps x ↦ u(x)v on ℚ_p, which covers Π(V) and its locally analytic vectors. Continuity enters through the compact subgroups u(pⁿℤ_p): if (u(pⁿ)−1)^k w = 0, then for y ∈ ℤ_p the vector u(pⁿy)w equals Σ_(j<k) binom(y,j)(u(pⁿ)−1)^j w, both sides being continuous in y and equal on ℤ.

- Π^P-fin and Π_c^P-fin are P-stable L-subspaces containing 0.
- A P-equivariant L-linear map, in particular a continuous G-map, carries P-finite vectors to P-finite vectors and infinite-slope vectors to infinite-slope vectors.
- Let v ∈ Π^P-fin with (u(pⁿ)−1)^k v = 0. For every b ∈ ℚ_p, (1−u(b))^k v lies in Π_c^P-fin: for every m ≥ −v_p(b) and N ≥ max(1, m+n), (Σ_(i=0)^(p^N−1) u(i))^k diag(p^m,1)(1−u(b))^k v = 0 (DLB17, Remarque 7.5, lines 1500–1519). The route: diag(p^m,1) conjugates u(b) to u(c) with c = p^m b ∈ ℤ_p and carries v to a vector killed by (u(p^N)−1)^k; writing c = c₀+p^N c₁ with c₀ ∈ ℤ, the identity (Σ_(i<p^N) u(i))(1−u(1)) = 1−u(p^N) and the expansion of u(p^N c₁) above make Σ_(i<p^N) u(i)·(1−u(c)) a multiple of u(p^N)−1 on the span of the u(i)(u(p^N)−1)^j diag(p^m,1)v, i ∈ ℤ, j < k, so its k-th power is zero there.

**Checks.**

- The zero vector satisfies both conditions.
- The passage to infinite slope has content only for b of small valuation. For N ≥ n, (1−u(p^N))^k v = 0, since u(p^N)−1 = (u(pⁿ)−1)·Σ_(j<p^(N−n)) u(jpⁿ); a form of the third API bullet for b = p^N alone would assert only that 0 lies in Π_c^P-fin. In LP_c(ℚ_p^×, L_∞)^Γ of §1.4 (X = L_∞, killed by t), take φ supported on ℤ_p^× with φ(1) ∈ L_r nonzero. It is P-finite with n = k = 1, since ε is trivial on ℤ_p and the ℤ_p^×-orbit of φ is determined by the finite Γ-orbit of φ(1). For b = p⁻¹, (1−u(p⁻¹))φ is x ↦ (1−ε(x/p))φ(x), which is nonzero at x = 1 because ε(1/p) is a primitive p-th root of unity ζ_p. With m = 1 and N = 2, diag(p,1)(1−u(p⁻¹))φ is supported on p⁻¹ℤ_p^×, where Σ_(i<p²) ε(ix) = p·Σ_(i=0)^(p−1) ζ_p^(iu) = 0 for u ≡ px mod p, u ≢ 0. So the vector is nonzero and of infinite slope.
- A nonzero vector v of the trivial representation is P-finite but not of infinite slope: the trace Σ_(i<p^n) u(i) acts by p^n, so its k-th power sends v to pⁿᵏv ≠ 0.
- For the Kirillov models of §1.4, a function supported on a single valuation shell is of infinite slope. A function with nonzero values on infinitely many shells accumulating at 0 is not in Π_c^P-fin.

*Needs:* PadicLocalLanglandsForGL2Qp §§0.1 and 1.1.

### 1.4 Locally polynomial Kirillov function spaces

For an L_∞[[t]]-module X with a semilinear action of Γ on which t is locally nilpotent, every element being killed by some power of t, as for D⁻_dif(V) = colim_n D⁺_dif,n[1/t]/D⁺_dif,n, define LP(ℚ_p^×, X)^Γ. Its elements are the functions φ: ℚ_p^× → X with φ(ax) = σ_a(φ(x)) for a ∈ ℤ_p^× whose support has compact closure in ℚ_p; zero may be a limit point of the support. Define LP_c(ℚ_p^×, X)^Γ by requiring compact support in ℚ_p^×. Let (a b; 0 1) act by φ ↦ (x ↦ ε(bx) e^tbx φ(ax)), where ε is the additive character of ℚ_p fixed by the chosen p-power roots of unity (DLB17 lines 1531–1534). The exponential is a finite sum on each value because that value is killed by a power of t (DLB17 lines 1522–1534).

Its API:

- A Γ-equivariant function is determined by its values φ(p^j), j ∈ ℤ, and evaluation identifies LP_c(ℚ_p^×, X)^Γ with ⊕_(j∈ℤ) X.
- LP_c ⊂ LP is a P-stable inclusion. It is not surjective as soon as X ≠ 0.
- A Γ-equivariant map X → X′ commuting with t induces a P-equivariant map on LP and LP_c.
- The formula defines a left action of P.

**Checks.**

- A Γ-equivariant function supported on p^jℤ_p^× has exactly one nonzero valuation coordinate.
- Fix x ≠ 0, put φ(p^j) = x for j ≥ 0 and φ(p^j) = 0 for j < 0, and extend by φ(p^ja) = σ_ax for a ∈ ℤ_p^×. Then φ(bp^ja) = σ_(ba)x = σ_bφ(p^ja), and the support has closure ℤ_p, compact in ℚ_p but not in ℚ_p^×. Thus φ lies in LP and not LP_c. For X = L_∞ with t = 0, choose x = ζ_(p^m) moved by σ_a (m ≥ 2 when p = 2): a constant value on a shell would give x ≠ σ_ax and fail Γ-equivariance.
- Differentiating the action of u(b) at b = 0 multiplies φ(x) by tx. With the opposite order of the matrix factors the derivative of the a-action would be wrong by the sign of the Lie bracket.
- No single power of t kills D⁻_dif(V): for a basis vector e of D⁺_dif,n(V) and j ≥ 1 the class of t⁻ʲe is killed by tʲ and not by tʲ⁻¹. A hypothesis "killed by a fixed power of t" would exclude the module the construction is made for, while local nilpotence keeps e^(tbx)φ(x) a finite sum.

*Needs:* PadicHodgeTheory §4.4; PadicLocalLanglandsForGL2Qp §1.2.

### 1.5 The P-finite Kirillov model and the infinitesimal action

Let p be any prime, V an absolutely irreducible two-dimensional continuous L-representation of G_ℚ_p and Π(V) the admissible unitary Banach representation of G attached to it by the base roadmap §3.8, with Π(V)^P-fin and Π(V)_c^P-fin as in §1.3. Put D⁻_dif(V) = colim_n D⁺_dif,n(V)[1/t]/D⁺_dif,n(V). Prove that Π(V)^P-fin and Π(V)_c^P-fin are P-stable, construct the canonical P-equivariant injection v ↦ φ_v: Π(V)^P-fin → LP(ℚ_p^×, D⁻_dif(V))^Γ, and prove that it restricts to an isomorphism Π(V)_c^P-fin ≅ LP_c(ℚ_p^×, D⁻_dif(V))^Γ (DLB17, §7.3 and Proposition 7.6, lines 1472 and 1535–1543). This extends the base roadmap §4.1k, which treats the P-algebraic vectors of almost de Rham V only.

Let a, b be the generalized Hodge–Tate weights of V, the roots of the characteristic polynomial of its Sen operator, and k = a+b. Prove that U(gl₂) acts on D_rig(V) by a⁺ = ∇, a⁻ = k−1−∇, u⁺ = t and u⁻ = −t⁻¹(∇−a)(∇−b), with Casimir ((a−b)²−1)/2 (DLB17, Théorème 7.3, line 1460). Since (∇−a)(∇−b) = ∇² − k∇ + ab and (a−b)² = k² − 4ab, these operators involve only the trace k and the determinant ab of the Sen operator, which lie in L, so no coefficient extension splitting the Sen polynomial is needed. For V in the family of π the weights are {0,1}, so a⁻ = −∇ and u⁻ = −t∂² with ∂ = t⁻¹∇ on D_rig(V)[1/t]; §§1.7, 2.2, 2.4 and 3.2 use this specialisation. The route takes the analytic-vector exact sequence of the base §3.11, Colmez's P-finite expansion, and the Sen operator for the Lie action; it does not use nontriangulinity or the de Rham property.

**Checks.**

- At (a,b) = (0,1), the Casimir is ((0−1)²−1)/2 = 0. Also (∇−0)(∇−1) = t²∂², so u⁻ = −t⁻¹t²∂² = −t∂², not −∂²t.
- For V₀ in the family of π, V₀(1) = V₀⊗χ is absolutely irreducible of weights {1,2} with det V₀(1) = χ³, so it lies outside the family and the theorem applies to it. There k = 3, a⁻ = 2−∇, u⁻ = −t⁻¹(∇−1)(∇−2) and the Casimir is ((1−2)²−1)/2 = 0. A statement restricted to the family would exclude it, and the family formula a⁻ = −∇ would be wrong for it by 2.
- If the Sen polynomial of V is X² − c with c ∈ L not a square, then a, b = ±√c do not lie in L, but k = 0 and ab = −c, so a⁻ = −1−∇, u⁻ = −t⁻¹(∇² − c) and the Casimir is (4c−1)/2, all with coefficients in L.
- For a P-finite vector in the image of the base roadmap's P-algebraic model, φ_v agrees with the P-algebraic Kirillov model of the base roadmap §4.1k. A second normalisation of the exponential would disagree already on u(b) at b = 1.
- The zero vector maps to the zero function. By injectivity, a vector with zero Kirillov function is zero.

*Needs:* §§1.3–1.4; PadicLocalLanglandsForGL2Qp §§3.1, 3.8, 3.11 and 4.1k; PadicHodgeTheory §4.4; LocallyAnalyticRepresentationsOfLocalGroups §§0.3 and 0.5.

### 1.6 The differential residue pairing

The pairing V̌×V → L(1) gives ⟨ , ⟩: D⁺_dif(V̌)[1/t] × D⁺_dif(V)[1/t] → L_∞((t))dt, where dt is the canonical basis of ℚ_p(1). Define {ž, z}_dif = lim_n p⁻ⁿ res₀ Tr_(L_n((t))/L((t))) ⟨σ_(−1)(ž), z⟩, with res₀(Σ a_n t^n dt) = a_(−1) (DLB17 lines 1550–1564). Prove the following:

- It is a perfect Γ-equivariant pairing, and for n large the orthogonal of D⁺_dif,n(V̌) is D⁺_dif,n(V) (DLB17, Proposition 7.7(a), line 1565).
- For every de Rham V, the orthogonal of N⁺_dif,n(V̌) is tN⁺_dif,n(V). Indeed N⁺_dif(V) = L_∞[[t]]⊗D_dR(V) and N⁺_dif(V̌) = L_∞[[t]]⊗D_dR(V)*⊗t⁻¹dt. A product therefore lies in tᵐ⁻¹L_∞[[t]]dt when the second factor lies in t^mN⁺, and its residue vanishes for all partners exactly when m ≥ 1.

The source prints t^kN⁺ for weights {0,k} (source correction E4). The two agree only at k = 1, which is the case used here.

Its API:

- The pairing is the normalised trace of the residue of the σ_(−1)-adjusted product, and is independent of n.
- D⁺_dif is its own annihilator under the determinant identification when det V = χ.
- (N⁺_dif(V̌))^⊥ = tN⁺_dif(V) for every de Rham V.

**Checks.**

- For V = L, V̌ = L(1) and N⁺(V̌) = L_∞[[t]]t⁻¹dt. The residue of f·g·t⁻¹dt is the constant term of fg, so the orthogonal of N⁺(V̌) is tL_∞[[t]] = tN⁺(L).
- For weights {0,2}, te ∈ tN⁺(V) pairs to residue zero with every element of N⁺(V̌), but te ∉ t²N⁺(V). So the printed t^k fails at k = 2.
- Only products of total t-exponent −1 contribute. A pairing without the normalisation p⁻ⁿ would change by the factor p when n increases by one.

*Needs:* §1.1; PadicLocalLanglandsForGL2Qp §1.3; PadicHodgeTheory §4.4.

### 1.7 Kirillov duality and the smooth-vector criterion

Let V be absolutely irreducible and two-dimensional, as in §1.5. Prove first that Π(V)_c^P-fin ⊂ Π(V)^an, so that u⁺ and a⁺ act on it (DLB17, Théorème 7.8, line 1581, stated there for every two-dimensional V of its §7.1, line 1426). By the analytic-radius exact sequence of the base roadmap §3.11, there is an index m(V) such that every element z of the image of (Π(V)^an)′_b in D_rig(V̌)⊠ℙ¹ has Res_ℤ_p(z) and Res_ℤ_p(wz) in D^(]0,r_m(V)])(V̌) (DLB17 lines 1572–1576). For n ≥ m(V) and j ∈ ℤ, put i_(j,n) = φ⁻ⁿ∘Res_ℤ_p∘diag(pⁿ⁻ʲ,1): (Π(V)^an)′_b → D⁺_dif,n(V̌). For n ≥ m(V), v ∈ Π(V)_c^P-fin and ℓ ∈ (Π(V)^an)′_b, prove {ℓ, v}_ℙ¹ = Σ_(j∈ℤ) {i_(j,n)(ℓ), φ_v(p⁻ʲ)}_dif (DLB17, Théorème 7.8, lines 1576–1586). The route compares Colmez's global pairing on D_rig⊠ℙ¹ (base §3.11) with the shell sum by trace–residue compatibility (§1.6).

Prove also, for every such V, that no nonzero vector of Π(V)^P-fin is fixed by the whole upper unipotent subgroup u(ℚ_p). For v with Kirillov function φ = φ_v, fixedness under every u(b) gives (ε(bx)e^(tbx) − 1)φ(x) = 0 for all b and x. For b ≠ 0 with bx ∈ ℤ_p the character ε(bx) is 1 and e^(tbx) − 1 = tbx·(1 + tbx/2 + ⋯) with the second factor invertible on the t-power-torsion module, so tφ(x) = 0; then every b gives (ε(bx) − 1)φ(x) = 0, and bx = p⁻¹ gives ε(bx) = ζ_p ≠ 1, so φ(x) = 0 and v = 0 by the injectivity of §1.5. The smooth, L_∞-valued case is DLB17 line 2633.

For every such V that is not trianguline, at every prime p, prove that ∩_(n≥1)φⁿ(D_rig(V̌)) = 0 (COLMEZ14LA, Théorème 3.23(i), line 2032), that Π(V)_c^P-fin is dense in Π(V)^an, and that ∩_(j≥0)(u⁺)^j(Π(V)^an)′_b = 0 (DOSPINESCU12THESE, Théorème 8.4.3 and Remarque 8.4.4, lines 3378–3379 and 3409–3410). The base roadmap §4.9 states the density for p ≥ 5 and supersingular Banach objects; here it is stated at every prime. The route for the density (DOSPINESCU12THESE, proofs of Proposition 8.4.1 and Théorème 8.4.3, lines 3346–3358 and 3380–3385): if ℓ ∈ (Π(V)^an)′_b vanishes on Π(V)_c^P-fin and n ≥ m(V), the duality formula makes i_(0,n)(ℓ) orthogonal to φ_v(1) for every v ∈ Π(V)_c^P-fin whose Kirillov function is supported on ℤ_p^×; these values run through all of D⁻_dif(V) (§§1.4–1.5), so the perfectness of §1.6 gives i_(0,n)(ℓ) = 0. Since φ⁻ⁿ is injective on D^(]0,r_n])(V̌), ℓ restricts to zero on p⁻ⁿℤ_p for every n ≥ m(V), hence on every compact open subset of ℚ_p. So the image of ℓ in D_rig(V̌)⊠ℙ¹ is supported at ∞: the ℤ_p-restriction of its Weyl transform lies in ∩_(n≥1)φⁿ(D_rig(V̌)), which is 0 for non-trianguline V (COLMEZ14LA, Théorème 3.23(i)), and ℓ = 0. The vanishing follows from the density: a vector v ∈ Π(V)_c^P-fin with (u(pⁿ)−1)^k v = 0 has (u⁺)^k v = 0, because x ↦ u(pⁿx)v is a polynomial of degree less than k on ℤ_p (§1.3), and ℓ = (u⁺)^kℓ_k kills it, since (u⁺ℓ_k)(v) = −ℓ_k(u⁺v) (Conventions); so every element of the intersection vanishes on a dense subspace. For a supercuspidal type M of any central character and any line ℒ, V_(M,ℒ) is not trianguline, because WD(M) is irreducible, and the vanishing passes to the u⁺-stable closed subspace (Π^an_(M,ℒ)/LL(M))′_b; §§3.3 and 7.5 use this. For trivial central character it is DLB17 Remarque 11.11 and the proof of Théorème 1.10 (lines 2707–2709 and 2797–2803). The argument does not pass through infinite t-divisibility, so the fixed-radius issue of source correction E9 does not arise in it.

For V in the family of π, prove the following description of the smooth vectors (DLB17, Proposition 7.9 and Théorème 7.11, lines 1593–1618):

- The P-smooth vectors of infinite slope, ker u⁺ ∩ ker a⁺ ∩ Π(V)_c^P-fin, are contained in π.
- Under §1.5 they correspond to LP_c(ℚ_p^×, N⁺_dif(V)/D⁺_dif(V))^Γ.
- Conversely π = {v ∈ Π(V)^an : u⁺v = a⁺v = 0} = ker u⁺ ∩ ker a⁺ ∩ Π(V)_c^P-fin, so v ↦ φ_v restricts to a P-isomorphism π ≅ LP_c(ℚ_p^×, N⁺_dif(V)/D⁺_dif(V))^Γ (DLB17, Théorème 7.11, lines 1615–1618).

After a choice of basis of the line M_dR/ℒ, the coefficient module N⁺_dif(V)/D⁺_dif(V) = L_∞⊗(M_dR/ℒ) of §1.1 becomes L_∞ with its Γ-action, and u(b) acts by multiplication by ε(bx) because t kills the coefficients. So this realisation of π is the smooth Kirillov realisation of GL2AutomorphicRepresentationsAndTransfer R16.2.8 for the additive character ε, and it is not constructed again here.

The route for the converse (DLB17 lines 1619–1642): let v ∈ Π(V)^an with u⁺v = a⁺v = 0. Its orbit maps under u(ℚ_p) and diag(ℤ_p^×,1) have zero derivative, hence are locally constant, so v is P-finite. For x ∈ ℚ_p, v_x = u(x)v − v is killed by u⁺ and, since a⁺u(x) = u(x)(a⁺ + xu⁺), by a⁺; it has infinite slope by §1.3, so v_x ∈ π by the first bullet and u⁻v_x = 0. As u⁻u(x) = u(x)(u⁻ − xh − x²u⁺) with h = a⁺ − a⁻, and h = 2a⁺ because a⁺ + a⁻ = k − 1 = 0 at weights {0,1} (§1.5), this gives (u(x) − 1)u⁻v = 0 for every x. The vector u⁻v is P-finite, since a⁺u⁻v = −u⁻v, so it is 0 by the statement on vectors fixed by u(ℚ_p). Thus gl₂ kills v, and v is smooth (LocallyAnalyticRepresentationsOfLocalGroups §§0.3 and 0.5), so v ∈ π. Finally π ⊂ Π(V)_c^P-fin: π is supercuspidal, so its Jacquet module along u(ℚ_p) vanishes (SmoothRepresentationsOfLocalGroups SR.3a.1) and π is spanned by the vectors (1 − u(b))v′, v′ ∈ π, which have infinite slope by §1.3. §3.2 uses the converse.

**Checks.**

- The nonzero trivial representation is P-smooth and killed by u⁺ and a⁺ but not of infinite slope (§1.3). Without the infinite-slope condition the criterion would wrongly include it.
- For v supported on one shell p^jℤ_p^×, the sum has one nonzero term.
- For the zero functional the sum vanishes term by term.
- The inclusion is into Π(V)^an, not into π. Take v ∈ Π(V)_c^P-fin whose Kirillov function is supported on ℤ_p^× with φ_v(1) the class of t⁻²e, e a basis vector of D⁺_dif,n(V) (§1.5). For N ≥ 0, ε(p^N) = 1, so (u(p^N)φ_v)(1) − φ_v(1) = (e^(tp^N) − 1)·t⁻²e = p^N·t⁻¹e modulo D⁺_dif,n(V), which is nonzero (§1.4, Checks). So v is fixed by no u(p^Nℤ_p), is not smooth, and lies in Π(V)^an outside π. It also has u⁺v ≠ 0, since t·t⁻²e = t⁻¹e ∉ D⁺_dif,n(V), so the converse does not put it in π.
- The density needs non-triangulinity. For trianguline V̌ with a triangulation by R(δ₁), basis e₁, the Weyl transform of e₁ (or of t^(w(δ₂)−w(δ₁))e₁ when w(δ₁) − w(δ₂) is a negative integer) lies in every (u⁺)^j(Π(V)^an)′_b (DOSPINESCU12THESE lines 3386–3408), so the vanishing, and with it the density, fails. Also ∩_(n≥1)φⁿ(R) contains t, since φ(t) = pt (COLMEZ14LA line 2039), so a rank-one submodule R(δ₁) makes ∩_(n≥1)φⁿ(D_rig(V̌)) nonzero.
- The vanishing is a statement about the whole intersection, not about a G-stable subspace of it, and the intersection is not G-stable in general. On O(Ω), where u⁺ = −d/dz, the function z has the primitives z^(j+1)/(j+1)! and lies in every (d/dz)^jO(Ω), while w·z = 1/z has no primitive even on the annulus |p| < |z| < 1 contained in Ω, its Laurent coefficient of z⁻¹ being 1. So the two-chart argument of the base §6.9, which applies to a G-stable kernel through its Weyl transforms, does not give the vanishing of §7.5.
- The step from density to vanishing is exact: for v with (u(pⁿ)−1)²v = 0, u(pⁿx)v = v + x(u(pⁿ)−1)v for x ∈ ℤ_p is of degree one in x, so (u⁺)²v = 0, and ((u⁺)²ℓ)(v) = ℓ((u⁺)²v) = 0 for every ℓ. A functional that is not in the image of u⁺, such as one nonzero on a vector killed by u⁺, is not constrained by this.

*Needs:* §§1.3–1.6; PadicLocalLanglandsForGL2Qp §§0.1 and 3.11; LocallyAnalyticRepresentationsOfLocalGroups §§0.3 and 0.5; SmoothRepresentationsOfLocalGroups SR.3a.1; GL2AutomorphicRepresentationsAndTransfer R16.2.8.

### Examples

In weights {0,1}, with ℒ = Le₁ in M_dR = Le₁⊕Le₂, N⁺_dif/D⁺_dif = L_∞⊗(M_dR/Le₁) is spanned by the image of e₂ and killed by t. The P-smooth Kirillov functions of infinite slope then take values in this one-dimensional L_∞-space.

### Dependencies

Layer 0; PadicLocalLanglandsForGL2Qp §§0.1, 1.1–1.3, 1.6, 3.1, 3.8, 3.11 and 4.1k; PhiGammaModulesAndIwasawaCohomology §5.6a; PadicHodgeTheory §§4.4 and 5.1–5.2; PadicDifferentialEquationsAndRigidCohomology §§RD.1.73 and RD.2.43; LocallyAnalyticRepresentationsOfLocalGroups §§0.3 and 0.5; SmoothRepresentationsOfLocalGroups SR.3a.1; GL2AutomorphicRepresentationsAndTransfer R16.2.8.

## Layer 2: The common embedded dual and homographic covariance

The base roadmap supplies the G-module tN_rig(π)⊠ℙ¹ (its §4.2a, independent of the line), the abstract analytic quotient (§4.11), and the coordinate operator ∂ on Π(π,0)′_b with its O(Ω)-module structure (§6.9). This layer proves the embedded, covariant and irreducibility refinements, and Colmez's weight change, which Layer 7 uses for the weighted realisation. Within the layer the order of proof is §2.1, §2.2, §2.4, §2.3: the irreducibility and the absence of smooth vectors in §2.3 are read off the exact sequences of §2.4(ii) at k = 1, and §2.4 uses only Layers 0–1.

### 2.1 The common embedded analytic dual

For V in the family of π, write B_V = (Π(V)^an/π)′_b with its canonical embedding into D_rig(V̌)⊠ℙ¹. Prove the following (DLB17, Proposition 8.2, Théorème 8.3 and Théorème 8.6, lines 1661–1690 and 1828):

- The image of B_V lies in tN_rig(π)⊠ℙ¹. At an admissible fixed radius r_m(V) it lies in the corresponding lattice of tN_rig^(]0,r_m]).
- Under the identifications of §1.1 these images are equal for all V in the family. Write E_π for this common closed subspace with its Fréchet topology, so that (E_π)′_b is isomorphic, for every V, to the base roadmap's analytic quotient Π(π,0) = Π(V)^an/π (base §6.9); below Π(π,0) is identified with (E_π)′_b.
- Restriction to ℤ_p identifies the diag(p,1)-fixed vectors of E_π with tN_rig(π)^(ψ=1). Restriction to ℤ_p^× has image (1−φ)tN_rig(π)^(ψ=1).

The injectivity of Res_ℤ_p on these fixed vectors uses the Weyl chart and D_rig^(φ=1) = 0, from the injectivity of 1−φ in PhiGammaModulesAndIwasawaCohomology §5.7. It is not a consequence of the restriction relation alone (source correction E5). Equality of images is proved by comparing two stable integral lattices: p^n-rescaled pairings tend to 0, and a dense Lie-generated subspace with the annihilator of §1.6 forces the two closed images to agree.

**Checks.**

- The statement is an equality of subspaces of tN_rig(π)⊠ℙ¹ with their topologies. An abstract isomorphism B_V ≅ B_V′, which is the base §4.11, does not imply it.
- A section of tN_rig(π)⊠ℙ¹ with zero restriction to ℤ_p and zero restriction of its Weyl transform is zero, by gluing the two charts. For a section of the sheaf, vanishing of the ℤ_p-restriction alone does not imply this: the Weyl transform of a nonzero section supported on pℤ_p is supported on w(pℤ_p) = ℙ¹∖ℤ_p.
- Lines Le₁ ≠ Le₂ give different Π(V)^an but the same E_π.

*Needs:* §§1.1, 1.2, 1.6 and 1.7; PadicLocalLanglandsForGL2Qp §§3.11, 4.2a and 4.11; PhiGammaModulesAndIwasawaCohomology §§2.4 and 5.7.

### 2.2 Homographic covariance of the coordinate operator

Let ∂ be the coordinate operator on E_π of the O(Ω)-module structure of the base roadmap §6.9, characterised by a⁺−1 = u⁺∂. Prove the following on E_π (DLB17, Proposition 9.6, Théorème 9.7 and Lemme 9.8, lines 1946–1980):

- ∂u⁺ − u⁺∂ = 1, a⁺ = ∂u⁺ and u⁻ = −∂²u⁺.
- For g = (a b; c d) ∈ G, a−c∂ is a continuous automorphism of E_π, g∂g⁻¹ = (d∂−b)(a−c∂)⁻¹, and gu⁺g⁻¹ = (det g)⁻¹(a−c∂)²u⁺.

The route proves g∂g⁻¹(a−c∂) = d∂−b on Bruhat generators. A right inverse comes from the same identity applied to g⁻¹. The identity for g alone gives only a one-sided inverse (source correction E7).

**Checks.**

- For w = (0 1; 1 0): det w = −1 and (0−∂)² = ∂², so w∂w = (−1)(−∂)⁻¹ = ∂⁻¹ and wu⁺w = −∂²u⁺. On O(Ω), with (wf)(z) = f(1/z) and u⁺f = −f′, the composite w u⁺ w sends f to z²f′, and −∂²u⁺f = −z²(−f′) agrees.
- For u(b) = (1 b; 0 1), u(b)∂u(b)⁻¹ = ∂−b. On functions this is z ↦ z−b.
- For aI₂ the conjugation factor is (a²)⁻¹a² = 1, consistent with the trivial central character.

*Needs:* §§1.5 and 2.1; PadicLocalLanglandsForGL2Qp §6.9 (the O(Ω)-module structure); LocallyAnalyticRepresentationsOfLocalGroups §§0.3 and 0.5.

### 2.3 Topological irreducibility of Π(π,0)

Prove that Π(π,0) is topologically irreducible as a locally analytic G-representation. Equivalently, E_π has no nonzero proper closed G-stable subspace. Write M° = D_pst(V) = M(π) = M[−1] for V in the family (§0.4(a)), the module in Colmez's normalisation. Colmez proves that Π(M°,−k) is irreducible for every absolutely irreducible M° and k ≥ 1 (COLMEZ19POIDS, Théorème 0.3(ii), line 179). By COLMEZ19POIDS Théorème 0.6(iii) at k = 1 (lines 234–236), with Π(V)^an = Π(D_rig(V)) (Remarque 0.2(i), line 154), Π(V)^an is an extension of Π(M°,−1)⊗det by LL_p(M°) = π when V has weights {0,1}. Remarque 0.2(ii) (lines 161–166) states this extension without the twist by det (source correction E25). Hence Π(π,0) ≅ Π(M°,−1)⊗det, which §2.4 writes Π(M,−1)⊗det, and which is irreducible exactly when Π(M°,−1) is. DLB17 Remarque 1.8 (line 410) records this result. Transport it to E_π by the anti-equivalence of the base roadmap §0.1. The same argument shows that Π^an_(M,ℒ)/LL(M) ≅ Π(M,−1)⊗det is topologically irreducible for every supercuspidal type M and line ℒ ⊂ M_dR, with no condition on the central character (§2.4(ii)).

Prove also that Π(V)^an/π has no nonzero smooth vector for V in the family of π, and that Π^an_(M,ℒ)/LL(M) has none for every supercuspidal type M and line ℒ; DLB17 leaves this as an exercise (line 1207). The route: a vector of a locally analytic representation is smooth exactly when gl₂ kills it, as in §3.1 (LocallyAnalyticRepresentationsOfLocalGroups §0.3), so the smooth vectors of Q = Π(V)^an/π form a closed G-stable subspace, which by irreducibility is 0 or Q. If it were Q, then u⁺ would map Π(V)^an into π, which u⁺ kills, so (u⁺)² = 0 on Π(V)^an and on its strong dual, which embeds G-equivariantly, up to a determinant twist that does not change u⁺, into D_rig(V̌)⊠ℙ¹ (base roadmap §3.11(ii)). There u(b), b ∈ ℤ_p, acts on D_rig(V̌)⊠ℤ_p by multiplication by (1+T)^b (base roadmap §3.1), so Res_ℤ_p∘(u⁺)² = t²·Res_ℤ_p, and t is injective on the free Robba module D_rig(V̌). Hence Res_ℤ_p and Res_ℤ_p∘w vanish on the G-stable image of the dual, which is therefore 0; but Π(V)^an is dense in Π(V) ≠ 0 (base roadmap §0.1). §§3.1(a) and 3.3 use this.

**Checks.**

- The statement concerns the G-action alone. It is stronger than the irreducibility of O(Σ_r)^ρ as an O(Ω)[G]-semilinear module used for surjectivity in the base §6.9.
- Π(V)^an itself is reducible, with the smooth subrepresentation π. Irreducibility is a property of the quotient, not of Π(V)^an.
- For a trianguline V, Π(V)^an has a different Jordan–Hölder pattern (COLMEZ19POIDS, Remarque 0.2(ii), lines 158–160). The theorem is not asserted there.
- The smooth-vector statement fails before the quotient: the smooth vectors of Π(V)^an are π ≠ 0, a nonzero proper closed G-stable subspace, and those of Π(V)^an/π are 0. Irreducibility of the quotient is what excludes a smooth subspace there.
- The derivative step: on D_rig(V̌)⊠ℤ_p, (u(p^N) − 1)z = ((1+T)^(p^N) − 1)z, and (1+T)^(p^N) − 1 = exp(p^Nt) − 1 = p^Nt + p^(2N)t²/2 + ⋯, so p⁻ᴺ(u(p^N) − 1) tends to multiplication by t as N → ∞, and u⁺ acts as t, as in §1.5. Since t² ≠ 0 kills no nonzero element of D_rig(V̌), (u⁺)² = 0 forces the ℤ_p-restriction to vanish.

*Needs:* §§2.1 and 2.4; PadicLocalLanglandsForGL2Qp §§0.1, 3.1, 3.11 and 4.11; LocallyAnalyticRepresentationsOfLocalGroups §0.3.

### 2.4 Weight change

Let M be a supercuspidal type as in Conventions and M° = M[−1] its module in Colmez's normalisation, that of the base roadmap §1.7 (§0.4(a)). Thus M° = D_pst(V_(M,ℒ)) for every line ℒ (§0.3), M° = M(π) when LL(M) = π, M° is absolutely irreducible as a (φ,N,G_ℚ_p)-module, and M_dR is the same space for M and M°. Let Δ = Δ(M°) be the (φ,Γ)-module over the Robba ring of Hodge–Tate weights (0,0) with D_pst(Δ) = M°. The objects Δ_(k,ℒ), Π(M,k) and V⁽ᵏ⁾_(M,ℒ) below are Colmez's objects for M°, indexed here by the type M, and Colmez's smooth factor LL_p(M°) is LL(M) of Conventions (§0.4(a)). For LL(M) = π with π as above, Δ is N_rig(π) of §1.1. Put ω = (x|x|)⁻¹det Δ, and write ⊗δ for the twist by δ∘det. For k ≥ 1 and a line ℒ ⊂ M_dR, let Δ_(k,ℒ) be the de Rham (φ,Γ)-module of weights (0,k) with t^kΔ ⊂ Δ_(k,ℒ) ⊂ Δ attached to ℒ, so that Δ/Δ_(k,ℒ) ≅ R/t^kR (COLMEZ19POIDS lines 205–211). Then det Δ_(k,ℒ) = x^k·det Δ. Since Δ_(k,ℒ) is not trianguline, it has no rank-one sub-(φ,Γ)-module, so it is étale exactly when det Δ_(k,ℒ)(p) = p^k·det Δ(p) is a unit; this holds for at most one k, and Δ_(k,ℒ) is in general not the (φ,Γ)-module of a Galois representation. Let δ_k be the unramified character of ℚ_p^× with δ_k(p)² = (p^k·det Δ(p))⁻¹, after enlarging L by this square root. Then Δ_(k,ℒ)⊗δ_k is étale, and Δ_(k,ℒ)⊗δ_k = D_rig(V⁽ᵏ⁾_(M,ℒ)) for an absolutely irreducible de Rham representation V⁽ᵏ⁾_(M,ℒ) of weights {0,k}. By COLMEZ19POIDS Remarque 0.2(i)–(ii) (lines 153–162), Π(Δ_(k,ℒ)) = Π(V⁽ᵏ⁾_(M,ℒ))^an⊗δ_k⁻¹. For LL(M) = π as in §1.1, Δ_(1,ℒ) is D_rig of a representation of §0.3, δ_1 = 1 may be taken, and up to the normalisations of §§0.3–0.4 the V⁽¹⁾_(M,ℒ) are the representations V_(M,ℒ′) of §0.3. This subsection does not assume a trivial central character. Prove the following (COLMEZ19POIDS, Théorème 0.6, lines 215–236, and Théorème 0.8, lines 262–271):

- (i) For k ∈ ℤ, Δ extends uniquely to an analytic G-equivariant sheaf U ↦ Δ⊠_(x^kω)U on ℙ¹(ℚ_p) on which the centre acts by x^kω and the Casimir by (k²−1)/2. For k = 1 it is the G-module N_rig⊠ℙ¹ of the base roadmap §4.2a.
- (ii) There are locally analytic representations Π(M,k), k ∈ ℤ, on spaces of compact type, with exact sequences 0 → Π(M,k)′_b⊗x^kω → Δ⊠_(x^kω)ℙ¹ → Π(M,−k)⊗x^k → 0. For k ≥ 1, Π(M,k)^alg = M_dR⊗(LL(M)⊗Symᵏ⁻¹), and for every line ℒ there are exact sequences 0 → Π(M,k)^alg → Π(M,k) → Π(M,−k)⊗x^k → 0 and 0 → ℒ⊗(LL(M)⊗Symᵏ⁻¹) → Π(M,k) → Π(Δ_(k,ℒ)) → 0, where Π(Δ_(k,ℒ)) = Π(V⁽ᵏ⁾_(M,ℒ))^an⊗δ_k⁻¹. Here LL(M) = LL_p(M°) is the smooth factor of the base roadmap §4.2 for D_pst(V) = M° (COLMEZ19POIDS Remarque 0.7(i), lines 237–243).
- (iii) There is a unique topological automorphism ∂ of the space of Π(M,0) with a⁺ = u⁺∂, u⁻ = −∂u⁺∂ and w∘∂ = ∂⁻¹∘w. For (a,c) ∈ ℚ_p²∖{(0,0)}, a−c∂ is a topological automorphism. For k ∈ ℤ and g = (a b; c d), the formula g·_kv = (a−c∂)^k(gv) defines a G-action on this space, and the resulting representation is Π(M,k).

The route (COLMEZ19POIDS lines 244–260): twist the action of G on Δ⊠_ωℙ¹ by (a−cx)^k through the operator of multiplication by x, built from the infinitesimal action and Dospinescu's formula, and identify the algebraic vectors through the Casimir and the base roadmap §§4.2 and 4.11.

**Checks.**

- The central element aI₂ acts on Π(M,k) by a^kω(a), since (a−0·∂)^k = a^k. This agrees with (ii): Π(M,−k) has central character x⁻ᵏω, so Π(M,−k)⊗x^k has x⁻ᵏω·x²ᵏ = x^kω, the central character of Δ⊠_(x^kω)ℙ¹. With (a−c∂)⁻ᵏ in (iii), Π(M,k) would have central character x⁻ᵏω and contradict (ii).
- At k = 1, Π(M,1)^alg = M_dR⊗LL(M) is two copies of π. Its quotient by ℒ⊗π is Π(Δ_(1,ℒ)), which for LL(M) = π is Π(V⁽¹⁾_(M,ℒ))^an, whose smooth vectors (M_dR/ℒ)⊗π ≅ π form one copy, as for every member of V(π). The quotient Π(M,1)/Π(M,1)^alg ≅ Π(M,−1)⊗det is the analytic quotient of §2.3. For π with trivial central character, det Δ_(1,ℒ) = x·det Δ = x|x| gives ω = x⁻¹, and Π(M,−1)⊗det has central character x⁻²·x² = 1.
- The Casimir on Δ⊠_(x^kω)ℙ¹ is (k²−1)/2: it is 0 at k = 1, matching §1.5 at weights (0,1), and −1/2 at k = 0. So the weight-(0,0) sheaf is not the sheaf of §4.2a, and the index k is not a relabelling.
- For LL(M) = π with trivial central character, det Δ = |x| has value p⁻¹ at p. At k = 2, det Δ_(2,ℒ)(p) = p²·p⁻¹ = p is not a unit, so Δ_(2,ℒ) is not étale and is D_rig of no Galois representation. The twist with δ_2(p)² = p⁻¹ gives determinant value p·p⁻¹ = 1, and Δ_(2,ℒ)⊗δ_2 is étale. At k = 1, p·p⁻¹ = 1 and no twist is needed.
- The module is M° = M[−1], not M. For LL(M) = π with central character ζ, ζ(p) = 1, Π(M,1) has central character xω and contains Π(M,1)^alg = M_dR⊗π, of central character ζ, so ω = x⁻¹ζ and det Δ(M°)(p) = (x|x|ω)(p) = p⁻¹. Building Δ from M itself multiplies φ on D_pst by p, hence det Δ(p) by p², giving det Δ(M)(p) = p, ω(p) = p and central character p² at p on Π(M,1), which is not ζ(p) = 1; then Π(M,1)^alg could not be M_dR⊗π.

*Needs:* §§0.3, 0.4, 1.1 and 1.5; PadicLocalLanglandsForGL2Qp §§3.11, 4.2, 4.2a and 4.11; CompletedCohomologyAndLocalGlobalCompatibility §6.3; PhiGammaModulesAndIwasawaCohomology §5.6a; LocallyAnalyticRepresentationsOfLocalGroups §§0.3 and 0.5.

### Examples

On O(Ω) the coordinate operator is multiplication by z. Then a⁺−1 = u⁺∂ reads −zf′−f = −(zf)′, and the conjugation by w sends z to 1/z.

### Dependencies

Layers 0–1; PadicLocalLanglandsForGL2Qp §§0.1, 3.1, 3.11, 4.2, 4.2a, 4.11 and 6.9; CompletedCohomologyAndLocalGlobalCompatibility §6.3; PhiGammaModulesAndIwasawaCohomology §§2.4, 5.6a and 5.7; LocallyAnalyticRepresentationsOfLocalGroups §§0.3 and 0.5.

## Layer 3: Completing the Breuil–Strauch realisation

### 3.1 Discharge of the global hypotheses

Let π be supercuspidal with trivial central character, ρ = JL(π), and r ≥ 1 such that ρ is trivial on K_D(2r) = 1+p^rO_D.

**The function duals of the tower.** Prove first three statements about the tower that both routes below use. They are stated for every level n ≥ 0 of the p-central quotient M^p_n over ℚ_p of EndoscopicTransferAndUnitaryTraceComparison §12.19, so that Σ_r is the case n = 2r, and they hold with the same proof for the finite étale covers Σ_(r,N) of Σ_r used in route (b). For k ∈ ℤ let O(k)(M^p_n) be O(M^p_n) with g = (a b; c d) acting by f ↦ (a−cz)⁻ᵏ·(gf) through the O(Ω)-module structure of O(M^p_n), so that O(2)(M^p_n)⊗det = Ω¹(M^p_n) (DLB17 lines 652–661).

- (Local analyticity.) For every k ∈ ℤ the action of G on the strong dual O(k)(M^p_n)′_b is locally analytic; equivalently, O(k)(M^p_n) is a separately continuous D(G,L)-module. Hence Ω¹(M^p_n), the strict quotient H¹_dR(M^p_n) = Ω¹(M^p_n)/dO(M^p_n) and the ρ-parts of all of these are separately continuous D(G,L)-modules with locally analytic strong duals (DLB17, Théorème 3.2, line 662).
- (Lie action.) gl₂ acts on O(M^p_n) by the continuous derivations of Conventions, u⁺ = −d/dz, a⁺ = u⁺∂+1, a⁻ = −∂u⁺ and u⁻ = −∂²u⁺, where ∂ is multiplication by the coordinate z of Ω, and on O(k)(M^p_n) by a⁺ = u⁺∂+1−k, a⁻ = −∂u⁺ and u⁻ = −∂²u⁺+k∂, with ∂u⁺−u⁺∂ = 1 throughout. On the strong duals, where X ∈ gl₂ acts by ℓ ↦ −ℓ∘X and ∂ by transpose, this gives a⁺ = ∂u⁺, a⁻ = −∂u⁺ and u⁻ = −∂²u⁺ on Ω¹(M^p_n)′_b (DLB17, Lemme 3.5, line 759).
- (Smoothness.) The compactly supported de Rham cohomology H¹_dR,c(M^p_n) := H¹_dR(M^p_n)′_b is a smooth G-representation (DLB17, Proposition 3.6, line 783). Moreover H⁰_dR,c(M^p_n) = H²_dR(M^p_n)′ = 0, and H²_dR,c(M^p_n) = H⁰_dR(M^p_n)′ is finite-dimensional and smooth, G acting on it through det with open kernel. For a smooth absolutely irreducible finite-dimensional ρ of Ǧ with dim ρ ≥ 2, H^k_dR,c(M^p_n)^ρ = 0 for k ≠ 1, and H¹_dR,c(M^p_n)^ρ is smooth.

The route for local analyticity (DLB17 §3.3, lines 665–749): M^p_n is Stein, with the covering U_i = τ⁻¹(B_i) by affinoids, where B_i is the ball of radius i about the standard vertex of the Bruhat–Tits tree and τ is the period map followed by the retraction of Ω onto the tree (EndoscopicTransferAndUnitaryTraceComparison §§12.4–12.5; DLB17 lines 647–651); U_i is stable under G_i = 1+pⁱM₂(ℤ_p), which fixes every vertex at distance at most i from the origin. The finite étale map U_i → U_(0,i) to level zero makes the action of G_i on the Banach space O(U_i) differentiable, each X ∈ gl₂ acting by the unique continuous derivation extending the one of level zero; the four derivations are Lipschitz, so the operators X^α are bounded by C^|α|, and for r close to 1 the Banach step D_r(G_i,L), finite free over the closure of U(gl₂) with a basis in ℤ_p[G_i] (LocallyAnalyticDistributionsPartII §§1.5 and 2.2–2.3, with the p-valuation of the supplier contracts), acts continuously on O(U_i). Since D(G₂,L) is the sum of the D(G_i,L)δ_g over the finitely many cosets of G_i in G₂, O(M^p_n) = lim_i O(U_i) is a separately continuous D(G₂,L)-module, and local analyticity of the orbit maps on the open subgroup G₂ gives it on G. Local analyticity of the compact-type strong dual is the anti-equivalence of the base roadmap §0.1 with the strong-dual comparison of LocallyAnalyticDistributions §0.3; the case of every k follows, the twist being by functions of Ω, and so do Ω¹ = O(2)⊗det and the strict quotient H¹_dR (LocallyAnalyticDistributions §0.2). The Lie action formulas are identities between continuous derivations of O(M^p_n) that hold on O(Ω) by Conventions and extend uniquely along the finite étale map to level zero. For smoothness, H¹_dR,c(M^p_n) is the annihilator of dO(M^p_n) in Ω¹(M^p_n)′_b, that is, the kernel of u⁺ there, since u⁺ = −d/dz on Ω¹ = O(M^p_n)dz; each of a⁺ = ∂u⁺, a⁻ = −∂u⁺ and u⁻ = −∂²u⁺ has u⁺ as its right factor, so this kernel is killed by gl₂, and a vector of a locally analytic representation killed by gl₂ is smooth, because its orbit map has vanishing differential at every point, hence is locally constant (LocallyAnalyticRepresentationsOfLocalGroups §§0.3 and 0.5). H²_dR of a Stein curve vanishes, and H⁰_dR(M^p_n) is the finite-dimensional space of locally constant functions, on which G and Ǧ act through det and Nrd (ProetaleCohomologyOfPAdicCurvesAndTowers §7.1).

**Checks.**

- At level zero and on one copy of Ω the derivations are those of Conventions: u⁺z = −1, a⁺z = −z, a⁻z = z and u⁻z = z². A locally constant function is killed by gl₂ and fixed by an open subgroup of G, which is what smoothness requires, but it need not be fixed by G. On the geometric level-zero space, two copies of Ω exchanged by every g with v_p(det g) odd (ProetaleCohomologyOfPAdicCurvesAndTowers §7.1), f = (1, −1) has zero Lie derivatives and is fixed by the open subgroup {g : v_p(det g) even}. But diag(p,1)f = (−1, 1) = −f ≠ f, also at p = 2, since L has characteristic zero. A constant on one copy of Ω, under its natural G-action, is the special case fixed by G. Finally, u⁺ kills no nonconstant function on a connected Stein curve.
- For a point x ∈ Ω(K), K ⊂ C finite over ℚ_p and L ⊇ K, the evaluation functional δ_x ∈ O(Ω)′_b has orbit map g ↦ δ_(gx), whose pairing with f is g ↦ f(gx), a locally analytic function of g; its derivative along u⁺ is f ↦ f′(x), which is 1 on f = z. So δ_x is a locally analytic vector that is not smooth: f(u(b)x) = f(x+b) is not locally constant in b.
- The smoothness statement concerns Ω¹(M^p_n)′_b and not O(M^p_n)′_b. On O(M^p_n)′_b the u⁺-kernel is also H¹_dR(M^p_n)′ as a vector space, the annihilator of (d/dz)O(M^p_n), but a⁺ = ∂u⁺−1 acts on it by −1, so it contains no nonzero vector killed by gl₂. The weight shift by two and the determinant twist in Ω¹ = O(2)⊗det remove the −1.
- At level zero, H¹_dR,c(Ω) is the strong dual of H¹_dR(Ω) ≅ (St^sm)′ (ProetaleCohomologyOfPAdicCurvesAndTowers §6.2), which is St^sm by reflexivity of a countable-dimensional space with its finest locally convex topology: smooth and irreducible. H¹_dR(Ω) itself is not smooth, its smooth vectors forming the countable-dimensional smooth dual of St^sm inside a space of uncountable dimension.
- For ρ = 1 ⊕ 1, dim ρ = 2 but Hom_Ǧ(ρ, 1) = L². Constants on the level-zero components therefore give nonzero degree-two compact-support multiplicity. Absolute irreducibility in the vanishing assertion excludes this example; a higher-dimensional irreducible cannot occur in the Nrd-action on components (ProetaleCohomologyOfPAdicCurvesAndTowers §7.1).
- The affinoid U_i is not G-stable: u(p⁻¹) moves the standard vertex to a vertex at distance two, since p·u(p⁻¹) = (p 1; 0 p) has elementary divisors 1 and p², so it carries B_i to a ball with another centre. The D(G,L)-module structure on O(M^p_n) is assembled from the D(G_i,L)-module structures on the O(U_i) through the finite coset decomposition, not read on one affinoid.

Prove the two global inputs that the base roadmap §6.9 takes as explicit hypotheses:

- (a) For every Π ∈ V(π) there is a nonzero continuous G-map Φ: (Π^an/Π^lisse)′_b → O(Σ_r)^ρ. This is the nonzero-map hypothesis of the base §6.9 (DLB17, Théorème 5.1, line 999).
- (b) dim_L Hom_G(π′_b, H¹_dR(Σ_r)^ρ) = 2 (DLB17, Théorème 4.1, line 804). This is the de Rham datum that the base §6.9 uses for the injectivity of the comparison map and for the de Rham comparison.

With (a) and (b), the function-dual, de Rham and filtration-preimage comparisons of the base §6.9 hold without its global hypotheses; the base's injectivity step rests on gap:fixed-radius-divisibility, which §3.3, proving the same comparisons for every central character trivial on p, does not use. Fix a prime ℓ ≠ p, the definite quaternion algebra B̄ over ℚ of discriminant ℓ, the indefinite algebra of discriminant pℓ, and its Shimura curve Sh_K of level K = K^p(1+p^rO_D), which is the CDN level 2r.

The route for (a) (DLB17 §5.3, lines 1184–1209):

- CompletedCohomologyAndLocalGlobalCompatibility §6.4 gives a weight-two form f on B̄^* with π(f)_p ≅ π⊗ξ∘det for an unramified character ξ, and with r̄_f|G_ℚ_p absolutely irreducible (DLB17, Théorème 5.5 and Lemme 5.6, lines 1071–1113). Twist f by a finite-order global character with component ξ⁻¹ at p, which exists by GL2AutomorphicRepresentationsAndTransfer R16.1.8 since ξ has finite order, before taking isotypic parts (source correction E3). The twist keeps r̄_f absolutely irreducible at p.
- CompletedCohomologyAndLocalGlobalCompatibility §4.9 gives C⁰(X)[𝔭] ≅ Π(𝔭)^(⊕m), m > 0, at the maximal ideal 𝔭 of f (DLB17, Théorème 5.4, line 1063). Its smooth vectors, compared with classical forms by §2.7 there, give Π(𝔭)^lisse ≅ π, so Π(𝔭) ∈ V(π).
- HilbertModularVarietiesAndShimuraCurves §R18.5.21 at level 2r, with §R18.5.16 for the conventions over ℚ, uniformises Sh_K by Σ_r. Prove here its reformulation as an isomorphism of Hecke modules Hom_G(LA(X(K^p))′_b, Ω¹(Σ_r)^ρ) ≅ Ω¹(Sh_K)^ρ, by Frobenius reciprocity on the cocompact groups Γ_i of the uniformisation (DLB17, Théorème 5.7 and Lemmes 5.8–5.10, lines 1119–1173); the null-sequence criterion of Lemme 5.10 is LocallyAnalyticRepresentationsOfLocalGroups §0.8, for the spherically complete field L. At 𝔭 it gives a nonzero G-map Φ₀: (Π(𝔭)^an)′_b → Ω¹(Σ_r)^ρ.
- The restriction of Φ₀ to (Π(𝔭)^an/π)′_b is nonzero: otherwise Φ₀ would factor through a continuous G-map out of π′_b, every vector of which has u⁺-derivative zero because the bounded subsets of π are finite-dimensional, so its image would be killed by u⁺ = −d/dz, which kills only the locally constant differentials, whose ρ-part vanishes (the function duals above). The composite of the restriction with Ω¹ → H¹_dR vanishes: its dual H¹_dR,c(Σ_r)^ρ → Π^an/π goes from a smooth representation (the smoothness above) to one without nonzero smooth vectors (§2.3). So the restriction factors through O(Σ_r)^ρ.
- Pass from Π(𝔭) to every Π ∈ V(π) by §2.1 (DLB17, Théorème 8.8, line 1864).

The route for (b) (DLB17 §4.2, lines 916–996):

- Let N be such that p^N lies in every Γ_i and let Σ_(r,N) be the ℚ_p-model of the quotient of the level-r cover by p^(Nℤ), a finite étale Galois cover of Σ_r with group p^ℤ/p^(Nℤ) (DLB17 line 943). The same uniformisation and the Hochschild–Serre spectral sequences of the coverings Σ_(r,N) → Γ_i\Σ_(r,N), rewritten through the duality H^q_dR(Σ_(r,N)) = H^(2−q)_dR,c(Σ_(r,N))′ and combined by Frobenius reciprocity for the discrete cocompact Γ_i in the category of smooth G-representations, which applies because every H^k_dR,c(Σ_(r,N)) is smooth (the function duals above), give a spectral sequence E₂^(a,b) = Ext^a_G(H²⁻ᵇ_dR,c(Σ_(r,N)), LC(X(K^p))) ⇒ Hᵃ⁺ᵇ_dR(Sh_K) (DLB17 lines 943–969). It is proved here.
- Ǧ acts on the geometric components through Nrd (ProetaleCohomologyOfPAdicCurvesAndTowers §7.1) and dim ρ ≥ 2, so the ρ-parts of H⁰_dR,c and H²_dR,c vanish and the ρ-part gives Hom_G(H¹_dR,c(Σ_r)^ρ∨, LC(X(K^p))) ≅ H¹_dR(Sh_K)^ρ (DLB17 line 981).
- Take π(f)^p-isotypic parts for the twisted form f of (a); this step needs no residual condition (DLB17 footnote 29, line 1008). On the left, LC(X)[π(f)^p] ≅ π by CompletedCohomologyAndLocalGlobalCompatibility §2.7. On the right, the global Jacquet–Langlands correspondence and strong multiplicity one (GL2AutomorphicRepresentationsAndTransfer R17.3) give the partner of π(f) on the indefinite algebra, with component ρ at p, and HilbertModularVarietiesAndShimuraCurves §R18.4.25 makes its eigenspace in H¹ two-dimensional over L after the comparison of de Rham and Betti cohomology of the proper curve.

**Checks.**

- The zero map is continuous and equivariant but does not discharge (a).
- A map constructed for π⊗ξ∘det has Ǧ-sector JL(π)⊗ξ∘Nrd. When this is not isomorphic to ρ, the map does not land in O(Σ_r)^ρ.
- Rescaling Φ by c ∈ L^× gives another valid map; the comparison of the base §6.9 is unique up to this scalar.
- The twist in (a) can be removed: π(f)_p has central character ξ², which is the p-component of the finite-order central character of f, so ξ(p) is a root of unity. An unramified character with ξ(p) not a root of unity is the p-component of no finite-order global character.
- For ρ trivial, the constant functions give H⁰_dR(Σ_r)^ρ ≠ 0 and the degeneration used in (b) fails. It is dim ρ ≥ 2, true for every supercuspidal π, that kills the ρ-parts of H⁰ and H².
- The dimension in (b) is 2, not 1: the eigenspace of the proper curve has Hodge pieces of types (1,0) and (0,1). Counting holomorphic differentials alone gives 1.

*Needs:* §§0.2, 2.1 and 2.3; CompletedCohomologyAndLocalGlobalCompatibility §§2.7, 4.9 and 6.4; HilbertModularVarietiesAndShimuraCurves §§R18.4.25, R18.5.16 and R18.5.21; GL2AutomorphicRepresentationsAndTransfer R16.1.8 and R17.3; PadicLocalLanglandsForGL2Qp §§0.1, 3.3, 3.8 and 6.9; EndoscopicTransferAndUnitaryTraceComparison §§12.4, 12.5, 12.7 and 12.19; ProetaleCohomologyOfPAdicCurvesAndTowers §§6.2 and 7.1; LocallyAnalyticDistributions §§0.2 and 0.3; LocallyAnalyticDistributionsPartII §§1.5 and 2.2–2.3; LocallyAnalyticRepresentationsOfLocalGroups §§0.3, 0.5 and 0.8; SmoothRepresentationsOfLocalGroups SR.0 and SR.2; for the consequence for the base §6.9 only, gap:fixed-radius-divisibility.

### 3.2 The line-independent quotient Kirillov embedding

Localisation and the identifications of §1.1 induce a P-equivariant embedding ι of the u⁺-kernel of Π(V)^an/π into LP(ℚ_p^×, t⁻¹N⁺_dif,∞/N⁺_dif,∞)^Γ. Prove that the embeddings for different V agree up to their comparison scalar (DLB17, Proposition 11.2, Théorème 11.3 and Lemmes 11.4–11.5, lines 2432–2524). The coefficient module t⁻¹N⁺/N⁺ is L_∞(−1)⊗M_dR(π), with Γ acting through χ⁻¹. The target is identified with locally constant L_∞⊗M_dR(π)-valued functions only after the twist of Π(π,2), in which the model takes values in the untwisted coefficient module (DLB17 lines 2449 and 2469–2472). The construction uses the converse of §1.7, π = {v ∈ Π(V)^an : u⁺v = a⁺v = 0}, to write the u⁺-kernel of Π(V)^an/π as the quotient by π of the vectors v ∈ Π(V)^an with (u⁺)²v = 0 and a⁺u⁺v = 0 (DLB17 line 2436). The route compares the pairings on compactly supported functions by Lemme 11.4 and uses their nondegeneracy (Lemme 11.5).

**Checks.**

- γ ∈ Γ acts on the class of t⁻¹e in t⁻¹N⁺/N⁺ by χ(γ)⁻¹. Treating the target as locally constant functions before untwisting gives the wrong Γ-equivariance by this character.
- The embedding is independent of V as an embedded P-module once the scalar is fixed, not merely as an abstract vector space.
- On a vector supported on one shell the Kirillov function has one nonzero coordinate, in t⁻¹N⁺/N⁺.

*Needs:* §§1.1, 1.5, 1.6, 1.7 and 2.1; PadicLocalLanglandsForGL2Qp §6.9.

### 3.3 The realisation for every supercuspidal type in the p-central sector

Let M ∈ ΦNᵖ_n be supercuspidal, π = LL(M) with central character ζ, ζ(p) = 1, and ρ = JL(M). Do not assume that ζ is trivial. Prove the following for n with JL(M) trivial on K_D(n):

- (i) For every ℒ ⊂ M_dR there is a topological G-isomorphism ((L⊗O(M^p_n))[M])′_b ≅ Π_(M,ℒ)^an/π, unique up to L^×. The quotient is independent of ℒ.
- (ii) There is a G-isomorphism (L⊗H¹_dR(M^p_n))[M] ≅ M_dR⊗_L π′_b under which, for every line ℒ ⊂ M_dR, the preimage of ℒ⊗π′_b in (L⊗Ω¹(M^p_n))[M] is (Π_(M,ℒ)^an)′_b; this gives the exact sequences 0 → (L⊗O(M^p_n))[M] → (Π^an_(M,ℒ))′_b → π′_b → 0. These are the L-rational multiplicity spaces, which Layer 4 writes O[M]^(G_ℚ_p) and Ω¹[M]^(G_ℚ_p), not the C-valued O[M] and Ω¹[M] of the geometric fibre. An isomorphism with this property is unique up to L^×: two of them differ by a G-automorphism of M_dR⊗π′_b, which is A⊗id for some A ∈ GL(M_dR) because End_G(π′_b) = L, and A fixes every line of M_dR, hence is a scalar. Without the line condition the isomorphism is unique only up to GL(M_dR).
- (iii) Let ι_HK: (L⊗H¹_dR(M^p_n))[M] ≅ M_dR⊗_L π′_b be the G-isomorphism obtained from the Hyodo–Kato-compatible de Rham isomorphism of ProetaleCohomologyOfPAdicCurvesAndTowers §7.4 by the level reading of §0.2 and by taking G_ℚ_p-invariants, its W_ℚ_p-equivariance extending to G_ℚ_p by density and continuity (CDN20 lines 917–919; CDN23 Lemme 5.5, lines 2411–2416). It is unique up to L^×, because WD(M) is irreducible and so End_(φ,N,G_ℚ_p)(M) = L. Then ι_HK has the line condition of (ii), so it is the isomorphism of (ii) up to L^×.

M_dR and M*_dR are kept distinct; for ζ = 1 the dictionary §0.4(c) recovers the base roadmap §6.9(ii)–(iii).

DLB17 Remarque 1.3(a) (line 159) states that trivial central character is not essential to the argument. CDN23 Proposition 5.7 uses the general case (lines 2438–2448, with footnote 30). The route reruns the base §6.9 and §§2.1–3.2 here with a fixed central character ζ. That needs four inputs:

- the two global inputs (a) and (b) of §3.1 for M. CompletedCohomologyAndLocalGlobalCompatibility §6.4 is stated for a supercuspidal π whose central character is trivial on p up to twist, so it applies to π and gives a form f with π(f)_p ≅ π⊗ξ∘det. Since ζ(p) = 1, ξ(p)² is the value at p of the finite-order central character of f, so the twist is removed as in §3.1. Then §§2.7 and 4.9 there and HilbertModularVarietiesAndShimuraCurves §§R18.4.25 and R18.5.21 at level n give the two inputs, with p acting trivially on JL(M) because M ∈ ΦNᵖ;
- the smooth-kernel splitting in the category with central character ζ, from the L-coefficient form of GL2AutomorphicRepresentationsAndTransfer R16.2.10 (gap:cuspidal-projectivity-coefficients);
- the dictionary of §0.4 in place of a self-duality of M_dR;
- the vanishing ∩_(j≥0)(u⁺)^j(Π^an_(M,ℒ)/π)′_b = 0 of §1.7, which holds for every central character because V_(M,ℒ) is not trianguline. A vector in the kernel of the comparison map lies in this intersection, as in DLB17 Proposition 11.10 (lines 2686–2698), so this replaces, in the injectivity step, the fixed-radius divisibility that gap:fixed-radius-divisibility asks of the base §6.9 for trivial central character.

After C⊗̂ and passage to the infinite level, an isomorphism of the shape of (ii) without the line condition is ProetaleCohomologyOfPAdicCurvesAndTowers §7.4 (CDN20 Théorème 0.4, line 268, which reaches it through the comparison of ℓ-adic and Hyodo–Kato cohomology). What (ii) adds is the L-rational form at fixed level and the identification of the preimages of the lines with the analytic duals; the route above does not use §7.4 there. Statement (iii) identifies the two isomorphisms. CDN20 Propositions 0.9 and 2.9 (lines 346 and 952) use this identification at every level and attribute it to DLB17 Théorème 1.4, whose isomorphism is built from the Kirillov comparison of DLB17 Théorème 11.7 (lines 2711–2716); the comparison with the Hyodo–Kato structure is DLB17 Remarque 11.13, at the first cover only (source correction E21).

The route for (iii) is DLB17 Remarque 11.13 (lines 2731–2781) at level n, with three lines. By the uniqueness in (ii), ι_HK = (A⊗id)∘ι for an isomorphism ι of (ii) and some A ∈ GL(M_dR), and (iii) says that A is a scalar. A fixes a line ℒ exactly when the ι_HK-preimage of ℒ⊗π′_b is (Π^an_(M,ℒ))′_b, and an element of GL(M_dR) fixing three pairwise distinct lines is a scalar.

- Three forms. Fix ℓ, the definite algebra B̄ and the indefinite algebra of discriminant pℓ as in §3.1. gap:three-period-line-globalisation gives forms f₁, f₂, f₃ on B̄^* with π(f_i)_p ≅ π and r̄_(f_i)|G_ℚ_p absolutely irreducible, whose Galois representations have pairwise non-isomorphic restrictions to G_ℚ_p. Let g_i be the Jacquet–Langlands transfer of f_i to the indefinite algebra (GL2AutomorphicRepresentationsAndTransfer R17.3), so that π(g_i)_p ≅ ρ, and let r_i be the representation ρ_f of HilbertModularVarietiesAndShimuraCurves §R18.3.29 attached to g_i, the contragredient of the H¹ realisation. Under Conventions r_i|G_ℚ_p has weights {0,1}; that roadmap prints {0,−1} in its opposite index convention. By §R18.3.29(c), converted by §0.4(a), D_pst(r_i|G_ℚ_p)[1] ≅ M, so r_i|G_ℚ_p = V_(M,ℒ_i) with ℒ_i = Fil⁰D_dR(r_i|G_ℚ_p) (§0.3). The lines ℒ₁, ℒ₂, ℒ₃ are pairwise distinct, since ℒ ↦ V_(M,ℒ) is injective (§0.3).
- Hyodo–Kato at level n. Let M̂ be a semistable model of M^p_n as in ProetaleCohomologyOfPAdicCurvesAndTowers §7.2 and Γ_j the cocompact groups of the uniformisation of HilbertModularVarietiesAndShimuraCurves §R18.5.21 at level n, with §R18.5.16 over ℚ. For N as in §3.1(b), the quotient of M_n by p^(Nℤ) is, after the finite base change of ProetaleCohomologyOfPAdicCurvesAndTowers §7.2, a disjoint union of copies of M^p_n permuted by p^ℤ/p^(Nℤ), so M̂ gives a semistable model of it, and its quotients by the Γ_j are semistable models of the components of the Shimura curve Sh_n of level n at p. Prove here the Hochschild–Serre spectral sequence of log-rigid cohomology for M̂ → Γ_j\M̂ (DLB17 footnote 53, line 2763); its degree-zero M-terms vanish because Ǧ acts on the geometric components through Nrd (ProetaleCohomologyOfPAdicCurvesAndTowers §7.1) and dim JL(M) ≥ 2. With Frobenius reciprocity for the Γ_j and strong multiplicity one (R17.3), it identifies the JL(M)-multiplicity of the π(g_i)^p_f-part of H¹_HK(Sh_n) with Hom_G(π′_b, (L⊗H¹_HK(M^p_n))[M]), compatibly with φ, N, G_ℚ_p and the Hyodo–Kato isomorphisms. Saito's comparison for the proper semistable models (HilbertModularVarietiesAndShimuraCurves §R18.4.24a) and §R18.3.29(c), converted by §0.4(a), identify that π(g_i)^p_f-part with JL(M)⊗M̆ as a (φ,N,G_ℚ_p)-module, and the de Rham filtration of its JL(M)-multiplicity with that of D_dR(r_i|G_ℚ_p) (CDN20 Proposition 5.2, line 1761). Since End_(φ,N,G_ℚ_p)(M) = L, the induced identification of the JL(M)-multiplicity of the π(g_i)^p_f-part of H¹_dR(Sh_n) with M_dR is that of ι_HK up to L^× (CDN20 Proposition 5.7, line 1874; DLB17 lines 2738–2749).
- One line from each form. CompletedCohomologyAndLocalGlobalCompatibility §4.9 applied to f_i, with §2.7 there, and the Hecke-module uniformisation of §3.1 at level n give a nonzero continuous G-map Φ_i: (Π(V_(M,ℒ_i))^an)′_b → (L⊗Ω¹(M^p_n))[M], as for the global input (a) above. As in the proof of (i) and §3.1(a), using that Π(V_(M,ℒ_i))^an/π has no nonzero smooth vector (§2.3), Φ_i maps (Π(V_(M,ℒ_i))^an/π)′_b isomorphically onto (L⊗O(M^p_n))[M], and its composite with the map to the de Rham multiplicity factors through π′_b. Its kernel is therefore the dual of a quotient Π^an/X by a closed G-stable X with X ∩ π = 0 and X + π dense; morphisms of admissible locally analytic representations being strict (base roadmap §0.1), X maps onto Π^an/π, so a nonzero kernel would split Π(V_(M,ℒ_i))^an as π ⊕ X. It does not split, since its universal unitary completion Π_(M,ℒ_i) is irreducible (base roadmap §§3.8 and 3.11(iii)), so Φ_i is injective. So its image is the preimage of ℓ_i⊗π′_b under ι, and of ℓ′_i⊗π′_b under ι_HK, for lines ℓ_i, ℓ′_i of M_dR. By (ii) that image is (Π^an_(M,ℓ_i))′_b, so Π^an_(M,ℓ_i) ≅ Π^an_(M,ℒ_i); passing to universal unitary completions (base roadmap §3.11(iii)) and applying the base §3.8 and §0.3 gives ℓ_i = ℒ_i. The line ℓ′_i is the Hodge line of the JL(M)-multiplicity of the π(g_i)^p_f-part of H¹_dR(Sh_n), read through the Hyodo–Kato step, and by the de Rham comparison of the proper curve (PadicHodgeTheory §8.1) and §0.4(c) it is ℒ_i (DLB17 lines 2753–2772). So A fixes ℒ_i.
- Conclusion. A fixes the three pairwise distinct lines ℒ₁, ℒ₂, ℒ₃, so it is a scalar (source correction E10).

**Checks.**

- At p = 7, let ω be the quadratic character of 𝔽₇^× extended by ω(7) = 1, and let π be supercuspidal with central character ω. The square of a character of μ₆ ⊂ ℤ₇^× has order dividing 3, while ω|μ₆ has order 2. So no twist π⊗χ∘det has trivial central character, and reduction to the base §6.9 by twisting is impossible. Since ω(7) = 1, M ∈ ΦNᵖ and the theorem applies.
- For ζ = 1 and ℒ = Le₁, (ii) puts the preimage at Le₁⊗π′_b ⊂ M_dR⊗π′_b. The base §6.9(iii) puts it at Le₂*⊗π′_b ⊂ M*_dR⊗π′_b. The two agree under §0.4(c).
- For M ∉ ΦNᵖ, for instance after the twist with χ(p) = 1+p of §0.1, the hypothesis of (i) fails: the geometric multiplicity on the p-central quotient is zero, while the intrinsic analytic quotient Π^an_(M,ℒ)/LL(M) remains nonzero, since twisting is invertible. Thus (i) cannot be extended to this input.
- Take a basis e₁, e₂ of M_dR and A = diag(1, 2), which is not a scalar since L has characteristic zero. Composing an isomorphism of (ii) with A⊗id gives another G-isomorphism onto M_dR⊗π′_b; it sends the preimage of L(e₁+e₂)⊗π′_b to that of L(e₁+2e₂)⊗π′_b, a different line, so it violates the line condition. Uniqueness up to L^× is a property of the isomorphisms with the line condition only.
- (iii) needs three lines. With A = diag(1, 2) as above, A fixes Le₁ and Le₂ and moves L(e₁+e₂). So two forms with the lines Le₁ and Le₂ leave ι_HK determined only up to such a diagonal A, and repeated forms with one line do not determine it at all. Conversely, if A fixes Le₁ and Le₂ then A = diag(α, β), and A(e₁+e₂) = αe₁+βe₂ ∈ L(e₁+e₂) forces α = β.
- Distinct residual representations are sufficient for distinct lines but not necessary. V_(M,ℒ) determines the semisimplification of its reduction, so forms whose residual restrictions r̄_(f_i)|G_ℚ_p have non-isomorphic semisimplifications have distinct lines. But ℙ(M_dR)(L) is infinite, while there are only finitely many semisimple two-dimensional k_L-representations of G_ℚ_p, since ℚ_p has only finitely many extensions of degree at most |GL₂(k_L)|; so infinitely many lines share one residual representation. The gap asks for pairwise non-isomorphic restrictions to G_ℚ_p in characteristic zero.
- The uniqueness of ι_HK uses End_(φ,N,G_ℚ_p)(M) = L. For a rank-two module with N = 0 whose Weil–Deligne representation is χ₁⊕χ₂ with χ₁ ≠ χ₂, the endomorphisms form L×L, and an identification compatible with the Hyodo–Kato structure would be unique only up to that torus; (iii) is a statement about supercuspidal M.
- In the Conventions' normalisation the H¹ realisation ρ_π of a form g_i has weights {0,−1}: its Hodge jumps are 0 and 1, so Fil⁰D_dR(ρ_π) is the whole two-dimensional space and Fil¹ is the line. Reading r_i as ρ_π would make the line Fil⁰D_dR(r_i) undefined; r_i is its contragredient, of weights {0,1}.

*Needs:* §§0.2–0.4, 1.7, 2.1–2.4, 3.1 (with its function duals, which hold at every level and for every central character) and 3.2; PadicLocalLanglandsForGL2Qp §§0.1, 3.8, 3.11 and 6.9; CompletedCohomologyAndLocalGlobalCompatibility §§2.7, 4.9 and 6.4; HilbertModularVarietiesAndShimuraCurves §§R18.3.29, R18.4.24a, R18.4.25, R18.5.16 and R18.5.21; GL2AutomorphicRepresentationsAndTransfer R16.1.8, R16.2.10 and R17.3; ProetaleCohomologyOfPAdicCurvesAndTowers §§7.1, 7.2 and 7.4; PadicHodgeTheory §8.1; gap:cuspidal-projectivity-coefficients; gap:three-period-line-globalisation.

### Examples

For ζ = 1, n = 2r and ℒ = Le₁, §3.3(i) is the base §6.9(ii) at DLB level r. For ζ = ω at p = 7 as above, §3.3 is the only available form of the comparison. For ρ of level 2, trivial on 1+pO_D but not on 1+ϖ_DO_D, §3.3 applies at n = 2, while the first cover, on which 1+ϖ_DO_D acts trivially, has zero ρ-part.

### Dependencies

Layers 0–2; PadicLocalLanglandsForGL2Qp §§0.1, 3.3, 3.8, 3.11 and 6.9, with gap:fixed-radius-divisibility for the consequence of §3.1 for the base; GL2AutomorphicRepresentationsAndTransfer R16.1.8, R16.2.10 and R17.3; CompletedCohomologyAndLocalGlobalCompatibility §§2.7, 4.9 and 6.4; HilbertModularVarietiesAndShimuraCurves §§R18.3.29, R18.4.24a, R18.4.25, R18.5.16 and R18.5.21; EndoscopicTransferAndUnitaryTraceComparison §§12.4, 12.5, 12.7 and 12.19; ProetaleCohomologyOfPAdicCurvesAndTowers §§6.2, 7.1, 7.2 and 7.4; PadicHodgeTheory §8.1; LocallyAnalyticDistributions §§0.2 and 0.3; LocallyAnalyticDistributionsPartII §§1.5 and 2.2–2.3; LocallyAnalyticRepresentationsOfLocalGroups §§0.3, 0.5 and 0.8; SmoothRepresentationsOfLocalGroups SR.0 and SR.2; gap:cuspidal-projectivity-coefficients; gap:three-period-line-globalisation.

## Layer 4: Individual geometric multiplicities

From here on fix n ≥ 0 and work on the p-central quotient M^p_n over ℚ_p (EndoscopicTransferAndUnitaryTraceComparison §12.19), with geometric fibre M^p_(n,C). Write O[M], Ω¹[M], H¹_proét[M] and H¹_ét[M] for the JL(M)-multiplicity spaces of L⊗O(M^p_(n,C)), L⊗Ω¹(M^p_(n,C)), H¹_proét(M^p_(n,C), L(1)) and H¹_ét(M^p_(n,C), L(1)). For a supercuspidal M ∈ ΦNᵖ_n, G_ℚ_p acts on these through the descent datum. Write O[M]^(G_ℚ_p) and Ω¹[M]^(G_ℚ_p) for the invariants; they are the JL(M)-multiplicity spaces of L⊗O(M^p_n) and L⊗Ω¹(M^p_n), the L-rational spaces that CDN20 denotes O[M] and Ω¹[M] (CDN20 lines 749–756), and O[M] = C⊗̂_ℚ_p O[M]^(G_ℚ_p), Ω¹[M] = C⊗̂_ℚ_p Ω¹[M]^(G_ℚ_p), since M^p_n is a Stein space over ℚ_p and taking the JL(M)-multiplicity commutes with C⊗̂.

### 4.1 The multiplicity diagram at fixed level

For supercuspidal M ∈ ΦNᵖ_n of slope 1/2, prove that there is a commutative diagram of G×G_ℚ_p-Fréchet spaces with exact rows (CDN20, Théorème 0.8, line 323, and Corollaire 2.1, line 762; CDN23 lines 2501–2514):

    0 → O[M] --exp--> H¹_proét[M] --------> X⁺_st(M) ⊗̂_L LL(M)′_b → 0
          ‖                 | dlog                 | θ⊗id
    0 → O[M] ---d---> Ω¹[M] -----------> (C⊗M_dR) ⊗̂_L LL(M)′_b → 0

The vertical maps are injective with closed image. The diagram on the infinite-level tower M_∞, with W_ℚ_p-equivariance, is ProetaleCohomologyOfPAdicCurvesAndTowers §7.5 at F = ℚ_p. This target reads it at the fixed level n on the p-central quotient over ℚ_p. The route has two steps:

- By the level reading of §0.2, pullback identifies each M-multiplicity on M^p_(n,C) with the corresponding multiplicity on M_∞, compatibly with exp, d, dlog and the actions of G and W_ℚ_p.
- G_ℚ_p acts on the cohomology of M^p_(n,C) through the descent datum of EndoscopicTransferAndUnitaryTraceComparison §12.19, continuously, and this action restricts to the W_ℚ_p-action of the Weil descent (§12.7 there). The maps of the diagram are W_ℚ_p-equivariant, W_ℚ_p is dense in G_ℚ_p and both actions are continuous, so the maps are G_ℚ_p-equivariant.

N = 0 on supercuspidal M, so B_st may be replaced by B_cris in X⁺_st(M). This roadmap uses F = ℚ_p only, because its representation-theoretic inputs, the correspondence V ↦ Π(V) and the type rings of the base roadmap, exist for GL₂(ℚ_p) only.

**Checks.**

- θ: X⁺_st(M) → C⊗M_dR is injective because M has slope 1/2 > 0, so (B⁺_cris⊗M)^(φ=1) = 0 (CDN20, Remarque 2.3, line 817). For a slope-zero module the φ = 1 invariants survive and the right vertical map fails to be injective.
- Taking G_ℚ_p-invariants of the bottom row gives 0 → O[M]^(G_ℚ_p) → Ω¹[M]^(G_ℚ_p) → M_dR⊗LL(M)′_b → 0 (CDN20 lines 917–919).
- For the unramified twist with χ(p) = 1+p of §0.1, M ∉ ΦNᵖ: the geometric multiplicities on the p-central quotient vanish, but the intrinsic term (C⊗M_dR)⊗̂_L LL(M)′_b is nonzero. The diagram is not asserted for this input; §0.2 requires p to act trivially on JL(M).
- At n = 0, Ǧ/K_D(0) ≅ ℤ has only one-dimensional smooth absolutely irreducible representations over a splitting coefficient field. Hence no supercuspidal M has level zero: the diagram has no parameter in its domain at this level.

*Needs:* §0.2; ProetaleCohomologyOfPAdicCurvesAndTowers §7.5; EndoscopicTransferAndUnitaryTraceComparison §§12.7 and 12.19.

### 4.2 The analytic Steinberg representation and the special types

Write St^sm = Sp_1(L) = C^sm(ℙ¹(ℚ_p), L)/L and St^cont = Sp^cont_1(L) = C⁰(ℙ¹(ℚ_p), L)/L for the Steinberg representations of ProetaleCohomologyOfPAdicCurvesAndTowers §0.3 at GL₂(ℚ_p). Write St^an = C^an(ℙ¹(ℚ_p), L)/L, with the inverse-pullback G-action and the quotient topology, for the analytic Steinberg representation St^an(χ, 1) of the base roadmap §4.8: the quotient of the locally analytic induction (Ind_B^G 1)^an ≅ C^an(ℙ¹(ℚ_p), L) of LocallyAnalyticRepresentationsOfLocalGroups §5.1 by its constants. Their duals (St^sm)′_b, (St^an)′_b and (St^cont)* are the functionals of total mass zero (CDN20, §1.3.2, lines 633–644); (St^cont)* carries the topology of compact convergence of Conventions. Prove that St^an → St^cont has dense image and that St^cont is the universal unitary completion of St^an (base roadmap §2.5); for St^sm this is §0.4(c) of ProetaleCohomologyOfPAdicCurvesAndTowers. Prove that μ ↦ ∫ dz/(z−x) μ(x) gives a G-isomorphism Ω¹(Ω_C) ≅ (St^an_C)′ (CDN20, Proposition 1.6 and Théorème 1.7, lines 659–680). The cohomology of Ω is ProetaleCohomologyOfPAdicCurvesAndTowers §§6.2, 6.5 and 6.9 at d = 1: f ↦ df/f gives C⊗̂(O(Ω)^×/C^×) ≅ H¹_dR(Ω_C) ≅ C⊗̂(St^sm)′, and H¹_ét(Ω_C, ℤ/p^k(1)) ≅ (St^sm_(ℤ/p^k))^∨ compatibly with G×G_ℚ_p.

For special M = Sp⊗δ ∈ ΦNᵖ_n, prove that the M-multiplicities of the tower are obtained from these by twisting with δ_G = δ∘det on G, δ_Ǧ = δ∘Nrd on Ǧ and δ on G_ℚ_p through the reciprocity convention. In particular H¹_ét[M] ≅ (St^cont⊗δ_G)*⊗δ (CDN23, Théorème 5.1 and Remarque 5.2, lines 2357–2371).

Its API:

- Each Steinberg form is the stated function space modulo constants, with the quotient topology, and its dual is the annihilator of the constants.
- The maps St^sm → St^cont and St^an → St^cont have dense image and the universal property of unitary completion.
- Twisting by δ commutes with the half-plane comparisons for δ_G, δ_Ǧ and δ simultaneously.

**Checks.**

- A constant function represents zero in all three quotients. δ_x − δ_y has total mass zero and is a nonzero element of each dual for x ≠ y, while δ_x alone does not vanish on the constants and is not in the dual.
- The function z ↦ (z−a)/(z−b) has symbol mapped to δ_a − δ_b (CDN20, Proposition 1.5, line 650). Its residues at a and b are opposite, matching total mass zero.
- The scalar aI₂ acts on St^cont⊗δ_G by δ(a²), and a ∈ ℚ_p^× ⊂ Ǧ acts by δ(Nrd a) = δ(a²). Both sides agree, and δ(p)² = 1 is exactly the ΦNᵖ condition.
- Take μ = δ₀ − δ_∞ in (St^cont)* and g_n = u(pⁿ), so g_n → 1. Then g_nμ − μ = δ_(pⁿ) − δ₀. Its norm is 1 for every n: |f(pⁿ) − f(0)| is at most the quotient norm of f modulo constants, and the indicator of the compact open pⁿℤ_p^× has quotient norm at most 1 and pairs to 1 with it. For every continuous f, f(pⁿ) − f(0) → 0, and the family is norm-bounded, so g_nμ − μ → 0 uniformly on compact subsets. So the orbit map of μ is not continuous at 1 for the norm topology of (St^cont)′_b, while along g_n it converges in (St^cont)*, as the continuity of the action on (St^cont)* (Conventions) requires. The computation is the same at p = 2 and p = 3.

*Needs:* PadicLocalLanglandsForGL2Qp §§0.1, 2.5 and 4.8; LocallyAnalyticRepresentationsOfLocalGroups §5.1; ProetaleCohomologyOfPAdicCurvesAndTowers §§0.3, 0.4, 6.2, 6.5 and 6.9; SmoothRepresentationsOfLocalGroups SR.2; EndoscopicTransferAndUnitaryTraceComparison §12.14.

### 4.3 Extension of a partial operator with prescribed spectrum

Let E be a d-dimensional L-vector space, S ⊂ E a subspace and A: S → E an L-linear map such that the only subspace T ⊂ S with A(T) ⊂ T is T = 0. Prove that for any d pairwise distinct λ₁,…,λ_d ∈ L there is an endomorphism B of E extending A that has an eigenbasis e₁,…,e_d with Be_i = λ_ie_i (CDN20, Lemme 2.18, line 1171). No algebraic closure of L is assumed. The route inducts on d along a maximal A-chain s, As, A²s, … inside S, whose iterates up to the first exit from S are linearly independent. It completes the companion block with the coefficients of ∏(X−λ_i), which alternate in sign. The proof must establish that the complementary partial operator again has no nonzero invariant subspace before the induction applies; the source omits this step. The source prints all-positive companion coefficients (source correction E13).

**Checks.**

- d = 2, S = Le₁, Ae₁ = e₂. Then Be₂ = −λ₁λ₂e₁ + (λ₁+λ₂)e₂ gives trace λ₁+λ₂ and determinant λ₁λ₂. The all-positive column λ₁λ₂e₁ + (λ₁+λ₂)e₂ gives determinant −λ₁λ₂ and fails.
- S = 0: every diagonal operator with the prescribed eigenbasis is an extension.
- S = E with d ≥ 1 never satisfies the hypothesis, since T = E is A-stable. So the lemma never asks to extend a full endomorphism with no invariant subspace.

*Needs:* Mathlib `Submodule`, `LinearMap`, `Module.finrank` and `Module.Basis`.

### 4.4 Period multiplicity spaces

For finite F/ℚ_p, let M be an L-(φ,N,G_F)-module of rank two: a free L⊗ℚ_p^nr-module of rank two with a semilinear Frobenius φ, an operator N with Nφ = pφN and a smooth semilinear action of G_F (CDN20 lines 242–250). Call M supercuspidal over F when its Weil–Deligne representation of WD_F is irreducible, and let it have slope 1/2. Put M_dR = (C⊗_(ℚ_p^nr)M)^(G_F), a module of rank two over L⊗_ℚ_p F, and X⁺_st(M) = (B⁺_cris⊗_(ℚ_p^nr)M)^(φ=p) (CDN20 lines 809–812). For F = ℚ_p these are the supercuspidal types of Conventions, with M_dR and X⁺_st(M) of §0.3. For a finite-dimensional continuous L-representation V of G_F, define H_M(V) = Hom_(L[G_F])(V, X⁺_st(M)) and H_C(V) = Hom_(L[G_F])(V, L⊗_ℚ_p C) (CDN20, §2.1.2 and Remarque 2.3, lines 800–821). H_M(V) is finite-dimensional over L and H_C(V) is finite over L⊗F. θ induces an injection ι: H_M(V) → M_dR⊗_L⊗FH_C(V). The coefficients are L⊗_ℚ_p F, which is not identified with L when F ≠ ℚ_p.

Its API:

- H_C(V) = (C⊗_ℚ_p V^∨)^(G_F) with its L⊗F-module structure.
- ι is injective because M has positive slope.
- A Galois map V → W induces H_M(W) → H_M(V) and H_C(W) → H_C(V), commuting with ι.

**Checks.**

- For V = L trivial, H_C(L) = C^(G_F)⊗L = F⊗L.
- For V = L(1), H_C(V) = (C(−1)⊗_ℚ_p L)^(G_F) = 0 by Tate's theorem, since H⁰(G_F, C(j)) = 0 for j ≠ 0. So H_C sees the Hodge–Tate weight; C(1) in place of C would exchange the two values, giving 0 for L and F⊗L for L(1). For F = ℚ_p, H_M vanishes on both characters (§4.6).
- For F = ℚ_p and V = V_(M,ℒ), H_M(V) is one-dimensional and its θ-image is ℒ⊗H_C(V) ⊂ M_dR⊗H_C(V) (CDN20, Lemme 2.7, line 911).

*Needs:* §0.3; PadicHodgeTheory §§3.3 and 5.3–5.4.

### 4.5 The fundamental diagram after Galois multiplicities

For supercuspidal M ∈ ΦNᵖ_n and finite-dimensional continuous V of G_ℚ_p, apply Hom_(G_ℚ_p)(V, −) to §4.1 and prove that the result is a commutative diagram with exact rows (CDN20, Proposition 2.4, line 822):

    0 → H_C(V)⊗_L O[M]^(G_ℚ_p) → Hom_(G_ℚ_p)(V, H¹_proét[M]) → H_M(V)⊗_L LL(M)′_b → 0
    0 → H_C(V)⊗_L O[M]^(G_ℚ_p) → H_C(V)⊗_L Ω¹[M]^(G_ℚ_p) → H_C(V)⊗_L M_dR⊗_L LL(M)′_b → 0

The vertical maps are id, dlog and ι⊗id, injective with closed image. The left and middle terms are the Galois multiplicities of the C-valued spaces of §4.1: Hom_(G_ℚ_p)(V, O[M]) = ((C⊗_ℚ_p V^∨)⊗̂_L O[M]^(G_ℚ_p))^(G_ℚ_p) ≅ H_C(V)⊗_L O[M]^(G_ℚ_p). Here every Hom is continuous and L-linear, V^∨ is the L-linear dual, and X = C⊗_ℚ_p V^∨ has its natural L-action. For a Banach L-space B with trivial Galois action, (X⊗̂_L B)^(G_ℚ_p) ≅ X^(G_ℚ_p)⊗̂_L B (CDN23, Lemme 5.5, lines 2411–2416); apply this at the Banach stages and pass to the Fréchet limit. The tensor product with finite-dimensional H_C(V) is the algebraic one. The same argument applies to Ω¹[M]. The scalar extension O[M] = C⊗̂_ℚ_p O[M]^(G_ℚ_p) in the opening of Layer 4 instead tensors a rational space with C; its base field is ℚ_p.

Surjectivity on the right is a target here and does not follow from exactness of Hom. The route applies gap:continuous-galois-tensor-comparison to X = C⊗_ℚ_p V^∨ and to the Fréchet spaces B₀ = O[M]^(G_ℚ_p) and B₁ = Ω¹[M]^(G_ℚ_p), and, by its naturality, to the continuous map d: B₀ → B₁. It identifies the map H¹(G_ℚ_p,O[M]⊗_L V^∨) → H¹(G_ℚ_p,Ω¹[M]⊗_L V^∨) with id⊗d on H¹(G_ℚ_p,X)⊗_L B₀ → H¹(G_ℚ_p,X)⊗_L B₁. This is injective because H¹(G_ℚ_p,X) is finite-dimensional and d is injective in the supercuspidal sector. The commutative diagram of §4.1 then makes the connecting homomorphism zero, giving the top-row surjectivity (CDN20, Proposition 2.4, lines 844–853). The strict model and the inverse-limit comparison are part of the supplier gap, rather than consequences of finite-dimensional Sen modules or of general locally convex strictness; their application to B₀, B₁ and d is made here.

**Checks.**

- The left square is the identity on H_C(V)⊗_L O[M]^(G_ℚ_p). For V = L it is the identity on O[M]^(G_ℚ_p), an L-space: the C-valued O[M] of §4.1 in its place would make the left term a C-space, while Hom_(G_ℚ_p)(L, H¹_proét[M]) = H¹_proét[M]^(G_ℚ_p) is an L-space containing exp(O[M]^(G_ℚ_p)).
- For V = 0 every term is 0.
- The middle vertical map has closed image, by a diagram chase. The left vertical map is the identity and the top row is exact, so x ∈ H_C(V)⊗_L Ω¹[M]^(G_ℚ_p) is in the image exactly when its image in H_C(V)⊗_L M_dR⊗_L LL(M)′_b lies in the image of ι⊗id: lift that element through the top row and subtract, and the difference comes from the left term. ι is an injection of finite-dimensional spaces, so a complement W of ι(H_M(V)) in H_C(V)⊗_L M_dR exhibits ι⊗id as the inclusion of a topological direct summand, with complement W⊗_L LL(M)′_b, and its image is closed; the preimage of a closed subspace under the continuous bottom map is closed. The chase uses the surjectivity of the top row proved here: without it, the image is only contained in that preimage.
- Take quadratic L/ℚ_p and the unit V = L. Then H_C(V) = L, and with B = L the formula has L⊗_L L = L of L-dimension one. Tensoring over ℚ_p would give L⊗_ℚ_p L of L-dimension two, duplicating the coefficient field.
- For V = L the cohomological comparison must give H¹(G_ℚ_p,C⊗_ℚ_p L) = L·[logχ]. The required strict model must specialise to [L --0--> L], with kernel and cokernel both L. With F = L² both sides of the tensor comparison have L-dimension two.
- Let E = Le₁⊕Le₂ with ge₁ = e₁ and ge₂ = e₂+logχ(g)e₁, and take V = E^∨. Its Sen operator is N = (0 1; 0 0), so ker N = Le₁ and coker N = L[e₂], both one-dimensional. The comparison must recover these H⁰ and H¹, rather than dimension two from the two zero eigenvalues: logχ(g)e₁ = ge₂−e₂ is a coboundary, while logχ(g)e₂+(logχ(g))²e₁/2 represents the surviving H¹ class. This also tests the strict model, not just the dimension of the Sen module; 2 is invertible in L even at p = 2.

*Needs:* §§4.1 and 4.4; PadicLocalLanglandsForGL2Qp §0.1; LocallyAnalyticDistributions §§0.0 and 0.2; PadicHodgeTheory §4.4, gap:continuous-galois-tensor-comparison.

### 4.6 Classification of rank-two period multiplicities

For finite F/ℚ_p, M supercuspidal over F as in §4.4 and V a finite-dimensional continuous L-representation of G_F, put X_st(M) = (B_st⊗_(ℚ_p^nr)M)^(N=0, φ=p) (CDN20 line 860). Since N = 0 on M, it equals (B_cris⊗_(ℚ_p^nr)M)^(φ=p) and contains X⁺_st(M) of §4.4. Prove the following (CDN20, Proposition 2.5, Remarque 2.6 and Lemme 2.7, lines 859–913):

- Hom_(G_F)(V, X_st(M)) ≅ Hom_(WD_F)(M[−1]*, D_pst(V*)).
- If dim V = rank M and this Hom is nonzero, then V is supercuspidal, D_pst(V) ≅ M[−1] and the Hom is one-dimensional.
- For F = ℚ_p and V two-dimensional, H_M(V) ≠ 0 exactly when V ≅ V_(M,ℒ) for a unique line ℒ (H_M(V) is the Hom into the subspace X⁺_st(M), §4.4).

For F ≠ ℚ_p the embeddingwise Hodge–Tate weights κ_(i,σ) ≥ 0 with Σκ_(i,σ) = [F:ℚ_p] allow representations other than V_(M,ℒ), and the last statement is not asserted. The source's proof prints the dimension count of the equal-rank Hom in reverse (source correction E14).

**Checks.**

- A character V cannot embed in X⁺_st(M) for supercuspidal M, since M[−1]* has no one-dimensional WD-quotient.
- For F = ℚ_p and V two-dimensional, the weight constraint κ₁, κ₂ ≥ 0 with κ₁+κ₂ = 1 forces weights {0,1}.
- For F of degree two over ℚ_p, weights (0,0) at one embedding and (1,1) at the other satisfy the constraints but do not give a V_(M,ℒ).
- Supercuspidality is a condition over F, not over ℚ_p. Let F = ℚ_p² and let M be a type of Conventions whose Weil–Deligne representation is induced from a character θ of W_F with θ ≠ θ^σ, σ the Frobenius of F. Restricted to W_F it is θ⊕θ^σ, which is reducible. For V = V_(M,ℒ)|G_F and the restriction M|G_F, the Hom of the first statement is End_(WD_F)(θ′⊕θ′^σ) for the corresponding characters θ′ of the dual, of dimension 2 over L, and V is not supercuspidal over F. So the second statement fails for M|G_F, which the hypothesis excludes because it is not supercuspidal over F.

*Needs:* §§0.3 and 4.4; PadicHodgeTheory §§5.3–5.4.

### 4.7 The line extension W_(M,ℒ)

For supercuspidal M ∈ ΦNᵖ_n and a line ℒ ⊂ M_dR, let W′_(M,ℒ) be the preimage of ℒ⊗LL(M)′_b under Ω¹[M]^(G_ℚ_p) → M_dR⊗LL(M)′_b (§4.1). Let ℒ⁻¹ = M*_dR/ℒ^⊥, so that ℒ⁻¹⊗ℒ = L canonically, and put W_(M,ℒ) = ℒ⁻¹⊗_L W′_(M,ℒ). Its quotient is LL(M)′_b through evaluation (CDN20, §2.1.5, lines 917–951). Prove that W_(M,ℒ) ≅ (Π^an_(M,ℒ))′_b. This is CDN20 Proposition 2.9 (line 952), which the source deduces from DLB17 for trivial central character. Here it follows for every M ∈ ΦNᵖ_n from §3.3(ii) and (iii): the map of §4.1 is the isomorphism ι_HK of §3.3(iii), which has the line condition of §3.3(ii); §3.3(ii) alone, without (iii), would give (Π^an_(M,Aℒ))′_b for an unknown A ∈ GL(M_dR). Also prove Hom_(G_ℚ_p)(V_(M,ℒ), H¹_proét[M]) ≅ W_(M,ℒ) (CDN20, Proposition 2.10, line 962).

Its API:

- W′_(M,ℒ) is the full inverse image of ℒ⊗LL(M)′_b in Ω¹[M]^(G_ℚ_p).
- W_(M,ℒ) = ℒ⁻¹⊗W′_(M,ℒ), whose quotient is LL(M)′_b through ℒ⁻¹⊗ℒ = L.
- W_(M,ℒ) ≅ (Π^an_(M,ℒ))′_b, compatibly with the scalar of §3.3.
- Hom_(G_ℚ_p)(V_(M,ℒ), H¹_proét[M]) ≅ W_(M,ℒ), respecting the G-action and the topology.

**Checks.**

- Replacing a generator e of ℒ by ae, a ∈ L^×, replaces the dual generator by a⁻¹e*. The normalised quotient map is unchanged.
- For ℒ ≠ ℒ′, W′_(M,ℒ) ∩ W′_(M,ℒ′) = d(O[M]^(G_ℚ_p)). A nonzero rational exact differential ω lies here; for c ∈ C moved by Galois, cω lies in dO[M] but is not Galois invariant, so it does not lie in this intersection.
- W′_(M,ℒ) ≠ Ω¹[M]^(G_ℚ_p), since M_dR/ℒ ≠ 0 and LL(M) ≠ 0.

*Needs:* §§3.3, 4.1, 4.5 and 4.6; §0.4.

### 4.8 G-bounded vectors

For a continuous L-linear action of G on a Hausdorff locally convex L-space E, call v ∈ E G-bounded when the orbit {gv : g ∈ G} is von Neumann bounded (Mathlib `Bornology.IsVonNBounded`). Write E^b for the G-bounded vectors (CDN23 lines 2378–2380; CDN20, §2.2.1, line 1009). If E is normed, this means the orbit has bounded norm (`NormedSpace.image_isVonNBounded_iff`). If the topology is given by seminorms (p_i), it means that for each i the values p_i(gv) are bounded, with a bound depending on i (`WithSeminorms.image_isVonNBounded_iff_seminorm_bounded`). These criteria are pinned Mathlib theorems and are not restated here.

Its API:

- E^b is a G-stable L-subspace containing 0.
- A continuous G-equivariant L-linear map E → E′ carries E^b into E′^b, compatibly with identity and composition.
- For an isometric action on a normed space, E^b = E.

**Checks.**

- For the trivial action every vector is G-bounded, since its orbit is a point.
- For G = ℤ acting on ℚ_p by n·x = p^nx, a nonzero x is not bounded: |p^nx| = p⁻ⁿ|x| is unbounded as n → −∞.
- On a Fréchet space with seminorms (p_i), take a vector v with p_i(v) = 1 for all i and the action of ℤ fixing v. Replacing p_i by i·p_i keeps the topology and v stays bounded, though no single constant bounds all i·p_i(v). The condition is ∀i ∃C_i, not ∃C ∀i.

*Needs:* Mathlib `Bornology.IsVonNBounded`, `NormedSpace.image_isVonNBounded_iff` and `WithSeminorms.image_isVonNBounded_iff_seminorm_bounded`.

### 4.9 Étale cohomology as bounded vectors

For the full level M_(n,C), the map H¹_ét(M_(n,C), L(1)) → H¹_proét(M_(n,C), L(1)) is injective with image exactly the G-bounded vectors of §4.8 (ProetaleCohomologyOfPAdicCurvesAndTowers §7.3; CDN20, Proposition 2.12, line 1020; CDN23, Proposition 5.6, line 2420). Prove the same for the p-central quotient M^p_(n,C) and for each M-multiplicity, H¹_ét[M] = (H¹_proét[M])^b, and that L⊗O(M^p_(n,C)) has no nonzero G-bounded vectors in a supercuspidal sector: O(M^p_(n,C))[M]^b = 0 for supercuspidal M (CDN23, proof of Théorème 5.24(i), lines 2791–2793 and footnote 31). This is the fixed-level form of the vanishing that ProetaleCohomologyOfPAdicCurvesAndTowers §7.5 uses on the infinite-level tower for the integral form of its diagram.

The route for the p-central quotient: p^ℤ acts freely on M_n with quotient M^p_n. For pro-étale cohomology with coefficients L(1), and for étale cohomology with coefficients (O_L/p^k)(1) at each k, the Hochschild–Serre sequence of p^ℤ ≅ ℤ is 0 → H¹(p^ℤ, H⁰(M_(n,C))) → H¹(M^p_(n,C)) → H¹(M_(n,C))^(p^ℤ) → 0. The two H⁰ differ, since π₀(M_(n,C)) is infinite: the pro-étale one is the space ∏_(π₀) L of all locally constant functions, while the étale ones are ∏_(π₀) O_L/p^k, so that the rational étale group L⊗lim_k gives only the bounded functions L⊗∏_(π₀) O_L. The first term vanishes in every case. p^ℤ acts freely on π₀(M_(n,C)), p translating the height by 2, so (T−1)f = a, with T the action of p, is solved orbit by orbit by finite signed sums of values of a, which are bounded when a is, by the ultrametric inequality (the computation of §0.2, Checks). Hence H¹(M^p_(n,C)) = H¹(M_(n,C))^(p^ℤ) for pro-étale cohomology, and for étale cohomology after lim_k, which commutes with invariants, and L⊗, which commutes with the kernel of T−1. Injectivity on M^p_(n,C) follows from injectivity on M_(n,C). A G-bounded pro-étale class of M^p_(n,C) restricts to a p^ℤ-invariant G-bounded, hence étale, class of M_(n,C); that étale class is p^ℤ-invariant because the comparison map is injective and equivariant, so it is an étale class of M^p_(n,C) with the given image. Étale classes are G-bounded because the integral étale group is a G-stable bounded lattice. The route for the multiplicities: Ǧ commutes with G, and Hom_Ǧ(JL(M), −) out of a finite-dimensional JL(M) commutes with taking G-bounded vectors, since a finite family of vectors is G-bounded exactly when each of them is. The route for O[M]^b = 0 has three steps. M^p_(n,C) has an affinoid whose G-translates cover it, so a G-bounded function is bounded on M^p_(n,C). A bounded function on a connected Stein curve with a semistable model is constant (CDN20, Remarque A.2, line 2247), and the models of ProetaleCohomologyOfPAdicCurvesAndTowers §7.2 apply to each component. Locally constant functions have zero M-multiplicity, because Ǧ acts on π₀ through Nrd (§7.1 there) and dim JL(M) ≥ 2.

**Checks.**

- A function bounded on one affinoid Y is not bounded on M^p_(n,C) unless its G-translates are uniformly bounded on Y: z ↦ z on a level-zero copy of Ω is bounded on the affinoid of a vertex, unbounded on M^p_(0,C), and not G-bounded, since u(b) sends it to z ↦ z − b, under the inverse-pullback action of Conventions, and these translates are not uniformly bounded on the affinoid as b runs through ℚ_p.
- A constant function on M^p_(n,C) is G-bounded and lies in the trivial sector. Its supercuspidal multiplicity is 0, since dim JL(M) > 1 and Ǧ acts on constants through Nrd.
- The rational étale group is L⊗lim_k of integral groups, not lim_k of groups already tensored with L, which would vanish on p^k-torsion.
- On M_(0,C) the function with value p^(−|h|) on the component of height h is locally constant and unbounded, since |p^(−|h|)| = p^|h|. It lies in H⁰_proét(M_(0,C), L) = ∏_h L and not in H⁰_ét(M_(0,C), L) = L⊗∏_h O_L. So the two Hochschild–Serre sequences are built on different H⁰, and what they share is only the vanishing of their first terms H¹(p^ℤ, H⁰). For a_h = 1 for every h, the solution of f_(h+2) − f_h = a_h with f_0 = f_1 = 0 has f_h ∈ ℤ, growing as a real number but with |f_h| ≤ 1: the bounded solution exists because the absolute value is non-archimedean.

*Needs:* §§0.2 and 4.8; ProetaleCohomologyOfPAdicCurvesAndTowers §§7.1–7.3; EndoscopicTransferAndUnitaryTraceComparison §§12.4 and 12.5.

### 4.10 Bounded duals and universal completions

Prove the following (CDN23, Lemme 5.3, line 2381; CDN20, Corollaire 2.13, line 1078):

- (a) If Π is a unitary Banach representation of G, then (Π*)^b = Π*.
- (b) If π₀ is smooth admissible of finite length, then (π₀′_b)^b ≅ (π̂₀)*, where π̂₀ is its universal unitary completion.
- (c) If Π is admissible unitary of finite length with a central character, then ((Π^an)′_b)^b = Π*.

In (b) and (c) the identification is the G-equivariant linear bijection induced by the transpose of π₀ → π̂₀, resp. Π^an → Π. The Banach dual keeps its own topology of compact convergence (Conventions), not the subspace topology of the ambient dual as a whole. On every norm-bounded subset of the Banach dual the two topologies agree: by equicontinuity both induce there the topology of pointwise convergence on the dense subspace π₀, resp. Π^an. Likewise H¹_ét[M] = (H¹_proét[M])^b of §4.9 keeps the topology of L⊗_(O_L) of its integral étale lattice, whose p^(−N)-multiples are compact and carry the subspace topology of H¹_proét[M].

Consequently Hom_(G_ℚ_p)(V_(M,ℒ), H¹_ét[M]) ≅ Π_(M,ℒ)* for supercuspidal M ∈ ΦNᵖ_n. The route proves (a) and (b) by the Banach–Steinhaus theorem (Mathlib `WithSeminorms.banach_steinhaus`), the gauge of O_L[G]v₁+⋯+O_L[G]v_r and the invariant Banach norm. It proves (c) by the analytic universal-completion theorem of the base roadmap §2.5, which carries the central-character hypothesis; CDN23 Lemme 5.3(c) (lines 2385–2386) omits it. Every use here satisfies it: Π_(M,ℒ) is absolutely irreducible and so has a central character (base roadmap §3.8), St^cont⊗δ_G has central character δ², and §4.11 applies (c) to a finite direct sum of such representations summand by summand, G-bounded vectors commuting with finite direct sums. The consequence follows from §§4.7 and 4.9.

**Checks.**

- For Π = L trivial, Π* = L and every vector is bounded.
- For π₀ = St^sm, (b) gives (St^cont)* by §4.2. The vectors δ_(pⁿ) − δ₀ of the Check of §4.2 are G-bounded and tend to 0 both in (St^sm)′_b and in (St^cont)*, but not in the norm: the norm topology is not the topology on the bounded vectors.
- Take Π = St^cont, admissible unitary of length one, and put ℓ(v) = ⟨δ_∞ − δ₀, u⁺v⟩ for v ∈ Π^an. It composes the continuous operator u⁺ of the differentiated action on Π^an (LocallyAnalyticRepresentationsOfLocalGroups §0.3), the continuous inclusion Π^an → Π and an element of Π*, so ℓ ∈ (Π^an)′_b. The class of a locally analytic function f on ℙ¹(ℚ_p) is a locally analytic vector; u⁺f = −f′ vanishes at ∞, since u(t) fixes ∞, so ℓ(f) = f′(0). For g = diag(pᵐ,1), u⁺g⁻¹ = pᵐg⁻¹u⁺ and g fixes 0 and ∞, so gℓ = pᵐℓ. As ℓ(z·1_(ℤ_p)) = 1, the orbit of ℓ is unbounded as m → −∞, and ℓ is not G-bounded. Directly, ℓ does not extend continuously to Π: the class of F_m = p⁻ᵐz·1_(p²ᵐℤ_p), m ≥ 1, has norm at most its sup norm p⁻ᵐ, while |ℓ(F_m)| = |p⁻ᵐ| = pᵐ. The functional δ₁ − δ₀ has norm at most 1 on Π, and G, acting isometrically, keeps its orbit in the unit ball of Π*; bounded subsets of Π^an are bounded in Π, so its restriction to Π^an is G-bounded, and it lies on both sides of (c). The orbit of ℓ under GL₂(ℤ_p) is bounded, by equicontinuity of a compact group on the barrelled space Π^an. So all of (Π^an)′_b, or the vectors bounded under a compact open subgroup, in place of the G-bounded vectors would put ℓ on the left of (c).

*Needs:* §§4.7–4.9; PadicLocalLanglandsForGL2Qp §§0.1, 2.5 and 3.11; Mathlib `WithSeminorms.banach_steinhaus`.

### 4.11 Occurrence and finite length for finite-dimensional Galois representations

For a finite-dimensional continuous L-representation V of G_ℚ_p and supercuspidal M ∈ ΦNᵖ_n, prove the following (CDN20, Théorème 2.15, line 1090, with Lemmes 2.17–2.18):

- Hom_(G_ℚ_p)(V, H¹_ét[M]) ≠ 0 exactly when, after a finite extension of L, V has a quotient V_(M,ℒ).
- Its strong dual Π_M(V) is an admissible unitary Banach representation of finite length whose irreducible constituents are among the Π_(M,ℒ).

No exactness of V ↦ Π_M(V) is asserted. The route treats the case where no quotient V_(M,ℒ) occurs first. Then the period multiplicity subspace of M_dR⊗H_C(V) is transverse to every line, so it is the graph of a partial operator A: S → H_C(V) with no nonzero invariant subspace. Apply §4.3 with distinct eigenvalues to embed the pro-étale Hom into a sum of analytic duals for distinct lines. Taking bounded vectors (§4.10) gives a sum of pairwise non-isomorphic irreducible Banach duals, which forces vanishing. When a permitted quotient exists, induct on dim V using the left-exact Hom sequence and the finite-length Banach category of the base roadmap §0.1.

**Checks.**

- A non-split extension V of V_(M,ℒ) by a character has the quotient V_(M,ℒ). The theorem applies to it without assuming V semisimple.
- For V = V_(M,ℒ)⊕V_(M,ℒ′) with ℒ ≠ ℒ′, Π_M(V) = Π_(M,ℒ)⊕Π_(M,ℒ′) has length two.
- For V a character, the Hom into a supercuspidal sector vanishes (§4.6).

*Needs:* §§4.3, 4.5, 4.6 and 4.10; PadicLocalLanglandsForGL2Qp §§0.1 and 3.8.

### 4.12 Banach multiplicities in differentials

Let Π be an absolutely irreducible admissible unitary Banach L-representation of G. Prove that Hom_G(Π*, L⊗Ω¹(M^p_(n,ℚ_p))), the continuous G-maps out of the Banach dual Π* of Conventions, is:

- ℒ⊗JL(M) if Π ≅ Π_(M,ℒ) for a supercuspidal M ∈ ΦNᵖ_n;
- δ_Ǧ if Π ≅ St^cont⊗δ_G with Sp⊗δ ∈ ΦNᵖ_n, that is, δ(p)² = 1 and δ∘Nrd trivial on K_D(n);
- 0 otherwise.

The line ℒ is part of the answer, not an unnamed one-dimensional space. Source: CDN23, Proposition 5.7 (line 2424), whose proof decomposes over M ∈ ΦNᵖ (line 2434). The statement prints the condition as level ≤ n (source correction E15). The route has three steps. For supercuspidal M, apply Hom_G(Π*, −) to 0 → (Π^an_(M,ℒ))′_b → Ω¹[M]^(G_ℚ_p) → (M_dR/ℒ)⊗LL(M)′_b → 0 from §3.3(ii), in which M_dR is the Hyodo–Kato one of §4.1 by §3.3(iii), as §4.13 requires. A second line ℒ′ bounds the dimension by one. For special M, use §4.2.

**Checks.**

- Let π₀ have trivial central character and χ be unramified with χ(p) = 1+p, and let M be the type with LL(M) = π₀⊗χ∘det (§0.4(a)). Then M has level at most n but M ∉ ΦNᵖ, and Hom_G(Π_(M,ℒ)*, L⊗Ω¹(M^p_(n,ℚ_p))) = 0. The printed condition "level ≤ n" would predict ℒ⊗JL(M).
- For an ordinary absolutely irreducible Π, Hom_G(Π*, (Π^an_(M,ℒ))′_b) = 0 and Hom_G(Π*, LL(M)′_b) = 0, so the multiplicity vanishes.
- For Π = Π_(M,ℒ), Hom_G(Π*, (Π^an_(M,ℒ′))′_b) = 0 for ℒ′ ≠ ℒ, which bounds the dimension by one.

*Needs:* §§0.1, 3.3, 4.2 and 4.10; PadicLocalLanglandsForGL2Qp §§3.8 and 4.2; CompletedCohomologyAndLocalGlobalCompatibility §6.3.

### 4.13 Banach multiplicities in étale cohomology

With Π as in §4.12, prove that Hom_G(Π*, H¹_ét(M^p_(n,C), L(1))) is G_ℚ_p×Ǧ-equivariantly and topologically isomorphic to:

- V_(M,ℒ)⊗JL(M) for Π ≅ Π_(M,ℒ) with supercuspidal M ∈ ΦNᵖ_n;
- δ⊗δ_Ǧ for Π ≅ St^cont⊗δ_G with Sp⊗δ ∈ ΦNᵖ_n;
- 0 otherwise.

Source: CDN23, Théorème 5.8 (line 2465), with the condition corrected as in §4.12 (source correction E15). Prove first that restriction gives an isomorphism Hom_G((Π^an)′_b, H¹_proét) ≅ Hom_G(Π*, H¹_ét) (CDN23, Lemme 5.9, line 2481). Injectivity uses density of Π* in (Π^an)′_b. Surjectivity extends a map along Π*⊗_(Λ(K))D(K) ≅ (Π^an)′_b, the Schneider–Teitelbaum identification of the base roadmap §0.1. Then apply Hom_G((Π^an)′_b, −) to the exact sequence 0 → H¹_proét[M] → Ω¹[M] → ((C⊗M_dR)/X⁺_st(M))⊗̂LL(M)′_b → 0 derived from §4.1. The completed tensor-Hom identity Hom(E, F⊗̂D) ≅ Hom(E,F)⊗̂D for nuclear Fréchet E and Fréchet F, D (CDN23, Lemme 5.4, line 2401) and §4.12 give the kernel X⁺_st(M) ∩ (ℒ⊗C) = V_(M,ℒ).

**Checks.**

- The Hom is from Π* into cohomology. Reversing the direction would replace V_(M,ℒ) by its dual.
- For Π = Π_(M,ℒ) the answer is two-dimensional over L times JL(M), not one-dimensional as in §4.12. The Galois factor V_(M,ℒ) replaces the line ℒ.
- For the unramified twist of §4.12 the answer is 0.

*Needs:* §§4.1, 4.9, 4.10 and 4.12; PadicLocalLanglandsForGL2Qp §0.1; LocallyAnalyticDistributions §§0.0 and 0.3.

### 4.14 Galois multiplicities and vanishing in higher dimension

For an absolutely irreducible continuous L-representation V of G_ℚ_p, prove that Hom_(W_ℚ_p)(V, H¹_ét(M^p_(n,C), L(1))) is:

- Π(V)*⊗JL(M) if V ≅ V_(M,ℒ) with supercuspidal M ∈ ΦNᵖ_n;
- (St^cont⊗δ_G)*⊗δ_Ǧ if V = δ is a character with Sp⊗δ ∈ ΦNᵖ_n;
- 0 otherwise.

In particular the multiplicity is 0 for dim V ≥ 3. Sources: CDN20, Théorème 0.2 (line 130) and Corollaire 2.16 (line 1108); CDN23, Théorème 5.1 (line 2357) and Théorème 5.10 (line 2541). On the full tower M_n the source condition is level ≤ n (CDN23, Théorème 5.1); on the p-central quotient it is membership in ΦNᵖ_n (source correction E15). Weil equivariance extends to G_ℚ_p-equivariance by continuity of the descended action.

For dimension two the route uses §§4.6 and 4.10, and for dimension one §4.2. For dimension at least three there are two routes:

- the occurrence theorem §4.11, valid for every p;
- for p > 2, the finite length of the mod p cohomology (ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §5.4). It makes the strong dual Π_n(V) of Hom_(W_ℚ_p)(V, H¹_ét(M^p_(n,C), L(1))) an admissible unitary Banach representation of finite length. After a finite extension of L it has an absolutely irreducible quotient Π. The transpose of Π_n(V) → Π embeds Π* into Hom_(W_ℚ_p)(V, H¹_ét(M^p_(n,C), L(1))), the Banach dual of Π_n(V), and so gives a nonzero, hence injective, W_ℚ_p-map from V into Hom_G(Π*, H¹_ét(M^p_(n,C), L(1))). For dim V ≥ 3 this contradicts §4.13, whose answers have Galois constituents of dimension at most two (source correction E24).

**Checks.**

- An absolutely irreducible V of dimension three has multiplicity 0.
- A character δ with δ(p)² = 1 and δ∘Nrd of level ≤ n contributes through the Steinberg branch. It is not a supercuspidal exception.
- The unramified twist with χ(p) = 1+p of §0.1 gives V ≅ V_(M,ℒ) with M ∉ ΦNᵖ. Its multiplicity on M^p_n is 0, although on the full tower it is nonzero.

*Needs:* §§4.2, 4.6, 4.10, 4.11 and 4.13; PadicLocalLanglandsForGL2Qp §0.1; ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §5.4.

### Examples

For supercuspidal M ∈ ΦNᵖ_n and ℒ ⊂ M_dR, the three multiplicities are as follows:

- of Π_(M,ℒ)* in Ω¹: ℒ⊗JL(M), of dimension dim JL(M);
- of Π_(M,ℒ)* in H¹_ét: V_(M,ℒ)⊗JL(M), of dimension 2·dim JL(M);
- of V_(M,ℒ) in H¹_ét: Π_(M,ℒ)*⊗JL(M).

For the Steinberg type Sp, H¹_ét[Sp] is (St^cont)* with trivial Galois action.

### Dependencies

Layers 0 and 3; PadicLocalLanglandsForGL2Qp §§0.1, 2.5, 3.8, 3.11, 4.2 and 4.8; LocallyAnalyticRepresentationsOfLocalGroups §5.1; CompletedCohomologyAndLocalGlobalCompatibility §6.3; ProetaleCohomologyOfPAdicCurvesAndTowers §§0.3, 0.4, 6.2, 6.5, 6.9, 7.1–7.3 and 7.5; ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §5.4; EndoscopicTransferAndUnitaryTraceComparison §§12.4, 12.5, 12.7, 12.14 and 12.19; LocallyAnalyticDistributions §§0.0, 0.2 and 0.3; gap:continuous-galois-tensor-comparison; PadicHodgeTheory §§3.3, 4.4 and 5.3–5.4; SmoothRepresentationsOfLocalGroups SR.2; Mathlib `Bornology.IsVonNBounded`, `NormedSpace.image_isVonNBounded_iff`, `WithSeminorms.image_isVonNBounded_iff_seminorm_bounded`, `WithSeminorms.banach_steinhaus`, `Submodule`, `LinearMap`, `Module.finrank` and `Module.Basis`.

## Layer 5: The integral arithmetic block decomposition

Fix n. Write H^(1,+)_(k,K) = H¹_ét(M^p_(n,K), (O_L/p^k)(1)) for finite K/ℚ_p and H^(1,+)_(k,C) for the geometric fibre. In this layer p > 2, the hypothesis under which the mod p finiteness input holds (CDN23 lines 1776 and 1795).

### 5.1 Arithmetic completed cohomology at fixed level

Define H^(1,+)_(k,ℚ̄_p) = colim_([K:ℚ_p]<∞) H^(1,+)_(k,K), H^(1,+)_(ℚ̄_p) = lim_k H^(1,+)_(k,ℚ̄_p) and H¹_(ℚ̄_p) = L⊗_(O_L)H^(1,+)_(ℚ̄_p). The level n stays fixed; only K and k vary (CDN23, §5.3.1, lines 2627–2634). The topologies are those of the stages, not the p-adic topology. Each H^(1,+)_(k,K) is profinite: it is the projective limit of the discrete groups H¹_ét(U_i⊗K, (O_L/p^k)(1)) over the increasing affinoid covering (U_i) of M^p_n by the preimages of the balls of the Bruhat–Tits tree (EndoscopicTransferAndUnitaryTraceComparison §§12.4–12.5, as in §3.1), and the compact dual of a smooth representation of finite length (ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §5.4, transported to the twisted coefficients as in the supplier contract; CDN23, Théorème 2.1, line 1064, and §2.1.3, lines 1262–1271). H^(1,+)_(k,C) carries the projective limit topology over the same covering, and H^(1,+)_C := H¹_ét(M^p_(n,C), O_L(1)) = lim_k H^(1,+)_(k,C) the projective limit topology. H^(1,+)_(k,ℚ̄_p) carries the inductive limit topology along a cofinal increasing sequence of finite extensions K of ℚ_p, H^(1,+)_(ℚ̄_p) the projective limit topology over k (CDN23, Remarque 5.20, line 2691), and H¹_(ℚ̄_p) = ∪_N p^(−N)H^(1,+)_(ℚ̄_p) the inductive limit topology.

Prove that H^(1,+)_(ℚ̄_p) → H^(1,+)_C is injective. Its image is the set of almost-smooth classes: those whose reduction modulo p^k is fixed by an open subgroup of G_ℚ_p for every k, the subgroup depending on k (CDN23, Proposition 5.16, line 2635). The route uses the Hochschild–Serre sequence for G_K acting on H^(1,+)_(k,C). H⁰ of the geometric fibre is finite because M^p_(n,C) has finitely many connected components (ProetaleCohomologyOfPAdicCurvesAndTowers §7.3), so colim_K H^j(G_K, H⁰) = 0 for j = 1, 2, and H^(1,+)_(k,ℚ̄_p) → H^(1,+)_(k,C) is injective with image the G_ℚ_p-smooth classes (CDN23 line 2644). Each H^(1,+)_(k,K) → H^(1,+)_(k,C) is induced by a map of projective systems of discrete groups, hence continuous, so H^(1,+)_(k,ℚ̄_p) injects continuously into a Hausdorff space and is Hausdorff. Hence p^kH^(1,+)_(ℚ̄_p), the kernel of the projection to H^(1,+)_(k,ℚ̄_p) (§5.2), is closed. It is not open in general (Checks): p-adic separatedness and completeness (§5.2) are algebraic properties of a module whose topology is coarser than the p-adic one.

Its API:

- H^(1,+)_(ℚ̄_p) and H¹_(ℚ̄_p) are defined by the stated limits, with the stated topologies. The prime p is inverted after both limits.
- Each finite-K stage is profinite. G and Ǧ act continuously on it. G_ℚ_p acts smoothly on H^(1,+)_(k,ℚ̄_p) and maps the image of each finite-K stage onto the image of a conjugate stage. Hence G×Ǧ×G_ℚ_p acts continuously on H^(1,+)_(ℚ̄_p).
- The map to H^(1,+)_C is G×Ǧ×G_ℚ_p-equivariant, continuous and injective, with image the almost-smooth classes.
- Restriction and corestriction in n commute with the arithmetic and geometric maps; the definition keeps n fixed.

**Checks.**

- An almost-smooth class may need a smaller open subgroup for each k. Requiring one open subgroup for the whole integral class gives a strictly smaller set in general.
- L⊗lim_k is not lim_k(L⊗−): the latter vanishes on the p^k-torsion groups H^(1,+)_(k,K).
- Replacing the fixed level by a limit over n gives a different object. No limit over n enters the factorisation.
- The topology is not the p-adic one. Take p = 5, L = ℚ_5, n = 0 and a finite K containing ℚ_25, over which M^p_0 splits as two copies of Ω (Conventions). On one copy take the integral mass-zero measures μ_j = δ_(5^j) − δ₀ on ℙ¹(ℚ_5), for j ≥ 0. They are classes of H¹_ét(Ω_C, ℤ_5(1)) ≅ Sp_1(ℤ_5)^* on which G_K acts trivially (ProetaleCohomologyOfPAdicCurvesAndTowers §6.9), so they are almost smooth and lie in H^(1,+)_(ℚ̄_p). The indicator of 5^jℤ_5^× pairs to 1 with μ_j and to 0 with μ_l for l ≠ j, so the reductions of the μ_j modulo 5 are pairwise distinct points of (H^(1,+)_(ℚ̄_p)/5)^(G_K). In the topology above μ_j → 0, since every locally constant f has f(5^j) = f(0) for large j, and this invariant piece is an infinite profinite group, as §5.2 asserts. In the p-adic topology it would be an infinite discrete space, hence not compact. Moreover u(5^j)(δ₀ − δ_∞) − (δ₀ − δ_∞) = μ_j never lies in 5H^(1,+)_C, so G would not act continuously although u(5^j) → 1.

*Needs:* EndoscopicTransferAndUnitaryTraceComparison §§12.4, 12.5 and 12.19; ProetaleCohomologyOfPAdicCurvesAndTowers §7.3; ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §5.4.

### 5.2 Saturation and finite-K pieces

Prove that H^(1,+)_(ℚ̄_p) is p-torsion-free, p-adically complete and p-saturated in H^(1,+)_C, that the reduction H^(1,+)_(ℚ̄_p)/p^k → H^(1,+)_(k,ℚ̄_p) is injective, and that each H^(1,+)_(ℚ̄_p)/p^k is a smooth G_ℚ_p-module (CDN23, Corollaire 5.17, line 2658, with the factorisation of the reduction through H^(1,+)_C/p^k, line 2649). Completeness is the algebraic statement H^(1,+)_(ℚ̄_p) = lim_k H^(1,+)_(ℚ̄_p)/p^k. Give H^(1,+)_(ℚ̄_p)/p^k the topology induced from H^(1,+)_(k,ℚ̄_p) of §5.1. The identification is then also topological, since a projective limit carries the limit topology of its images in the stages, each with the topology induced from its stage (CDN23, Remarque 5.20, line 2691).

Prove that for every finite K/ℚ_p and k ≥ 1, (H^(1,+)_(ℚ̄_p)/p^k)^(G_K) with its induced topology is the Pontryagin dual of a smooth O_L[G′]-representation of finite length, where G′ = G/p^ℤ (CDN23, Proposition 5.19, line 2673). The route embeds it continuously into (H^(1,+)_(k,C))^(G_K), which is profinite and dual to a representation of finite length by ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §5.4, transported to these invariants and coefficients as in the supplier contract. For compact open H ⊂ G the induced O_L[[H]]-module is finitely generated and separated, so its given topology is the compact module topology.

Prove finally that H^(1,+)_(ℚ̄_p)/p^k carries the inductive limit topology of these compact pieces along a cofinal increasing sequence of finite extensions K. The route has two steps. The intersection of H^(1,+)_(ℚ̄_p)/p^k with the image of each H^(1,+)_(k,K) is closed (CDN23, Remarque 5.20, lines 2697–2715). So H^(1,+)_(ℚ̄_p)/p^k is closed in the countable inductive limit H^(1,+)_(k,ℚ̄_p) of compact Hausdorff spaces, and a closed subspace of such a limit carries the inductive limit topology of its intersections with the stages. These intersections and the invariant pieces are mutually cofinal: the image of H^(1,+)_(k,K) is G_K-fixed, and by the finite Hochschild–Serre error terms of §5.1 the G_K-invariants lie in the image of H^(1,+)_(k,K′) for a finite extension K′ of K.

**Checks.**

- The invariant piece is compact in the topology induced from the stages of §5.1. In the p-adic topology it would be discrete, and in the level-zero example of §5.1, Checks, it is infinite. Algebraic finite generation over O_L[[H]] alone is not the topological assertion.
- p-saturation means that x ∈ H^(1,+)_C with px ∈ H^(1,+)_(ℚ̄_p) lies in H^(1,+)_(ℚ̄_p). The sublattice p·H^(1,+)_(ℚ̄_p) is also p-torsion-free and p-adically complete but is not saturated when nonzero: an x outside it has px inside it.
- For k = 1 the pieces are duals of finite-length smooth (O_L/p)[G′]-modules, with k_L-valued composition factors. For L = ℚ_p(ϖ) with ϖ² = p, ϖ·1 ≠ 0 in O_L/p = O_L/ϖ², whereas ϖ kills k_L. The filtration 0 ⊂ ϖO_L/ϖ² ⊂ O_L/ϖ² has two k_L factors. Reduction modulo ϖ, rather than p, gives k_L coefficients.

*Needs:* §5.1; ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §5.4; ProetaleCohomologyOfPAdicCurvesAndTowers §7.3.

### 5.3 Cohomological block multiplicities

Use the base roadmap's projective envelope P_B of a block B, E_B = End(P_B) with ordinary composition, and R_B^ps (§§5.1–5.4). Define the following (CDN23 lines 2716–2745 and 2757–2769):

- m_(n,B) = Hom^cont_G(P_B, H^(1,+)_(ℚ̄_p)), continuity being for the compact topology of P_B and the topology of §5.1 on the target. As a module m_(n,B) is p-torsion-free, separated and complete for its own p-adic topology (CDN23 lines 2743–2745), by §5.2: m_(n,B)/p^k injects into Hom_G(P_B, H^(1,+)_(ℚ̄_p)/p^k), and m_(n,B) = lim_k Hom_G(P_B, H^(1,+)_(ℚ̄_p)/p^k) because H^(1,+)_(ℚ̄_p) = lim_k H^(1,+)_(ℚ̄_p)/p^k topologically. This p-adic topology is a topology on the multiplicity module, not on H^(1,+)_(ℚ̄_p);
- its continuous O_L-dual m̌_(n,B) = Hom^cont_(O_L)(m_(n,B), O_L) for the p-adic topology of m_(n,B), which is the module of all O_L-linear maps, with the topology of pointwise convergence;
- after inverting p and taking the M-part, m_(B,M) = Hom^cont_G×Ǧ(P_B⊗JL(M), H¹_(ℚ̄_p)).

Hom(P_B, −) is a right E_B-module, so evaluation m_B(X)⊗̂_(E_B)P_B → X is balanced (base roadmap, Conventions).

Its API:

- Evaluation sends f⊗x to f(x), with f·e ⊗ x and f ⊗ e·x identified for e ∈ E_B.
- m̌_(n,B) is a compact p-torsion-free O_L-module, being closed in the product of copies of O_L indexed by m_(n,B). It is the O_L-dual of m_(n,B), not m_(n,B) itself.
- m_B(H¹_(ℚ̄_p)) = L⊗m_(n,B), by compactness of P_B: a compact subset of the inductive limit H¹_(ℚ̄_p) of the Hausdorff spaces p^(−N)H^(1,+)_(ℚ̄_p) lies in one of them.
- G_ℚ_p acts on m_(n,B) by postcomposition and commutes with E_B and with R_B^ps.
- m_(B,M) = Hom_G(P_B, H¹_(ℚ̄_p)[M]).

**Checks.**

- If X lies in a block B′ ≠ B, Hom(P_B, X) = 0.
- For X = Y⊗JL(M) with Ǧ acting only on the second factor, m_(B,M)(X) ≅ Hom_G(P_B, Y).
- The O_L-valued dual m̌_(n,B) is compact and p-torsion-free. The Pontryagin dual Hom^cont(m_(n,B), L/O_L) is p-power torsion: each of its elements kills some p^k·m_(n,B). For m_(n,B) = O_L the first is O_L, finitely generated, and the second is L/O_L, which is not finitely generated over O_L. Confusing the two changes the finiteness statement of §5.5.

*Needs:* §§0.2 and 5.1; PadicLocalLanglandsForGL2Qp §§5.1–5.4.

### 5.4 Integral block evaluation

Prove that evaluation identifies H^(1,+)_(ℚ̄_p) with the p-adic completion of ⊕_B m_(n,B)⊗_(E_B)P_B, and that m_(n,B)/p^k ≅ Hom_G(P_B, H^(1,+)_(ℚ̄_p)/p^k) (CDN23, Proposition 5.21, line 2716). The completion is the algebraic one, the projective limit of the reductions modulo p^k. The topologies are those of the stages of §5.1, not the p-adic topology and not the discrete topology on the reductions. Modulo p^k, evaluation is the inductive limit over K of the evaluation isomorphisms of the compact finite-K pieces. Each of these is a homeomorphism, being a continuous bijection of compact Hausdorff spaces. So, by §5.2, the evaluation modulo p^k is a topological isomorphism onto H^(1,+)_(ℚ̄_p)/p^k when its source carries the inductive limit topology of the finite-K pieces, and the identification is topological in the limit over k. The route has four steps:

- On each finite-K piece of §5.2, which is compact of finite length, apply the Gabriel–Morita decomposition of the base roadmap §§5.1 and 5.3.
- Pass through colim_K using compactness of P_B. By §5.2, H^(1,+)_(ℚ̄_p)/p^k is the inductive limit of a countable increasing family of compact pieces, so the image of a continuous map from P_B lies in one of them (CDN23 line 2729).
- For surjectivity of reduction, finite length puts a map P_B → (X/p^j)^(G_K) into the image of one (X/pʲ⁺¹)^(G_K′), and projectivity of P_B lifts it.
- Pass to the p-adic limit.

This extends the base roadmap's compact Morita evaluation to the noncompact p-adically complete target.

**Checks.**

- Modulo p^k each vector has finite block support, but the finite set of blocks may grow with k.
- The completed sum is neither the algebraic direct sum nor the product over all blocks. An element with nonzero components in infinitely many blocks, tending to zero p-adically, lies in it.
- m_(n,B) is p-torsion-free, so m_(n,B)/p^k → Hom(P_B, X/p^k) is injective. Surjectivity is the content of the lifting step.
- With the discrete topology on X/p^k a continuous map out of the compact P_B would have finite image. Take p = 5, L = ℚ_5 and n = 0. Geometrically M^p_0 is two copies of Ω, and g ∈ G preserves each copy when v_5(det g) is even and exchanges them when it is odd (§3.1, Checks). The diagonal integral Steinberg classes (μ, μ), μ ∈ Sp_1(ℤ_5)^* (ProetaleCohomologyOfPAdicCurvesAndTowers §6.9), form a G-stable subgroup, since g(μ, μ) = (gμ, gμ) in both cases; they are fixed by G_ℚ_5, Frobenius only exchanging the copies, so they lie in X and their reductions modulo 5 form a G-stable copy of Sp_1(𝔽_5)^* in (X/5)^(G_K) for every finite K. A single copy does not: for g = diag(5,1) and μ = δ₀ − δ_∞, gμ = μ but g(μ, 0) = (0, μ) ≠ (μ, 0). Since Sp_1(𝔽_5) is irreducible and infinite-dimensional, Sp_1(𝔽_5)^* has no nonzero finite G-stable subgroup: its dual would be a nonzero finite-dimensional quotient of Sp_1(𝔽_5). For the block B containing Sp_1(𝔽_5), P_B maps onto Sp_1(𝔽_5)^*, and onto the diagonal copy, by a map continuous for the topology of §5.2 but not for the discrete one. So the discrete topology would lose this part of m_(n,B)/5.

*Needs:* §§5.2–5.3; PadicLocalLanglandsForGL2Qp §§5.1 and 5.3.

### 5.5 Finite generation of the dual multiplicity

Prove that m̌_(n,B) is a finitely generated R_B^ps-module (CDN23, Théorème 5.22, line 2746). This concerns the O_L-dual; m_(n,B) itself is not asserted to be finitely generated. The route uses topological Nakayama. It injects (m_(n,B)/ϖ)[𝔪] into Hom_G(k_L⊗_(R_B^ps)P_B, H¹_ét(M^p_(n,C), k_L(1))). By Paškūnas–Tung (base roadmap §6.7), k_L⊗P_B = π^∨ for a smooth admissible π of finite length. The Hom is then finite-dimensional by ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §5.4.

**Checks.**

- The residual Hom is finite-dimensional. Finite length of the arithmetic invariants alone does not bound this geometric multiplicity.
- For a block with no constituent in the cohomology, m̌_(n,B) = 0, which is finitely generated.
- Topological Nakayama applies because m̌_(n,B) is compact. For the p-power-torsion Pontryagin dual it fails: L/O_L = ϖ·(L/O_L) has zero reduction modulo the maximal ideal of O_L but is not zero.

*Needs:* §§5.3–5.4; PadicLocalLanglandsForGL2Qp §§5.4 and 6.7; ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §5.4.

### 5.6 Type decomposition, level stability and central character

Prove the following (CDN23, Remarque 5.23, lines 2762–2776):

- Only finitely many M have H¹_(ℚ̄_p)[M] ≠ 0, and H¹_(ℚ̄_p) = ⊕_M H¹_(ℚ̄_p)[M]⊗JL(M), hence m_B(H¹_(ℚ̄_p)) = ⊕_M m_(B,M)⊗JL(M).
- For n at least the level of M, m_(B,M) is independent of n. Since p is inverted, Ǧ-equivariant projectors are built by composing restrictions and corestrictions.
- Z(G) acts on m_(B,M) by a character δ_M, the inverse of the central character of JL(M), because the diagonal centre acts trivially on the tower (EndoscopicTransferAndUnitaryTraceComparison §12.14).

**Checks.**

- The rational level-independence assertion uses averaging over K_D(n)/K_D(n′), whose finite order is invertible in L. For n = 0, n′ = 1 its order is p²−1, equal to 3 at p = 2 and 8 at p = 3; for 1 ≤ n ≤ n′ the order is a power of p. Rational averaging alone makes no integral level-independence assertion.
- For X = Y⊗JL(M) with the diagonal centre acting trivially, z ∈ Z(G) acts on Y by ω_(JL(M))(z)⁻¹. Omitting the inverse would give the wrong fixed-determinant ring R_B^(ps,δ_M).
- For special M = Sp⊗δ, δ_M = δ⁻² as a character of ℚ_p^×.

*Needs:* §§0.1, 0.2, 5.1 and 5.3; EndoscopicTransferAndUnitaryTraceComparison §12.14.

### Examples

For a block B containing no constituent of H¹_ét(M^p_(n,C), k_L), m_(n,B) = 0. For the block of the Steinberg reduction St⊗η̄, the special type Sp⊗η contributes the character η of G_ℚ_p (§6.2).

### Dependencies

Layer 0; PadicLocalLanglandsForGL2Qp §§5.1–5.4 and 6.7; EndoscopicTransferAndUnitaryTraceComparison §§12.4, 12.5, 12.14 and 12.19; ProetaleCohomologyOfPAdicCurvesAndTowers §7.3; ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §5.4.

## Layer 6: Interpolated factorisation over type rings

The full-type ring R_(B,M), its integral image R⁺_(B,M) and its free rank-two family ρ_(B,M) are those of the base roadmap §5.12, compared with deformation rings by LocalGaloisDeformationRings §3.8. Both suppliers index them by D_pst of the points. For a type M of Conventions they are the base's R^[0,1]_(M°,B), LL^[0,1]_B(M°) and ρ^[0,1]_(M°) with M° = M[−1] (§0.4(a)). Since LL^[0,1](M°) = LL_p(M°) = LL(M), R_(B,M) = End_G(LL_B(M)) for the B-adic completion LL_B(M) of LL(M), and the closed points are the V_(M,ℒ) whose reduction has semisimplification ρ̄_B (§0.3). R_(B,M) is a finite product of principal ideal domains; it is zero when the type locus in B is empty.

### 6.1 The interpolated Banach dual

Let M be supercuspidal. Choose a G_ℚ_p-stable R⁺_(B,M)-lattice ρ^(⋄,+) in the R_(B,M)-dual of ρ_(B,M). Write its Pontryagin dual as colim_i V_i over finite quotients of R⁺_(B,M), and define Π*(ρ_(B,M)) = L⊗_(O_L) lim_i Π(V_i)^∨, using the integral correspondence of the base roadmap §§3.3 and 3.8 on each finite-length V_i (CDN23, Définition 5.14, line 2606). Prove the following:

- Π*(ρ_(B,M)) is independent of the lattice up to compatible canonical isomorphism.
- It agrees with the rationalisation of D(ρ^(⋄,+))^♮⊠ℙ¹, and with Hom^cont_(R_(B,M))(LL_B(M), R_(B,M)) for the B-adic completion LL_B(M) of the base §5.12.
- κ(x)⊗_(R_(B,M))Π*(ρ_(B,M)) ≅ Π(ρ_x)* at every closed point x, Π(ρ_x)* being the Banach dual of Conventions.

The fibre property is a theorem about the construction, not its definition. For absolutely irreducible ρ̄_B, at every prime p, prove its comparison with the universal family Π^univ of the base §5.8 taken for the residual representation ρ̄_B⊗ε̄⁻¹, ε being the cyclotomic character: at a closed point x of R_(B,M), the κ(x)-valued point y of the universal deformation space of ρ̄_B⊗ε̄⁻¹ defined by ρ_y = ρ_x⊗ε⁻¹ has fibre Π(ρ_y(ε)) = Π(ρ_x), and κ(x)⊗_(R_(B,M))Π*(ρ_(B,M)) is the Banach dual of that fibre, in the sense of Conventions.

Its API:

- Π*(ρ) = L⊗lim_iΠ(V_i)^∨ from the stable dual lattice and its finite quotients.
- For closed x, κ(x)⊗Π*(ρ) ≅ Π(ρ_x)*, G-equivariantly.
- Commensurable stable lattices give the same rational object.
- Π*(ρ) ≅ Hom^cont_(R_(B,M))(LL_B(M), R_(B,M)), with the B-adic topology.
- If R_(B,M) = 0, then Π*(ρ) = 0.

**Checks.**

- At a closed point x the fibre is Π(V_(M,ℒ_x))*, with ℒ_x the line of the Galois fibre ρ_x (§0.3).
- An empty type locus gives zero, not a residual constant family.
- Two R_(B,M)-modules can have the same closed fibres and differ by non-separated or non-finite pieces, so the construction must keep the integral limit. Using a lattice in ρ rather than in its dual, with the same integral correspondence, reverses the duality convention.
- The ring is indexed by M° = M[−1]. At a closed point x, D_pst(ρ_x) ≅ M° and LL^[0,1](M°) = LL(M) is the smooth part of the unitary Π(ρ_x), so its central character ζ is unitary, as the base §5.12 requires. Indexing by M itself would take the points with D_pst ≅ M, whose smooth factor LL_p(M) = LL(M)⊗(η∘det) has central character ζη² with η(p)² ∈ {p², p⁻²} (§0.4, Checks), of absolute value p^(∓2) at p, which is not unitary.
- The twist in the comparison with Π^univ is witnessed by central characters. Taking the family of ρ̄_B itself at the point ρ_y = ρ_x gives the fibre Π(ρ_x(ε)), with central character det(ρ_x)·ε, while Π(ρ_x) has central character det(ρ_x)·ε⁻¹. Their ratio ε² has infinite order, so the residual representation must be twisted by ε̄⁻¹.

*Needs:* §§0.3 and 0.4; PadicLocalLanglandsForGL2Qp §§3.3, 3.5, 3.6, 3.8, 5.8 and 5.12; LocalGaloisDeformationRings §3.8.

### 6.2 The special-type convention

For special M = Sp⊗η, put R_(B,M) = L. If B is the block of St⊗η̄_G, put ρ_(B,M) = η, a character of G_ℚ_p through reciprocity, and Π*(ρ_(B,M)) = (St^cont⊗η_G)*. For every other block put ρ_(B,M) = 0 and Π*(ρ_(B,M)) = 0 (CDN23, §5.2, lines 2553–2557).

Its API:

- R_(B,M) = L for special M.
- In the Steinberg block the Galois factor is η, of rank one, and the G-factor is (St^cont⊗η_G)*.
- In all other blocks the contribution is zero.

**Checks.**

- For η = 1 the Galois factor is L with trivial action, not a rank-two semistable extension.
- A block not containing St⊗η̄_G contributes zero.
- Replacing η by ηχ twists the Galois factor by χ, JL(M) by χ_Ǧ and the G-factor by χ_G⁻¹, since (St^cont⊗η_Gχ_G)* = (St^cont⊗η_G)*⊗χ_G⁻¹ for the dual action of Conventions. When the reduction of χ is nontrivial the Steinberg block moves to that of St⊗η̄_Gχ̄_G. This matches §4.14.
- At p = 7 let χ be a character of ℚ_7^× of order three with χ(7) = 1, trivial on 1+7ℤ_7, and a ∈ ℤ_7^× with χ(a) = ζ₃. Then (ηχ)(7)² = η(7)², so Sp⊗ηχ stays in ΦNᵖ. The scalar aI₂ acts on St^cont⊗η_Gχ_G by η(a²)ζ₃², hence on its dual by η(a²)⁻¹ζ₃, which is its scalar on (St^cont⊗η_G)*⊗χ_G⁻¹; twisting the dual by χ_G would give η(a²)⁻¹ζ₃². A quadratic χ equals its inverse and cannot detect the error.

*Needs:* §§4.2 and 5.6; PadicLocalLanglandsForGL2Qp §§5.1–5.2.

### 6.3 Rigidity over principal ideal domains

Let A be a field, or a principal ideal domain with infinitely many maximal ideals, or a finite product of such rings. Let V and W be representations of G_ℚ_p on finitely generated locally free A-modules whose specialisations at every closed point are absolutely irreducible. If these specialisations are pairwise isomorphic at every closed point, then V ≅ W (CDN23, Lemme 5.12, line 2574). The route below holds in every characteristic and shows that the generic fibres are absolutely irreducible before comparing traces (source correction E23). A finite product splits along its idempotents, so let A be one principal ideal domain, with fraction field F. If A is a field, its only closed point is its generic point and the hypothesis is the conclusion; so let A have infinitely many maximal ideals. Then V and W are free, of the same rank since their fibres are isomorphic. Put H = Hom_(A[G_ℚ_p])(V, W), an A-submodule of the finite free module Hom_A(V, W).

- (Saturation.) If a ≠ 0 and aφ is G_ℚ_p-equivariant, then so is φ, since Hom_A(V, W) is torsion-free. So H is saturated, hence a direct summand of Hom_A(V, W), and for every maximal ideal 𝔪_x the map H/𝔪_xH → Hom_(κ(x)[G_ℚ_p])(V_x, W_x) is injective. Its target is a line by Schur's lemma for the isomorphic absolutely irreducible fibres, so H is free of rank at most one. For W = V the same argument gives End_(F[G_ℚ_p])(V_F) = F⊗_A End_(A[G_ℚ_p])(V) = F.
- (Generic absolute irreducibility.) For a G_ℚ_p-stable subspace U of V_F, the stable submodule U ∩ V is saturated in V, hence a direct summand of rank dim U, and its image in one fibre V_x is a stable subspace of dimension dim U. As V_x is irreducible, U = 0 or U = V_F. So V_F is irreducible with commutant F, the density theorem makes the image of F[G_ℚ_p] all of End_F(V_F), and V_F is absolutely irreducible. The same holds for W_F.
- (Traces.) For every g ∈ G_ℚ_p, tr(g | V) − tr(g | W) lies in every maximal ideal of A. A nonzero element of A lies in only finitely many maximal ideals, and there are infinitely many, so the traces agree. Absolutely irreducible representations over F with the same trace are isomorphic, by the density theorem applied to V_F ⊕ W_F over an algebraic closure. Hence H ≠ 0, and H = Aφ for some φ.
- (Integral isomorphism.) Since Aφ is a direct summand of Hom_A(V, W), φ is nonzero modulo every 𝔪_x, hence an isomorphism V_x → W_x by Schur's lemma. So det φ, computed in bases of V and W, lies in no maximal ideal, is a unit, and φ is an isomorphism.

The same statement and route hold for an A-algebra E that is finite as an A-module, acting A-linearly on V and W and commuting with G_ℚ_p, when the specialisations are isomorphic and absolutely irreducible as modules over (κ(x)⊗_A E)[G_ℚ_p]: replace A[G_ℚ_p] by E[G_ℚ_p] throughout, and compare the traces of the A-linear maps e∘g, e ∈ E and g ∈ G_ℚ_p, which span the image of E[G_ℚ_p].

**Checks.**

- Over a discrete valuation ring O there is only one closed point. Let ρ have absolutely irreducible reduction, and let χ be the unramified character with χ(p) = 1+p. Then V = ρ and W = ρ⊗χ have isomorphic absolutely irreducible reductions, since 1+p ≡ 1 modulo p, but different determinants, since χ(p)² = (1+p)² ≠ 1, so they are not isomorphic. The trace step fails, and the hypothesis of infinitely many maximal ideals is needed. Nontriviality of χ and congruence to 1 do not suffice for this: at p = 2 the unramified quadratic character χ₀ has χ₀(2) = −1 ≡ 1 modulo 2, and ρ⊗χ₀ ≅ ρ for every ρ induced from G_(ℚ_4), since χ₀ is trivial on G_(ℚ_4); inducing a character whose reduction has order 3 on inertia gives such a ρ with absolutely irreducible reduction.
- For A = L[T] and V = W the statement is trivial.
- For A = L, as for R_(B,M) = L in the first Check of §6.5, the closed point is the generic point and V_x ≅ W_x says V ≅ W. A discrete valuation ring also has a single closed point but is not a field, and the first Check shows that the statement fails there; the hypothesis separates the two by asking for a field or for infinitely many maximal ideals.
- For A = L[T], a representation that is reducible over L(T) is reducible modulo every maximal ideal, by the saturation of U ∩ V. So irreducibility of a single closed fibre already forces generic irreducibility, also over a discrete valuation ring; the step that needs infinitely many closed points is the comparison of traces, as the first Check shows.
- For A = L[T] and E = A acting by scalars, E is finite over A but infinite-dimensional over L, and the statement reduces to the one for G_ℚ_p alone. The algebra E_(B,M) of §6.5 is of this kind: it is finite over R_(B,M), and not finite-dimensional over L unless R_(B,M) is. A version requiring E finite-dimensional over L would not apply there.

*Needs:* Mathlib `Submodule` and `Module.Basis`.

### 6.4 The type annihilator

For p > 2 and supercuspidal M ∈ ΦNᵖ_n, prove that R_B^(ps,δ_M)[1/p] acts on m_(B,M) through its quotient R_(B,M). Equivalently, I_(B,M) = ker(R_B^(ps,δ_M)[1/p] → R_(B,M)) kills the whole module, not only its closed fibres (CDN23, Théorème 5.24(i) and its proof, lines 2779–2836). The route proves the annihilation at each torsion stage of a lattice, where finite length is available, and passes to the inverse limit only afterwards.

- (Reduction to a lattice.) By the level reading of §0.2, pullback identifies H¹_proét[M] with the M-multiplicity of H¹_proét(M_∞, L(1)) on the infinite-level tower. It carries H¹_ét[M] = (H¹_proét[M])^b of §4.9 into H¹_ét(M_∞, L(1))[M], injectively, because the composite with the map to H¹_proét(M_∞, L(1))[M] is the injection of §4.9 followed by that identification. The integral form of ProetaleCohomologyOfPAdicCurvesAndTowers §7.5 therefore places H¹_ét[M] inside X⁺_st(M)⊗̂(LL(M)^∧)*, LL(M)^∧ being the universal unitary completion of LL(M), and it suffices that I_(B,M) kills Hom_G(P_B, (LL(M)^∧)*). Since LL(M) is supercuspidal with unitary central character, it has a G-stable O_L-lattice LL(M)⁺ that is finitely generated over O_L[G]; write Y for its p-adic completion and Y^d = Hom^cont_(O_L)(Y, O_L) = lim_k (Y/p^kY)^∨, a compact O_L-module with (LL(M)^∧)* = Y^d[1/p], since Y[1/p] is the universal unitary completion of LL(M) (the base roadmap §2.5). A continuous map from the compact P_B to Y^d[1/p] has bounded image, so Hom_G(P_B, (LL(M)^∧)*) = (lim_k Hom_G(P_B, (Y/p^kY)^∨))[1/p] (CDN23 lines 2791–2803).
- (The lattice J and the block quotient.) For p > 2 the centre Z_B^(δ_M) of the block category is R_B^(ps,δ_M) modulo its O_L-torsion (PadicLocalLanglandsForGL2Qp §5.6), a lattice in R_B^(ps,δ_M)[1/p]; put J = Z_B^(δ_M) ∩ I_(B,M), so that I_(B,M) = J[1/p]. Let Y_B be the B-adic completion of the base §5.12, the inverse limit of the quotients of LL(M)⁺ that are smooth of finite length in B; each is killed by a power of p, so these are also the quotients of Y with that property. Y_B is p-torsion-free and p-adically complete, Y/p^kY → Y_B/p^kY_B is onto for every k (CDN23 lines 2805–2814), and J kills Y_B, because the centre acts on Y_B ⊂ LL_B(M) through R_B^(ps,δ_M)[1/p] → R_(B,M) (LocalGaloisDeformationRings §3.8).
- (Torsion stages see only the block.) An O_L[G]-module that is finitely generated and is the union of its finite-length subrepresentations in B has finite length and lies in B: the sum of two such subrepresentations is again one, so a finite generating set lies in a single one. For k ≥ 1 and a continuous G-map φ: P_B → (Y/p^kY)^∨, the Pontryagin dual of φ(P_B) is a quotient of LL(M)⁺/p^kLL(M)⁺, hence finitely generated, and a submodule of P_B^∨, a union of finite-length representations in B, hence the union of its own finite-length subrepresentations in B. By the criterion it has finite length in B, so it is one of the quotients defining Y_B, and φ takes values in (Y_B/p^kY_B)^∨. Dualising Y/p^kY → Y_B/p^kY_B therefore gives Hom_G(P_B, (Y_B/p^kY_B)^∨) = Hom_G(P_B, (Y/p^kY)^∨) (CDN23 lines 2815–2824).
- (Annihilation, then the limit.) The centre of the block category acts on Hom_G(P_B, (Y_B/p^kY_B)^∨) through P_B and through Y_B by the same operators, and J acts by zero through Y_B, so J kills every stage (CDN23 lines 2830–2836). The inverse limit over k is then killed by J, and after inverting p, I_(B,M) = J[1/p] kills Hom_G(P_B, (LL(M)^∧)*), hence Hom_G(P_B, H¹_ét[M]) and m_(B,M). Finite length holds at each fixed k and fails for the limit, which is why the limit is taken last.

**Checks.**

- Killing every closed fibre does not imply killing the module. Over L[T], the ideal (T) kills N⊗κ(x) for N = L[T]/(T²) at every closed point x, but T·1 ≠ 0 in N.
- The factorisation is through a fixed torsion stage. The identity of P_B does not factor through a finite-length quotient, since P_B is not of finite length (base roadmap §5.3, Checks). Likewise ℤ_p/p^kℤ_p has length k for each k while lim_k ℤ_p/p^kℤ_p = ℤ_p has infinite length: finite length holds stage by stage, and only annihilation by J passes to the limit. A finite-length torsion quotient has zero image in the torsion-free Y^d, which is why the step is taken at fixed k before the limit.
- Both hypotheses of the finite-length criterion are needed. An infinite direct sum of copies of one irreducible representation in B is the union of its finite-length subrepresentations but is not finitely generated. The compact induction c-Ind_(KZ)^G k_L, with K = GL₂(ℤ_p) and p acting trivially, is generated by one vector but has infinite length: it is free over its endomorphism ring k_L[T] (PadicLocalLanglandsForGL2Qp §2.7), so the images of the powers T^j form a strictly decreasing chain.
- For special M the statement is immediate from §6.2.
- If R_(B,M) = 0, then I_(B,M) is the unit ideal and m_(B,M) = 0.

*Needs:* §§0.2, 4.9, 5.5 and 5.6; ProetaleCohomologyOfPAdicCurvesAndTowers §7.5; PadicLocalLanglandsForGL2Qp §§2.5, 5.1, 5.3–5.6 and 5.12; LocalGaloisDeformationRings §3.8.

### 6.5 Structure of the typed multiplicity

For p > 3, prove that there is an E_B^(δ_M)[G_ℚ_p]-equivariant isomorphism m_(B,M) ≅ m_B^(δ_M)(Π*(ρ_(B,M)))⊗_(R_(B,M))ρ_(B,M)⊗_(R_(B,M))Ř_(B,M). Here Ř_(B,M) = Hom^cont_L(R_(B,M), L), with (rℓ)(s) = ℓ(rs) (CDN23, Théorème 5.24(ii), lines 2779–2782 and footnote 32, line 2861). The route has five steps:

- At a closed point x, compute m_(B,M)[𝔪_x] using the base roadmap's Morita specialisation and §4.13.
- Pass to continuous L-duals.
- Prove that these duals are finite locally free over each principal ideal domain factor of R_(B,M). The source asserts this without argument (source correction E17).
- Apply §6.3 to the joint action of E_(B,M)×G_ℚ_p. All closed fibres are absolutely irreducible for this joint action. For p > 3, generic semisimplicity of E_(B,M) and its characteristic-zero trace determine the generic representation (footnote 32; source correction E12).
- Dualise back; Ř_(B,M) accounts for the continuous dual of the coefficient ring.

The special case is §6.2. The formula concerns the rational module; no formula for m_(n,B) before inverting p is asserted.

**Checks.**

- For R_(B,M) = L (one closed point), Ř = L and the formula reads m_(B,M) ≅ m_B(Π(ρ_x)*)⊗ρ_x.
- Ř_(B,M) is the continuous L-dual of R_(B,M). The source formula Ř = Hom(Ř, L) refers to the object being defined (source correction E11).
- A comparison of Galois modules alone, without the E_B-action, is weaker than the statement and does not determine the isomorphism.

*Needs:* §§4.13, 5.5, 6.1–6.4; PadicLocalLanglandsForGL2Qp §§5.3, 5.5 and 5.12; LocalGaloisDeformationRings §3.8.

### 6.6 The factorisation of arithmetic cohomology

Let p > 3, fix n, and let L contain the fields of definition of all JL(M) of level at most n. Prove that there is a topological L[G_ℚ_p×G×Ǧ]-isomorphism

    H¹_ét(M^p_(n,ℚ̄_p), L(1)) ≅ ⊕_(M∈ΦNᵖ_n) ( ⊕̂_B Π*(ρ_(B,M)) ⊗_(R_(B,M)) ρ_(B,M) ⊗_(R_(B,M)) Ř_(B,M) ) ⊗_L JL(M).

The left side is the arithmetic completion of §5.1, not all of H¹_ét(M^p_(n,C), L(1)), with the topology of §5.1. The outer sum is finite. The inner completion is the algebraic p-adic completion of the sum of the natural G_ℚ_p×G×Ǧ-stable lattices of the summands, the lattices of §5.4, after which p is inverted (CDN23, footnote 6, line 178). The isomorphism is topological for the topology that §§5.4, 5.6 and 6.5 transport from the stages of §5.1. In that topology the reductions of the lattices modulo p^k are inductive limits of compact pieces, not discrete modules; neither side carries the p-adic topology of its lattice. Ř_(B,M) is the continuous L-dual of R_(B,M). Sources: CDN23, Théorème 0.1 (line 121) and Théorème 5.15 (line 2620), with the hypothesis p > 3 of line 93. The route combines §5.4 after inverting p, §5.6 and §6.5, recovering Π*(ρ) through the base roadmap's Morita evaluation.

**Checks.**

- At a closed supercuspidal point x the multiplicity at x is the 𝔪_x-torsion of the summand of B, as in the proof of CDN23 Théorème 5.24(ii) (lines 2837–2847). It is (κ(x)⊗Π*(ρ))⊗_κ(x)ρ_x⊗_κ(x)Hom_L(κ(x), L) ≅ Π(ρ_x)*⊗_κ(x)ρ_x, tensored with JL(M) (Layer 6, Examples). For κ(x) = L this is the multiplicity Π(ρ_x)*⊗JL(M) of §4.14 at V = ρ_x, tensored with ρ_x. The ordinary fibre κ(x)⊗_(R_(B,M))(−) of the summand is a different operation.
- Test the two operations on A = L⟨T⟩ at x: T = 0. Its continuous dual Ǎ is the space of bounded sequences (ℓ(Tⁿ))_(n≥0), on which T acts by the left shift, since (Tℓ)(Tⁿ) = ℓ(Tⁿ⁺¹). The shift is surjective with kernel L·ev₀, so Ǎ/TǍ = 0 while Ǎ[T] = L·ev₀. Hence κ(x)⊗_A(P⊗_AǍ) = 0 for every A-module P, while the T-torsion of P⊗_AǍ is P/TP⊗L·ev₀ for torsion-free P. Reading the closed point as an ordinary fibre would lose the whole multiplicity.
- For the Steinberg block and M = Sp the summand is (St^cont)*⊗1⊗1, in agreement with §4.2.
- Modulo p^k each integral vector has finite block support, so the unrestricted product over B is not the left side.
- Take p = 5, n = 0, L = ℚ_5 and the Steinberg summand (St^cont)*⊗1⊗1 of M = Sp. With μ_j = δ_(5^j) − δ₀ as in §5.1, Checks, the diagonal classes (μ_j, μ_j) on the two copies of Ω are G_ℚ_5-invariant, since Frobenius only exchanges the copies, and Ǧ-invariant, since ϖ_D does the same. They tend to 0 on the left by §5.1, and in (St^cont)* for the topology of compact convergence of Conventions. Yet each has norm 1, and any two are incongruent modulo 5. So the isomorphism is topological for these topologies, and would fail for the norm topology on (St^cont)* or the p-adic topology of the lattices.

*Needs:* §§5.4, 5.6, 6.2 and 6.5; PadicLocalLanglandsForGL2Qp §§5.3 and 5.12.

### Examples

If ρ̄_B is absolutely irreducible and the type locus of M in B is a single principal ideal domain factor A, then ρ = ρ_(B,M) is free of rank two over A and the summand of B is S = Π*(ρ)⊗_Aρ⊗_AǍ. Let x be a closed point of A with residue field κ(x). The module Π*(ρ)⊗_Aρ is torsion-free, since Π*(ρ) ≅ Hom^cont_A(LL_B(M), A) (§6.1) and ρ is free, hence flat over A, and Ǎ[𝔪_x] = Hom_L(κ(x), L), so the 𝔪_x-torsion of S is (κ(x)⊗_AΠ*(ρ))⊗_κ(x)ρ_x⊗_κ(x)Hom_L(κ(x), L). By §6.1 and the trace form Hom_L(κ(x), L) ≅ κ(x), it is Π(ρ_x)*⊗_κ(x)ρ_x. The ordinary fibre κ(x)⊗_AS is not this space: it vanishes whenever Ǎ is 𝔪_x-divisible, as for the test ring of §6.6, Checks. Only ρ has rank two over A; Π*(ρ) is not finitely generated, its fibres Π(ρ_x)* being infinite-dimensional.

### Dependencies

Layers 0 and 4–5; PadicLocalLanglandsForGL2Qp §§2.5, 3.3, 3.5, 3.6, 3.8, 5.1–5.6, 5.8 and 5.12; LocalGaloisDeformationRings §3.8; ProetaleCohomologyOfPAdicCurvesAndTowers §7.5; Mathlib `Submodule` and `Module.Basis`.

## Layer 7: Weighted, Iwasawa, primitive, derived and boundary consequences

In §§7.1–7.4 and 7.6–7.7, π and ρ are as in Layer 1, r ≥ 1 is such that ρ is trivial on K_D(2r) = 1+p^rO_D, and E_π ≅ O(Σ_r)^ρ through §3.3(i) at n = 2r, which for trivial central character is the function-dual comparison of the base roadmap §6.9.

### 7.1 The integral-weight automorphy twist

For k ∈ ℤ, let E_π[k] be E_π as a topological O(Ω)-module with the action g⋆_kℓ = (a−c∂)⁻ᵏ(gℓ) for g = (a b; c d). Negative powers use the automorphism of §2.2 (DLB17, Remarque 11.12, line 2718). Prove that this is an action. Its API:

- g⋆_kℓ = (a−c∂)⁻ᵏgℓ, and k = 0 recovers the action on E_π.
- The cocycle identity holds for every k ∈ ℤ: for g′ = (a′ b′; c′ d′), (a−c∂)(a′−c′·g∂g⁻¹) = (aa′+bc′)−(ca′+dc′)∂, whose coefficients are the left column of gg′. Since g∂g⁻¹ = (d∂−b)(a−c∂)⁻¹ (§2.2), this is the identity a′(a−cz)−c′(dz−b) = (aa′+bc′)−(ca′+dc′)z.
- Under §3.1, E_π[k] realises O(k)(Σ_r)^ρ, the space of §7.2 with its twisted action; its strong dual, locally analytic by the function duals of §3.1, is the representation that replaces Π(π,0) in DLB17 Théorème 1.2 for the bundle O(k) (DLB17, Remarque 11.12, lines 2718–2720; COLMEZ19POIDS lines 310–321 give the same twist in a right-action convention). At k = 0 this is E_π ≅ O(Σ_r)^ρ of §3.3(i), with dual Π(π,0).

**Checks.**

- At k = 0 every factor is the identity.
- aI₂ acts by a⁻ᵏ relative to its action on E_π. Determinant twists must therefore be added separately to keep a central character.
- For k = 2, tensoring with det gives the factor det(g)(a−c∂)⁻², which is the action on Π(π,2)′_b in the base §6.9.

*Needs:* §§2.2, 3.1 and 3.3; PadicLocalLanglandsForGL2Qp §6.9.

### 7.2 Weighted realisation and the BGG row

For k ≥ 0, prove the strict exact sequence of G-Fréchet spaces 0 → O(−k)(Σ_r)^ρ → O(k+2)(Σ_r)^ρ⊗detᵏ⁺¹ → H¹_dR(Σ_r)^ρ⊗Sym^k → 0, whose first map is (u⁺)ᵏ⁺¹ = (−d/dz)ᵏ⁺¹, with the same image as (d/dz)ᵏ⁺¹ (DLB17, Remarque 11.12, lines 2718–2725). For the identification H¹_dR(Σ_r)^ρ ≅ π′⊗M*_dR of the base §6.9(iii), which is §3.3(ii) at n = 2r read through §0.4(c), prove that the preimage of ℒ^⊥⊗(π′⊗Sym^k) in O(k+2)(Σ_r)^ρ⊗detᵏ⁺¹ is Π(Δ_(k+1,ℒ))′_b⊗det^k, where Π(Δ_(k+1,ℒ)) is the representation of §2.4. That representation is Π(V⁽ᵏ⁺¹⁾_(M,ℒ))^an⊗δ_(k+1)⁻¹, where V⁽ᵏ⁺¹⁾_(M,ℒ) is the representation of weights {0,k+1} of §2.4 and δ_(k+1) its unramified twist; these V⁽ᵏ⁺¹⁾_(M,ℒ) are the representations of weights 0 and k+1 of DLB17 Remarque 11.12 (line 2723). For k ≥ 1, Δ_(k+1,ℒ) itself is not étale, so the twist by δ_(k+1) cannot be omitted. This is COLMEZ19POIDS Conjecture 0.10 (lines 328–332) in the normalisation of Conventions, which its Remarque 0.11(i) and (iii) (lines 333–340) derive from the case k = 0 and its Théorèmes 0.6 and 0.8. The source twists the natural action on functions on the right, (f|_kγ)(z) = (cz+d)⁻ᵏf(γz) (lines 310–321), takes the multiplicity of JL(M)* and prints the twist as x⁻²; here the action is the left one of §3.1, the multiplicity is Hom_Ǧ(JL(M), −) of Conventions and the twist is det⁻¹, as the central-character Check below fixes. For every supercuspidal M ∈ ΦNᵖ_n the same holds on M^p_n, with the identification of §3.3(ii), the lines ℒ⊗(π′⊗Sym^k), and Π(M,·), Δ_(k+1,ℒ) and V⁽ᵏ⁺¹⁾_(M,ℒ) those of §2.4 for the type M, that is, Colmez's objects for M° = M[−1]. The route takes the case k = 0 from §3.3. Under the actions of §7.1 it identifies O(s)(Σ_r)^ρ with Π(M,s−1)′_b⊗det⁻¹ for s ∈ ℤ, and hence O(k+2)(Σ_r)^ρ⊗detᵏ⁺¹ with Π(M,k+1)′_b⊗det^k, because the operator ∂ of §2.2 corresponds to the operator ∂ of §2.4 (COLMEZ19POIDS Remarque 0.11(ii), lines 335–336). Dualising the exact sequences of §2.4(ii) for Π(M,k+1) and tensoring with det^k gives the preimage statement and the algebraic quotient, using (Sym^k)∨⊗det^k ≅ Sym^k. The first map of the row is (u⁺)ᵏ⁺¹ (Remarque 0.11(i), with source correction E22). Exactness of the row is justified as indicated in DLB17 Remarque 11.12.

**Checks.**

- For k = 0 the row is the de Rham sequence of §3.3, with O(2)⊗det = Ω¹ (DLB17, Lemme 3.5).
- For k = 1, (u⁺)² sends O(−1) to O(3)⊗det². Its cokernel is H¹_dR(Σ_r)^ρ⊗Sym¹ ≅ π′⊗M*_dR⊗Sym¹, where G acts trivially on the two-dimensional M*_dR and through the standard algebraic action on Sym¹. After a basis of M*_dR it is two copies of π′⊗Sym¹, not four copies of π′: pI₂ acts on it by p, as on the middle term, but on four copies of π′ by 1. The weights become {0,2}. The preimage is Π(Δ_(2,ℒ))′_b⊗det, where Π(Δ_(2,ℒ)) = Π(V⁽²⁾_(M,ℒ))^an⊗δ_2⁻¹ and δ_2(p)² = p⁻¹ (§2.4). For aI₂ with a = p, the middle term has scalar p⁻³p⁴ = p and the preimage has scalar p⁻¹p² = p. Without det the scalar would be p⁻¹; reading it as Π(V)^an for a V with D_rig(V) = Δ_(2,ℒ) names a representation that does not exist.
- The centre fixes the twist in the identification O(s)(M^p_n)[M] ≅ Π(M,s−1)′_b⊗det⁻¹. Let LL(M) = π have central character ζ (ζ = 1 for π as in Layer 1). The scalar aI₂ acts on O(s)(M^p_n)[M] by a⁻ˢζ(a)⁻¹: a⁻ˢ from (a−c∂)⁻ˢ, and ζ(a)⁻¹ because the diagonal centre acts trivially on the tower and a JL(M)-multiplicity sees the inverse central character (EndoscopicTransferAndUnitaryTraceComparison §12.14, as in §5.6). Π(M,s−1) has central character x^(s−1)ω with ω = x⁻¹ζ (§2.4, Checks), so Π(M,s−1)′_b⊗det⁻¹ has (a^(s−2)ζ(a))⁻¹a⁻² = a⁻ˢζ(a)⁻¹. With det⁻² the scalar would be a⁻ˢ⁻²ζ(a)⁻¹, off by p⁻² at a = p; with Colmez's objects for M instead of M[−1], ω(p) would be multiplied by p² (§2.4, Checks) and the scalar at a = p would be off by p⁻².
- The determinant power in the row is k+1: its middle term has scalar a⁻ᵏ⁻²a²ᵏ⁺² = a^k. The preimage has scalar a⁻ᵏa²ᵏ = a^k, and at k = 0 its det^k twist is trivial. The identity (Sym^k)∨⊗det^k ≅ Sym^k sends the dual of the two weights a and b at k = 1 to b and a, since a⁻¹ab = b and b⁻¹ab = a.

*Needs:* §§0.4, 2.2, 2.4, 3.1, 3.3 and 7.1; PadicLocalLanglandsForGL2Qp §§4.1–4.2 and 6.9; CompletedCohomologyAndLocalGlobalCompatibility §6.3.

### 7.3 Comparison with the original first-cover formulation

Assume that ρ is trivial on 1+ϖ_DO_D. Let Σ_(1+ϖ_DO_D) be the ℚ_p-model of the p^ℤ-quotient of the first ϖ_D-cover, of CDN level 1, and let K = ℚ_p²((−p)^(1/(p²−1))). Since Σ_1 is Galois over Σ_(1+ϖ_DO_D) with group (1+ϖ_DO_D)/(1+pO_D), on which ρ is trivial, the ρ-parts of functions, differentials and de Rham cohomology of Σ_(1+ϖ_DO_D) are those of Σ_1, and §3.3 and the base §6.9 apply to them.

Construct Teitelbaum's semistable formal model Σ̂ of Σ_(1+ϖ_DO_D,K) over O_K, with the actions of G and O_D^×. Over the affinoid of Ω̂ attached to a vertex of the Bruhat–Tits tree and its bounding edges, the cover cut out by the nonzero Π-torsion of Drinfeld's universal special formal O_D-module is given by yᵖ²⁻¹ = p(z−z^p)ᵖ⁻¹ in a suitable coordinate z. Over ℂ_p its reduction is made of copies of the curve yᵖ⁺¹ = z−z^p meeting in double points along the tree (TEI90, Theorem 5, line 177, Corollary 6, line 232, and lines 251–259; recalled in DLB17 lines 2734–2737). After base change to the finite extension K̆ = K·ℚ̆_p of ℚ̆_p, Σ̂ is an explicit model at n = 1 with the properties of ProetaleCohomologyOfPAdicCurvesAndTowers §7.2. Prove that the actions of G, Ǧ and Gal(K/ℚ_p), the last through the descent datum, extend to Σ̂. The route: the components of its special fibre are the curves y′ᵖ⁺¹ = ζ(z−z^p) of the Checks below, of genus p(p−1)/2 ≥ 1, so the points of the generic fibre reducing to their generic points have positive genus and are nodes of the canonical analytic skeleton. Every triangulation contains the intrinsic nodes (TropicalAndBerkovichArithmetic §2.16), so the component-point set of Σ̂ is exactly the intrinsic node set. Every automorphism of the generic fibre over ℚ_p, K-semilinear ones included, preserves that set, and so extends to the normal formal model Σ̂ (TropicalAndBerkovichArithmetic §2.17). This is the argument of CDN20 Proposition A.1 (line 2227) and of the route of ProetaleCohomologyOfPAdicCurvesAndTowers §7.2. TEI90 extends the action of PGL₂(ℚ_p) only (lines 260–267), and its minimal regular model over the unramified base (lines 256–259) is a different object. Its quotients by the cocompact groups Γ_i of the uniformisation of HilbertModularVarietiesAndShimuraCurves §R18.5.21 at level 1, with §R18.5.16 over ℚ, are semistable models over O_K of the Shimura curve Sh of level (1+ϖ_DO_D)K^p (TEI90, Theorem 8, line 298; DLB17 lines 2736–2737).

Define BS(ℒ) as the strong dual of the preimage of ℒ^⊥⊗π′ in Ω¹(Σ_(1+ϖ_DO_D))^ρ under the identification H¹_dR(Σ_(1+ϖ_DO_D))^ρ ≅ π′⊗M*_dR that is compatible with the Hyodo–Kato (φ,N,G_ℚ_p)-structure computed from Σ̂. It is unique up to L^×, because WD(M) is irreducible. Prove that BS(ℒ) = Π^an_ℒ for every ℒ. The route has two steps:

- Hyodo–Kato. Σ̂ has the properties of ProetaleCohomologyOfPAdicCurvesAndTowers §7.2 at n = 1, so the Hyodo–Kato step of §3.3(iii) applies with M̂ = Σ̂. The Hochschild–Serre spectral sequence of log-rigid cohomology for Σ̂ → Γ_i\Σ̂ (DLB17 footnote 53, line 2763), whose degree-zero ρ-terms vanish because Ǧ acts on the components through Nrd (ProetaleCohomologyOfPAdicCurvesAndTowers §7.1) and dim ρ ≥ 2, and Saito's comparison for the proper semistable models Γ_i\Σ̂ (HilbertModularVarietiesAndShimuraCurves §R18.4.24a) with §R18.3.29(c) there compute H¹_HK(Σ̂)^ρ with its (φ,N,G_ℚ_p)-structure (DLB17 lines 2738–2749). After C⊗̂ it agrees with the multiplicity H¹_HK(M_∞)[M] of ProetaleCohomologyOfPAdicCurvesAndTowers §7.4 under the level reading of §0.2. Since End_(φ,N,G_ℚ_p)(M) = L, the identification H¹_dR(Σ_(1+ϖ_DO_D))^ρ ≅ π′⊗M*_dR compatible with this structure corresponds, under the dictionary §0.4(c), to the isomorphism ι_HK of §3.3(iii) at n = 1, up to L^×.
- Conclusion. By §3.3(iii) at n = 1, ι_HK has the line condition of §3.3(ii): the ι_HK-preimage of ℒ⊗π′_b is (Π^an_ℒ)′_b for every ℒ. Under §0.4(c) it is the preimage of ℒ^⊥⊗π′ that defines BS(ℒ), so BS(ℒ) = Π^an_ℒ. The global input of §3.3(iii) is three forms with pairwise distinct lines (gap:three-period-line-globalisation). DLB17 lines 2773–2781 use two lines and the linearity of ℒ ↦ BS(ℒ) and ℒ ↦ Π^an_ℒ in Ext¹_G((O(Σ_(1+ϖ_DO_D))^ρ)′, π); two lines fix the comparison only up to a diagonal projectivity of ℙ¹(L) (source correction E10).

**Checks.**

- The DLB cover Σ_1 has level 1+pO_D = 1+ϖ_D²O_D. It is not the first ϖ_D-cover (§0.1).
- In the basis (ℒ, ℒ′), the diagonal projectivity diag(1, c) fixes the points 0 and ∞ but moves the point 1 unless c = 1.
- The comparison is of filtered objects; an unfiltered isomorphism H¹_dR ≅ π′⊗M*_dR does not determine BS(ℒ).
- Over ℤ_p² the equation yᵖ²⁻¹ = p(z−z^p)ᵖ⁻¹ has special fibre yᵖ²⁻¹ = 0, which is not reduced, so no unramified base gives a semistable model of this shape. Over K, with ϖ_Kᵖ²⁻¹ = −p and y = ϖ_Ky′, it becomes y′ᵖ²⁻¹ + (z−z^p)ᵖ⁻¹ = 0, the product of the p−1 factors y′ᵖ⁺¹ − ζ(z−z^p) over the roots ζ of ζᵖ⁻¹ = −1, which lie in ℚ_p². Each factor reduces to a smooth curve on the vertex affinoid, since ∂/∂z(z−z^p) ≡ 1 mod p, and the p−1 factors match the p−1 connected components of TEI90 Corollary 6.
- The components have genus p(p−1)/2. The curve y^(p+1) = z − z^p is a cyclic cover of degree p+1 of the line, prime to p, totally ramified over the p points of 𝔽_p, where z − z^p has simple zeros, and over ∞, where it has a pole of order p prime to p+1. So 2g − 2 = −2(p+1) + (p+1)p, and g = 1 at p = 2, the curve Y³ = z − z² of TEI90 (line 315), and g = 3 at p = 3. If a component were a projective line meeting the rest in two points, its generic point would not be a node, and the component-point set would not be intrinsic.
- If ρ is nontrivial on the normal subgroup 1+ϖ_DO_D, which acts trivially on the first cover, every Ǧ-map from ρ to its functions or differentials vanishes. The statement is then empty, so the hypothesis on ρ cannot be dropped.

*Needs:* §§0.1, 0.2, 0.3, 0.4, 3.1 and 3.3, the last with gap:three-period-line-globalisation; ProetaleCohomologyOfPAdicCurvesAndTowers §§7.1, 7.2 and 7.4; HilbertModularVarietiesAndShimuraCurves §§R18.3.29, R18.4.24a, R18.5.3, R18.5.16 and R18.5.21; TropicalAndBerkovichArithmetic §§2.16 and 2.17.

### 7.4 Iwasawa invariants of Drinfeld functions

For V in the family of π, prove that (O(Σ_r)^ρ)^(diag(p,1)=1) is a free D(Γ)-module of rank two, isomorphic to {μ ∈ H¹(G_ℚ_p, D(Γ)⊗_L V) : ∫_(Γ_m)μ ∈ H¹_e(G_(ℚ_p(μ_(p^m))), V) for every m ≥ 1} (DLB17, Théorème 1.9, line 434; §12.1, line 2785). Here Γ_m = 1+p^mℤ_p ⊂ Γ, so that Γ_1 = Γ at p = 2, and ∫_(Γ_m) is restriction to G_(ℚ_p(μ_(p^m))), which acts on D(Γ) through Γ_m, followed by evaluation of the distribution on the indicator of Γ_m. The level-zero condition ∫_Γμ ∈ H¹_e(G_ℚ_p, V) follows from m = 1, since ∫_Γ is the corestriction of ∫_(Γ_1) by Shapiro's lemma and corestriction carries H¹_e into H¹_e, the Bloch–Kato exponential commuting with corestriction and trace. H¹_e is the image of the Bloch–Kato exponential, not H¹_f or H¹_g. The route identifies the diag(p,1)-fixed vectors with tN_rig(π)^(ψ=1) by §2.1. Applying 1−φ and the all-level exponential-image criterion with its injectivity (PhiGammaModulesAndIwasawaCohomology §5.7) identifies the result with the right side. Freeness of rank two over D(Γ) is proved here, using the analytic Iwasawa comparison of PhiGammaModulesAndIwasawaCohomology §5.4 for the right-hand side. The cover level r and the cyclotomic level m are different indices; the source uses n for both (source correction E18).

**Checks.**

- For the zero Iwasawa class μ = 0 in a permitted rank-two V, every specialisation ∫_(Γ_m)μ is zero and belongs to H¹_e. The invariant function space is still free of D(Γ)-rank two; the zero class does not make the whole space vanish.
- For the trivial representation, H¹_e ≠ H¹_f, which is why the condition uses the exponential image.
- At m = 0 the uniform formula 1+p^mℤ_p gives ℤ_p, which contains 0 and is not a subset of Γ = ℤ_p^×. The level-zero condition is on Γ itself, with field ℚ_p(μ_1) = ℚ_p. For p odd, Γ_1 = 1+pℤ_p has index p−1 in Γ, matching [ℚ_p(μ_p):ℚ_p] = p−1; for p = 2, Γ_1 = 1+2ℤ_2 = Γ and ℚ_2(μ_2) = ℚ_2, so the condition at m = 1 is already the level-zero one.
- The nontriangulinity hypothesis of the annular generation of PhiGammaModulesAndIwasawaCohomology §5.7 holds because V is nontrianguline over every finite extension of L. A supercuspidal WD(M) stays irreducible after coefficient extension.

*Needs:* §§2.1 and 3.3; PhiGammaModulesAndIwasawaCohomology §§5.4 and 5.7.

### 7.5 Infinitely primitivable functions

For r ≥ 0 let Σ_r be the ℚ_p-space of DLB level r of Conventions, so that Σ_r = M^p_(2r). A function f ∈ O(Σ_r) is infinitely primitivable when it lies in ∩_(j≥0) (d/dz)^j O(Σ_r). Prove that the infinitely primitivable functions lie in H⁰_dR(Σ_r)·O(Ω): finite sums of locally constant functions on geometric components times pullbacks of functions on Ω, after the finite extension that splits the components. The conclusion of DLB17 Théorème 1.10 (line 447), that they lie in O(Ω), is false when component constants are nontrivial (source correction E2). The route decomposes f by Ǧ-types; d/dz commutes with Ǧ, so each component of f is again infinitely primitivable:

- On the sector of a supercuspidal type M ∈ ΦNᵖ_(2r), ρ = JL(M), of any central character trivial on p, §3.3(i) at CDN level 2r identifies O(Σ_r)^ρ G-equivariantly with (Π^an_(M,ℒ)/LL(M))′_b for any line ℒ. A G-isomorphism commutes with u⁺ = −d/dz, and ∩_j(u⁺)^j is zero there by §1.7. The source proof treats every nontrivial type as supercuspidal with trivial central character (source correction E19).
- On a one-dimensional type χ∘Nrd, use ProetaleCohomologyOfPAdicCurvesAndTowers §7.1: the χ∘Nrd-sector of O(Σ_r) is (χ-isotypic locally constant functions on components)·O(Ω).

Its API:

- The infinitely primitivable functions form an L-subspace of O(Σ_r), stable under Ǧ and under the upper triangular Borel subgroup B of G. Indeed d/dz commutes with Ǧ, and for g = (α β; 0 δ) the inverse-pullback action of Conventions gives (d/dz)∘g = (δ/α)·g∘(d/dz), so g(d/dz)^j h = (α/δ)^j(d/dz)^j(gh). The subspace is not G-stable (§1.7, Checks).
- Since d/dz commutes with the Ǧ-isotypic projectors, f is infinitely primitivable exactly when each of its Ǧ-type components is.
- If c ∈ H⁰_dR(Σ_r) and g ∈ O(Ω) is infinitely primitivable on Ω, then c·g is infinitely primitivable, since d/dz kills c; in particular H⁰_dR(Σ_r) and H⁰_dR(Σ_r)·L[z] consist of infinitely primitivable functions, z^j/j! being a j-th primitive of 1.

**Checks.**

- Over ℚ_p², where Σ₀ splits as Ω⊔Ω (Conventions), f = (1, −1) has the primitives (z^j/j!, −z^j/j!) for every j, but is not a pullback from Ω. So the printed conclusion fails, and the corrected one holds.
- For a nontrivial supercuspidal ρ, the infinitely primitivable part of O(Σ_r)^ρ is 0.
- The statement is a containment. Not every function of H⁰_dR·O(Ω) is infinitely primitivable, since d/dz is not surjective on O(Ω): H¹_dR(Ω) ≠ 0 (§4.2).
- The DLB level r is the CDN level 2r: at r = 1 the space is the cover of level 1+pO_D = K_D(2), and §3.3(i) is applied at n = 2, not at the first ϖ_D-cover of CDN level 1 (§0.1, Checks).

*Needs:* §§1.7, 3.3 and 4.2; PadicLocalLanglandsForGL2Qp §6.9; ProetaleCohomologyOfPAdicCurvesAndTowers §7.1.

### 7.6 The filtered derived realisation

For V in the family of π and r large, prove that Hom_(D^b(D(G)))((Π(V)^an)′_b, RΓ_dR(Σ_r)^ρ[1]) ≅ D_dR(V) as filtered L-spaces, canonically up to the common scalar (DLB17, Proposition 12.2, line 2819). Here D^b(D(G)) is the full subcategory of complexes with bounded cohomology in the derived category (Mathlib `DerivedCategory`) of the abelian category 𝒞_G of coadmissible D(G,L)-modules of LocallyAnalyticRepresentationsOfLocalGroups §1.1 (DLB17 line 2815): D(G,L)-modules that are coadmissible over D(H,L) for one, equivalently every, compact open subgroup H of G, a full subcategory of D(G,L)-modules closed under kernels, cokernels and finite direct sums. RΓ_dR(Σ_r)^ρ = [O(Σ_r)^ρ → Ω¹(Σ_r)^ρ] sits in degrees 0 and 1, with F⁰ = [0 → Ω¹(Σ_r)^ρ] and the stupid filtration. It is an object of D^b(D(G)). O(Σ_r)^ρ ≅ (Π(V)^an/π)′_b, by §3.3(i) at n = 2r, is coadmissible by the anti-equivalence of the base roadmap §0.1. For two distinct lines ℒ₁, ℒ₂ the preimages (Π^an_(ℒ_i))′_b of ℒ_i^⊥⊗π′_b (base §6.9(iii), which is §3.3(ii) read through §0.4(c)) span Ω¹(Σ_r)^ρ and meet in O(Σ_r)^ρ, so Ω¹(Σ_r)^ρ is the cokernel of x ↦ (x, −x) from O(Σ_r)^ρ to (Π^an_(ℒ₁))′_b⊕(Π^an_(ℒ₂))′_b and is coadmissible. The coadmissibility used is that of the ρ-multiplicity spaces; the unprojected complex of Σ_r is not asserted to be coadmissible (source correction E8). Provide the filtered two-term complex in D^b(D(G)) and the comparison of its Hom with the filtration. The route uses H⁰_dR(Σ_r)^ρ = 0, so the complex is quasi-isomorphic to H¹_dR(Σ_r)^ρ[−1], and computes Hom to the two-copy smooth quotient by the base §6.9. No Frobenius or monodromy structure is asserted (DLB17, Remarque 12.3(a), line 2823).

**Checks.**

- For the chosen line ℒ, the filtration induced on the two-dimensional Hom is Fil⁰D_dR(V) = ℒ. An unfiltered dimension count would only give 2.
- The trivial sector ρ = 1 has H⁰_dR ≠ 0 and is excluded.
- Ǧ acts on O(Σ_r) through the finite group Ǧ/(p^ℤ(1+p^rO_D)), so only finitely many types occur (§0.2). The ρ-multiplicity complex is used because the comparison with (Π^an/π)′ that gives its coadmissibility (DLB17, Théorème 10.1, line 2192) concerns a supercuspidal ρ, not because the sum over types is infinite. The one-dimensional sectors χ∘Nrd lie outside that comparison (source correction E8).

*Needs:* §§0.4, 3.1 and 3.3; PadicLocalLanglandsForGL2Qp §§0.1 and 6.9; LocallyAnalyticRepresentationsOfLocalGroups §§0.5 and 1.1; Mathlib `DerivedCategory`.

### 7.7 The boundary-function sheaf

Let τ: Σ_r → T be the period map to Ω followed by the retraction onto the Bruhat–Tits tree T of PGL₂(ℚ_p). For an open U ⊂ ℙ¹(ℚ_p), let V(U) be the union of rays from a fixed vertex towards points of U, and B_i the ball of radius i. Define F_π as the sheafification of U ↦ colim_i O(τ⁻¹(V(U)∖B_i))^ρ, over the admissible analytic neighbourhoods of DLB17 §12.3 (line 2861). Prove that its restriction maps and G-action do not depend on the vertex or the cofinal sequence of collars. Its identification with tN_rig(π)⊠− is DLB17 Conjecture 12.4 (line 2876) and is not asserted.

Its API:

- On a compact open U, sections are the stabilised germs over admissible collars.
- Restriction commutes with passage to germs, identities and composition.
- Cofinal collar systems and changes of base vertex give canonically isomorphic sheaves.
- G transports collars and commutes with restriction and the ρ-projection.

**Checks.**

- For U = ℙ¹(ℚ_p), V(U) is the whole tree and the sections are colim_i O(τ⁻¹(T∖B_i))^ρ, the complements of the affinoids τ⁻¹(B_i) being cofinal among complements of finite unions of affinoids. Restriction from O(Σ_r)^ρ is injective, since every connected component of the smooth curve Σ_r meets every collar. It is not surjective: Σ_r being Stein, its cokernel is the ρ-part of H¹_c(Σ_r, O), which Serre duality identifies with Ω¹(Σ_r)′ (DLB17 lines 2861–2865). As ρ ≅ ρ^∨ for trivial central character, that ρ-part is (Ω¹(Σ_r)^ρ)′, nonzero because Ω¹(Σ_r)^ρ contains dO(Σ_r)^ρ ≅ O(Σ_r)^ρ ≅ E_π ≠ 0. A presheaf without the passage to collars, U ↦ O(τ⁻¹(V(U)))^ρ, would return O(Σ_r)^ρ at ℙ¹(ℚ_p).
- Replacing B_i by B_(i+c) for fixed c gives the same germs.
- For disjoint compact opens U₁, U₂, deep collars separate, so F_π(U₁ ⊔ U₂) ≅ F_π(U₁)×F_π(U₂). A constant function pulled back from the tree has zero ρ-part for nontrivial supercuspidal ρ, so the projection cannot be omitted.

*Needs:* §§0.2, 3.1 and 3.3; PadicLocalLanglandsForGL2Qp §4.2a; EndoscopicTransferAndUnitaryTraceComparison §§12.4 and 12.5.

### Examples

Over ℚ_p², where Σ₀ splits as Ω⊔Ω, every locally constant function is infinitely primitivable, and so is every product of one with an infinitely primitivable function on Ω. For k = 0 the BGG row of §7.2 is the de Rham sequence.

### Dependencies

Layers 0–4; PadicLocalLanglandsForGL2Qp §§0.1, 4.1–4.2, 4.2a and 6.9; CompletedCohomologyAndLocalGlobalCompatibility §6.3; PhiGammaModulesAndIwasawaCohomology §§5.4 and 5.7; HilbertModularVarietiesAndShimuraCurves §§R18.3.29, R18.4.24a, R18.5.3, R18.5.16 and R18.5.21; EndoscopicTransferAndUnitaryTraceComparison §§12.4 and 12.5; ProetaleCohomologyOfPAdicCurvesAndTowers §§7.1, 7.2 and 7.4; TropicalAndBerkovichArithmetic §§2.16 and 2.17; LocallyAnalyticRepresentationsOfLocalGroups §§0.5 and 1.1; Mathlib `DerivedCategory`; gap:cuspidal-projectivity-coefficients and gap:three-period-line-globalisation (through §3.3).

## Downstream consumers

The Galois-socle theorem §4.14 and the factorisation §6.6 are the inputs for comparisons between local and global multiplicities in completed cohomology of quaternionic Shimura curves. The general-central-character realisation §3.3 is the form of the Breuil–Strauch comparison needed by every statement on the p-central tower at fixed level. The boundary sheaf §7.7 is the geometric side of DLB17 Conjecture 12.4. PadicLocalLanglandsForGL2Qp (Scope and ownership) assigns to §3.1 the discharge of the global hypotheses of its §6.9 and to §3.3 the p-central supercuspidal sectors. ProetaleCohomologyOfPAdicCurvesAndTowers (Downstream consumers) records the uses of its §§0.3–0.4, 6.2, 6.5, 6.9 and 7.1–7.5 made here, and §4.9's fixed-level vanishing of bounded functions. TriangulineVarietyAndItsLocalModel (Scope and ownership) records §1.2 as the owner of the rank-two nontrianguline connection statements, which it does not use.

## Source corrections

All statements below are in our own words.

- **E1** (gap, DLB17, Théorème 9.9, line 2005; affects a stated result). Uniqueness of the O(Ω)-module structure needs continuity of f ↦ T_fℓ for every ℓ; algebraic density does not determine an arbitrary action. Uniqueness among continuous module structures is the form stated in the base roadmap §6.9.
- **E2** (error, DLB17, Théorème 1.10, line 447; affects a stated result). Infinitely primitivable functions lie in H⁰_dR(Σ_r)·O(Ω), not in O(Ω). §7.5.
- **E3** (gap, DLB17, proof of Théorème 5.1, §5.3, line 1184; affects the proof). A globalisation obtained up to an unramified twist must have the twist removed by a global character before taking isotypic parts. §3.1.
- **E4** (error, DLB17, Proposition 7.7(b), line 1568; affects a stated result). The orthogonal of N⁺_dif,n(V̌) is tN⁺_dif,n(V) for every weight k ≥ 1, not t^kN⁺_dif,n(V). The two agree at k = 1. §1.6.
- **E5** (gap, DLB17, proof of Théorème 8.3, line 1690; affects the proof). Injectivity of Res_ℤ_p on the fixed vectors needs the Weyl chart and D_rig^(φ=1) = 0. §2.1.
- **E6** (error, DLB17, proof of Proposition 8.4, line 1768; affects the proof). Generation is used over D(Γ) where only generation after scalar extension to the Robba ring of Γ is available. This roadmap takes tN_rig(π)⊠ℙ¹ from the base roadmap §4.2a and does not use this step.
- **E7** (gap, DLB17, proof of Théorème 9.7, line 1967; affects the proof). The displayed computation gives a one-sided inverse of a−c∂; the identity for g⁻¹ gives the other. §2.2. The resolvents are constructed in the base roadmap §6.9, and COLMEZ19POIDS Théorème 0.8(ii) (line 265) proves the two-sided statement for the operator ∂ of §2.4.
- **E8** (gap, DLB17, §12.2 before Proposition 12.2, line 2810; affects the proof). Théorème 10.1 gives coadmissibility of the ρ-sector, not of the whole de Rham complex of Σ_n. §7.6.
- **E9** (gap, DLB17, Proposition 11.10, line 2685; affects the proof). Infinite t-divisibility must be proved in one lattice of fixed radius on both charts. gap:fixed-radius-divisibility. §1.7 obtains the vanishing of the whole intersection ∩_j(u⁺)^j by density instead, for every central character.
- **E10** (gap, DLB17, Remarque 11.13, lines 2773–2781; affects the proof). Two filtration lines leave a diagonal projectivity; three distinct lines are needed. Varying the residual representation (line 2774) gives distinct lines when the residual restrictions differ, but is not shown to give three. §3.3(iii), gap:three-period-line-globalisation, §7.3.
- **E11** (misprint, CDN23, Théorème 5.15, line 2624; affects nothing). Ř_(B,M) is the continuous L-dual of R_(B,M), not Hom(Ř_(B,M), L). §6.5.
- **E12** (gap, CDN23, Théorème 5.15 and Théorème 5.24(ii), lines 2620 and 2779; affects a stated result). The local statements do not repeat the hypothesis p > 3 used for generic semisimplicity (footnote 32, line 2861; line 93). §§6.5–6.6 retain it.
- **E13** (misprint, CDN20, proof of Lemme 2.18, line 1186; affects the proof). The completing column uses the symmetric functions without the alternating signs. The proof's complement step checks only AS′ ∩ (S_v+AS_v) = 0, not that S′+AS′ meets S_v+AS_v in 0 (lines 1188–1193). §4.3.
- **E14** (misprint, CDN20, proof of Proposition 2.5, lines 875–876; affects nothing). The Hom has dimension 1 when D_pst(V*) ≅ M[−1]* and 0 otherwise, not the reverse. §4.6.
- **E15** (error, CDN23, Proposition 5.7 and Théorème 5.8, lines 2424–2473; affects a stated result). On the p-central quotient the condition is M ∈ ΦNᵖ_n, not level ≤ n; the proofs decompose over ΦNᵖ (line 2434). §§4.12–4.14.
- **E16** (gap, CDN23, proof of Proposition 5.7, lines 2438–2448, and CDN20, Proposition 2.9, line 952; affects the proof). DLB17 is applied to every supercuspidal M, though DLB17 assumes trivial central character. §3.3.
- **E17** (gap, CDN23, proof of Théorème 5.24(ii); affects the proof). Local freeness of the dual multiplicities over each PID factor is asserted without argument. §6.5.
- **E18** (misprint, DLB17, Théorème 1.9, lines 431–443; affects nothing). n denotes both the cover level and the cyclotomic level, and at cyclotomic level zero the integration domain is printed as 1+p⁰ℤ_p = ℤ_p, which is not contained in Γ; it should be Γ. §7.4.
- **E19** (gap, DLB17, proof of Théorème 1.10, §12.1, line 2785; affects the proof). Théorème 1.2 is applied to every nontrivial Ǧ-type, including one-dimensional types and nontrivial central characters. §7.5.
- **E20** (error, DLB17, lines 114–116; affects nothing). Σ₀, defined over ℚ_p (line 104), is described as two copies of Ω. That holds over ℚ_p²; over ℚ_p the Weil descent datum exchanges the two height classes and Σ₀ is connected. Conventions, §0.1.
- **E21** (gap, CDN20, Proposition 0.9, lines 343–354, and Proposition 2.9, lines 952–954; affects the proof). The line property of the Hyodo–Kato identification of the de Rham multiplicity at every level is attributed to DLB17 Théorème 1.4, whose isomorphism is built from the Kirillov comparison of DLB17 Théorème 11.7 (lines 2711–2716); its agreement with the Hyodo–Kato identification is DLB17 Remarque 11.13, at the first cover only. §3.3(iii).
- **E22** (misprint, COLMEZ19POIDS, the paragraph before Conjecture 0.10 and Remarque 0.11(i), lines 321 and 333; affects nothing). The operator from O_n(−k)⊗x^(−1−k) to O_n(k+2) is printed as the k-th derivative in the coordinate, said to act as u⁺. It is the (k+1)-st derivative, acting as (u⁺)^(k+1), as in DLB17 Remarque 11.12 (line 2722); the printed twist x^(−1−k) fits k+1 derivatives. At k = 0 the printed operator would be the identity from weight 0 to weight 2, which is not equivariant, while d/dz is, with cokernel the de Rham cohomology. §7.2.
- **E23** (gap, CDN23, proof of Lemme 5.12, lines 2581–2584; affects the proof). The lemma allows any principal ideal domain, but irreducibility over the fraction field and equality of traces give an isomorphism there only in characteristic zero. §6.3 first proves that the generic fibres are absolutely irreducible, from one irreducible fibre and the commutant, and then compares traces.
- **E24** (misprint, CDN23, proof of Théorème 5.10, lines 2549–2551; affects nothing). The absolutely irreducible Π taken from Π(V) must be a quotient, not a subrepresentation: only a quotient map Π(V) → Π dualises to an embedding of Π* into Hom_(G_ℚ_p)(V, H¹_ét). §4.14.
- **E25** (misprint, COLMEZ19POIDS, Remarque 0.2(ii), lines 161–166; affects nothing). For a de Rham, non-trianguline (φ,Γ)-module Δ′ of Hodge–Tate weights 0 and k ≥ 1, with M = D_pst(Δ′), so that Δ′ = Δ_(k,ℒ) for a line ℒ ⊂ M_dR (lines 205–211), the quotient of Π(Δ′) by LL_p(M)⊗Symᵏ⁻¹ is printed as Π(M,−k). It is Π(M,−k)⊗x^k, as in Théorème 0.6(iii) (line 234). Central characters decide it: with Δ = Δ(M) the module of weights (0,0) with D_pst(Δ) = M and ω = (x|x|)⁻¹det Δ, as in §2.4 with this M in the role of M°, the centre acts on Π(Δ′), hence on each of its subquotients, by (x|x|)⁻¹det Δ_(k,ℒ) = x^kω, and on Π(M,−k) by x⁻ᵏω, which differs from x^kω at p by the factor p^(2k) ≠ 1; on Π(M,−k)⊗x^k it acts by x⁻ᵏω·x²ᵏ = x^kω. §2.3.

## References

- **DLB17.** Gabriel Dospinescu, Arthur-César Le Bras, *Revêtements du demi-plan de Drinfeld et correspondance de Langlands p-adique*, Ann. of Math. 186 (2017), 321–411; locators refer to arXiv:1509.00606v2, whose numbering agrees with the published version.
- **CDN20.** Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, *Cohomologie p-adique de la tour de Drinfeld : le cas de la dimension 1*, J. Amer. Math. Soc. 33 (2020), 311–362; locators refer to the authors' copy.
- **CDN23.** Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, *Factorisation de la cohomologie étale p-adique de la tour de Drinfeld*, Forum Math. Pi 11 (2023), e16; locators refer to the HAL copy hal-04289191, whose theorem numbering agrees with the published version.
- **COLMEZ14LA.** Pierre Colmez, *La série principale unitaire de GL₂(ℚ_p) : vecteurs localement analytiques*, in Automorphic Forms and Galois Representations, Vol. 1, London Math. Soc. Lecture Note Ser. 414 (2014); locators refer to the author's copy.
- **COLMEZ19POIDS.** Pierre Colmez, *Correspondance de Langlands locale p-adique et changement de poids*, J. Eur. Math. Soc. 21 (2019); locators refer to the author's copy.
- **DOSPINESCU12THESE.** Gabriel Dospinescu, *Actions infinitésimales dans la correspondance de Langlands locale p-adique*, thèse de doctorat, École polytechnique, 2012; locators refer to the copy on the author's page.
- **TEI90.** Jeremy Teitelbaum, *Geometry of an étale covering of the p-adic upper half plane*, Ann. Inst. Fourier 40 (1990), no. 1, 69–78; locators refer to the Numdam copy.
