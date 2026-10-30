# Roadmap: main conjectures for modular forms and their families

**Summary.** Build the comparisons between ordinary Selmer, Kato cohomological and signed formulations of the cyclotomic main conjecture for modular forms. Combine the separately constructed Euler-system bound and automorphic reverse bounds in their precise ranges, transport the resulting statements to elliptic curves and families, and derive the stated specialization and rank-zero consequences. Integral periods, stable lattices, tame components and local correction factors remain part of every comparison: on each tame component the scalar between Kato's and the canonical normalisation is an explicit p-adic period defect, retaining the fractional comparison of the Betti and full-symbol lattices, the leading-term consequences rest on the cyclotomic p-adic height and Schneider's theorem built here, and the multiplicative theorem reaches p = 3 through a Hida approximation proved here.

## Scope and ownership

This roadmap owns the modular formulation dictionaries, the assembly of the two ordinary divisibilities, and the comparisons that turn the pointwise, family and elliptic-curve endpoints into the chosen formulations. It also owns the elementary residual predicates, the rank-one coinvariant argument, Euler-factor and coefficient-change comparisons, the modular instances of general main-conjecture propositions, and the specified leading-term consequences. Seven further pieces of mathematics that no other roadmap states as a target are owned here, because the comparisons above cannot be stated without them: the dictionary between Kato's good pairs and canonical periods, with its p-adic period defect (§0.9); the Hida approximation of a p-new weight-two form, including p=3 (§1.6); the cyclotomic p-adic height of an elliptic curve with its normalisations (§§3.7–3.8); Schneider's leading-term theorem, for an abelian variety over a number field that is ordinary above p and, specialised, for the ordinary Galois Selmer group of an elliptic curve over ℚ (§3.9); the general p-adic Mahler–Manin theorem of Barré-Sirieix, Diaz, Gramain and Philibert, with the transcendence of elliptic Tate parameters as a corollary (§3.7), which makes the ℒ-invariant nonzero (§5.5); Serre's lifting lemma for closed subgroups of SL₂(ℤ_p) (§3.6), whose d=1 case EulerSystemsAndKolyvaginSystems §1.13 also applies, citing the source, in its symplectic hypothesis verification; and Greenberg and Stevens's derivative formula at a split multiplicative prime (§5.7).

KatoEulerSystems and AutomorphicCongruences are proposed supplier roadmaps. Every numbered interface attributed to either below is a required contract conditional on publication of its complete owner specification in TauCetiRoadmap and on that roadmap supplying the stated output; it is not an interface asserted to be present on main. This includes their base packages, not only the additional named gaps. Their publication and implementation are prerequisites of the affected endpoints here. The supply order is PadicFamilies and the other arithmetic foundations → KatoEulerSystems → AutomorphicCongruences → ModularIwasawaMainConjectures → the downstream branches. Neither proposed owner takes a theorem or a definition from this roadmap; normalization adapters are built here on their independently specified carriers.

The following constructions and arithmetic proofs are consumed from their owners.

- **Mathlib and Tau Ceti.** Use Mathlib's `Representation`, `Representation.invariants`, `Module.finrank`, `Matrix.toLin'`, `PowerSeries`, `Associated`, `IsDiscreteValuationRing`, subgroup and quotient-module APIs. Tau Ceti's Galois cohomology and Kummer maps supply their existing functoriality. The finite two-descent group `WeierstrassCurve.Affine.selmerGroup₂` is a different object from the cyclotomic p-primary Selmer groups used here. Tau Ceti supplies `TauCeti.tateCurve` and `TauCeti.tateCurveAt`. Tate's uniformisation theorem for a given curve, with its unique positive-valuation Tate parameter, is PadicHodgeTheory §9.3 (`potentiallyMultiplicativeTwistReduction`), and the multiplicative residual inertia criterion is ArithmeticGaloisRepresentations §6.3; neither is restated here. No second formal Tate curve, cyclotomic character, Kummer theory or local absolute Galois group is constructed here.
- **ArithmeticGaloisRepresentations and EllipticCurveModularity.** Use modular Galois representations, integral lattices, residual local types and the modularity/parametrization/Tate-module comparisons. The corresponding Tau Ceti roadmaps ModularForms, ModularCurves, EllipticCurves, LocalGaloisGroups, ProfiniteArithmetic, ProfiniteCohomology, ClassFieldTheory and LocalFieldsRamification supply the underlying arithmetic. IntegralLattices treats quadratic lattices; the stable representation lattice here carries a Galois action and is a distinct specialization of module theory.
- **PadicMeasuresIwasawaAlgebras.** Use completed group algebras, characteristic ideals, Weierstrass invariants and perfect-complex determinants. The determinant of a perfect Iwasawa complex is distinct from the determinant bundle construction in AlgebraicVectorBundles.
- **SelmerIwasawaCohomology.** Use continuous cohomology with local conditions, Greenberg's condition, Poitou–Tate, Pontryagin duals, control and no-finite-submodule results. Here those constructions are specialized to the stated modular datum and compared with the analytic normalization.
- **PadicFamilies and the Kato extension contract.** PadicFamilies §§4.0.1–4.0.3 owns geometric modular zeta classes, explicit reciprocity and the rational bounds; its integral bounds retain the full integral SL₂(ℤ_p)-image hypothesis. The proposed KatoEulerSystems contract requires the Hecke/twist dictionary, twist nonvanishing, zeta morphisms, period dictionary, cohomological and elliptic bounds and central-critical finiteness (§§2.2, 4.2–4.3, 5.1–5.4, 6.2–6.6, 7.2, 7.4, 7.6, 7.9); the integral bounds under the rank-one-coinvariant hypothesis and the vanishing-central-value specialization are required from it (gap:modular-zeta-extensions, gap:central-critical-specialization). Generic Euler/Kolyvagin-system descent belongs to EulerSystemsAndKolyvaginSystems. This roadmap combines those outputs with reverse bounds rather than constructing another Euler-system theory.
- **ModularSymbolsPadicLFunctions and the signed regulator theory.** Use its saturated period lattices and modular-symbol interpolation. PhiGammaModulesAndIwasawaCohomology §§6.0, 6.2–6.3 owns Wach modules, good bases and integral Iwasawa domains. PadicHodgeRegulators owns the Perrin–Riou map (§8.8), the elliptic ordinary and multiplicative Coleman map (§8.22), Coleman coordinates and the logarithmic matrix (§§9.12, 9.14–9.15), basis covariance (§§9.17–9.21), the rational Coleman image (§9.26), the finite integral cokernel (§9.29) and the signed kernels ker Col_j (§9.30); the Kobayashi multipliers, the integral a_p=0 images and the general-weight ordinary Coleman image are required from it (gap:signed-regulators). The Tate-orthogonal signed local conditions, the signed Selmer groups and the signed main conjectures are built here on those maps, which are not constructed a second time.
- **AutomorphicCongruences (proposed supplier).** Layers 1 and 2 own the different ordinary reverse bounds. Layer 3 owns Nakamura's zeta morphism over the universal deformation ring, its specialisation to Kato's classical morphisms and the resulting trivialisation of the Σ-partial fundamental line. Layer 4 owns the Fouquet–Wan pointwise and universal-family arithmetic endpoints. Sections 7.9–7.10 own the Burungale–Castella–Skinner cyclotomic endpoints. Their integral §7.10 has extra correction-unit hypotheses; gap:automorphic-endpoints specifies the full source range needed here. Its §§2.21 and 4.5 are stated on the untwisted trivial tame component; gap:tate-twisted-components specifies the Tate-twisted components that the ordinary and signed comparisons use. Here their hypotheses are exposed and their formulations compared; none of their automorphic proofs is a second target. Use its independently stated endpoints on the earlier Selmer, modular-symbol and zeta carriers. The full BCS integral endpoint beyond its §7.10 correction-unit range is the additional contract in gap:automorphic-endpoints. Here the only construction is transport to the formulations below.
- **SelmerIwasawaCohomology, Part II.** Its §§8.1–8.4 own the unitary level-raising and diagonal-regulator rank theorems; the explicit elliptic sigma height and Schneider-specific abelian-variety height adapters are owned here (§§3.7–3.9); no comparison with a general Nekovář height is asserted.
- **SerreWeightAndLevelOptimisation.** Its Mazur principle, Edixhoven weight theorem and Ribet's four sets of levels prove the ramification needed in the higher-weight example (§5.11).
- **DiophantineApproximationAndTranscendence (a Tau Ceti roadmap).** Its Layer 5 (§5.6) states Nesterenko's algebraic-independence theorem for complex q. It does not state the p-adic case of the Barré-Sirieix–Diaz–Gramain–Philibert theorem, which is the input for ℒ_p(E) ≠ 0; the general p-adic theorem and its elliptic corollaries are targets here (§3.7).
- **The other arithmetic branches are downstream.** HeegnerPointEulerSystems Layer 8b (split-prime anticyclotomic main conjectures and their Heegner/BDP comparison) and the rank-zero and rank-one Birch–Swinnerton-Dyer branch (supersingular, multiplicative and Eisenstein-prime endpoints) build on Layers 0, 1 and 4 of this roadmap, and the Birch–Swinnerton-Dyer branch also on the leading-term consequences of Layer 5. Their theorems are not restated here. Layer 6 fixes, in this roadmap's objects, the formulation each of them uses and proves the transfer between that formulation and the ones of Layers 0, 3 and 4.

The generic determinant base-change theorem and characteristic-ideal coefficient-change theorem belong to PadicMeasuresIwasawaAlgebras §§5.1 and 4.6. Sections 0.6 and 5.2 here specify the arithmetic-complex, zeta-map, Selmer and analytic comparisons to which those theorems are applied; they introduce no second generic algebraic theorem.

The named theorem families do not assert the main conjecture for every ordinary representation, every nebentypus, every tame component, every crystalline basis, or every deformation ring. General input data may be used to define a conjectural proposition without asserting its truth. In particular, a rational ideal equality, an integral ideal equality and an exact normalized leading coefficient are separate conclusions.

## Conventions

Let p be a prime, L/ℚ_p finite, O its ring of integers, ϖ a uniformizer and F=O/(ϖ). Use continuous actions of the relevant profinite Galois groups on the indicated topological modules. Mathlib's `ContRepresentation` ensures that each individual operator is continuous; continuity in the group variable, or joint continuity of the action, is a separate hypothesis and must be supplied for Galois representations.

Write ℚ∞ for the cyclotomic ℤ_p-extension, Γ=Gal(ℚ∞/ℚ), and choose γ with κ(γ)=1+p for odd p and κ(γ)=5 for p=2 (when p=2, κ(Γ)=1+4ℤ₂, so 1+p=3 is not a value of κ on Γ). Set Λ=O[[Γ]]≃O[[X]], X=γ−1. For the full p-power cyclotomic extension use G∞=Δ×Γ with Δ≃(ℤ/pℤ)× for odd p and Δ≃(ℤ/4ℤ)×={±1} for p=2, and Λ(G∞)=O[Δ][[Γ]]. For odd p the order of Δ is a unit in O and Λ(G∞) is the product of its η-components. For p=2 it is not: Λ(G∞) only injects into the product of its two components, with cokernel killed by 2, and its localisation at a height-one prime containing 2 need not be a discrete valuation ring (Kato 12.1.2 and 12.1.4, pp.219–220). A finite coefficient extension contains the values of each tame character under consideration. An integral statement is over Λ; a rational one is over Λ[1/ϖ]. The latter is an algebraic localization and is not identified with L[[X]]. Characteristic ideals are taken only for finitely generated torsion modules over the specified regular component ring.

**Range of primes.** The modular Iwasawa datum (§0.1), the Iwasawa cohomology of §0.6 and Kato's main conjecture (§0.7) are defined for every prime p, including p=2. Kato states his conjecture for every p, and at p=2 only at the height-one primes of Λ(G∞) that do not contain 2 (Kato Conjecture 12.10, p.224); his comparison with the rational ordinary main conjecture holds at those primes for p=2 as well (§0.10; Kato 17.13, pp.279–280). The general p-adic Mahler–Manin theorem and its elliptic transcendence/logarithm corollaries in §3.7 are also for every prime, including 2. The other prime-dependent targets are stated for odd p, the range of their sources: the integral forms of Kato's results need p≠2 (Kato Theorems 12.4(3) and 12.5(4), pp.221–222, Theorem 17.4(3) and Conjecture 17.6, pp.273–274); the ordinary Selmer group, canonical p-adic L-function and main conjecture of §§0.2–0.5 are those of Skinner–Urban and Skinner, who work with odd p; the signed theory of §§0.11–0.13 and 4.3–4.5 is that of Lei–Loeffler–Zerbes, who fix an odd p (LLZ p.6); the theorems of Layers 1–4 are proved for p≥3 (Skinner–Urban Theorem 1, p.2; Skinner Theorem A, p.1; Fouquet–Wan Theorem 5.1, p.68) or p>3 (Burungale–Castella–Skinner Theorem 1.1.2, p.2); and the heights, leading terms and p-adic Birch–Swinnerton-Dyer statements of §§3.2, 3.7–3.9 and 5.5–5.8 follow Stein–Wuthrich, who assume p odd from §3 on (p.1762). Targets that need p≥5 or p>3 say so.

The form's representation V_f is cohomological: geometric Frobenius at an unramified ℓ has polynomial X²−a_ℓX+ε(ℓ)ℓᵏ⁻¹, and the arithmetic cyclotomic determinant is ε⁻¹κ¹⁻ᵏ. Write T_f for the chosen integral lattice. The Skinner–Urban Selmer lattice is T=T_f(det ρ_f⁻¹); in dimension two its rational representation is V_f^*. For weight two and a specified modular elliptic curve, this twist corresponds to the homological Tate-module realization. Do not change between these representations inside an Euler polynomial or a residual local condition.

In the good ordinary cohomological representation the selected line V_f^+ is unramified. After the determinant twist, T^+=T∩V_f^+(det ρ_f⁻¹) need not be unramified; the quotient T/T^+ is unramified. Set A=T⊗_O L/O and A^-=(T/T^+)⊗_O L/O. For good ordinary forms use the strict decomposition-group kernel with coefficients A^−. It equals the inertia kernel because the unramified eigenvalue is not 1. For the multiplicative theorem use Skinner’s inertia-kernel condition. At split multiplicative reduction the eigenvalue is 1, so the strict condition is a separate auxiliary condition and its local correction is retained (Skinner §2.3, pp.8–12).

For Iwasawa modules use Skinner’s scalar-dual convention: `D_Λ(M)=Hom_cont(M,ℚ_p/ℤ_p)` with `(λ·φ)(m)=φ(λm)` (Skinner §2.3, p.8). This is a Λ-module dual. Distinguish the contragredient representation dual, whose action is `(g·φ)(m)=φ(g⁻¹m)`. The latter is `D_Λ(M)^ι`, where ι(g)=g⁻¹. Thus e_ηD_Λ(M)=D_Λ(e_ηM), whereas the contragredient dual of M^η has character η⁻¹. For a tame generator acting by 2 in F₇, precomposition gives scalar 2 and contragredient precomposition gives 4, since 2·4=1 and 2≠4. The ordinary statements use D_Λ; the natural ordinary Poitou–Tate map of §0.10 lands in `D_Λ(Sel)^{ι_Γ}` and is transported term by term. The signed package of §§0.11–0.13, 2.3(2), 4.3–4.5 and 6.3(1) uses the contragredient dual, denoted there by X^i or by a signed Selmer group with superscript ∨, with the natural compact and Coleman actions. Write X_sc^i=D_Λ(Sel^i). Then X^i=(X_sc^i)^ι and `X^{i,η}≃(X_sc^{i,η⁻¹})^{ι_Γ}`, where ι_Γ(γ)=γ⁻¹, so `char(X^{i,η})=ι_Γ(char(X_sc^{i,η⁻¹}))`. The explicit scalar form of every signed assertion is obtained by this formula; even for η=1 the Γ-inversion remains. Converting a whole equality to the other convention inverts its analytic ideal as well. For Skinner–Urban Proposition 3.2.18 write T*=Hom_cont(T,ℚ_p/ℤ_p) with contragredient Galois action; it has no Tate twist. For T=T_pE the Weil pairing identifies it with E[p∞](−1). The local Tate dual is instead Hom_cont(T,μ_(p∞))=T*(1). Transport every supplier comparison to these conventions before comparing its characteristic ideal or Coleman-image quotient.

Use P_f^± for the differential periods of the saturated full-symbol lattice of ModularSymbolsPadicLFunctions §1.1, and put Ω_f^±=P_f^±/(−2πi). Distinguish them from the periods P_SU^± of Skinner–Urban’s integral Betti lattice and the absolute-cohomology periods P_abs^± of §3.1; §0.9 retains c_f^±=P_f^±/P_SU^±, and §3.1 retains P_f^±/P_abs^±. No integral identification of these lattices is implicit.

For every ordinary form h used below, including f⊗χ_K and the weight-two p-new forms, write L_SU,h for the source function normalized by P_SU,h^±. With c_h^±=P_h^±/P_SU,h^±, matched interpolation gives L_SU,h^Σ=c_h^+L_h^Σ up to O^× on the trivial tame branch. The source proves integrality of L_SU,h; the comparison is initially in Λ[1/ϖ]. OrdinaryBettiSymbolUnit(h) means c_h^+∈O^×. Its general-weight use is an explicit hypothesis, while the irreducible-residual elliptic comparison is specified in §3.2. Changing Σ retains the same scalar.

With Ω_f the interpolation denominator has exponent m+1 on −2πi; with P_f it has exponent m. For m=0 the denominator is −2πiΩ_f=P_f, and for m=1 it is (−2πi)²Ω_f=(−2πi)P_f. The scalar from a full-symbol-normalized analytic function to the curve’s Néron-normalized one is P_f^+/Ω_E^+ on the appropriate sign component; from the source function it is P_SU,f^+/Ω_E^+. Algebraicity of either scalar does not make it a unit (Skinner §2.4, equation (2.4.1) and footnote 6, p.14).

Use cochain degrees for determinants: `det C = ⊗_i(det C^i)^{(−1)^i}`. The fundamental line includes the inverse determinant and its stated Betti factor. For nonzero a, the complex `[O --a--> O]` in degrees 1 and 2 has H¹=0 and H²=O/(a); its inverse-determinant trivialization has divisor +div(a). Separately, H¹=Oe, z=ae and H²=0 give the zeta quotient O/(a) and divisor −div(a). When both contributions occur, their lengths subtract; equal lengths cancel. The determinant/characteristic comparison equates the degree-two torsion ideal with the degree-one zeta-quotient ideal. For a removed Euler factor E, the primitive zeta normalization is z_prim=E_dual⁻¹z_Σ; with E_dual=2 the two values 1 and 2 satisfy z_Σ=2z_prim, fixing the direction.

Signed labels refer first to a chosen integral Wach basis and its Coleman coordinates. For a_p=0 and the LLZ elliptic basis, index 1 is Kobayashi's minus condition and index 2 is plus. A general basis change changes individual kernels. A component's analytic term is `char(I_i^η/Λ L_i^η)` for the actual image lattice I_i^η. Principal-ideal notation `(L_i^η)` is justified only by the image computation and normalization comparison specified for that component.

Tate twists of Kato's lattice change tame components. For r∈ℤ write T_K(r) for the twist of Kato's lattice T_K (§0.6) and φ_r:H^i(T_K)≃H^i(T_K(r)) for the twist isomorphism of SelmerIwasawaCohomology §3.7, built from the chosen compatible roots of unity; it satisfies φ_r(λx)=Tw_r(λ)φ_r(x) with Tw_r(σ)=κ(σ)^(−r)σ. Since Tw_r(e_χ)=e_(χω^r), φ_r carries the χ-component to the χω^r-component, and on that component γ acts through κ(γ)^r times its old action. Thus the trivial tame component of T_K(r) is the ω^(−r)-component of T_K, transported by Tw_r. Three twists occur: r=1 gives the compact Tate partner Hom_O(T,O(1))≅T_f(1) of the ordinary discrete module A when the character is trivial (§0.10), r=k−1 gives the Lei–Loeffler–Zerbes lattice T_LLZ of §0.11, and r=k/2 gives the central-critical lattice of §2.1. For weight two and trivial character all three are T_K(1)=T_pE, whereas T_K=T_pE^∨ (Kato §17.5, p.274, where the lattice of an elliptic curve is T_pE(−1)).

Use Iwasawa's branch of log_p, with log_p(p)=0, and ord_p(p)=1. The analytic cyclotomic coordinate is X=κ(γ)ˢ⁻¹−1; its first coefficient is log_p κ(γ). The inverse coordinate κ(γ)¹⁻ˢ−1 has first coefficient −log_p κ(γ). For γ with κ(γ)=1+p, these coefficients differ by a sign, but the logarithm itself is a nonunit. In a rank-r leading coefficient it occurs to the power r and must be compared with the height normalization.

## Exact supplier contracts

The following outputs specify the maps and normalizations consumed here. All numbered KatoEulerSystems and AutomorphicCongruences interfaces are conditional proposed contracts under Scope and ownership, including the base outputs as well as the named extensions. An application carrying one of these comparisons as a hypothesis remains conditional on precisely that comparison.

### From Mathlib and Tau Ceti

Use `Representation.invariants` and `Representation.invariants_eq_top` in Mathlib/RepresentationTheory/Invariants.lean:73,85 for the fixed submodule and its trivial-action case; the native definition imposes only that every group element fix the vector, with no continuity or finite-dimensionality condition. Use `ρ.comp I.subtype` for restriction to a subgroup; `Module.finrank` is finite dimension over F in all residual invariant calculations. Use `Matrix.toLin'` on `Fin 2 → O` and the quotient by `LinearMap.range (u−LinearMap.id)` for integral coinvariants. `Associated f g` means equality up to a unit, not equality after inverting ϖ. The exact algebraic μ comparison in §5.3 is stated over a DVR and does not require mixed characteristic.

Tau Ceti defines `TauCeti.completedGroupAlgebra R Γ` as the inverse limit over open normal subgroups, together with `TauCeti.completedGroupAlgebra.proj`, `.of`, `.map` and `.map_of` in `Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.Basic` and `.Map`. Its `.PowerSeries` module supplies `TauCeti.completedGroupAlgebra.powerSeriesCoordinate`, `.powerSeriesCoordinate_X` and `.powerSeriesCoordinate_one_add_X` over ℤ_p for an infinite compact commutative pro-p group with the specified topological generator. The finite discrete tame-product comparison is `TauCeti.completedGroupAlgebra.monoidAlgebraProdEquiv` in `.Prod`. Reuse these constructions; finite O-coefficient extension and the characteristic-ideal/determinant interfaces are consumed from PadicMeasuresIwasawaAlgebras. The power-series coordinate theorem just cited is ℤ_p-linear, not a theorem already stated over every O.

The underlying absolute Galois groups, cyclotomic characters, restriction/corestriction and Kummer interfaces are the existing Mathlib/Tau Ceti objects and the local-field/class-field roadmaps named under Scope and ownership. EllipticCurves Layer 4 supplies the Tate curve E_q for a given q∈K^× with |q|<1 over a complete rank-one valued field K, its Galois-equivariant uniformisation L^×/q^ℤ≅E_q(L), j(q) and v(Δ(q))=v(q). The converse, that a given curve with multiplicative reduction over a finite extension of ℚ_ℓ is a quadratic twist E_q⊗η of a Tate curve with a unique parameter of positive valuation, untwisted exactly in the split case, is PadicHodgeTheory §9.3 (`potentiallyMultiplicativeTwistReduction`, every prime ℓ; Silverman, *Advanced topics*, Theorem V.5.3); for split multiplicative E/ℚ_p it gives q_E∈ℚ_p× with E(ℚ̄_p)≃ℚ̄_p×/q_E^ℤ and ord_p(q_E)=ord_p Δ_min=−ord_p j_E>0. ArithmeticGaloisRepresentations §6.3 (Multiplicative residual unramified criterion) supplies the inertia criterion used here: for multiplicative E at ℓ≠p, E[p] is ramified at ℓ exactly when p∤ord_ℓ j_E=−ord_ℓ Δ_min, in the nonsplit case as well, because the unramified quadratic splitting character is trivial on inertia. This is an inertia criterion away from the coefficient prime; it is not a criterion that q_E be a p-th power over the original local field.

### From PadicMeasuresIwasawaAlgebras, SelmerIwasawaCohomology and ArithmeticGaloisDuality

PadicMeasuresIwasawaAlgebras §§4.5–4.6 supplies the O-coefficient coordinate and tame-component interfaces on those completed group algebras, with γ↦1+X. Layer 4 supplies `charIdeal`/`charDivisor`, exact-sequence multiplicativity, pseudo-isomorphism invariance, tame-component decomposition, finite coefficient base change, Weierstrass preparation and μ/λ. Layer 5 supplies determinants of perfect complexes, derived base change and specialization, and compact topological Nakayama.

SelmerIwasawaCohomology §§2.7–2.10, 2.19, 2.23, 3.1–3.2 and 3.13–3.15 supply the ordinary Selmer complex and its discrete/compact dual descriptions, change-of-local-condition triangles, Poitou–Tate and Iwasawa Shapiro. Sections 3.18–3.21 supply the explicit Greenberg structure hypotheses, localization surjectivity, no-pseudo-null and Fitting/characteristic comparisons; §4.21 supplies the general Greenberg proposition. Retain the stated ordinary range and transport the supplier’s contragredient dual through the scalar-dual convention above. Localization surjectivity in §5.1 is used only with the specified global hypotheses and a set containing the ramification set. Signed conditions use local Tate orthogonality with the same dual and inversion conventions as the Coleman domain.

SelmerIwasawaCohomology Layer 3 also supplies the classical restriction-control sequence (§3.11) and the Iwasawa descent of §3.3, which §§3.9 and 5.4 specialise to A=E[p^∞]. The comparison of Schneider's flat Néron-model cohomology with the ordinary Galois Selmer group, the height normalisations and the leading-term theorem are targets of this roadmap (§§3.7–3.9), not supplier outputs.

The cyclotomic elliptic height is constructed in §3.7 from the Mazur–Tate sigma function. Schneider's flat arithmetic complex and his algebraic and analytic heights for A/k are targets of §3.8, using the supplied Néron models (NeronModelsAndSemistableAbelianVarieties Layers 1–2), fppf sites and cohomology (SchemeAndStackFoundations §§2.1–2.2, 2.11) and the global flat duality contract below. No general representation-height or Bockstein construction is consumed.

ArithmeticGaloisDuality D7.6 supplies Poitou–Tate duality for ℤ_p-lattices over a number field with the primes above p inverted, abelian-variety Ext on the big étale site of a field of characteristic zero, and local duality for abelian varieties over finite extensions of ℚ_ℓ. These are used for the generic-fibre and local terms of §3.8. None of them is flat duality over a ring of integers, where the places above p remain and the p-power torsion of a Néron model need not be étale.

What ArithmeticGaloisDuality must provide (gap:global-flat-duality): for a number field k with ring of integers o, an odd prime p and an abelian variety A/k with Néron model 𝒜 over o, dual Â and identity component 𝒜̂° of its Néron model, the Artin–Mazur global flat duality for 𝒜(p) = lim_n 𝒜[pⁿ] and T_p𝒜̂° over o and each finite-layer ring o_n. Supply the compact-support pairing and its archimedean corrections. In Schneider’s range, A has good reduction at every place above p (§1, p.332); there require the induced identification H²(o_n,𝒜(p))^∨≃H¹(o_n,T_p𝒜̂°) of §1, p.335. Writing H for this degree-two discrete group and M for its finitely generated compact dual, this gives (Div H)^∨≃M/Tor M and (H/Div H)^∨≃Tor M. The second identity is the finite cotorsion term used in Schneider §2, Lemma 2, pp.341–342; the first retains the free part used by the height. Keep the local terms of the compact-support localization sequence and the component-group maps comparing 𝒜̂° with 𝒜̂: a finite kernel or cokernel in that comparison is retained, rather than promoted to an exact identification. At multiplicative places above p, require the compact-support localization sequence, the local flat-to-generic-fibre maps and their kernels/cokernels as inputs to schneiderFlatGaloisComparison (§3.9); no good-reduction whole-module identification is assumed there. Require compatibility with restriction, corestriction and generic-fibre maps throughout the tower (Schneider §1, pp.330–340, and §2, Lemma 2 and its proof, pp.341–342, in its good-reduction range; the multiplicative comparison uses Werner Theorem 7.2 and Corollary 7.3 and Jones’s multiplicative leading-term theorem as in §3.9).

**Checks.**

- For H=ℚ_p/ℤ_p, M=ℤ_p, the two duals are ℤ_p and 0; Tor M=0 cannot be the dual of Div H.
- For H=ℤ/p², M=ℤ/p², Div H=0: the two duals are 0 and ℤ/p², respectively.
- For H=(ℚ_p/ℤ_p)⊕ℤ/p and M=ℤ_p⊕ℤ/p, the free quotient is ℤ_p and the torsion subgroup is ℤ/p. Thus the height's rank-one contribution and the finite factor p are distinct. For A=0 both groups are 0.

### From the proposed KatoEulerSystems and the analytic/regulator suppliers

PadicFamilies §§4.0.1–4.0.3 supplies the actual geometric zeta classes, their moment and norm relations, the modular dual-exponential reciprocity law and the rational cohomological/ordinary bounds. Its integral assertions require odd p and the image of the cyclotomic-kernel Galois group to contain SL₂(ℤ_p) in an integral basis; they cannot be applied merely from a free rank-one coinvariant witness. Use its local degree-two correction at exceptional characters.

The proposed KatoEulerSystems contract requires the literal dual, Hecke and twist dictionary (§2.2), the nonvanishing of twisted critical values (§4.2: Jacquet–Shalika on the edge line and Rohrlich's finiteness of vanishing twists, Kato 13.5), the passage from Kato's hypotheses to Rubin's together with the strict-kernel bound under residual irreducibility and a free rank-one τ-quotient (§4.3), the rational zeta morphism and the finite index of its smoothed integral span (§§5.1–5.2), Nakamura's twist-one zeta morphism (§5.4), the period-normalized scalar regulator, its period dictionary with modular symbols and its equality with Kato's p-adic L-function (§§6.2–6.4), the elliptic local lattice and Kato period (§6.6), the cohomological bound, integral under Kato's (12.5.2) (§7.2), the elliptic ordinary and multiplicative divisibility (§7.4), the absence of finite submodules in the ordinary elliptic Selmer dual (§7.6), and the finiteness of the Bloch–Kato Selmer group at a nonvanishing central value (§7.9; Kato Theorem 14.2). The geometric class and reciprocity constructions remain owned by PadicFamilies §4.0.

The additional KatoEulerSystems contract (gap:modular-zeta-extensions): the integral forms of its cohomological bound (§7.2; Kato Theorem 12.5(4)) and of the general-weight ordinary divisibility (Kato Theorem 17.4(3), rational in PadicFamilies §4.0.3) under residual irreducibility and the free rank-one-coinvariant hypothesis verified in §0.8, in place of the SL₂(ℤ_p)-image hypothesis (12.5.2) stated there, retaining the local degree-two terms (Skinner §2.5 and Theorem 2.5.2, pp.15–16; Fouquet–Wan Lemma 3.13). Its §4.3 gives the strict-kernel bound under exactly this hypothesis. For §1.3 require the ordinary output in the source Betti normalization of Skinner §2.5, (L_SU,h^Σ)⊂char(X_h^Σ) for h=f and h=f⊗χ_K. Its full-symbol expression is (c_h^+L_h^Σ)⊂char(X_h^Σ), retaining each separate fractional ratio; a rational period dictionary is not a unit theorem.

The additional KatoEulerSystems contract (gap:central-critical-specialization): for f satisfying §2.2 with p∤N, put r=k/2 and T_cc=T(f)(r). Supply the full-cyclotomic-tower Tate-twist comparison, its tame-character change, and the induced comparisons of the Iwasawa complex, the Betti factor T(f)(r−1)^+, fundamental line and zeta morphism with those for T_cc. Specialization is augmentation only after this transport; with inverse tautological coefficients it is evaluation at κ^(−r) before transport, including the tame character ω^(−r), not evaluation of the original trivial tame component at 1. Supply central-critical reciprocity into the local cohomology of V_cc=T_cc[1/p], the Bloch–Kato finite condition, and the derived specialization/control sequence for the discrete module A_cc=V_cc/T_cc, retaining local invariant and degree-two error terms. At L(f,r)=0 this must put a nonzero specialized class in H¹_f(ℚ,V_cc), and in the zero-specialization case identify the degree-two contribution giving positive discrete Selmer corank (Fouquet–Wan §3.1.1, pp.21–22, and Corollary 5.3 and its proof, p.69). The direction L(f,r)≠0 ⇒ finiteness is its §7.9 (Kato Theorem 14.2(2)). The central-critical main-conjecture equality transported with these maps is required from AutomorphicCongruences §4.5, as specified below; it is not an Euler-system upper bound.

ModularSymbolsPadicLFunctions Layer 1 supplies saturated canonical period lines; Layers 2–4 supply the ordinary analytic construction, interpolation and primitive/imprimitive level change. Kato's p-adic zeta function for a pair (ω,γ) and the canonical function L_f are compared exactly in §0.9: after the explicit tame projection they differ by u_p(f) and a component-dependent unit. The defect includes the fractional Betti-to-full-symbol period ratio. An integral unit comparison is used only where proved (§3.2 for elliptic curves with irreducible residual representation, §0.10 when both KMC and IMC hold) or assumed by name (KatoPeriodDefectUnit).

PhiGammaModulesAndIwasawaCohomology §§6.0, 6.2–6.3 supplies the Wach modules, good integral bases and local Iwasawa cohomology domains, and expressly leaves Coleman maps and regulators to another owner.

PadicHodgeRegulators supplies, on those domains and bases, the Perrin–Riou map L_V of a crystalline representation (§8.8), the ordinary and multiplicative Coleman map of an elliptic curve in Rubin's normalisation (§8.22), Coleman coordinates Col_e = e∘(1−φ) on the ψ=1 module (§9.12), the logarithmic matrix and its expansion (§§9.14–9.15), constant basis covariance and integral shears (§§9.17–9.21), the exact rational image of the Coleman vector map (§9.26), the inclusions X_kΛ_O ⊂ Im Col_j^η ⊂ X_j^ηΛ_O with finite cokernel on the nonordinary modular lattice (§9.29), and the closed kernels ker Col_j with their basis-change law (§9.30). The Tate-orthogonal local condition attached to ker Col_j is constructed here (§0.11).

What PadicHodgeRegulators must provide (gap:signed-regulators): for the LLZ elliptic basis at a_p=0, the multipliers a^± ∈ Λ_E(G_∞)^× with a^−Col₁ = Col^− and a^+Col₂ = Col^+ relating its Coleman maps to Kobayashi's (LLZ Proposition 5.10 and Corollary 5.11), and the integral images Im Col₁ = Λ(G_∞) and `Im Col₂ = (Σ_{δ∈Δ} δ)Λ(G_∞) + XΛ(G_∞)` (LLZ Corollaries 5.18 and 5.22); and, for a good ordinary modular form of weight k ≥ 2 at odd p, the Coleman map on the unramified rank-one quotient, injective with finite cokernel into Λ, which identifies Kato's local quotient in §0.10 (Kato Proposition 17.11 and Lemma 17.12, pp.277–279). The multipliers are a priori units only after p is inverted; the integral condition of §4.5 is retained.

### From the proposed AutomorphicCongruences

The proposed contract requires AutomorphicCongruences §1.11 (Skinner–Urban reverse bound), §2.21 (Fouquet–Wan ordinary reverse bound), §§3.4 and 3.7–3.9 (fundamental lines, universal zeta morphism, classical specialization and zeta trivialization), §§4.3, 4.5–4.6 (family and pointwise endpoints and specialization corrections), and §§7.9–7.10 (rational and integral BCS endpoints). These statements use earlier suppliers' carriers and take no input from this roadmap. What AutomorphicCongruences must additionally provide (gap:automorphic-endpoints) is the full BCS integral endpoint under (Im) without the extra correction-unit assumptions of its §7.10; the comparison here retains the full source range. The Tate-twisted tame components used by the ordinary and signed comparisons are the further contract gap:tate-twisted-components below.

The endpoint of AutomorphicCongruences §1.11 is the Skinner–Urban GU(2,2) reverse bound: for p≥3, trivial nebentypus, good ordinary f of weight k≡2 mod p−1, irreducible and p-distinguished residual representation, and a ramified q∥N, choose an imaginary quadratic K in which p and every prime of N/q split and q is inert. For the source's large Σ, supply

```text
char(X_f^Σ) char(X_(f⊗χ_K)^Σ) ⊆ (L_SU,f^Σ L_SU,(f⊗χ_K)^Σ)
  = (c_f^+ c_(f⊗χ_K)^+ L_f^Σ L_(f⊗χ_K)^Σ).
```

Use the Selmer lattice of §0.2 and the source Betti periods, with the rational full-symbol comparison of §0.9. Integral assembly uses the actual rank-one unipotent inertia element. Removing either scalar from this source contract requires OrdinaryBettiSymbolUnit for that form; the quadratic twist has its own period ratio. These are Skinner–Urban Theorem 3.6.1 and Corollary 3.6.3, pp.41–42 of the author copy, together with Skinner §§2.4–2.5, not a theorem in a different integral period normalization.

The endpoint of AutomorphicCongruences §2.21 is Fouquet–Wan §4.8's reverse cohomological divisibility for good ordinary f, p>2, arbitrary even weight, absolutely irreducible residual representation, distinct ordinary characters and an auxiliary ℓ∥N with residual inertia invariants of dimension one and decomposition invariants zero in the cohomological realization. The output is

```text
char(H¹_Iw/Λ z_Kato) divides char(H²_Iw).
```

Its proof uses the GU(3,1) bound, Beilinson–Flach reciprocity, Poitou–Tate and the weight-k version of the Castella–Wan argument, with the Kato twist/factor separation. No canonical/Gross period comparison is an input to this route.

The contract of AutomorphicCongruences §§3.4 and 3.7–3.9 is the universal zeta morphism and its fundamental line, in four sections. Section 3.4 gives the Σ-partial and full fundamental lines Δ_Σ(T), Δ(T) over quotients A of the localised Hecke algebra `𝕋^Σ_{m_ρ̄}` or of Λ, their derived base change, and the rank-one Euler correction [A→(1−α_ℓ)A] (Fouquet–Wan Lemma 3.17, Definitions 3.18–3.19, Proposition 3.20, pp.31–32). Section 3.7 gives the `R_{ρ̄,Σ}-linear` maps `z_{Σ,n}(ρ^u):(ρ^u)^*→H¹_Iw(ℤ[1/Σn,ζ_n],(ρ^u)^*(1)),` with τ-equivariance and the Euler-system norm relations (Nakamura Theorem 1.1, Remark 1.2, Corollary 4.2). Section 3.8 identifies the specialisation at every modular point x_f with `∏_{l∈Σ∖{p}}P_{f,l}(σ_l⁻¹)·z_n(f),` Kato's twisted classical morphism (Nakamura Theorem 4.3). Section 3.9 gives the induced injective trivialisation of Δ_Σ(T_Σ) over 𝕋 and, after restriction of scalars, over the regular subring Λ≅O[[X₁,X₂,X₃]], with the compatibility squares at minimal primes and classical points (Fouquet–Wan (1.2.1)–(1.2.3), Propositions 3.22–3.23). Nakamura's construction assumes p≥5; the required contract must state it, as Fouquet–Wan Theorem 3.6 does, under Fouquet–Wan Assumptions 2.1 and 3.5, and the case p=3 rests on the remark following Fouquet–Wan Theorem 3.6 (p.24), which replaces the two p≥5 inputs of Nakamura (his Theorem 4.7 and Theorem B.24) by Paškūnas's Propositions 2.13 and 2.33 for all p. That p=3 extension is part of the supplier's target, not of this roadmap.

The endpoint of AutomorphicCongruences §§4.3 and 4.5 is Fouquet–Wan Theorems 5.1–5.2 in the exact residual range of §§2.2 and 4.1. For §5.4(2), its §4.5 contract additionally requires the equality for the central-critical complex C_cc and its transported zeta morphism of §2.1 (gap:central-critical-specialization), using the cyclotomic-twist family and the twisted Betti factor of Fouquet–Wan §3.1.1. Equality on the untwisted trivial tame component alone is not this input; the comparison must reach the ω^(−k/2) component and κ^(−k/2) evaluation described in §2.1 before augmentation. The pointwise output is that the zeta morphism trivializes the integral fundamental line on the trivial tame component for classical f of level Np^r. The family output is an isomorphism `Δ_Σ(T_Σ)≃Λ` over the regular subring Λ≃O[[X₁,X₂,X₃]], not over an arbitrary singular deformation or Hecke ring. All derived/local corrections in §4.2 remain attached to specialization.

What AutomorphicCongruences must additionally provide (gap:tate-twisted-components): the pointwise output of §4.5, and the reverse bound of §2.21, are stated on the untwisted trivial tame component, KMC^1(T_K) of §0.7. The comparisons here use Tate-twisted components. In the residual range of its §4.5 the contract requires the equality on the trivial tame component of T_K(r) for r=1 and r=k−1, with zeta module φ_r(Z(f,T_K)): this is Fouquet–Wan's Conjecture 1.5 for the motive M(f)(r), the proposition KMC^1(T_K(r)). In the range of its §2.21 it requires the reverse divisibility char(H²)⊆char(H¹/Z) on the trivial tame component of T_K(1). By KMC.twist these are statements about the ω^(−r)-components of T_K, with γ transported by Tw_r; for odd p and r≢0 mod p−1 that transport does not derive them from the untwisted statement, which concerns another component. The ordinary comparison of §0.10 uses r=1 and the signed comparison of §0.13 uses r=k−1; the central-critical twist r=k/2 is gap:central-critical-specialization. For k=2 all three twists are r=1, so in weight two this contract and the central-critical equality are the same equality, for T_K(1)=T_pE.

The BCS contract of AutomorphicCongruences §§7.9–7.10 with gap:automorphic-endpoints is Burungale–Castella–Skinner Theorem 1.1.2: for E/ℚ, p>3 good ordinary and E[p] irreducible, the cyclotomic equality is rational; with a cyclotomic-kernel element whose Tate-module coinvariants are free of rank one, it is integral. Both use the Néron-normalized function of §3.2 and the Tate lattice, with no auxiliary Steinberg-prime hypothesis and no non-CM hypothesis on this particular theorem.

### From elliptic modularity, families and heights

EllipticCurveModularity R29.4–R29.6 supplies a newform f_E, a modular parametrization and a rational Galois comparison; use the inverse image of T_pE under the rational modular isogeny for the integral lattice. GrossZagierAndArithmeticHeights supplies the Manin constant with its isogeny law (§3.5), its integrality and p ∤ c_φ for an X₀(N)-optimal parametrization at an odd semistable prime (§3.7), and the transfer of p-valuations along isogenies and quadratic twists (§3.10). An optimal parametrization gives the saturated homology/period comparison used in §3.1; its comparison with the modular-symbol period lines is gap:manin-period-comparison, and a general isogeny contributes the explicit factor of §3.10.

What GrossZagierAndArithmeticHeights must provide (gap:manin-period-comparison): compare the absolute/parabolic lattice of an X₀(N)-optimal elliptic quotient with the full cusp-divisor symbol lattice of ModularSymbolsPadicLFunctions §§0.4, 1.1. Supply the rational signed comparison, its explicit nonzero fractional period ratio `r_E^±=P_{f_E}^±/P_abs^±,` and its behaviour under isogenies and X₁(N) → X₀(N), retaining the cusp/boundary indices. In weight two, at odd good ordinary or multiplicative p with E[p] irreducible, supply the p-unit comparison with the Néron period: localize the integral boundary exact sequence at the residual maximal ideal, use residual irreducibility to exclude the boundary Hecke support, and compare the resulting saturated line with the optimal X₁(N) quotient (Skinner §3.3 and note 8, p.25; ModularSymbolsPadicLFunctions §0.4). At Eisenstein primes no unit assertion follows from optimality or p ∤ c_φ. GrossZagierAndArithmeticHeights §§3.5, 3.7, 3.10 supplies the Manin and isogeny factors; the additional full-symbol comparison remains with that period owner. Colmez Theorems 0.8 and 0.20 supply the Néron-normalized distribution and rational modular comparison, not an unrestricted integral boundary comparison.

PadicFamilies §0.17 supplies ordinaryCuspidal_control_oddPrime for every odd p, and extends its Layers 1 and 4 to that range. Use its family periods (§1.4), specialization (§1.6), two-variable measure (§§1.5, 1.12), big Galois representation and filtration (§§4.1–4.2). Its quotient-period comparison retains a fractional correction ideal; a unit comparison requires a perfect integral dual/divided-power pairing and a saturated controlled eigensymbol lattice. Section 1.6 here owns only the approximation and the comparison to the canonical periods of §0.4, with that correction ideal retained.

What PadicFamilies must provide (gap:approximant-period-units): under the approximation hypotheses of §1.6, establish the perfect integral coefficient pairing and saturation at a sequence of weights of arbitrarily high precision, making its §1.4 quotient-period correction relative to the saturated periods of §0.4 a unit at the weight-two point and all chosen approximants (Skinner Proposition 2.6.1, in his period convention). Without that comparison, the approximation below gives the corrected ideals only.

Greenberg–Stevens' derivative formula for a split multiplicative curve is the target greenbergStevens_derivative of §5.7. Its general input is the rational exceptional-zero family contract below, rather than the restricted approximation of §1.6. DirichletPadicLFunctions §0.6 supplies localIwasawaLog, existsUnique_isIwasawaLog_of_finiteDimensional and localIwasawaLog_exp, with log_p(p)=0 (and depth four at p=2). Nonvanishing of ℒ_p(E) follows from the general p-adic Mahler–Manin theorem of §3.7.

What PadicFamilies must provide (gap:general-exceptional-zero-families): at every split multiplicative elliptic weight-two point, for every odd p including 3 and with reducible residual representations allowed, supply the rational ordinary deformation, a two-variable analytic function with the fixed one-variable Néron-period specialization, and the eigenvalue derivative comparison −2·a_p′(2)=log_p(q_E)/ord_p(q_E). No auxiliary Steinberg prime or residual irreducibility is allowed in this contract. Greenberg–Stevens Theorems 5.13 and 7.1 support the p≥5 argument; Colmez Theorem 0.11 states the general derivative endpoint. The all-odd-prime deformation/period input is a supplier gap, not a consequence of the restricted family contract.

Serre's rank-two lifting lemma — for p≥5, a closed subgroup of SL₂(ℤ_p) surjecting modulo p is SL₂(ℤ_p) — is stated as a target by no other roadmap and is the target `sl2Zp_closedSubgroup_eq_top` of §3.6. EulerSystemsAndKolyvaginSystems §1.13 applies the same d=1 statement, citing Landesman–Swaminathan–Tao–Xu, to lift a closed commutator image from Sp₂(𝔽_p)=SL₂(𝔽_p) to Sp₂(ℤ_p); it states no target for it. With the Weil-pairing determinant and the closed commutator subgroup, residual GL₂-surjectivity then gives full p-adic GL₂ image and cyclotomic-kernel image SL₂. The introduction of Landesman–Swaminathan–Tao–Xu, p.1, records this rank-two input from Serre; their Theorem 1 concerns higher dimension.

### From SerreWeightAndLevelOptimisation and Mathlib's level-one forms

SerreWeightAndLevelOptimisation §2.9 (Mazur's principle) supplies: for ℓ≥5, q∤Mℓ and q≢1 mod ℓ, an irreducible residual representation occurring at level Mq with the source's character convention and unramified at q occurs at level M in some weight (Ribet, *Report on mod ℓ representations*, (4.7) and Theorem 8.1). Its §3.9 (Ribet's four sets of levels) supplies, for ℓ≥5 and odd irreducible modular ρ̄, that occurrence in some weight at a level N prime to ℓ is equivalent to occurrence in `S_{k(ρ̄)}(Γ₁(N))` (Ribet, Theorem 3.3). Its §3.1 supplies the residual local form of an ordinary eigenform of weight 2≤k≤p+1 at p∤N, which fixes the Serre weight k(ρ̄) through the recipe of AlgebraicModularFormsAndSerreWeights R15.4. Mathlib supplies `CuspForm.rank_eq_zero_of_weight_lt_twelve`: level-one cusp forms of weight below 12 vanish, so S₄(SL₂(ℤ))=0. These inputs are used only in §5.11.

### Downstream branch roadmaps

HeegnerPointEulerSystems Layer 8b and the rank-zero and rank-one Birch–Swinnerton-Dyer branch are not suppliers: they import Layers 0, 1 and 4 of this roadmap (the latter also Layer 5). Layer 6 specifies the formulation each of them states its endpoint in and proves the transfer to this roadmap's formulations; it does not cite their theorems. In particular the inputs of the Eisenstein-prime proofs — Rubin's two-variable main conjecture via elliptic units for imaginary quadratic fields, extended to the exceptional characters and to p | h_K, Hida's anticyclotomic μ-vanishing for Katz p-adic L-functions and the Hida–Tilouine main-conjecture comparison — belong to those roadmaps' proofs and are not prerequisites of any target here. Their exact shape, which the downstream proof has to meet, is recorded next so that the formulation of §6.2 and the downstream inputs use the same normalisations.

The elliptic-unit input belongs to the CM main-conjecture theory used by the downstream proof. The argument of Castella–Grossi–Skinner covers characters with θ|G_K∉{1,ω}, and the Coates–Wiles identification of the elliptic-unit quotient with the Katz function assumes p>3, p nonanomalous and a nonzero isotypic index (Keller–Yin, proof of Theorem 2.2.3, p.34). The downstream proof needs the broader elliptic-unit character comparison, covering the finite residue fields k_O and the exceptional characters of Keller–Yin. Precisely, let K be imaginary quadratic with p=v v̄ split, and take the Teichmüller lift of a continuous θ:G_K→k_O× of conductor supported at split primes. Put M_θ=O(θ)⊗Λ∨ with inverse tautological action and X_θ=H¹_Fnr(K,M_θ)∨, relaxed at v and unramified at v̄ and away from p; compute global cohomology outside a finite set containing p, the conductor and the archimedean places. With Λ=O[[Γ_K^-]] and its completed unramified coefficient extension Λ^nr, the downstream proof needs X_θ finitely generated Λ-torsion, μ(X_θ)=0 and

```text
char_Λ(X_θ) Λ^nr = (L_θ)       if θ ≠ 1,
char_Λ(X_1) Λ^nr = ((γ−1)L_1)  if θ = 1.
```

These are Keller–Yin Definition 1.2.1(iii), p.13, and Theorem 1.2.2 and its proof, p.14, with their period-normalized Katz function and coefficient rings (§2, pp.31–33). They add no p∤h_K, nonanomalous or p>3 restriction. The trivial-character factor is the augmentation γ−1, not a uniformizer; it raises λ by one without raising μ. An all-prime *rational* CM main conjecture cannot replace this integral statement.

Katz–Hida–Tilouine interpolation and Hida's anticyclotomic μ theorem for Katz p-adic L-functions are inputs of the downstream proof, owned outside this roadmap. The μ theorem applies [Hida, Theorem I, p.45](https://annals.math.princeton.edu/wp-content/uploads/annals-v172-n1-p02-p.pdf) with p>2 unramified in the totally real field, split conductor and the exceptional condition (V) excluded, and its proof passes through Corollary 3.19 (pp.97–98). The first proof of Corollary 3.19 uses Lemma 3.17, which [Hida's 24 July 2022 addendum, Lemma 0.2, p.1](https://www.math.ucla.edu/~hida/Addendam.pdf) replaces; neither lemma holds as printed. Over A=𝔽₅ with m=3, the plane N={x+y+z=0}⊂A³ is free of rank two and every projection of N to two coordinates is surjective, so hypotheses (1)–(3) hold; but N≠A³, and N∩(A²×{0})={(t,−t,0)} does not project onto A², so it fails hypothesis (2) for m−1=2 and neither alternative of the conclusion holds. The downstream proof of the μ theorem therefore either proves a strengthened lemma whose additional hypotheses it verifies in the first proof of Corollary 3.19, or develops in full the second proof sketched on p.98 (Chai's globalisation of the Serre–Tate coordinate and the endomorphism algebra of the pulled-back abelian scheme). This affects only that downstream proof, not Hida's Theorem I as a statement nor any target here. Katz interpolation alone proves neither μ=0 nor an integral characteristic-ideal equality. The downstream proof also needs its distinct Hida–Tilouine main-conjecture/congruence comparison under that theorem's source hypotheses. These are requirements on the downstream proof, not constructions in this roadmap.

The general Greenberg proposition is consumed in the form of SelmerIwasawaCohomology Layer 4: a motive/realization, ordinary filtration, critical twists, Deligne periods, refinement and interpolation factors must all be specified. Section 5.9 verifies its modular instance, and states the modular instance of the Coates–Perrin-Riou and Panchishkin interpolation property, with the indicated tame projection; the general Coates–Perrin-Riou proposition belongs to a roadmap that builds on this one. No assertion about arbitrary motives follows from that verification.

### Named hypotheses carried by the targets

Each integral comparison that the sources do not prove in full generality is stated with a named hypothesis, never with an unnamed "period-unit comparison". The table lists them; each is a proposition about the stated data, never an assumed construction.

| Name | Where it is used | What is known |
| --- | --- | --- |
| OrdinaryBettiSymbolUnit(h) | Full-symbol integral forms of §§1.3 and 1.7; a product rewritten without corrections needs it for f and f⊗χ_K separately | c_h^+=P_h^+/P_SU,h^+∈O^×. The rational comparison is §0.9; no all-weight unit assertion is imported. For h=f_E with E[p] irreducible, the Betti/Néron and full-symbol/Néron comparisons of §3.2 imply it. |
| KatoPeriodDefectUnit | Integral canonical forms in §§0.10, 1.5, 2.3 in general weight | The defect u_p(f) of §0.9 is a unit for good ordinary elliptic curves with E[p] irreducible (§3.2, katoPeriodDefect_elliptic) and whenever both KMC^1(T_K(1)) and IMC hold with L_f≠0 (katoPeriodDefectUnit_of_IMC_KMC, §0.10). Without a unit comparison, KMC^1(T_K(1)) is equivalent to char(X)=(u_p(f)L_f) under §0.10’s hypotheses. |
| pollackMultiplierUnit | Principal Kobayashi–Pollack forms in §§4.5, 5.10, 6.3 | The corrected-image forms need no hypothesis (§4.5). The LLZ multipliers are units of Λ_E(G_∞); they are units of Λ_O(G_∞) whenever Kobayashi's and LLZ's image computations agree (LLZ p.40). |
| HeightNondegenerate and finiteness of Sha(E/ℚ)[p^∞] | §§3.9 and 5.8 | Schneider's conjecture and the finiteness of Sha; §5.8(2) shows they follow from MMC and ord = rank. |

Where these comparisons are made: the universal zeta morphism is AutomorphicCongruences §§3.7–3.9; the cyclotomic height, its normalisations and Schneider's theorem, including the comparison of Schneider's flat cohomology with the Galois Selmer group, are §§3.7–3.9; the Kato/canonical comparison is the exact defect statement of §0.9; the Wach/Néron comparison is the corrected/principal split of §4.5; the small-prime Hida approximation is §1.6; and the elliptic-unit, μ and Hida–Tilouine inputs belong to the downstream Eisenstein-prime proof described above.

The direction of supply is from the earlier arithmetic owners to this roadmap, and then to the downstream branches. A source theorem does not supply a library contract: each absent prerequisite below is an explicit supplier gap. The automorphic endpoints must use the earlier ordinary Selmer objects of SelmerIwasawaCohomology §§2.7–2.10 and the analytic objects of ModularSymbolsPadicLFunctions §§1.1, 2.5, 4.2–4.3; this roadmap consumes those endpoints and constructs its formulation comparisons.

## How to read the build

`README.md` specifies the full mathematics; `Suggested.lean` states the headline theorems expressible at the pins, together with the single simple definition they need. Its module docstring identifies each headline whose arithmetic carriers are absent. Layer 0 fixes the three formulations, their comparisons and the exact dictionary between Kato's periods and canonical periods. Layer 1 assembles ordinary theorems with explicit residual hypotheses, using the imported Tate parameter and multiplicative inertia criterion, and proves the Hida approximation behind the multiplicative theorem. Layer 2 translates the broader pointwise theorem. Layer 3 transports elliptic-curve endpoints, proves Serre's SL₂ lifting lemma behind the image condition, and builds the cyclotomic p-adic height with Schneider's leading-term theorem. Layer 4 handles the regular family base and signed image corrections. Layer 5 gives invariant changes and leading-term consequences with their precise inputs. Layer 6 fixes the formulations used by the downstream arithmetic branches and proves the transfers to this roadmap's formulations. In a prerequisite annotation, a section number refers to this roadmap and a named external layer refers to the supplier contract above.

## Layer 0: the three cyclotomic formulations

### 0.1 The modular Iwasawa datum

A modular Iwasawa datum D = (f, p, L, T_f) consists of: a prime p with fixed embeddings ι_∞ : Q̄ → C and ι_p : Q̄ → Q̄_p; a newform f ∈ S_k(Γ_1(N), ε) of weight k ≥ 2; a finite extension L/Q_p containing ι_p(Q(f)), with ring of integers O, uniformiser ϖ and residue field F; the two-dimensional L-representation ρ_f : G_Q → Aut_L(V_f) of Deligne in geometric normalisation, so that for ℓ ∤ Np the geometric Frobenius has characteristic polynomial X² − a_ℓ(f)X + ε(ℓ)ℓᵏ⁻¹ and L(V_f, s) = L(f, s); and a G_Q-stable O-lattice T_f ⊂ V_f. Put T := T_f(det ρ_f⁻¹), V := T[1/p], A := V/T (for f=f_E, the lattice chosen by the inverse-image construction in §3.1 gives T≅T_pE; an arbitrary stable lattice gives only the rational comparison), Γ := Gal(Q_∞/Q) for the cyclotomic Z_p-extension Q_∞, G_∞ := `Gal(Q(μ_{p^∞})/Q)` ≅ Δ × Γ with Δ ≅ (Z/p)^× for odd p and Δ ≅ (Z/4)^× for p = 2, Λ := O[[Γ]], Λ(G_∞) := O[[G_∞]], γ ∈ Γ the generator corresponding to 1 + p (to 5 when p = 2) under the cyclotomic character κ, and ι : Λ → Λ the involution induced by g ↦ g⁻¹. The residual representation ρ̄ is the reduction of T_f modulo ϖ; its semisimplification does not depend on T_f. The datum is good ordinary when p ∤ N and a_p(f) ∈ O^×; then V_f has a unique `G_{Q_p}-stable` line V_f^+ on which inertia acts trivially, and T^+ := (T_f ∩ V_f^+)(det ρ_f⁻¹). The ordinary datum satisfies (dist) when the two characters of `G_{Q_p}` on ρ̄ˢˢ restricted to `G_{Q_p}` are distinct, and (irred) when ρ̄ is irreducible. For the multiplicative branch only, also allow a weight-two p-new form of level N₀p, p ∤ N₀, with a_p = ±1: use its unramified cohomological subline and the same saturated determinant twist (Skinner 2016 §2.1, pp.5–6). In this roadmap ordinary includes this specified semistable case; good ordinary always requires p ∤ N.

Assume f is a newform. The prime p may be 2 (Conventions, range of primes); each later formulation states its own range. Require that L contains the Hecke field and, for an ordinary datum, the roots of X² − a_p X + ε(p)pᵏ⁻¹.

Use the geometric normalisation of ρ_f as in Skinner–Urban; Kato's `V_{F_λ}(f)` is related to it by the dictionary of KatoEulerSystems §2.2, and Fouquet–Wan's cohomological ρ_f (det = χ_cyc¹⁻ᵏ for trivial ε) by §2.1.

The usable interface consists of the following named outputs.

- ModularIwasawaDatum.T: The twisted lattice T = T_f(det ρ_f⁻¹) with its continuous G_Q-action; V = T[1/p], A = V/T.
- ModularIwasawaDatum.residual: The residual representation ρ̄ = T_f/ϖT_f of G_Q over F.
- ModularIwasawaDatum.residual_ss_independent: ρ̄ˢˢ is independent of the lattice T_f (Brauer–Nesbitt); if ρ̄ is irreducible, any two lattices are homothetic.
- ModularIwasawaDatum.changeLattice: A G_Q-equivariant inclusion T_f' ⊂ T_f with finite cokernel induces A' → A with finite kernel; the data D' and D share V and ρ̄ˢˢ.
- ModularIwasawaDatum.extendCoefficients: For a finite extension L'/L with ring O', the datum D ⊗ O' has lattice T_f ⊗_O O' and Iwasawa algebra `Λ_{O'}` = Λ ⊗_O O', faithfully flat over Λ.
- ModularIwasawaDatum.ordinaryLine: The saturated `G_{Q_p}-stable` line T^+ has free rank-one quotient T/T^+. In the good ordinary case the quotient’s character is the inverse of the unramified character of V_f^+, since T ≅ V_f^∨ rationally in dimension two. Thus T/T^+ is unramified; T^+ itself is generally ramified.
- ModularIwasawaDatum.cyclotomicIdentification: Λ ≅ O[[X]] via γ ↦ 1 + X, and Λ(G_∞) ≅ O[Δ][[Γ]] ≅ `∏_{η ∈ Δ^∨}` Λ when p is odd and O contains `μ_{p−1};` for p = 2 the map from Λ(G_∞) to the product of its two components is injective with cokernel killed by 2 (Kato 12.1.2, p.219).

Take ρ_f and its integral lattices from AutomorphicGaloisRepresentations §5.1 (`ordinaryRefinement`, saturation of the fixed lattice; cohomological annihilator convention) (ordinary case) and AutomorphicGaloisRepresentations §5.2 (`eigenformDcris`, `eigenformWach`, `eigenformWach_modParameter`) (crystalline nonordinary case); the line V_f^+ and saturation T_f ∩ V_f^+ are the ordinary refinement supplied there (Skinner–Urban §1.1, p.2).

The twist by det ρ_f⁻¹ is the one Skinner–Urban use to define their Selmer group (§1.1, p.2); for f=f_E and the chosen inverse-image lattice of §3.1, the identification T≅T_pE comes from EllipticCurveModularity R29.4 (rational Tate-module comparison) and the Weil pairing.

Λ, Λ(G_∞), the involution and the identification Λ ≅ O[[X]], γ ↦ 1 + X, are those of the completed group rings of PadicMeasuresIwasawaAlgebras §§4.5–4.6.

The source for this target is [Christopher Skinner and Eric Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf), §1.1, pp.1–2; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), §1.1.1, pp.3–5; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §2.1, pp.5–6.

*Needs:* AutomorphicGaloisRepresentations §5.1 (`ordinaryRefinement`, saturation of the fixed lattice; cohomological annihilator convention); AutomorphicGaloisRepresentations §5.2 (`eigenformDcris`, `eigenformWach`, `eigenformWach_modParameter`; invert p for the crystalline quotient); KatoEulerSystems §2.2 (dual/Hecke/twist dictionary); PadicMeasuresIwasawaAlgebras §§4.5–4.6.

**Checks.**

- For E = 11a1 (y² + y = x³ − x² − 10x − 20) and p = 7, a_7(E) = −2, so the datum is ordinary, and (dist) holds because on the cohomological ρ̄_f the sub-character is unramified and the quotient has the nontrivial inertia character ω⁻¹; on the determinant-twisted Tate representation these roles are dual.
- For an upper-triangular two-dimensional representation whose residual characters are 1 and ω, a stable lattice and an isogenous stable lattice have the same residual semisimplification 1 ⊕ ω even when their extension classes differ. Residual semisimplification, rather than equality of matrices or extension classes, is the lattice-independent output.
- For f = f_E of weight two and trivial character, det ρ_f = χ_cyc⁻¹ in geometric normalisation, so with §3.1’s chosen lattice T=T_f(χ_cyc)≅T_pE; a definition omitting the twist would give T_pE^∨, whose Selmer group is not the p^∞-Selmer group of E.
- For E = 14a1 and p = 5, a_5 = 0, so the datum is not ordinary and has no unramified `G_{Q_5}-stable` line.
- For f = f_E attached to 11a1 (weight 2, N = 11, ε = 1) and p = 7: a_7 = −2 ∈ Z_7^×, so the datum is ordinary; the unit root α of X² + 2X + 7 is congruent to −2 mod 7.
- Changing T_f to ϖT_f gives the same T up to the isomorphism multiplication by ϖ; changing it to a non-homothetic lattice changes T but not ρ̄ˢˢ.
- For p = 2, κ(Γ) = 1 + 4Z_2, so γ is chosen with κ(γ) = 5; the value 1 + p = 3 is not taken on Γ. The group Δ = {±1} has order 2, a nonunit of O, so the idempotents (1 ± δ)/2 for the nontrivial δ ∈ Δ do not lie in Λ(G_∞): a definition that splits Λ(G_∞) into η-components over O fails at p = 2.

### 0.2 The ordinary Selmer group over Q_∞ and its dual

For a good ordinary modular Iwasawa datum and a finite set Σ of primes not containing p, the Σ-imprimitive ordinary Selmer group is Sel^Σ(Q_∞, A) := the subgroup of H¹(Q_∞, A) of classes that are unramified at every finite place of Q_∞ not above p or Σ and whose restriction to the decomposition group at the unique place above p maps to zero in `H¹(Q_{∞,p},` A^−); Sel(Q_∞, A) is the case Σ=∅. For a weight-two multiplicative datum replace the decomposition-group target at p by `H¹(I_{∞,p},A^−),` as in Skinner §2.3; this is the inertia-kernel version. Its Pontryagin dual X^Σ := Hom_cont(Sel^Σ(Q_∞, A), Q_p/Z_p) is a finitely generated Λ-module, with the scalar-dual Λ-action fixed under Conventions. The same construction over `Q(μ_{p^∞})` gives a Λ(G_∞)-module X^Σ(G_∞) whose η-components, for η ∈ Δ^∨, are obtained by the explicit discrete-coefficient twist A⊗η⁻¹ over Q_∞, with the local conditions twisted as well; a modular-form identification additionally uses the Hecke dual/twist dictionary.

The datum is either good ordinary or the explicitly specified weight-two multiplicative datum, with the corresponding local condition just stated.

Take Σ finite with p∉Σ and relax the conditions at its primes.

Finite generation over Λ is unconditional; torsion is a theorem under hypotheses (§0.3), never part of the definition.

The usable interface consists of the following named outputs.

- OrdinarySelmer.mem_iff: A class c∈H¹(Q_∞,A) lies in Sel^Σ iff it is unramified away from pΣ and loc_p(c) maps to zero in `H¹(Q_{∞,p},A^−)` in the good ordinary case, or in `H¹(I_{∞,p},A^−)` in the multiplicative case.
- OrdinarySelmer.dual: X^Σ = Hom_cont(Sel^Σ, Q_p/Z_p) with (λ·φ)(c)=φ(λc), the scalar-dual convention.
- OrdinarySelmer.dual_fg: X^Σ is a finitely generated Λ-module.
- OrdinarySelmer.relax: For Σ' ⊂ Σ there is an exact sequence 0 → `(⊕_{ℓ∈Σ∖Σ'}` `H¹(Q_{∞,ℓ},` A))^∨ → X^Σ → `X^{Σ'}` → 0 when X^Σ is torsion and T* has no nonzero G_Q-invariants. Require also Σ ∪ {p} to contain every prime where T ramifies, as in Skinner–Urban Proposition 3.2.18.
- OrdinarySelmer.changeLattice: A finite-index inclusion of lattices induces a map of Selmer groups whose kernel and cokernel are annihilated by a bounded power of ϖ; they need not be finite over an infinite tower. The duals become isomorphic over Λ[1/p]. Under residual irreducibility, compare homothetic lattices by the equivariant scalar isomorphism, giving equal integral characteristic ideals.
- OrdinarySelmer.extendCoefficients: X^Σ(D ⊗ O') ≅ X^Σ(D) ⊗_O O' as `Λ_{O'}-modules.`
- OrdinarySelmer.etaComponent: With e_η = |Δ|⁻¹Σ_δ η(δ)⁻¹δ, e_ηX(G_∞)=D_Λ(e_ηSel(G_∞)). By restriction/corestriction it identifies with the scalar dual of the Selmer module of A⊗η⁻¹ over Q_∞, including the twisted local conditions. No assertion that a p-ramified modular twist has good ordinary level is implicit.

Instantiate the Greenberg local condition SelmerIwasawaCohomology §§2.8–2.8a (Greenberg condition and ordinary filtration) at p with F^+ = T^+ and the unramified condition SelmerIwasawaCohomology §2.7 (unramified condition) away from pΣ, over the cyclotomic tower; the global group is SelmerIwasawaCohomology §2.9 (Galois Selmer groups) in its discrete form and the dual is SelmerIwasawaCohomology §2.10 (continuous Pontryagin dual and contragredient action).

Skinner–Urban define the condition at p as vanishing in `H¹(Q_{∞,p},` A^−) (§1.1, p.2). Since `Q_{∞,p}/Q_p` is totally ramified, the kernel of `H¹(Q_{∞,p},` A^-) → H¹(I, A^-) is A^-/(φ − 1)A^-, which is zero whenever the unramified Frobenius eigenvalue on A^−=(T/T^+)⊗_O L/O is not 1. This proves the good ordinary comparison. For split multiplicative reduction α=1, the kernel is A^−≅L/O and must be retained; Skinner’s main conjecture uses the inertia-kernel Selmer group, not his auxiliary strict group S (Skinner §2.3, pp.8–12).

Finite generation of X^Σ follows from that of H¹(Q_Σ'/Q_∞, A)^∨ over Λ (SelmerIwasawaCohomology §3.13 (finite generation, amplitude and Euler ranks)) by Nakayama over the compact local ring Λ (`PadicMeasuresIwasawaAlgebras` Layer 5).

The source for this target is [Christopher Skinner and Eric Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf), §1.1, pp.1–2; [Christopher Skinner and Eric Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Lemma 3.2.17 and Proposition 3.2.18, pp.26–27; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §1, p.1 and §2.5, p.15; [Ashay Burungale, Francesc Castella and Christopher Skinner](https://arxiv.org/abs/2405.00270v2), §1.1, p.1.

*Needs:* SelmerIwasawaCohomology §§2.8–2.8a (Greenberg condition and ordinary filtration); SelmerIwasawaCohomology §2.7 (unramified condition); SelmerIwasawaCohomology §2.9 (Galois Selmer groups); SelmerIwasawaCohomology §2.10 (continuous Pontryagin dual and contragredient action); SelmerIwasawaCohomology §3.13 (finite generation, amplitude and Euler ranks); §0.1; `PadicMeasuresIwasawaAlgebras` Layer 5.

**Checks.**

- At split multiplicative reduction α=1, A^−/(φ−1)A^−=A^−≅L/O, whereas for α≠1 multiplication by φ−1 on the divisible module A^− is surjective and this quotient is zero. Thus these local conditions cannot be identified in the split case.
- If the unramified Frobenius eigenvalue on T/T^+ is not 1 (e.g. E = 11a1 at p = 7, eigenvalue the unit root α ≡ −2 mod 7), the strict and inertial conditions at p define the same Selmer group.
- At ℓ ≠ p the unramified and strict conditions over Q_∞ agree, because `Gal(Q_ℓᵘʳ/Q_{∞,w})` has profinite order prime to p; a definition imposing the Bloch–Kato finite condition gives the same group.
- For E = 11a1, p = 7, the Γ-coinvariants of the dual relate to `Sel_{7^∞}(E/Q)` with finite kernel and cokernel (Mazur control), and `Sel_{7^∞}(E/Q)` is finite since E(Q) and Sha(E/Q)[7^∞] are finite.
- The definition does not assert that X is Λ-torsion: torsion is the theorem of Kato (17.4(1)); a construction that builds torsion into the definition would make §0.3 vacuous.
- For E = 11a1 and p = 7, Sel(Q_∞, A) is the p^∞-Selmer group `Sel_{7^∞}(E/Q_∞)` of Mazur, and X its dual (Burungale–Castella–Skinner §1.1, p.1).
- Relaxing Σ: X^Σ surjects onto X with kernel the dual of `⊕_{ℓ∈Σ}` `H¹(Q_{∞,ℓ},` A) (Skinner–Urban Proposition 3.2.18, p.27) when X is torsion and T* has no G_Q-fixed vectors. Here Σ ∪ {p} contains the ramification set.

### 0.3 Structure of the ordinary Selmer dual

Let D be an ordinary modular Iwasawa datum with trivial character. (1) X^Σ is finitely generated over Λ. (2) If p ∤ N, then X is Λ-torsion (Kato 17.4(1)); for f = f_E with E/Q non-CM and good ordinary or multiplicative at p, Z_∞ = Sel(E/Q_∞)^∨ is torsion. (3) If X^Σ is torsion, ρ̄ is irreducible, and Greenberg's local hypotheses hold (for the quoted Rubin elliptic case: E non-CM and good ordinary at p and p ∤ `∏_{q|N}` #E(Q_q)_tors), then X^Σ has no nonzero finite Λ-submodule. (4) Under (3), char_Λ(X^Σ) = Fitt_Λ(X^Σ) is principal, and char_Λ(X^Σ) does not depend on the lattice T_f.

Assume the datum is ordinary with trivial character.

The non-elliptic torsion assertion in (2) requires p∤N.

The assertion in (3) needs X^Σ torsion and the local hypotheses of Greenberg's theorem; for Σ-imprimitive X^Σ Skinner–Urban Lemma 3.2.17(i) gives the absence of pseudo-null submodules of the local terms.

The Fitting comparison in (4) is over Λ ≅ O[[X]] for modules with no nonzero finite submodule and projective dimension one.

Assertion (1) is §0.2’s finiteness.

Assertion (2) is Kato Theorem 17.4(1), supplied in the good ordinary case by PadicFamilies §4.0.3, and for elliptic curves KatoEulerSystems §7.4 (Rubin III.5.14–5.16).

Assertion (3) is Greenberg’s theorem in the form SelmerIwasawaCohomology §§3.18–3.20 (structure hypotheses and absence of pseudo-null submodules), and for elliptic curves Rubin Corollary 5.17 (KatoEulerSystems §7.6).

Assertion (4) is SelmerIwasawaCohomology §3.21 (Fitting/characteristic under the structure criterion); lattice independence follows because irreducible ρ̄ forces homothetic lattices (Skinner–Urban §1.1, p.2).

The source for this target is [Kazuya Kato](https://www.numdam.org/item/AST_2004__295__117_0.pdf), Theorem 17.4(1), p.273; [Karl Rubin](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter III, Theorem 5.16 and Corollary 5.17, p.53; [Christopher Skinner and Eric Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Lemma 3.2.17(i), p.26; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §1, p.3.

*Needs:* §0.2; PadicFamilies §4.0.3 (torsion in the good ordinary case); KatoEulerSystems §§7.4 and 7.6 (elliptic torsion and no finite submodule); SelmerIwasawaCohomology §§3.18–3.20 (structure hypotheses and absence of pseudo-null submodules); SelmerIwasawaCohomology §3.21 (Fitting/characteristic under the structure criterion).

**Checks.**

- For E = 11a1, p = 7: E has good ordinary reduction at 7, and E(Q_11) ≅ Q_11^×/q^Z for a Tate parameter q of 11-adic valuation 5, whose torsion subgroup has order dividing (11 − 1)·5 = 50, hence prime to 7; so Z_∞ has no nonzero finite submodule.
- Skinner's proof of Theorem A uses exactly (3)–(4): Ch^Σ(f_m) = F^Σ(f_m) for each member f_m of the Hida family (Skinner §1, p.3).

### 0.4 The ordinary p-adic L-function with canonical periods

For an ordinary datum with trivial character and p ∤ N, let α be the unit root of X² − a_p X + pᵏ⁻¹. Let P_f^± be the differential periods of the saturated full-symbol lattice and Ω_f^±=P_f^±/(−2πi). Fix compatible complex and p-adic embeddings of the coefficient and character fields and of the conductor roots of unity. For φ:Γ→Ō^× of finite order with φ(γ)=ζ, define χ_φ on Z_p^× by χ_φ(ω(x))=1 and χ_φ(1+p)=ζ⁻¹. Thus φ(⟨x⟩)=χ_φ⁻¹(x). For a tame character η and 0≤m≤k−2 put θ=η·χ_φ⁻¹·ω⁻ᵐ and ψ=θ⁻¹=η⁻¹·χ_φ·ωᵐ. Let p^n be their common primitive conductor, with n=0 for θ=ψ=1. The direct pushforward along x↦⟨x⟩, after weighting by η∘ω, satisfies

```text
(φκ^m)(L_{f,η}) = e(η,φ,m) p^{n(m+1)} m! L(f,ψ,m+1)
                   / ((−2πi)^m G(ψ) P_f^{η(−1)}),
e(η,φ,m) = α^(−n)                                  if n>0,
e(η,φ,m) = (1−p^m/α)(1−p^(k−2−m)/α)                if n=0.
```

Here `G(ψ)=Σ_{a mod p^n}ψ(a)exp(2πia/p^n)` for primitive ψ and G(1)=1 at conductor 1. Equivalently, the denominator is `(−2πi)ᵐ⁺¹G(ψ)Ω_f^{η(−1)}`. The period sign is fixed on a tame branch: θ(−1)(−1)^m=η(−1). In particular `L_f=L_{f,1}` uses P_f^+ for every m. For weight-two multiplicative reduction replace α by a_p=±1; the n>0 factor is again α^(−n) and the n=0 factor is the single 1−α⁻¹. The unit root, differential periods and primitive Gauss sums are nonzero. At n=0 and m=0 good ordinary reduction gives (1−α⁻¹)(1−p^(k−2)/α), the square (1−α⁻¹)² in weight two. A root-of-unity indexing parameter is not the primitive conductor exponent n.

The measure normalization is fixed from ModularSymbolsPadicLFunctions §2.5 as follows. In that section's Pollack–Stevens basis convention its signed period is Ω_PS^s=−P_f^s/2; multiply its sign-s measure by −s/2, for s∈{+1,−1}. This is an O-unit adjustment at odd p. Its interpolation prefactor then becomes `s·α^(−n)p^{nm}G(θ)m!/( (2πi)^m P_f^s)`. For n>0 the identity G(θ)G(θ⁻¹)=θ(−1)p^n and s=θ(−1)(−1)^m give exactly the displayed formula; for n=0, θ=1 and s=(−1)^m give the same formula with G(1)=1 and the two unramified Euler factors. This specifies the sign and unhalved-symbol adapter, rather than identifying the supplier's period symbol with P_f. In weight two this is the inverse-character convention of the Néron-normalized measure in §3.2 (Colmez Theorem 0.8 and Remark 0.10, p.255). Skinner §2.4, equation (2.4.1), p.14 is used after matching its analytic character coordinate; its printed χ_φ labels are not the character dictionary for this direct pushforward.

For Σ not containing p put `L_f^Σ=L_f·∏_{ℓ∈Σ}P_{T,ℓ}(ℓ⁻¹γ_ℓ⁻¹)`, with `P_{T,ℓ}(Y)=det(1−Y·Frob_ℓ | V_{I_ℓ})`, V=T[1/p], arithmetic Frob_ℓ and its image γ_ℓ in Γ. On the η-branch the deletion operator instead contributes `P_{T,ℓ}(ℓ⁻¹η(ω(ℓ))⁻¹γ_ℓ⁻¹)`. Evaluation at φκ^m gives the ℓ-factor of the complex twist ψ at s=m+1, because ψ(ℓ)=η(ω(ℓ))⁻¹φ(γ_ℓ)⁻¹ω(ℓ)^m. These are the factors of ModularSymbolsPadicLFunctions §4.3, with the weight there equal to k−2. The scalar between the full-symbol and source Betti normalizations is retained in §0.9; after the character dictionary and π_1, comparison with Kato's good-pair function retains u_p(f).

Assume good ordinarity, p∤N and trivial character.

Use the canonical periods supplied by ModularSymbolsPadicLFunctions §1.1 (integral period lines); a different choice changes L_f by an element of O^×.

Let `μ_{f,α}` be the full measure with the sign normalization just specified. Define `L_{f,η}` by direct pushforward after weighting by η∘ω. Pullback of φκ^m is χ_φ⁻¹ω⁻ᵐx^m, so the weighted integrand is θ(x)x^m and the complex twist is ψ=η⁻¹χ_φωᵐ. This proves that the Teichmüller factor belongs to the integrand with exponent −m and to the complex twist with exponent +m. The period remains `P_f^{η(−1)}`.

The coefficient lattice is the one compatible with the specified canonical normalization. If a supplier measure uses a different lattice, carry its scalar rather than infer it is an O-unit.

The usable interface consists of the following named outputs.

- ordinaryPadicL: L_f ∈ Λ = O[[Γ]] for an ordinary datum with chosen canonical periods.
- ordinaryPadicL_interpolation: The displayed interpolation formula on every η-branch at φκ^m, 0 ≤ m ≤ k−2, with θ, ψ, primitive conductor and sign normalization as specified above, derived from ModularSymbolsPadicLFunctions §§1.2, 2.5. Use exponent m+1 for Skinner–Urban’s cohomological Ω_f, or exponent m after replacing it by P_f=−2πiΩ_f.
- ordinaryPadicL_unique: An element of Λ satisfying the interpolation formula at infinitely many distinct finite-order characters equals L_f.
- ordinaryPadicL_period_unit: Replacing P_f^± by u^±P_f^± with independent units u^± replaces `L_{f,η}` by `(u^{η(−1)})⁻¹L_{f,η}.` In particular L_f changes only with P_f^+ and its principal ideal is unchanged; P_f^− has no effect on this branch.
- ordinaryPadicL_depleted: L_f^Σ = L_f `∏_{ℓ∈Σ}` `P_{T,ℓ}(ℓ⁻¹γ_ℓ⁻¹),` and L_f^Σ ≠ 0 iff L_f ≠ 0 (each Euler factor is a nonzero element of Λ).
- ordinaryPadicL_extendCoefficients: For O ⊂ O', L_f computed over O' is the image of L_f under Λ → `Λ_{O'}.`
- ordinaryPadicL_ne_zero: L_f ≠ 0, because infinitely many of its interpolated values are nonzero by the nonvanishing of twisted critical values of KatoEulerSystems §4.2 (Jacquet–Shalika for k ≥ 3, Rohrlich's finiteness of vanishing twists for k = 2). The value s=1 is central only in weight two.

Take the ordinary integral measure on Z_p^× of ModularSymbolsPadicLFunctions §2.5 with the period lattices of its §1.1 and apply the sign-s scalar −s/2 specified above. Translate its period symbol through Ω_PS^s=−P_f^s/2 and Ω_f^s=P_f^s/(−2πi) before writing the interpolation formula.

Push it to Γ through Z_p^× → 1 + pZ_p ≅ Γ, weighting by η∘ω for `L_{f,η};` interpolation and uniqueness are ModularSymbolsPadicLFunctions §2.5 (interpolation and uniqueness).

The Σ-depleted function is the primitive/imprimitive comparison ModularSymbolsPadicLFunctions §4.3 (Euler depletion with the specified coefficient embedding).

The source for this target is [Kazuya Kato](https://www.numdam.org/item/AST_2004__295__117_0.pdf), Theorem 16.2(i)–(ii), p.269 (primitive-conductor interpolation factors); [Christopher Skinner and Eric Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf), §1.1, pp.1–2; [Christopher Skinner and Eric Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Conjecture 3.5.5, p.41, with the Σ-imprimitive L_f^Σ of §3.4; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §1, p.1; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §2.4, pp.13–15; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §2.4, equation (2.4.1) and footnote 6, p.14.

*Needs:* ModularSymbolsPadicLFunctions §§1.1–1.2, 2.5, 4.3 (integral periods, character parity, ordinary interpolation and Euler depletion); KatoEulerSystems §4.2 (nonvanishing of twisted critical values); §0.1.

**Checks.**

- In weight two only Ω_f^+ enters the interpolation formula (m = 0); replacing Ω_f^+ by uΩ_f^+ with u ∈ O^× replaces L_f by u⁻¹L_f and keeps the ideal, while replacing it by ϖΩ_f^+ replaces the ideal (L_f) by (ϖ⁻¹L_f), so the integral equality can hold for at most one of the two normalisations.
- For the measure δ₁−δ₋₁ on Z_3^×, the trivial tame pushforward has total mass 1−1=0, while the odd tame pushforward has total mass 1−(−1)=2. For δ₁ alone both masses are 1. This detects the weighting by η and the projection to Γ.
- For E = 11a1 and p = 7, the trivial-character value of the Néron-normalised function is (1 − α⁻¹)² L(E,1)/Ω_E^+ = (1 − α⁻¹)²/5 with α ≡ −2 mod 7, a nonzero element of Z_7.
- For k=6 and m=1 on η=1, the integrand character χ_φ⁻¹ω⁻¹ and complex twist χ_φω both have parity −1, and (−1)^1·(−1)=+1, so the denominator still uses Ω_f^+. For m=0 the parity product is 1·1=+1. Multiplying Ω_f^− by 2 leaves both values and all finite-order evaluations of L_f unchanged; multiplying Ω_f^+ by 2 halves all of them.
- For p=7, choose φ of order 7 with φ(γ)=ζ₇. At m=0 and η=1 the integrand has value ζ₇ on 8, χ_φ(8)=ζ₇⁻¹, and the complex twist is χ_φ, not χ_φ⁻¹. Its conductor is 49. With η=ω and m=1, θ=χ_φ⁻¹ and ψ=χ_φ, still of conductor 49; with φ=1 instead they are trivial and n=0. This detects tame cancellation as well as inversion.
- For E=11a1, p=7 and ℓ=2, a₂=−2 and r=φ(γ₂)≠1 of odd 7-power order, the deletion factor is A=1+r⁻¹+½r⁻² on both the group-ring and complex-twist sides. The opposite twist gives B=1+r+½r², and 2r²(A−B)=−(r−1)(r+1)³≠0. Here 2⁶=64≡15 mod 49, so γ₂ generates Γ. For r=1 both sides give 5/2 and cannot detect the inversion.
- Inflate the quadratic character modulo 7 to modulus 49: its modulus-49 Gauss sum is 0, while at its primitive conductor 7 the product with the inverse Gauss sum is −7. The denominator uses the primitive conductor, so the inflated zero is never divided by.
- The Gauss/sign adapter on a branch with θ(−1)=−1 and m=1 has s=+1: sG(θ)/(2πi)=−p^n/((2πi)G(θ⁻¹)), equal to p^n/((−2πi)G(θ⁻¹)). With θ=1,m=1, s=−1 and n=0 give −1/(2πi)=1/(−2πi). A sign adapter independent of s fails one of these cases.
- For Σ = ∅, L_f^Σ = L_f.
- L_f is integral (in Λ), not merely in Λ[1/p]: using Shimura's transcendental periods without saturating the period lattice gives a function in Λ[1/p] whose ideal may differ from (L_f) by a power of ϖ.
- Replacing Ω_f by P_f=−2πiΩ_f changes the denominator (−2πi)ᵐ⁺¹Ω_f to (−2πi)^m P_f, not to (−2πi)ᵐ⁺¹P_f. In weight two the Néron comparison uses P_f.
- In weight two, changing Ω_f^+ by a unit u ∈ O^× multiplies L_f by u⁻¹ and leaves the ideal (L_f) unchanged; changing it by ϖ changes (L_f) by ϖ⁻¹, so the integral equality of §0.5 is sensitive to the period normalisation.
- For E = 11a1 and p = 7 at the trivial character: L(E,1)/Ω_E^+ = 1/5, so the value of the Néron-normalised function at the trivial character is (1 − α⁻¹)² · 1/5, a 7-adic unit times (1 − α⁻¹)² (Colmez Remark 0.10 with b = 1).

### 0.5 The Iwasawa–Greenberg main conjecture for an ordinary form

For an ordinary datum D with trivial character and p ∤ N, and a finite set Σ of primes not containing p, IMC^Σ(D) is the proposition: X^Σ is a torsion Λ-module and char_Λ(X^Σ) = (L_f^Σ) as ideals of Λ. The rational form IMC^Σ_Q(D) asserts the same equality in Λ[1/p] = Λ `⊗_{Z_p}` Q_p. For f = f_E it is Mazur's main conjecture in the normalisation of §3.3. The proposition is a statement, not an axiom: conditional consequences explicitly list it as an assumption (in particular Schneider’s leading-term implication).

Assume a good ordinary datum with trivial character and p∤N.

Fix the canonical periods of §0.4.

The characteristic ideal is that of `PadicMeasuresIwasawaAlgebras` Layer 4 (charIdeal over the UFD Λ ≅ O[[X]]).

The usable interface consists of the following named outputs.

- IMC: IMC^Σ(D) : Prop, the integral equality char_Λ(X^Σ) = (L_f^Σ) with X^Σ torsion.
- IMC_rational: IMC^Σ_Q(D) : Prop, the same equality in Λ[1/p].
- IMC.toRational: IMC^Σ(D) → IMC^Σ_Q(D).

- IMC.iff_divisibilities: For X^Σ finitely generated torsion and L_f^Σ integral and nonzero, IMC^Σ(D) ↔ (L_f^Σ) ⊂ char(X^Σ) ∧ char(X^Σ) ⊂ (L_f^Σ). Without the torsion hypothesis the right side is not a replacement for the definition.
- IMC.greenberg_instance: IMC(D), the integral equality, is the trivial tame-component projection of the integral Greenberg proposition of SelmerIwasawaCohomology §4.21 (Greenberg proposition) for V = V_f ⊗ det⁻¹, descended from Q(μ_(p^∞))^+ to Q_∞, with analytic datum projecting to ι_Γ(L_f): that proposition uses the contragredient dual of SelmerIwasawaCohomology §2.10, and on the trivial component its characteristic ideal is ι_Γ of the scalar one (Conventions). IMC_Q(D) is the rationalization of this instance (IMC.toRational); it is not a case of the integral proposition.

Form X^Σ (§0.2) and L_f^Σ (§0.4).

Use the characteristic ideal of `PadicMeasuresIwasawaAlgebras` Layer 4 §4.6; the rational form compares ideals after extension of scalars to Λ[1/p].

The integral statement is meaningful only after the period normalisation is fixed; Skinner–Urban §1.1 (p.2) note the characteristic ideal depends on T_f only through its ϖ-adic valuation, and not at all when ρ̄ is irreducible.

The source for this target is [Christopher Skinner and Eric Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf), §1.1, pp.1–2 and Conjecture 3.5.5, p.41; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), Conjecture 2.5.1, p.15; [Joaquín Rodrigues Jacinto and Chris Williams](https://arxiv.org/abs/2309.15692v2), §13.5.3, Conjecture 13.21, p.71; Appendix B.2.3, Theorem B.4, p.80.

*Needs:* §0.2; §0.4; `PadicMeasuresIwasawaAlgebras` Layer 4; SelmerIwasawaCohomology §4.21 (Greenberg proposition) and §2.10 (contragredient duals).

**Checks.**

- IMC(D) implies IMC_Q(D). Algebraically (ϖ) and (1) become equal in Λ[1/p] but differ in Λ, so a definition identifying the rational and integral forms fails this test.
- Replacing the canonical period of a weight-two form by ϖ times it turns a true integral equality into a false one, while the rational statement IMC_Q is unchanged: the proposition must carry the period normalisation.
- For Σ = ∅, IMC^Σ is the primitive statement char(X) = (L_f).
- For V = V_f ⊗ det⁻¹, r_V = 0, and the trivial-component projection of SelmerIwasawaCohomology §4.21 (Greenberg proposition) with projected datum ι_Γ(L_f) is IMC(D); its rationalization is IMC_Q(D).
- Over Λ=Z_p[[X]] take the torsion module M=Λ/(p) and analytic element 1. After inverting p both ideals are the unit ideal, while char_Λ(M)=(p)≠(1): the integral Greenberg proposition and IMC fail on this datum and their rational forms hold. A tame idempotent of order (p−1)/2, a p-adic unit, leaves the prime (p) in place, so projection does not turn the integral proposition into IMC_Q.
- With L_f=X−7 over Z_7[[X]], the contragredient datum ι_Γ(X−7) generates (X+7/8) (§0.12); giving Greenberg's proposition the datum X−7 itself would assert a different ideal. The example L_f=X does not detect this, since ι_Γ(X)=−X/(1+X) generates (X).
- Under the localization hypotheses of the imprimitive-set comparison in §1.2, including H⁰(G_ℚ,T*)=0 and torsion for a common larger imprimitive dual containing the ramification set, IMC^Σ(D) is equivalent to `IMC^{Σ'}(D).`
- IMC(D) implies IMC_Q(D); the converse holds when μ(X) = μ(L_f) (§5.3).

### 0.6 Iwasawa cohomology, the zeta element and the fundamental line

For a modular Iwasawa datum with the lattice T_K in Kato's normalisation (the dictionary of KatoEulerSystems §2.2), put H^i(T_K) := lim_n `H^i_et(Z[ζ_{p^n},` 1/p], j_*T_K) for i = 1, 2, Λ(G_∞)-modules, and RΓ_Iw(T_K) the corresponding perfect complex of Λ(G_∞)-modules with j_* conditions (extension by zero is not used; ramified primes keep the j_* condition). The Iwasawa fundamental line is the invertible Λ(G_∞)-module Δ_Iw(T_K) := `Det⁻¹_{Λ(G_∞)}` RΓ_Iw(T_K) ⊗ `Det⁻¹_{Λ(G_∞)}` (T_K ⊗ Λ(G_∞))(−1)^+, and Kato's zeta element z_f ∈ H¹(T_K) ⊗ Q (KatoEulerSystems §§5.1–5.2, the rational zeta morphism and the Λ-module Z(f, T_K) generated by Kato's zeta elements) defines, through the rational zeta morphism T_K(−1)^+ → H¹⊗Frac, with integral containment imposed separately, a trivialisation triv_z : Δ_Iw(T_K) ⊗ Frac → Q(Λ(G_∞)). The same construction over Q_∞ (Λ in place of Λ(G_∞)) gives Δ_Iw over Λ = O[[Γ]], the form used by Fouquet–Wan. Here Q(Λ(G_∞)) denotes the total quotient ring, a product of fraction fields of the η-components, not a field. The primitive j_* complex is used only with its perfectness and local comparison hypotheses. For general family coefficients use Fouquet–Wan Definition 3.18’s modified local factors, not an unconditional j_* complex.

For every prime p, H²(T_K) is Λ(G_∞)-torsion and H¹(T_K) is torsion-free with H¹(T_K) ⊗ Q free of rank one over Λ(G_∞) ⊗ Q (Kato Theorem 12.4(1)–(2), p.221); H¹(T_K) is itself free of rank one when p ≠ 2 and T_K/ϖT_K is irreducible (Theorem 12.4(3)). The fundamental line, its trivialisation and its divisor are formed for odd p; at p = 2 Kato's conjecture is stated through lengths (§0.7).

H¹(T_K) torsion-free of Λ-rank one and H²(T_K) torsion (Kato Theorem 12.4) are theorems, used to identify the determinant with an invertible fractional ideal.

The {p}-partial complex over Z[1/p] is the one in Kato's Conjecture 12.10; the Σ-partial complex over Z[1/Σ] is used in families and changes Δ by Euler factors.

The j_* / continuous comparison is only the supported comparison in the indicated degrees; do not infer a complex equivalence from the H¹ edge sequence alone.

The usable interface consists of the following named outputs.

- iwasawaH1: H¹(T_K) = lim_n `H¹_et(Z[ζ_{p^n},1/p],` j_*T_K) as a Λ(G_∞)-module.
- iwasawaH2: H²(T_K), a torsion Λ(G_∞)-module.
- fundamentalLine: Δ_Iw(T_K), an invertible Λ(G_∞)-module.
- fundamentalLine.triv: triv_z : Δ_Iw(T_K) → Q(Λ(G_∞)) induced by the zeta morphism.
- fundamentalLine.changeLattice: A finite-index inclusion T'_K ⊂ T_K induces Δ_Iw(T'_K) ≅ Δ_Iw(T_K) compatible with triv_z.
- fundamentalLine.baseChange: Use the determinant base-change isomorphism of PadicMeasuresIwasawaAlgebras §5.1 to compare the arithmetic complexes and zeta maps: Σ-partial objects commute with the stated derived base changes; the primitive modified line requires relative purity and Iwasawa suitability (Fouquet–Wan Proposition 3.20, pp.31–32; Propositions 3.22–3.23, p.33).
- fundamentalLine.divisor: for a nonzero rational zeta element z, choose nonzero d in the component ring with dz∈H¹. At a height-one prime 𝔭 the coefficient of div(triv_z(Δ_Iw)) is length H²_𝔭 − length(H¹/Λdz)_𝔭 + ord_𝔭(d), independently of d. When Λz⊆H¹ take d=1 and obtain length H²_𝔭 − length(H¹/Λz)_𝔭. Work componentwise for odd p, with torsion-free rank-one H¹ and torsion H² as above (determinant convention; Kato §12.10, pp.223–224).
- fundamentalLine.sigmaPartial: Retain both the local determinant factors and the zeta factors. For primitive versus Σ-partial zeta maps, Proposition 3.28, p.35 gives z_primitive = `(∏_{ℓ∈Σ∖{p}}` Eul_ℓ(V^*(1)))⁻¹ z_Σ in the total fraction algebra. These factors need not be units; integral comparison uses their compatible local lines.

Iwasawa cohomology and its finiteness are SelmerIwasawaCohomology §3.1 (Iwasawa cohomology) and SelmerIwasawaCohomology §3.13 (finite generation, amplitude and Euler ranks); the étale/continuous comparison is SelmerIwasawaCohomology §3.15 (étale/Galois and j_* comparison).

The determinant functor and the height-one divisor of an acyclic-after-Frac perfect complex are `PadicMeasuresIwasawaAlgebras` Layer 5 §5.1 and SelmerIwasawaCohomology §3.14 (determinant and height-one divisor).

The classical zeta morphism is Kato's (KatoEulerSystems §5.1); Fouquet–Wan Definition 3.3 and Theorem 3.4 record it as the {p}-partial zeta morphism z(f)_Iw. The morphism over the universal deformation ring is Nakamura's, supplied by AutomorphicCongruences §§3.7–3.9 together with its specialisation square (AutomorphicCongruences §3.8); it is used only in Layer 4.

The source for this target is [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), §1.1.1, pp.3–5; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Definition 3.3, p.23, and Theorem 3.4, p.24; [Kazuya Kato](https://www.numdam.org/item/AST_2004__295__117_0.pdf), §12.10, pp.223–224.

*Needs:* SelmerIwasawaCohomology §3.1 (Iwasawa cohomology); SelmerIwasawaCohomology §3.13 (finite generation, amplitude and Euler ranks); SelmerIwasawaCohomology §3.15 (étale/Galois and j_* comparison); SelmerIwasawaCohomology §3.14 (determinant and height-one divisor); `PadicMeasuresIwasawaAlgebras` Layer 5; KatoEulerSystems §§2.2, 5.1–5.2 (dictionary, zeta morphism and integral span); §0.1.

**Checks.**

- If H¹ = Λ·z' with z = (γ − 1)z' and H² ≅ Λ/(γ − 1), the divisor of triv_z(Δ_Iw) is zero, i.e. triv_z is an isomorphism.
- If z generates H¹ and H² = 0, then triv_z(Δ_Iw) = Λ.
- If z=e generates H¹=Λe and H²=Λ/(X²), the fractional ideal triv_z(Δ_Iw) is (X²), of divisor +2[X]. If H²=0 and z=X²e, it is X⁻²Λ, of divisor −2[X]. These unequal-length cases fix the inverse determinant, including its overall sign.
- With Det in place of Det⁻¹ the divisor changes sign: a definition using Det would make Kato's divisibility read in the wrong direction.
- When Λz⊆H¹, for cohomology in degrees one and two the divisor equals char H² / char(H¹/Λz) as in SelmerIwasawaCohomology §3.14 (determinant and height-one divisor).
- When H¹(T_K) is free of rank one, Λz⊆H¹ and H²(T_K) is torsion, the divisor of triv_z(Δ_Iw) is char(H²) − char(H¹/Λz) (SelmerIwasawaCohomology §3.14 (determinant and height-one divisor) with the inverse-determinant sign convention).
- For H¹=Λe, H²=0 and z=ϖ⁻¹e, the integral quotient H¹/Λz does not exist. Clearing by d=ϖ gives 0−0+1=1; clearing by d=ϖ² gives 0−1+2=1. Multiplying any clearing denominator by a adds ord_𝔭(a) both to the quotient length and the correction, proving independence by a common multiple.
- Replacing T_K by an isogenous lattice changes neither Δ_Iw ⊗ Frac nor triv_z (Fouquet–Wan p.5: the fundamental line is independent of the lattice up to canonical isomorphism).

### 0.7 Kato's main conjecture for modular forms

For a modular Iwasawa datum with lattice T_K in Kato's normalisation and a character η of Δ, KMC^η(T_K) is the proposition: the η-component of the zeta module Z(f, T_K) lies in H¹(T_K)^η and `char_{Λ}(H¹(T_K)^η` / Z(f, T_K)^η) = `char_{Λ}(H²(T_K)^η).` KMC(T_K) is the conjunction over η, equivalently (when H¹ is free of rank one) the assertion that the zeta morphism trivialises Δ_Iw(T_K): triv_z(Δ_Iw(T_K)) = Λ(G_∞). The rational form KMC_Q compares the ideals in Λ[1/p]. Over Q_∞ (η = 1 and Λ = O[[Γ]]) this is Fouquet–Wan's Conjecture 1.5 for M(f). The same proposition is defined for each Tate twist T_K(r), r∈ℤ, with zeta module Z(f,T_K(r)):=φ_r(Z(f,T_K)), the twist by roots of unity used in Kato Theorem 12.5(1), p.221 (Conventions).

For odd p the proposition is as stated. For p = 2 the η-components are not defined over Λ(G_∞) (Conventions), and KMC(T_K) is Kato's statement: Z(f, T_K)_𝔭 ⊂ H¹(T_K)_𝔭 and length H²(T_K)_𝔭 = length(H¹(T_K)_𝔭/Z(f, T_K)_𝔭) at every height-one prime 𝔭 of Λ(G_∞) not containing 2, with nothing asserted at the height-one primes containing 2 (Kato Conjecture 12.10, p.224). Equivalently, on each of the two components the characteristic ideals of H² and H¹/Z agree after 2 is inverted, so at p = 2 the propositions KMC and KMC_Q coincide.

The definition permits arbitrary nebentypus and does not need ε=1.

No reduction type at p is assumed: the proposition makes sense for supercuspidal π(f)_p.

The usable interface consists of the following named outputs.

- KMC: for odd p, KMC^η(T_K) : Prop for η ∈ Δ^∨ and KMC(T_K) := ∀ η, KMC^η(T_K); for p = 2, KMC(T_K) is Kato's length equality at the height-one primes of Λ(G_∞) not containing 2.
- KMC_rational: The equality of ideals in Λ[1/p].
- KMC.iff_triv: For odd p, when H¹(T_K) is free of rank one: KMC(T_K) ↔ triv_z(Δ_Iw(T_K)) = Λ(G_∞).
- KMC.iff_reverse_divisibility: Under Kato's (12.5.2), KMC^η ↔ char(H²)^η ⊂ char(H¹/Z)^η.
- KMC.changeLattice: KMC_Q is independent of the lattice; KMC is independent of the lattice when ρ̄ is irreducible.
- KMC.twist: For odd p, r∈ℤ and η∈Δ^∨, the twist φ_r carries H¹, H² and the zeta module on the ηω^(−r)-component of T_K onto those on the η-component of T_K(r). For each of these modules M, the characteristic ideal of the η-component of M(r) is Tw_r applied to that of the ηω^(−r)-component of M (SelmerIwasawaCohomology §3.7; PadicMeasuresIwasawaAlgebras §4.6, transport of characteristic ideals along semilinear equivalences). Hence KMC^η(T_K(r)) ⟺ `KMC^{ηω^{−r}}(T_K)`, and each one-sided divisibility is transported in the same way. For r≢0 mod p−1, KMC^1(T_K(r)) and KMC^1(T_K) concern different tame components.

State the equality using the Λ-modules of §0.6 and the characteristic ideal of `PadicMeasuresIwasawaAlgebras` Layer 4 on η-components (the isotypic decomposition of `PadicMeasuresIwasawaAlgebras` Layer 4 §4.6).

The equivalence with the fundamental-line form is §0.8.

The source for this target is [Kazuya Kato](https://www.numdam.org/item/AST_2004__295__117_0.pdf), Conjecture 12.10, pp.223–224; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Conjecture 1.5, p.6, and Conjecture 3.24, p.34; [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), Conjecture 6.2 and Remark 6.3, p.43.

*Needs:* §0.6; `PadicMeasuresIwasawaAlgebras` Layer 4 (including the semilinear transport of §4.6); KatoEulerSystems §§5.1–5.2 (zeta morphism and integral span); SelmerIwasawaCohomology §3.7 (twisting Iwasawa cohomology) for KMC.twist.

**Checks.**

- If H¹ = Λz' and Z = Λ(γ−1)z', then KMC holds iff char H² = (γ − 1).
- KMC.twist at p=5, k=2, r=1: the trivial component of T_K(1)=T_pE is the ω^(−1)-component of T_K=T_pE^∨, and ω^(−1)(−1)=−1, so it is not the trivial component of T_K. With κ(γ)=6, a component Λ/(X) of T_K becomes Λ/(γ−6)=Λ/(X−5) on T_K(1); (X) and (X−5) are different height-one primes.
- KMC.twist at p=3, r=2: ω^(−2) is trivial on Δ={±1}, so the tame label does not move, but with κ(γ)=4 the ideal (X) becomes (X+1−16)=(X−15). Matching labels alone does not identify the twisted and untwisted statements; at r=0 the transport is the identity.
- KMC(T_K) → KMC_Q(T_K), and the converse fails in general: the rational form says nothing about μ.
- KMC predicts nothing about the specialisation of z at the finitely many characters where the L-value vanishes (Fouquet–Wan footnote 1, p.6); it is not Fouquet–Wan's Conjecture 1.3.
- If H² = 0 and Z = H¹, KMC holds with both characteristic ideals equal to Λ.
- Kato Theorem 12.5 gives the inclusion char(H¹/Z) ⊂ char(H²) under (12.5.2) (KatoEulerSystems §7.2), so KMC is the reverse divisibility.
- LLZ Remark 6.3: the η-component formulation is Kobayashi's §5 form of Kato's Conjecture 12.10.
- At p = 2 the proposition says nothing at the height-one primes containing 2, such as (ϖ): Kato's (17.13.1) and the integral divisibility are available only for p ≠ 2 (Kato 12.5(4), 17.4(3)), and a version asserting the length equality at every height-one prime of Λ(G_∞) would claim more than Kato's conjecture.

### 0.8 Zeta basis versus characteristic ideals

Define `HasRankOneCoinvariants` for an O-linear endomorphism σ of T by an O-linear equivalence T/(σ−1)T≃O. Prove `hasRankOneCoinvariants_of_unipotent`: over any DVR O, if u on O² satisfies (u−1)²=0 and (u−1)O² is not contained in the maximal ideal times O², then it has free rank-one coinvariants. Elementary divisors give a primitive rank-one image; no completeness or mixed-characteristic assumption is used. For the arithmetic application, AutomorphicGaloisRepresentations §6.4 supplies genuinely unipotent inertia at the auxiliary Steinberg prime, not an arbitrary lift of a residual matrix (Skinner §2.5, pp.15–16).

Its basic API is:

- An O-linear equivalence intertwining two endomorphisms induces an equivalence of their coinvariants, so the property is invariant under change of basis.
- Over a DVR, the property implies that the quotient is torsion-free of rank one; rational rank one alone does not imply the property.
- For a finite coefficient extension O′/O of DVRs, tensoring the quotient equivalence gives free rank-one coinvariants over O′.

*Needs:* Mathlib quotient modules and linear equivalences; elementary divisors over a DVR for `hasRankOneCoinvariants_of_unipotent`.

**Checks.**

- For u=[[1,1],[0,1]], (u−1)(x,y)=(y,0), and quotient by its range is O via the second coordinate.
- For u=[[1,ϖ],[0,1]], the quotient is O/(ϖ)⊕O, and the image lies in the maximal ideal times O², so the primitive-image hypothesis fails.
- Over O=F₂[[t]], the upper-right-one unipotent has square-zero difference from the identity and quotient O; replacing one by t gives F₂⊕O. The lemma therefore distinguishes primitive image in equal characteristic two as well as over ℤ_p. For a nonzero ring, the zero module has quotient zero and does not satisfy the property; over the zero ring the defining equivalence is the unique equivalence 0≃0.
- For g=[[1,1],[ϖ,1+ϖ]], det(g−1)=−ϖ and the quotient is O/(ϖ), although g reduces to the standard unipotent. The square-zero hypothesis fails. The identity has quotient O² and fails the primitive-image hypothesis.


Let λ be an Iwasawa-suitable classical specialisation in the sense of Fouquet–Wan Definition 3.12 (in particular ρ̄ satisfies their Assumption 2.1 and there is ℓ ∥ N, ℓ ≠ p, with dim `ρ̄^{I_ℓ}` = 1). Then H¹(T_λ,Iw) is free of rank one over O_Iw, the integral cone C of z(λ)_Iw has cohomology H¹/z in degree one and H² in degree two, while C ⊗ Frac(O_Iw) is acyclic (V_λ,Iw in Lemma 3.13 already denotes fraction-field coefficients), and consequently: z(λ)_Iw is a basis of Δ_Iw(T_λ) iff char H²(T_λ,Iw) = char(H¹(T_λ,Iw)/O_Iw·z(λ)_Iw). Moreover Kato's divisibility char(H¹/z) ⊂ char(H²) holds integrally for such λ.

Use Fouquet–Wan Assumption 2.1 `(ρ̄|G_{Q(√p*)}` absolutely irreducible; no extension 0 → χ₁ → `ρ̄|G_{Q_p}` → χ₂ → 0 with χ₁⁻¹χ₂ ∈ {1, χ̄_cyc}) and Assumption 3.7.

Require λ to be Iwasawa-suitable in the direction of Fouquet–Wan Definition 3.12: λ has values in a domain A and contains an O-valued specialization ψ through a local ring map A→O, with T_ψ and T_ψ*(1) both relatively pure and z(ψ)_Iw nonzero. Relative purity of λ follows from Lemma 3.11; it does not replace purity of both representations at ψ. For an O-valued classical λ one may take ψ=λ when these conditions hold.

For the integral Euler-system bound, retain the genuine unipotent inertia lift supplied by the auxiliary Steinberg prime; residual unipotence alone is insufficient.

H¹ is torsion-free by vanishing of H⁰ of the reductions modulo regular sequences (Assumption 2.1), of depth two, hence free of rank one by Auslander–Buchsbaum–Serre (Fouquet–Wan Lemma 3.13).

At the auxiliary Steinberg prime choose an actual inertia element σ acting unipotently on the characteristic-zero lattice and nontrivially modulo ϖ; then T_λ/(σ − 1)T_λ is free of rank one. An arbitrary lift of a residual unipotent does not suffice; this verifies Kato's hypotheses in place of the SL₂(Z_p)-image condition, using the actual free rank-one quotient as part of the local input, giving the integral divisibility and torsion of H².

With cohomology in degrees one and two only, the determinant of the cone is computed by §0.6's divisor formula.

The source for this target is [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Lemma 3.13 and its proof, pp.26–27; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Definitions 3.8, 3.9, 3.12, Proposition 3.10, Lemma 3.11, pp.25–26; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Conjecture 1.5, p.6.

*Needs:* §0.6; AutomorphicGaloisRepresentations §6.4 (genuine Steinberg inertia); KatoEulerSystems §4.3 (Rubin's hypotheses from a free rank-one quotient); KatoEulerSystems (gap:modular-zeta-extensions) (the integral bound under that hypothesis); SelmerIwasawaCohomology §3.14 (determinant and height-one divisor).

**Checks.**

- For E = 14a1 at p = 13, ℓ = 2: ord_2 Δ = 6 is prime to 13, so ρ̄ is ramified at 2 with unipotent inertia image, dim `ρ̄^{I_2}` = 1, and the theorem applies.
- The equivalence fails to make sense without freeness of H¹: if H¹ had torsion, Λ·z would not determine the line.
- An O-valued classical λ with pure T_λ and T_λ*(1) and nonzero z(λ)_Iw passes the suitability test with ψ=λ and the identity local map.
- A domain-valued λ containing a pure point ψ but with z(ψ)_Iw=0 fails the test; generic purity alone cannot supply the nonzero zeta trivialization.
- The specialization must factor through A→O. A map O→A in the opposite direction, without the required contained point, is not a witness to Definition 3.12.

### 0.9 Kato's good pairs against canonical periods: the p-adic period defect

Let D be good ordinary, with trivial character, p ∤ N, p odd and (irred). Then f*=f. Let M_SU be Skinner–Urban's Betti eigenlattice H¹(Γ₁(N), Symᵏ⁻²(Z(f)_(p)))[λ_f], with signed bases γ_SU^± and Per(f)=Ω_SU^+γ_SU^++Ω_SU^−γ_SU^− (§3.3.3, p.28). Fix the rational Betti–étale comparison and let T_B be its corresponding stable O-lattice in Kato's cohomological realization. Use the literal coefficient duals in KatoEulerSystems §2.2; no integral symmetric-power pairing is inferred when (k−2)! is a nonunit. Write P_SU^±=−2πiΩ_SU^± in the differential convention of Conventions. The periods P_f^± of §0.4 belong to the full-symbol lattice; define the nonzero algebraic ratios c_f^±=P_f^±/P_SU^± through the rational period dictionary of KatoEulerSystems §6.3. Their principal fractional O-ideals are independent of the signed generators. Neither ratio is assumed to be a unit. The same interpolation comparison gives L_SU,f^Σ=c_f^+L_f^Σ up to a unit, with the same c_f^+ for every Σ. Apply this separately to f⊗χ_K when it occurs in §1.3. The rational lattice comparison is supplied by ModularSymbolsPadicLFunctions §§0.4, 0.6, 0.8, 1.1 and KatoEulerSystems §6.3; the former fixes the actual coefficient dual and boundary lattice, and does not give an all-weight integral identification. OrdinaryBettiSymbolUnit(f) is used only to remove c_f^+, independently of KatoPeriodDefectUnit, which concerns d_p(f)c_f^+.

First transport Kato's full-group analytic function to the modular-symbol character coordinate by KatoEulerSystems §§2.2, 6.3 (the fixed dual/Hecke/Tate twist and character change). The target is the scalar-dual coordinate of Conventions: Kato's function is the image of the zeta element in the natural compact coordinate (Kato Theorem 16.6, p.271), and the character change includes the Γ-inversion ι_Γ that §0.10 applies to the Poitou–Tate sequence. Denote the transported function by `K_{ω,γ}.` For η:Δ→O^× define π_η:Λ_L(G_∞)→Λ_L on this coordinate by δg ↦ η(δ)g, where Λ_L=Λ[1/ϖ] for δ∈Δ, g∈Γ; equivalently take e_η and identify e_ηΛ(G_∞) with Λ. Put `K_{ω,γ,η}=π_η(K_{ω,γ}).` It is compared with `L_{f,η}` of §0.4, and `K_{ω,γ,1}` is the branch consumed in §0.10. This projection is after the fixed character dictionary, not a claim about an unshifted Kato tame label.

(1) *Betti part.* For a,b^+,b^−∈L^×, replacing ω by aω and γ^± by b^±γ^± multiplies `K_{ω,γ,η}` by `a⁻¹b^{η(−1)}.` With the orientations of the rational period comparison fixed, `K_{f,γ_SU,η}=ε_η` `c_f^{η(−1)}L_{f,η},` where ε_η∈O^× is the fixed sign and unhalved-symbol factor. Retain that factor rather than identify two integral lattices.

(2) *De Rham part.* A differential ω_B is good for T_B when its image under S(f)⊗L≅D_dR(V'') is an O-basis of H⁰(Q_p, Ẑ_p^ur⊗T_B''(k−1)). Here V''=V/V' is the cohomological ordinary quotient, V' is unramified, and V''(k−1) is unramified (Kato Proposition 17.1, p.272); T_B'' is the image of T_B in V''. Write f=d_p(f)ω_B. The de Rham factor d_p(f)∈L^×/O^× is well defined. Define the component period defect `u_{p,η}(f)=d_p(f)c_f^{η(−1)}` in L^×/O^×, and `u_p(f)=u_{p,1}(f)=d_p(f)c_f^+.` This definition retains both the de Rham factor and the fractional Betti-to-symbol correction. A representative good differential exists by Kato §17.5; all representative choices change the displayed scalars by units.

(3) *Good pairs.* If (ω,γ) is good for any stable O-lattice U of the cohomological realization (not the Selmer lattice T of Conventions), then for each η there is an independent v_η∈O^× with `K_{ω,γ,η}=v_ηu_{p,η}(f)L_{f,η}.` Indeed (irred) gives U=cT_B. Write ω=cd_p(f)⁻¹fw and γ^±=cγ_SU^±w^±, with w,w^±∈O^×. Part (1) gives `v_η=ε_ηw⁻¹w^{η(−1)}.` The common c cancels, while the two signed units remain independent. There is no asserted coefficient scalar for the full function.

Require p>3 or N≥4 for the integral Betti–étale comparison on a scheme or a stack with stabilizer orders prime to p. The weight-two elliptic comparison is §3.2. The condition KatoPeriodDefectUnit means u_p(f)∈O^× on the trivial tame branch, not that d_p(f) or both signed corrections are units separately.

The usable interface consists of the following outputs.

- katoPadicZeta_scale: the component scaling `a⁻¹b^{η(−1)}` in (1); common scaling b^+=b^−=b gives a⁻¹b on the whole function.
- ordinaryBettiSymbol_comparison: on the trivial tame branch L_SU,f^Σ=c_f^+L_f^Σ up to O^×; the ratio is independent of Euler depletion.
- OrdinaryBettiSymbolUnit: c_f^+∈O^×, the exact condition for equality of the nonzero principal ideals (L_SU,f^Σ) and (L_f^Σ).
- katoPadicZeta_canonical: `K_{f,γ_SU,η}=ε_ηc_f^{η(−1)}L_{f,η}` after π_η, with its fractional correction retained.
- katoPeriodDefect: the classes `u_{p,η}(f)=d_p(f)c_f^{η(−1)}` and `u_p(f)=u_{p,1}(f).`
- katoPadicZeta_homothety: the pair (cω_B,cγ_SU) for cT_B gives the same full function as (ω_B,γ_SU).
- katoPadicZeta_goodPair: `K_{ω,γ,η}∈O^×u_{p,η}(f)L_{f,η};` the assertion used for L_f is η=1.
- KatoPeriodDefectUnit: u_p(f)∈O^×, the precise hypothesis of the integral canonical comparison.

The rational period dictionary compares the fixed interpolation factors, Gauss sums, factorials and differential periods. On π_η every critical exponent uses the same period sign η(−1), by §0.4. Changing a period basis gives exactly `c_f^{η(−1)};` an integral unit comparison cannot be deduced from the rational dictionary. Kato Theorem 16.2 and Remark 16.3 then give (1) by uniqueness. Kato §17.5 gives the rank-one good-differential lattice and its homothety law, proving (2); the calculation in (3) proves the good-pair comparison.

The sources are Kato, Theorem 16.2 and Remark 16.3, p.269, Proposition 17.1, p.272, and §17.5, pp.273–274; Skinner–Urban §3.3.3, p.28; and ModularSymbolsPadicLFunctions §§1.1–1.2 for the full-symbol lattice and its parity convention.

*Needs:* §0.4; KatoEulerSystems §§2.2, 6.2–6.3 (literal duals, scalar regulator and rational period dictionary); ModularSymbolsPadicLFunctions §§1.1–1.2; AutomorphicGaloisRepresentations §5.1 (`ordinaryRefinement`, saturated ordinary line); SelmerIwasawaCohomology §3.15 (étale/Galois and j_* comparison).

**Checks.**

- For a period coordinate P≠0, replacing ω by 2ω multiplies P by 2; replacing its Betti basis γ by 3γ divides P by 3. Together they replace P by 2P/3 and L/P by 3L/(2P), giving the component scaling 3/2.
- With b^+=1 and b^−=2, the even tame branch is unchanged and the odd branch doubles. On two nonzero branches with initial values (A,B), the values become (A,2B); one coefficient scalar would have to be both 1 and 2. Both are units at every odd p.
- Replacing both ω and γ by ϖω,ϖγ gives ϖ⁻¹ϖ=1. For T_B↦cT_B and γ_SU↦cγ_SU, d_p changes by c⁻¹ and c_f^± by c, so their product `u_{p,η}` is unchanged.
- With L_f=X and c_f^+=ϖ, L_SU,f=ϖX and the two ideals have lengths 0 and 1 at (ϖ). Multiplying both by an Euler factor 1−2X leaves that length difference 1. With c_f^+=2 at odd p the ideals agree.
- For L_f=L_(f⊗χ_K)=X, c_f^+=ϖ and c_(f⊗χ_K)^+=1, the source product is ϖX² rather than X²; one form’s unit comparison cannot remove the other form’s correction.
- A fractional correction c_f^+=ϖ and d_p=1 gives u_p=ϖ, not a unit; c_f^+=ϖ and d_p=ϖ⁻¹ instead gives u_p=1. A definition retaining only the de Rham factor fails these two tests. With both factors 1, u_p=1.
- At k=2,p=3 take inertia with κ(g)=4. The true quotient has inertia 4⁻¹ and V''(1) has inertia 1. Calling V'' itself unramified would give inertia 4 after the twist, whose fixed subspace over L is 0 since 4−1=3≠0, rather than the required rank-one lattice.

### 0.10 Kato's main conjecture versus the ordinary main conjecture

Let D be good ordinary with trivial character and p ∤ N, and let α be the unit root. For odd p, transport the good-pair function by the fixed character dictionary and apply π_1 of §0.9; write `K_{ω,γ,1}` for the result. The matched component is the trivial tame component of T_K(1), the compact Tate partner Hom_O(T,O(1))≅T_f(1) of A: H¹, H² and Z here are those of T_K(1), and KMC on the matched component is KMC^1(T_K(1)). Put C=(H¹/Z)(T_K(1)), H=H²(T_K(1)), Q=H¹_loc/H¹_loc' (local Iwasawa cohomology at p of T_K(1) modulo that of its ordinary sublattice), Z_loc⊂Q the image of Z, J=Q/Z_loc and H²_loc the local Iwasawa H² at p of T_K(1), all with their natural compact actions. Kato's map ξ of 16.4, formed with an O-basis of the rank-one lattice of Kato Proposition 17.11, induces an injective Λ-linear map Col: Q → Λ on the matched component with finite cokernel (Kato Proposition 17.11, p.277); this is the ordinary Coleman map. Define `k_{ω,γ,1}`=Col(z_loc)∈Λ, where z_loc∈Q is the image of the good-pair zeta element: the regulator is applied on Q, before any quotient by Z_loc and before any change of coordinate. Col induces an injection J → Λ/Col(Z_loc) with finite cokernel, and Col(Z_loc)Λ_𝔮=`k_{ω,γ,1}`Λ_𝔮 at every height-one prime 𝔮 (Kato p.280; at 𝔮=(ϖ) under the hypotheses below), so length(J_𝔮)=ord_𝔮(`k_{ω,γ,1}`); no global isomorphism J≅Λ/(`k_{ω,γ,1}`) is asserted. The local Tate pairing satisfies Φ(gc)(s)=⟨c,g⁻¹s⟩, so the Poitou–Tate map is Λ-linear into the contragredient dual `X^{ι_Γ}=D_Λ(Sel)^{ι_Γ}`, not into the scalar dual X of §0.2, exactly as in §0.11. The matched component of Kato (17.13.1) is therefore the exact sequence 0 → C → J → `X^{ι_Γ}` → H → H²_loc of Λ-modules. Its last term is finite (Kato (17.13.4)) but need not be zero, and the map H → H²_loc need not vanish, so surjectivity of `X^{ι_Γ}` → H is not asserted globally. After localization at a height-one prime 𝔮 the finite term vanishes and the four-term sequence 0 → C_𝔮 → J_𝔮 → `X^{ι_Γ}_𝔮` → H_𝔮 → 0 is exact (Kato p.280; at 𝔮=(ϖ) under the hypotheses below). Applying ι_Γ to every term, including the zeta submodule Z⊂H¹, gives 0 → `C^{ι_Γ}` → `J^{ι_Γ}` → X → `H^{ι_Γ}` → `(H²_loc)^{ι_Γ}`, with the same localized four-term form. The scalar-coordinate transport of §0.9 includes this Γ-inversion: `(K_{ω,γ,1})=(ι_Γ(k_{ω,γ,1}))`. For `M^{ι_Γ}` the localization at 𝔭 is M localized at 𝔭'=ι_Γ(𝔭), so length(`J^{ι_Γ}_𝔭`)=ord_𝔭(`K_{ω,γ,1}`). For every height-one prime 𝔭 of Λ not containing p this gives `length(X_𝔭)=ord_𝔭(K_{ω,γ,1})+length(H_{𝔭'})−length(C_{𝔭'})`, hence `length(X_𝔭)=ord_𝔭(K_{ω,γ,1})` iff `length(H_{𝔭'})=length(C_{𝔭'})`. Since ι_Γ permutes the height-one primes not containing p and fixes (ϖ), equality at all of them on one side is equality at all of them on the other: `char(X)=(K_{ω,γ,1})` iff char(H)=char(C). Kato writes (17.13.1) for the further twist T_K(k) and the correspondingly twisted Selmer dual, which moves every term by the same twist by k−1. By KMC.twist, KMC^1(T_K(1)) is `KMC^{ω^{−1}}(T_K)`, not KMC^1(T_K). At 𝔭=(ϖ) also require Kato's (12.5.2), or residual irreducibility and the actual cyclotomic-kernel unipotent with free rank-one coinvariants. Under §0.9’s hypotheses for the canonical period comparison, KMC on this same matched component is therefore equivalent to char_Λ(X)=(u_p(f)L_f), and its rational form is equivalent to IMC_Q(D). KatoPeriodDefectUnit makes the integral statement equivalent to IMC(D). Conversely, KMC^1(T_K(1)) and IMC(D), with L_f≠0, force u_p(f) to be a unit. The dyadic length comparison is the separate full-tower assertion below.

Assume good ordinarity with p∤N. The comparison at height-one primes not containing p holds for every p, including p = 2: there Kato's sequence (17.13.1), formed with Kato's Selmer dual X(T) over `Q(μ_{2^∞})` (Kato 17.3, p.273) carrying the contragredient action for which the sequence is Λ(G_∞)-linear, is exact up to multiplication by 2 (p.279), which is a unit at those primes, so KMC at p = 2 (§0.7) is equivalent to Kato's rational ordinary main conjecture, Conjecture 17.6 (p.274), at the height-one primes not containing 2. Every assertion at the prime (ϖ), and every integral consequence below, needs p odd.

(ω, γ) good for a stable O-lattice U of the cohomological realization in Kato's sense (17.5), such as T_B of §0.9, so Kato's p-adic L-function is integral. Kato 17.6 describes U as an O-linear dual Hom_O(T',O)(1−k) of a lattice T' in his notation; it is not the discrete dual T* of Conventions.

At the height-one prime (ϖ), require Kato’s (12.5.2), or residual irreducibility together with the actual rank-one unipotent substitute of Skinner §2.5 and Fouquet–Wan Lemma 3.13.

Euler and Tamagawa corrections: the sequence uses j_* conditions away from p and the Coleman image at p; no correction is discarded.

The exact-sequence length identity uses Kato's analytic term after the fixed character dictionary and π_1 of §0.9. By §0.9(3) that term is v_1·u_p(f)·L_f with v_1 ∈ O^×; no further period comparison is used, and the canonical form IMC(D) is reached exactly when u_p(f) is a unit.

Take the limit of the Poitou–Tate sequences for T(r) over `Q(ζ_{p^n})` (SelmerIwasawaCohomology §2.19 (Poitou–Tate for Selmer groups), SelmerIwasawaCohomology §3.12 (Iwasawa duality, involution and local errors)) to get Kato (17.13.1); its third term is the contragredient dual `X^{ι_Γ}`, and the scalar form is obtained by applying ι_Γ to the whole sequence.

Show lim H¹_c of the strict condition vanishes (17.13.2) because the image of Z already has Λ-rank one, embed the local quotient Q into Λ by the Coleman map before dividing by Z_loc (Kato Lemma 17.9 and Proposition 17.11; PadicHodgeRegulators §8.8 and gap:signed-regulators, and §8.22 in the elliptic case). Its cokernel is finite, hence pseudo-null, so it changes no length at a height-one prime, including (ϖ). Use finiteness of H²_loc (17.13.4) to drop the last term after height-one localization; it is not dropped from the global sequence.

Kato's scalar reciprocity (KatoEulerSystems §§6.2 and 6.4, using PadicFamilies §4.0.2 for the geometric construction), followed by the character dictionary and π_1 of §0.9, identifies the matched Coleman image of z with `K_{ω,γ,1}.`

Compare lengths at 𝔭 in the transported sequence, that is at ι_Γ(𝔭) in the natural one; both directions of the equivalence follow from the additivity of length in the localized four-term sequence. Substitute §0.9(3) for the analytic term. If both KMC^1(T_K(1)) and IMC(D) hold and L_f ≠ 0, the two principal ideals (u_p(f)L_f) and (L_f) of the domain Λ coincide, so u_p(f) is a unit.

The source for this target is [Kazuya Kato](https://www.numdam.org/item/AST_2004__295__117_0.pdf), §17.13, pp.279–280; [Kazuya Kato](https://www.numdam.org/item/AST_2004__295__117_0.pdf), 17.6, p.274; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §2.5, pp.15–16; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Lemma 4.50, p.65.

*Needs:* §0.7 (including KMC.twist); §0.5; §0.9; SelmerIwasawaCohomology §2.19 (Poitou–Tate for Selmer groups); SelmerIwasawaCohomology §3.12 (Iwasawa duality, involution and local errors); PadicHodgeRegulators §§8.8, 8.22 and gap:signed-regulators (the ordinary Coleman map and its image); KatoEulerSystems §§6.2 and 6.4 (scalar regulator and its equality with Kato's p-adic L-function); KatoEulerSystems §7.2 (the cohomological bound).

**Checks.**

- Kato 17.13 derives Theorem 17.4(2)–(3) from Theorem 12.5 by this sequence, and remarks (p.274) that Conjecture 12.10 implies the ordinary main conjecture 17.6; the length identity gives the converse as well.
- Fouquet–Wan Lemma 4.50 is the analogous equivalence with the signed or v^∨-Selmer group in place of X.
- With u_p(f) = ϖ, KMC on the matched component reads char(X) = (ϖL_f), which is incompatible with IMC(D): an implication KMC ⇒ IMC stated without the defect would be false for such a form.
- The rational forms do not see the defect: (u_p(f)L_f) and (L_f) agree in Λ[1/p].
- For weight two the matched lattice T_K(1) is T_pE, whereas Fouquet–Wan's T(f) is T_pE^∨ (§2.1). At p=7 the matched component is the ω^(−1)-component of T_pE^∨, and ω^(−1)(−1)=−1: a theorem on the trivial component of T_pE^∨ is not the matched input, and supplies only the ω-component of T_pE.
- Regulator before quotient: with Q=Λ=O[[t]], Col the identity, Z_loc=tΛ and z_loc=t, the regulator is k=t and length(J_(t))=1=ord_(t)(t). Taking instead the image of z_loc in J=Λ/(t) gives 0, and Λ/(0)=Λ has rank one, which cannot match the torsion module J.
- The finite local term is not zero in general: for E: y²+y=x³+x²+3 (Δ=−4771=−13·367, c₄=16), p=3 is good ordinary with a₃=−2, E[3] is irreducible (a₂=2 and u²−2u+2 has discriminant −4, a nonsquare mod 3), and ψ₃=3x⁴+4x³+39x+13 has a root in Z_3 with x≡−1 mod 3 at which 1+4(x³+x²+3)≡1 mod 3 is a square, so E(Q_3)[3]≠0 and H²_loc of T_3E is nonzero on the trivial tame component. Inertia at 13 acts by a nontrivial unipotent on E[3], so E[3] has no invariants over `Q(μ_{3^∞})`; the next global term of Kato (14.9.3) vanishes and H → H²_loc is onto a nonzero finite module. A global four-term sequence ending in H → 0 would be false here; the localized one is unaffected.
- At p = 2 the four-term sequence is exact only up to multiplication by 2; that error vanishes after localising at a height-one prime not containing 2 and not at one containing 2, which is why kmc_iff_ordinary_two is restricted to the former.
- Involution at a height-one prime: in R=Z_7[[t]], t=γ−1, ι_Γ(t)=(1+t)⁻¹−1=−t/(1+t) and ι_Γ(t−7)=−(8t+7)/(1+t). For M=R/(t−7), `M^{ι_Γ}≅R/(t+7/8)`. At 𝔭=(t−7) the lengths are 1 and 0, and neither prime contains 7, so inverting p does not repair a sequence that puts the scalar X at the same prime as the natural terms.
- On a Γ-quotient of order 7 take Sel=Z/49 with γ acting by 8 and the paired compact line by 43=8⁻¹ mod 49. The natural map sends γc to the functional with value 43 on s=1, which is γ acting on Φ(c) contragrediently; the scalar action gives 8≠43. Trivial tame character does not remove the Γ-inversion in the ordinary sequence.

The usable interface adds kmc_iff_char_eq_defect_mul (KMC^1(T_K(1)), KMC on the matched component, ⟺ char(X) = (u_p(f)L_f)), katoPeriodDefectUnit_of_IMC_KMC (the detection consequence above) and kmc_iff_ordinary_two (for p = 2: KMC ⟺ length X(T)_𝔭 = ord_𝔭 `L_{p-adic,α,ω,γ}(f)` at every height-one prime 𝔭 of Λ(G_∞) not containing 2).

### 0.11 Signed Selmer groups from Coleman maps

Let D be a datum at an odd p with p ∤ N whose local representation at p is crystalline, and fix a good basis ν₁, ν₂ of D_cris and its lift n₁, n₂ to the Wach module (PhiGammaModulesAndIwasawaCohomology §§6.2–6.3; in the LLZ source range, LLZ §3.3, Lemma 3.15). The signed theory lives on the Lei–Loeffler–Zerbes lattice T_LLZ:=T_K(k−1) (Conventions), with discrete Tate partner A^*:=Hom_cont(T_LLZ,μ_(p^∞)); LLZ write T_f̄(k−1) and (V_f/T_f)(1) for them (LLZ §6.2, p.43). It is the lattice in which LLZ place Kato's zeta element (LLZ §3.3, Definition 3.17, p.14), Kato's twist by k−r at r=1 (Kato Theorem 12.5(1), p.221). It is not Kato's untwisted T_K of §§0.6–0.7 and §2.1: for weight two and trivial character T_K=T_pE^∨ with determinant κ^(−1) and Tate partner E[p^∞](1), whereas T_LLZ=T_pE with determinant κ and A^*=E[p^∞]. The Coleman maps are Col_i : H¹_Iw(Q_p, T_LLZ) → Λ_E(G_∞), i = 1, 2 (PadicHodgeRegulators §9.12). For n ≥ 0 let `H¹_f(Q_{p,n},` A^*)_i be the orthogonal complement, under the local Tate pairing between `H¹(Q_{p,n},` T_LLZ) and `H¹(Q_{p,n},` A^*), of the image of ker(Col_i) in `H¹(Q_{p,n},` T_LLZ). The i-th signed Selmer group is `Sel^i(Q(μ_{p^∞}),` A^*) := lim_n `ker(Sel(Q(μ_{p^n}),` A^*) → `H¹(Q_{p,n},` `A^*)/H¹_f(Q_{p,n},` A^*)_i), with Bloch–Kato conditions away from p, and X^i:=D_Λ(Sel^i)^ι is its contragredient Pontryagin dual, a finitely generated Λ(G_∞)-module. Thus (g·φ)(s)=φ(g⁻¹s). The compact cohomology and Coleman maps keep their natural actions. The scalar dual X_sc^i=D_Λ(Sel^i) is related by X^i=(X_sc^i)^ι; it is not the target of the natural Λ-linear Poitou–Tate map.

Assume p∤N and `V_f|G_{Q_p}` crystalline, and fix the Wach-module basis; the groups depend on that basis.

The signed definitions use the actual Frobenius and ordered Coleman matrix for the chosen nebentypus. Every LLZ source theorem package below additionally assumes ε(p)=1 (LLZ §3.3, p.14), including its ordinary specialization and the nonvanishing used in its Poitou–Tate sequence. No unramified-twist transport to other ε(p) is asserted.

For supersingular f, LLZ’s assumption (A) (k ≥ 3 or a_p = 0) and for good ordinary f assumption (A') (k ≥ 3 and V_f not locally split) are needed for cotorsion, not for the definition.

The usable interface consists of the following named outputs.

- SignedSelmer.localCondition: `H¹_f(Q_{p,n},` A^*)_i, the annihilator of ker(Col_i) at level n.
- SignedSelmer.dual: X^i=D_Λ(Sel^i)^ι, the contragredient Pontryagin dual of Sel^i, with the scalar-dual adapter `X^{i,η}≃(X_sc^{i,η⁻¹})^{ι_Γ}`.
- SignedSelmer.poitouTate: The exact sequence H¹(T_LLZ) → Im(Col_i) → X^i → H²(T_LLZ) → H²_loc(T_LLZ), whose last term (local Iwasawa H² at p) is finite, so that after localization at every height-one prime it ends in H²(T_LLZ) → 0 as in LLZ (60); injective on the left when X^i is torsion and H¹(T_LLZ) is torsion-free of rank one, in the ε(p)=1 source range of LLZ Theorem 6.1 and the nonvanishing range of Theorem 6.5.
- SignedSelmer.changeBasis: For actual target basis b′ = b B, Col′ = B⁻¹Col in column convention, and the new signed groups use the new coordinate kernels. A general Wach basis change requires computing its induced Λ-coordinate matrix first.
- SignedSelmer.etaComponent: η-components `X^{i,η}` for η ∈ Δ^∨ over Λ.
- SignedSelmer.ordinary_case: For good ordinary f with ε(p)=1 and the basis of LLZ §3.6, the relation (3) of LLZ p.6 gives `L̃_{p,α}` = `ū·L̃_{p,2}` with ū ∈ Λ_E(G_∞)^×, so the second Coleman map carries Kato's class to the unit-root p-adic L-function up to a unit. The analytic quotient in SMC still retains the actual image of that map.

The local condition on H¹_Iw(Q_p, T_LLZ) is the closed kernel of Col_j for the chosen good Wach basis (PadicHodgeRegulators §9.30); its orthogonal complement at each finite layer is SelmerIwasawaCohomology §§2.13, 2.17 (dual Selmer structures and local orthogonality).

Glue with the Bloch–Kato conditions away from p (SelmerIwasawaCohomology §§2.1–2.2 (Selmer data and kernels)) and take the direct limit; finite generation of the dual as for §0.2.

The Poitou–Tate sequence H¹(T_LLZ) → Im(Col_i) → X^i → H²(T_LLZ) → 0 (LLZ (60)) is Λ(G_∞)-linear with this contragredient X^i. In scalar-dual notation its middle target is (X_sc^i)^ι. Indeed the Tate pairing gives Φ(gc)(s)=⟨c,g⁻¹s⟩, which is (g·Φ(c))(s) for the contragredient action and (g⁻¹·Φ(c))(s) for the scalar action (SelmerIwasawaCohomology §§2.10, 3.12). This is the equivariance adapter used by §§0.12–0.13, not an assertion that the scalar target has a linear natural map.

The source for this target is [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), §6.2, Definition 6.4 and sequence (60), p.43; [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), §3.3, assumptions (A)–(D), p.14.

*Needs:* PhiGammaModulesAndIwasawaCohomology §§6.0, 6.2–6.3 (Wach bases and domains); PadicHodgeRegulators §§9.12, 9.17 and 9.30 (Coleman coordinates, basis covariance and signed kernels); SelmerIwasawaCohomology §§2.10, 2.13, 2.17, 3.12 (contragredient action, local orthogonality and Iwasawa duality); SelmerIwasawaCohomology §§2.1–2.2 (Selmer data and kernels); SelmerIwasawaCohomology §3.7 (the twist to T_LLZ); §0.1; §0.6.

**Checks.**

- Choose two actual Coleman coordinate systems with Col′₁ = Col₁ and Col′₂ = Col₂ − Col₁. For independent coordinate maps, the second kernels differ, so signed groups must retain their coordinate choice. This is an explicit constant Λ-coordinate transformation, not a formula for arbitrary Wach matrices.
- For E = 14a1 and p = 5 (a_5 = 0), the two signed Selmer groups for the basis of LLZ Proposition 5.10 are Kobayashi's `Sel^−(E/Q(μ_{p^∞}))` and `Sel^+(E/Q(μ_{p^∞})).`
- In the displayed kernel construction, if ker Col_i = 0 then its annihilator is all local H¹ and the extra restriction is void: the result is the starting Bloch–Kato Selmer group. A construction starting from H¹ with only away-p conditions would instead give the relaxed-at-p group; these two starting objects must not be confused.
- For a change b′ = b B of the actual good Λ-basis of (φ*N(T))^(ψ=0), the coordinate column changes by B⁻¹. A Wach-module change U first induces a change through φ and the Mellin comparison; its matrix must not be substituted for B without proof.
- For a_p = 0 and the basis of LLZ Proposition 5.10, X^1 and X^2 are Kobayashi's minus and plus contragredient Selmer duals (§4.5).
- Let a tame generator δ act on S=F₇ by 2, and let the paired compact line act by 4. For c=s=1, ⟨δc,s⟩=4=⟨c,δ⁻¹s⟩, whereas scalar δ-action on Φ(c) gives 2. The signed contragredient dual lies on η(δ)=4; the scalar dual lies on η⁻¹(δ)=2. Since 2·4=1 and 2≠4, the same-η scalar sequence fails.
- On a Γ-quotient of order 7 take S=Z/49 with γ acting by 8 and the paired line by 43=8⁻¹ mod 49. The two pairings are 43=43, whereas the scalar action gives 8. Trivial Δ-action therefore does not remove Γ-inversion.
- Coefficient lattice: for weight two, trivial character and κ(g)=4, det T_K(g)=1/4 and det T_LLZ(g)=4, so the two lattices are not equivariantly isomorphic. Building the local conditions on T_K would give Selmer groups of E[p^∞](1), not Kobayashi's groups of E[p^∞].

### 0.12 The signed main conjecture with the Coleman-image term

For the data of §0.11, put `L̃_{p,i}` := Col_i(loc_p z_Kato) ∈ Λ_E(G_∞), where z_Kato ∈ H¹(T_LLZ)⊗Q is Kato's zeta element moved by φ_(k−1); localization at p commutes with φ_(k−1) (KatoEulerSystems §4.6). The i-th signed main conjecture `SMC^{i,η}` is the proposition: `X^{i,η}` is Λ-torsion and `char_Λ(X^{i,η})` = char_Λ(Im(Col_i)^η / `Λ·L̃^η_{p,i}).` Only when Im(Col_i)^η is computed to be Λ (or Λ_E rationally) does it simplify to `char(X^{i,η})` = `(L̃^η_{p,i}).`

Equivalently, in the ordinary scalar-dual notation of Conventions the signed assertion is `char_Λ(X_sc^{i,η⁻¹})=ι_Γ(char_Λ(I_i^η/Λ·L̃^η_{p,i}))`, with scalar torsion as before. If I_i^η=Λ its right side is `(ι_Γ(L̃^η_{p,i}))`. This is an equivalence of the full ideal equalities, with both the inverse tame label and Γ-inversion retained (SelmerIwasawaCohomology §§2.10, 3.12; LLZ (60) and Corollary 6.6, pp.43–44).

The Coleman-image correction is part of the statement; replacing it by the principal ideal `(L̃_{p,i})` is a separate theorem (§4.4).

`L̃_{p,i}` depends on the Wach basis; it is related to the unbounded refined functions `L̃_{p,α},` `L̃_{p,β}` by the logarithm matrix M of LLZ Theorem 3.25 (PadicHodgeRegulators §§9.14–9.15).

Fix the integral Coleman domain and its actual finitely generated Λ-lattice I_i = Im Col_i inside Λ_E. For an integral statement require Z(f,T_LLZ) ⊂ H¹(T_LLZ), `L̃_{p,i}` ∈ I_i and `L̃_{p,i}^η` ≠ 0. The quotient I_i^η/Λ L̃^η is then a finitely generated torsion Λ-module even if I_i is fractional.

The usable interface consists of the following named outputs.

- SMC: `SMC^{i,η}` : Prop, the equality with the Coleman-image term.
- SMC_rational: The same equality after extending both modules to Λ[1/ϖ] on the chosen tame component.
- SMC.of_image_eq_top: If Im(Col_i)^η = Λ then `SMC^{i,η}` ↔ `char(X^{i,η})` = `(L̃^η_{p,i}).`
- SMC.changeBasis: Whenever each chosen integral good basis and index satisfies the torsion, nonvanishing and exact-sequence hypotheses of signed-cohomological-comparison, its corrected image-quotient assertion is equivalent to KMC. An arbitrary basis or index outside that range has no such asserted equivalence.
- SMC.kobayashi_form: At a_p = 0 and weight two, the LLZ maps have the Kobayashi kernels (1 = minus, 2 = plus). Translating analytic ideals uses the explicit Coleman images and period scalars. Proposition 5.10/Corollary 5.11 give rational unit comparisons; an integral equality of Pollack ideals also requires an integral unit normalization.

Form `X^{i,η}` and the Λ-submodule Im(Col_i)^η ⊂ Λ_E(G_∞)^η; the quotient by `L̃^η_{p,i}` is torsion when `L̃^η_{p,i}` ≠ 0 (LLZ Corollaries 3.29 and 3.33, Proposition 3.39).

Take char_Λ of the actual fractional-lattice quotient, retaining its integral Λ-module structure. LLZ Remark 6.7 does not force inversion of p: a fractional embedding of a finitely generated lattice does not change its coefficient ring. The rational version separately tensors both modules with E.

The source for this target is [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), Corollary 6.6, p.44; [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), Theorem 1.3 (= Theorem 3.25), p.5, and Remark 6.7, p.44.

*Needs:* §0.11; KatoEulerSystems §4.6 (twisting commutes with localization); PhiGammaModulesAndIwasawaCohomology §§6.0, 6.2–6.3 (Wach bases and domains); PadicHodgeRegulators §§9.14–9.15, 9.26 and 9.29 (logarithmic matrix, rational image and integral finite cokernel); `PadicMeasuresIwasawaAlgebras` Layer 4; §0.6.

**Checks.**

- For an elliptic curve with a_p=0, LLZ Proposition 5.21 gives `Im(Col_2)=(Σ_{δ∈Δ}δ)Λ(G∞)+XΛ(G∞).` On a nontrivial tame component this is (X), so the principal-ideal statement `char(X^{2,η})=(L̃^η_{p,2})` differs from `SMC^{2,η}` by char(Λ/(X)). On the trivial component the image is all of Λ, since p−1 is a unit. This checks the definition on every component without asserting that the theorem proves every component.
- On a rank-one model over R = Λ ≅ O[[X]], take Im(Col_i) = XR and `L̃_{p,i}` = X². Multiplication by X identifies XR/X²R with R/(X), so the corrected term is (X); replacing the image by R gives R/(X²) and (X²). The lengths at the height-one prime (X) are 1 and 2, so a definition omitting the image correction fails.
- For good ordinary f with ε(p)=1 and LLZ's §3.6 basis, `(L̃_{p,2})` = `(L̃_{p,α})` as ideals of Λ_E(G_∞), because ū is a unit (LLZ (3), p.6); the numerator of SMC² is therefore a unit multiple of the unit-root function. Its analytic quotient still contains Im(Col₂); this comparison alone does not show that the image is Λ_E.
- For R=Z₇[[X]] and a=7, ι_Γ(X)=−X/(1+X). The scalar cyclic module R/(X−7) becomes a contragredient module with ideal (X+7/8), since ι_Γ(X−7)=−(8X+7)/(1+X). At X=7 the first generator is 0 and X+7/8=63/8≠0; the two ideals differ even on η=1. For a=0 the ideals (X) and (ι_Γ(X)) agree because −1/(1+X) is a unit, so that example alone would miss the defect.
- Take Im(Col_i) = ϖR and `L̃_{p,i}` = ϖX. The corrected quotient ϖR/ϖXR ≅ R/(X) has characteristic ideal (X), with μ = 0, whereas the ambient quotient R/(ϖX) has μ = 1 and length 1 at the height-one prime (ϖ). After inverting ϖ the two agree, so only the integral statement detects the image.

### 0.13 The signed reformulation of Kato's main conjecture

Assume p odd, p∤N, ε(p)=1, LLZ's (A) if f is supersingular at p, or (A') if f is good ordinary, and (E): some basis of T_f has image of `Gal(Q̄/Q(μ_{p^∞}))` containing SL₂(Z_p). Then for each η ∈ Δ^∨ (with i = 1 for every η and i = 2 for η trivial): `X^{i,η}` is Λ-torsion, there is an exact sequence 0 → (H¹(T_LLZ)/Z(f,T_LLZ))^η → `(Im(Col_i)/L̃_{p,i})^η` → `X^{i,η}` → H²(T_LLZ)^η → H²_loc(T_LLZ)^η whose last term is finite, hence a four-term sequence ending in H²(T_LLZ)^η_𝔮 → 0 after localization at every height-one prime 𝔮 (the form of LLZ (61)), and KMC^η(T_LLZ) ⟺ `SMC^{i,η}.` By KMC.twist with r=k−1, KMC^η(T_LLZ) is `KMC^{ηω^{1−k}}(T_K)` with γ transported by Tw_(k−1): the trivial signed component corresponds to the ω^(1−k)-component of Kato's untwisted lattice, and KMC^1(T_K) corresponds to the signed component η=ω^(k−1). Here `X^{i,η}` is contragredient: the same sequence has `(X_sc^{i,η⁻¹})^{ι_Γ}` in its place, and the scalar form is exactly §0.12’s inverted analytic ideal. Without (E) the same holds rationally, and the divisibility `ϖ^{n_i}L̃^η_{p,i}` ∈ `char(X^{i,η})` holds for some n_i ≥ 0.

(A) for supersingular f: k ≥ 3 or a_p = 0; (A') for good ordinary f: k ≥ 3 and V_f not locally split at p.

(E) for the integral statement; the unipotent substitute of §1.2 supplies Kato's integral inputs but the equivalence as printed uses (E).

The η-restriction for i = 2 is LLZ's.

`L̃^η_{p,i}` ≠ 0 under (A) or (A') (LLZ Corollaries 3.29 and 3.33, with Remark 3.30 for k = 2 and a_p = 0, and Proposition 3.39), so the cokernel of H¹(T_LLZ) → Im(Col_i) is torsion; with H²(T_LLZ) torsion (Kato, transported by φ_(k−1)) X^i is torsion.

As in Kobayashi Theorem 7.3, the first map of (60) is injective, giving (61); taking characteristic ideals, that is comparing lengths in the four-term sequence localized at each height-one prime, gives the equivalence (LLZ Corollary 6.6). The next Poitou–Tate term H²_loc(T_LLZ) is finite: by local duality it is dual to the invariants of the discrete dual over `Q_p(μ_{p^∞})`, which are finite because V_f restricted to `G_{Q_p}` has no line on which `G_{Q_p}` acts through `Gal(Q_p(μ_{p^∞})/Q_p)` (it is irreducible in the supersingular case, and in the ordinary case its two characters have unramified parts sending Frobenius to α or α⁻¹, not a root of unity since `|α|=p^{(k−1)/2}` in every complex embedding). It vanishes after height-one localization, so the equivalence does not use global surjectivity onto H²(T_LLZ).

Kato's divisibility Theorem 6.1(d)–(e) (KatoEulerSystems §7.2), proved on every tame component and moved to T_LLZ by KMC.twist, gives the divisibility in Theorem 6.5. The equivalence itself is a comparison on Kato's side and proves no divisibility.

The source for this target is [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), Theorem 6.1, Theorem 6.5 and its proof, Corollary 6.6, pp.43–44; [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), Corollaries 3.29 and 3.33 and Remark 3.30, pp.20–21, and Proposition 3.39, p.22.

*Needs:* §0.7 (including KMC.twist); §0.12; §0.11; KatoEulerSystems §7.2 (the cohomological bound under (12.5.2)); SelmerIwasawaCohomology §2.19 (Poitou–Tate for Selmer groups); PadicHodgeRegulators §§9.26 and 9.30 (Coleman image and signed kernels).

**Checks.**

- Trivial nebentypus gives ε(p)=1, including for 14a1 at p=5 and 11a1 at p=7; ε(p)=−1 is outside this theorem even when (A) or (A′) holds.
- For E = 14a1 at p = 5: a_5 = 0 gives (A); the mod-5 representation is surjective (5 is not among the nonmaximal primes 2, 3 of 14a1), hence the 5-adic image is GL₂(Z_5) and (E) holds.
- At k=2 and p=5 the trivial signed component corresponds to the ω^(−1)-component of T_K, whose value at δ=−1 is −1, and KMC^1(T_K) corresponds to the signed ω-component. Since i=2 is allowed only for η=1 and ω^(k−1)≠1 for even k and odd p (k−1 is odd, p−1 even), an equality on the trivial component of T_K yields no index-two signed statement.

### Examples

For a rank-one module over Λ with z = X²e and a torsion degree-two term Λ/(X²), both characteristic ideals are (X²). Replacing z by ϖz multiplies only the zeta quotient ideal by (ϖ): a rational comparison does not prove the integral equality. For the signed image I = (X) and z_i = X², multiplication by X identifies I/(z_i) with Λ/(X), whose characteristic ideal is (X), whereas the ideal (z_i) is (X²). These are separate tests of the integral and image conventions.

### Dependencies

Use PadicMeasuresIwasawaAlgebras Layers 1, 4 and 5, SelmerIwasawaCohomology Layers 1–4, PadicFamilies §§4.0.1–4.0.3, KatoEulerSystems Layers 2 and 4–7 with gap:modular-zeta-extensions, ModularSymbolsPadicLFunctions Layers 1–4, ArithmeticGaloisRepresentations Layers 2, 4 and 6 (decomposition and inertia, residual images and elliptic Tate modules), and PadicHodgeRegulators Layers 8–9 with gap:signed-regulators. No arithmetic carrier in this layer is manufactured from an unspecified proposition.


## Layer 1: ordinary theorems and residual hypotheses

### 1.1 Residual hypotheses of the main theorems

For a two-dimensional representation ρ̄ : G_Q → GL_F(W) over a finite field F of characteristic p > 2, with decomposition and inertia groups D_ℓ ⊃ I_ℓ at each prime ℓ, define the following predicates. (irred): W has no G_Q-stable line. (dist) at p: ρ̄|D_p has a D_p-stable line on which D_p acts by χ̄₁ with quotient χ̄₂ and χ̄₁ ≠ χ̄₂. (SU_q): q ≠ p, q ∥ N and ρ̄(I_q) ≠ 1. (FW1.6_ℓ), in Fouquet–Wan's cohomological normalisation (det ρ̄ = χ̄_cyc¹⁻ᵏ): ℓ ≠ p, ℓ ∥ N, dim_F `W^{I_ℓ}` = 1 and dim_F `W^{D_ℓ}` = 0. (FWexp_ℓ(μ)): ℓ ≠ p and ρ̄|D_ℓ is a nonsplit extension 0 → `μχ̄_cyc^{1−k/2}` → ρ̄|D_ℓ → `μχ̄_cyc^{−k/2}` → 0 with μ unramified quadratic or trivial and ρ̄(I_ℓ) ≠ 1. (LocExc_p): there is no character χ̄ of D_p with (ρ̄|D_p)ˢˢ ≅ χ̄ ⊕ χ̄χ̄_cyc. (ScalarExc_p): there is no χ̄ with (ρ̄|D_p)ˢˢ ≅ χ̄ ⊕ χ̄. (Im): there is σ ∈ `G_{Q(μ_{p^∞})}` with T/(σ − 1)T free of rank one over O, for a lattice T lifting ρ̄. These predicates are evaluated on the chosen residual representation. Residual semisimplification is lattice-independent; extension and ramification data need not be. Under residual irreducibility all stable lattices are homothetic, so their residual representations agree up to isomorphism. (Im) is an integral condition on T.

Assume p is odd.

The normalisation of ρ̄ matters for (FW1.6_ℓ): in the homological normalisation (det = χ̄_cycᵏ⁻¹) the inertia-invariant line carries a different character.

Here k is the weight of the form under consideration; (FWexp_ℓ) uses k even, automatic for trivial nebentypus.

The usable interface consists of the following named outputs.

- ResidualHyp.irred: Irreducibility of ρ̄ over F.
- DistinctCharacters: (dist): the two characters of D_p on the ordinary filtration differ; for reducible ρ̄|D_p this is also (ScalarExc_p).
- IsRamifiedAt: (SU_q), local part: some element of I_q acts nontrivially (the condition q ∥ N is on the level).
- FWAuxiliaryCondition: (FW1.6_ℓ), local part: dim `W^{I_ℓ}` = 1 and dim `W^{D_ℓ}` = 0, in cohomological normalisation.
- ResidualHyp.fwExplicit: (FWexp_ℓ(μ)): the explicit twisted-Steinberg extension with μ unramified quadratic (possibly trivial), ρ̄|I_ℓ ≠ 1.
- LocalExclusion: (LocExc_p) for reducible ρ̄|D_p with Jordan–Hölder characters χ₁, χ₂: the pair is not {χ, χω}.
- ScalarExclusion: (ScalarExc_p): (ρ̄|D_p)ˢˢ is not χ̄ ⊕ χ̄; equal to DistinctCharacters in the reducible case and automatic in the irreducible case.
- `HasRankOneCoinvariants`: For an O-linear endomorphism σ of T, this means that T/(σ−1)T admits an O-linear equivalence with O. This is the free rank-one condition, rather than rational rank one alone.
- HasRankOneImage: (Im): some σ in the given subgroup has HasRankOneCoinvariants (ρ σ), i.e. T/(σ − 1)T ≅ O.
- For trivial inertia, apply Mathlib `Representation.invariants_eq_top` to the restricted representation after furnishing its `Representation.IsTrivial` instance. This supplies the whole invariant space without another target.
- not_fwAuxiliary_bot: over any field, a two-dimensional representation with trivial inertia fails FWAuxiliaryCondition for every decomposition subgroup.
- fwAuxiliary_independentCharacters: on F₇², with D=F₇××F₇× acting by the two tautological characters and I=ker(fst), the I-invariants are a line and the D-invariants vanish.
- not_hasRankOneCoinvariants_id: the identity of O² has coinvariants O², so it never satisfies HasRankOneCoinvariants (any nontrivial commutative O).
- not_hasRankOneCoinvariants_upper_uniformizer: over a discrete valuation ring, the unipotent matrix with upper-right entry a uniformiser ϖ fails HasRankOneCoinvariants, its coinvariants being O/(ϖ) ⊕ O.
- hasRankOneImage_fullAutomorphismGroup: over any discrete valuation ring, the natural action of the full linear automorphism group of O² satisfies HasRankOneImage on the full subgroup, witnessed by the standard unipotent.
- FWAuxiliaryCondition.isRamifiedAt: For dim W = 2, (FW1.6_ℓ) implies IsRamifiedAt, i.e. (FW1.6_ℓ) → (SU_ℓ).
- localExclusion_one_iff: With ω = 1, LocalExclusion χ₁ χ₂ 1 ↔ DistinctCharacters χ₁ χ₂.
- ResidualHyp.fwAux_iff_nonsplit_weight_two: For k = 2 and ℓ ∥ N multiplicative with ρ̄(I_ℓ) ≠ 1: (FW1.6_ℓ) ↔ μ nontrivial ↔ nonsplit multiplicative reduction at ℓ.
- ResidualHyp.suAux_im: (SU_q) → (Im) (§1.2).
- The elliptic instance of IsRamifiedAt is imported: for E/Q with multiplicative reduction at ℓ ≠ p, `ρ̄_{E,p}(I_ℓ)` ≠ 1 iff p ∤ ord_ℓ(Δ_Eᵐⁱⁿ) (ArithmeticGaloisRepresentations §6.3, with ord_ℓ j_E = −ord_ℓ Δ_Eᵐⁱⁿ at multiplicative reduction).
- ResidualHyp.locExc_ordinary_weight_two: For E good ordinary at p > 3 with unit root α: (LocExc_p) ↔ ᾱ² ≠ 1; for p = 3 it always fails.

Evaluate the residual predicates on finite-dimensional restrictions of ρ̄ to D_ℓ, I_ℓ or G_Q, using Mathlib's Representation.invariants for fixed subspaces. The predicates HasRankOneCoinvariants and HasRankOneImage instead concern the integral lattice T: residual dimensions alone do not detect torsion in T/(σ−1)T.

At a Steinberg prime ℓ ≠ p, inertia acts unipotently. Tate's uniformisation theorem is imported from PadicHodgeTheory §9.3 (`potentiallyMultiplicativeTwistReduction`): for any prime ℓ, a finite extension K of Q_ℓ and E/K with v(j(E)) < 0, there are a unique q_E ∈ K^× with v(q_E) > 0 and `j(E_{q_E}) = j(E)` and a unique quadratic character η with `E ≅ E_{q_E} ⊗ η`; the reduction is split multiplicative iff η = 1 and nonsplit multiplicative iff η is unramified and nontrivial. With the equivariant uniformisation of TauCetiRoadmap.EllipticCurves Layer 4 this gives E(L) ≅ L^×/q_E^ℤ compatibly with Gal(L/K) in the split case, and v(q_E) = v(Δ_min) = −v(j(E)) > 0. The residual inertia criterion is ArithmeticGaloisRepresentations §6.3 (Multiplicative residual unramified criterion): for multiplicative reduction at ℓ ≠ p, E[p] is ramified at ℓ iff p ∤ v_ℓ(j(E)) = −v_ℓ(Δ_min), in the nonsplit case as well. The cohomological `ρ̄_{f_E}` is E[p]^∨ ≅ E[p](−1), and neither the dual nor the cyclotomic twist, unramified at ℓ, changes whether inertia acts trivially. These give the ramification conditions in the elliptic instances of (SU_q) and (FWexp_ℓ). This is an inertia criterion: divisibility of the valuation does not assert that q_E is a p-th power in Q_ℓ itself, where a unit obstruction can remain.

The source for this target is [Christopher Skinner and Eric Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Theorem 1, p.2 and Theorem 3.6.4, p.43; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Theorems 1.1, 1.6, 1.7, pp.3, 6–7; Assumption 2.1, p.17; Theorem 5.1, p.68; [Ashay Burungale, Francesc Castella and Christopher Skinner](https://arxiv.org/abs/2405.00270v2), Theorem 1.1.2, p.2; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §2.5, pp.15–16; for the imported Tate parameter, Joseph H. Silverman, *Advanced topics in the arithmetic of elliptic curves*, GTM 151, Springer 1994, Theorem V.5.3, recalled in [William Stein and Christian Wuthrich](https://wstein.org/papers/mcom2649-iwasawa-alg.pdf), §4.2, p.1771.

*Needs:* Mathlib `Representation.invariants`; Mathlib `ContRepresentation`; TauCetiRoadmap.EllipticCurves Layer 4; PadicHodgeTheory §9.3 (`potentiallyMultiplicativeTwistReduction`); ArithmeticGaloisRepresentations §6.3 (Multiplicative residual unramified criterion); §0.1.

**Checks.**

- For 11a1 (Δ = −11^5, split at 11) and p = 7: (irred) holds (only 5-isogenies), (SU_11) holds (7 ∤ 5), (FW1.6_11) fails (split, so the inertia-invariant line is D_11-fixed in cohomological normalisation), (LocExc_7) holds (ā_7 = −2, and 4 ≢ 1 mod 7), (Im) holds via τ ∈ I_11.
- For 14a1 (Δ = −2^6·7^3, nonsplit at 2, split at 7) and p = 13: (FW1.6_2) holds (13 ∤ 6 and nonsplit), (SU_2) and (SU_7) hold, and a_13 = −4 is a 13-adic unit.
- In the homological normalisation (W = E[p]) the D_ℓ-invariants of the inertia-invariant line vanish iff ψ(ℓ)ℓ ≢ 1 mod p (ψ the unramified quadratic character of the reduction type); for 11a1 at p = 7 this holds although (FW1.6_11) fails in Fouquet–Wan's normalisation, so a definition in the wrong normalisation admits curves the theorem does not cover.
- For E good ordinary at p = 3, ā_3 ∈ {1, 2} = {±1} mod 3, so (LocExc_3) fails for every such curve.
- For T = O² and σ = [[1, 1], [0, 1]], T/(σ − 1)T ≅ O, so (Im) holds; for σ = 1 and for [[1, ϖ], [0, 1]] it fails.
- Weight two, cohomological normalisation, ℓ ∥ N_E multiplicative, ρ̄ ramified at ℓ: (FW1.6_ℓ) ⟺ E has nonsplit multiplicative reduction at ℓ ⟺ (FWexp_ℓ(μ)) with μ nontrivial; for k > 2 the dimension condition (FW1.6_ℓ) means `μ(ℓ)ℓ^{1−k/2}` ≢ 1 mod ϖ, which is neither implied by nor implies μ nontrivial.
- (SU_q) ⟸ (FW1.6_q): the second is strictly stronger; E = 11a1 at p = 7 satisfies (SU_11) but not (FW1.6_11), since 11a1 is split at 11.

- For ResidualHyp.irred, 11a1 at p=7 and 14a1 at p=13 pass by the nonsquare Frobenius discriminants computed in §5.10. The two-dimensional trivial representation fails, and 11a1 at p=5 fails because its rational 5-torsion gives a stable line. Oddness at p>2 promotes the stated irreducibility to absolute irreducibility.
- For ScalarExclusion, the scalar pair (1,1) fails, the pair (1,ω) with ω≠1 passes, and an irreducible two-dimensional local representation passes. Thus scalar exclusion differs from LocalExclusion, which rejects (1,ω).
- For ResidualHyp.fwExplicit, weight-two 14a1 at ℓ=2, p=13 passes with nontrivial unramified quadratic μ. Weight-two 11a1 at ℓ=11, p=7 passes with μ trivial although its decomposition-invariant vanishing condition fails. The direct sum μ⊕μω⁻¹ fails the ramified-extension condition, even when μ is nontrivial.
- For IsRamifiedAt, scalar multiplication of F₇× on F₇ is ramified on the full group; a trivial representation is unramified on every subgroup, and restriction of any representation to the identity subgroup is unramified.
- For FWAuxiliaryCondition, let D=F₇××F₇× act diagonally on F₇² and let I=ker(fst). Then dim W^I=1 and dim W^D=0. With I trivial in dimension two the first dimension is 2, so the condition fails. With D=I=ker(fst), both invariant dimensions are 1: the first condition passes and the zero decomposition-invariants condition fails. This detects omission of the second condition.
- For DistinctCharacters, the trivial and tautological characters of F₇× differ. An equal pair fails, including the pair of trivial characters; reversing a pair preserves distinctness.
- For LocalExclusion, each pair (1,ω) and (ω,1) fails. On F₇× with ω tautological, the pair (1,ω²) passes: ω has order 6, so neither ω²=ω nor ω³=1. At ω=1 the predicate agrees with distinctness, rather than excluding every pair.
- For `HasRankOneCoinvariants`, the standard unipotent on O² passes; the identity fails because the quotient is O²; the upper-right-ϖ unipotent fails because its quotient has nonzero ϖ-torsion. These tests apply over an arbitrary DVR, including equal characteristic, not just ℤ_p.
- For HasRankOneImage, the natural representation of GL₂(O) on O² with the full subgroup passes by the standard unipotent. A trivial rank-two representation on any subgroup fails; the identity subgroup in any rank-two representation also fails. A rational rank-one quotient with integral torsion is not a witness.
- For the imported elliptic instance of IsRamifiedAt: 11a1 at ℓ = 11 (split, ord_11 Δ_min = 5) is ramified for p = 7 (7 ∤ 5) and unramified for p = 5 (5 ∣ 5); 14a1 at ℓ = 2 (nonsplit, ord_2 Δ_min = 6) is ramified for p = 13 and unramified for p = 3, so the criterion needs no split hypothesis. The quadratic twist of 11a1 by the character of Q(√−11) has the same j but additive, potentially multiplicative reduction at 11; ord_11 j = −5 is divisible by 5, yet inertia acts on its 5-torsion through the ramified quadratic character, by −1 ≠ 1. The criterion presupposes multiplicative reduction.

These are README Checks. For scalar ramification on F₇ the element −1 acts by −1≠1. For the character test, 3 has order six, while 2³=1 would fail to distinguish the reversed exceptional pair. The three integral quotient calculations of §0.8 distinguish a free line, a line with torsion and a torsion quotient; their boundary cases require no further Lean declarations.

### 1.2 A ramified multiplicative prime gives a rank-one quotient

Let T be a free O-module of rank two with a continuous G_Q-action ρ, and q ≠ p a prime at which ρ restricted to I_q is unipotent and nontrivial modulo ϖ (as for a newform with q ∥ N, trivial character, and ρ̄ ramified at q). For τ ∈ I_q mapping to a topological generator of the tame quotient, ρ(τ) is unipotent, ρ̄(τ) ≠ 1, T/(ρ(τ) − 1)T is free of rank one over O, and τ ∈ `G_{Q(μ_{p^∞})}.` More generally, any σ with ρ(σ) unipotent and ρ̄(σ) ≠ 1 has T/(ρ(σ) − 1)T ≅ O.

Require q∥N with π(f)_q an unramified twist of Steinberg, so that inertia acts unipotently on V_f (local–global compatibility).

Require ρ̄(I_q)≠1.

The algebraic core is hasRankOneCoinvariants_of_unipotent of §0.8. This section applies it to the actual inertia action, using local–global compatibility.

Local–global compatibility at q (AutomorphicGaloisRepresentations §6.4 (classical conductor, Steinberg monodromy and bad factors)) makes ρ(I_q) unipotent through the tame quotient.

For a unipotent u ≠ 1 mod ϖ on O², u − 1 has rank one modulo ϖ, so its image is a saturated rank-one submodule and the cokernel is free of rank one (elementary divisors).

The prime q is unramified in `Q(μ_{p^∞}),` so I_q ⊂ `G_{Q(μ_{p^∞})}.`

The source for this target is [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §2.5, pp.15–16; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), proof of Lemma 3.13, pp.26–27.

*Needs:* Mathlib `Matrix.toLin'`; AutomorphicGaloisRepresentations §6.4 (classical conductor, Steinberg monodromy and bad factors); §1.1.

**Checks.**

- The matrix [[1, ϖ],[0, 1]] is unipotent with cokernel O/ϖ ⊕ O of (u − 1): it is not free, which is why ρ̄(τ) ≠ 1 is needed.
- Applied with q = 11 for 11a1 at p = 7, this gives (Im) for Burungale–Castella–Skinner Theorem 1.1.2(b).
- Residual unipotence is insufficient even with determinant one: g = [[1,1],[ϖ,1+ϖ]] lies in SL₂(O), but det(g−1) = −ϖ ≠ 0, ker(g−1) = 0 and coker(g−1) ≅ O/ϖ. The characteristic-zero unipotence hypothesis is essential.

#### Euler factors and imprimitive-set comparison

Let D be an ordinary datum with trivial character, p ∤ N, and Σ' ⊂ Σ finite sets of primes not containing p, with Σ ∪ {p} containing the ramification set of T. If X^Σ is Λ-torsion and T* has no nonzero G_Q-invariants, then 0 → `(⊕_{ℓ∈Σ∖Σ'}` `H¹(Q_{∞,ℓ},` A))^∨ → X^Σ → `X^{Σ'}` → 0 is exact, each local term is torsion with no nonzero pseudo-null submodule and characteristic ideal `(P_{T,ℓ}(ℓ⁻¹γ_ℓ⁻¹)),` where `P_{T,ℓ}(Y)=det(1−Y·Frob_ℓ` | `V_{I_ℓ})` uses inertia coinvariants, with Frob_ℓ arithmetic and γ_ℓ its image in Γ; this is Skinner §2.3, pp.8–9, in the scalar-dual convention; hence char(X^Σ) = `char(X^{Σ'})·∏_{ℓ∈Σ∖Σ'}` `(P_{T,ℓ}(ℓ⁻¹γ_ℓ⁻¹)).` On the analytic side L_f^Σ = `L_f^{Σ'}·∏_{ℓ∈Σ∖Σ'}` `P_{T,ℓ}(ℓ⁻¹γ_ℓ⁻¹)` with the same factors. Therefore IMC^Σ(D) ⟺ `IMC^{Σ'}(D),` integrally and rationally, and the same holds for KMC with Σ-partial lines.

Assume the common larger imprimitive dual is torsion; the displayed exact sequences then imply torsion for the smaller duals. The Euler-factor calculation applies also to the specified weight-two multiplicative inertia condition, using Skinner §2.3; in that case it transports the characteristic-ideal equality itself, since IMC of §0.5 denotes the good ordinary case.

Here T*=Hom_cont(T,ℚ_p/ℤ_p) is the contragredient Pontryagin dual, not the Tate dual. Assume H⁰(G_ℚ,T*)=0, as follows from residual irreducibility; for T_pE this condition concerns E[p∞](−1).

The same polynomial `P_{T,ℓ}` must be used on both sides; using the Euler factor of V where that of its dual is meant breaks the equality.

For the displayed exact sequence require Σ ∪ {p} to contain the ramification set, as in SU Proposition 3.2.18. Comparisons between arbitrary Σ,Σ′ pass through a common larger set containing that set; no unconditional localization-surjectivity assertion is made.

For a large Σ containing every ramified prime other than p, use SU Proposition 3.2.18. For arbitrary finite sets, compare each with a common larger set and cancel the identical nonzero analytic/algebraic Euler factors in the domain Λ.

For torsion and absence of pseudo-null submodules use Skinner–Urban Lemma 3.2.17(i). For the explicit Euler generator use Skinner §2.3, pp.8–9: the coinvariant polynomial above evaluated at ℓ⁻¹γ_ℓ⁻¹. Skinner–Urban §2.1.2 instead calls geometric Frobenius `frob`; convert the Frobenius and group-ring arguments together rather than retaining the same symbol across both conventions.

Analytic side: ModularSymbolsPadicLFunctions §4.3 (Euler depletion with the specified coefficient embedding).

Multiplicativity of characteristic ideals in exact sequences: `PadicMeasuresIwasawaAlgebras` Layer 4 (charIdeal_mul_of_exact).

The source for this target is [Christopher Skinner and Eric Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Lemma 3.2.17 and Proposition 3.2.18, pp.26–27; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §2.3, pp.8–9, and remark after Conjecture 2.5.1, p.15.

*Needs:* §0.5 (definition only); §0.2; ModularSymbolsPadicLFunctions §4.3 (Euler depletion with the specified coefficient embedding); `PadicMeasuresIwasawaAlgebras` Layer 4; SelmerIwasawaCohomology §2.23 (primitive, imprimitive and strict condition-change triangles).

**Checks.**

- For ℓ ∥ N with split multiplicative reduction of E, P_ℓ has degree one, and the factor 1−ℓ⁻¹γ_ℓ⁻¹ appears on both sides (arithmetic Frobenius acts by 1 on the inertia-coinvariant Tate line); for ℓ of good reduction P_ℓ has degree two.
- At ℓ=11 with the group-ring variable specialized to γ_ℓ=2, the split multiplicative Euler factor is 1−11⁻¹·2⁻¹=21/22; replacing γ_ℓ⁻¹ by γ_ℓ would give 9/11. This rational witness fixes the inverse group-ring argument.
- Under H⁰(G_ℚ,T*)=0 and torsion for a common larger imprimitive dual containing the ramification set, the conjecture for one Σ gives it for every Σ′. These are hypotheses of the transfer, not consequences of its predicate.

Prove IMC.iff_of_sigma here: under these localization hypotheses for a common larger set, IMC^Σ(D)↔IMC^(Σ′)(D), integrally and rationally. Prove IMC.iff_extendCoefficients here as well. Finite coefficient change preserves these equalities: for O′/O finite, Λ′ is faithfully flat, char(M⊗O′)=char(M)Λ′ for torsion M, and equality descends. This uses the coefficient and local-condition base-change contracts, independently of any main-conjecture theorem.


### 1.3 The Skinner–Urban ordinary main conjecture

Let p ≥ 3, f ∈ S_k(Γ_0(N)) a newform with trivial character, ordinary at p with respect to L, p ∤ N, k ≡ 2 mod (p − 1), (irred) and (dist) for ρ̄, and a prime q ≠ p with q ∥ N and ρ̄ ramified at q. Then for every finite set Σ of primes not containing p, X^Σ is Λ-torsion and char_Λ(X^Σ) = (L_SU,f^Σ) = (c_f^+L_f^Σ) in Λ. Thus IMC_Q^Σ holds, and the full-symbol equality IMC^Σ holds integrally exactly when OrdinaryBettiSymbolUnit(f) holds. In weight two the residual hypotheses reduce to p ≥ 3, f ordinary, ρ̄ irreducible and a ramified q∥N; the distinction between period lattices remains.

Assume p≥3, trivial character and k≡2 mod p−1; the weight congruence is automatic for k=2.

(dist) is automatic in weight two for p odd, the cohomological quotient having inertia character ω⁻¹ while the sub-character is unramified.

For integrality, Skinner–Urban state the result under an SL₂(Z_p)-image hypothesis; Skinner §2.5 shows (irred) and the ramified q suffice, via §1.2.

Reverse divisibility (L_SU,f^Σ L_SU,(f⊗χ_K)^Σ) ⊃ Ch^Σ(f)Ch^Σ(f⊗χ_K) for an imaginary quadratic K in which p splits, the prime divisors of N/q split and q is inert: the GU(2,2) Eisenstein congruence argument of Skinner–Urban Theorem 3.6.1 and Corollary 3.6.3, owned by AutomorphicCongruences §1.11.

Kato's divisibilities (L_SU,f^Σ) ⊂ Ch^Σ(f) and (L_SU,(f⊗χ_K)^Σ) ⊂ Ch^Σ(f⊗χ_K) hold rationally by PadicFamilies §4.0.3; the integral source-period forms are required from KatoEulerSystems (gap:modular-zeta-extensions), with the rank-one-coinvariant hypothesis of §1.2 and the source period comparison of Skinner §2.5. Transport them to full-symbol notation as (c_f^+L_f^Σ) and (c_(f⊗χ_K)^+L_(f⊗χ_K)^Σ), respectively. Neither c is dropped in this assembly.

At every height-one prime the two Kato inclusions and the reverse product inclusion force equality of both valuations. Thus (L_SU,f^Σ)=Ch^Σ(f), and similarly for the twist (Skinner–Urban proof of Theorem 3.6.4). Substitute §0.9’s rational period identity only after this assembly. A full-symbol assembly using uncorrected functions instead requires OrdinaryBettiSymbolUnit(f) and OrdinaryBettiSymbolUnit(f⊗χ_K); a comparison for f alone does not justify rewriting the product endpoint.

Independence of Σ: §1.2 (Euler-factor comparison); the statement for Σ = ∅ follows.

The source for this target is [Christopher Skinner and Eric Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Theorem 3.6.4 and its proof, pp.43–44; Theorem 1, p.2; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), Theorem 2.5.2 and the following paragraph, pp.15–16; Theorem A, p.1; [Ashay Burungale, Francesc Castella and Christopher Skinner](https://arxiv.org/abs/2405.00270v2), §1.1, pp.1–2.

*Needs:* AutomorphicCongruences §1.11 (source Betti periods); PadicFamilies §4.0.3; KatoEulerSystems §4.3; KatoEulerSystems (gap:modular-zeta-extensions, including the source-period ordinary bound); §0.9 (period ratios for f and its quadratic twist); §1.2; §1.1; §0.5; §0.3.

**Checks.**

- E = 11a1, p = 7: k = 2, a_7 = −2 unit, (irred), q = 11 ∥ 11 with 7 ∤ ord_11(Δ) = 5. The source Betti equality holds; §3.2’s two Néron-period comparisons give c_f^+∈ℤ₇×, hence IMC holds integrally.
- E = 14a1, p = 13: q = 2 (13 ∤ 6) or q = 7 (13 ∤ 3) works; a_13 = −4 is a unit.
- For Ch(f)=Ch(f⊗χ_K)=(ϖX), L_SU,f=L_SU,(f⊗χ_K)=ϖX, both source inclusions and their product are equalities. Taking c_f^+=c_(f⊗χ_K)^+=ϖ gives L_f=L_(f⊗χ_K)=X, so both uncorrected integral equalities fail. Rationally ϖ is a unit and they hold.

### 1.4 The Fouquet–Wan ordinary theorem

Let p > 2, f ∈ S_k(Γ_0(N)) an eigencuspform with p ∤ N and k ≥ 2, such that: ρ̄_f is absolutely irreducible; (FW1.6_ℓ) holds for some ℓ ∥ N (in Fouquet–Wan's cohomological normalisation); and `ρ_f|G_{Q_p}` is an extension 0 → χ₁ → `ρ_f|G_{Q_p}` → χ₂ → 0 with χ̄₁ ≠ χ̄₂. Then char(H¹(Z[1/p], T ⊗ Λ_Iw)/Λ_Iw·z(f)_Iw) divides char(H²(Z[1/p], T ⊗ Λ_Iw)), and together with Kato's divisibility this gives `KMC^{η=1}` over Q_∞ (Fouquet–Wan Conjecture 1.5) integrally. This is the untwisted component KMC^1(T_K); the ordinary comparison of §1.5 uses the matched component KMC^1(T_K(1)) instead (§0.10).

Assume p>2, p∤N, trivial character and k≥2, without a congruence condition on k.

(FW1.6_ℓ) in cohomological normalisation; in weight two it means nonsplit multiplicative reduction at ℓ with ρ̄ ramified there.

Require the ordinary filtration to have distinct residual characters.

Kato's divisibility in this range: Fouquet–Wan Lemma 3.13 verifies its hypotheses (§0.8; KatoEulerSystems §4.3 and KatoEulerSystems (gap:modular-zeta-extensions)).

Reverse divisibility: Fouquet–Wan §4.8 — choose the auxiliary imaginary quadratic K as in Fouquet–Wan §4.6, prove the two-variable Rankin–Selberg Iwasawa–Greenberg main conjecture over K by reducing it, through Beilinson–Flach explicit reciprocity and Poitou–Tate, to the GU(3,1) divisibility Theorem 7.32, in weight k (Castella–Wan Theorem 3.8 in weight two); then descend with Kato's result. The whole reverse-divisibility route is owned by AutomorphicCongruences §2.21, which also needs KatoEulerSystems §§2.2 and 5.4 for its twist/factor separation.

Combine the two divisibilities at every height-one prime (§0.7, KMC.iff_reverse_divisibility).

No canonical-versus-Gross period comparison is used: §4.8 bypasses it, and the proof uses the stated Beilinson–Flach route.

The source for this target is [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Theorem 1.6 and the preceding paragraph, pp.6–7; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), §4.8, p.68; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), footnote 2, p.7.

*Needs:* KatoEulerSystems §4.3; KatoEulerSystems (gap:modular-zeta-extensions); AutomorphicCongruences §2.21; §0.7; §0.8; §1.1.

**Checks.**

- E = 14a1, p = 13, ℓ = 2: hypotheses hold (nonsplit at 2, 13 ∤ 6, χ̄₁ unramified ≠ χ̄₂ with inertia character ω⁻¹), so KMC holds for 14a1 at 13.
- E = 11a1, p = 7: (FW1.6_11) fails, so this theorem does not apply even though §1.3 does.

### 1.5 The ordinary Selmer form of the ordinary theorems

Assume the hypotheses of §1.4, trivial character and (irred), and take the reverse divisibility on the trivial tame component of T_K(1) from AutomorphicCongruences §2.21 with gap:tate-twisted-components. Then char_Λ(X) = (u_p(f)·L_f), where u_p(f) is the p-adic period defect of §0.9; in particular IMC(D) holds integrally if and only if KatoPeriodDefectUnit holds, and IMC_Q(D) holds with no period-unit hypothesis. Conversely, under the hypotheses of §1.3 the source equality char(X)=(c_f^+L_f) gives KMC on the matched component exactly when u_p(f)/c_f^+ is a unit. If a form satisfies both §1.3 and the hypotheses above, the two equalities force u_p(f)/c_f^+∈O^×, not that either factor is a unit. With OrdinaryBettiSymbolUnit(f) this also gives KatoPeriodDefectUnit and IMC (§0.10).

Assume good ordinarity, p∤N, p odd and trivial character.

Require (irred) and a rank-one unipotent element (§1.2) to work at the prime (ϖ).

Use Kato's good pair (ω,γ) for a stable O-lattice U of the cohomological realization, such as T_B of §0.9 (§0.9(3), with the period dictionary of KatoEulerSystems §6.3). Kato 17.6 writes U as the O-linear dual Hom_O(T',O)(1−k) of a lattice T' of V(f*) in his notation; the discrete dual T* of Conventions is p-primary torsion, and the O-linear dual of the Selmer lattice T has the wrong twist (see the Checks).

The only scalar between Kato's good-pair function and L_f is u_p(f) (§0.9(3)); it is carried into the analytic ideal rather than assumed to be a unit. A saturated rank-one lattice in each realisation alone does not decide it.

Kato's divisibility holds on every tame component (KatoEulerSystems §7.2 and gap:modular-zeta-extensions) and is moved to T_K(1) by KMC.twist; with the twisted reverse divisibility it gives KMC^1(T_K(1)). Apply §0.10 at every height-one prime, including (ϖ) by the rank-one quotient. This gives char(X) = (u_p(f)L_f). The untwisted KMC^1(T_K) of §1.4 is, by KMC.twist, the ω-component of T_K(1), so it is not this input.

For the converse direction, compare Skinner–Urban's char(X)=(c_f^+L_f) with §0.10’s char(X)=(u_p(f)L_f). Since L_f≠0, cancellation gives equality exactly when u_p(f)/c_f^+∈O^×.

Translate Fouquet–Wan's T and Λ_Iw into the datum D using the Hecke-dual twist dictionary in §0.1.

The source for this target is [Kazuya Kato](https://www.numdam.org/item/AST_2004__295__117_0.pdf), 17.4–17.6, pp.273–274, and 17.13, pp.279–280; [Christopher Skinner and Eric Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Theorem 3.5.6 and Theorem 3.6.4, pp.41–43; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Theorem 1.6, pp.6–7.

*Needs:* §0.9; §0.10; §1.4; §1.3; §0.7 (KMC.twist); AutomorphicCongruences §2.21 with gap:tate-twisted-components (reverse divisibility on T_K(1)); KatoEulerSystems §6.3 (period dictionary); ModularSymbolsPadicLFunctions §1.1 (integral period lines).

**Checks.**

- With u_p(f)=c_f^+=ϖ and L_f=X, the source equality and KMC on the matched component both give char(X)=(ϖX), but IMC would give (X) and fails. The ratio u_p(f)/c_f^+=1 is a unit.
- 14a1 at p=13 satisfies the hypotheses of both §1.3 (q=2 or q=7) and §1.4 (ℓ=2); its elliptic period comparisons in §3.2 make c_f^+ and u_p(f) units; independently, §3.2 identifies this defect with a Néron/canonical period ratio that is a 13-adic unit.
- If u_p(f) = ϖ, the matched-component theorem gives char(X) = (ϖL_f) and IMC(D) fails; an unconditional transfer KMC ⇒ IMC would be false for such a form.
- Rationally the defect disappears: IMC_Q(D) follows from the matched-component theorem with no period-unit hypothesis.
- Good-pair lattice at weight two, p=3, κ(g)=4: the cohomological lattice T_B=T_pE^∨≅T_pE(−1) has determinant κ⁻¹, value 1/4, whereas the O-linear dual of the Selmer lattice twisted by 1−k, Hom(T_pE,Z_p)(−1)≅T_pE(−2), has determinant κ⁻³, value 1/64≠1/4. The discrete dual T*(−1)=E[p^∞](−2) is p-primary torsion and has no O-basis at all. Neither substitute is the lattice of Kato 17.5.

### 1.6 Hida approximation of a p-new weight-two form

Let p ≥ 3 and let f ∈ S_2(Γ_0(N)) be a newform with N = pM, p ∤ M, ordinary at p (so a_p = ±1), with (irred) for ρ̄_f and a prime q ∥ M at which ρ̄_f is ramified. After replacing L by a finite extension, for every integer m > 0 there are: (a) a newform f_m ∈ `S_{k_m}(Γ_0(M))` with Q(f_m) ⊂ L, k_m > 2, k_m ≡ 2 mod p − 1 and a_p(f_m) ∈ O^×; (b) a G_Q-stable lattice `T_{f_m}` ⊂ `V_{f_m}` and an O[G_Q]-isomorphism T_f/p^mT_f ≅ `T_{f_m}/p^mT_{f_m}` carrying T_f^+/p^m onto `T_{f_m}^+/p^m;` (c) for every finite set Σ of primes not containing p and containing every prime dividing M, the equality of Λ-ideals (L_f^Σ, p^m) = `(L_{f_m}^Σ,` p^m), with L^Σ the imprimitive function of §0.4 (Skinner's sets are Σ∪{p}). Moreover `ρ̄_{f_m}` ≅ ρ̄_f, so each f_m satisfies the hypotheses of §1.3 with the same q.

Assume p ≥ 3, weight two, trivial character and p ∥ N.

The canonical analytic assertion (c) uses gap:approximant-period-units. Without this integral period input the output is the corrected-ideal congruence below; the lattice and weight assertions have no such condition.

Assume (irred) and the p-distinguished condition on the ordinary filtration, which is automatic here: the two characters of ρ̄_f|D_p are an unramified character and its product with ω⁻¹ in the cohomological normalisation, and ω ≠ 1 for p ≥ 3.

The tame level M is at least 2, because q ∣ M, so Γ_1(Mp^r) is torsion-free for every r ≥ 1 (3M ≥ 6 ≥ 4 when p = 3).

Congruence (c) is an equality of ideals; no congruence of chosen analytic generators modulo p^m is asserted, because the family periods are defined only up to units and Skinner's Proposition 2.6.1 compares the specialised family function with `L_{f_m}^Σ` only up to a unit u_m ∈ O^×. The precision r_m below controls the weights, and (b) is a congruence of lattices with their ordinary lines; neither is implied by congruent q-expansions alone.

The usable interface consists of the following named outputs.

- hidaApproximant: for each m, the newform f_m with (a).
- hidaApproximant_lattice: the isomorphism (b) of lattices and ordinary lines modulo p^m.
- hidaApproximant_periodComparison: for each approximating point λ, retain the fractional correction ideal C_λ of PadicFamilies §1.4 relative to the saturated period normalization of §0.4. A perfect integral dual/divided-power pairing and saturated controlled eigensymbol lattice imply C_λ=O; these hypotheses are exactly gap:approximant-period-units.
- hidaApproximant_padicL: with C₀ and C_m retained, the congruence of corrected ideals (C₀ L_f^Σ,p^m)=(C_m L_(f_m)^Σ,p^m), after multiplying both functions and the modulus p^m by the same nonzero common denominator. The canonical ideal congruence (c) follows when both correction ideals are units.
- hidaApproximant_sourcePadicL: in the Betti-period normalization of Skinner Proposition 2.6.1, (L_SU,f^Σ,p^m)=(L_SU,f_m^Σ,p^m) for the same approximants. Equivalently retain c_f^+ and c_f_m^+ on the two full-symbol functions; no unit comparison with the full-symbol lattice is part of this assertion.
- hidaApproximant_residual: `ρ̄_{f_m}` ≅ ρ̄_f, irreducible and ramified at q.

**Hida's family through f.** Use PadicFamilies §0.17, ordinaryCuspidal_control_oddPrime, at every odd p, with its Layers 1 and 4 supplying the primitive branch and its Galois representation. This provides the branch R through f and its classical specializations, including p=3, under the residual hypotheses stated here (Skinner §2.6; EPW Theorem 2.1.2).

**Weights close to 2.** Following Greenberg–Stevens, R embeds into the ring of power series in x − 2 converging on a disc of radius `p^{−c},` with φ₀ evaluation at x = 2. Hence for k_m ≡ 2 mod `(p−1)p^{r_m},` with r_m large, `φ_{k_m}` ≡ φ₀ mod p^m, which gives a_ℓ(f_m) ≡ a_ℓ(f) mod p^m for all ℓ ≠ p (Skinner §2.6, p.17).

**Lattices.** Under (irred) the family carries a free rank-two R-module with Galois action whose specialisations are lattices T_f, `T_{f_m},` congruent modulo p^m; the ordinary line is a free rank-one R-summand because the residual characters are distinct (Skinner (2.6.1)–(2.6.2), p.18). This is the family representation and saturated ordinary line of PadicFamilies §§4.1–4.2 for every odd p, using §0.17.

**p-adic L-functions.** PadicFamilies §§1.4–1.6 supplies a family function in its quotient-period convention. Write its specialization at λ as u_λ C_λ L_λ in fractional-ideal notation, with u_λ a unit and C_λ the correction ideal relative to §0.4; a scalar representative may be chosen after a common coefficient extension and denominator clearing. Continuity compares these corrected functions, and hence the corrected ideals just stated. Prove hidaApproximant_periodComparison before applying hidaApproximant_padicL in canonical normalization: verify the perfect integral pairing and saturation supplied by gap:approximant-period-units, obtaining C₀=C_m=O. Skinner Proposition 2.6.1 gives a unit in his canonical convention, not an unconditional identification of a different saturated period lattice. Rational interpolation alone cannot remove C_λ. Separately, Skinner Proposition 2.6.1 gives hidaApproximant_sourcePadicL in his own Betti-period convention. Its proof uses the controlled source eigensymbol lattice, and its congruence retains the factors c_f^+ and c_f_m^+ upon translation to §0.4. It is this source-period congruence that §1.7 uses with §1.3; the full-symbol congruence (c) remains conditional on gap:approximant-period-units.

The source for this target is [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §2.6, pp.16–18, and §3.1 (a)–(d), pp.18–19; [Matthew Emerton, Robert Pollack and Tom Weston](https://arxiv.org/pdf/math/0404484v1), Theorem 2.1.2, pp.7–8, and Proposition 4.1.4, p.30 (arXiv v1 numbering).

*Needs:* §0.1; §0.4; §1.1; PadicFamilies (gap:approximant-period-units); PadicFamilies §0.17 (`ordinaryCuspidal_control_oddPrime`); `PadicFamilies` Layer 1 (§§1.5–1.6, 1.12); PadicFamilies §§4.1–4.2 (big representation and ordinary filtration); ModularSymbolsPadicLFunctions §4.3 (Euler depletion with the specified coefficient embedding).

**Checks.**

- 11a1 at p = 11 (split multiplicative, a_11 = 1, M = 1): there is no prime q ∥ M, so the target does not apply; the hypothesis q ∥ M is what makes Γ_1(Mp^r) torsion-free when p = 3 as well.
- At p = 3 with M = 2, the level 3^r·2 ≥ 6 gives a torsion-free Γ_1, so the control theorem is available; at tame level M = 1 and p = 3 the group Γ_1(3) has torsion and the target makes no claim.
- The weights satisfy k_m > 2, so f_m is new of level M prime to p; the weight-two point itself is p-new, and its p-stabilisation is f, not an oldform.
- For odd p, (p^m,X)=(p^m,2X), although X and 2X differ modulo p^m for every m>0: the coefficient of X differs by 1. Thus ideal congruence does not select congruent generators. By contrast, X and X+ϖ^m are congruent modulo ϖ^m and cannot detect that ambiguity.
- PadicFamilies §0.17 supplies control for p=3 as well. A residual isomorphism gives only a comparison modulo ϖ: if p=uϖ^e with e>1, modulo p means modulo ϖ^e and is strictly stronger. The approximation needs the full lattice and ordinary-line comparison modulo p^m and the integral period comparison, rather than residual congruence alone.
- With L_SU,f=L_SU,f_m=ϖX, c_f^+=ϖ and c_f_m^+=1, the source ideals agree modulo p^m for all m, whereas the full-symbol ideals (X,p^m) and (ϖX,p^m) differ for m large. This tests the independent source-period assertion.
- If a period correction is C_m=(ϖ) and C₀=O, a corrected ideal can equal (ϖX) although the canonical ideal is (X). Inverting ϖ hides this difference; a unit correction is necessary for the canonical congruence.
- Over F₉ a generator has order eight and its square has order four, so the assertion that every nonzero characteristic-three residue squares to one is false. The elliptic ā₃ calculation uses F₃ specifically.
- Σ convention: Skinner's set always contains p, and the corresponding set here is that set with p removed. A factor at p has no meaning in the product of §0.4, since p is ramified in ℚ∞ and has no Frobenius γ_p in Γ; the behaviour at p is already the interpolation factor e of §0.4.

### 1.7 Skinner's theorem for multiplicative reduction

Let p ≥ 3 and f ∈ S_2(Γ_0(N)) a newform with p ∥ N (so f is ordinary at p, k = 2, and a_p = ±1), L/Q_p as in the datum, (irred) for ρ̄_f, and a prime q ≠ p with q ∥ N and ρ̄_f ramified at q. Then for every finite Σ not containing p, X^Σ is Λ-torsion and char_Λ(X^Σ)=(L_SU,f^Σ)=(c_f^+L_f^Σ) in Λ, where X^Σ uses the inertia-kernel condition of §0.2 and the ordinary line of the Steinberg representation at p. The source function has Skinner’s Betti periods and the trivial zero when a_p=1. The full-symbol equality char(X^Σ)=(L_f^Σ) holds exactly when OrdinaryBettiSymbolUnit(f) holds; the rational equality needs no unit hypothesis.

Assume p≥3, p∥N, weight two and trivial character.

Require (irred) and a ramified q∥N with q≠p.

The p ∤ N seed is §1.3 in weights k_m>2, k_m≡2 mod (p−1)p^(r_m) on level N/p, where r_m is chosen to give the precision p^m and may be increased to at least m. It is applied only after the lattice congruence modulo p transports the irreducibility and ramified-prime hypotheses.

Reductions: it suffices to prove the statement after a finite extension of L and for Σ containing all primes dividing N/p, with p∉Σ as always, using faithful flat change of characteristic ideals (`PadicMeasuresIwasawaAlgebras` Layer 4) and the Σ-change of Skinner §2.3 (SelmerIwasawaCohomology §2.23 (primitive, imprimitive and strict condition-change triangles)); these are the comparison theorems of §1.2, using its localization and faithful-flatness hypotheses.

Hida theory, for every p ≥ 3 including p = 3: §1.6 supplies newforms f_m of level N/p and weights k_m > 2, k_m ≡ 2 mod (p − `1)p^{r_m},` an isomorphism T_f/p^m ≅ `T_{f_m}/p^m` identifying T_f^+/p^m with `T_{f_m}^+/p^m` at `G_{Q_p},` and the source-period ideal congruences (L_SU,f_m^Σ,p^m)=(L_SU,f^Σ,p^m) of hidaApproximant_sourcePadicL. The separate full-symbol congruence requires gap:approximant-period-units; it is not needed for the source-period theorem. Congruent q-expansions alone are not the Selmer comparison used here, and an exact equality of chosen analytic generators modulo p^m is not asserted.

Greenberg's theorem (§0.3) gives Ch^Σ(f_m) = Fitt(X^Σ(f_m)); the congruence gives Sel^Σ(f)[p^m] ≅ Sel^Σ(f_m)[p^m], hence (Fitt(X^Σ(f)),p^m)=(Ch^Σ(f_m),p^m)=(L_SU,f_m^Σ,p^m)=(L_SU,f^Σ,p^m) for every m.

Since L_SU,f^Σ≠0, Fitt(X^Σ(f))≠0, so X^Σ(f) is torsion, Greenberg’s theorem gives Ch^Σ(f)=Fitt, and principal ideals agreeing modulo every p^m are equal. Translate afterwards by L_SU,f^Σ=c_f^+L_f^Σ. Removing c_f^+ requires OrdinaryBettiSymbolUnit(f).

The source for this target is [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), Theorem A, pp.1–2, and §2.3, pp.8–12; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §1, pp.3–4, §2.6, pp.16–18, Proposition 2.6.1 and (2.6.1)–(2.6.3), and §3.1, pp.18–19.

*Needs:* §1.3; §1.6; §0.3; SelmerIwasawaCohomology §3.21 (Fitting/characteristic under the structure criterion).

**Checks.**

- For E with split multiplicative reduction at p, L_f has a trivial zero at the trivial character and the theorem is consistent with Greenberg–Stevens (§5.7): (γ − 1) divides both sides.
- At p=3 PadicFamilies §0.17 supplies control and §1.6 supplies the approximation. Source-period congruences give the corrected equality. The full-symbol approximation additionally requires gap:approximant-period-units, and a full-symbol endpoint obtained from the source equality requires c_f^+∈O^×.
- With c_f^+=ϖ and L_f=X, the source conclusion is char(X^Σ)=(ϖX), of μ=1. Replacing the period by the full-symbol one would predict (X), of μ=0. With c_f^+=2 at odd p these ideals agree.

### Examples

The standard unipotent u = [[1,1],[0,1]] has (u−1)(x,y) = (y,0), so its coinvariants are O, with quotient map (x,y) ↦ y. Replacing the upper-right entry by ϖ gives O/(ϖ) ⊕ O. The matrix g = [[1,1],[ϖ,1+ϖ]] has determinant 1 and reduces to u, but det(g−1) = −ϖ; thus its coinvariants are torsion and it is not an acceptable characteristic-zero witness. For an elliptic curve at p=3 its ordinary coefficient ā₃ lies in F₃×={±1}, so ā₃²=1, so the ordinary elliptic local exclusion used in Layer 2 always fails; Layer 1’s ordinary theorem has no such restriction.

### Dependencies

Use Layer 0; ArithmeticGaloisRepresentations for residual representations and local types; PadicHodgeTheory §9.3 for the Tate parameter and ArithmeticGaloisRepresentations §6.3 for the multiplicative inertia criterion; KatoEulerSystems §§4.3 and 7.2 with KatoEulerSystems (gap:modular-zeta-extensions) for the forward divisibility; AutomorphicCongruences §§1.11 and 2.21 for the separate reverse bounds, with gap:tate-twisted-components for the reverse bound on T_K(1) in §1.5; and PadicFamilies §0.17 and Layers 1 and 4 for the Hida approximation of §1.6.


## Layer 2: the pointwise cohomological theorem

### 2.1 Fouquet–Wan conventions against the modular Iwasawa datum

Let f ∈ S_k(Γ_0(N)) with trivial character. Fouquet–Wan's T(f) ⊂ `M(f)_{et,p}` is a lattice in the cohomological realisation, with det ρ_f = χ_cyc¹⁻ᵏ, and their Λ_Iw-adic objects are RΓ_et(Z[1/p], T(f) ⊗ Λ_Iw), Δ(M(f))_Iw and the {p}-partial zeta morphism z(f)_Iw : T(f)_Iw(−1)^+ → H¹(Z[1/p], T(f)_Iw). Under the dictionary T(f) ↔ Kato's T_K (KatoEulerSystems §2.2) and Λ_Iw ↔ the η = 1 quotient Λ of Λ(G_∞), these are the objects H^i(T_K), Δ_Iw(T_K) and triv_z of §0.6, and Fouquet–Wan's Conjecture 1.5 for M(f) is `KMC^{η=1}(T_K).` This is the target KMC.fw_form, placed after the convention comparison. Their Conjecture 1.5 for a Tate twist M(f)(r) is KMC^1(T_K(r)), which by KMC.twist is the ω^(−r)-component of T_K with γ transported by Tw_r; for r≢0 mod p−1 it is a different statement. The ordinary comparison uses r=1 (§0.10), the signed comparison r=k−1 (§0.13) and the central-critical comparison below r=k/2. The half-weight twists `χ_cyc^{1−k/2},` `χ_cyc^{−k/2}` in Fouquet–Wan's local hypothesis are integral powers because k is even for trivial character. More precisely z(f)_Iw = `(∏_{ℓ∈Σ∖{p}}` Eul_ℓ(V_f^*(1)))⁻¹ z(f)_Σ,Iw in the total fraction algebra (Proposition 3.28, p.35); the local determinant corrections must accompany this formula integrally.

Assume trivial nebentypus, so k is even.

The dictionary of Hecke actions and twists is the one fixed in KatoEulerSystems §2.2; no other convention is introduced here.

Compare Fouquet–Wan §1.1.1 (pp.4–5) and Definition 3.3/Theorem 3.4 (p.23) with Kato §12 and the datum's conventions term by term.

Fouquet–Wan's T(f)_Iw is T(f) ⊗ Λ_Iw with the Galois action twisted through Γ_Iw, matching Kato's j_*-limit over `Q(ζ_{p^n})` projected to the η = 1 component (Shapiro, SelmerIwasawaCohomology §3.2 (Iwasawa Shapiro and inverse tautological action)).

The Σ-partial versus {p}-partial comparison uses the Euler factors of Fouquet–Wan Definition 3.8, nonzero by Lemma 3.11.

For the central-critical application define T_cc=T(f)(r), V_cc=M(f)_et,p(r) and A_cc=V_cc/T_cc, with r=k/2. The target centralCriticalComparison identifies C_cc=RΓ_et(ℤ[1/p],T_cc⊗Λ), with inverse tautological Γ-action, its fundamental line and its zeta morphism z_cc,Iw with the correctly twisted full-tower objects. Its Betti factor is T(f)(r−1)^+, rather than the untwisted T(f)(−1)^+; all Euler-correction lines and local finite conditions are transported too. The inverse determinant and this Betti factor together form the line whose trivialization is used in §5.4.

Explicitly, on R=O[Δ][[Γ]] let tw_r send [g] to κ(g)^r[g]. After choosing a basis of O(r), the coefficient map T(f)(r)⊗R→T(f)⊗R, t⊗λ↦t⊗tw_r(λ), is tw_r-semilinear and Galois-equivariant for the inverse tautological action. Its inverse transports the full zeta morphism to T(f)(r). Augmentation of the twisted trivial tame component corresponds on the original algebra to [δg]↦ω(δ)^(−r)κ(g)^(−r). Thus the original component is ω^(−r) and the original Γ-value is κ(γ)^(−r). Twisting only Γ omits the tame factor; starting with only e₁ of the untwisted complex cannot supply this comparison.

The API of centralCriticalComparison includes the semilinear cohomology comparison and its derived base change, the induced Betti/fundamental-line and zeta-morphism squares, compatibility with the finite local conditions and reciprocity, and the specialization/control sequence for A_cc. The arithmetic equality for C_cc is the central-critical part of AutomorphicCongruences §4.5 with gap:central-critical-specialization; KatoEulerSystems supplies the typed twist, reciprocity and control adapters of that contract. These are the exact inputs to the two cases in §5.4(2) (Fouquet–Wan §3.1.1, equations (3.1.1)–(3.1.5), pp.21–22, and Corollary 5.3, p.69).

The source for this target is [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), §1.1.1, pp.3–5; Theorem 1.7, p.7; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Definition 3.3, p.23, Theorem 3.4, p.24; Definition 3.8, Lemma 3.11, p.25.

*Needs:* KatoEulerSystems §2.2 (dual/Hecke/twist dictionary); SelmerIwasawaCohomology §3.2 (Iwasawa Shapiro and inverse tautological action); §0.6; §0.7; §0.1. For centralCriticalComparison additionally use KatoEulerSystems and AutomorphicCongruences §4.5 with gap:central-critical-specialization (the full-tower maps and central-critical equality just specified), and SelmerIwasawaCohomology §§2.1–2.2, 3.3, 3.11 for finite local conditions and derived control.

**Checks.**

- For f = f_E of weight two, T(f) = T_pE^∨ = Hom(T_pE, Z_p), while the datum's T ≅ T_pE; the dictionary is the Weil pairing and the Tate twist by one. Hence Fouquet–Wan's Conjecture 1.5 for M(f) is the trivial component of T_pE^∨, and the trivial component of T_pE, used by the ordinary and signed comparisons, is its ω^(−1)-component.
- Fouquet–Wan's residual hypotheses on ρ̄_f are read in this cohomological normalisation (§1.1).
- For k=2 and κ(g)=4, det T(f)(g)=4⁻¹=1/4 while det T_cc(g)=4^(−1+2)=4; T_cc=T_pE^∨(1)≃T_pE. Untwisted augmentation still gives 1/4 and cannot give T_pE.
- At p=5, r=1 and δ=−1, the original tame evaluation is (−1)⁻¹=−1 and the Γ-evaluation is 6⁻¹, whereas untwisted augmentation gives (1,1). At r=2 the tame value becomes 1 but the Γ-value is still 6⁻², not 1; a trivial tame character does not eliminate the Tate twist.
- On the coefficient module, κ(g)^rρ(g)t⊗tw_r([g]⁻¹)=ρ(g)t⊗[g]⁻¹ since κ(g)^rκ(g)^(−r)=1. This checks equivariance and the negative sign in the pre-transport evaluation.
- Complex conjugation acts on O(r−1) by (−1)^(r−1). For r=1 the Betti factor is T(f)^+, while for r=2 it selects T(f)^− after trivializing the Tate line; keeping T(f)(−1)^+ in both cases would select the wrong sign at r=1.

### 2.2 The Fouquet–Wan pointwise main conjecture

Let p ≥ 3, F a finite field of characteristic p and ρ̄ : G_Q → GL₂(F) absolutely irreducible and odd, satisfying: (LocExc_p); and for some ℓ ≠ p, (FWexp_ℓ(μ)) — a ramified extension 0 → `μχ̄_cyc^{1−k/2}` → ρ̄|D_ℓ → `μχ̄_cyc^{−k/2}` → 0 with μ unramified quadratic (possibly trivial), and μ nontrivial if `ρ̄|G_{Q_p}` is irreducible. Let f ∈ S_k(Γ_0(Np^r)) be a normalised eigencuspform of weight k ≥ 2 with ρ̄_f ≅ ρ̄ and ℓ ∥ N. Then `KMC^{η=1}` holds for f integrally: the zeta morphism induces `Δ_{O_Iw}(T(f)_Iw)` ≅ O_Iw (Fouquet–Wan Conjecture 3.24 = 1.5). In particular this holds for every reduction type of f at p (crystalline, semistable, potentially semistable; principal series, Steinberg or supercuspidal π(f)_p).

Assume p≥3, k≥2 even and trivial nebentypus. Theorem 5.1 permits level Np^r; μ is an unramified quadratic character, allowed to be trivial when the local representation at p is reducible.

The scalar semisimplification is automatically excluded: det ρ̄_f = χ̄_cyc^(1−k) has odd exponent, whereas a scalar semisimplification has square determinant on tame inertia (Fouquet–Wan remark following Theorem 5.1, p.69).

Assumption 2.1(1), absolute irreducibility over Q(√p*), follows from the genuine ramified unipotent at ℓ; Assumption 3.5 follows from (LocExc_p).

The proof is owned by AutomorphicCongruences §4.5: the universal-family theorem (§4.1) at points of X^sm via ordinary/crystalline-short points and the GU(3,1) congruence, propagated to all classical points by the height-one descent of Fouquet–Wan §§5–6.

State the endpoint in the datum's conventions: translate by §2.1, and check the residual hypotheses with §1.1.

Derive Assumption 2.1(1) from the ramified unipotent at ℓ (the image of `G_{Q(√p*)}` contains ρ̄(I_ℓ), and an induced-from-quadratic image has no nontrivial unipotent elements for p odd).

The source for this target is [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Theorem 1.7, p.7; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Theorem 5.1, p.68; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Assumption 2.1, p.17, and Theorem 1.1, p.3; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Remark immediately after Theorem 5.1, p.69.

*Needs:* AutomorphicCongruences §4.5; §2.1; §1.1; §0.7.

**Checks.**

- E = 14a1, p = 5 (supersingular, a_5 = 0): `ρ̄|G_{Q_5}` is irreducible, so (LocExc_5), (ScalarExc_5) hold; ℓ = 2 is nonsplit (μ nontrivial) and 5 ∤ ord_2 Δ = 6, so ρ̄ is ramified at 2; ρ̄ is absolutely irreducible (no rational 5-isogeny). KMC holds for 14a1 at p = 5.
- E = 11a1, p = 7: `ρ̄|G_{Q_7}` is reducible (ordinary), so Theorem 5.1 allows μ trivial at ℓ = 11 (split); with 7 ∤ 5 and ā_7² = 4 ≠ 1 the hypotheses hold, while the introduction's Theorem 1.7 (μ nontrivial) does not apply.

### 2.3 Ordinary and signed consequences of the pointwise theorem

Let f satisfy the hypotheses of §2.2, so that Theorem 5.1 gives KMC^1(T_K), and take the Tate-twisted equalities KMC^1(T_K(1)) and KMC^1(T_K(k−1)) from AutomorphicCongruences §4.5 with gap:tate-twisted-components. (1) If moreover p ∤ N, f is ordinary at p, (dist) holds and ρ̄ satisfies (Im), then char_Λ(X) = (u_p(f)·L_f) for the ordinary datum of f; hence IMC_Q(D) holds, and IMC(D) holds integrally exactly when KatoPeriodDefectUnit holds (§0.9). (2) If moreover p ∤ N, f is supersingular at p with LLZ's (A) (k ≥ 3 or a_p = 0), and (E) holds, then for the LLZ basis the signed main conjectures `SMC^{1,η=1}` and `SMC^{2,η=1}` hold integrally; without (E) they hold rationally. (3) Under the hypotheses of (2), the untwisted KMC^1(T_K) alone gives, through KMC.twist with r=k−1 and §0.13, the index-one signed conjecture `SMC^{1,ω^{k−1}}` on the component η=ω^(k−1), integrally with (E) and rationally without it; it gives no index-two statement, since LLZ allow i=2 only for η=1 and ω^(k−1)≠1. Nothing is asserted about a bounded scalar p-adic L-function at points where none exists (infinite slope, supercuspidal π(f)_p).

(1) needs the comparison hypotheses of §0.10.

Assertion (2) needs the hypotheses of §0.13; the two hypothesis sets are intersected, not merged.

For (1), apply §0.10 to KMC^1(T_K(1)), the matched component; its analytic term is u_p(f)·L_f by §0.9.

For (2), apply §0.13 (LLZ Corollary 6.6) to KMC^1(T_LLZ)=KMC^1(T_K(k−1)). For (3), KMC.twist turns KMC^1(T_K) into `KMC^{ω^{k−1}}(T_LLZ)`, and §0.13 converts it for i=1.

The source for this target is [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Theorem 1.7 and the discussion after it, pp.7–8; [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), Corollary 6.6, p.44; [Kazuya Kato](https://www.numdam.org/item/AST_2004__295__117_0.pdf), 17.13, pp.279–280.

*Needs:* §2.2; §0.7 (KMC.twist); §0.9; §0.10; §0.13; AutomorphicCongruences §4.5 with gap:tate-twisted-components.

**Checks.**

- (2) applies to E = 14a1 at p = 5: (A) since a_5 = 0, (E) since the mod-5 representation is surjective; with KMC^1(T_pE), which in weight two is also the central-critical equality, the LLZ actual-image equalities `SMC^{1,1}`, `SMC^{2,1}` hold for this basis. Theorem 5.1's KMC^1(T_pE^∨) alone gives `SMC^{1,ω}` by (3). Their kernel identification is Kobayashi’s, with index 1 minus and index 2 plus; the separately Néron-normalised Pollack analytic equalities also need §4.5’s integrality of the multipliers a^±.
- For E = 11a1 at p = 7, Theorem 5.1 supplies KMC^1(T_pE^∨) independently of §1.3; with the matched equality KMC^1(T_pE) of gap:tate-twisted-components, (1) gives char(X) = (u_7(f_E)L_f). Here u_7(f_E) is a unit by the elliptic case of §3.2 (optimal curve, Manin constant 1), so (1) recovers MMC(11a1,7) integrally; in general weight the pointwise theorem alone does not decide the defect.
- At k=2 and p=5 the component of T_K matched with the trivial signed and ordinary components is ω^(−1), with value −1 at δ=−1; the component of Theorem 5.1 has value 1 there. Replacing (1) or (2) by a direct application of Theorem 5.1 would compare different components.

### Examples

For 11a1 at p=7, the residual representation is locally ordinary and the auxiliary prime 11 is split multiplicative. The ordinary Fouquet–Wan theorem in §1.4 does not apply, because its decomposition invariants at 11 do not vanish. Theorem 5.1 allows the trivial unramified quadratic μ in the locally reducible case, so the pointwise theorem does apply. Its conclusion is KMC^1(T_K) for T_K=T_pE^∨. The ordinary analytic form char(X) = (u_p(f)L_f) of §2.3(1), with u_p(f) the defect of §0.9, uses the matched component KMC^1(T_pE) instead.

### Dependencies

Use Layer 0’s cohomological formulation and Layer 1’s residual predicates. The pointwise arithmetic endpoint is the AutomorphicCongruences §4.5 contract, with gap:tate-twisted-components for the Tate-twisted components used in §2.3. Its proof may use its own family theorem, but that endpoint is an imported theorem here, so the formulation in this layer does not create a dependency cycle with Layer 4.


## Layer 3: ordinary elliptic curves

### 3.1 Elliptic curves against their newforms: lattices and periods

Let E/Q have conductor N and newform f_E (EllipticCurveModularity R29.6 (`modularity`)), and fix φ_E:X₀(N)→E through a Q-isogeny `λ:A_{f_E}→E` with φ_E^*ω_E=c_φ·2πif_E(z)dz (R29.5, `modularParametrisation`). Then (1) take λ_*⁻¹(T_pE) in `V_p(A_{f_E})` and its cohomological dual for T_f; the determinant twist of §0.1 identifies T with T_pE. (2) Let P_abs^± be the differential periods from the saturated f_E-line of H¹(X₀(N),Z_(p))^±. For the X₀(N)-optimal curve, surjectivity of `φ_{E,*}` on integral homology gives Ω_E^±=±c_φu^±P_abs^± with u^±∈Z_(p)^×. The full-symbol differential periods `P_{f_E}^±` of §0.4 instead satisfy `P_{f_E}^±=r_E^±P_abs^±` with the explicit nonzero rational ratio r_E^± from gap:manin-period-comparison. Consequently `P_{f_E}^±/Ω_E^±=±r_E^±/(c_φu^±);` optimality supplies no unit condition on r_E^±. (3) If p>2 is semistable for E and φ_E is optimal, p ∤ c_φ (GrossZagierAndArithmeticHeights §3.7). For any isogenous curve also retain the rational period ratio of the isogeny, whose p-part divides a power of the p-part of its degree. These assertions distinguish the absolute and full-symbol lattices at every odd p.

The elliptic datum constructor ModularIwasawaDatum.ofEllipticCurve belongs here, after the inverse-image lattice comparison: use L=ℚ_p and T≅T_pE, with T⁺ the formal-group line at good ordinary p. Its inputs are the abstract datum of §0.1 and EllipticCurveModularity R29.4–R29.6, and it supplies the elliptic specializations in §§3.2–3.3.

E/Q, N its conductor, f_E the attached newform.

Let p be odd, so that the ± parts of a Z_(p)-lattice split. At every such p, including p = 3, H¹(X_0(N), Z_(p)) is the parabolic cohomology of Γ_0(N) with Z_(p) coefficients used here for P_abs^±: the weight-two coefficients are trivial and torsion-free, so H¹(Γ_0(N), Z_(p)) = Hom(Γ_0(N), Z_(p)), every such homomorphism kills −1 and the elliptic elements, which have finite order and normally generate the kernel of Γ_0(N) → π_1(Y_0(N)(C)), hence it equals H¹(Y_0(N)(C), Z_(p)), and vanishing on the parabolic elements cuts out H¹(X_0(N)(C), Z_(p)). The connecting map from full symbols to this parabolic cohomology need not identify their saturated eigensublattices integrally. Its fractional ratio r_E^±, including the cusp/boundary correction, is part of gap:manin-period-comparison.

The isogeny λ is part of the data; for the X_0(N)-optimal curve λ = id.

The unit assertion in (3) needs p>2, E semistable at p and φ_E optimal; otherwise c_φ is only an integer.

Modularity and the parametrisation: EllipticCurveModularity R29.6 (`modularity`) and R29.5 (`modularParametrisation`).

Use EllipticCurveModularity R29.4 (rational Tate-module comparison) rationally, then choose λ_*⁻¹(T_pE) in `V_p(A_{f_E})` and its corresponding cohomological dual lattice. Although λ_* is a rational isomorphism, `λ_*T_p(A_{f_E})` can be a proper sublattice of T_pE when p divides deg λ.

Periods: φ_E^*ω_E = c_φ·2πi f_E(z)dz; since `φ_{E,*}` is surjective on H_1 for the optimal curve, φ_E^* is injective on H¹ with torsion-free cokernel, so φ_E^*H¹(E(C), Z_(p))^± is a saturated rank-one sublattice of the f_E-part, hence equal to it; pairing gives the period relation. This argument determines P_abs^±. To reach P_f^±=−2πiΩ_f^± from ModularSymbolsPadicLFunctions §1.1, multiply by r_E^±. The rational comparison and any non-Eisenstein unit assertion are supplied by the period owner; surjectivity on absolute homology alone proves neither.

Manin constant: GrossZagierAndArithmeticHeights §§3.5, 3.7 and 3.10; the comparison with the modular-symbol period lines is gap:manin-period-comparison.

The source for this target is [Pierre Colmez](https://www.numdam.org/item/SB_2002-2003__45__251_0.pdf), Theorem 0.20, p.258; Theorem 0.8, p.255; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), remark after Corollary 1.10, p.9; [Ashay Burungale, Francesc Castella and Christopher Skinner](https://arxiv.org/abs/2405.00270v2), §1.1, pp.1–2; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §2.4 footnote 6, p.14.

*Needs:* EllipticCurveModularity R29.6 (`modularity`); EllipticCurveModularity R29.5 (`modularParametrisation`); EllipticCurveModularity R29.4 (rational Tate-module comparison); ModularSymbolsPadicLFunctions §1.1 (integral period lines); GrossZagierAndArithmeticHeights §§3.5, 3.7 and 3.10 (Manin constant, integrality and p-unit range, isogeny transfer); GrossZagierAndArithmeticHeights (gap:manin-period-comparison); §0.1.

**Checks.**

- For E=11a1 at p=5, c_φ=1 and L(E,1)/Ω_E^+=1/5 (LMFDB11, special value and Manin constant). The unhalved plus symbol takes value 2L(E,1) on {0}−{∞}, so taking P_f^+=uΩ_E^+ with u a 5-adic unit would give 2/(5u), of valuation −1. The full-symbol lattice requires an integral value; thus v_5(r_E^+)≤−1, whereas P_abs^+/Ω_E^+ is a unit. This is a negative control for an unrestricted unit comparison.
- For E=11a1 at p=7, E[7] is irreducible and §3.2’s non-Eisenstein period contract gives a unit ratio. The symbol value 2/5 has 7-adic valuation 0, consistent with that comparison; at p=5 the same value has valuation −1.
- For a p-isogeny, the image of the source Tate lattice can be proper in T_pE, and the Néron period ratio can be nonunit (e.g. p=5 in class 11a). Track both lattice and analytic period factors. Under residual irreducibility stable lattices are homothetic, so this issue disappears for the integral irreducible branches.
- For E = 19a1 = X_0(19) at p = 3 (a_3 = −2, so good ordinary), Γ_0(19) has 1 + (−3/19) = 2 elliptic points of order three, and still H¹(X_0(19), Z_3) is the parabolic part of Hom(Γ_0(19), Z_3): an element of order three maps to a torsion element of Z_3, that is to 0. With F_3 coefficients H¹(Z/3, F_3) ≅ F_3 ≠ 0, so the same comparison for torsion coefficients would need a correction; this is where small primes intervene, not in weight two over Z_(3).

### 3.2 The Mazur–Swinnerton-Dyer p-adic L-function of an elliptic curve

Let E/Q have good ordinary or multiplicative reduction at an odd prime p, with α the unit root of X² − a_pX + p (α = a_p = ±1 in the multiplicative case). Let `μ_{E,α}` be the measure on Z_p^× with ∫ `μ_{E,α}` = (1 − α⁻¹)ᵇ⁺¹·L(E,1)/Ω_E^+ with b = 1 for good and b = 0 for multiplicative reduction, and ∫ χ `μ_{E,α}` = p^n α⁻ⁿ L(E, χ⁻¹, 1)/(G(χ⁻¹) `Ω_E^{χ(−1)})` for every primitive Dirichlet character χ of conductor p^n > 1 (Colmez Theorem 0.8 and Remark 0.10, restricting his distribution on Z_p to Z_p^×). Write x = ω(x)⟨x⟩ on Z_p^× with ω the Teichmüller character and ⟨x⟩ ∈ 1 + pZ_p ≅ Γ. For a character η of Δ ≅ μ_(p−1) the η-branch is the pushforward to Γ of (η∘ω)·`μ_{E,α}`, and L_p(E/Q) ∈ Λ ⊗ Q_p is the branch η = 1. Hence its value at a finite-order character of Γ, which is a χ trivial on Δ, is ∫ χ `μ_{E,α}`, while a χ nontrivial on Δ evaluates the branch η = χ|_Δ and not L_p(E/Q). Its analytic form is L_p(E, s) = ∫ ⟨x⟩ˢ⁻¹ `μ_{E,α}.` If E[p] is irreducible, L_p(E/Q) ∈ Λ.

Assume p odd and good ordinary or multiplicative reduction.

Néron-differential periods Ω_E^±, not canonical periods of f_E.

Under (irr_Q), the period contract gap:manin-period-comparison combines the optimal X₁(N) comparison of Skinner §3.3 and note 8, p.25, valid when ord_p(N)≤1, with the non-Eisenstein boundary comparison to the saturated full-symbol line. It gives `P_{f_E}^+/Ω_E^+∈Z_p^×` and hence integrality without an extra Manin-constant hypothesis. A prime-to-p isogeny transfers this to E; residual irreducibility is essential to the boundary comparison. Skinner’s optimal X₁(N) Betti/Néron comparison also gives P_SU,f_E^+/Ω_E^+∈ℤ_p× in this irreducible-residual range, independently of the extra full-symbol adapter. Dividing the two ratios gives c_f_E^+∈ℤ_p×. These are elliptic comparisons; they do not prove a general-weight Betti/full-symbol or Kato/full-symbol unit assertion.

The usable interface consists of the following named outputs.

- mazurSwinnertonDyerL: L_p(E/Q) ∈ Λ ⊗ Q_p for E good ordinary or multiplicative at odd p.
- mazurSwinnertonDyerL_trivial_character: Its value at the trivial character is (1 − α⁻¹)ᵇ⁺¹ L(E,1)/Ω_E^+.
- mazurSwinnertonDyerL_twist: For every primitive χ of conductor p^n > 1, ∫ χ `μ_{E,α}` = p^n α⁻ⁿ L(E, χ⁻¹, `1)/(G(χ⁻¹)Ω_E^{χ(−1)});` when χ is trivial on Δ (so n ≥ 2), this is the value of L_p(E/Q) at χ, and otherwise the value of the η = χ|_Δ branch at χ|_Γ.
- mazurSwinnertonDyerL_mem_Lambda: If E[p] is irreducible then L_p(E/Q) ∈ Λ.
- mazurSwinnertonDyerL_isogeny: For a Q-isogeny E → E', L_p(E'/Q) = `(Ω_E^+/Ω_{E'}^+)·L_p(E/Q),` the period ratio being a rational number.
- mazurSwinnertonDyerL_eq_form: L_p(E/Q) = `(P_{f_E}^+/Ω_E^+)` `L_{f_E},` where `P_{f_E}^+=−2πiΩ_{f_E}^+` is the saturated full-symbol differential period of §0.4; the source Betti version is L_p(E/Q)=(P_SU,f_E^+/Ω_E^+)L_SU,f_E. The ratio is algebraic and its p-part is retained.
- mazurSwinnertonDyerL_analytic: L_p(E, s) := ∫ ⟨x⟩ˢ⁻¹ `μ_{E,α},` s ∈ Z_p, and γ − 1 ↦ ⟨u⟩ˢ⁻¹ − 1 identifies the two forms.
- katoPeriodDefect_elliptic: for E good ordinary at an odd p with E[p] irreducible, Kato's good pair for the cohomological lattice T_B = T_pE(−1) ≅ T_pE^∨ (Kato 17.5, p.274) is (ω_E, γ_E) with ω_E a Néron differential and γ_E^± bases of H¹(E(C), Z_p)^±; its projected function `K_{ω_E,γ_E,1}` is L_p(E/Q) up to Z_p^×, and the total defect u_p(f_E) of §0.9 is the class of `P_{f_E}^+/Ω_E^+.` This includes the fractional symbol correction, not only the de Rham factor. It is a unit under the irreducible-residual period contract above; §3.1(3) alone proves only that the Manin constant is a unit.

Construct `μ_{E,α}` from the modular symbols of f_E (ModularSymbolsPadicLFunctions §2.5 (ordinary specialization of the small-slope p-adic L-function)) and rescale from canonical to Néron periods by §3.1.

Interpolation: ModularSymbolsPadicLFunctions §2.5 (interpolation and uniqueness), with the trivial-character Euler factor of ModularSymbolsPadicLFunctions §4.3 (Euler factors and depletion) (the factor (1 − α⁻¹)² for good and (1 − α⁻¹) for multiplicative reduction).

For katoPeriodDefect_elliptic, Kato remarks in 17.5 (p.274) that for weight two and T = T_pE(−1) an ω is good exactly when it is a Z_p-basis of the cotangent space of the Néron model; a good γ is a basis of the ± parts of T, that is of the Betti lattice H¹(E(C), Z_p) under the comparison isomorphism. With this pair the periods of Kato Theorem 16.2 are the Néron periods Ω_E^±, so its π_1 projection is the Néron-normalised L_p(E/Q), while other tame projections give the corresponding branches of `μ_{E,α}.` Comparing with mazurSwinnertonDyerL_eq_form and §0.9(3) gives the defect.

The source for this target is [Pierre Colmez](https://www.numdam.org/item/SB_2002-2003__45__251_0.pdf), Theorem 0.8, Definition 0.9, Remark 0.10, p.255; [Ashay Burungale, Francesc Castella and Christopher Skinner](https://arxiv.org/abs/2405.00270v2), §1.1, pp.1–2; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §3.3, p.25 and note 8 (optimal X₁(N) periods); [Kazuya Kato](https://www.numdam.org/item/AST_2004__295__117_0.pdf), Theorem 16.2, p.269, and 17.5, p.274 (the elliptic good pair).

*Needs:* ModularSymbolsPadicLFunctions §§1.1, 2.5, 4.3 (integral full-symbol periods, ordinary measure and Euler factors); GrossZagierAndArithmeticHeights (gap:manin-period-comparison, including its non-Eisenstein unit clause); §3.1; §0.4; §0.9.

**Checks.**

- If E has split multiplicative reduction at p then α = 1 and the trivial-character value is 0.
- For E = 11a1 at p = 7, the trivial-character value is (1 − α⁻¹)²/5 ≠ 0 with α ≡ −2 mod 7.
- At a finite character φ of Γ of order 7 with φ(γ)=ζ₇, the weight-two formula uses χ_φ=φ⁻¹ on Z_p^×, so §0.4 and the Néron measure both evaluate L(E,φ⁻¹,1)/G(φ⁻¹), with the common conductor factor 7ⁿα⁻ⁿ. Their ratio is P_f^+/Ω_E^+, independent of φ; a period scalar cannot turn φ⁻¹ into φ.
- Branches at p = 3: the measure δ₁ − δ₋₁ on Z_3^× pushes forward to 0 on Γ, because ⟨−1⟩ = 1, while its integral against the odd character χ modulo 3 is χ(1) − χ(−1) = 2. Thus a χ nontrivial on Δ cannot be evaluated on the η = 1 branch; its value 2 is that of the η = χ branch at the trivial character of Γ.
- For a non-optimal curve E' in the class 11a and p = 5, L_p(E'/Q) and `L_{f_E}` differ by the 5-adic nonunit period ratio, so using canonical periods in place of Néron periods changes the integral main conjecture for E'.
- For multiplicative reduction b = 0, so the trivial-character factor is (1 − α⁻¹), not its square.
- For α = 1 (split multiplicative), (1 − α⁻¹)ᵇ⁺¹ = 0: the trivial zero of Colmez Remark 0.10.
- For E = 11a1 at p = 7, the value at the trivial character is (1 − α⁻¹)²/5, a nonzero element of Z_7.
- For 11a1 at p = 7 (X₀(11)-optimal, Manin constant 1, E[7] irreducible) the defect u_7(f_E) is a unit, so Kato's good-pair function and `L_{f_E}` generate the same ideal. Choosing instead ω = 7ω_E, which is not good, divides Kato's function by 7: goodness of ω, not merely its integrality, is what the defect measures.

### 3.3 Mazur's main conjecture for an elliptic curve

OrdinarySelmer.ofEllipticCurve is the comparison target here: with §3.1's chosen Tate lattice, identify the good ordinary group of §0.2 with the direct limit of the finite-layer p∞-Selmer groups under restriction (SelmerIwasawaCohomology §2.12 and §3.11; Skinner–Urban §1.1).

For E/Q and a prime p of good ordinary reduction, MMC(E, p) is the proposition: X_ord(E/Q_∞) := `Sel_{p^∞}(E/Q_∞)^∨` is Λ-torsion and char_Λ(X_ord(E/Q_∞)) = (L_p(E/Q)) in Λ. MMC_Q(E, p) is the equality in Λ ⊗ Q_p. Under §3.1, MMC(E, p) ⟺ `IMC(D_{f_E})` when the period ratio `Ω_E^+/P_{f_E}^+` (P_f=−2πiΩ_f) is a p-adic unit, and MMC_Q(E, p) ⟺ `IMC_Q(D_{f_E})` always.

Assume p is good ordinary. Section 1.7 covers the multiplicative form with its stated local condition.

The integral form carries the implicit integrality L_p(E/Q) ∈ Λ.

The usable interface consists of the following named outputs.

- MazurMC: MMC(E, p) : Prop.
- MazurMC_rational: MMC_Q(E, p) : Prop.
- MazurMC.iff_IMC: MMC(E, p) ↔ `IMC(D_{f_E})` when `Ω_E^+/P_{f_E}^+` (P_f=−2πiΩ_f) ∈ Z_p^×; MMC_Q(E, p) ↔ `IMC_Q(D_{f_E}).`
- MazurMC.isogeny: For an isogeny E → E' of degree prime to p, MMC(E, p) ↔ MMC(E', p).
- MazurMC.toRational: MMC(E, p) → MMC_Q(E, p).

X_ord(E/Q_∞) is the ordinary Selmer dual of the datum of f_E (§0.2, OrdinarySelmer.ofEllipticCurve).

L_p(E/Q) is §3.2; compare with `L_{f_E}` by the period ratio.

The source for this target is [Ashay Burungale, Francesc Castella and Christopher Skinner](https://arxiv.org/abs/2405.00270v2), Conjecture 1.1.1, p.1; [Joaquín Rodrigues Jacinto and Chris Williams](https://arxiv.org/abs/2309.15692v2), §2.2.2, p.6.

*Needs:* §0.2; §3.2; §0.5; §3.1.

**Checks.**

- MMC(11a1, 7) holds (§1.3 with q = 11, or §3.5).
- MMC_Q does not determine μ: it is compatible with char(X) = (p·L_p(E/Q)), which MMC excludes.
- For p = 7 and the 5-isogenous curves 11a1, 11a2, 11a3, the three conjectures MMC(·, 7) are equivalent.
- MMC(E, p) depends only on the isogeny class up to the p-part of period ratios and of the change of Selmer groups along the isogeny; both are tracked, not assumed to cancel.
- For E = 11a1 at p = 7 the period ratio is a unit, so MMC ⟺ IMC for f_E.

### 3.4 The Burungale–Castella–Skinner rational cyclotomic theorem

Let E/Q, p > 3 a prime of good ordinary reduction with E[p] irreducible. Then X_ord(E/Q_∞) is Λ-torsion and MMC_Q(E, p) holds: `char_{Λ_Q}(X_ord(E/Q_∞))` = (L_p(E/Q)) in Λ ⊗ Q_p. No ramification hypothesis on E[p] is assumed.

Assume p>3, good ordinary reduction and (irr_Q).

The proof owner is AutomorphicCongruences §7.9; this comparison transports its endpoint into the formulation of §3.3.

Import AutomorphicCongruences §7.9 (base change to the quartic CM field, Wan's divisibility, the four-factor descent and Kato's bounds).

Translate its Selmer and analytic objects with §3.1 and §3.2; the rational form needs no Manin-constant input.

The source for this target is [Ashay Burungale, Francesc Castella and Christopher Skinner](https://arxiv.org/abs/2405.00270v2), Theorem 1.1.2(a), p.2; [Ashay Burungale, Francesc Castella and Christopher Skinner](https://arxiv.org/abs/2405.00270v2), Remark 1.1.3, p.2.

*Needs:* AutomorphicCongruences §7.9; §3.3; §3.1.

**Checks.**

- Applies to 11a1 at p = 7 and to 14a1 at p = 13; it does not apply at p = 3 or at Eisenstein primes (11a1 at p = 5).
- It removes the ramification hypothesis (mult) of Skinner–Urban: 11a1 at p = 7 is covered by both, while a curve with no multiplicative prime at which E[p] ramifies (e.g. a curve of prime conductor ℓ with p | ord_ℓ Δ) is covered only here.

### 3.5 The Burungale–Castella–Skinner integral cyclotomic theorem

Under the hypotheses of §3.4, if moreover (Im) holds — there is σ ∈ `G_{Q(μ_{p^∞})}` with T_pE/(σ − 1)T_pE ≅ Z_p — then MMC(E, p) holds integrally.

Assume p>3, good ordinary reduction, (irr_Q) and (Im).

(Im) is not interchangeable with residual surjectivity or with irreducibility without the sufficient-condition lemma §3.6.

Import AutomorphicCongruences §7.10 with gap:automorphic-endpoints and transport it as in the rational case.

The imported endpoint is already an integral statement for this elliptic curve E with its own Néron normalization. Integrality of L_p(E/Q) under (irr_Q) is §3.2. No extra semistability or Manin-constant unit hypothesis is added to the BCS theorem; the curve/form dictionary is used only when translating to a separate modular-form presentation.

The source for this target is [Ashay Burungale, Francesc Castella and Christopher Skinner](https://arxiv.org/abs/2405.00270v2), Theorem 1.1.2(b), p.2.

*Needs:* AutomorphicCongruences §7.10 with gap:automorphic-endpoints; §3.4; §1.2.

**Checks.**

- 11a1 at p = 7: (Im) holds via τ ∈ I_11 (§1.2), so MMC(11a1, 7) holds integrally.
- For a curve with no multiplicative prime where E[p] is ramified, (Im) can still hold through surjectivity (§3.6); under (irr_Q) the essential case left out by Theorem 1.1.2 is that of residually dihedral primes (Burungale–Castella–Skinner Remark 1.1.3(iii)).

### 3.6 Residual surjectivity gives the rank-one image condition

Let E/Q, p ≥ 5, and suppose `ρ̄_{E,p}` : G_Q → GL₂(F_p) is surjective. Then the image of `ρ_{E,p^∞}` is GL₂(Z_p), the image of `G_{Q(μ_{p^∞})}` contains SL₂(Z_p), and σ with `ρ_{E,p^∞}(σ)` = [[1, 1], [0, 1]] satisfies T_pE/(σ − 1)T_pE ≅ Z_p, so (Im) holds.

Assume p≥5.

Require residual surjectivity onto GL₂(F_p).

The lifting step is the target `sl2Zp_closedSubgroup_eq_top` (stated in `Suggested.lean`): for p ≥ 5, a closed subgroup H′ ⊂ SL₂(Z_p) whose reduction modulo p is SL₂(F_p) equals SL₂(Z_p) (Serre's Lemma 3 of IV.3.4, as recalled by Landesman–Swaminathan–Tao–Xu §1, p.1). Proof: the kernel K of SL₂(Z_p) → SL₂(F_p) is a pro-p group whose Frattini quotient is the kernel of SL₂(Z/p²) → SL₂(F_p), the adjoint module sl₂(F_p); so it suffices that H′ ∩ K surjects onto it. Its image is an SL₂(F_p)-stable subspace of sl₂(F_p), which is irreducible for p odd, and it is nonzero because a lift x ∈ H′ of [[1,1],[0,1]] has x^p ≢ 1 mod p² when p ≥ 5.

Let H be the closed p-adic image. Its closed commutator subgroup lies in SL₂(Z_p) and reduces onto [GL₂(F_p),GL₂(F_p)]=SL₂(F_p), so it is SL₂(Z_p) by `sl2Zp_closedSubgroup_eq_top`. Since det H is all Z_p× (Weil pairing), H=GL₂(Z_p).

`Q(μ_{p^∞})` is cut out by the determinant, so `G_{Q(μ_{p^∞})}` maps onto SL₂(Z_p) ∩ image = SL₂(Z_p).

For u = [[1,1],[0,1]], u − 1 has image Z_p·e₁, so the quotient is free of rank one (§1.2).

The source for this target is [Ashay Burungale, Francesc Castella and Christopher Skinner](https://arxiv.org/abs/2405.00270v2), Remark 1.1.3(i), p.2; Theorem 1.2.2(b), p.3; [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), assumption (E), p.43; [Aaron Landesman, Ashvin A. Swaminathan, James Tao and Yujie Xu](https://arxiv.org/abs/1607.04698v2), §1, p.1, the g=1 discussion citing Serre IV.3.4 Lemma 3.

*Needs:* §1.2; §1.1; Mathlib `Matrix.SpecialLinearGroup`; ProfiniteProPGroups Layer 3 (Frattini quotient of the pro-p congruence kernel and the Burnside basis theorem); `TauCetiRoadmap.EllipticCurves` Layer 2 (the Weil pairing).

**Checks.**

- For E = 14a1 and p = 5 (5 is not a nonmaximal prime for 14a1), `ρ̄_{E,5}` is surjective, so (Im) holds.
- Modulo 25 there are 125 determinant-one lifts x of [[1,1],[0,1]] modulo 5, and every x⁵ is [[1,5],[0,1]]≠1. Modulo 9 the 27 corresponding lifts have cubes [[1,0],[0,1]], [[1,3],[0,1]] or [[1,6],[0,1]]; thus the nonzero first congruence-kernel step used in the proof fails at p=3.
- `sl2Zp_closedSubgroup_eq_top` fails for p = 3: the 24 Hurwitz quaternion units of norm one form a binary tetrahedral subgroup of SL₂(Z_3) (the Hurwitz order splits at 3), and since the kernel of reduction modulo 3 is torsion-free it maps isomorphically onto SL₂(F_3), of order 24. A finite subgroup is closed, so the hypothesis p ≥ 5 cannot be dropped.
- Burungale–Castella–Skinner Remark 1.1.3(i): for non-CM E, (Im) holds for all sufficiently large p by Serre's open image theorem.

### 3.7 The cyclotomic p-adic height of an elliptic curve

Let E/Q have good ordinary or multiplicative reduction at an odd prime p, with minimal Weierstrass equation, invariant differential ω_E, formal parameter t = −x/y at the origin, formal group Ê and formal logarithm log_E (so dlog_E = ω_E). Put η_E = xω_E. At good ordinary p write F for crystalline Frobenius from CrystallineCohomology CR.3.4 and set φ=p⁻¹F. Its characteristic polynomial is X²−(a_p/p)X+p⁻¹. Let α be the unit root of X²−a_pX+p and let ν_α=aω_E+bη_E span the unit-root subspace of F: ν_α is an eigenvector of F for α, equivalently an (α/p)-eigenvector of φ. Here b≠0, and in fact a/b∈ℤ_p, because F(ω_E)∈pH¹ forces the unit-root line to reduce modulo p onto the image of F mod p, which is complementary to the line of ω_E; the unit-root subspace is the limit of the lines spanned by Fⁿ(η_E) (Mazur–Stein–Tate §3.2, p.591). Set b₂=a₁²+4a₂, c=a/b and E₂(E,ω_E)=b₂−12c. Thus e₂:=E₂−b₂=−12a/b is the correction coefficient, rather than Katz's E₂ itself (Stein–Wuthrich §3.5; Mazur–Stein–Tate (1.7)–(1.9)). Let σ be Bernardi's sigma function of (E, ω_E): the solution of −x = (d/dω_E)((1/σ)(dσ/dω_E)) with σ(O) = 0, (dσ/dω_E)(O) = 1 and σ(−P) = −σ(P), a series t + (a₁/2)t² + ⋯ in t (Stein–Wuthrich p.1770), and define the **canonical p-adic sigma function** σ_p(t) := exp(e₂·log_E(t)²/24)·σ(t). It lies in Z_p[[t]]; for p ≥ 5 it is the unique function σ_p = t + ⋯ ∈ tZ_p[[t]], odd under the formal-group inverse σ_p(−P)=−σ_p(P), for which x + c = −(d/dω_E)((1/σ_p)(dσ_p/dω_E)) with c=(b₂−E₂)/12=a/b ∈ Z_p. The exponential uses (E₂−b₂)/24, so its second logarithmic derivative gives exactly this c.

Set ĥ_p(O)=0 and set every torsion height to zero. For a nonzero P ∈ E(Q) that reduces into the identity component of the Néron special fibre at every prime and to the origin modulo p, write x(P) = a′/e(P)² with e(P) > 0 and gcd(a′, e(P)) = 1, and set

```text
ĥ_p(P) := 2·log_p( e(P) / σ_p(t(P)) ).
```

Together with O these points form a subgroup H of finite index. For nontorsion P choose a nonzero integer m with mP∈H and set ĥ_p(P)=m⁻²ĥ_p(mP), proving independence by the quadratic addition law on H and passing to a common multiple. The affine denominator is used only for nonzero points; there t(P)≠0 and σ_p(t(P))≠0 because σ_p(t)/t is a unit on pℤ_p. The same zero, torsion and extension conventions apply in both multiplicative branches. The **cyclotomic p-adic height pairing** is ⟨P,Q⟩_p := ½(ĥ_p(P+Q) − ĥ_p(P) − ĥ_p(Q)), a symmetric Q_p-bilinear form on E(Q) ⊗ Q_p vanishing on torsion. The **p-adic regulator** Reg_p(E/Q) is the determinant of ⟨P_i,P_j⟩_p for a Z-basis P_1, …, P_r of E(Q)/E(Q)_tors (Reg_p = 1 when r = 0), and the **γ-normalised regulator** is Reg_γ(E/Q) := Reg_p(E/Q)/log_p(κ(γ))^r. The height is **nondegenerate** when Reg_p(E/Q) ≠ 0.

At multiplicative reduction use the same definitions with these changes. At nonsplit multiplicative p, α = −1 and the formula above is used unchanged, with e₂=E₂(E,ω_E)−b₂. Compute E₂ over the unramified quadratic splitting field and descend it with its differential normalization. At split multiplicative p, let q_E be the Tate parameter and ψ : Q̄_p^×/q_E^ℤ ≅ E(Q̄_p) the Tate parametrisation with ψ*ω_E = C·du/u, where C≠0, put E₂(E,ω_E):=C⁻²(1−24∑_(n≥1)∑_(d∣n) d q_E^n) and e₂:=E₂(E,ω_E)−b₂, form σ_p from this correction coefficient as above, and for nonzero P as above let u ∈ 1 + pZ_p be the preimage of P under ψ. Then

```text
ĥ_p(P) := 2·log_p( e(P) / σ_p(t(P)) ) − log_p(u)² / log_p(q_E).
```

The second term is Werner's correction of the multiplicative regulator of Mazur–Tate–Teitelbaum; omitting it gives a different pairing. Its denominator is nonzero by tateParameter_log_ne_zero below.

**The p-adic Mahler–Manin theorem.** For every prime p, with no oddness restriction, and every q∈ℂ_p× with 0<|q|_p<1 algebraic over ℚ, prove that J(q) is transcendental over ℚ (Waldschmidt, Théorème 2, p.108; ℂ_p convention p.106). Equivalently, `tateParameter_transcendental_of_isAlgebraic_j` states on the native curve `TauCeti.tateCurveAt` that algebraic j implies transcendental q. The equivalence is contraposition, since transcendental means not algebraic. The defining domain excludes q=0 and |q|=1.

For the elliptic corollary let E/Q have split multiplicative reduction at p, with Tate parameter q_E ∈ Q_p^×, 0 < |q_E|_p < 1, so that J(q_E) = j(E) ∈ Q, where J is the q-expansion of the modular invariant. The target tateParameter_transcendental is that q_E is transcendental over Q. This is the p-adic case of the theorem of Barré-Sirieix, Diaz, Gramain and Philibert: for q algebraic in ℂ or in ℂ_p with 0 < |q| < 1, the value J(q) is transcendental. Its consequence tateParameter_log_ne_zero is log_p(q_E) ≠ 0: the kernel of Iwasawa's logarithm on ℚ_p× is p^ℤ·μ(ℚ_p), whose elements are algebraic. Here μ(ℚ_p)=μ_(p−1) for odd p and μ(ℚ₂)={±1}; these two corollaries hold at p=2 as well. Hence the ℒ-invariant of §5.5 is nonzero. DiophantineApproximationAndTranscendence states Nesterenko's complex theorem only, so the general p-adic theorem is a target here and the Tate-parameter statements are its corollaries.

Assume p odd and good ordinary or multiplicative reduction at p.

Use Iwasawa's logarithm, log_p(p) = 0.

Nondegeneracy is a property, not part of the definition; it is Schneider's conjecture and is assumed by name wherever used.

The usable interface consists of the following named outputs.

- canonicalSigma: σ_p ∈ Z_p[[t]] as above, with its characterisation for p ≥ 5.
- cyclotomicHeight: ĥ_p : E(Q) → Q_p, with cyclotomicHeight_smul: ĥ_p(mP) = m²ĥ_p(P).
- cyclotomicHeight_model: ĥ_p does not depend on the Weierstrass equation.
- cyclotomicHeightPairing: ⟨·,·⟩_p, symmetric, Q-bilinear, zero on torsion.
- padicRegulator: Reg_p(E/Q), independent of the chosen basis since a change of basis has determinant ±1 and enters squared; padicRegulator_rank_zero: Reg_p = 1 when r = 0.
- normalizedRegulator: Reg_γ(E/Q) = Reg_p(E/Q)·log_p(κ(γ))⁻ʳ.
- HeightNondegenerate: Reg_p(E/Q) ≠ 0.
- `tateParameter_transcendental_of_isAlgebraic_j`: for every prime p and q∈(PadicComplex p)× with ‖q‖<1, algebraicity over ℚ of (TauCeti.tateCurveAt q hq).j implies transcendence of q; equivalently algebraic q in this domain has transcendental J(q).
- tateParameter_transcendental: q_E is transcendental over ℚ for E/ℚ split multiplicative at p, using the identification J(q_E)=j(E).
- tateParameter_log_ne_zero: log_p(q_E) ≠ 0.

Construct the unit-root eigenvector of F, the (α/p)-eigenvector of φ=p⁻¹F, on H¹_dR(E/Q_p) of the good-reduction model (`CrystallineCohomology` CR.2.3 and CR.3.4), with b ≠ 0 and a/b ∈ ℤ_p (Mazur–Stein–Tate §3.2, p.591; Stein–Wuthrich §4.1). Bernardi's σ is a formal solution of a second-order equation in Q_p[[t]]; the exponential correction makes it integral (Stein–Wuthrich (4.1) and the following paragraph; Mazur–Stein–Tate Theorem 1.3 for the characterisation when p ≥ 5).

The subgroup of P with everywhere good reduction and trivial reduction at p has finite index by finiteness of the component groups and of Ẽ(F_p), and σ_p converges at t(P) because t(P) ∈ pZ_p and p is odd. Quadraticity and the parallelogram law come from the duplication and addition formulas for σ (Mazur–Stein–Tate (1.2)–(1.3), citing Mazur–Tate), which give bilinearity of ⟨·,·⟩_p.

The multiplicative case follows Stein–Wuthrich §4.2, which takes the regulator of Mazur–Tate–Teitelbaum §II.6 with Werner's correction, and also records the product expansion of σ_p in u.

For tateParameter_transcendental, the Tate parameter satisfies J(q_E) = j(E) ∈ Q with 0 < |q_E|_p < 1; if q_E were algebraic, the Barré-Sirieix–Diaz–Gramain–Philibert theorem in ℂ_p would make j(E) transcendental. Their proof treats the complex and the p-adic cases together.

The source for this target is [William Stein and Christian Wuthrich](https://wstein.org/papers/mcom2649-iwasawa-alg.pdf), §4, (4.1), pp.1770–1771; §4.2, pp.1771–1772; §4.4, p.1774; [Barry Mazur, William Stein and John Tate](https://content.ems.press/assets/public/full-texts/books/254/chapters/online-pdf/978-3-98547-541-4-chapter-5044.pdf), (1.1)–(1.3), p.579, and Theorem 1.3, p.580; [Michel Waldschmidt](https://www.numdam.org/item/SB_1996-1997__39__105_0), Théorème 2, p.108, with ℂ standing for ℂ or ℂ_p (p.106), and its consequence for the Iwasawa logarithm of q, p.110, reporting [Barré-Sirieix, Diaz, Gramain and Philibert, Invent. Math. 124 (1996), 1–9](https://doi.org/10.1007/s002220050044).

*Needs:* DirichletPadicLFunctions §0.6 (`localIwasawaLog`, `existsUnique_isIwasawaLog_of_finiteDimensional`, `localIwasawaLog_exp`); `CrystallineCohomology` CR.2.3; `CrystallineCohomology` CR.3.4; TauCetiRoadmap.EllipticCurves Layer 4 (the Tate curve E_q); PadicHodgeTheory §9.3 (`potentiallyMultiplicativeTwistReduction`, the Tate parameter); Mathlib `WeierstrassCurve`; §3.1.

**Checks.**

- For 11a1 at p=7, F has roots α and 7/α with α≡5 mod 7, while φ=F/7 has roots α/7 and α⁻¹≡3 mod 7, of valuations −1 and 0. The unit-root subspace is the α-eigenline of F, that is the α/7-eigenline of φ. The α⁻¹-eigenline of φ is the eigenline of F for the nonunit root 7/α; it reduces modulo 7 into the kernel of F mod 7, the line of ω_E, so a primitive eigenvector on it has b≡0 mod 7 and its ratio a/b is not 7-integral (or undefined when b=0), which would give a nonintegral c and a nonintegral σ_p.
- For 14a1, a₁=1 and σ_p(t)=t+t²/2+O(t³). The formal inverse has t(−P)=−t−t²+O(t³), so σ_p(t(−P))=−t−t²/2+O(t³)=−σ_p(t). Substituting −t instead gives −t+t²/2+O(t³), which fails oddness. This pins oddness to the formal-group inverse (Stein–Wuthrich §4, p.1770).
- For 11a1 on y²+y=x³−x²−10x−20, a₁=0 and a₂=−1, hence b₂=−4 and c=(−4−E₂)/12. Using −E₂/12 changes c by 1/3; −D² log σ_p=x+c detects that error.
- Under ω↦2ω on a fixed curve, log_E↦2log_E, E₂↦E₂/4 and the correction coefficient e₂↦e₂/4 in the corresponding rescaled Weierstrass coordinates. Then e₂log_E²/24 is unchanged. A factor 4 in place of 1/4 multiplies it by 16. With ψ*ω_E=C du/u and C=2 the weight-two Tate value is one quarter of its value for C=1.
- At O, t=0 and σ_p=0, so the affine quotient is not evaluated and ĥ_p(O)=0. A torsion point has height 0; for a nontorsion point with 2P∈H, extending by 2 gives ĥ_p(P)=ĥ_p(2P)/4, and using 4 gives ĥ_p(4P)/16=ĥ_p(2P)/4.
- At p=2 the algebraic parameter q=−2 has norm 1/2 and log₂(−2)=0, since log₂(−1)=log₂(2)=0. The logarithm kernel includes −1; omitting it would give the wrong dyadic kernel.
- For q=p and for q=p² the logarithms are 0 and the parameters are algebraic, so the general theorem forces transcendental J(p) and J(p²). The value q=0 is outside the unit domain, and q=1 fails ‖q‖<1; neither is a counterexample. For an elliptic Tate parameter J(q_E)=j(E)∈ℚ, the inverse form instead gives transcendental q_E.
- Rank zero: Reg_p = 1, the empty determinant. Mazur–Tate–Teitelbaum's regulator in Colmez's normalisation is #E(Q)_tors⁻² in rank zero; the two conventions differ exactly by the torsion index and must not both be applied.
- Normalisation: scaling the height by a constant λ scales Reg_p by λ^r. With ĥ_p := log_p(e/σ_p), omitting the factor 2, every rank-r leading term would change by 2⁻ʳ. Mazur–Stein–Tate's height (1.1) is h(P) = (1/p)·log_p(σ_p(P)/e(P)) = −ĥ_p(P)/(2p), and their pairing h(P)+h(Q)−h(P+Q) is ⟨P,Q⟩_p/p, so their regulator is p⁻ʳReg_p up to sign; Stein–Wuthrich (footnote 4, p.1771) record the constant factor between the two normalisations. The leading-term formulas of §§3.9 and 5.6 are stated for ĥ_p only.
- Split multiplicative correction: for P with u = 1 + p and r = 1, dropping the term −log_p(u)²/log_p(q_E) changes ⟨P,P⟩_p by log_p(1+p)²/log_p(q_E), which has valuation 2 − v_p(log_p q_E); a regulator built without it is a different number.
- log_p κ(γ) for κ(γ) = 1 + p has valuation 1, so Reg_γ = p⁻ʳ·(unit)·Reg_p: for r ≥ 1 the two regulators are not interchangeable up to Z_p^×.
- Replacing γ by γ^u with u ∈ Z_p^× multiplies Reg_γ by u⁻ʳ, a unit; replacing the coordinate X by its inverse coordinate multiplies a rank-r leading coefficient by (−1)^r.
- Values: ⟨P,P⟩_p lies in Q_p; substituting the real Néron–Tate height gives a real number and is not a version of this pairing.
- Transcendence is what is needed: q_E = p, or any ζp^n with ζ a root of unity, would have log_p(q_E) = 0, which would make the corrected height undefined and the ℒ-invariant zero (ord_p(q_E) ≥ 1 in the denominator); algebraicity of j(E) alone excludes this only through tateParameter_transcendental.

### 3.8 Comparison of the height normalisations

**Flat arithmetic input for A/k.** For an abelian variety A over a number field k, an odd p, and the cyclotomic ℤ_p-extension k∞/k, construct schneiderFlatComplex from the fppf cohomology of the p-primary torsion sheaf of its Néron model over the rings of integers in the tower. At infinity use direct limits under restriction and the compact Pontryagin dual; do not replace a derived limit by its degreewise limit without its limit terms. The compact cohomology modules H_i are the duals of Hⁱ(o∞,𝒜(p)), with the torsion sheaf of the Néron model understood here. When A has good ordinary reduction above p, Sha_k(A)[p∞] is finite and Schneider's algebraic κ-height on the rational point spaces is nondegenerate, establish the finite-generation and torsion conclusions used to form the alternating characteristic series. Ordinary reduction alone does not assert torsion (Schneider Theorem 1 and §1, Proposition 9, pp.332–340). The supplied general fppf cohomology and Néron models are specialized here; this is not a second flat site (Schneider §1 and §2, pp.330–342).

Its API is:

- The generic-fibre restriction maps Hⁱ_fppf(o_n,𝒜(p))→Hⁱ(k_n,A[p∞]) commute with tower restriction and dual corestriction.
- Degree zero is A(k∞)[p∞], with its actual Galois action; it is retained in the alternating characteristic series.
- Local restriction and Kummer maps identify the comparison errors with the formal-group, reduction and component terms, compatibly with dual abelian varieties and gap:global-flat-duality. In the good-reduction-above-p range, at each finite layer use (H²/Div H²)^∨≃Tor H¹(o_n,T_p𝒜̂°) for the finite cotorsion factor, and (Div H²)^∨≃H¹(o_n,T_p𝒜̂°)/Tor for the free part. The multiplicative comparison instead retains the local terms required by gap:global-flat-duality; neither comparison discards the component-group errors.

**Checks.**

- For the zero abelian variety, every H_i is zero and the alternating characteristic series is 1, of order 0.
- A pairing diag(1,0) on an abstract flat Selmer space ℚ_p² restricts to determinant 1 on a point line but has determinant 0 on the full space. This detects omission of the T_pSha quotient; the torsion consequence here includes Sha[p∞] finite, so the quotient is zero.
- A rational point of order p contributes a nonzero element to H⁰ at that layer. The comparison cannot set H⁰ to zero merely because A has ordinary reduction.
- For a nonsplit multiplicative elliptic fibre of type I_n, the arithmetic component group has order 1 or 2, while its geometric order is n; for 14a1 at 2 these are 2 and 6. This distinguishes arithmetic component factors in the global flat/Galois comparison.

**Schneider's two heights.** For A/k good ordinary above p and a fixed nontrivial cyclotomic character κ, construct schneiderAlgebraicHeight on (A(k)⊗ℚ_p)×(Â(k)⊗ℚ_p) from the cyclotomic universal-norm obstruction and the global flat duality of gap:global-flat-duality. First construct the pairing on H¹(o,T_p𝒜)×H¹(o,T_pÂ) and retain the quotient T_pSha in Schneider §1, Lemma 4; restrict it along the Kummer maps to the rational point spaces. Finiteness of Sha[p∞] kills that quotient, allowing point-height nondegeneracy to imply the flat-cohomology nondegeneracy used for torsion. Construct schneiderAnalyticHeight on the same source and target ℚ_p from the Poincaré biextension, the Iwasawa logarithm and the ordinary local splittings. Require the κ normalization and local reciprocity maps of Schneider §§1, 4–7, pp.330–341 and 348–371. These are his height realizations, not definitions by their nondegeneracy or by the leading-term conclusion. Prove the comparison h_alg=−h_an (Schneider Theorem 6, p.371) before applying Theorems 2′ and 7.

Their API is:

- Both pairings are ℚ_p-bilinear and vanish on torsion before passing to the rational point spaces.
- For an isogeny φ:A→B, h_B(φP,Q)=h_A(P,φ̂Q) in each construction, with the dual isogeny on the second variable.
- For u∈ℤ_p×, replacing κ by κ^u multiplies either pairing by u; taking a rank-r determinant multiplies it by u^r. The algebraic/analytic sign multiplies the determinant by (−1)^r.

**Checks.**

- For rank zero both determinant regulators are 1. In rank one h_an(P,Q)=a gives h_alg(P,Q)=−a; in rank two the determinant sign is +1.
- If nP=0 with n≠0, bilinearity gives n·h(P,Q)=0 in ℚ_p, hence h(P,Q)=0. A pairing nonzero on torsion fails this law.
- For φ=[2], both sides of isogeny functoriality are 2h(P,Q). Replacing κ by κ² doubles a rank-one value a to 2a and multiplies a rank-two determinant by 4.

*Needs:* for schneiderFlatComplex and the two Schneider heights, NeronModelsAndSemistableAbelianVarieties Layers 1–2 and §2.2; SchemeAndStackFoundations §§2.1–2.2, 2.11; ArithmeticGaloisDuality (gap:global-flat-duality); ArithmeticGaloisDuality D7.6 (lattice Poitou–Tate away from p and local abelian-variety duality, for the generic-fibre and local terms); SelmerIwasawaCohomology §§2.12a, 3.3, 3.11, 3.15; PadicMeasuresIwasawaAlgebras §5.1; DirichletPadicLFunctions §0.6. The elliptic sigma realization additionally uses §3.7.


For elliptic multiplicative reduction prove schneiderMultiplicativeHeightComparison here, before using it in the height dictionary: construct Schneider's local splittings on the Tate uniformization, over the unramified quadratic splitting field in the nonsplit case, and descend the resulting height. At split p use log_p(q_E)≠0 from §3.7; Werner Corollary 7.3 identifies the correction as log_p(u)log_p(v)/log_p(q_E). Compare with §3.7's quadratic sigma height by polarization. The resulting canonical height is the Werner-corrected one, with the sign conventions below; there is no residual irreducibility or auxiliary-prime hypothesis (Werner Theorem 7.2 and Corollary 7.3, pp.317–318; Stein–Wuthrich §4.2).

**Checks.**

- On a Tate curve the correction on the diagonal is log_p(u)²/log_p(q_E); for u=v=1+p its valuation is 2−v_p(log_p(q_E)).
- At the identity u=1 the correction is 0, and the sigma height is assigned 0 separately.
- Replacing lifts u,v by u q_E^a,v q_E^b changes the raw logarithmic numerator, so the pairing must use the biextension descent law. For the formal subgroup the unique lifts in 1+pℤ_p exclude these alternatives because ord_p(q_E)>0.

*Needs:* §3.7 (sigma height, Tate uniformization and nonzero logarithm); DirichletPadicLFunctions §0.6; the local Poincaré biextension and duality of ArithmeticGaloisDuality D7.6.


For E as in §3.7, Schneider's algebraic p-adic height ⟨·,·⟩_κ (defined through universal norms in the cyclotomic Z_p-extension) and his analytic p-adic height (·,·)_κ satisfy ⟨·,·⟩_κ = −(·,·)_κ. Up to this sign they agree with the pairing ⟨·,·⟩_p of §3.7, with Werner's correction at split multiplicative p. The height used in the Mazur–Tate–Teitelbaum conjecture is ⟨·,·⟩_p, and the leading-term formulas in the variable T = κ(γ)ˢ⁻¹ − 1 use Reg_γ, while those in the variable s use Reg_p. In the split branch the zero has order r+1, so converting ℒ_p(E)·Reg_p to T gives (ℒ_p(E)/log_p κ(γ))·Reg_γ. Explicitly, for a series F with expansion F(T) = c_rT^r + O(Tʳ⁺¹) and G(s) := F(κ(γ)ˢ⁻¹ − 1), one has G(s) = c_r(log_p κ(γ))^r(s − 1)^r + O((s − 1)ʳ⁺¹).

Assume p odd and good ordinary or multiplicative reduction.

A sign change of a height changes a rank-r determinant by (−1)^r, a unit; so only the determinant up to sign enters §3.9.

The usable interface consists of the following named outputs.

- schneiderHeight_sign: ⟨·,·⟩_κ = −(·,·)_κ (Schneider Theorem 6).
- schneiderHeight_eq: Schneider's κ-heights agree with ⟨·,·⟩_p up to sign (with Werner's correction at split multiplicative p); their determinants agree with Reg_p up to (−1)^r.
- leadingTerm_T_to_s: c_r(T) ↦ c_r(T)·(log_p κ(γ))^r under T = κ(γ)ˢ⁻¹ − 1, and Reg_γ ↦ Reg_p.

Schneider proves the sign relation between his algebraic and analytic heights (Theorem 6). Stein–Wuthrich record that, once Werner's correction is applied at split multiplicative primes, his heights agree with the σ_p-height of §3.7.

For the change of variable, κ(γ)ˢ⁻¹ − 1 = (s−1)·log_p κ(γ) + O((s−1)²). Schneider's own variable is κ(γ)¹⁻ˢ − 1 (§2, p.341), which changes a rank-r leading coefficient by (−1)^r.

The source for this target is [Peter Schneider](https://ivv5hpp.uni-muenster.de/u/pschnei/publ/pap/heightII.PDF), §2, p.341 (the variable), and §7, Theorem 6, p.371; [William Stein and Christian Wuthrich](https://wstein.org/papers/mcom2649-iwasawa-alg.pdf), §3, p.1763 (the variable T), §4.4, p.1774, and §6.1, p.1776 (agreement of the heights).

*Needs:* §3.7.

**Checks.**

- In rank one, Reg_p = ⟨P,P⟩_p for a generator P, and Reg_γ = ⟨P,P⟩_p/log_p κ(γ); with κ(γ) = 1+p the latter has valuation one less.
- The first coefficient of κ(γ)ˢ⁻¹ − 1 is log_p κ(γ), of the inverse coordinate κ(γ)¹⁻ˢ − 1 it is −log_p κ(γ); a rank-r leading term changes by (−1)^r between them, a unit.
- For a series of order zero the leading value is unchanged. Split rank zero instead has an analytic zero of order one: an s-coefficient a becomes a/log_p κ(γ) in T-coordinates, even though the regulator is the empty determinant 1.
- Sign: in rank one ⟨P,P⟩_κ = −(P,P)_κ; a statement asserting equality of the two Schneider heights would be off by −1, harmless in a unit comparison but wrong as an identity.

### 3.9 Schneider's leading-term theorem

**Full elliptic comparison.** Prove schneiderFlatGaloisComparison for every E/ℚ good ordinary or multiplicative at odd p, allowing reducible E[p]. Construct the generic-fibre map from the flat arithmetic complex of §3.8 to the Galois complex with local Kummer conditions, and identify its cone through the local formal-group, reduction and arithmetic component maps. Retain H⁰=E(ℚ∞)[p∞], its dual, and the local correction complexes in the determinant identity; bounded finite groups may be discarded only after proving finiteness of their cardinalities along the tower. For the good ordinary specialization this gives the comparison used below with all reduction/component factors. For split multiplicative p use the strict Kummer complex, retain the distinct inertia/strict local quotient of §0.2 and apply schneiderMultiplicativeHeightComparison of §3.8 to the Werner-corrected sigma height. The local control calculation gives the factor ℒ_p(E)/log_p κ(γ), not an uncorrected regulator (Stein–Wuthrich Theorem 6.1, pp.1776–1777; Werner Theorem 7.2 and Corollary 7.3; Jones, multiplicative leading-term theorem). No residual irreducibility is a hypothesis of these comparison targets.

**Checks.**

- At split multiplicative p the extra inertia/strict quotient is ℚ_p/ℤ_p, of dual Λ/(X), with characteristic ideal (X); it is not a finite error of characteristic ideal 1.
- For 11a1 at p=5, H⁰ at the base contains ℤ/5, so a proof that kills H⁰ using irreducibility cannot apply. A finite group of order 5 has characteristic ideal 1 over ℤ₅[[X]], but its finite-layer order is still 5 and must be retained in the control Euler characteristic.
- At rank zero, the split factor is ℒ_p(E)/log_p κ(γ) and Reg_γ=1. For rank one replacing the corrected height by one omitting log_p(u)²/log_p(q_E) changes its value by that nonzero square quotient; the determinant comparison must use the corrected height.

*Needs:* NeronModelsAndSemistableAbelianVarieties Layers 1–2 and §2.2 (Néron models and arithmetic component groups); SchemeAndStackFoundations §§2.1–2.2 and §2.11 (fppf cohomology and Kummer); ArithmeticGaloisDuality (gap:global-flat-duality); ArithmeticGaloisDuality D7.6 (local abelian-variety duality); SelmerIwasawaCohomology §§2.12a, 3.3, 3.11 and 3.15 (Kummer/Sha, descent, control and étale comparison); PadicMeasuresIwasawaAlgebras §5.1 (determinants); DirichletPadicLFunctions §0.6 (logarithms); §§0.2, 3.7–3.8 for the elliptic specialization.


Let E/Q have good ordinary or multiplicative reduction at an odd prime p, let X_ord(E/Q_∞) be the Pontryagin dual of Mazur's Selmer group `Sel_{p^∞}(E/Q_∞)` = lim_n `Sel_{p^∞}(E/Q_n),` whose local conditions are the images of the local Kummer maps (§3.3), a torsion Λ-module by Kato's theorem (§0.3), and let f_E(T) ∈ Z_p[[T]] be a characteristic series, with T = γ − 1. At good ordinary and nonsplit multiplicative p this Selmer group is the one of §0.2, the strict and inertia-kernel conditions agreeing because α ≠ 1. At split multiplicative p it is the strict group, the kernel S of Skinner's map (2.3.2) (p.9), not the inertia-kernel group of §0.2 and §1.7. Then `ord_{T=0}` f_E(T) ≥ r = rank E(Q). Equality holds if and only if the height of §3.7 is nondegenerate and Sha(E/Q)[p^∞] is finite, and then the leading coefficient f_E^*(0) satisfies

```text
f_E^*(0) ∼_p ε_p · ∏_ℓ c_ℓ(E) · #Sha(E/Q)[p^∞] / (#E(Q)[p^∞])² · Reg_γ(E/Q),
```

where ∼_p means equality up to Z_p^×, ε_p = (1 − α⁻¹)² at good ordinary p and ε_p = 1 − α⁻¹ at nonsplit multiplicative p. At split multiplicative p the same holds with ε_p replaced by ℒ_p(E)/log_p κ(γ), where ℒ_p(E) := log_p(q_E)/ord_p(q_E) for the Tate parameter q_E, nonzero by tateParameter_log_ne_zero (§3.7); §5.5 develops this invariant further.

**Abelian varieties.** The statement is the case A = E, k = Q of Schneider's theorem for an abelian variety A over a number field k with good ordinary reduction at every place above p (ordinary for the cyclotomic Z_p-extension k_∞ in his terminology), which is the general target schneider_leading_term_abelianVariety. Let Σ be the set of places of k above p, 𝒜 the Néron model of A, Â the dual abelian variety, π_𝔭(A) the component group of 𝒜 at 𝔭 and 𝒜(κ_𝔭) the points of the reduction over the residue field κ_𝔭 for 𝔭 ∈ Σ. Schneider's algebraic Iwasawa L-function is L_p(A,κ,s) := ∏_i F_i(κ(γ)¹⁻ˢ − `1)^{(−1)ⁱ⁺¹},` where F_i is `p^{μ(H_i)}` times the characteristic polynomial of γ − 1 on H_i ⊗ Q_p and H_i is the Pontryagin dual of the flat cohomology H^i(o_∞, 𝒜(p)) over the ring of integers of k_∞; let m be its order of vanishing at s = 1 and c its leading coefficient there. If Sha_k(A)(p) is finite and Schneider's algebraic κ-height ⟨·,·⟩_κ on A(k) × Â(k) is nondegenerate, then m = rank A(k) and

```text
c ∼_p det⟨·,·⟩_κ · #Sha_k(A)(p) · ∏_𝔭 #π_𝔭(A) · (∏_{𝔭∈Σ} #𝒜(κ_𝔭))² / (#Tor A(k) · #Tor Â(k)).
```

The same holds with the analytic height (·,·)_κ in place of ⟨·,·⟩_κ, by schneiderHeight_sign. Only p-parts of the factors matter. For A = E and k = Q one has Â = E and #𝒜(κ_p) = #Ẽ(F_p); the component factors enter as the Tamagawa numbers c_ℓ(E), the form in which Stein–Wuthrich state the elliptic theorem (geometric component counts would differ at nonsplit multiplicative primes, where c_ℓ ∈ {1, 2} while the geometric count is ord_ℓ Δ_min); and the heights are those of §3.8.

Assume p odd and good ordinary or multiplicative reduction for the elliptic statement; for the abelian-variety statement, good ordinary reduction at every place above p.

The elliptic theorem is stated for the Galois p^∞-Selmer group. The flat-cohomology Selmer groups of the Néron model in Schneider's proof are compared with it inside the proof (schneiderFlatGaloisComparison below); the statement involves no flat cohomology.

Finiteness of Sha[p^∞] and nondegeneracy are hypotheses of the equality case, not consequences.

The usable interface consists of the following named outputs.

- schneider_leading_term_abelianVariety: the abelian-variety statement above.
- schneiderFlatGaloisComparison: the full local-cone and H⁰ comparison above, for good ordinary and multiplicative E, without a residual irreducibility assumption.
- The multiplicative local-factor comparison uses schneiderMultiplicativeHeightComparison of §3.8 and the strict local complex, retaining ℒ_p(E)/log_p κ(γ).
- schneider_order_ge_rank: `ord_{T=0}` f_E ≥ r.
- schneider_order_eq_iff: `ord_{T=0}` f_E = r ↔ HeightNondegenerate ∧ Sha(E/Q)[p^∞] finite.
- schneider_leading_term: the displayed elliptic formula, at good ordinary and nonsplit multiplicative p.
- schneider_leading_term_split: the split multiplicative variant with ℒ_p(E)/log_p κ(γ).
- greenberg_rank_zero: for r = 0 and Sha[p^∞] finite, f_E(0) ∼_p ε_p·∏_ℓ c_ℓ(E)·#Sha(E/Q)[p^∞]/(#E(Q)[p^∞])² at good ordinary p.

For schneiderFlatGaloisComparison use the full determinant comparison constructed above. Do not infer a trivial characteristic contribution merely from finite local errors at each layer: uniform boundedness and the global H⁰ contribution must be proved. In the irreducible good ordinary subcase H⁰ vanishes; in the other cases retain it until the control calculation, including the finite-layer torsion denominators, is complete. The multiplicative branch additionally uses schneiderMultiplicativeHeightComparison and the strict local complex.

For good ordinary E apply Schneider's Theorem 2′ through the full comparison; for multiplicative E use the multiplicative leading-term theorem and corrected height comparison (Stein–Wuthrich Theorem 6.1, citing Jones). The local factor is #Ẽ(F_p)² and #Ẽ(F_p) = (1 − α)(1 − p/α) = −α(1 − α⁻¹)(1 − p/α). The ratio #Ẽ(F_p)/(1 − α⁻¹) = −α(1 − p/α) is a p-adic unit even at an anomalous prime, where 1 − α⁻¹ is not; so #Ẽ(F_p)² ∼_p ε_p (Stein–Wuthrich record ord_p ε_p = 2 ord_p #Ẽ(F_p), p.1765). Convert the s-leading coefficient to T by §3.8, which turns det⟨·,·⟩_κ into Reg_γ up to sign. The equivalence of ord = r with nondegeneracy and finiteness of Sha[p^∞], and the Galois-cohomological form, are Stein–Wuthrich's Theorem 6.1, which credits Schneider and Perrin-Riou, and Jones for the multiplicative case.

For r = 0 the statement is Greenberg's rank-zero theorem (*Iwasawa theory for elliptic curves*, Theorem 4.1, as used in Skinner–Urban Theorem 3.6.11(b), p.46), proved directly from the restriction-control sequence of `SelmerIwasawaCohomology` §3.11 and the Euler characteristic of the local conditions.

The source for this target is [William Stein and Christian Wuthrich](https://wstein.org/papers/mcom2649-iwasawa-alg.pdf), Theorem 6.1 (Schneider, Perrin-Riou, Jones), p.1776, and (3.2), p.1765 (the multiplier ε_p); [Peter Schneider](https://ivv5hpp.uni-muenster.de/u/pschnei/publ/pap/heightII.PDF), §2, p.341 (the algebraic Iwasawa L-function and hypotheses), Theorem 2′, p.342, and §7, Theorems 6–7, p.371; [Christopher Skinner and Eric Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Theorem 3.6.11(b) and its proof, p.46 (the rank-zero case through Greenberg's Theorem 4.1).

*Needs:* §3.7; §3.8; §0.2; §0.3; §3.3; `TauCetiRoadmap.EllipticCurves` Layer 4 (the Tate curve, and the Tamagawa numbers c_ℓ from Tate's algorithm); PadicHodgeTheory §9.3 (`potentiallyMultiplicativeTwistReduction`, the Tate parameter); ArithmeticGaloisDuality (gap:global-flat-duality); `NeronModelsAndSemistableAbelianVarieties` Layers 1–2 (Néron models of abelian varieties and their component groups, §2.2, for the abelian-variety statement); DirichletPadicLFunctions §0.6 (`localIwasawaLog`, `existsUnique_isIwasawaLog_of_finiteDimensional`, `localIwasawaLog_exp`); `SelmerIwasawaCohomology` Layer 3 (§3.3 descent and §3.11 restriction control); SelmerIwasawaCohomology §§2.8–2.8a (Greenberg condition and ordinary filtration).

**Checks.**

- 11a1 at p=7, r=0: c_11 = 5, #E(Q)[7^∞] = 1 and ε_7 = (1−α⁻¹)² with α ≡ −2 mod 7, a 7-adic unit. With MMC(11a1,7) (§1.3) and the trivial-character value (1−α⁻¹)²/5 of §3.2, f_E(0) is a 7-adic unit; so the order is 0 = r, Sha[7^∞] is finite, and the formula forces #Sha(11a1)[7^∞] = 1. A version of the formula without the Tamagawa factor would still pass here (5 is a 7-adic unit), so the next check is needed as well.
- Torsion and Tamagawa factors: only p-parts enter. For 11a1 at p=5 the torsion Z/5 contributes 5⁻² and c_11 = 5 contributes 5; a formula with the full torsion squared but without c_11 would be off by 5. (5 is an Eisenstein prime for 11a1, so Layer 3's irreducible-prime theorems do not apply there; the test concerns only the shape of the formula.)
- Anomalous prime: for 11a1 at p=5, a_5 = 1 and #Ẽ(F_5) = 5, so ε_5 has valuation 2 while 1 − α⁻¹ has valuation 1; the unit ratio −α(1 − 5/α) reconciles Schneider's #Ẽ(F_p)² with ε_p, and a formula with (1 − α⁻¹) to the first power would be off by 5.
- Degenerate height: if Reg_p = 0 and Sha[p^∞] is finite, the order of vanishing exceeds r, so schneider_order_eq_iff fails exactly as stated.
- Split multiplicative, r=0: ε_p = 0, and the replacement ℒ_p(E)/log_p κ(γ) is nonzero for E/Q by tateParameter_log_ne_zero; the order of f_E at T=0 is then exactly zero, whereas the analytic function has a trivial zero there (§5.7), so the main conjecture at split multiplicative p carries the exceptional factor.
- Abelian varieties: for A = E the two torsion factors #Tor A(k) and #Tor Â(k) are equal, giving the square (#E(Q)[p^∞])²; using #Tor A(k) once would be off by #E(Q)[p^∞].
- Split multiplicative, against §1.7: suppose E[p] is irreducible and the inertia-kernel dual Xⁱⁿ of §0.2 is torsion. Skinner's Proposition 2.3.2 (pp.9–10) makes the localisation map (2.3.2) surjective, so the inertia-kernel Selmer group contains the strict one with quotient the local term A^−/(φ−1)A^− ≅ L/O of §0.2, on which Γ acts trivially. Dually 0 → Λ/(γ−1) → Xⁱⁿ → X_ord → 0, so char(Xⁱⁿ) = (γ−1)·(f_E). The trivial zero of §§1.7 and 5.7 is therefore visible on the algebraic side of the inertia-kernel group: the order statement of this theorem, read for Xⁱⁿ instead of X_ord, would be off by one, giving r + 1 rather than r under the same hypotheses.

### Examples

For 11a1 at p=7, residual irreducibility and the non-Eisenstein period comparison give a 7-adic unit ratio between P_f and the Néron real period, so `u_7(f_{11a1})` is a unit. In rank zero the height regulator is the empty determinant 1, and Schneider's theorem together with MMC(11a1,7) gives #Sha(11a1)[7^∞] = 1. The curve’s Tate lattice is the one transported back through the modular isogeny; using its image lattice instead would lose an index at primes dividing the isogeny degree. At p=7 the curve is ordinary, E[7] is irreducible, and inertia at 11 gives the rank-one image condition, so the integral theorem applies. At p=5 it has rational 5-torsion and belongs to the separate Eisenstein comparison of Layer 6.

### Dependencies

Use Layers 0–2, EllipticCurveModularity R29.4–R29.6, GrossZagierAndArithmeticHeights §§3.5, 3.7 and 3.10 for the Manin constant and gap:manin-period-comparison for the period lines, AutomorphicCongruences §§7.9–7.10 with gap:automorphic-endpoints for the two BCS branches, and `sl2Zp_closedSubgroup_eq_top` (§3.6) for the rank-two lifting theorem. The height and leading-term sections use DirichletPadicLFunctions §0.6 for log_p, CrystallineCohomology CR.2.3 and CR.3.4 for the Frobenius on H¹_dR(E/Q_p), TauCetiRoadmap.EllipticCurves Layer 4 for the Tate curve and the Tamagawa numbers, §1.1 for the Tate parameter, NeronModelsAndSemistableAbelianVarieties Layers 1–2 for Néron models of abelian varieties and their component groups, the p-adic Barré-Sirieix–Diaz–Gramain–Philibert theorem stated in §3.7 for the split case, and SelmerIwasawaCohomology Layer 3 for descent and control.


## Layer 4: families and signed consequences

### 4.1 The Fouquet–Wan universal-family main conjecture

Let ρ̄ satisfy the hypotheses of §2.2, Σ a finite set containing p, every prime where ρ̄ ramifies, and the auxiliary Steinberg prime of §2.2, in the admissible deformation/Hecke setting of Fouquet–Wan §2, and T_Σ the universal deformation of ρ̄ unramified outside Σ, viewed as a free module of finite rank over the regular subring Λ ≅ O[[X₁, X₂, X₃]] of the Hecke algebra. Let z_Σ : T_Σ(−1)^+ → H¹_et(Z[1/Σ], T_Σ) be Nakamura's zeta morphism over the universal deformation ring (Fouquet–Wan Theorem 3.6), supplied by AutomorphicCongruences §§3.4, 3.7–3.9 and 4.3. Then z_Σ induces an isomorphism `triv_{z_Σ}` : Δ_Σ(T_Σ) ≅ Λ of the Σ-partial fundamental line with Λ: Kato's generalised main conjecture (Fouquet–Wan Conjecture 3.30) holds for (Spec Z[1/Σ], Λ, T_Σ). The trivialisation is over Λ; nothing is asserted over a possibly singular deformation ring or Hecke algebra.

Require the residual hypotheses of the pointwise theorem: Fouquet–Wan Theorem 5.2 has the same hypotheses as Theorem 5.1.

The ring Λ≅O[[X₁,X₂,X₃]] is the specified regular subring; T_Σ is free of finite rank over it.

Nakamura's zeta morphism exists under Fouquet–Wan Assumptions 2.1 and 3.5 (Theorem 3.6), for all p ≥ 3 by the remark after it; both are part of the supplier's target.

The proof is owned by AutomorphicCongruences §§3.4, 3.7–3.9 and 4.3: reduction to points of X^sm via ordinary and crystalline-short points, the GU(3,1) congruence and Theorem 7.32, and the height-one descent.

Assumption 2.1 includes absolute irreducibility on G_Q(√p*) and the stated ordered local extension exclusions; Assumption 3.5 additionally excludes the cyclotomic ratio for either ordering of a reducible local semisimplification. Neither an ordinary filtration nor residual absolute irreducibility alone replaces these conditions. The deformation/Hecke identification is the one under these hypotheses; this is not a construction for an arbitrary deformation problem.

The universal morphism and its specialisations are the supplier's: AutomorphicCongruences §§3.4, 3.7–3.9 and 4.3 constructs the `R_{ρ̄,Σ}-linear` morphism; AutomorphicCongruences §3.8 identifies its specialisation at every classical point λ_f with `∏_{l∈Σ∖{p}}P_{f,l}(σ_l⁻¹)` times Kato's twisted classical morphism, which is the Σ-partial morphism of Fouquet–Wan Theorem 3.4; and AutomorphicCongruences §3.9 gives the induced map at a general specialisation and the trivialisation of Δ_Σ(T_Σ) over Λ after restriction of scalars. Restrict scalars to the specified regular Λ only after the construction. KatoEulerSystems §5.4 supplies only the classical twist-one morphisms. The Σ-partial line is §0.6 over Λ, in the form AutomorphicCongruences §§3.4, 3.7–3.9 and 4.3.

Transport the endpoint over its stated regular coefficient ring.

The source for this target is [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Theorem 1.8, p.8, and Theorem 5.2, p.69; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Theorem 3.6 and the remark after it, p.24; Conjecture 3.30, p.36.

*Needs:* AutomorphicCongruences §§3.4, 3.7–3.9 and 4.3; §0.6; §2.2.

**Checks.**

- Σ=∅ is inadmissible: for the residual representation of 14a1 at p=5, inertia at 2 is nontrivial since 5∤6. A lift unramified outside ∅ would reduce to trivial inertia at 2, a contradiction. Including p, this residual ramification set and the auxiliary prime makes the deformation problem meaningful.
- Specialising at a classical point recovers the pointwise statement at the Σ-imprimitive level (§4.2).
- When the deformation problem is unobstructed, R_Σ(ρ̄) is itself a power-series ring and the theorem is the most general cyclotomic statement (Fouquet–Wan p.8).
- A collection of classical zeta maps without a deformation-algebra-linear map is not Nakamura's morphism: interpolation at points is the specialisation theorem, not the construction, and only the linear morphism trivialises Δ_Σ over Λ.
- At p=3 the supplier's construction rests on Fouquet–Wan's remark after Theorem 3.6 (Paškūnas's Propositions 2.13 and 2.33 of the two p≥5 inputs); the same classical-specialisation square and local residual exclusions are retained.
- Over the regular subring Λ the trivialisation is the norm along the finite free map Λ → 𝕋; it is not an identification of the total quotient ring of 𝕋 with Frac Λ.

### 4.2 Specialising the family statement

With the admissible Σ and the deformation/Hecke setting of §4.1, let ψ be a coefficient specialization from its specified regular base Λ. The Σ-partial perfect complex and line commute with derived base change, and the compatible zeta morphism induces Δ_Σ(T_Σ) `⊗^L_{Λ,ψ}` S ≅ Δ_Σ(T_Σ `⊗^L_{Λ,ψ}` S). For a cyclotomic specialization use ψ_Iw and S_Iw consistently on both sides. Identifying this derived coefficient object with the specialized arithmetic lattice, primitive line and zeta trivialization requires Fouquet–Wan’s relative-purity and Iwasawa-suitability conditions, using Definition 3.19 for the regular base (Definition 3.12 is for the Hecke-algebra setting). At a classical point the primitive zeta map satisfies z_primitive = `(∏_{ℓ∈Σ∖{p}}` Eul_ℓ(V_f^*(1)))⁻¹ z_Σ (Proposition 3.28); compatible local determinant factors accompany it. These nonzero factors need not be units. Characteristic ideals are recovered from the specialized determinant with all cohomology and Tor terms, rather than specialized term by term.

For primitive arithmetic compatibility use the Iwasawa-suitable specialization of Definition 3.19 (p.31), including its condition on all lifts above the regular-base point; do not substitute a single suitable Hecke lift.

The Σ-partial derived base change is unconditional in Lemma 3.17’s coefficient setting; the primitive modified local line uses Proposition 3.20 and relative purity.

Euler factors and their dual/twist are those of Proposition 3.28, p.35; nonvanishing does not license cancellation inside integral lines without the local determinant comparison.

Use Lemma 3.17 for perfect derived coefficient change, Definition 3.19 for suitability over the regular subring, Proposition 3.20 for primitive local compatibility and Propositions 3.22–3.23 for the zeta trivialisations.

Compare Σ- and {p}-partial lines by the local Euler factors (§0.6, fundamentalLine.sigmaPartial).

Translate to KMC through §0.8 at Iwasawa-suitable points.

The source for this target is [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Propositions 3.22–3.23, p.33; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Lemma 3.17 and Definitions 3.18–3.19, p.31; Proposition 3.20, p.32; Proposition 3.28, p.35; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), remarks after Theorem 1.8, p.8.

*Needs:* §4.1; §0.6; §0.8; AutomorphicCongruences §§3.4, 3.8–3.9 and 4.6; `PadicMeasuresIwasawaAlgebras` Layer 5.

**Checks.**

- At a point where H⁰ or a Tor term is nonzero, termwise specialisation of char(H²) would be wrong; the determinant form remains valid.
- The family statement implies the pointwise conjecture outside a closed subset of positive codimension (Fouquet–Wan p.8); the pointwise theorem at every classical point is §2.2.

### 4.3 The signed main conjecture for crystalline forms

Let f ∈ S_k(Γ_0(N)) with p ∤ N, crystalline at p, satisfying the hypotheses of §2.2 and LLZ's (A) if supersingular or (A') if good ordinary, together with (E), and take KMC^1(T_LLZ)=KMC^1(T_K(k−1)) from AutomorphicCongruences §4.5 with gap:tate-twisted-components. Then for the Wach basis of LLZ §3.3 (resp. §3.6) and η=1 (both i=1,2), the signed main conjecture `SMC^{i,η}` of §0.12 holds integrally, with the Coleman-image term `char(Im(Col_i)^η/(L̃^η_{p,i})).` The statement is proved only on the intersection of the two hypothesis sets.

Require the hypotheses of the pointwise theorem and of LLZ Corollary 6.6 simultaneously.

The image-of-Coleman term is retained; its simplification is §4.4. The algebraic side is the contragredient `X^{i,η}`; in scalar notation the result is `char(X_sc^{i,η⁻¹})=ι_Γ(char(Im(Col_i)^η/(L̃^η_{p,i})))`, including for η=1.

The application from the Tate-twisted contract is η=1. From §2.2's untwisted KMC^1(T_K), KMC.twist reaches only the signed component η=ω^(k−1), with i=1 (§2.3(3)). For other η, LLZ’s equivalence still applies in its allowed index range, but KMC^η(T_LLZ) must be separately supplied. A twist f⊗η generally has p-power level and nontrivial nebentypus, so the stated FW theorem cannot be invoked merely by checking residual conditions.

For η=1 use KMC^1(T_LLZ) from gap:tate-twisted-components, not the untwisted KMC^1(T_K) of §2.2, which is the signed component ω^(k−1). A statement for any other η is conditional on an independently proved KMC^η(T_LLZ), with LLZ Theorem 6.5 allowing i=1 for all η and i=2 only for η=1.

Convert to `SMC^{i,η}` by §0.13.

The source for this target is [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), Theorem 6.5, Corollary 6.6, pp.43–44; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Theorem 1.7, p.7.

*Needs:* §2.2; §0.13; §0.12; §0.7 (KMC.twist); AutomorphicCongruences §4.5 with gap:tate-twisted-components.

**Checks.**

- E = 14a1, p = 5: with KMC^1(T_pE), the weight-two case of gap:tate-twisted-components and the same equality as gap:central-critical-specialization, `SMC^{1,1}` and `SMC^{2,1}` hold with the LLZ basis; Theorem 5.1's KMC^1(T_pE^∨) gives only `SMC^{1,ω}`.
- A form with k ≥ 3 that is good ordinary but locally split at p is excluded by (A').

### 4.4 Removing the Coleman-image term

Let p be odd and f supersingular at p with p ∤ N and ε(p)=1, satisfying LLZ's (A)–(D): k ≥ 3 or a_p = 0; a_p ≠ p^j + pᵏ⁻²⁻ʲ for 1 ≤ j ≤ k − 3; v_p(a_p) > ⌊(k − 2)/(p − 1)⌋; p ≥ k − 1. Then Col₁ : `N(V)^{ψ=1}` → Λ_E(G_∞) is surjective (LLZ Theorem 4.28), so Im(Col₁) = Λ_E(G_∞) and, after tensoring with Q, KMC^η is equivalent to `char(X^{1,η})` = `(L̃^η_{p,1})` (LLZ Corollary 6.8). For elliptic curves with a_p = 0 the images are computed integrally: Col₁ : `D(T)^{ψ=1}` → Λ(G_∞) is surjective and Im(Col₂) = `(Σ_{i=1}ᵖ⁻¹` δ_i)Λ(G_∞) + (γ − 1)Λ(G_∞) (LLZ Corollaries 5.18 and 5.22, equivalent to Kobayashi's Theorem 6.2). The simplified statement is basis-adjusted: it is the principal-ideal form for the LLZ basis, not automatically for another author's normalisation.

ε(p)=1 and (A)–(D) for the rational simplification; the signed definitions of §§0.11–0.12 retain arbitrary nebentypus with the actual Frobenius matrix.

For the integral image computation assume E is an elliptic curve and a_p=0.

The basis is LLZ's; another basis changes Col by a matrix and the image by its effect.

Image computation: for Col₁ under (A)–(D), apply the coordinate-image formula of PadicHodgeRegulators §9.26 and check that no constraint subspace lies in the first coordinate hyperplane (LLZ Proposition 4.7, Corollary 4.8, Theorem 4.28); for a_p = 0 the integral images are gap:signed-regulators (LLZ Propositions 5.17–5.21 and Corollaries 5.18–5.22).

Insert Im(Col_i) into §0.12 (SMC.of_image_eq_top).

The source for this target is [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), Theorem 4.28, p.30; assumptions (B)–(D), p.14; [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), Remark 6.7 and Corollary 6.8, p.44; [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), Propositions 5.17, 5.19 and 5.21 and Corollaries 5.18, 5.20 and 5.22, pp.38–40.

*Needs:* PadicHodgeRegulators §9.26 (rational Coleman image); PadicHodgeRegulators (gap:signed-regulators) for the integral a_p=0 images; §0.12; §0.13.

**Checks.**

- For a_p = 0, SMC² keeps the nontrivial factor char(Λ/Im Col₂) on its η-components where Im(Col₂)^η ≠ Λ; only for i = 1 does the principal form hold for all η.
- Assumption (D) p ≥ k − 1 holds for every weight-two form; (C) holds for a_p = 0.
- For p=5, k=2 and a_p=0, ε(p)=1 gives the untwisted Frobenius polynomial Z²+5; ε(p)=−1 gives Z²−5. The numerical conditions (A)–(D) hold in both formal data, but only the first is in this source theorem package. A basis label cannot change the determinant from −5 to 5.
- For the first datum the trivial-component image relation is 2 Col₂(0)=4 Col₁(0): (Col₁(0),Col₂(0))=(1,2) satisfies it. The arbitrary-nebentypus definition uses its actual matrix instead (PadicHodgeRegulators §9.28).

### 4.5 Kobayashi's and Pollack's signed objects

Let E/Q have good supersingular reduction at an odd prime p with a_p = 0. For the LLZ basis there are units a^± ∈ Λ_E(G_∞)^× with a^−·Col₁ = Col^− and a^+·Col₂ = Col^+, where Col^± are the plus and minus Coleman maps whose kernels define Kobayashi's local conditions E^±; consequently (1) the signed Selmer groups X¹, X² of §0.11, built on T_LLZ=T_pE with A^*=E[p^∞], are Kobayashi's `Sel^−(E/Q(μ_{p^∞}))^∨` and `Sel^+(E/Q(μ_{p^∞}))^∨;` (2) `L̃_{p,1},` `L̃_{p,2}` are Pollack's L_p^−, L_p^+ up to units of Λ_E(G_∞), and the decomposition of `L̃_{p,α},` `L̃_{p,β}` in LLZ Theorem 1.3 reduces to Pollack's decomposition with the half-logarithms log^±_p; (3) `SMC^{1,η},` `SMC^{2,η}` are Kobayashi's minus and plus main conjectures `char(Sel^∓(E/Q(μ_{p^∞}))^{∨,η})` = `char(Im(Col^∓)^η/(L_p^{∓,η})).` The comparison is specific to a_p = 0; for a_p ≠ 0 the LLZ objects are not Pollack's plus/minus objects without a separate argument. The Coleman multipliers a^± lie in Λ_E(G_∞)^× = (Λ_O(G_∞)[1/p])^×. On the common integral source, multiplication by a^∓ in the rational target preserves zero, so the kernels of Col_i and Col^∓ coincide. Multiplication by a^∓ is an injective Λ-linear map carrying Im(Col_i) onto Im(Col^∓) and `L̃_{p,i}` onto Col^∓(loc z_Kato); so the corrected image quotients are isomorphic Λ-modules, and `SMC^{i,η}` is equivalent to Kobayashi's corrected ∓ main conjecture integrally, with no unit hypothesis. This isomorphism is between the two actual image lattices; it need not preserve the standard ambient lattice Λ_O(G_∞). Take Kato's zeta element attached to a Néron differential ω_E and to the integral Betti basis of H¹(E(ℂ),ℤ_p) of §3.1, the normalisation in which Kobayashi works; his maps carry its localisation to Pollack's Néron-normalised L_p^∓ (as recalled in LLZ §1, p.3). Hence Pollack's L_p^∓ = `a^∓·L̃_{p,i}` exactly, and the principal-ideal forms char(X^i) = `(L̃_{p,i})` and `char(Sel^∓(E/Q(μ_{p^∞}))^∨)` = (L_p^∓) agree integrally exactly when a^∓ ∈ Λ_O(G_∞)^× on the relevant component (pollackMultiplierUnit); rationally they always agree.

E/Q, p odd, good supersingular reduction with a_p = 0 (automatic for p ≥ 5 supersingular).

Every signed superscript ∨ in (1)–(3) denotes the contragredient dual of §0.11. In scalar notation the corrected equality is `char(D_Λ(Sel^∓)^{η⁻¹})=ι_Γ(char(Im(Col^∓)^η/(L_p^{∓,η})))`; the principal form uses `(ι_Γ(L_p^{∓,η}))`. This same transport is required in the comparison with the scalar ordinary convention. All the groups in (1)–(3) are over `Q(μ_{p^∞})` and carry Λ(G_∞)-actions. Define Sel^±(E/Q_∞) by descent of the signed local conditions to the cyclotomic Z_p-extension. Since |Δ|=p−1 is invertible in Z_p, restriction and corestriction identify Sel^±(E/Q_∞) with `Sel^±(E/Q(μ_{p^∞}))^Δ,` compatibly with local Tate orthogonality. Thus `X^{1,1}` ≅ Sel^−(E/Q_∞)^∨ and `X^{2,1}` ≅ Sel^+(E/Q_∞)^∨. For η≠1 the contragredient component `X^{i,η}` comes from the discrete η⁻¹-component. To obtain it by descent use coefficients E[p^∞]⊗η and the same twist on the local conditions: taking Δ-invariants selects that discrete η⁻¹-component, whose contragredient dual has label η. The untwisted group over Q_∞ has no residual Δ-action. Use SelmerIwasawaCohomology §3.2 for the tower coefficient dictionary and ProfiniteCohomology Layers 5–6 for inflation–restriction and corestriction: multiplication by p−1 is invertible on every p-primary module, and the restriction/corestriction identities give descent of the compatible local conditions of §0.11.

Use the LLZ basis of Proposition 5.10.

The usable interface adds pollackMultiplierUnit: the proposition that a^∓ is a unit of Λ_O(G_∞) on the tame component considered, and kobayashi_corrected_iff_signed: Kobayashi's corrected ∓ main conjecture ⟺ `SMC^{i,η},` with i = 1 for − and i = 2 for +.

For the principal-ideal comparison with Pollack's functions, require pollackMultiplierUnit: a^∓ ∈ Λ_O(G_∞)^×. A Λ_E-unit alone does not prove equality of principal ideals over Λ_O; the corrected-image comparison needs no such hypothesis.

LLZ Proposition 5.10 and Corollary 5.11 give the units a^± relating Col_i and Col^±.

Pollack's plus/minus decomposition and half-logarithms are ModularSymbolsPadicLFunctions §4.2 (Pollack signed functions) and ModularSymbolsPadicLFunctions §4.2 (Pollack half-logarithms); Kato's reciprocity identifies Col^±(loc z) with them (KatoEulerSystems §§6.4 and 6.6).

Kernels of unit multiples coincide, so the local conditions and hence the Selmer groups agree; insert into §0.12. For the corrected quotients, multiplication by a^∓ is a Λ-isomorphism Im(Col_i) → Im(Col^∓) sending `Λ·L̃_{p,i}` onto Λ·Col^∓(loc z_Kato); characteristic ideals of isomorphic modules agree.

The source for this target is [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), Proposition 5.10 and Corollary 5.11, pp.35–36; [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), §1.2 after Theorem 1.3, p.6, and §5.3, pp.38–40; [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), Remark 6.3, p.43, and §1, p.3 (Kobayashi's maps send Kato's zeta element to Pollack's functions).

*Needs:* §0.11; §0.12; §3.1; SelmerIwasawaCohomology §3.2 (tower coefficients); ProfiniteCohomology Layers 5–6 (inflation–restriction and corestriction); KatoEulerSystems §§6.4 and 6.6 (reciprocity and the elliptic Néron normalization); ModularSymbolsPadicLFunctions §4.2 (Pollack signed functions and half-logarithms); PadicHodgeRegulators §§9.12 and 9.30 (Coleman coordinates and kernels); PadicHodgeRegulators (gap:signed-regulators) (the multipliers a^± and the a_p=0 images).

**Checks.**

- E = 14a1, p = 5 (a_5 = 0): the full-tower duals are X¹ = `Sel^−(E/Q(μ_{5^∞}))^∨` and X² = `Sel^+(E/Q(μ_{5^∞}))^∨;` their trivial tame components are the corresponding duals over Q_∞. For Δ of order 4, (1+δ+δ²+δ³)/4 acts as 1 on the trivial character and as 0 on the quadratic character, so the latter component cannot be the same untwisted group over Q_∞.
- At p=7 let δ act on the discrete line by 2 and take η(δ)=4. The coefficient twist by η has invariant action 2·4=1, and its contragredient dual has label 4. Twisting by η⁻¹ would give 2·2=4≠1 and no invariants. On the trivial tame line both twists give 1; that test alone does not determine the direction.
- Corrected against principal forms: if a^− = p·u with u ∈ Λ_O^×, the corrected quotients still agree, but char(X¹) = `(L̃_{p,1})` and char(Sel^−) = (L_p^−) differ by the factor (p); this is why pollackMultiplierUnit is required only for the principal forms.
- LLZ remark (p.40) that their Corollaries 5.18 and 5.22 are equivalent to Kobayashi's integral image computation is consistent with pollackMultiplierUnit on every tame component: if Kobayashi's images agree with LLZ's, then a^∓ maps a nonzero principal image lattice onto itself and is a unit. The condition is kept by name because that comparison of images is not made here.

### Examples

For the a_p=0 elliptic basis, the second Coleman image is generated over Λ(Δ×Γ) by ∑δ∈Δ δ and γ−1. Its trivial tame component is Λ, since |Δ|=p−1 is a unit; each nontrivial component is (X). This is why “image equals Λ” cannot be asserted uniformly across tame characters. If a basis row changes from (b₁,b₂) to (b₁+b₂,b₂), the coordinate column changes from (c₁,c₂) to (c₁,c₂−c₁); the vector (1,0) becomes (1,−1), and the second kernel changes.

### Dependencies

Use Layers 0–3 and AutomorphicCongruences §§3.4, 3.7–3.9, 4.3 and 4.6 for the fundamental lines, universal zeta morphism, classical specialisation and family endpoint. PadicMeasuresIwasawaAlgebras Layer 5 supplies derived determinants; the signed regulator supplier supplies integral Coleman maps, Wach bases and the local image computations. Each signed consequence also carries its own KMC component on T_LLZ (gap:tate-twisted-components for η=1) and integral normalization hypothesis.


## Layer 5: specialization, leading terms and arithmetic examples

### 5.1 Changing the imprimitive set: Euler factors on both sides

Apply the imprimitive-set comparison of §1.2 to the main-conjecture endpoints of Layers 1–4, retaining its common-large-set torsion and H⁰(G_ℚ,T*)=0 hypotheses. This is the same IMC.iff_of_sigma proved there, not an unconditional cancellation assertion.

*Needs:* §1.2 (Euler factors, localization and coefficient change); the particular endpoint being transported.

**Checks.**

- For the split Euler factor at 11 and γ₁₁=2, both factors are 21/22, so cancellation uses a nonzero element.
- For Σ=Σ′ the local direct sum is zero and its characteristic ideal is the unit ideal.
- At a reducible residual representation H⁰(G_ℚ,T*)=0 must be verified; invariants of the Tate dual do not decide this condition.

### 5.2 Invariance under extension of coefficients

For an ordinary datum D and a finite extension L'/L with ring of integers O', compare X^Σ(D ⊗ O') with X^Σ(D) ⊗_O O' and identify the analytic function over `Λ_{O'}` = Λ ⊗_O O' with the image of L_f^Σ. Apply the characteristic-ideal base-change theorem of PadicMeasuresIwasawaAlgebras §4.6 to these comparisons. Since Λ → `Λ_{O'}` is faithfully flat, IMC^Σ(D ⊗ O') ⟺ IMC^Σ(D), and similarly for KMC and SMC.

Require O′/O finite, allowing ramification.

Take characteristic ideals over the regular rings Λ and `Λ_{O′}.`

For SMC, extend the integral Coleman domain, actual image lattices and basis as well as coefficients; do not replace the transported image with the whole coefficient ring.

Selmer groups commute with the flat base change ⊗_O O' (O' free over O).

Characteristic ideals commute with flat base change between normal noetherian domains when heights are preserved (`PadicMeasuresIwasawaAlgebras` Layer 4, base change of charIdeal).

For principal ideals I, J of Λ, `IΛ_{O'}` = `JΛ_{O'}` implies I = J by faithful flatness.

The source for this target is [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §1, p.3, and remark after Conjecture 2.5.1, p.15 (relation (2.3.1)).

*Needs:* §0.5; §0.7; `PadicMeasuresIwasawaAlgebras` Layer 4.

**Checks.**

- Skinner's proof of Theorem A first replaces L by a finite extension; this theorem justifies it.
- A ramified extension multiplies μ-invariants by the ramification index e(L'/L) on both sides, so integral equalities are preserved.

### 5.3 μ- and λ-invariants of the two sides

Let O be a complete discrete valuation ring with uniformiser ϖ, Λ = O[[X]], and f, g ∈ Λ nonzero. If (f)Λ[1/ϖ] = (g)Λ[1/ϖ] and ϖ^n | f ⟺ ϖ^n | g for all n (equal μ-invariants), then f and g are associated in Λ. Consequently: (1) IMC(D) implies μ(X) = μ(L_f) and λ(X) = λ(L_f); (2) IMC_Q(D) together with μ(X) = μ(L_f) implies IMC(D); (3) the same holds for KMC and Mazur's conjecture; in particular IMC_Q(D) and μ(L_f) = 0 = μ(X) give the integral conjecture.

Assume O is a complete DVR, so Λ=O[[X]] is a UFD. The algebraic core, associated_of_eq_away_of_mu_eq, holds over any discrete valuation ring O: nonzero f, g ∈ O[[X]] with ϖ^m f = ϖ^n u g for a unit u and with equal divisibility by every power of ϖ are associated. Completeness is used only for the Weierstrass-preparation statements in (1).

Use the μ and λ invariants of `PadicMeasuresIwasawaAlgebras` Layer 4 §4.4.

Λ is a UFD with ϖ prime; the units of Λ[1/ϖ] are ϖ^Z·Λ^×; so (f) = (g) in Λ[1/ϖ] means f = ϖ^m u g with m ∈ Z, u ∈ Λ^×, and equal μ forces m = 0.

For (1): Weierstrass preparation f = ϖ^μ P u (`PadicMeasuresIwasawaAlgebras` Layer 4 §4.3–4.4) and char(X) = `(ϖ^{μ(X)}` char-poly) give equality of invariants.

Apply to f = a generator of char(X), g = L_f.

The source for this target is [Christopher Skinner and Eric Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf), §1.1, pp.1–2; [Ashay Burungale, Francesc Castella and Christopher Skinner](https://arxiv.org/abs/2405.00270v2), Theorem 1.1.2 and Remark 1.1.3, p.2.

*Needs:* `PadicMeasuresIwasawaAlgebras` Layer 4; Mathlib `PowerSeries`; Mathlib `Associated`; Mathlib `IsDiscreteValuationRing`; §0.5.

**Checks.**

- μ(X) = μ(L_f) = 0 and IMC_Q imply IMC: this is how integral statements are obtained once μ-vanishing is known.
- f = p, g = 1 have (f) = (g) in Λ[1/p] but different μ, so the μ-hypothesis is necessary.

### 5.4 The rank-zero p-converse

(1) (Skinner–Urban) Let E/Q, p≥3 a prime of good ordinary reduction with `ρ̄_{E,p}` irreducible and a prime q ≠ p, q ∥ N_E, at which `ρ̄_{E,p}` is ramified. If `Sel_{p^∞}(E/Q)` is finite then L(E,1) ≠ 0; equivalently, L(E,1) = 0 implies `corank_{Z_p}` `Sel_{p^∞}(E/Q)` ≥ 1. The same holds at p of multiplicative reduction under Skinner's Theorem C hypotheses. (2) (Fouquet–Wan) For f ∈ S_k(Γ_0(N)) satisfying the hypotheses of §2.2 with p ∤ N, the discrete Bloch–Kato Selmer group associated with a lattice in V = `M(f)_{et,p}(k/2)` and A=V/T is finite iff L(f, k/2) ≠ 0. (3) For E/Q of arbitrary conductor and any good ordinary p>3 with E[p] irreducible, rank E(Q)=0 and finiteness of Sha(E/Q)[p^∞] imply L(E,1)≠0, hence `ord_{s=1}L(E,s)`=0. This includes the sufficiently-large-ordinary-prime consequence recorded by Skinner 2020 §1; the rational BCS endpoint of §3.4 supplies the arbitrary-conductor input.

(1): the hypotheses of §1.3 in weight two (or §1.7).

Assertion (2) uses the hypotheses of the pointwise theorem.

Assertion (3) uses the rational BCS theorem (§3.4), whose hypotheses do not restrict the conductor. It needs no integral period comparison.

In (2) finiteness concerns the discrete p-primary Selmer group. For the Q_p-vector-space Bloch–Kato group the corresponding conclusion is zero, not finiteness of a nonzero vector space. For (3), the finite-error ordinary control comparison is the same one used in (1).

For the good ordinary range in (1), prove ordinaryAugmentationControl: restriction `Sel_{p^∞}(E/Q)→Sel_{p^∞}(E/Q_∞)^Γ` has finite kernel and cokernel, so `corank_{Z_p}` `Sel_{p^∞}(E/Q)=rank_{Z_p}` X_Γ. Specialize the classical restriction-control sequence of SelmerIwasawaCohomology §3.11 to A=E[p^∞], using the ordinary local comparison of §0.2 and its global and local invariant error terms. This is the ordinary control input used in Skinner–Urban Theorem 3.6.11(b), p.46, via Greenberg [Gr99] Theorem 4.1. Then (γ−1) divides char(X) iff X_Γ has positive Z_p-rank; the source Betti equality of §1.3 and its nonzero trivial interpolation factor identify this with L(E,1)=0. The scalar c_f^+ is nonzero, so it does not change vanishing at augmentation; §3.2 also supplies the integral full-symbol/Néron comparison in this elliptic range. For the multiplicative case use Skinner Theorem C with the inertia condition and split-multiplicative correction of §§0.2 and 1.7; the good-ordinary nonzero interpolation factor cannot be used in that case.

For (2), use T_cc=T(f)(k/2), V_cc and A_cc of §2.1. First treat L(f,k/2)≠0 using KatoEulerSystems §7.9 (Kato Theorem 14.2(2)). For the other implication assume L(f,k/2)=0. Apply centralCriticalComparison, including its Betti factor and the central-critical equality from AutomorphicCongruences §4.5 with gap:central-critical-specialization, before specializing z_cc,Iw at γ↦1. If this specialization vanishes, X divides char(H¹(C_cc)/Λ z_cc,Iw)=char(H²(C_cc)); the transported Bloch–Kato derived specialization/control sequence gives positive discrete corank for Sel(ℚ,A_cc). If it does not vanish, central-critical reciprocity at the zero L-value places its localization in H¹_f(ℚ_p,V_cc); the away-p conditions are transported by the same comparison, so it gives a nonzero vector in H¹_f(ℚ,V_cc) and positive discrete corank. In both cases retain the control sequence's local invariant and degree-two terms. Untwisted augmentation supplies neither these coefficients nor this local finite condition (Fouquet–Wan §3.1.1, pp.21–22, and Corollary 5.3, p.69).

For (3), the Kummer exact sequence makes the classical p-primary Selmer group finite from rank zero and finite Sha[p^∞]. Ordinary augmentation control gives rank zero for X_Γ. Thus X localized at (X) is zero by Nakayama, and §3.4 identifies its characteristic ideal there with the ideal of L_p(E,T). Since p is a unit at (X), the rational equality suffices. Evaluation at T=0 is nonzero, and the nonzero ordinary interpolation factor of §3.2 gives L(E,1)≠0. Skinner 2020 §1 records the same arbitrary-conductor consequence through Wan's theorem.

The source for this target is [Christopher Skinner and Eric Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Theorem 2 (= Theorem 3.6.11), pp.3 and 46; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), Theorem C, p.3; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Corollary 1.9, p.8, and Corollary 5.3 with its proof, p.69; [Christopher Skinner](https://arxiv.org/abs/1405.7294), §1, pp.1–2; [Ashay Burungale, Francesc Castella and Christopher Skinner](https://arxiv.org/abs/2405.00270v2), Theorem 1.1.2(a), p.2 (the rational input for (3)).

*Needs:* §1.3; §1.7; §2.1 (centralCriticalComparison); §2.2; AutomorphicCongruences §4.5 with gap:central-critical-specialization for (2); §3.4 for (3); SelmerIwasawaCohomology §3.11 (classical restriction control); KatoEulerSystems §7.9 (central-critical finiteness); KatoEulerSystems (gap:central-critical-specialization); PadicFamilies §4.0.2 (geometric reciprocity, before central-critical transport); §0.2; §0.7.

**Checks.**

- E = 11a1 at p = 7: L(E,1) ≠ 0 and `Sel_{7^∞}(E/Q)` is finite, consistent with (1).
- For the arbitrary-conductor implication, the model X=Λ/(p) has X_Γ=ℤ/p of rank zero and becomes zero after inverting p: its characteristic value p is nonzero although not a unit. Thus rational main-conjecture equality suffices for nonvanishing and does not assert an integral equality.
- In (2), the model H¹(C_cc)=Λe, z_cc,Iw=Xe and H²(C_cc)=Λ/(X) has both characteristic ideals (X), specialization 0 and a degree-two contribution O of rank one. The model z_cc,Iw=e and H²(C_cc)=0 has both ideals (1) and a nonzero specialization; at a zero central L-value its finite local condition must be supplied by reciprocity. Equal characteristic ideals alone do not put e in H¹_f.
- In the good ordinary range, finite changes to the control kernel or cokernel do not change Z_p-corank. A local error with a copy of Q_p/Z_p would change it and must fail the finite-error criterion.
- At split multiplicative reduction the analytic trivial-character value vanishes even if L(E,1)≠0; the good-ordinary control/interpolation argument cannot be reused unchanged.

### 5.5 The ℒ-invariant of a split multiplicative curve

Let E/Q_p have split multiplicative reduction, with Tate parameter q_E ∈ Q_p^×, |q_E| < 1, so that E(Q̄_p) ≅ Q̄_p^×/q_E^Z (the Tate curve). The ℒ-invariant is ℒ_p(E) := log_p(q_E)/ord_p(q_E), where log_p is Iwasawa's branch of the p-adic logarithm (log_p(p) = 0). For a weight-two newform f with p ∥ N and a_p = 1 attached to E, ℒ(V_f) := ℒ_p(E) is the Mazur–Tate–Teitelbaum ℒ-invariant.

Assume split multiplicative reduction, so a_p=1.

Iwasawa's normalisation log_p(p) = 0; a different branch changes ℒ_p(E) by a multiple of the branch constant.

The usable interface consists of the following named outputs.

- tateLInvariant: ℒ_p(E) ∈ Q_p for E/Q_p split multiplicative.
- tateLInvariant_def: ℒ_p(E)·ord_p(q_E) = log_p(q_E).
- tateLInvariant_ne_zero: For E/Q, ℒ_p(E) ≠ 0, since log_p(q_E) ≠ 0 by tateParameter_log_ne_zero (§3.7) and ord_p(q_E) > 0.
- tateLInvariant_isogeny: Q_p-isogenous split multiplicative curves have the same ℒ-invariant. Their Tate lattices are commensurable: there are positive integers a,b with q_E^a=ζq_E′^b for a root of unity ζ. Thus a·log_p(q_E)=b·log_p(q_E′) and a·ord_p(q_E)=b·ord_p(q_E′); the positive valuations permit division. This covers both an isogeny and its dual, including when one parameter is a root of a power of the other.
- tateLInvariant_ofForm: For f = f_E with p ∥ N and a_p = 1, ℒ(V_f) = ℒ_p(E).

The Tate parameter is that of PadicHodgeTheory §9.3 (`potentiallyMultiplicativeTwistReduction`), on the Tate curve of TauCetiRoadmap.EllipticCurves Layer 4 (the analytic strand over a complete rank-one valued field).

Use the p-adic logarithm on Q_p^× with log_p(p) = 0 from DirichletPadicLFunctions §0.6 (`localIwasawaLog`, `existsUnique_isIwasawaLog_of_finiteDimensional`, `localIwasawaLog_exp`).

The source for this target is [Pierre Colmez](https://www.numdam.org/item/SB_2002-2003__45__251_0.pdf), Remark 0.10, p.255; Remark 0.13(i), p.256; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §2.4, (2.4.3), p.15.

*Needs:* TauCetiRoadmap.EllipticCurves Layer 4; PadicHodgeTheory §9.3 (`potentiallyMultiplicativeTwistReduction`); DirichletPadicLFunctions §0.6 (`localIwasawaLog`, `existsUnique_isIwasawaLog_of_finiteDimensional`, `localIwasawaLog_exp`); §3.7 (tateParameter_log_ne_zero).

**Checks.**

- With log_p(p) = 0, ℒ_p(E) is independent of writing q_E = p^n u with u ∈ Z_p^×: ℒ_p(E) = log_p(u)/n.
- For E = 11a1 at p = 11, ord_11(q_E) = ord_11(Δ) = 5, so ℒ_11(E) = log_11(q_E)/5.
- For nonsplit multiplicative reduction (a_p = −1) the p-adic L-function has no trivial zero and no ℒ-invariant enters; the definition is restricted to a_p = 1.
- ord_p(q_E) = ord_p(Δ_Eᵐⁱⁿ) = −ord_p(j_E) > 0.
- For q and q^p, both logarithm and valuation scale by p. For instance 21/14=3/2, whereas scaling only the valuation gives 3/14≠3/2. The reverse isogeny uses the same equality in the other direction.
- The local Tate curve with parameter q=p has ℒ=0. The nonvanishing assertion for E/Q uses algebraicity of the global j-invariant and the transcendence input; it is not asserted for every E/Q_p.
- ℒ_p(E) ≠ 0 for E/Q follows from the transcendence of q_E (tateParameter_transcendental, §3.7); the complex theorem of Nesterenko stated by DiophantineApproximationAndTranscendence does not give it.

### 5.6 The Mazur–Tate–Teitelbaum p-adic BSD conjecture

Let E/Q have good ordinary or multiplicative reduction at an odd p, r = rank E(Q), α the unit root, `L_{p,α}(E,` s) the function of §3.2, ⟨ , `⟩_{p,α}` := ⟨·,·⟩_p the cyclotomic p-adic height pairing of §3.7 (built from the splitting of the Hodge filtration by the α-eigenline of Frobenius, through the canonical sigma function), and `R_{p,α}(E)` its regulator. MTT(E, p) is the proposition: (i) if α ≠ 1, `ord_{s=1}` `L_{p,α}(E,` s) ≥ r and `lim_{s→1}` (s − 1)⁻ʳ `L_{p,α}(E,` s) = (1 − `α⁻¹)ᵇ⁺¹·#Sha(E)·R_{p,α}(E)·∏_v` m_v; (ii) if α = 1, the order is ≥ r + 1 and `lim_{s→1}` (s − 1)⁻ʳ⁻¹ `L_{p,α}(E,` s) = `ℒ_p(E)·#Sha(E)·R_{p,α}(E)·∏_v` m_v. Here b=1 in good reduction and b=0 in multiplicative reduction. As in Colmez Conjecture 0.12, `R_{p,α}(E)` := e⁻² det(⟨P_i, `P_j⟩_{p,α})` for P_1, …, P_r spanning Q ⊗ E(Q) and generating a subgroup of index e in E(Q) (so `R_{p,α}(E)` = #E(Q)_tors⁻² when r = 0), m_v is the number of components at v (m_∞ for E(R), the Tamagawa number at finite v), and Ω_E^+ satisfies m_∞Ω_E^+ = `|∫_{E(R)}` ω_E|. The exact proposition MTT includes finiteness of the full Sha(E/Q), so #Sha has its usual finite meaning. Define separately MTT_p: assume only Sha(E/Q)[p∞] finite and use its order in the displayed leading-term formula up to multiplication by a Z_p-unit (there exists u∈Z_p× multiplying the right side to give the left side, including when both sides are zero), retaining the same order lower bound. If the regulator is nonzero this formula gives the exact order. These exact and unit propositions are not identified.

Assume good ordinary or multiplicative reduction at an odd p.

The height pairing is that of §3.7. Its nondegeneracy is not known in general and is not part of the proposition.

The torsion enters through the index e in the regulator, as in Colmez's normalisation of R_∞(E); the formula must not divide by #E(Q)_tors² a second time.

MTT uses full Sha finiteness; MTT_p uses only finiteness of its p-primary part. This finiteness is supplied as an input, not inferred merely by writing #Sha.

The usable interface consists of the following named outputs.

- MTT: MTT(E,p): finiteness of full Sha and the displayed exact leading-term/order statement. MTT_p(E,p): finiteness of Sha[p∞] and the corresponding leading coefficient up to a Z_p-unit, with #Sha[p∞].
- MTT.order_lower_bound: `ord_{s=1}` `L_{p,α}(E,` s) ≥ r (+1 if α = 1) is Kato's theorem (Colmez Theorem 0.15), stated separately.
- MTT_p.rank_zero_iff_BSD_p: For r=0, α≠1 and Sha[p∞] finite, MTT_p(E,p) ↔ the p-part of classical BSD. With full Sha finite, exact MTT ↔ exact classical BSD.

State with `L_{p,α}(E,` s) (§3.2), ℒ_p(E) (§5.5) and the p-adic height.

Use the pairing and normalisation of §3.7; in the variable T=κ(γ)^(s−1)−1 the good ordinary and nonsplit multiplicative formulas use Reg_γ/#E(ℚ)_tors². The split formula uses (ℒ_p(E)/log_p κ(γ))·Reg_γ/#E(ℚ)_tors², because its order is r+1. Section 3.8 supplies the change of variable at that order as well. This is the normalisation of Stein–Wuthrich Conjecture 5.1 and of Colmez Conjecture 0.12 with his note 14.

The source for this target is [Pierre Colmez](https://www.numdam.org/item/SB_2002-2003__45__251_0.pdf), §0.3 (from p.254): Conjecture 0.12 and note 14, p.256; [Pierre Colmez](https://www.numdam.org/item/SB_2002-2003__45__251_0.pdf), Theorem 0.15, p.257; [Joaquín Rodrigues Jacinto and Chris Williams](https://arxiv.org/abs/2309.15692v2), Remark 2.3, p.7; [William Stein and Christian Wuthrich](https://wstein.org/papers/mcom2649-iwasawa-alg.pdf), Conjecture 5.1 and (5.1)–(5.2), p.1774.

*Needs:* §3.2; §3.7; §3.8; §5.5.

**Checks.**

- For E = 11a1, p = 7, r = 0, taking #Sha = 1 as an explicit arithmetic input to this numerical test: `R_{p,α}` = 5⁻², m_∞ = 1, m_11 = 5, so MTT predicts `L_{7,α}(E,1)` = (1 − α⁻¹)²·5/25 = (1 − α⁻¹)²/5, matching Colmez Remark 0.10's value (1 − α⁻¹)² L(E,1)/Ω_E^+ with L(E,1)/Ω_E^+ = 1/5.
- At split rank zero put l=log_p κ(γ) and A=#Sha·∏_v m_v/#E(ℚ)_tors². The s-leading term is ℒ_p(E)A(s−1), so the T-leading coefficient is ℒ_p(E)A/l, although Reg_γ=Reg_p=1. Omitting l⁻¹ changes its valuation by v_p(l)=1 for odd p.
- For split multiplicative E with r=0 and the finiteness input, the regulator is #E(Q)_tors⁻²≠0 and ℒ_p(E)≠0, so either MTT or MTT_p predicts order exactly one, never zero.
- Using the canonical (Néron–Tate) real regulator in place of `R_{p,α}(E)` gives a statement with the wrong field of values: the leading coefficient lies in Q_p, the real regulator in R.
- Kato's theorem (Colmez Theorem 0.15): `ord_{s=1}` `L_{p,α}(E,s)` ≥ r (≥ r + 1 if α = 1), and equality implies Sha[p^∞] finite and `R_{p,α}(E)` ≠ 0 — a consequence, not an assumption.
- In rank zero with α≠1 and full Sha finite, exact MTT is equivalent to the full numerical BSD formula. With only Sha[p∞] finite, MTT_p is equivalent to its p-part. Even at an anomalous ordinary prime, the nonzero factor 1−α⁻¹ cancels in the comparison; it need not be a p-adic unit.

### 5.7 Trivial zeros in analytic rank zero

Let E/Q have good ordinary or multiplicative reduction at an odd prime p with L(E,1) ≠ 0. Then `ord_{s=1}` `L_{p,α}(E,` s) ∈ {0, 1}, with order one iff E has split multiplicative reduction at p (α = 1), and in that case `L'_{p,α}(E,` 1) = ℒ_p(E)·L(E,1)/Ω_E^+ (Greenberg–Stevens) with ℒ_p(E) ≠ 0. Consequently, if Sha(E/Q) is finite, exact MTT(E,p) and the full classical BSD formula are equivalent; with only Sha[p∞] finite, MTT_p and the p-part are equivalent in this case.

L(E,1) ≠ 0.

The derivative formula is the target greenbergStevens_derivative: for E/Q with split multiplicative reduction at p, `L'_{p,α}(E,` 1) = ℒ_p(E)·L(E,1)/Ω_E^+. Its input is gap:general-exceptional-zero-families from PadicFamilies: a rational ordinary deformation through f_E, its Néron-normalized two-variable analytic function and the comparison −2a_p′(2)=ℒ_p(E), for every odd p and every residual representation. Differentiating the two-variable interpolation identity then gives the displayed formula (Greenberg–Stevens Theorem 7.1 for p≥5; Colmez Theorem 0.11, p.255, for the derivative statement). Section 1.6's irreducible approximation with an auxiliary prime is insufficient for this range. The p=3 deformation/period extension requires the stated supplier contract; it is not asserted to follow from a theorem with p≥5.

Nonvanishing of ℒ_p(E) is tateLInvariant_ne_zero (§5.5), from the transcendence of the Tate parameter (§3.7).

If α ≠ 1 the value at s = 1 is (1 − α⁻¹)ᵇ⁺¹ L(E,1)/Ω_E^+ ≠ 0 (§3.2).

If α = 1 the value vanishes; greenbergStevens_derivative gives the derivative, nonzero since ℒ_p(E) ≠ 0 (§5.5) and L(E,1) ≠ 0.

Compare with §5.6 in rank zero, where `R_{p,α}` = #E(Q)_tors⁻².

MTT.exceptional_rank_zero is proved here after greenbergStevens_derivative: for r=0 and α=1, the nonzero ℒ_p(E) cancels, giving exact MTT iff exact BSD with full Sha finite, and MTT_p iff the p-part with Sha[p∞] finite.

The source for this target is [Pierre Colmez](https://www.numdam.org/item/SB_2002-2003__45__251_0.pdf), Remark 0.10 and Theorem 0.11, p.255; Remark 0.13(i), p.256; [Joaquín Rodrigues Jacinto and Chris Williams](https://arxiv.org/abs/2309.15692v2), Remark 2.3, p.7; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), (2.4.3), p.15.

*Needs:* for greenbergStevens_derivative, §3.2; §5.5; PadicFamilies (gap:general-exceptional-zero-families). For exact order additionally §3.7 (Tate-parameter logarithm). For MTT.exceptional_rank_zero additionally §5.6 (definition only).

**Checks.**

- For E = 11a1 at p = 11 (split, L(E,1) ≠ 0): the p-adic L-function has a simple zero at s = 1 with derivative ℒ_11(E)/5.
- greenbergStevens_derivative is stated for split multiplicative E only: at nonsplit multiplicative or good ordinary p the trivial-character value (1 − α⁻¹)ᵇ⁺¹L(E,1)/Ω_E^+ is already nonzero when L(E,1) ≠ 0, and a derivative formula with ℒ_p(E) has no meaning there (§5.5 defines ℒ_p only for a_p = 1).

### 5.8 The main conjecture implies p-adic BSD under nondegenerate heights

Let E/Q have good ordinary reduction at an odd prime p with irreducible E[p], and assume MMC(E,p). (1) If Sha(E/Q)[p^∞] is finite and the height of §3.7 is nondegenerate, then `ord_{s=1}` L_p(E,s) = rank E(Q) = r and the leading coefficient satisfies MTT_p(E,p): L_p⁽ʳ⁾(E,1)/r! ∼_p (1−α⁻¹)^2 · Reg_p(E/Q) · #Sha(E/Q)[p^∞] · `∏_{ℓ|N}c_ℓ(E)` / #E(Q)_tors^2. (2) Conversely, if `ord_{s=1}` L_p(E,s) = r, then Sha(E/Q)[p^∞] is finite and the height is nondegenerate. Here ∼_p denotes equality up to Z_p×. This is the p-primary, up-to-unit consequence; it is not an exact MTT identity. Reg_p is the unnormalised determinant on a basis of the free Mordell–Weil group (§3.7); thus `R_{p,α}` of §5.6 equals Reg_p/#E(Q)_tors². The torsion denominator is included exactly once.

Assume p is good ordinary and ρ̄ is irreducible.

For (1) assume Sha[p^∞] finite and HeightNondegenerate (§3.7).

Assume MMC(E,p), for instance from §3.5.

By MMC, the characteristic series f_E(T) of X_ord(E/Q_∞) and L_p(E,T), with T = κ(γ)ˢ⁻¹ − 1, generate the same ideal of Λ, so they have the same order at T = 0 and leading coefficients differing by Z_p^×.

Apply §3.9: f_E has order at least r, with equality exactly when the height is nondegenerate and Sha[p^∞] is finite; in that case its leading coefficient is ∼_p (1−α⁻¹)²·∏c_ℓ·#Sha[p^∞]/#E(Q)[p^∞]²·Reg_γ. This gives (2), and the T-form of (1).

Convert from T to s by §3.8: the leading coefficient is multiplied by (log_p κ(γ))^r, which turns Reg_γ into Reg_p. The factor log_p κ(γ)^r is not a unit and is absorbed exactly by this change of regulator. Prime-to-p torsion and Tamagawa factors are p-adic units, so #E(Q)[p^∞]² may be replaced by #E(Q)_tors².

The source for this target is [William Stein and Christian Wuthrich](https://wstein.org/papers/mcom2649-iwasawa-alg.pdf), Theorem 6.1, p.1776, and §4.4, p.1774; [Peter Schneider](https://ivv5hpp.uni-muenster.de/u/pschnei/publ/pap/heightII.PDF), §2 Theorem 2′, p.342, and §7 Theorems 6–7, p.371; [Joaquín Rodrigues Jacinto and Chris Williams](https://arxiv.org/abs/2309.15692v2), Remark 2.3, p.7; [Pierre Colmez](https://www.numdam.org/item/SB_2002-2003__45__251_0.pdf), note 14, p.256.

*Needs:* §3.3; §3.7; §3.8; §3.9; §5.6.

**Checks.**

- In rank zero the regulator is 1 and the coordinate logarithm has exponent zero, yielding the p-part of the rank-zero BSD expression. This does not infer the full exact BSD formula from an integral ideal equality.
- Without nondegeneracy, the order of vanishing of char(X) at the trivial character exceeds the rank (§3.9), so (1) fails without that hypothesis and (2) detects it.
- If F(T)=a_r T^r+O(Tʳ⁺¹) and c=log_p κ(γ), substitution T=κ(γ)ˢ⁻¹−1 gives s-leading coefficient a_r c^r; the inverse coordinate κ(γ)¹⁻ˢ−1 gives (−1)^r a_r c^r. The sign is a unit, whereas c^r is not for r ≥ 1 (c has valuation one when κ(γ)=1+p). The change from Reg_γ to Reg_p absorbs exactly this power, and at r=0 there is nothing to absorb.
- Rank one: with a generator P, the s-leading coefficient is ∼_p (1−α⁻¹)²·⟨P,P⟩_p·#Sha[p^∞]·∏c_ℓ/#E(Q)_tors²; using Reg_γ = ⟨P,P⟩_p/log_p κ(γ) in the s-variable would be wrong by the nonunit log_p κ(γ).

### 5.9 The modular instances of the Greenberg and Coates–Perrin-Riou propositions

Let D be a good ordinary datum (p ∤ N, the domain of §0.5) with trivial character and V := V_f ⊗ det ρ_f⁻¹. (1) V is p-ordinary with Greenberg filtration F^+V = V^+ ⊗ det ρ_f⁻¹, r_V = `r_{V^∨}` = 0 is the criticality of the relevant twists (V^∨=Hom(V,Q_p(1)) is the Tate dual), and the trivial tame-component projection of Greenberg’s integral proposition (SelmerIwasawaCohomology §4.21 (Greenberg proposition)) for (V,L_p(V)) is IMC(D), after descending its Selmer group over `F∞^+=Q(μ_{p∞})^+` to Q∞, passing from its contragredient dual to the scalar dual of Conventions, and identifying the projected analytic datum with ι_Γ(L_f). Its rationalization is IMC_Q(D) (IMC.toRational); the converse needs the μ-comparison of §5.3. (2) L_f has the interpolation property that the Coates–Perrin-Riou and Panchishkin conjecture predicts for V: at the critical twists its values are those of the Skinner–Urban formula of §0.4, with Deligne periods Ω_f^± and the modified Euler factors at p. Only this modular instance is stated; the conjecture for an arbitrary motive is not a target here. (3) The proposition 'Greenberg's conjecture for every ordinary V' is not proved here; nor is Greenberg's μ = λ = 0 conjecture for totally real fields.

Use a good ordinary datum; the multiplicative datum of §0.1 is outside the proposition IMC of §0.5, and no Greenberg dictionary is asserted for it. The Coates–Perrin-Riou interpolation shape is that of Rodrigues Jacinto–Williams Theorem B.1 (B.2.1, pp.79–80) and B.3(1), p.81.

Use the trivial character of Gal(F∞^+/Q∞), whose order (p−1)/2 is a p-adic unit; the full Greenberg proposition over F∞^+ includes other tame components. The unit idempotent does not invert p: the projected proposition is integral, and on the trivial component the contragredient characteristic ideal is ι_Γ of the scalar one. V^∨ means the Tate dual, not the untwisted linear dual.

For (1), unwind the Greenberg Selmer group of V over the cyclotomic Z_p-extension (SelmerIwasawaCohomology §§2.8–2.8a (Greenberg condition and ordinary filtration)) as the Skinner–Urban Selmer group. Apply finite-group inflation–restriction and the tame idempotent to descend from F∞^+ to Q∞ (order prime to p); transport the contragredient dual to the scalar dual by ι_Γ (Conventions; PadicMeasuresIwasawaAlgebras §4.6) and match the same component of the analytic datum with ι_Γ(L_f). The whole conjecture over F∞^+ is not identified with just its trivial component.

For (2), compare the interpolation factor of Coates–Perrin-Riou with Skinner–Urban's e(φ) and Gauss sums (Rodrigues Jacinto–Williams Appendix B.2–B.3).

The source for this target is [Joaquín Rodrigues Jacinto and Chris Williams](https://arxiv.org/abs/2309.15692v2), §13.5.3, Conjecture 13.21, p.71; [Joaquín Rodrigues Jacinto and Chris Williams](https://arxiv.org/abs/2309.15692v2), Appendix B.2.1, Theorem B.1, pp.79–80 (the interpolation formula), B.2.3, Theorem B.4, p.80, and B.3(1), p.81 (the Coates–Perrin-Riou and Panchishkin conjecture).

*Needs:* SelmerIwasawaCohomology §4.21 (Greenberg proposition); SelmerIwasawaCohomology §2.10 (contragredient duals); §0.5; §0.4; SelmerIwasawaCohomology §3.2 (Iwasawa Shapiro and inverse tautological action).

**Checks.**

- Rodrigues Jacinto–Williams Theorem B.4 (the main conjecture for f 'under mild technical hypotheses') is made explicit by the theorems of Layers 1–4 with their hypotheses.
- Example 13.22 of Rodrigues Jacinto–Williams (V = Q_p(n)) is the GL(1) instance, not a modular one.
- The module Λ/(p) with analytic element 1 satisfies the rational equality and fails the integral one (§0.5); the Greenberg instance in (1) is integral, so it fails on this datum exactly as IMC does.

### 5.10 Verified weight-two examples

(a) E = 11a1 = [0,−1,1,−10,−20] (N = 11, Δ = −11⁵, split at 11, torsion Z/5, only 5-isogenies, Manin constant 1) at p = 7: a_7 = −2, ordinary; ρ̄ irreducible; (SU_11) holds since 7 ∤ 5; (FW1.6_11) fails (split); (LocExc_7) holds (ā_7² = 4 ≠ 1); hence §1.3 and §3.5 give MMC(11a1,7) integrally. §2.2 also gives KMC^1(T_pE^∨) (Theorem 5.1 form, μ trivial allowed as `ρ̄|G_{Q_7}` is reducible); an independent transport to MMC needs the matched equality KMC^1(T_pE) of gap:tate-twisted-components and the elliptic period defect u_7(f_E) of §3.2, a unit here, while the Fouquet–Wan ordinary theorem does not apply. (b) E = 14a1 = [1,0,1,4,−6] (N = 14, Δ = −2⁶·7³, nonsplit at 2, split at 7, isogeny degrees 1, 2, 3, 6) at p = 13: a_13 = −4, ordinary; ρ̄ irreducible (no 13-isogeny); (FW1.6_2) holds since 13 ∤ 6; so §1.4 applies. (c) E = 14a1 at p = 5: a_5 = 0, supersingular, crystalline nonordinary; `ρ̄_{E,5}` surjective (5 is not a nonmaximal prime); ℓ = 2 nonsplit with 5 ∤ 6; hence §2.2 gives KMC^1(T_pE^∨). With KMC^1(T_pE) from gap:tate-twisted-components, §4.3 with §4.5 gives the LLZ actual-image signed equalities on the trivial component and, equivalently, Kobayashi's corrected ± main conjectures over Q_∞; without it §2.3(3) gives the index-one equality on the ω-component. The principal-ideal Pollack form additionally uses pollackMultiplierUnit (§4.5).

The reduction types, discriminants, a_p values and isogeny data are those of the minimal models (checked by point counts and against LMFDB's curve data).

Compute a_p by point counting on the minimal model, a_ℓ = ±1 at the multiplicative primes, and ord_ℓ(Δ_min); ρ̄ ramified at ℓ iff p ∤ ord_ℓ(Δ_min) (§1.1).

Irreducibility of `ρ̄_{E,p}:` a reducible `ρ̄_{E,p}` gives a rational p-isogeny, excluded by the isogeny degrees; for p odd, irreducible odd representations are absolutely irreducible.

Check each theorem's hypothesis list in turn, recording which theorem applies and which does not.

Point counts independently give a_7(11a1)=−2 and a_5(14a1)=0, a_13(14a1)=−4. They also give a₂(11a1)=−2 and a₃(14a1)=−2: the Frobenius discriminants are respectively −4≡3 mod 7, and −8≡2 mod 5 or 5 mod 13. Each is nonsquare, giving an independent irreducibility certificate in these three cases. The Weierstrass discriminants are −161051 and −21952. Database analytic Sha values are not used as a proof of actual Sha orders.

The source for this target is [Christopher Skinner and Eric Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Theorem 1, p.2; remark after Theorem 2, p.3; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Theorems 1.6, 5.1, pp.6–7, 68; [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), assumptions (A), (E), pp.14, 43; [The LMFDB Collaboration](https://www.lmfdb.org/EllipticCurve/Q/11/a/2), Curve 11.a2, equations, modular invariants, local data and isogenies; accessed 2026-10-19; [The LMFDB Collaboration](https://www.lmfdb.org/EllipticCurve/Q/14a1/), Curve 14.a6, local data, Galois representations and isogenies; accessed 2026-10-19.

*Needs:* §1.3; §1.4; §2.2; §2.3; §3.5; §4.3; §4.5; §1.1; AutomorphicCongruences §4.5 with gap:tate-twisted-components for the transports from §2.2.

**Checks.**

- 11a1 at p = 7: the trivial-character value of L_p is (1 − α⁻¹)²/5 ≠ 0, matching finiteness of `Sel_{7^∞}(E/Q).`
- 14a1 at p = 5: (A) holds as a_5 = 0; (E) holds as the 5-adic image is GL₂(Z_5).

### 5.11 A higher-weight example

Let f = η(z)⁴η(5z)⁴ = q − 4q² + 2q³ + 8q⁴ − 5q⁵ − 8q⁶ + 6q⁷ + ⋯, the newform spanning S_4(Γ_0(5)) (a_2 = −4, a_3 = 2, a_5 = −5, a_7 = 6, a_11 = 32, a_13 = −38). At p = 7: a_7 = 6 is a 7-adic unit, so f is ordinary; (dist) holds since the residual characters are unramified and ω⁻³ ≠ 1; ρ̄ is irreducible over F_7 because the Frobenius polynomial at 2 is X²−a_2X+2³, with discriminant a_2²−4·2³=−16≡5 mod 7, a nonsquare. Oddness at p≠2 makes this rank-two irreducibility absolute; π(f)_5 is the Steinberg representation twisted by the unramified character with μ(5) = −1 (from a_5 = −5 = μ(5)·5); and the inertia-invariant line has Frobenius eigenvalue μ(5)·5⁻¹ ≡ 4 ≢ 1 mod 7, so dim `ρ̄^{D_5}` = 0 once ρ̄ is ramified at 5. The residual representation ρ̄ is ramified at 5, so (FW1.6_5) holds and §1.4 gives KMC^1(T_K) for f at p = 7, and §1.5, with the reverse divisibility on T_K(1) of gap:tate-twisted-components, gives char(X) = (u_7(f)L_f); Skinner–Urban's theorem does not apply (k = 4 ≢ 2 mod 6). At p = 13, the tested prime coefficients satisfy a_ℓ≡1+ℓ³ mod 13 and 13 divides 5⁴−1. These are diagnostics of an Eisenstein congruence, not a proof of reducibility: a complete congruence/Sturm argument and residual recognition would be needed to turn this into a non-example.

The q-expansion is computed from the eta product; multiplicativity a_4 = a_2² − 8, a_6 = a_2a_3, a_25 = a_5² is checked.

Ramification of ρ̄ at 5 is the target etaProduct_residualRamifiedAtFive: ρ̄_7(I_5) ≠ 1 for this f. Suppose ρ̄ were unramified at 5. It is irreducible and arises from f on Γ₀(5) = Γ₀(1·5) with trivial character; ℓ = 7 ≥ 5, q = 5 ∤ 1·7 and 5 ≢ 1 mod 7. Mazur's principle (`SerreWeightAndLevelOptimisation` §2.9) shows that ρ̄ occurs at level 1 in some weight. By Ribet's four sets of levels (`SerreWeightAndLevelOptimisation` §3.9, ℓ = 7 ≥ 5) it then occurs in `S_{k(ρ̄)}(SL₂(Z)).` Since f is ordinary of weight 4 ≤ 7 + 1 at 7 ∤ 5 with a_7 ≠ 0, its residual local form at 7 (`SerreWeightAndLevelOptimisation` §3.1) has inertia characters ω³ and 1 in the homological normalisation; as the exponent 3 lies strictly between 1 and p − 1 = 6, the peu/très ramifiée distinction of the exponent-one case does not arise, and Serre's recipe gives k(ρ̄) = 4. But S₄(SL₂(Z)) = 0 (Mathlib `CuspForm.rank_eq_zero_of_weight_lt_twelve`). This contradiction proves that ρ̄ is ramified at 5.

Compute coefficients and check the Hecke relations.

Check ordinarity, the nonsquare Frobenius discriminant at 2 for p=7, oddness and the local residual conditions; then prove the ramification at 5 as above.

Check (FW1.6_5) in Fouquet–Wan's normalisation.

The source for this target is [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Theorems 1.4 and 1.6, pp.5–7; [Christopher Skinner and Eric Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Theorem 3.6.4, p.43; [Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/motives.pdf), *Report on mod ℓ representations of Gal(Q̄/Q)*, (4.7) and Theorem 8.1 (Mazur's principle), Theorem 3.3 (the four sets of levels), author pp.8, 12 and 27–30.

*Needs:* §1.4; §1.5; §1.1; §1.3; AutomorphicCongruences §2.21 with gap:tate-twisted-components; `SerreWeightAndLevelOptimisation` §2.9; `SerreWeightAndLevelOptimisation` §3.1; `SerreWeightAndLevelOptimisation` §3.9; `AlgebraicModularFormsAndSerreWeights` R15.4 (Serre's weight recipe); Mathlib `CuspForm.rank_eq_zero_of_weight_lt_twelve`.

**Checks.**

- The p=13 calculation is a diagnostic only. Finite trace agreement must not be used to conclude reducibility. These coefficient checks remain here in prose, rather than as isolated arithmetic examples in the acceptance file.
- The nonsquare Frobenius discriminant at 2 proves irreducibility only; it says nothing about the inertia group at 5, which is why ramification needs the level-lowering argument above.
- Kato's divisibility (k > 2) holds here without potential good reduction (Fouquet–Wan Theorem 1.4(2)).
- The level-lowering step needs q ≢ 1 mod ℓ, here 5 ≢ 1 mod 7. Only coefficient primes dividing 5 − 1 = 4, that is ℓ = 2, violate it, and ℓ = 2 is outside the odd range anyway. The principle also needs ℓ ≥ 5 in general weight, so the same argument would not cover ℓ = 3.
- The weight must be k(ρ̄) and not an arbitrary weight: `S_{12}(SL₂(Z))` ≠ 0 (it contains Δ), so the contradiction uses Serre's weight 4, not merely level 1.

### Examples

For 11a1, Δ_min=−11⁵ and a₇=−2, so 7∤5 and ā₇²=4≠1. For 14a1, Δ_min=−2⁶7³, a₁₃=−4 and a₅=0. Thus p=13 is ordinary and p=5 is supersingular with a_p=0; both see ramification at 2. The full theorem checks and the higher-weight application, including the proof that ρ̄ is ramified at 5, appear in §§5.10–5.11. In rank zero the MTT regulator is #E(Q)_tors⁻², whereas Schneider’s unnormalized empty determinant is 1; putting both torsion conventions into the same formula would count the torsion factor twice.

### Dependencies

Use Layers 0–4, including the height and Schneider's theorem of §§3.7–3.9; PadicMeasuresIwasawaAlgebras Layer 4 for characteristic ideals and Weierstrass invariants; SelmerIwasawaCohomology for localization and control; DirichletPadicLFunctions §0.6 for the Iwasawa logarithm; EllipticCurves Layer 4 for point uniformization; PadicFamilies Layers 0, 1 and 4 for the Hida family and two-variable p-adic L-function behind Greenberg–Stevens (§5.7); §3.7's transcendence of the Tate parameter for nonvanishing of the ℒ-invariant; and SerreWeightAndLevelOptimisation §§2.9, 3.1 and 3.9 with Mathlib's vanishing of level-one cusp forms of weight four for the ramification in §5.11. Finiteness of Sha[p^∞] and nondegeneracy of the height are hypotheses where used.


## Layer 6: formulations for the downstream arithmetic branches

The anticyclotomic, Eisenstein-prime, supersingular and multiplicative branches are proved in roadmaps that build on this one: HeegnerPointEulerSystems Layer 8b and the rank-zero and rank-one Birch–Swinnerton-Dyer branch import Layers 0, 1 and 4 (the latter also Layer 5). This layer fixes, with this roadmap's objects, the formulation in which each branch states its endpoint, and proves the transfers between those formulations and the ones of Layers 0, 3 and 4. No branch theorem is a prerequisite of any target here, and none is restated as a theorem of this roadmap.

### 6.1 The anticyclotomic interface

Let E/Q, p > 3 good ordinary, K imaginary quadratic with (disc), (Heeg), (spl), Λ_K^− = Z_p[[Γ_K^−]] and `Λ_K^{−,ur}` = Λ_K^− ⊗̂ Ẑ_pᵘʳ. The anticyclotomic branch uses, from this roadmap, exactly the following objects and conventions: the Tate lattice T = T_pE of §3.1 and its ordinary line T^+ (§0.1); the scalar-dual convention and the inverse group-ring argument ℓ⁻¹γ_ℓ⁻¹ in Euler factors (Conventions, §5.1), now applied with Γ_K^− in place of Γ; and the distinction between rational statements (over `Λ_K^{−,ur}[1/p])` and integral ones (over `Λ_K^{−,ur}).` Its Heegner-point and Greenberg–BDP main conjectures, their comparison (the BDP square convention, the coefficient extension to `Λ_K^{−,ur},` finite local cokernels and the involution ι) and their proofs are those of HeegnerPointEulerSystems Layer 8b (§§8b.2 and 8b.5–8b.9). This section is the interface specification: it states which of this roadmap's objects and conventions the anticyclotomic formulations are built from, so that the downstream statements and the cyclotomic ones of Layers 0 and 3 use the same lattice, ordinary line, duality and Euler-factor normalisation. Neither the anticyclotomic equality nor its descent from `Λ_K^{−,ur}` to Λ_K^− is asserted here.

(disc): D_K odd, ≠ −3; (Heeg): every ℓ | N splits in K; (spl): p splits in K.

The anticyclotomic equality is over `Λ_K^{−,ur};` ideal descent and integral descent to Λ_K^− each need the downstream branch's own comparison.

The usable interface consists of the following named outputs.

- anticyclotomicFormulationInputs: the lattice, ordinary line, dual and Euler-factor conventions just listed, exported unchanged.

The interface consists of definitions already made in §§0.1–0.2 and 3.1; nothing further is proved here.

The source for this target is [Ashay Burungale, Francesc Castella and Christopher Skinner](https://arxiv.org/abs/2405.00270v2), §1.2, Conjecture 1.2.1, Theorems 1.2.2 and 1.2.4, pp.2–3 (the two anticyclotomic formulations and their hypotheses); [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §2.3, pp.8–9 (the Euler-factor convention).

*Needs:* §0.1; §0.2; §3.1.

**Checks.**

- Burungale–Castella–Skinner Theorems 1.2.2/1.2.4 are the two formulations of the same theorem; the Heegner form requires `H¹_{F_Λ}` and X of Λ_K^−-rank one, which are part of the downstream theorem and not of this interface.
- An equality over `Λ_K^{−,ur}[1/p]` remains rational even if its two sides descend as modules.
- In the anticyclotomic Z_p-extension a prime inert in K splits completely, unlike in the cyclotomic one, so the cyclotomic Euler-factor change of §5.1 is not transported to Γ_K^− by substituting group elements; the downstream branch states its own local factors.

### 6.2 The Eisenstein-prime interface

For E/Q and a good ordinary Eisenstein prime p > 2 (p ∤ N, E[p] reducible), the cyclotomic main conjecture is the proposition MMC(E,p) of §3.3 for the Tate lattice T_pE and the Néron-normalised function L_p(E/Q) ∈ Λ ⊗ Q_p of §3.2, with the imprimitive variants of §5.1. The Eisenstein-prime part of the Birch–Swinnerton-Dyer branch (after Castella–Grossi–Skinner and Keller–Yin) proves this proposition under its own residual-character, local-invariant and finite-submodule hypotheses. This roadmap proves the transfers that formulation needs when E[p] is reducible: (1) X_ord(E/Q_∞) and L_p(E/Q) are defined for T_pE itself, with no appeal to residual irreducibility (§0.2, §3.2); (2) the imprimitive comparison IMC^Σ ⟺ `IMC^{Σ′}` of §5.1 holds when X^Σ is torsion and T* has no nonzero G_Q-invariants, which for E[p] reducible must be checked rather than deduced from irreducibility; (3) an isogeny E → E′ of degree prime to p identifies MMC(E,p) with MMC(E′,p) (§3.3), whereas along a p-isogeny the p-parts of the period ratio and of the Selmer comparison change the integral statement and belong to the downstream theorem's normalisation.

Assume p>2, p∤N and E[p] reducible. CGS additionally requires its isogeny-kernel character at G_p to differ from 1 and ω; KY has no such exclusion and includes rational p-torsion. These are hypotheses of the downstream theorem, not of the transfers.

The usable interface consists of the following named outputs.

- eisensteinFormulation: MMC(E,p) for T_pE and the Néron-normalised L_p(E/Q), without residual irreducibility.
- eisenstein_imprimitive_change: §5.1's equivalence under the stated torsion and H⁰(T*) = 0 hypotheses.
- eisenstein_isogeny_transfer: MMC(E,p) ↔ MMC(E′,p) along an isogeny of degree prime to p.

The irreducible-prime integrality lemma of §3.2 is not available here; integrality of L_p(E/Q) at an Eisenstein prime is part of the downstream theorem's normalisation.

The source for this target is [Francesc Castella, Giada Grossi and Christopher Skinner](https://arxiv.org/abs/2303.04373v2), Theorem A, p.2, and Theorem C, p.3 (the formulation and hypotheses of the cyclotomic endpoint); [Timo Keller and Mulun Yin](https://arxiv.org/abs/2402.12781v2), Theorem 3.0.10, p.41.

*Needs:* §0.2; §3.1; §3.2; §3.3; §5.1.

**Checks.**

- 11a1 at p=5 is a good ordinary Eisenstein prime (a_5 = 1) with rational 5-torsion, so E[5] has a G_Q-stable line and (irred) fails; the irreducibility-based integrality lemma of §3.2 and the homothety argument for lattices are unavailable, and the formulation must name T_pE.
- Section 5.1 is conditional at Eisenstein primes. For 11a1 at p=5 the rational 5-torsion gives invariants in E[5∞], the Tate dual, while the required untwisted dual is E[5∞](−1). On that same torsion line an element with ω(g)=2 acts after twisting by 3 in F₅, so that line supplies no nonzero invariant of T*. Rational 5-torsion alone does not decide H⁰(G_ℚ,T*). For this curve the additional split-Cartan residual image 5Cs.1.1 (LMFDB11, Galois representations) makes E[5]≅F₅⊕F₅(ω); hence T*[5]≅F₅(ω⁻¹)⊕F₅ has a one-dimensional invariant subspace. Thus the localization hypothesis does fail for 11a1 at 5, after this additional image calculation.
- For T=ℤ₅(1), the untwisted dual is ℚ₅/ℤ₅(−1), with zero global invariants: an element with cyclotomic value 2 makes g−1 a unit. Its Tate dual is the trivial ℚ₅/ℤ₅, with all elements invariant. This separates the two conditions.
- For the 5-isogenous curves in class 11a at p=5 the Néron period ratios are not 5-adic units, so a 5-isogeny changes the integral statement by an explicit power of 5; only isogenies of degree prime to 5 are covered by (3).
- Kato's divisibility is only rational at Eisenstein primes in KatoEulerSystems §7.2; integral inputs come from the downstream theorem.

### 6.3 The supersingular and multiplicative anticyclotomic interfaces

(1) Supersingular branch. For E/Q semistable with good supersingular reduction at p>2 (and a_3(E)=0 if p=3; a_p=0 is automatic for p≥5), the signed main conjecture is stated in the Kobayashi formulation of §4.5: char_Λ X^± = (L_p^±) with Néron-normalised Pollack functions and contragredient X^±=D_Λ(Sel^±)^ι. In scalar notation this is char_Λ D_Λ(Sel^±)=(ι_Γ(L_p^±)); the equality is transported before invoking a downstream statement written in the scalar convention. This roadmap proves the transfer to its own formulation: §4.5 identifies the duals over Q_∞ with `X^{1,1},` `X^{2,1},` the trivial tame components of the full-tower LLZ signed duals for the LLZ basis, and identifies the corresponding corrected Coleman-image quotients, so Kobayashi's corrected formulation is equivalent to `SMC^{1,1}` ∧ `SMC^{2,1}` of §0.12 integrally. On the trivial tame component both LLZ images are Λ (LLZ Corollaries 5.18 and 5.22), so `SMC^{i,1}` is the principal statement `char(X^{i,1})` = `(L̃^1_{p,i});` the principal Kobayashi–Pollack form `char(Sel^∓(E/Q_∞)^∨)` = `(L_p^{∓,1})` is equivalent to it under pollackMultiplierUnit (§4.5), and rationally in any case. The supersingular part of the Birch–Swinnerton-Dyer branch (after Burungale–Skinner–Tian–Wan) proves the Kobayashi formulation, including for quadratic twists E^K with discriminant coprime to Np and supported on primes of ordinary reduction for E.

(2) Multiplicative branch. For E/Q with multiplicative reduction at p>3, the anticyclotomic formulation of the multiplicative part of the Birch–Swinnerton-Dyer branch (after Castella's corrected theorem) uses the ordinary line of the Steinberg representation at p (§0.1, multiplicative branch), Skinner's inertia-kernel condition and its strict variant with the split correction A^−/(φ−1)A^− (§0.2). This roadmap supplies those local conditions and their comparison; the anticyclotomic theorem with its strict/unrestricted conditions, Heegner hypothesis, condition at 2, nonsplit auxiliary prime and E(Q_p)[p]=0 is the downstream branch's. §6.1 assumes good ordinary reduction and is not used at a multiplicative prime.

Retain every hypothesis of the downstream theorem when it is applied; none is added or removed by the transfers above.

The usable interface consists of the following named outputs.

- kobayashiFormulation_iff_signed: Kobayashi's corrected formulation for η = 1 is equivalent to `SMC^{1,1}` ∧ `SMC^{2,1};` the principal Kobayashi–Pollack form is equivalent to them under pollackMultiplierUnit, and rationally unconditionally.
- multiplicativeLocalConditions: the inertia-kernel and strict local conditions at a multiplicative p with the correction A^−/(φ−1)A^−.

For (1) use the full-tower a_p=0 kernel dictionary, its trivial-component descent in §4.5, and §0.12. For (2) use §0.2's comparison of local conditions at α = ±1.

The formulations are those of [Ashay Burungale, Christopher Skinner, Ye Tian and Xin Wan](https://arxiv.org/abs/2409.01350v2), Theorem 1.3, p.3, with the a_p=0 convention (1.7), p.6; and [Francesc Castella](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf), corrected Theorem 1.1, p.1. The signed-kernel comparison is [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), Proposition 5.10 and Corollary 5.11, pp.35–36.

*Needs:* §0.1; §0.2; §0.12; §4.5.

**Checks.**

- 14a1 at p=5 is semistable and supersingular with a_5=0, so the Kobayashi formulation applies and transfers to the LLZ signed conjectures for η=1.
- At p=3 a supersingular curve with a_3=±3 is outside the a_p=0 dictionary of §4.5, so the transfer in (1) is not available there.
- A twist discriminant coprime to Np but containing a supersingular reduction prime of E is outside the downstream twist statement; coprimality alone does not suffice.
- At split multiplicative p the strict and inertia-kernel conditions differ by A^−/(φ−1)A^− ≅ L/O, so a transfer that identified them would be off by this module (§0.2).

### Examples

For 11a1 at p=5, rational 5-torsion rules out the irreducible-prime theorems of Layers 1–3, and the Eisenstein formulation of §6.2 is the one the downstream branch proves. For 14a1 at p=5, the a_p=0 signed kernel comparison is available and transfers the Kobayashi formulation to the LLZ signed conjectures. A good-ordinary anticyclotomic comparison cannot be substituted at a multiplicative prime.

### Dependencies

Use Layers 0, 3, 4 and 5 for the formulations and transfers. The downstream branches, HeegnerPointEulerSystems Layer 8b and the rank-zero and rank-one Birch–Swinnerton-Dyer branch, are not prerequisites.

## Downstream consumers

AutomorphicCongruences §§1.11, 2.21, 3.7–3.9, 4.3 and 4.5 supply the independently formulated reverse bounds and Fouquet–Wan endpoints; it consumes no theorem or definition here. The ordinary outputs of §§1.3 and 1.7 retain c_f^+ in full-symbol notation; any consumer requiring the uncorrected integral ideal must carry OrdinaryBettiSymbolUnit(f), or use the elliptic comparison of §3.2 in its range. HeegnerPointEulerSystems consumes the ordinary, zeta and determinant formulations of §§0.5–0.10 and the theorems of §§1.3 and 1.7 (its §6.9), uses the cyclotomic comparisons in its §8b.2, and its Layer 8b proves the anticyclotomic main conjectures in the formulation of §6.1. The rank-zero and rank-one Birch–Swinnerton-Dyer branch consumes the ordinary and multiplicative main conjectures (§§1.3, 1.7; at p ∥ N the latter gives its rank-zero p-part), the Kobayashi–Pollack formulation and signed kernel dictionary (§4.5), the rank-zero leading-term consequences (§§5.4, 5.6–5.8) and the trivial-zero comparison of §5.7. It proves the supersingular and multiplicative branches in the formulations of §6.3 and the Eisenstein-prime branch in the formulation of §6.2, with the elliptic-unit, Hida–Tilouine and anticyclotomic μ inputs taken from the CM main-conjecture and Katz p-adic L-function theories. The rank-one p-converse is proved downstream; §5.4 is the rank-zero converse only. The general Greenberg and Coates–Perrin-Riou interfaces consume only the modular instances specified in §5.9. These downstream uses do not assert a general main conjecture outside the listed hypotheses.

## References

- Olivier Fouquet and Xin Wan, [The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), arXiv:2107.13726v3 (8 April 2022), 103 pp.
- Christopher Skinner and Eric Urban, [The Iwasawa main conjectures for GL2](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Invent. Math. 195 (2014), 1–277; authors' copy (226 pp.) on E. Urban's Columbia page; page numbers are those of this copy.
- Christopher Skinner, [Multiplicative reduction and the cyclotomic main conjecture for GL2](https://arxiv.org/abs/1407.1093v1), Pacific J. Math. 283 (2016), 171–200; arXiv:1407.1093v1 (4 July 2014), 26 pp.; page numbers are those of the arXiv PDF.
- Christopher Skinner, [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://arxiv.org/abs/1405.7294), Ann. of Math. 191 (2020), 329–354; arXiv:1405.7294v1 (28 May 2014).
- Ashay Burungale, Francesc Castella and Christopher Skinner, [Base change and Iwasawa main conjectures for GL2](https://arxiv.org/abs/2405.00270v2), arXiv:2405.00270v2 (March 2025), 12 pp.
- Antonio Lei, David Loeffler and Sarah Livia Zerbes, [Wach modules and Iwasawa theory for modular forms](https://arxiv.org/abs/0912.1263v3), Asian J. Math. 14 (2010), 475–528; arXiv:0912.1263v3 (18 October 2010), 45 pp.; theorem numbers are those of arXiv v3.
- Joaquín Rodrigues Jacinto and Chris Williams, [An introduction to p-adic L-functions](https://arxiv.org/abs/2309.15692v2), arXiv:2309.15692v2 (19 December 2024), 85 pp.; page numbers are those of arXiv v2.
- Kazuya Kato, [p-adic Hodge theory and values of zeta functions of modular forms](https://www.numdam.org/item/AST_2004__295__117_0.pdf), Astérisque 295 (2004), 117–290; Numdam AST_2004__295__117_0; printed page numbers.
- Karl Rubin, [Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Annals of Mathematics Studies 147, Princeton 2000; author's draft hosted on the SWC notes page (187 pp.); printed page numbers.
- Pierre Colmez, [La conjecture de Birch et Swinnerton-Dyer p-adique](https://www.numdam.org/item/SB_2002-2003__45__251_0.pdf), Séminaire Bourbaki exposé 919 (2002–2003), Astérisque 294 (2004), 251–319; Numdam SB_2002-2003__45__251_0.
- Francesc Castella, Giada Grossi and Christopher Skinner, [Mazur’s main conjecture at Eisenstein primes](https://arxiv.org/abs/2303.04373v2), arXiv:2303.04373v2, Theorems A/C.
- Timo Keller and Mulun Yin, [On the anticyclotomic Iwasawa theory of newforms at Eisenstein primes of semistable reduction](https://arxiv.org/abs/2402.12781v2), arXiv:2402.12781v2, Theorem 3.0.10.
- Haruzo Hida, [The Iwasawa μ-invariant of p-adic Hecke L-functions](https://annals.math.princeton.edu/wp-content/uploads/annals-v172-n1-p02-p.pdf), Ann. of Math. 172 (2010), 41–137, Theorem I, p.45; Corollary 3.19 and its two proofs, pp.97–98; [2022 addendum](https://www.math.ucla.edu/~hida/Addendam.pdf), Lemma 0.2, p.1, the proposed replacement for Lemma 3.17, which fails as printed (see the downstream branch contracts).
- Ashay Burungale, Christopher Skinner, Ye Tian and Xin Wan, [Zeta elements for elliptic curves and applications](https://arxiv.org/abs/2409.01350v2), arXiv:2409.01350v2, Theorem 1.3.
- Francesc Castella, [Erratum to “On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes”](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf), corrected Theorem 1.1, p.1.
- Peter Schneider, [p-adic height pairings. II](https://ivv5hpp.uni-muenster.de/u/pschnei/publ/pap/heightII.PDF), Invent. Math. 79 (1985), 329–374; author-hosted journal scan; printed page numbers.
- Aaron Landesman, Ashvin A. Swaminathan, James Tao and Yujie Xu, [Lifting subgroups of symplectic groups over Z/ℓZ](https://arxiv.org/abs/1607.04698v2), arXiv:1607.04698v2.
- William Stein and Christian Wuthrich, [Algorithms for the arithmetic of elliptic curves using Iwasawa theory](https://wstein.org/papers/mcom2649-iwasawa-alg.pdf), Math. Comp. 82 (2013), 1757–1792; author-hosted offprint; printed page numbers.
- Barry Mazur, William Stein and John Tate, [Computation of p-adic heights and log convergence](https://content.ems.press/assets/public/full-texts/books/254/chapters/online-pdf/978-3-98547-541-4-chapter-5044.pdf), Documenta Math. Extra Volume Coates (2006), 577–614; printed page numbers.
- Matthew Emerton, Robert Pollack and Tom Weston, [Variation of Iwasawa invariants in Hida families](https://arxiv.org/pdf/math/0404484v1), Invent. Math. 163 (2006), 523–580; arXiv:math/0404484v1; theorem numbers and pages of arXiv v1.
- Kenneth A. Ribet, [Report on mod ℓ representations of Gal(Q̄/Q)](https://math.berkeley.edu/~ribet/Articles/motives.pdf), in *Motives*, Proc. Sympos. Pure Math. 55, Part 2 (1994), 639–676; author's copy, author page numbers.
- Michel Waldschmidt, [Sur la nature arithmétique des valeurs de fonctions modulaires](https://www.numdam.org/item/SB_1996-1997__39__105_0), Séminaire Bourbaki exposé 824 (1996–1997), Astérisque 245 (1997), 105–140; Numdam SB_1996-1997__39__105_0; Théorème 2, p.108, and its p-adic consequences, p.110.
- Katia Barré-Sirieix, Guy Diaz, François Gramain and Georges Philibert, [Une preuve de la conjecture de Mahler–Manin](https://doi.org/10.1007/s002220050044), Invent. Math. 124 (1996), 1–9; cited through Waldschmidt's exposé, which states the theorem in the complex and p-adic cases.
- The LMFDB Collaboration, [Elliptic curve 11.a2 (Cremona 11a1)](https://www.lmfdb.org/EllipticCurve/Q/11/a/2), Curve record accessed 2026-10-19; database evidence, not a formal certificate.
- The LMFDB Collaboration, [Elliptic curve 14.a6 (Cremona 14a1)](https://www.lmfdb.org/EllipticCurve/Q/14a1/), Curve record accessed 2026-10-19; database evidence, not a formal certificate.
- Kentaro Nakamura, [Zeta morphisms for rank two universal deformations](https://arxiv.org/abs/2006.13647v2), arXiv:2006.13647v2 (2020), Theorem 1.1, Remark 1.2, Corollary 4.2 and Theorem 4.3.
- Vytautas Paškūnas, [On 2-dimensional 2-adic Galois representations of local and global fields](https://arxiv.org/abs/1509.00332v2), arXiv:1509.00332v2 (2016), Propositions 2.13 and 2.33, as used after Fouquet–Wan Theorem 3.6.
- Ralph Greenberg and Glenn Stevens, [p-adic L-functions and p-adic periods of modular forms](https://math.stanford.edu/~conrad/DarmonCM/2011Refs/GSpadic.pdf), Invent. Math. 111 (1993), 407–447, Theorems 5.13 and 7.1; Theorem 7.1 assumes p≥5.
- Annette Werner, [Local heights on Abelian varieties and rigid analytic uniformization](https://ems.press/content/serial-article-files/25827), Documenta Math. 3 (1998), 301–319, Theorem 7.2 and Corollary 7.3, pp.317–318.
- Jean-Pierre Serre, *Abelian l-adic representations and elliptic curves* (1968), IV.3.4, Lemma 3.
- John W. Jones, [Iwasawa L-functions for multiplicative abelian varieties](https://doi.org/10.1215/S0012-7094-89-05918-8), Duke Math. J. 59 (1989), 399–420; multiplicative leading-term result cited through Stein–Wuthrich Theorem 6.1, p.1776.
- Ralph Greenberg, [Iwasawa theory for elliptic curves](https://arxiv.org/abs/math/9809206v1), Lecture Notes in Math. 1716 (1999), Theorem 4.1; locators refer to arXiv v1.
- Joseph H. Silverman, *Advanced topics in the arithmetic of elliptic curves*, GTM 151 (1994), Theorem V.5.3.
- Shinichi Kobayashi, [Iwasawa theory for elliptic curves at supersingular primes](https://doi.org/10.1007/s00222-002-0265-4), Invent. Math. 152 (2003), 1–36, §5; signed comparisons are cited through LLZ §§5–6.
